Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77EE9343B7D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Mar 2021 09:17:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229912AbhCVIRV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 22 Mar 2021 04:17:21 -0400
Received: from mail-vs1-f53.google.com ([209.85.217.53]:43786 "EHLO
        mail-vs1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229986AbhCVIQz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Mar 2021 04:16:55 -0400
Received: by mail-vs1-f53.google.com with SMTP id z68so6993156vsb.10
        for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Mar 2021 01:16:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G0C5MeAWy0GtSAnh3gXk0/HHU6H6q2jZIhPp78U0omA=;
        b=bc7sOZTsS1qPnqhpfzQAubOb/2bOrSYNu7/id1f7DPGhoWv+OrS1+XIJF4Tfd646jd
         hZtvZskW+10/+hQweNGn8iYm1F71n6cdFuh9BXjnSjnisK1w48++DQthhQjgCSjVc/ui
         qbxsVIysEnls0hsTU2n1/TIkFY+4X3AagfjhmlXzIGrfnpIllBuVuo6dTkTm+yQO714y
         w6EkJjWsr45ssgseOR5aOppz8s1ZmCrVLz1OoIKtaR5jVXT0MZ/eVb4PIDzrBg8O8Jlj
         D6gpfqidL8rv/sS0H8NzmlaVJum9wjmgxftOhwTXaVTjEC9ym52J8OMSZPwJrnKXRq5l
         Pfxw==
X-Gm-Message-State: AOAM532ejQ7ZZLWE+kWqBW53TDdoSds9rZ1E85dpd3HndPCviL1R+xuo
        ZE8ERyBltCmSc1/T1ZdLnnP6WgKKR7QCbfUxKeE=
X-Google-Smtp-Source: ABdhPJz2H9kOPNIImwyKTQI4N6NNY2J0nXgk5ElJmPEvRw476v6oU30JfmLUhEZ2zbohg/EsM1YNMEtwoDckJbi7LIM=
X-Received: by 2002:a67:efd0:: with SMTP id s16mr8336767vsp.3.1616401014490;
 Mon, 22 Mar 2021 01:16:54 -0700 (PDT)
MIME-Version: 1.0
References: <161632638364.9010.14149594685878279298.sendpatchset@octo>
 <CAMuHMdXxqu_BZYv=t-QQnxQW55MNdj46sdcqn7ibHUc_PFs7Kg@mail.gmail.com> <CANqRtoTxBvj7JGUiO=RthmqGz-cL-LL8tZdNrDqHkc0a1RBEug@mail.gmail.com>
In-Reply-To: <CANqRtoTxBvj7JGUiO=RthmqGz-cL-LL8tZdNrDqHkc0a1RBEug@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 22 Mar 2021 09:16:42 +0100
Message-ID: <CAMuHMdXkmPHyjBcSRcYsqS1S7nNKynWeVa7zO+XkA__v=GCOZg@mail.gmail.com>
Subject: Re: [PATCH/RFC] ARM: dts: kzm9g: Extend DTS with hints on how to build
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Ulrich Hecht <uli+renesas@fpond.eu>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Magnus,

On Mon, Mar 22, 2021 at 3:22 AM Magnus Damm <magnus.damm@gmail.com> wrote:
> On Sun, Mar 21, 2021 at 11:03 PM Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
> > On Sun, Mar 21, 2021 at 1:06 PM Magnus Damm <damm@opensource.se> wrote:
> > > From: Magnus Damm <damm+renesas@opensource.se>
> > > Include hints in the DTS for KZM9G on how to build a kernel that may be booted
> > > using the old on-board boot loader. Special handling includes:
> > >  - The DTB needs to be appended to the zImage before generating the uImage
> > >  - LOADADDR needs to be set to 0x48008000 to be able to generate an uImage
> > >  - CONFIG_ATAGS=n is needed for the board to boot
> > >
> > > Perhaps there is a better place where this kind of information should be
> > > placed? Many years ago the LOADADDR information used to be part of the kernel
> > > makefiles (and make uImage just worked out of the box) but when going DTS
> > > and zImage this seems to have been dropped. So these days special care is
> > > needed to build a uImage file which is required by the boot loader.
> > >
> > > Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>

> > > --- 0001/arch/arm/boot/dts/sh73a0-kzm9g.dts
> > > +++ work/arch/arm/boot/dts/sh73a0-kzm9g.dts     2021-03-21 18:10:53.515741849 +0900
> > > @@ -2,9 +2,24 @@
> > >  /*
> > >   * Device Tree Source for the KZM-A9-GT board
> > >   *
> > > - * Copyright (C) 2012 Horms Solutions Ltd.
> > > + * The KZM9G board comes with on-board out-of-tree U-Boot from 2012 with:
> > > + *  uImage support but without zImage support
> >
> > Funny, mine (which I never upgraded) has:
> >
> >     U-Boot 2013.01.-rc1 (Nov 15 2012 - 11:13:00)
> >
> > and does boot zImage, with appended DTB.
>
> My board has serial number k0000019 and gives the following printout at boot:
>
> U-Boot 2012.04.01-00384-g4398d55-dirty (June 05 2012 - 19:45:48)
>
> This is also the original bootloader, but it might just happen to be
> an early development snapshot.

Mine was used by Uli before.  Perhaps he upgraded the boot loader?

> > > + *  make ARCH=arm CROSS_COMPILE=_ uImage LOADADDR=0x48008000
> > > + *  rm arch/arm/boot/zImage
> > > + *  make ARCH=arm CROSS_COMPILE=_ dtbs zImage
> > > + *  cat arch/arm/boot/dts/sh73a0-kzm9g.dtb >> arch/arm/boot/zImage
> > > + *  $(cut -f 3- -d ' ' < arch/arm/boot/.uImage.cmd)
> > > + *
> > > + * For a working recent kernel (v5.10+) the following configuration is needed:
> > > + *  CONFIG_ARM_APPENDED_DTB=y
> > > + *  CONFIG_ATAGS=n
> > >   *
> > > - * Based on sh73a0-kzm9g.dts
> > > + * The shmobile_defconfig works well after setting CONFIG_ATAGS=n
> >
> > Why CONFIG_ATAGS=n? I have CONFIG_ATAGS=y in my .config.
>
> I tried various boot-related options to see if it would unbreak the
> situation. And deselecting ATAGS happened to fix the issue.
>
> By the way, on this board it seems the bootloader environment comes
> without bootargs set.
>
> > IIRC, shmobile_defconfig works, if I change CONFIG_CMDLINE to match
> > what I need, as U-Boot cannot update chosen/cmdline in an appended DTB.
>
> So I've locally modified .config from shmobile_defconfig default:
> CONFIG_CMDLINE=""
> to:
> CONFIG_CMDLINE="ignore_loglevel"
> CONFIG_CMDLINE_FROM_BOOTLOADER=y
>
> This also seems to fix the issue - thank you!

I just realized that for passing the kernel command line to an appended
DTB, you need CONFIG_ARM_ATAG_DTB_COMPAT=y, too.
Unfortunately that doesn't seem to help: the kernel doesn't boot (no
output, haven't tried DEBUG_LL).
However, ever plain shmobile_defconfig seems to be very flaky on
kzm9g: the kernel locks up in the middle of the boot.

> Related to ATAGS or not, on the console I get the following on v5.10:
> [   0.000000] OF: fdt: Ignoring memory range 0x40000000 - 0x4800000
>
> This is similar to the output on from the old v3.18 kernel I happen to
> have around:
> Ignoring memory range 0x41000000 - 0x48000000

That's normal, you cannot use memory below the kernel load address.

> Does the kzm9g boot all the way to user space for you? Perhaps my
> board is busted but I seem to get some oopses and freeze.

My own kernel works well (I test it after each renesas-drivers release),
albeit with an "irq nobody cared" warning (which has been there forever,
and might explain the lock-up).  I've sent its config by PM.
Other known issues on kzm9g are that secondary CPU bringup is a bit
unreliable, especially during resume from s2ram, and that switching to
DT-based l2c-310 would break secondary CPU bringup completely (still the
case last time I tried).

> For anyone with an old bootloader, what do you think about documenting
> the LOADADDR and how to build an uImage?

https://elinux.org/R-Mobile/Boards/KZM-A9-GT
Feel free to update!

> Is there some way we can make the kernel boot out-of-the-box with
> shmobile_defconfig?

Upgrade to a modern U-Boot, everywhere?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
