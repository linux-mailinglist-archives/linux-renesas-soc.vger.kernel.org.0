Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF676419F73
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Sep 2021 21:51:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235901AbhI0Twj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 Sep 2021 15:52:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235209AbhI0Twi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Sep 2021 15:52:38 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BB78C061575;
        Mon, 27 Sep 2021 12:51:00 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id 71so666353ybe.6;
        Mon, 27 Sep 2021 12:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ovXf/pOGKcRl52LKcn1jFZTwerMogvTdFyyLXMxLkhk=;
        b=EvDp2IgwJXxUqio5ETwJiX8duNYbMtdqzMqV9bZE2Yo7+UOT1cgiBOjoP3lbc5JmPl
         SlP1Dq7gRmoyTapqBtjzWblricKvHFgEijpahQu2uUAaJCwLpbUyUaspVTBzQJeqe/3I
         CgrUSInj5vaP2YBO6RvwrjPgAlKGEvFsJrTirY3PpBrhzR5CM3L/oG31fkWXZK7q3UGR
         FAEiW4qoVX9AA1/tBJ16isLwurcmhYa8JAbTeUf5WgYCMTL9oFzweBBiufXlozdqIZtA
         AD7ScAx9MR/BQ2w0qaY4j4EX4cLhBS1Xsur95PASBORvOUDW+K5VF9ZyMhzbgqMZ98fI
         eM7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ovXf/pOGKcRl52LKcn1jFZTwerMogvTdFyyLXMxLkhk=;
        b=PDrBp0aUuSissecZarRpjgufXPL0PAuqhK9q14Yq+UreEVd5xRPdmM62tFLPz75vOw
         /ScRggrHpL58wtOXvXh0SrZNbTj8EDn2QZyVy5NjCM2jOVIVJhMd9XQ8AK1bdzBaJ/3Q
         lqVJzWqOCa9GrN1yUR5bigmP2DbqzVtSLfD1al1AtvQmTc/R1Xh/A/USjNlIw58vaFQC
         GDq4Cc/xgYPCAn8BuwGRkyf47NNOZJuZUfw3Bw25LisHoQRwtJ829aKLdB24Fyvsxb4s
         2Rf1Etz1+9znKvdpEoANQaUmTO7tqUilmn1iy+yOXz/G8k/UigljOo+d6rms+j/1lein
         vV1Q==
X-Gm-Message-State: AOAM530WV/xSUEsppLTL+dpfVcT0ia3DbTLo04gTIXkhEm9wnezjlnxh
        cdnAGTJ+vs6vuGI2t5jhFmx+ASgfWAkdPnwmm0c=
X-Google-Smtp-Source: ABdhPJwKSnpSpYnFqM16ioh0+pS5dVW5cdsLQK4LyJsR1J8DkpTFxyQ0P1+XHI9ymajZldnp5Zq6rHWuEm4blR76KoE=
X-Received: by 2002:a25:880f:: with SMTP id c15mr1944996ybl.543.1632772259670;
 Mon, 27 Sep 2021 12:50:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210922091007.5516-1-wsa+renesas@sang-engineering.com>
 <CA+V-a8su7780XxmdL5qsM+YFoK_4+OJauQkyC9AaJMxFtxM=Cw@mail.gmail.com> <CAMuHMdVeKEqtsDZ2Tby7ZTDR6GEhs+Z1n5yCfhRJEjzmBbx0cg@mail.gmail.com>
In-Reply-To: <CAMuHMdVeKEqtsDZ2Tby7ZTDR6GEhs+Z1n5yCfhRJEjzmBbx0cg@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Mon, 27 Sep 2021 20:50:33 +0100
Message-ID: <CA+V-a8sKeFqaF_ufAE25hykRp1RigANDjJBj0EyEhSNgxUrbaQ@mail.gmail.com>
Subject: Re: [RFC PATCH] memory: renesas-rpc-if: Correct QSPI data transfer in
 Manual mode
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Duc Nguyen <duc.nguyen.ub@renesas.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Mon, Sep 27, 2021 at 10:46 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, Sep 27, 2021 at 10:52 AM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> > On Wed, Sep 22, 2021 at 10:10 AM Wolfram Sang
> > <wsa+renesas@sang-engineering.com> wrote:
> > > This patch fixes 2 problems:
> > > [1] The output warning logs and data loss when performing
> > > mount/umount then remount the device with jffs2 format.
> > > [2] The access width of SMWDR[0:1]/SMRDR[0:1] register is wrong.
> > >
> > > This is the sample warning logs when performing mount/umount then
> > > remount the device with jffs2 format:
> > > jffs2: jffs2_scan_inode_node(): CRC failed on node at 0x031c51d4:
> > > Read 0x00034e00, calculated 0xadb272a7
> > >
> > > The reason for issue [1] is that the writing data seems to
> > > get messed up.
> > > Data is only completed when the number of bytes is divisible by 4.
> > > If you only have 3 bytes of data left to write, 1 garbage byte
> > > is inserted after the end of the write stream.
> > > If you only have 2 bytes of data left to write, 2 bytes of '00'
> > > are added into the write stream.
> > > If you only have 1 byte of data left to write, 2 bytes of '00'
> > > are added into the write stream. 1 garbage byte is inserted after
> > > the end of the write stream.
> > >
> > > To solve problem [1], data must be written continuously in serial
> > > and the write stream ends when data is out.
> > >
> > > Following HW manual 62.2.15, access to SMWDR0 register should be
> > > in the same size as the transfer size specified in the SPIDE[3:0]
> > > bits in the manual mode enable setting register (SMENR).
> > > Be sure to access from address 0.
> > >
> > > So, in 16-bit transfer (SPIDE[3:0]=b'1100), SMWDR0 should be
> > > accessed by 16-bit width.
> > > Similar to SMWDR1, SMDDR0/1 registers.
> > > In current code, SMWDR0 register is accessed by regmap_write()
> > > that only set up to do 32-bit width.
> > >
> > > To solve problem [2], data must be written 16-bit or 8-bit when
> > > transferring 1-byte or 2-byte.
> > >
> > > Signed-off-by: Duc Nguyen <duc.nguyen.ub@renesas.com>
> > > [wsa: refactored to use regmap only via reg_read/reg_write]
> > > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > > ---
> > >
> > > Hi,
> > >
> > > I could reproduce the issue by a simple:
> > >
> > >   $ echo "Hello" > /dev/mtd10
> > >
> > > The original BSP patch fixed the issue but mixed regmap-acces with
> > > ioread/iowrite accesses. So, I refactored it to use custom regmap
> > > accessors. This keeps the code more readable IMO. With this patch, my
> > > custom test cases work as well as the JFFS2 remount mentioned in the
> > > commit message. Tested on a Renesas Condor board (R-Car V3M) and a
> > > Falcon board (R-Car V3U). I send this as RFC because this is my first
> > > patch for the RPC code and hope for feedback. The BSP team has been
> > > contacted as well for comments and testing. Nonetheless, this addresses
> > > a serious issue which has caused broken boards because of writing to
> > > unintended locations. So, I'd like to see this discussed and applied
> > > soon if possible.
> > >
> > I hit the exact same issue on RZ/G2L where erase/write operation
> > screwed some random sectors and made the board un-bootable. With the
> > patch applied, read/write/erase worked as expected. Below are the logs
> > on RZ/G2L SMARC EVK.
> >
> > root@smarc-rzg2l:~# sh -x ./flash.sh
> > + cat /proc/mtd
> > dev:    size   erasesize  name
> > mtd0: 02000000 00001000 "boot"
> > mtd1: 02000000 00001000 "user"
> > + flashcp -v sample.bin /dev/mtd1
> > Erasing blocks: 1024/1024 (100%)
> > Writing data: 4096k/4096k (100%)
> > Verifying data: 4096k/4096k (100%)
> > + dd if=/dev/urandom of=/tmp/sample.bin bs=1024 count=4096
> > 4096+0 records in
> > 4096+0 records out
> > 4194304 bytes (4.2 MB) copied, 0.0786743 s, 53.3 MB/s
> > + flash_erase -j -q /dev/mtd1 0 0
> > + mount -t jffs2 /dev/mtdblock1 /mnt
> > + cp /tmp/sample.bin /mnt
> > + ls -ltr /mnt
> > total 4096
> > -rw-r--r-- 1 root root 4194304 Sep 20 10:54 sample.bin
> > + echo 'test write'
> > + umount /mnt
> > + mount -t jffs2 /dev/mtdblock1 /mnt
> > + ls -ltr /mnt
> > total 4097
> > -rw-r--r-- 1 root root      11 Sep 20 10:54 write.txt
> > -rw-r--r-- 1 root root 4194304 Sep 20 10:54 sample.bin
> > + cat /mnt/write.txt
> > test write
> > + umount /mnt
> >
> > Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Might be a good idea to update the erase test to make a copy first,
> and verify that only the wanted blocks have been affected by the erase.
>
Right, I have updated my erase test. Below are logs for my erase test
(from a give offset),

root@smarc-rzg2l:~# flashcp -v sample.bin /dev/mtd1
Erasing blocks: 1024/1024 (100%)
Writing data: 4096k/4096k (100%)
Verifying data: 4096k/4096k (100%)
root@smarc-rzg2l:~# flash_erase /dev/mtd1 4096 1
Erasing 4 Kibyte @ 1000 -- 100 % complete
root@smarc-rzg2l:~# hexdump -C /dev/mtd1 | less
00000fd0  c0 2b 03 33 96 ff 87 5b  f7 96 b5 a9 de 57 eb 2f  |.+.3...[.....W./|
00000fe0  11 70 11 f1 71 53 48 94  67 c8 0e 53 34 76 f4 f6  |.p..qSH.g..S4v..|
00000ff0  a0 ec ed 8d 62 f3 f2 5a  d0 0a 66 74 95 a7 91 7b  |....b..Z..ft...{|
00001000  ff ff ff ff ff ff ff ff  ff ff ff ff ff ff ff ff  |................|
*
00002000  ae d0 f4 f5 4b 66 b7 6f  2c 09 04 f1 10 58 40 b0  |....Kf.o,....X@.|
00002010  e5 27 6a d7 1f 8e af 8f  ff 57 34 75 6d b7 7d 99  |.'j......W4um.}.|
00002020  d8 e1 88 20 1a 83 37 e3  54 df 72 76 0a ec 1e 76  |... ..7.T.rv...v|
00002030  84 5c 05 f2 88 61 72 cd  34 4a 71 62 68 b7 b0 f6  |.\...ar.4Jqbh...|
00002040  2e eb a5 d6 79 d5 4d 1a  44 26 e9 77 0d 72 fb f3  |....y.M.D&.w.r..|
00002050  36 64 5a a0 44 1a 35 14  79 69 94 78 78 34 f2 04  |6dZ.D.5.yi.xx4..|
00002060  13 91 3a 5c 07 28 61 c8  a7 82 bc f6 7f 87 d4 da  |..:\.(a.........|
00002070  b4 ec 27 b6 f2 7c 07 c8  b3 d3 8b 8e 1f 5e 75 97  |..'..|.......^u.|
00002080  14 e7 ac b0 bd 3a 20 ce  ed 6a be 53 21 a3 7e 64  |.....: ..j.S!.~d|
00002090  99 0b 61 f0 dd 4c f6 90  c0 aa f4 52 8c 67 05 d0  |..a..L.....R.g..|
000020a0  b8 eb 0e 1e b8 40 09 52  ac 23 57 7f bd 94 3b 7a  |.....@.R.#W...;z|
000020b0  8e 8b 10 7a db bc 9f f8  15 dd 41 ac 92 cc b6 3f  |...z......A....?|
000020c0  67 57 dd d0 fc f1 6e 1e  27 d8 4f 62 98 71 74 ea  |gW....n.'.Ob.qt.|
000020d0  8c 62 82 50 8d ed 5b f1  a6 f1 99 7c e9 f1 8e 08  |.b.P..[....|....|
000020e0  48 c7 2d 73 83 03 96 78  f4 64 57 94 95 64 23 c2  |H.-s...x.dW..d#.|
000020f0  6f 53 32 e7 43 1b 5e 25  a8 b0 34 17 1f 33 4d f4  |oS2.C.^%..4..3M.|
00002100  30 95 91 4d f1 06 37 09  71 f3 ce 5d be f8 62 96  |0..M..7.q..]..b.|
00002110  0f d4 26 cb eb 50 a3 4c  81 6f 1c 8a e6 a2 c6 d3  |..&..P.L.o......|

Cheers,
Prabhakar

> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
