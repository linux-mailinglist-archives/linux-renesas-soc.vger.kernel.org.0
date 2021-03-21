Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF8B93432D9
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 21 Mar 2021 15:04:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229840AbhCUODz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 21 Mar 2021 10:03:55 -0400
Received: from mail-vs1-f53.google.com ([209.85.217.53]:35459 "EHLO
        mail-vs1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229784AbhCUODe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 21 Mar 2021 10:03:34 -0400
Received: by mail-vs1-f53.google.com with SMTP id h25so6081020vso.2
        for <linux-renesas-soc@vger.kernel.org>; Sun, 21 Mar 2021 07:03:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3CoEhpeVuzp0f7Vdp/MjlgtUCu6lOeqoLw7JCcHsKIM=;
        b=gx8XcoEfU6+IbT/cPlaXLgCkFuxVP6T/m2YVaZAgWpBPVWegXqI59rWj6LnUX/oYGT
         s7eBTuPTBzUm3dZF2KwCS/eAAl0ouOovu915N2GfT5zuObqsh7SiVITkZkeV3BL11eGx
         A9xkBxypw5Dpa2JNypjBHslyTRMesOBWfHlots03qCJOEksa37LhnDjzs5mYjm5AMWl2
         j7phoAr1ITbqc3Bw9XD3PXsB/Ny/zqKu5EDrKoLDSf6x0UrPsnRMp/dnG4ASnGsx6gBV
         PsdPgVkmb9Wzf/DifGJYNhQqwp9zvlp3PuEjP+PtUJwgscVHGE/UI38xhoAAwHN5pRe6
         5QRQ==
X-Gm-Message-State: AOAM530bGcWT4UdMI4z09pb9UZRGfIksvzvkV518IqcS0va2zu5b8NMl
        l6J4sFTDzTCbWUyZeACIlJsJ0mnmR27o5b98YPrz0zpMm7k=
X-Google-Smtp-Source: ABdhPJyyJ9w7cmbESFJ7kMlGn3i6FNTREwswhMhk3HEQYYk4VIDaTnJZqiLK4Y2JJyGxWd/7qWhUtIXUuGJfDDLf2Xc=
X-Received: by 2002:a67:8883:: with SMTP id k125mr7175626vsd.18.1616335413860;
 Sun, 21 Mar 2021 07:03:33 -0700 (PDT)
MIME-Version: 1.0
References: <161632638364.9010.14149594685878279298.sendpatchset@octo>
In-Reply-To: <161632638364.9010.14149594685878279298.sendpatchset@octo>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Sun, 21 Mar 2021 15:03:22 +0100
Message-ID: <CAMuHMdXxqu_BZYv=t-QQnxQW55MNdj46sdcqn7ibHUc_PFs7Kg@mail.gmail.com>
Subject: Re: [PATCH/RFC] ARM: dts: kzm9g: Extend DTS with hints on how to build
To:     Magnus Damm <damm@opensource.se>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Magnus,

On Sun, Mar 21, 2021 at 1:06 PM Magnus Damm <damm@opensource.se> wrote:
> From: Magnus Damm <damm+renesas@opensource.se>
> Include hints in the DTS for KZM9G on how to build a kernel that may be booted
> using the old on-board boot loader. Special handling includes:
>  - The DTB needs to be appended to the zImage before generating the uImage
>  - LOADADDR needs to be set to 0x48008000 to be able to generate an uImage
>  - CONFIG_ATAGS=n is needed for the board to boot
>
> Perhaps there is a better place where this kind of information should be
> placed? Many years ago the LOADADDR information used to be part of the kernel
> makefiles (and make uImage just worked out of the box) but when going DTS
> and zImage this seems to have been dropped. So these days special care is
> needed to build a uImage file which is required by the boot loader.
>
> Not-Yet-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>

Thanks for your patch!

> --- 0001/arch/arm/boot/dts/sh73a0-kzm9g.dts
> +++ work/arch/arm/boot/dts/sh73a0-kzm9g.dts     2021-03-21 18:10:53.515741849 +0900
> @@ -2,9 +2,24 @@
>  /*
>   * Device Tree Source for the KZM-A9-GT board
>   *
> - * Copyright (C) 2012 Horms Solutions Ltd.
> + * The KZM9G board comes with on-board out-of-tree U-Boot from 2012 with:
> + *  uImage support but without zImage support

Funny, mine (which I never upgraded) has:

    U-Boot 2013.01.-rc1 (Nov 15 2012 - 11:13:00)

and does boot zImage, with appended DTB.

> + *  one way or the other busted ATAGs
> + *
> + * Generate an uImage at the correct load address with apppended DTB like this:

appended

> + *  make ARCH=arm CROSS_COMPILE=_ uImage LOADADDR=0x48008000
> + *  rm arch/arm/boot/zImage
> + *  make ARCH=arm CROSS_COMPILE=_ dtbs zImage
> + *  cat arch/arm/boot/dts/sh73a0-kzm9g.dtb >> arch/arm/boot/zImage
> + *  $(cut -f 3- -d ' ' < arch/arm/boot/.uImage.cmd)
> + *
> + * For a working recent kernel (v5.10+) the following configuration is needed:
> + *  CONFIG_ARM_APPENDED_DTB=y
> + *  CONFIG_ATAGS=n
>   *
> - * Based on sh73a0-kzm9g.dts
> + * The shmobile_defconfig works well after setting CONFIG_ATAGS=n

Why CONFIG_ATAGS=n? I have CONFIG_ATAGS=y in my .config.

IIRC, shmobile_defconfig works, if I change CONFIG_CMDLINE to match
what I need, as U-Boot cannot update chosen/cmdline in an appended DTB.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
