Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8AE054B7F3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2019 14:18:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727068AbfFSMSN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Jun 2019 08:18:13 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:58832 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726246AbfFSMSN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jun 2019 08:18:13 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id EBC2225AF1B;
        Wed, 19 Jun 2019 22:18:10 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 9217A9409FF; Wed, 19 Jun 2019 14:18:08 +0200 (CEST)
Date:   Wed, 19 Jun 2019 14:18:08 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "xu_shunji@hoperun.com" <xu_shunji@hoperun.com>
Subject: Re: [PATCH] arm64: dts: renesas: hihope-common: Add LEDs support
Message-ID: <20190619121808.hnqoeihjch6silcd@verge.net.au>
References: <1560518075-2254-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdU8oag+1oNa_jS=v99W05=8SRLhdoZdCusmeVf1VZbarQ@mail.gmail.com>
 <TY1PR01MB17707C3C979FB60611FB34A7C0EA0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
 <CAMuHMdVb+sc0vdvbsAE0fkEY6wFS7KsbtqLmtB03ghVeuiHe1w@mail.gmail.com>
 <TY1PR01MB1770F9972F006B57917A0731C0E50@TY1PR01MB1770.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY1PR01MB1770F9972F006B57917A0731C0E50@TY1PR01MB1770.jpnprd01.prod.outlook.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jun 19, 2019 at 08:16:43AM +0000, Fabrizio Castro wrote:
> Hello Geert,
> 
> Thank you for your feedback
> 
> > From: linux-renesas-soc-owner@vger.kernel.org <linux-renesas-soc-owner@vger.kernel.org> On Behalf Of Geert Uytterhoeven
> > Sent: 19 June 2019 08:34
> > Subject: Re: [PATCH] arm64: dts: renesas: hihope-common: Add LEDs support
> > 
> > Hi Fabrizio,
> > 
> > On Tue, Jun 18, 2019 at 5:56 PM Fabrizio Castro
> > <fabrizio.castro@bp.renesas.com> wrote:
> > > > From: linux-renesas-soc-owner@vger.kernel.org <linux-renesas-soc-owner@vger.kernel.org> On Behalf Of Geert Uytterhoeven
> > > > Sent: 18 June 2019 16:10
> > > > Subject: Re: [PATCH] arm64: dts: renesas: hihope-common: Add LEDs support
> > > >
> > > > On Fri, Jun 14, 2019 at 3:17 PM Fabrizio Castro
> > > > <fabrizio.castro@bp.renesas.com> wrote:
> > > > > This patch adds LEDs support to the HiHope RZ/G2[MN] Main Board
> > > > > common device tree.
> > > > >
> > > > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > > >
> > > > Thanks for your patch!
> > > >
> > > > > --- a/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> > > > > +++ b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
> > > > > @@ -17,6 +17,30 @@
> > > > >                 stdout-path = "serial0:115200n8";
> > > > >         };
> > > > >
> > > > > +       leds {
> > > > > +               compatible = "gpio-leds";
> > > > > +
> > > > > +               led0 {
> > > > > +                       gpios = <&gpio6 11 GPIO_ACTIVE_HIGH>;
> > > > > +                       label = "LED0";
> > > >
> > > > There's no need for a label property, if it matches the node name
> > > > (applies to all four LEDs).
> > >
> > > I could have used the actual names on the schematic, but then I realised that
> > > would not have been too helpful due to the corresponding switch names:
> > > LED0 - GP6_11 - SW2202 - LED2201
> > > LED1 - GP6_12 - SW2201 - LED2202
> > > LED2 - GP6_13 - SW2203 - LED2203
> > > LED3 - GP0_00 - N/A - LED2402
> > > The first 3 LEDs are found next to the micro USB connector for the debug console,
> > > the forth LED is found next to the WiFi and BT LEDs.
> > >
> > > I thought that using "LEDn" as labels would put a remark on the
> > > "desired ordering" of the LEDs (even though there is no actual
> > > requirement for that), but as you pointed out it's probably a bit
> > > confusing? Do you think I should take the label out?
> > 
> > If the LEDs don't have nice labels on the PCB, I would drop the label
> > properties.
> 
> Will do. Simon, do you want me to send an incremental patch for this (this patch
> is on devel branch already) or would you rather I sent a v2?

Please send an incremental patch, thanks.
