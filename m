Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBBA73432F3
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 21 Mar 2021 15:15:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229870AbhCUOOb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 21 Mar 2021 10:14:31 -0400
Received: from mail-ua1-f48.google.com ([209.85.222.48]:40879 "EHLO
        mail-ua1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230170AbhCUOOC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 21 Mar 2021 10:14:02 -0400
Received: by mail-ua1-f48.google.com with SMTP id 97so4704444uav.7
        for <linux-renesas-soc@vger.kernel.org>; Sun, 21 Mar 2021 07:14:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ay4HOINfYrQzCRFsak1DkttsBbncmZSXA1bhNspucSY=;
        b=qiWA+WKI5vExHbQYAEexX2a/r3jMdSJNXl4VtBtpi1DWKtCLwBCN+xwETMBKRxAp7Z
         5m1lQhz7Bwj8hDvcI/e9ltyC10PE+uetF32erLl9S2AsdtJIEclTMarISo3RXxvX7iuC
         argpqaCyve+j9qHlOllqFWTtEcNBsPNHtuz+TAN274Ld3GrnWsNyWYVJwePdG9rWnFKy
         FFeUF640wzhriQnF/ZLlfNN5QhczJc3WyLWRVUhiIKdJT7t9EZJmilEmxMS604mDnHNP
         h/AxXRq4WjY+MkLJ7VbZR7jKjY7cPX7baDsIPgd7ZDKNxCKrFNlRtbMbn0tCzm6idaLI
         zxmA==
X-Gm-Message-State: AOAM533G2ywCyEnidbFzLQoEBMYmJbapvf6CGUctRuqHNJSoCYgs+qrk
        /hKalnCa88DicV5dSIL6hqu+molCIUZmfW/0s9EVVpVV
X-Google-Smtp-Source: ABdhPJwNW8MscoaPg1YEviuBbaIeZaEWIcSeLVcEU7T6aB7Oh9nrJhhFUvhNX2hHDyhIwG/tYBhvxFdUXSwpRx4OsD4=
X-Received: by 2002:ab0:64cf:: with SMTP id j15mr2914583uaq.4.1616336041772;
 Sun, 21 Mar 2021 07:14:01 -0700 (PDT)
MIME-Version: 1.0
References: <161632671592.9191.18170615656272399147.sendpatchset@octo> <161632673124.9191.8069161888906800635.sendpatchset@octo>
In-Reply-To: <161632673124.9191.8069161888906800635.sendpatchset@octo>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sun, 21 Mar 2021 15:13:50 +0100
Message-ID: <CAMuHMdV52cNa8+3NNQ6SyUC6-Nsx-sH3ksww__XAGPSGRJSSRg@mail.gmail.com>
Subject: Re: [PATCH 2/2] UIO CMT test program
To:     Magnus Damm <damm@opensource.se>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Magnus,

Thanks for your patch!

On Sun, Mar 21, 2021 at 1:12 PM Magnus Damm <damm@opensource.se> wrote:
> --- /dev/null   2019-10-16 00:27:13.659405289 +0900
> +++ uio-cmt-test-20210321.c     2021-03-21 19:41:24.469083859 +0900
> @@ -0,0 +1,179 @@
> +/*
> + * uio-cmt-test-20210321.c - UIO CMT example test code, 20210321 Magnus Damm
> + *
> + * A small linux program that programs the CMT timer and waits for IRQs
> + *
> + * Compile for Linux using:
> + * $ cross-gcc -o uio-cmt-test uio-cmt-test.c
> + *
> + * Designed to work with the Linux UIO kernel driver uio_pdrv_genirq.c
> + */
> +
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <unistd.h>
> +#include <string.h>
> +#include <sys/types.h>
> +#include <sys/stat.h>
> +#include <sys/mman.h>
> +#include <fcntl.h>
> +
> +static int fgets_with_openclose(char *fname, char *buf, size_t maxlen) {
> +       FILE *fp;
> +
> +       if ((fp = fopen(fname, "r")) != NULL) {
> +               fgets(buf, maxlen, fp);
> +               fclose(fp);
> +               return strlen(buf);

If buf[] contains no terminating NUL character, this will read beyond the
end of the buffer.

> +       } else {
> +               return -1;
> +       }
> +}
> +
> +struct uio_device {
> +       char *name;
> +       char *path;
> +       int fd;
> +};
> +
> +#define MAXUIOIDS  100
> +#define MAXNAMELEN 256
> +
> +static int locate_uio_device(char *name, struct uio_device *udp)
> +{
> +       char fname[MAXNAMELEN], buf[MAXNAMELEN];
> +       int uio_id, i;
> +
> +       for (uio_id = 0; uio_id < MAXUIOIDS; uio_id++) {
> +               sprintf(fname, "/sys/class/uio/uio%d/name", uio_id);

asprintf()?

> +               if (fgets_with_openclose(fname, buf, MAXNAMELEN) < 0)
> +                       continue;
> +               if (strncmp(name, buf, strlen(name)) == 0)
> +                       break;
> +       }
> +
> +       if (uio_id >= MAXUIOIDS)
> +               return -1;
> +
> +       udp->name = strdup(buf);
> +       udp->path = strdup(fname);
> +       udp->path[strlen(udp->path) - 4] = '\0';
> +
> +       sprintf(buf, "/dev/uio%d", uio_id);

asprintf()

> +       udp->fd = open(buf, O_RDWR|O_SYNC /*| O_NONBLOCK*/);
> +
> +       if (udp->fd < 0) {
> +               perror("open");
> +               return -1;
> +       }
> +
> +       return 0;
> +}
> +
> +/* offsets apply to sh73a0 */
> +#define CMT_CMSTR 0x000 /* start/stop register, some bits reserved as 1 */
> +#define CMT_CMSTR_CH0 (1 << 0) /* set bit to one to start channel */
> +#define CMT_CMCSR 0x10 /* 0x124 enables interrupts and selects CLK/8 */
> +#define CMT_CMCSR_CMF (1 << 15) /* clear bit to ack compare match event */
> +#define CMT_CMCNT 0x14 /* counting up, set to 0 */
> +#define CMT_CMCOR 0x18 /* match value, set to ~0 */
> +
> +struct uio_map {
> +       unsigned long address;
> +       unsigned long size;
> +       void *iomem;
> +};
> +
> +static int setup_uio_map(struct uio_device *udp, int nr, struct uio_map *ump)
> +{
> +       char fname[MAXNAMELEN], buf[MAXNAMELEN];
> +
> +       sprintf(fname, "%s/maps/map%d/addr", udp->path, nr);

asprintf()

> +       if (fgets_with_openclose(fname, buf, MAXNAMELEN) <= 0)
> +               return -1;
> +
> +       ump->address = strtoul(buf, NULL, 0);
> +
> +       sprintf(fname, "%s/maps/map%d/size", udp->path, nr);

asprintf()

> +       if (fgets_with_openclose(fname, buf, MAXNAMELEN) <= 0)
> +               return -1;
> +
> +       ump->size = strtoul(buf, NULL, 0);
> +
> +       ump->iomem = mmap(0, ump->size,
> +                         PROT_READ|PROT_WRITE, MAP_SHARED,
> +                         udp->fd, nr * getpagesize());
> +
> +       if (ump->iomem == MAP_FAILED)
> +               return -1;
> +
> +       return 0;
> +}
> +
> +struct uio_device uio_dev;
> +struct uio_map uio_mmio;
> +
> +int main(int argc, char *argv[])
> +{
> +       int k;

unsigned int

> +       int ret;
> +
> +       ret = locate_uio_device("timer", &uio_dev);
> +       if (ret < 0)
> +               return ret;
> +
> +       printf("found matching UIO device at %s\n", uio_dev.path);
> +
> +       ret = setup_uio_map(&uio_dev, 0, &uio_mmio);
> +       if (ret < 0)
> +               return ret;
> +
> +       {
> +               unsigned long *cmstr = (uio_mmio.iomem + CMT_CMSTR);
> +               unsigned short *cmcsr = (uio_mmio.iomem + CMT_CMCSR);
> +               unsigned long *cmcor = (uio_mmio.iomem + CMT_CMCOR);

This is not portable across 32-bit/64-bit platforms.

uint32_t *...

> +
> +               /* Stop timer channel */
> +               *cmstr &= ~CMT_CMSTR_CH0;
> +
> +               /* Initialize CMCSR */
> +               *cmcsr = 0x124;
> +
> +               /* Initialize CMCOR */
> +               *cmcor = (32768 / 8) * 2; /* interrupt after about 2s */
> +
> +               /* Enable interrupt in UIO driver */
> +               {
> +                       unsigned long enable = 1;

uint32_t

> +                       write(uio_dev.fd, &enable, sizeof(u_long));
> +               }
> +
> +               /* Start timer channel */
> +               *cmstr |= CMT_CMSTR_CH0;
> +
> +               /* test by processing 3 interrupts */
> +               for (k = 0; k < 3; k++) {
> +                       /* Wait for interrupt */
> +                       {
> +                               unsigned long n_pending;

uint32_t

> +                               read(uio_dev.fd, &n_pending, sizeof(u_long));
> +                       }
> +
> +                       printf("IRQ nr %d\n", k);
> +
> +                       /* ack match in CMCSR */
> +                       *cmcsr &= ~CMT_CMCSR_CMF;
> +
> +                       /* Enable interrupt in UIO driver */
> +                       {
> +                               unsigned long enable = 1;
> +                               write(uio_dev.fd, &enable, sizeof(u_long));
> +                       }
> +               }
> +
> +               /* Stop timer channel */
> +               *cmstr &= ~CMT_CMSTR_CH0;
> +       }
> +
> +       return 0;
> +}

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
