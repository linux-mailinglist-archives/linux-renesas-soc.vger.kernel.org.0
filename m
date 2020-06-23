Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 64279204C7C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jun 2020 10:35:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731725AbgFWIfL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 Jun 2020 04:35:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731567AbgFWIfL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Jun 2020 04:35:11 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1935CC061573;
        Tue, 23 Jun 2020 01:35:11 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id 18so1104434otv.6;
        Tue, 23 Jun 2020 01:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=goSzzxDsgzxsQuY6F1h0SsNpCeO6nw7HQJbzXsVCZxo=;
        b=ij3LAsP9p1irjc88wp1/WWNHRrwz3UZn4dmSUurQcPXlkh41m+MnezeltpEXliOxCt
         3kxSCX/4mPnFXq4aU057VjYSGpTGZrzzbJh5hHQi7dNdKWoa+CeUDBGmwvYnMD0T0e7g
         Zf3DMSrWTgKKz2RUHr6MjNXLPC7iat4GzmFDvoGBlMzY8c1YInfnPOGF2SOjDI/FkzUB
         jGgTDY0j5xpx3tobTOPpKWUnG8uoy3BLAWFeis2vjxDOhRP25kXrtnKqd/ZB1ALr1kuQ
         xX+XKpRAYJioif5IWq6jAiewZ4Oky2moCN/xQsOeuFpvjGUzrMMsAoCqh4Elq8QWcRD6
         ZuXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=goSzzxDsgzxsQuY6F1h0SsNpCeO6nw7HQJbzXsVCZxo=;
        b=PpfK3U8zyxd2buZJtox4W0jSmc1M1wMSeixVekqgfcqTyaH2ge/bkb2W0aQ2S2utaQ
         nhaQoFsNlmorw8nKC3EWA0CLs7ZhZ1w4U9/4UB7kR+NXvjuTkaQBbp7dQ8+monyn1wr8
         zmX+JhBejofPrLP7XMG7QAwzzVNWEqTY17mbLUL/neBdRyxTWkcMw8errylzRr38iv0M
         rICWE9WP0FkNgP8i2W73otecrkzNAoDv3nc7rjg14nC3URZp9g8RNBM3LqV6zvdn9yNC
         YIQ8c1lyX4tCxn6vYFTL+hzIhFdkWvWDIQl+n3f+AbcL1ezvqwctLKTg2nr+40gcSMOK
         bmRw==
X-Gm-Message-State: AOAM5317u/5teCkY10D2Q8VVweDdmDysQogfDgUzLTDFpMPSPfeMHzdE
        70Qb1tzR9egnVvtZ0ze4TBRL9YPChizRtpePSvo=
X-Google-Smtp-Source: ABdhPJwffdh0M4nKESM3uobBBa2UiPZNyiH0quaHQH7SdqqFBJmq9vJwUIlp8hKAj1M9RkRbx/6mjjn2BU9Qv+N0dQQ=
X-Received: by 2002:a9d:6546:: with SMTP id q6mr16850481otl.365.1592901310350;
 Tue, 23 Jun 2020 01:35:10 -0700 (PDT)
MIME-Version: 1.0
References: <1591555267-21822-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1591555267-21822-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWKhq63yT9XbbV4Nmr0EJZcGQ396pVCqkrzMTmgunznaQ@mail.gmail.com>
 <CA+V-a8ueb-3VD-=Bcg6dJqZhLRoCBxu-Zo+key_oEFchNc_APA@mail.gmail.com>
 <CA+V-a8vAfoQGpv-sXvJ11i9QC=EvKg750yusHBhLp8C17KmJbA@mail.gmail.com> <CAMuHMdWp6dL3g56EGDGnDBs+GNHeaO7ejy1k_4EaM_RY+dV=Cg@mail.gmail.com>
In-Reply-To: <CAMuHMdWp6dL3g56EGDGnDBs+GNHeaO7ejy1k_4EaM_RY+dV=Cg@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Tue, 23 Jun 2020 09:34:44 +0100
Message-ID: <CA+V-a8tUvT1Q+nhsk1Te5CrYSSTbEqvO1=8QyRHY4q2VYNzoKQ@mail.gmail.com>
Subject: Re: [PATCH 03/11] arm64: dts: renesas: hihope-common: Separate out
 Rev.2.0 specific into hihope-common-rev2.dtsi file
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Tue, Jun 23, 2020 at 9:14 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, Jun 23, 2020 at 9:51 AM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> > On Mon, Jun 8, 2020 at 3:59 PM Lad, Prabhakar
> > <prabhakar.csengg@gmail.com> wrote:
> > > On Mon, Jun 8, 2020 at 3:47 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > On Sun, Jun 7, 2020 at 8:41 PM Lad Prabhakar
> > > > <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > > > > Separate out Rev.2.0 specific hardware changes into
> > > > > hihope-common-rev2.dtsi file so that hihope-common.dtsi can be used
> > > > > by all the variants for RZ/G2M[N] boards.
> > > > >
> > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
>
> > > > > @@ -0,0 +1,101 @@
> > > > > +// SPDX-License-Identifier: GPL-2.0
> > > > > +/*
> > > > > + * Device Tree Source for the HiHope RZ/G2[MN] main board Rev.2.0 common
> > > > > + * parts
> > > > > + *
> > > > > + * Copyright (C) 2020 Renesas Electronics Corp.
> > > > > + */
> > > > > +
> > > > > +#include <dt-bindings/gpio/gpio.h>
> > > > > +
> > > > > +/ {
> > > > > +       leds {
> > > > > +               compatible = "gpio-leds";
> > > > > +
> > > > > +               bt_active_led {
> > > > > +                       label = "blue:bt";
> > > > > +                       gpios = <&gpio7  0 GPIO_ACTIVE_HIGH>;
> > > > > +                       linux,default-trigger = "hci0-power";
> > > > > +                       default-state = "off";
> > > > > +               };
> > > > > +
> > > > > +               led0 {
> > > > > +                       gpios = <&gpio6 11 GPIO_ACTIVE_HIGH>;
> > > > > +               };
> > > > > +
> > > > > +               led1 {
> > > > > +                       gpios = <&gpio6 12 GPIO_ACTIVE_HIGH>;
> > > > > +               };
> > > > > +
> > > > > +               led2 {
> > > > > +                       gpios = <&gpio6 13 GPIO_ACTIVE_HIGH>;
> > > > > +               };
> > > > > +
> > > > > +               led3 {
> > > > > +                       gpios = <&gpio0  0 GPIO_ACTIVE_HIGH>;
> > > > > +               };
> > > >
> > > > led1, led2, and led3 are present on both, so I'd keep them in
> > > > hihope-common.dtsi.
> > > >
> > > The leds defined in hihope-common-rev4.dtsi are as per the label names
> > > on the schematics/board so that it's easier to identify the LED's by
> > > name.
> > >
> > I was waiting on the above to be confirmed.
>
> I can confirm the naming of the LEDs on the rev4 board.
> However, following the same reasoning, the rev2 LEDs should be renamed
> led2201, led2202, led2203, and led2402 ;-)

I didn't want to change any behaviour if some was using the LED's with names.

> Does anyone rely on the names?  If not, it may make sense to use the
> rev4 names for both, in the common file?
>
Not sure, but I'll take your suggestion and just name them as per rev4 naming.

> Not even considering the switches...
> Seems they forgot to rename switches SW220[123] when renaming LED220[123].
> Worse, on rev2, you have SW220_2_/LED220_1_ sharing a GPIO, and
> SW220_1_/LED220_2_ sharing another one.
>
> And on rev4, GP6_11/GP_LED/TSW_0_ is driving LED_4_ and SW220_2_?
>
> Conclusion: I don't care how you name them ;-)
>
 :)

Cheers,
--Prabhakar

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
