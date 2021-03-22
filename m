Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB15B34369B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Mar 2021 03:23:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229829AbhCVCWf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 21 Mar 2021 22:22:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbhCVCWH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 21 Mar 2021 22:22:07 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3AE4C061574
        for <linux-renesas-soc@vger.kernel.org>; Sun, 21 Mar 2021 19:22:06 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id f26so19133681ljp.8
        for <linux-renesas-soc@vger.kernel.org>; Sun, 21 Mar 2021 19:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AqYtUO4oIQT6pAlw0oTx8cYlMOpL8sdwcYRXeTSOgkk=;
        b=YKE589TdMjUaG72Qp6RcsdKs/+AunJ3LQlGg9Xk1xPjN/3rmSM4YMADyiu3Ya1vHLA
         yqppsIjdVKZHtYL7vENcZ5Rq5BCnf5DqXnq+XU1XsZA39Zty3DEEeyfc71s2yaWUcDae
         WDdpAZ2csU6DdUTfNaOmLNhpszaxYqTQkUFJ4v0Gsh90vYFHxuTfUNJD0vEQZ7rtWglx
         PmoDPhhUuc4gVCBin6pRKVfzouXadUHHSbmHa55al7R4uCTVkv5zBUEqoa+14TW1PR7p
         3bP8brlzaCsQhvSKFONxIYRjZAEGmJfA74jHLIFi9vEr03wdpUm/0Xy0L9DQ8iMpOldK
         PYgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AqYtUO4oIQT6pAlw0oTx8cYlMOpL8sdwcYRXeTSOgkk=;
        b=DesRgDpIrg7oP526fZ0AdoiQxRi/96/DyWTFTp3rQmcoX03CqE2UCpCy2/PlFl2Cb1
         Gl9iU+bwyHyH13p3x2q3eBmntjXgPVgp0PucRM8+by43xnEYWPLD27eNUm/BctVtKs90
         gQA3wFmkYqcerrS+fJ2y0+KxQaZZDUhaXrYLEX86cnYRHqgTEl60rDUEkYB83mA6gUeQ
         u4pME+p52Twbx/+NcjVFbithUxCRdry4OBiHX79j2v5TPoBLYT8zwPd5139bRKJLiI5I
         e8WTm0pQRzf64YG1eipmWu/RhXtUlufkbEdlRBh3yAbThxhvUY4ygGa5dmBluckOulqs
         HN8Q==
X-Gm-Message-State: AOAM531m2US45YxRSxztQ2V/hl40RwkxwBzl1z1+258IApWNNbyqn8iS
        HHZUXk3H5g2VOAuIJw2ngofBMJA3RDhrAf8SyyM=
X-Google-Smtp-Source: ABdhPJxVWmY72vZ+yRvEZyGBX2ijL3b9n4P1sJxWH8pSrTcpTDRmUe84eL6syi3ivd1fuY8H8YkWBr+/q8kxy3F/2bk=
X-Received: by 2002:a2e:94c8:: with SMTP id r8mr8312597ljh.332.1616379725139;
 Sun, 21 Mar 2021 19:22:05 -0700 (PDT)
MIME-Version: 1.0
References: <161632638364.9010.14149594685878279298.sendpatchset@octo> <CAMuHMdXxqu_BZYv=t-QQnxQW55MNdj46sdcqn7ibHUc_PFs7Kg@mail.gmail.com>
In-Reply-To: <CAMuHMdXxqu_BZYv=t-QQnxQW55MNdj46sdcqn7ibHUc_PFs7Kg@mail.gmail.com>
From:   Magnus Damm <magnus.damm@gmail.com>
Date:   Mon, 22 Mar 2021 11:21:53 +0900
Message-ID: <CANqRtoTxBvj7JGUiO=RthmqGz-cL-LL8tZdNrDqHkc0a1RBEug@mail.gmail.com>
Subject: Re: [PATCH/RFC] ARM: dts: kzm9g: Extend DTS with hints on how to build
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Sun, Mar 21, 2021 at 11:03 PM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Magnus,
>
> On Sun, Mar 21, 2021 at 1:06 PM Magnus Damm <damm@opensource.se> wrote:
> > From: Magnus Damm <damm+renesas@opensource.se>
> > Include hints in the DTS for KZM9G on how to build a kernel that may be booted
> > using the old on-board boot loader. Special handling includes:
> >  - The DTB needs to be appended to the zImage before generating the uImage
> >  - LOADADDR needs to be set to 0x48008000 to be able to generate an uImage
> >  - CONFIG_ATAGS=n is needed for the board to boot
> >
> > Perhaps there is a better place where this kind of information should be
> > placed? Many years ago the LOADADDR information used to be part of the kernel
> > makefiles (and make uImage just worked out of the box) but when going DTS
> > and zImage this seems to have been dropped. So these days special care is
> > needed to build a uImage file which is required by the boot loader.
> >
> > Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
>
> Thanks for your patch!

Thanks for your review!

> > --- 0001/arch/arm/boot/dts/sh73a0-kzm9g.dts
> > +++ work/arch/arm/boot/dts/sh73a0-kzm9g.dts     2021-03-21 18:10:53.515741849 +0900
> > @@ -2,9 +2,24 @@
> >  /*
> >   * Device Tree Source for the KZM-A9-GT board
> >   *
> > - * Copyright (C) 2012 Horms Solutions Ltd.
> > + * The KZM9G board comes with on-board out-of-tree U-Boot from 2012 with:
> > + *  uImage support but without zImage support
>
> Funny, mine (which I never upgraded) has:
>
>     U-Boot 2013.01.-rc1 (Nov 15 2012 - 11:13:00)
>
> and does boot zImage, with appended DTB.

My board has serial number k0000019 and gives the following printout at boot:

U-Boot 2012.04.01-00384-g4398d55-dirty (June 05 2012 - 19:45:48)

This is also the original bootloader, but it might just happen to be
an early development snapshot.

In the U-Boot git repo I notice the files and directory
"configs/kzm9g/defconfig" and "board/kmc/kzm9g". Maybe those can be
used to improve the situation.

Perhaps this is a good opportunity to hook up J-Link/ST-Link/Olimex to
OpenOCD and update the boot loader?

> > + *  one way or the other busted ATAGs
> > + *
> > + * Generate an uImage at the correct load address with apppended DTB like this:
>
> appended

Indeed, thanks.

> > + *  make ARCH=arm CROSS_COMPILE=_ uImage LOADADDR=0x48008000
> > + *  rm arch/arm/boot/zImage
> > + *  make ARCH=arm CROSS_COMPILE=_ dtbs zImage
> > + *  cat arch/arm/boot/dts/sh73a0-kzm9g.dtb >> arch/arm/boot/zImage
> > + *  $(cut -f 3- -d ' ' < arch/arm/boot/.uImage.cmd)
> > + *
> > + * For a working recent kernel (v5.10+) the following configuration is needed:
> > + *  CONFIG_ARM_APPENDED_DTB=y
> > + *  CONFIG_ATAGS=n
> >   *
> > - * Based on sh73a0-kzm9g.dts
> > + * The shmobile_defconfig works well after setting CONFIG_ATAGS=n
>
> Why CONFIG_ATAGS=n? I have CONFIG_ATAGS=y in my .config.

I tried various boot-related options to see if it would unbreak the
situation. And deselecting ATAGS happened to fix the issue.

By the way, on this board it seems the bootloader environment comes
without bootargs set.

> IIRC, shmobile_defconfig works, if I change CONFIG_CMDLINE to match
> what I need, as U-Boot cannot update chosen/cmdline in an appended DTB.

So I've locally modified .config from shmobile_defconfig default:
CONFIG_CMDLINE=""
to:
CONFIG_CMDLINE="ignore_loglevel"
CONFIG_CMDLINE_FROM_BOOTLOADER=y

This also seems to fix the issue - thank you!

Related to ATAGS or not, on the console I get the following on v5.10:
[   0.000000] OF: fdt: Ignoring memory range 0x40000000 - 0x4800000

This is similar to the output on from the old v3.18 kernel I happen to
have around:
Ignoring memory range 0x41000000 - 0x48000000

Does the kzm9g boot all the way to user space for you? Perhaps my
board is busted but I seem to get some oopses and freeze.

For anyone with an old bootloader, what do you think about documenting
the LOADADDR and how to build an uImage?

Is there some way we can make the kernel boot out-of-the-box with
shmobile_defconfig?

Cheers,

/ magnus
