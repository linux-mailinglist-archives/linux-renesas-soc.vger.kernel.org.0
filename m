Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7CC11F1B8A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jun 2020 16:59:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730132AbgFHO7j (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Jun 2020 10:59:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725965AbgFHO7j (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Jun 2020 10:59:39 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E70DEC08C5C2;
        Mon,  8 Jun 2020 07:59:38 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id s21so15538379oic.9;
        Mon, 08 Jun 2020 07:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sakwAE9UDvgXpfLA/IMovHDdgj7kYeDNiG6uvdI8YnE=;
        b=rbQi1FYi5A1FxRR3KxNata4g2VukcskcoNJv5Qe6GITqlJm9i5g/03+xRsa3AR0dBV
         sDzBrJISTgokP0089gBn849qmwZ7h0J8Fq1fwlLMRgzLpmpflfD13KBKimhz7LJxZbDg
         nC7y6sg6e2oetrDBTfx+8x9s51LwHIWDQbTEcPlErG6xqhUpfQe/UcyZVP5Be/oM/roe
         TrC76QRbzmJAA1DyxJ4J+FlIGYy/5DixXGS85dc0MLHjhT3crGx8paNRDme7fH5+k2+b
         1QAWja5dHWRBWtfhbj0jLlH6fnk9FCJBNQ6bvbMPo0+VbEmBdVAuG9Sd2bQoMJRjjl4j
         vo/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sakwAE9UDvgXpfLA/IMovHDdgj7kYeDNiG6uvdI8YnE=;
        b=i0A5NwtCabgO8/E+h6X5dQYCiR3/kfTg98SFRy1O3QOPB97Bz196YuQYJ4wwlXjGlT
         lmKPhGH/BkRK2M6JiJNkWLFFsYlOT1ReB4/NHYLK8UhRKsSnxWxwm4oHtzbpNnn32pcJ
         ud9hY2sO5XYMEZuKIheqFJgXeqC0dfk7gvTvLAEI6vUjcRaqlSoatctpfkj7c/NWzWM9
         6F2RnDTJBpOUchfxgZYMweIwa6dCqP+vaKuZtVrOYdwzbqXEzrFTscvBuLv1hPgrCXn+
         EGsCrn/1xkFF3z5mpp2CgBOuGgS6OIWn6D6o7wVcfk6BUZ3aZITbkdMzFqvBhNuAlylj
         3bVA==
X-Gm-Message-State: AOAM530wTcipqlq53xpbmDdrTfi/UK3wJ9P3npqRL5qH8l+5Y1mM9Pa/
        a+d712L+vfqNLiOva9mQUB3Ak9sBe9DLXKSxcOWWZXw8PH4duA==
X-Google-Smtp-Source: ABdhPJzbekWad6Gkbqv1f+EDYUA1WR2SWjZmQ8HEVGb3/zsnKNal+9yg73fNP7qK7BqGWigQWcEbKKuYfYQcF5z+v9w=
X-Received: by 2002:aca:ea44:: with SMTP id i65mr10535404oih.142.1591628378380;
 Mon, 08 Jun 2020 07:59:38 -0700 (PDT)
MIME-Version: 1.0
References: <1591555267-21822-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1591555267-21822-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWKhq63yT9XbbV4Nmr0EJZcGQ396pVCqkrzMTmgunznaQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWKhq63yT9XbbV4Nmr0EJZcGQ396pVCqkrzMTmgunznaQ@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Mon, 8 Jun 2020 15:59:11 +0100
Message-ID: <CA+V-a8ueb-3VD-=Bcg6dJqZhLRoCBxu-Zo+key_oEFchNc_APA@mail.gmail.com>
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

On Mon, Jun 8, 2020 at 3:47 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Prabhakar,
>
> On Sun, Jun 7, 2020 at 8:41 PM Lad Prabhakar
> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > Separate out Rev.2.0 specific hardware changes into
> > hihope-common-rev2.dtsi file so that hihope-common.dtsi can be used
> > by all the variants for RZ/G2M[N] boards.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
>
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/renesas/hihope-common-rev2.dtsi
>
> Perhaps just hihope-rev2.dtsi, i.e. without the "common-"?
>
Yes makes sense.

> > @@ -0,0 +1,101 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Device Tree Source for the HiHope RZ/G2[MN] main board Rev.2.0 common
> > + * parts
> > + *
> > + * Copyright (C) 2020 Renesas Electronics Corp.
> > + */
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +
> > +/ {
> > +       leds {
> > +               compatible = "gpio-leds";
> > +
> > +               bt_active_led {
> > +                       label = "blue:bt";
> > +                       gpios = <&gpio7  0 GPIO_ACTIVE_HIGH>;
> > +                       linux,default-trigger = "hci0-power";
> > +                       default-state = "off";
> > +               };
> > +
> > +               led0 {
> > +                       gpios = <&gpio6 11 GPIO_ACTIVE_HIGH>;
> > +               };
> > +
> > +               led1 {
> > +                       gpios = <&gpio6 12 GPIO_ACTIVE_HIGH>;
> > +               };
> > +
> > +               led2 {
> > +                       gpios = <&gpio6 13 GPIO_ACTIVE_HIGH>;
> > +               };
> > +
> > +               led3 {
> > +                       gpios = <&gpio0  0 GPIO_ACTIVE_HIGH>;
> > +               };
>
> led1, led2, and led3 are present on both, so I'd keep them in
> hihope-common.dtsi.
>
The leds defined in hihope-common-rev4.dtsi are as per the label names
on the schematics/board so that it's easier to identify the LED's by
name.

> > +
> > +               wlan_active_led {
> > +                       label = "yellow:wlan";
> > +                       gpios = <&gpio7  1 GPIO_ACTIVE_HIGH>;
> > +                       linux,default-trigger = "phy0tx";
> > +                       default-state = "off";
> > +               };
> > +       };
> > +
> > +       wlan_en_reg: regulator-wlan_en {
> > +               compatible = "regulator-fixed";
> > +               regulator-name = "wlan-en-regulator";
> > +               regulator-min-microvolt = <1800000>;
> > +               regulator-max-microvolt = <1800000>;
> > +               startup-delay-us = <70000>;
> > +
> > +               gpio = <&gpio_expander 1 GPIO_ACTIVE_HIGH>;
> > +               enable-active-high;
> > +       };
>
> Same for the WLAN regulator, especially as it is referenced from
> hihope-common.dtsi.
> As the GPIO  line differs between the two variants, you just need
> to add the gpio property in the revision-specific file.
>
Agreed will move this to common.

> > +};
> > +
> > +&hscif0 {
> > +       bluetooth {
> > +               compatible = "ti,wl1837-st";
> > +               enable-gpios = <&gpio_expander 2 GPIO_ACTIVE_HIGH>;
> > +       };
> > +};
>
> As node is small, and the GPIO line differs from the two variants,
> I think duplicating it in both revision-specific files is fine, though.
>
Agreed.

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
