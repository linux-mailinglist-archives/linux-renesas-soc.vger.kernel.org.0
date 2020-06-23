Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 43F0C204C09
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jun 2020 10:14:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731696AbgFWIOh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 Jun 2020 04:14:37 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:39611 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731543AbgFWIOg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Jun 2020 04:14:36 -0400
Received: by mail-ot1-f65.google.com with SMTP id 18so1054484otv.6;
        Tue, 23 Jun 2020 01:14:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3wMeLPH35thiLGgx624oYmqf+jOSoZ6JS2Lw9OFClkk=;
        b=Z4tFwqU5/AyhOKAoij1edIt4RrVRJZeA+Tuy9JTpPxh+3Gov7yELrvIlQxxW/PHFZN
         N5seybRsXV2IVuYj2fmmFIcW6XnnLwT/VbIRnMUiGOVOJprhNBXdBl/1q06yw464KAO7
         gVmIBXMVJWibG7aferITau6ANF/Rn+cLa4meDAHhVb++qsSYz860qbbQyKGLLbm2lbFj
         pFIYc3MkMMb7O9zh6z+14UubrC+pKJB1cXYn2ETsry3liOAPGvTrvq+3qHfnUo13ikSF
         mmqKLK4OMO89Q4gs6ce2fc+TEi7heCTruILOZgqJUeLpCi7cSZvNg0XsToC8uwmXfbMu
         L+5A==
X-Gm-Message-State: AOAM5318f8OVytLqgwPV4ylc94kWPbbkR0wY2bJV3POmd8iqpdIuIGW2
        LQpLl1nTPnIRuYVmgjl3S0bOfkB5hG50QUTEqkA=
X-Google-Smtp-Source: ABdhPJxJgGg3gtgQs+gIJ/qBeLm1Q4RSZqz6Bz8d7IGHpNCVu6omKA+6DyTZkvQOVsIPu9k+/zBzJhkwUsoG08xuGz4=
X-Received: by 2002:a9d:c29:: with SMTP id 38mr16317291otr.107.1592900074339;
 Tue, 23 Jun 2020 01:14:34 -0700 (PDT)
MIME-Version: 1.0
References: <1591555267-21822-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1591555267-21822-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWKhq63yT9XbbV4Nmr0EJZcGQ396pVCqkrzMTmgunznaQ@mail.gmail.com>
 <CA+V-a8ueb-3VD-=Bcg6dJqZhLRoCBxu-Zo+key_oEFchNc_APA@mail.gmail.com> <CA+V-a8vAfoQGpv-sXvJ11i9QC=EvKg750yusHBhLp8C17KmJbA@mail.gmail.com>
In-Reply-To: <CA+V-a8vAfoQGpv-sXvJ11i9QC=EvKg750yusHBhLp8C17KmJbA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 23 Jun 2020 10:14:23 +0200
Message-ID: <CAMuHMdWp6dL3g56EGDGnDBs+GNHeaO7ejy1k_4EaM_RY+dV=Cg@mail.gmail.com>
Subject: Re: [PATCH 03/11] arm64: dts: renesas: hihope-common: Separate out
 Rev.2.0 specific into hihope-common-rev2.dtsi file
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
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

Hi Prabhakar,

On Tue, Jun 23, 2020 at 9:51 AM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Mon, Jun 8, 2020 at 3:59 PM Lad, Prabhakar
> <prabhakar.csengg@gmail.com> wrote:
> > On Mon, Jun 8, 2020 at 3:47 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Sun, Jun 7, 2020 at 8:41 PM Lad Prabhakar
> > > <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > > > Separate out Rev.2.0 specific hardware changes into
> > > > hihope-common-rev2.dtsi file so that hihope-common.dtsi can be used
> > > > by all the variants for RZ/G2M[N] boards.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>

> > > > @@ -0,0 +1,101 @@
> > > > +// SPDX-License-Identifier: GPL-2.0
> > > > +/*
> > > > + * Device Tree Source for the HiHope RZ/G2[MN] main board Rev.2.0 common
> > > > + * parts
> > > > + *
> > > > + * Copyright (C) 2020 Renesas Electronics Corp.
> > > > + */
> > > > +
> > > > +#include <dt-bindings/gpio/gpio.h>
> > > > +
> > > > +/ {
> > > > +       leds {
> > > > +               compatible = "gpio-leds";
> > > > +
> > > > +               bt_active_led {
> > > > +                       label = "blue:bt";
> > > > +                       gpios = <&gpio7  0 GPIO_ACTIVE_HIGH>;
> > > > +                       linux,default-trigger = "hci0-power";
> > > > +                       default-state = "off";
> > > > +               };
> > > > +
> > > > +               led0 {
> > > > +                       gpios = <&gpio6 11 GPIO_ACTIVE_HIGH>;
> > > > +               };
> > > > +
> > > > +               led1 {
> > > > +                       gpios = <&gpio6 12 GPIO_ACTIVE_HIGH>;
> > > > +               };
> > > > +
> > > > +               led2 {
> > > > +                       gpios = <&gpio6 13 GPIO_ACTIVE_HIGH>;
> > > > +               };
> > > > +
> > > > +               led3 {
> > > > +                       gpios = <&gpio0  0 GPIO_ACTIVE_HIGH>;
> > > > +               };
> > >
> > > led1, led2, and led3 are present on both, so I'd keep them in
> > > hihope-common.dtsi.
> > >
> > The leds defined in hihope-common-rev4.dtsi are as per the label names
> > on the schematics/board so that it's easier to identify the LED's by
> > name.
> >
> I was waiting on the above to be confirmed.

I can confirm the naming of the LEDs on the rev4 board.
However, following the same reasoning, the rev2 LEDs should be renamed
led2201, led2202, led2203, and led2402 ;-)
Does anyone rely on the names?  If not, it may make sense to use the
rev4 names for both, in the common file?

Not even considering the switches...
Seems they forgot to rename switches SW220[123] when renaming LED220[123].
Worse, on rev2, you have SW220_2_/LED220_1_ sharing a GPIO, and
SW220_1_/LED220_2_ sharing another one.

And on rev4, GP6_11/GP_LED/TSW_0_ is driving LED_4_ and SW220_2_?

Conclusion: I don't care how you name them ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
