Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C1154191C4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Sep 2021 11:46:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233705AbhI0Jri (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 Sep 2021 05:47:38 -0400
Received: from mail-vk1-f173.google.com ([209.85.221.173]:44583 "EHLO
        mail-vk1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233680AbhI0Jri (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Sep 2021 05:47:38 -0400
Received: by mail-vk1-f173.google.com with SMTP id s137so6657571vke.11;
        Mon, 27 Sep 2021 02:46:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ggt5WZQCPgFBd4A7QeezV5a0uq4KzyYp7aKxw16aWKA=;
        b=QNuWezibvr64M33i+wqCuVamMwNc11o5cEPDS5qcQot/DwDIs775ZBf3KOpxXUg6yM
         lGcxEn69ic8zQEl9pNSrJQ4k2FK/PWlUER/JUwTFjUI8zVpoelGKmy96VC34vZRO5RX5
         0coCoyUEJAD4cczfqnEWqR2bgzIB7vUqTZg/Tv1yk9Boav6WB+oHnntHVJO8NuTr2wAo
         uZ4e6TcJogcpMcg4JhtYJMb5Wn3BEl4xXPgZLrWkST2Ujdquga0DINWt3CKAZxeLaCgj
         K96Bxbt8Uuu98R3UvMQYVLu35cGYcjMsW2dI7ixAKGd8V4psxAKWASM2AdN9R9LEJTgJ
         IH3g==
X-Gm-Message-State: AOAM533F21s+ObXgfREQrVzz58T+5c7mtH/ZpdV5wGaTW/WiT8PUxVGi
        19aerRndT+E2F5zNrURoYx3DDzQbiP7MdFF7LteQjXgI
X-Google-Smtp-Source: ABdhPJxrA0XIbI9uexPAm2eqM/I/lDTKdymjoDlT6fWVy2jwOol+hPMzC5uuUYddEvGJhB2+FIeHGRflh0mDvQ4wskM=
X-Received: by 2002:a1f:3a4b:: with SMTP id h72mr14369713vka.19.1632735959965;
 Mon, 27 Sep 2021 02:45:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210922091007.5516-1-wsa+renesas@sang-engineering.com> <CA+V-a8su7780XxmdL5qsM+YFoK_4+OJauQkyC9AaJMxFtxM=Cw@mail.gmail.com>
In-Reply-To: <CA+V-a8su7780XxmdL5qsM+YFoK_4+OJauQkyC9AaJMxFtxM=Cw@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 27 Sep 2021 11:45:48 +0200
Message-ID: <CAMuHMdVeKEqtsDZ2Tby7ZTDR6GEhs+Z1n5yCfhRJEjzmBbx0cg@mail.gmail.com>
Subject: Re: [RFC PATCH] memory: renesas-rpc-if: Correct QSPI data transfer in
 Manual mode
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Duc Nguyen <duc.nguyen.ub@renesas.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

On Mon, Sep 27, 2021 at 10:52 AM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Wed, Sep 22, 2021 at 10:10 AM Wolfram Sang
> <wsa+renesas@sang-engineering.com> wrote:
> > This patch fixes 2 problems:
> > [1] The output warning logs and data loss when performing
> > mount/umount then remount the device with jffs2 format.
> > [2] The access width of SMWDR[0:1]/SMRDR[0:1] register is wrong.
> >
> > This is the sample warning logs when performing mount/umount then
> > remount the device with jffs2 format:
> > jffs2: jffs2_scan_inode_node(): CRC failed on node at 0x031c51d4:
> > Read 0x00034e00, calculated 0xadb272a7
> >
> > The reason for issue [1] is that the writing data seems to
> > get messed up.
> > Data is only completed when the number of bytes is divisible by 4.
> > If you only have 3 bytes of data left to write, 1 garbage byte
> > is inserted after the end of the write stream.
> > If you only have 2 bytes of data left to write, 2 bytes of '00'
> > are added into the write stream.
> > If you only have 1 byte of data left to write, 2 bytes of '00'
> > are added into the write stream. 1 garbage byte is inserted after
> > the end of the write stream.
> >
> > To solve problem [1], data must be written continuously in serial
> > and the write stream ends when data is out.
> >
> > Following HW manual 62.2.15, access to SMWDR0 register should be
> > in the same size as the transfer size specified in the SPIDE[3:0]
> > bits in the manual mode enable setting register (SMENR).
> > Be sure to access from address 0.
> >
> > So, in 16-bit transfer (SPIDE[3:0]=b'1100), SMWDR0 should be
> > accessed by 16-bit width.
> > Similar to SMWDR1, SMDDR0/1 registers.
> > In current code, SMWDR0 register is accessed by regmap_write()
> > that only set up to do 32-bit width.
> >
> > To solve problem [2], data must be written 16-bit or 8-bit when
> > transferring 1-byte or 2-byte.
> >
> > Signed-off-by: Duc Nguyen <duc.nguyen.ub@renesas.com>
> > [wsa: refactored to use regmap only via reg_read/reg_write]
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > ---
> >
> > Hi,
> >
> > I could reproduce the issue by a simple:
> >
> >   $ echo "Hello" > /dev/mtd10
> >
> > The original BSP patch fixed the issue but mixed regmap-acces with
> > ioread/iowrite accesses. So, I refactored it to use custom regmap
> > accessors. This keeps the code more readable IMO. With this patch, my
> > custom test cases work as well as the JFFS2 remount mentioned in the
> > commit message. Tested on a Renesas Condor board (R-Car V3M) and a
> > Falcon board (R-Car V3U). I send this as RFC because this is my first
> > patch for the RPC code and hope for feedback. The BSP team has been
> > contacted as well for comments and testing. Nonetheless, this addresses
> > a serious issue which has caused broken boards because of writing to
> > unintended locations. So, I'd like to see this discussed and applied
> > soon if possible.
> >
> I hit the exact same issue on RZ/G2L where erase/write operation
> screwed some random sectors and made the board un-bootable. With the
> patch applied, read/write/erase worked as expected. Below are the logs
> on RZ/G2L SMARC EVK.
>
> root@smarc-rzg2l:~# sh -x ./flash.sh
> + cat /proc/mtd
> dev:    size   erasesize  name
> mtd0: 02000000 00001000 "boot"
> mtd1: 02000000 00001000 "user"
> + flashcp -v sample.bin /dev/mtd1
> Erasing blocks: 1024/1024 (100%)
> Writing data: 4096k/4096k (100%)
> Verifying data: 4096k/4096k (100%)
> + dd if=/dev/urandom of=/tmp/sample.bin bs=1024 count=4096
> 4096+0 records in
> 4096+0 records out
> 4194304 bytes (4.2 MB) copied, 0.0786743 s, 53.3 MB/s
> + flash_erase -j -q /dev/mtd1 0 0
> + mount -t jffs2 /dev/mtdblock1 /mnt
> + cp /tmp/sample.bin /mnt
> + ls -ltr /mnt
> total 4096
> -rw-r--r-- 1 root root 4194304 Sep 20 10:54 sample.bin
> + echo 'test write'
> + umount /mnt
> + mount -t jffs2 /dev/mtdblock1 /mnt
> + ls -ltr /mnt
> total 4097
> -rw-r--r-- 1 root root      11 Sep 20 10:54 write.txt
> -rw-r--r-- 1 root root 4194304 Sep 20 10:54 sample.bin
> + cat /mnt/write.txt
> test write
> + umount /mnt
>
> Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Might be a good idea to update the erase test to make a copy first,
and verify that only the wanted blocks have been affected by the erase.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
