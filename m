Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85EE230BBA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 May 2019 11:37:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726275AbfEaJhH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 31 May 2019 05:37:07 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:44208 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726232AbfEaJhH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 31 May 2019 05:37:07 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id E521425AE77;
        Fri, 31 May 2019 19:37:04 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id E95FB9401DB; Fri, 31 May 2019 11:37:02 +0200 (CEST)
Date:   Fri, 31 May 2019 11:37:02 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Spyridon Papageorgiou <spapageorgiou@de.adit-jv.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Tobias Franzen <tfranzen@de.adit-jv.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH] arm64: dts: ulcb-kf: Add support for TI WL1837
Message-ID: <20190531093702.4pdbamghomqdhhuq@verge.net.au>
References: <20190411124102.22442-1-spapageorgiou@de.adit-jv.com>
 <CAMuHMdVfDd_1gHnX=WvkHnF33fG2sWy7F5bTh-DghoKSt-vLCA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVfDd_1gHnX=WvkHnF33fG2sWy7F5bTh-DghoKSt-vLCA@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Spyridon,

please respond to Geert's review below and
if appropriate provide an incremental patch.

Thanks in advance,
Simon

On Tue, May 28, 2019 at 11:19:04AM +0200, Geert Uytterhoeven wrote:
> Hi Spyridon,
> 
> On Thu, Apr 11, 2019 at 2:42 PM Spyridon Papageorgiou
> <spapageorgiou@de.adit-jv.com> wrote:
> > This patch adds description of TI WL1837 and links interfaces
> > to communicate with the IC, namely the SDIO interface to WLAN.
> >
> > Signed-off-by: Spyridon Papageorgiou <spapageorgiou@de.adit-jv.com>
> 
> Thanks for your patch!
> 
> > --- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> > @@ -38,6 +38,18 @@
> >                 regulator-min-microvolt = <5000000>;
> >                 regulator-max-microvolt = <5000000>;
> >         };
> > +
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
> 
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
> 
