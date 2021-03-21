Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A364E34325A
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 21 Mar 2021 13:13:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229784AbhCUMMn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 21 Mar 2021 08:12:43 -0400
Received: from lists.levonline.com ([217.70.33.37]:46250 "EHLO
        lists.levonline.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229897AbhCUMMU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 21 Mar 2021 08:12:20 -0400
Received: from exc-halon1.levonline.com (exc-halon1.levonline.com [217.70.32.123])
        by lists.levonline.com (Postfix) with ESMTP id 32E5A3A12E2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 21 Mar 2021 13:12:19 +0100 (CET)
X-SA-score: -1
X-Halon-ID: ae9e0758-8a3e-11eb-a51d-0050568168d4
Received: from ormen1.djurnet.levonline.com (ormen1.djurnet.levonline.com [192.168.17.31])
        by exc-halon1.levonline.com (Halon) with ESMTPS
        id ae9e0758-8a3e-11eb-a51d-0050568168d4;
        Sun, 21 Mar 2021 13:12:18 +0100 (CET)
Received: from [127.0.0.1] (l193216.ppp.asahi-net.or.jp [218.219.193.216])
        (authenticated bits=0)
        by ormen1.djurnet.levonline.com (8.13.8/8.13.8) with ESMTP id 12LCCGxT028162;
        Sun, 21 Mar 2021 13:12:17 +0100
X-Origin-Levonline: b0359001
From:   Magnus Damm <damm@opensource.se>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <damm@opensource.se>, geert+renesas@glider.be
Date:   Sun, 21 Mar 2021 20:38:51 +0900
Message-Id: <161632673124.9191.8069161888906800635.sendpatchset@octo>
In-Reply-To: <161632671592.9191.18170615656272399147.sendpatchset@octo>
References: <161632671592.9191.18170615656272399147.sendpatchset@octo>
Subject: [PATCH 2/2] UIO CMT test program
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

--- /dev/null	2019-10-16 00:27:13.659405289 +0900
+++ uio-cmt-test-20210321.c	2021-03-21 19:41:24.469083859 +0900
@@ -0,0 +1,179 @@
+/*
+ * uio-cmt-test-20210321.c - UIO CMT example test code, 20210321 Magnus Damm
+ *
+ * A small linux program that programs the CMT timer and waits for IRQs
+ *
+ * Compile for Linux using:
+ * $ cross-gcc -o uio-cmt-test uio-cmt-test.c
+ * 
+ * Designed to work with the Linux UIO kernel driver uio_pdrv_genirq.c
+ */
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <unistd.h>
+#include <string.h>
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <sys/mman.h>
+#include <fcntl.h>
+
+static int fgets_with_openclose(char *fname, char *buf, size_t maxlen) {
+       FILE *fp;
+
+       if ((fp = fopen(fname, "r")) != NULL) {
+               fgets(buf, maxlen, fp);
+               fclose(fp);
+               return strlen(buf);
+       } else {
+               return -1;
+       }
+}
+
+struct uio_device {
+       char *name;
+       char *path;
+       int fd;
+};
+
+#define MAXUIOIDS  100
+#define MAXNAMELEN 256
+
+static int locate_uio_device(char *name, struct uio_device *udp)
+{
+       char fname[MAXNAMELEN], buf[MAXNAMELEN];
+       int uio_id, i;
+
+       for (uio_id = 0; uio_id < MAXUIOIDS; uio_id++) {
+               sprintf(fname, "/sys/class/uio/uio%d/name", uio_id);
+               if (fgets_with_openclose(fname, buf, MAXNAMELEN) < 0)
+                       continue;
+               if (strncmp(name, buf, strlen(name)) == 0)
+                       break;
+       }
+
+       if (uio_id >= MAXUIOIDS)
+               return -1;
+
+       udp->name = strdup(buf);
+       udp->path = strdup(fname);
+       udp->path[strlen(udp->path) - 4] = '\0';
+
+       sprintf(buf, "/dev/uio%d", uio_id);
+       udp->fd = open(buf, O_RDWR|O_SYNC /*| O_NONBLOCK*/);
+
+       if (udp->fd < 0) {
+               perror("open");
+               return -1;
+       }
+
+       return 0;
+}
+
+/* offsets apply to sh73a0 */
+#define CMT_CMSTR 0x000 /* start/stop register, some bits reserved as 1 */
+#define CMT_CMSTR_CH0 (1 << 0) /* set bit to one to start channel */
+#define CMT_CMCSR 0x10 /* 0x124 enables interrupts and selects CLK/8 */
+#define CMT_CMCSR_CMF (1 << 15) /* clear bit to ack compare match event */
+#define CMT_CMCNT 0x14 /* counting up, set to 0 */
+#define CMT_CMCOR 0x18 /* match value, set to ~0 */
+
+struct uio_map {
+       unsigned long address;
+       unsigned long size;
+       void *iomem;
+};
+
+static int setup_uio_map(struct uio_device *udp, int nr, struct uio_map *ump)
+{
+       char fname[MAXNAMELEN], buf[MAXNAMELEN];
+ 
+       sprintf(fname, "%s/maps/map%d/addr", udp->path, nr);
+       if (fgets_with_openclose(fname, buf, MAXNAMELEN) <= 0)
+               return -1;
+
+       ump->address = strtoul(buf, NULL, 0);
+
+       sprintf(fname, "%s/maps/map%d/size", udp->path, nr);
+       if (fgets_with_openclose(fname, buf, MAXNAMELEN) <= 0)
+               return -1;
+
+       ump->size = strtoul(buf, NULL, 0);
+
+       ump->iomem = mmap(0, ump->size,
+                         PROT_READ|PROT_WRITE, MAP_SHARED,
+                         udp->fd, nr * getpagesize());
+
+       if (ump->iomem == MAP_FAILED)
+               return -1;
+
+       return 0;
+}
+
+struct uio_device uio_dev;
+struct uio_map uio_mmio;
+
+int main(int argc, char *argv[])
+{
+	int k;
+	int ret;
+
+	ret = locate_uio_device("timer", &uio_dev);
+	if (ret < 0)
+		return ret;
+       
+	printf("found matching UIO device at %s\n", uio_dev.path);
+
+	ret = setup_uio_map(&uio_dev, 0, &uio_mmio);
+	if (ret < 0)
+		return ret;
+
+	{
+		unsigned long *cmstr = (uio_mmio.iomem + CMT_CMSTR);
+		unsigned short *cmcsr = (uio_mmio.iomem + CMT_CMCSR);
+		unsigned long *cmcor = (uio_mmio.iomem + CMT_CMCOR);
+	  
+		/* Stop timer channel */
+		*cmstr &= ~CMT_CMSTR_CH0;
+
+		/* Initialize CMCSR */
+		*cmcsr = 0x124;
+
+		/* Initialize CMCOR */
+		*cmcor = (32768 / 8) * 2; /* interrupt after about 2s */
+
+		/* Enable interrupt in UIO driver */
+		{
+			unsigned long enable = 1;
+			write(uio_dev.fd, &enable, sizeof(u_long));
+		}
+
+		/* Start timer channel */
+		*cmstr |= CMT_CMSTR_CH0;
+
+		/* test by processing 3 interrupts */
+		for (k = 0; k < 3; k++) {
+			/* Wait for interrupt */
+			{
+				unsigned long n_pending;
+				read(uio_dev.fd, &n_pending, sizeof(u_long));
+			}
+
+			printf("IRQ nr %d\n", k);
+			
+			/* ack match in CMCSR */
+			*cmcsr &= ~CMT_CMCSR_CMF;
+
+			/* Enable interrupt in UIO driver */
+			{
+				unsigned long enable = 1;
+				write(uio_dev.fd, &enable, sizeof(u_long));
+			}
+		}
+
+		/* Stop timer channel */
+		*cmstr &= ~CMT_CMSTR_CH0;
+	}
+
+	return 0;
+}
