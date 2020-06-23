Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D997A204BB6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jun 2020 09:51:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731346AbgFWHv1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 Jun 2020 03:51:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731158AbgFWHv0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Jun 2020 03:51:26 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4813C061573;
        Tue, 23 Jun 2020 00:51:26 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id e5so15626576ote.11;
        Tue, 23 Jun 2020 00:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=31g1sbVtR+uOawnMksB1fqDaovbJUKSiTqnUPMyL77I=;
        b=HFptDqDb3X53PSN7ilibR9KZ401OqDhKcO44etgdqJH7FD74k3YmeoFFjZTu/oWV4/
         X4DPxHANUsTLnLQCb2/Y2zLEY658AEntQiZI44r3bQIUAfHX6utOBtSlLFQgH65UcA+k
         ZXq1G5vIHZikthaSU6lt/WG89ETn1qxsq8F1lTOItTrUfOKb6FQb/J2Fxsa/OG2ufKII
         mlLk1cY7x0/m1Nqo2nltJCOTcor36fPjUVRYZBVUJ4PcY3a1Tr0ZnOzKod4+lgQMpxyo
         tDaNhbXN8yengWZvjinnp2HNkoyYL7RZ+QtINNlRlH7CXxTntP6GHaxbNOe2jaa0ospr
         xXFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=31g1sbVtR+uOawnMksB1fqDaovbJUKSiTqnUPMyL77I=;
        b=jSOMAAXL4Ip/nFIGBQb6vD60kGUv6NKss94+OtprqX/ukmIYi1K0zRNunjCpdxbeGQ
         d5AJSb7eV1vLwvLWHdPSm8rB5OSlCOENK6aDDIJF/HriTxHGSZ+ofrpfTjmUvLi8zycX
         0JBLf0Yck+RoN4w1HxL14FVhxbXDULgebb3dFl/uX/EsnBfhVWM+3xirywQ8Gg3ngOAq
         LMHHpHEYA9OtcCEQKkQ69LoLk9KmyRBZcuhR6DKup1dYjsydF/CpWLjBxv2qMCBoRV+s
         wjeisBxu0M1/hH7a5n6z38leHGEURSypPMijm7dqspYLYJNqGRLZm4WVdZiK7lIxLuS7
         9RjA==
X-Gm-Message-State: AOAM532rmSTgrhCI5kNuY2qLtMHfIAHW6iOc+/aRnpQ9cci1X/Y6RgbD
        181ip70bVNqenOvM0Co6xpI+JZvwXO9rusCVuds=
X-Google-Smtp-Source: ABdhPJy+PYnswA5wydGyHE4W1n9hO8mF9AzRCcJmrgJePeo0DD7R7YHLVJgE1gJudHYQ+mWh3MF/mwgt2D1cpExgOoY=
X-Received: by 2002:a9d:6546:: with SMTP id q6mr16747184otl.365.1592898686139;
 Tue, 23 Jun 2020 00:51:26 -0700 (PDT)
MIME-Version: 1.0
References: <1591555267-21822-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1591555267-21822-3-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdWKhq63yT9XbbV4Nmr0EJZcGQ396pVCqkrzMTmgunznaQ@mail.gmail.com> <CA+V-a8ueb-3VD-=Bcg6dJqZhLRoCBxu-Zo+key_oEFchNc_APA@mail.gmail.com>
In-Reply-To: <CA+V-a8ueb-3VD-=Bcg6dJqZhLRoCBxu-Zo+key_oEFchNc_APA@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Tue, 23 Jun 2020 08:51:00 +0100
Message-ID: <CA+V-a8vAfoQGpv-sXvJ11i9QC=EvKg750yusHBhLp8C17KmJbA@mail.gmail.com>
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

On Mon, Jun 8, 2020 at 3:59 PM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
>
> Hi Geert,
>
> On Mon, Jun 8, 2020 at 3:47 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >
> > Hi Prabhakar,
> >
> > On Sun, Jun 7, 2020 at 8:41 PM Lad Prabhakar
> > <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> > > Separate out Rev.2.0 specific hardware changes into
> > > hihope-common-rev2.dtsi file so that hihope-common.dtsi can be used
> > > by all the variants for RZ/G2M[N] boards.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> >
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/renesas/hihope-common-rev2.dtsi
> >
> > Perhaps just hihope-rev2.dtsi, i.e. without the "common-"?
> >
> Yes makes sense.
>
> > > @@ -0,0 +1,101 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Device Tree Source for the HiHope RZ/G2[MN] main board Rev.2.0 common
> > > + * parts
> > > + *
> > > + * Copyright (C) 2020 Renesas Electronics Corp.
> > > + */
> > > +
> > > +#include <dt-bindings/gpio/gpio.h>
> > > +
> > > +/ {
> > > +       leds {
> > > +               compatible = "gpio-leds";
> > > +
> > > +               bt_active_led {
> > > +                       label = "blue:bt";
> > > +                       gpios = <&gpio7  0 GPIO_ACTIVE_HIGH>;
> > > +                       linux,default-trigger = "hci0-power";
> > > +                       default-state = "off";
> > > +               };
> > > +
> > > +               led0 {
> > > +                       gpios = <&gpio6 11 GPIO_ACTIVE_HIGH>;
> > > +               };
> > > +
> > > +               led1 {
> > > +                       gpios = <&gpio6 12 GPIO_ACTIVE_HIGH>;
> > > +               };
> > > +
> > > +               led2 {
> > > +                       gpios = <&gpio6 13 GPIO_ACTIVE_HIGH>;
> > > +               };
> > > +
> > > +               led3 {
> > > +                       gpios = <&gpio0  0 GPIO_ACTIVE_HIGH>;
> > > +               };
> >
> > led1, led2, and led3 are present on both, so I'd keep them in
> > hihope-common.dtsi.
> >
> The leds defined in hihope-common-rev4.dtsi are as per the label names
> on the schematics/board so that it's easier to identify the LED's by
> name.
>
I was waiting on the above to be confirmed.

Cheers,
--Prabhakar

> > > +
> > > +               wlan_active_led {
> > > +                       label = "yellow:wlan";
> > > +                       gpios = <&gpio7  1 GPIO_ACTIVE_HIGH>;
> > > +                       linux,default-trigger = "phy0tx";
> > > +                       default-state = "off";
> > > +               };
> > > +       };
> > > +
> > > +       wlan_en_reg: regulator-wlan_en {
> > > +               compatible = "regulator-fixed";
> > > +               regulator-name = "wlan-en-regulator";
> > > +               regulator-min-microvolt = <1800000>;
> > > +               regulator-max-microvolt = <1800000>;
> > > +               startup-delay-us = <70000>;
> > > +
> > > +               gpio = <&gpio_expander 1 GPIO_ACTIVE_HIGH>;
> > > +               enable-active-high;
> > > +       };
> >
> > Same for the WLAN regulator, especially as it is referenced from
> > hihope-common.dtsi.
> > As the GPIO  line differs between the two variants, you just need
> > to add the gpio property in the revision-specific file.
> >
> Agreed will move this to common.
>
> > > +};
> > > +
> > > +&hscif0 {
> > > +       bluetooth {
> > > +               compatible = "ti,wl1837-st";
> > > +               enable-gpios = <&gpio_expander 2 GPIO_ACTIVE_HIGH>;
> > > +       };
> > > +};
> >
> > As node is small, and the GPIO line differs from the two variants,
> > I think duplicating it in both revision-specific files is fine, though.
> >
> Agreed.
>
> Cheers,
> --Prabhakar
>
> > Gr{oetje,eeting}s,
> >
> >                         Geert
> >
> > --
> > Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> >
> > In personal conversations with technical people, I call myself a hacker. But
> > when I'm talking to journalists I just say "programmer" or something like that.
> >                                 -- Linus Torvalds
