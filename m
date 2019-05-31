Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF0B63113F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 May 2019 17:25:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726531AbfEaPZd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 31 May 2019 11:25:33 -0400
Received: from smtp1.de.adit-jv.com ([93.241.18.167]:54883 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726037AbfEaPZd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 31 May 2019 11:25:33 -0400
Received: from localhost (smtp1.de.adit-jv.com [127.0.0.1])
        by smtp1.de.adit-jv.com (Postfix) with ESMTP id E99063C0149;
        Fri, 31 May 2019 17:25:29 +0200 (CEST)
Received: from smtp1.de.adit-jv.com ([127.0.0.1])
        by localhost (smtp1.de.adit-jv.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id JaAOyY00n-fj; Fri, 31 May 2019 17:25:23 +0200 (CEST)
Received: from HI2EXCH01.adit-jv.com (hi2exch01.adit-jv.com [10.72.92.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by smtp1.de.adit-jv.com (Postfix) with ESMTPS id 06FB03C0022;
        Fri, 31 May 2019 17:25:23 +0200 (CEST)
Received: from vmlxhi-102.adit-jv.com (10.72.93.184) by HI2EXCH01.adit-jv.com
 (10.72.92.24) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 31 May
 2019 17:25:22 +0200
Date:   Fri, 31 May 2019 17:25:22 +0200
From:   Eugeniu Rosca <erosca@de.adit-jv.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Spyridon Papageorgiou <spapageorgiou@de.adit-jv.com>,
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
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>
Subject: Re: [PATCH] arm64: dts: ulcb-kf: Add support for TI WL1837
Message-ID: <20190531152522.GB28755@vmlxhi-102.adit-jv.com>
References: <20190411124102.22442-1-spapageorgiou@de.adit-jv.com>
 <CAMuHMdVfDd_1gHnX=WvkHnF33fG2sWy7F5bTh-DghoKSt-vLCA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAMuHMdVfDd_1gHnX=WvkHnF33fG2sWy7F5bTh-DghoKSt-vLCA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.72.93.184]
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

We appreciate your review comments.

On Tue, May 28, 2019 at 11:19:04AM +0200, Geert Uytterhoeven wrote:
[..]
> > +       wlan_en: regulator-wlan_en {
> > +               compatible = "regulator-fixed";
> > +               regulator-name = "wlan-en-regulator";
> > +
> > +               regulator-min-microvolt = <3300000>;
> > +               regulator-max-microvolt = <3300000>;
> 
> So this is a 3.3V regulator...
> 
> > +
> > +               gpio = <&gpio_exp_74 4 GPIO_ACTIVE_HIGH>;
> > +               startup-delay-us = <70000>;
> > +               enable-active-high;
> > +       };
> >  };
> >
> >  &can0 {
> 
> > @@ -273,6 +298,30 @@
> >         status = "okay";
> >  };
> >
> > +&sdhi3 {
> > +       pinctrl-0 = <&sdhi3_pins>;
> > +       pinctrl-names = "default";
> > +
> > +       vmmc-supply = <&wlan_en>;
> > +       vqmmc-supply = <&wlan_en>;
> 
> ... used for both card and I/O line power...
> 
> > +       bus-width = <4>;
> > +       no-1-8-v;
> 
> ... hence no 1.8V I/O.
> 
> However, VIO of WL1837 is provided by W1.8V of regulator U55,
> which is 1.8V?

Looking at the KF-M06 schematics, it seems like the SDIO-relevant lines
of WL1837 (U52) are interfaced with the SoC via TXS0108EPWR (U57) which
is there to level-translate from 3.3v (SoC) to 1.8v (WL1837). So,
from SoC perspective, it looks like the lines are 3.3v-powered.

FTR, the test results are independent on the 'no-1-8-v' property.

> > +       non-removable;
> > +       cap-power-off-card;
> > +       keep-power-in-suspend;
> > +       max-frequency = <26000000>;
> > +       status = "okay";
> > +
> > +       #address-cells = <1>;
> > +       #size-cells = <0>;
> > +       wlcore: wlcore@2 {
> > +               compatible = "ti,wl1837";
> > +               reg = <2>;
> > +               interrupt-parent = <&gpio1>;
> > +               interrupts = <25 IRQ_TYPE_EDGE_FALLING>;
> 
> I'm also a bit puzzled by the interrupt type.
> On Cat 874, it's IRQ_TYPE_LEVEL_HIGH, cfr.
> https://lore.kernel.org/linux-renesas-soc/1557997166-63351-2-git-send-email-biju.das@bp.renesas.com/
> 
> On Kingfisher, the IRQ signal is inverted by U104, so I'd expect
> IRQ_TYPE_LEVEL_LOW instead of IRQ_TYPE_EDGE_FALLING?

That's an insightful comment, if it simply arose from code review.
I guess we mistakenly relied on [1] during our testing on linux/master.
So, we definitely have to re-spin the patch to make it independent
on [1]. The problem is that by dropping [1] and switching from
IRQ_TYPE_EDGE_FALLING to IRQ_TYPE_LEVEL_LOW, the wifi testing
(particularly 'iwlist wlan0 scan') doesn't pass. We have to give
another thought how to best tackle it.

[1] https://github.com/CogentEmbedded/meta-rcar/blob/289fbd4f8354/meta-rcar-gen3-adas/recipes-kernel/linux/linux-renesas/0024-wl18xx-do-not-invert-IRQ-on-WLxxxx-side.patch

Thank you.

> 
> Apart from the above two comments:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
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

-- 
Best Regards,
Eugeniu.
