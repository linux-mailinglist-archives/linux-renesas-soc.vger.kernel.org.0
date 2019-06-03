Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C7CE32975
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Jun 2019 09:27:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726336AbfFCH1N (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 3 Jun 2019 03:27:13 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:46877 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725975AbfFCH1N (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Jun 2019 03:27:13 -0400
Received: by mail-lj1-f195.google.com with SMTP id m15so6846308ljg.13;
        Mon, 03 Jun 2019 00:27:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y8W3dcrmlkFLWXFQd6Q5TSDxHTvBim8viNHnnMRWv8g=;
        b=CZk1Ve4pyqegPniC+3jQtQavohp0sxwdtcv5+3oI1aUNlcyJRzVG1vojehALu+6rvB
         AvNJRKLa6kucMHVYwAFXJD9O4WO/u+9E1kbvG0rjI9KbC9WO2A//YpLLv1aquNpp1Wlr
         wB7ZYWOrCn3NSV5xJ96To4FK1BFAVs6AXXNr4J7wJf0yDf+gB595VjLblJ4vhmqXQanb
         bPo2ebZJ5K486vpUmjbkXlKki8MyG1gmugLkb+fqpEsoL25untV0st3klPcxdBuOyRA4
         au/A5in0mWzoRXpVQI8bcX8OFG6Me2GWdueysGCOHt2I5YLRZEwz/YoA20u8167HVfig
         1a2w==
X-Gm-Message-State: APjAAAXuMQMDRwrufO971lk4blgU0kTNnGBPHNV/jCIjiKAZ4qeWKHBu
        Pqf4JZZL2Oe0kd9K53k8ImFQxsuHkQ2cH8RJpaSbURV7
X-Google-Smtp-Source: APXvYqzJy9qTnx8cj+iilV9qeUaSDORHUbOad9MKzhFUCNcCuixuYewa8KmmEPidItcyKoUgRh/e8LSrNj0psB+P/6w=
X-Received: by 2002:a2e:6e01:: with SMTP id j1mr12699356ljc.135.1559546829996;
 Mon, 03 Jun 2019 00:27:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190411124102.22442-1-spapageorgiou@de.adit-jv.com>
 <CAMuHMdVfDd_1gHnX=WvkHnF33fG2sWy7F5bTh-DghoKSt-vLCA@mail.gmail.com> <20190531152522.GB28755@vmlxhi-102.adit-jv.com>
In-Reply-To: <20190531152522.GB28755@vmlxhi-102.adit-jv.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 3 Jun 2019 09:26:57 +0200
Message-ID: <CAMuHMdXbx=-zrY-6iJeJLH1XS38GSr0m_rUMmA7wHjwi_a=cWw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: ulcb-kf: Add support for TI WL1837
To:     Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     Spyridon Papageorgiou <spapageorgiou@de.adit-jv.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tobias Franzen <tfranzen@de.adit-jv.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Eugeniu,

On Fri, May 31, 2019 at 5:25 PM Eugeniu Rosca <erosca@de.adit-jv.com> wrote:
> On Tue, May 28, 2019 at 11:19:04AM +0200, Geert Uytterhoeven wrote:
> [..]
> > > +       wlan_en: regulator-wlan_en {
> > > +               compatible = "regulator-fixed";
> > > +               regulator-name = "wlan-en-regulator";
> > > +
> > > +               regulator-min-microvolt = <3300000>;
> > > +               regulator-max-microvolt = <3300000>;
> >
> > So this is a 3.3V regulator...
> >
> > > +
> > > +               gpio = <&gpio_exp_74 4 GPIO_ACTIVE_HIGH>;
> > > +               startup-delay-us = <70000>;
> > > +               enable-active-high;
> > > +       };
> > >  };
> > >
> > >  &can0 {
> >
> > > @@ -273,6 +298,30 @@
> > >         status = "okay";
> > >  };
> > >
> > > +&sdhi3 {
> > > +       pinctrl-0 = <&sdhi3_pins>;
> > > +       pinctrl-names = "default";
> > > +
> > > +       vmmc-supply = <&wlan_en>;
> > > +       vqmmc-supply = <&wlan_en>;
> >
> > ... used for both card and I/O line power...
> >
> > > +       bus-width = <4>;
> > > +       no-1-8-v;
> >
> > ... hence no 1.8V I/O.
> >
> > However, VIO of WL1837 is provided by W1.8V of regulator U55,
> > which is 1.8V?
>
> Looking at the KF-M06 schematics, it seems like the SDIO-relevant lines
> of WL1837 (U52) are interfaced with the SoC via TXS0108EPWR (U57) which
> is there to level-translate from 3.3v (SoC) to 1.8v (WL1837). So,
> from SoC perspective, it looks like the lines are 3.3v-powered.
>
> FTR, the test results are independent on the 'no-1-8-v' property.

Sorry for not noticing the level translator.
So indeed, the WL1837 side is always at 1.8V.
But I believe the SoC side can be either 1.8V or 3.3V, as the level-translator
can handle both, which is confirmed by your testing.

> > > +       non-removable;
> > > +       cap-power-off-card;
> > > +       keep-power-in-suspend;
> > > +       max-frequency = <26000000>;
> > > +       status = "okay";
> > > +
> > > +       #address-cells = <1>;
> > > +       #size-cells = <0>;
> > > +       wlcore: wlcore@2 {
> > > +               compatible = "ti,wl1837";
> > > +               reg = <2>;
> > > +               interrupt-parent = <&gpio1>;
> > > +               interrupts = <25 IRQ_TYPE_EDGE_FALLING>;
> >
> > I'm also a bit puzzled by the interrupt type.
> > On Cat 874, it's IRQ_TYPE_LEVEL_HIGH, cfr.
> > https://lore.kernel.org/linux-renesas-soc/1557997166-63351-2-git-send-email-biju.das@bp.renesas.com/
> >
> > On Kingfisher, the IRQ signal is inverted by U104, so I'd expect
> > IRQ_TYPE_LEVEL_LOW instead of IRQ_TYPE_EDGE_FALLING?
>
> That's an insightful comment, if it simply arose from code review.
> I guess we mistakenly relied on [1] during our testing on linux/master.
> So, we definitely have to re-spin the patch to make it independent
> on [1]. The problem is that by dropping [1] and switching from
> IRQ_TYPE_EDGE_FALLING to IRQ_TYPE_LEVEL_LOW, the wifi testing
> (particularly 'iwlist wlan0 scan') doesn't pass. We have to give
> another thought how to best tackle it.
>
> [1] https://github.com/CogentEmbedded/meta-rcar/blob/289fbd4f8354/meta-rcar-gen3-adas/recipes-kernel/linux/linux-renesas/0024-wl18xx-do-not-invert-IRQ-on-WLxxxx-side.patch

Perhaps some configuration in the WL driver may be involved?
It looks like all other DTSes use IRQ_TYPE_LEVEL_HIGH, except for
HiKey 960/970, which use IRQ_TYPE_EDGE_RISING.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
