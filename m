Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06BA423FDBB
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  9 Aug 2020 12:55:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726242AbgHIKzI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 9 Aug 2020 06:55:08 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:40718 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726175AbgHIKzD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 9 Aug 2020 06:55:03 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 184B3F9;
        Sun,  9 Aug 2020 12:55:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1596970500;
        bh=mPbkGfnDTliVwwU2+EORHxOdGmDZeZXvtWa8AsWvnsk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bTiQ0u4GpDZqPorY9H4XtM0R3wMdBPBBf01xPC3N/TvXx4rQQZyBrFztSi3YV71Sm
         QoRJ0mxzS8YMGUqmy42Xwmps69GwdivF6yCf8Ck8BVrD+Notkl6Hx+C26v4ArP8P2w
         6pKe3foEkyDuMcqJKKZ3csHLMWcWFxph8JB5LdYw=
Date:   Sun, 9 Aug 2020 13:54:47 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] ARM: dts: iwg20d-q7-common: Fix touch controller probe
 failure
Message-ID: <20200809105447.GA5981@pendragon.ideasonboard.com>
References: <20200807152039.10961-1-biju.das.jz@bp.renesas.com>
 <20200808212858.GV6186@pendragon.ideasonboard.com>
 <TYBPR01MB530999E8AB697CB016E433D586470@TYBPR01MB5309.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <TYBPR01MB530999E8AB697CB016E433D586470@TYBPR01MB5309.jpnprd01.prod.outlook.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Sun, Aug 09, 2020 at 09:17:42AM +0000, Biju Das wrote:
> > Subject: Re: [PATCH] ARM: dts: iwg20d-q7-common: Fix touch controller
> > probe failure
> >
> > Hi Biju,
> >
> > Thank you for the patch.
> >
> > On Fri, Aug 07, 2020 at 04:20:38PM +0100, Biju Das wrote:
> > > Remove powerdown-gpios property from lvds-receiver node as it results
> > > in touch controller driver probe failure.
> > > As per the iWave RZ/G1M schematic, the signal LVDS_PPEN controls
> > > supply voltage for touch panel, LVDS receiver and RGB LCD panel.
> >
> > If it controls the supply voltage, shouldn't it be modelled as a regulator ?
> > Dropping it completely would rely on the boot loader powering the display
> > on and keeping it powered, which isn't very nice.
> 
> On the schematic LVDS_PPEN, controls the voltage VCC_3V3_TFT1, which supplies voltage to
> LVDS receiver, Touch controller and RGB LCD Panel.
> 
> I agree, it should be modelled as a regulator and this regulator should present in
> all these devices nodes right(LVDS receiver, Touch controller and RGB LCD Panel),
> not just on LVDS receiver node? Please share your views on this.

Correct, that's what I would recommend.

> > > Fixes: 6f89dd9e9325 ("ARM: dts: iwg20d-q7-common: Add LCD support")
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > Reviewed-by: Lad Prabhakar <prabhakar.mahadev-
> > lad.rj@bp.renesas.com>
> > > ---
> > >  arch/arm/boot/dts/iwg20d-q7-common.dtsi | 1 -
> > >  1 file changed, 1 deletion(-)
> > >
> > > diff --git a/arch/arm/boot/dts/iwg20d-q7-common.dtsi
> > > b/arch/arm/boot/dts/iwg20d-q7-common.dtsi
> > > index ebbe1518ef8a..4c8b9a6b0125 100644
> > > --- a/arch/arm/boot/dts/iwg20d-q7-common.dtsi
> > > +++ b/arch/arm/boot/dts/iwg20d-q7-common.dtsi
> > > @@ -57,7 +57,6 @@
> > >
> > >  lvds-receiver {
> > >  compatible = "ti,ds90cf384a", "lvds-decoder";
> > > -powerdown-gpios = <&gpio7 25 GPIO_ACTIVE_LOW>;
> > >
> > >  ports {
> > >  #address-cells = <1>;

-- 
Regards,

Laurent Pinchart
