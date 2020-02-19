Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B401164977
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Feb 2020 17:07:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726756AbgBSQHB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Feb 2020 11:07:01 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:37544 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726715AbgBSQHB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Feb 2020 11:07:01 -0500
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9778A52B;
        Wed, 19 Feb 2020 17:06:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1582128418;
        bh=rJBM2Gnp8sGsg4UIZMvUb7h2wsW/k0LNeeSa2VfEEa4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VrkdB72GClhJCGPFukl1RsMjTQgw+Uz3H/bdlKKwOevD1SmVjL/yq0IItfutggc1Y
         npftcZQMgILD6IbF+Xcwtfw7XSq1/Y9PKw36ig7W0hkLlLaQhZUKFDWK4JgbPub+3g
         SjTC+SMHv04cVImPMuHlNIlvZvjO7f0PfL24RWeo=
Date:   Wed, 19 Feb 2020 18:06:40 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 3/4] arm64: dts: renesas: rcar-gen3: Add reset control
 properties for display
Message-ID: <20200219160640.GY5070@pendragon.ideasonboard.com>
References: <20200218133019.22299-1-geert+renesas@glider.be>
 <20200218133019.22299-4-geert+renesas@glider.be>
 <20200219153339.GT5070@pendragon.ideasonboard.com>
 <CAMuHMdUjVqC=AsNjO1icMyNRrdeMVed_HxMzn6HY=fRt+LvUwQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdUjVqC=AsNjO1icMyNRrdeMVed_HxMzn6HY=fRt+LvUwQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On Wed, Feb 19, 2020 at 04:55:52PM +0100, Geert Uytterhoeven wrote:
> On Wed, Feb 19, 2020 at 4:33 PM Laurent Pinchart wrote:
> > On Tue, Feb 18, 2020 at 02:30:18PM +0100, Geert Uytterhoeven wrote:
> > > Add reset control properties to the device nodes for the Display Units
> > > on all supported R-Car Gen3 SoCs.  Note that on these SoCs, there is
> > > only a single reset for each pair of DU channels.
> > >
> > > The display nodes on R-Car V3M and V3H already had "resets" properties,
> > > but lacked the corresponding "reset-names" properties.
> > >
> > > Join the clocks lines while at it, to increase uniformity.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> > > --- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> > > @@ -2503,10 +2503,11 @@
> > >                       interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
> > >                                    <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
> > >                                    <GIC_SPI 270 IRQ_TYPE_LEVEL_HIGH>;
> > > -                     clocks = <&cpg CPG_MOD 724>,
> > > -                              <&cpg CPG_MOD 723>,
> > > +                     clocks = <&cpg CPG_MOD 724>, <&cpg CPG_MOD 723>,
> > >                                <&cpg CPG_MOD 721>;
> > >                       clock-names = "du.0", "du.1", "du.3";
> > > +                     resets = <&cpg 724>, <&cpg 722>;
> > > +                     reset-names = "du.0", "du.3";
> >
> > I wonder if this should be du.2, especially given that 722 corresponds
> > to the non-existing DU2 channel. It's a bit of a mess at the hardware
> 
> Just following the bindings: "du.3" is the lowest channel that is affected
> by the reset.

Yes I was looking at that, and replied to the DT bindings patch. If the
outcome of the discussion there is to keep the bindings as-is, you can
have my

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

for this whole series.

> > level :-S
> 
> Note that supporting R-Car H3-N will make your^H^H^H^Hthe rcar-du device
> driver writer's life even more miserable, as suddenly there is no longer
> a DU2, while the single unified Display Unit node prevents the DTS
> writer from not setting the DU2's status to "okay" in the board DTS
> file. But you might look at the ports submode?

This will require a separate compatible string I'm afraid.

-- 
Regards,

Laurent Pinchart
