Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 334B02711A4
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 20 Sep 2020 03:01:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbgITBBR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 19 Sep 2020 21:01:17 -0400
Received: from lists.levonline.com ([217.70.33.37]:47864 "EHLO
        lists.levonline.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726788AbgITBBR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 19 Sep 2020 21:01:17 -0400
Received: from exc-halon1.levonline.com (exc-halon1.levonline.com [217.70.32.123])
        by lists.levonline.com (Postfix) with ESMTP id 183663A0D6E
        for <linux-renesas-soc@vger.kernel.org>; Sun, 20 Sep 2020 02:51:13 +0200 (CEST)
X-SA-score: -1
X-Halon-ID: dced8a67-fadb-11ea-9775-0050568168d4
Received: from ormen2.djurnet.levonline.com (ormen2.djurnet.levonline.com [192.168.17.32])
        by exc-halon1.levonline.com (Halon) with ESMTPS
        id dced8a67-fadb-11ea-9775-0050568168d4;
        Sun, 20 Sep 2020 02:54:40 +0200 (CEST)
Received: from [127.0.0.1] (15.178.138.210.rev.vmobile.jp [210.138.178.15])
        (authenticated bits=0)
        by ormen2.djurnet.levonline.com (8.13.8/8.13.8) with ESMTP id 08K0sab1029404;
        Sun, 20 Sep 2020 02:54:38 +0200
X-Origin-Levonline: b0359001
From:   Magnus Damm <damm@opensource.se>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <damm@opensource.se>
Date:   Sun, 20 Sep 2020 09:33:48 +0900
Message-Id: <160056202800.9912.14989698496810743383.sendpatchset@octo>
In-Reply-To: <160056199852.9912.5581183514421117508.sendpatchset@octo>
References: <160056199852.9912.5581183514421117508.sendpatchset@octo>
Subject: [PATCH 2/2] UIO CMT test program
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

--- /dev/null	2010-09-19 00:27:13.659405289 +0900
+++ uio-cmt-test-20200919.c	2020-09-19 08:55:12.571385363 +0900
@@ -0,0 +1,190 @@
+/*
+ * uio-cmt-test-20200919.c - UIO CMT example test code, 20200919 Magnus Damm
+ *
+ * A small linux program that programs the CMT timer and waits for IRQ
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
+#define CMT_CMCLKE 0x1000 /* start/stop register, some bits reserved as 1 */
+#define CMT_CMCLKE_CH0 0x20 /* set bit to one to start channel */
+#define CMT_CMCSR 0x510 /* 0x124 enables interrupts and selects CLK/8 */
+#define CMT_CMCNT 0x514 /* counting up, set to 0 */
+#define CMT_CMCOR 0x518 /* match value, set to ~0 */
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
+	printf("CLKE\n");
+	/* Stop timer channel */
+	{
+		unsigned long *p = (uio_mmio.iomem + CMT_CMCLKE);
+
+		*p = *p & ~CMT_CMCLKE_CH0;
+	}
+
+	printf("CMCSR\n");
+	/* CMCSR */
+	{
+		unsigned long *p = (uio_mmio.iomem + CMT_CMCSR);
+
+		*p = 0x124;
+	}
+
+	printf("CMCOR\n");
+	/* CMCOR */
+	{
+		unsigned long *p = (uio_mmio.iomem + CMT_CMCOR);
+
+		*p = (32768 / 8) * 2; /* interrupt after about 2s */
+	}
+
+	printf("waiting 10s");
+	sleep(10);
+	
+	printf("UIO write\n");
+	/* Enable interrupt in UIO driver */
+	{
+		unsigned long enable = 1;
+
+		write(uio_dev.fd, &enable, sizeof(u_long));
+	}
+
+	printf("CLKE\n");
+	/* Start timer channel */
+	{
+		unsigned long *p = (uio_mmio.iomem + CMT_CMCLKE);
+
+		*p = *p | CMT_CMCLKE_CH0;
+	}
+
+	printf("UIO read\n");
+	/* Wait for interrupt */
+	{
+		unsigned long n_pending;
+
+		read(uio_dev.fd, &n_pending, sizeof(u_long));
+
+		printf("got CMT IRQ\n");
+	}
+
+	printf("CLKE\n");
+	/* Stop timer channel */
+	{
+		unsigned long *p = (uio_mmio.iomem + CMT_CMCLKE);
+
+		*p = *p & ~CMT_CMCLKE_CH0;
+	}
+	
+	return 0;
+}
