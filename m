Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C4E873BB56
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 Jun 2023 17:14:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231145AbjFWPOb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 23 Jun 2023 11:14:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231824AbjFWPOO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Jun 2023 11:14:14 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCC9030D4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 23 Jun 2023 08:12:40 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0D2DF838;
        Fri, 23 Jun 2023 17:12:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1687533121;
        bh=A8s6RPOwSA1qcwYSWZm7k9neMiH8DvcwoArbydCFD1Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=broDiz2EUdog+ueoN3E3PcKcsMCZwEBKJFaM9awyfv3978p2T3SPzGvW7+P8sSzLo
         20VPo131MxsJt1K+V9nqUFwB7ozRESaMunG213kJvV7nTqfiMdi3Tn0c8pHMK1zjgt
         M5FaUJHMlZALPLNDMugyd1QJvc+OJj5CKXjqXBwM=
Date:   Fri, 23 Jun 2023 18:12:36 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] ARM: dts: r8a7740: Add LCDC nodes
Message-ID: <20230623151236.GM2112@pendragon.ideasonboard.com>
References: <cover.1687417585.git.geert+renesas@glider.be>
 <1994a9c58321667733d7cd7500d7e25d30308498.1687417585.git.geert+renesas@glider.be>
 <20230623130318.GA2112@pendragon.ideasonboard.com>
 <CAMuHMdU8Pc3oJGkoN5RiQFhXtqnmYa3jheS-FMO7G7SQPTtmHg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdU8Pc3oJGkoN5RiQFhXtqnmYa3jheS-FMO7G7SQPTtmHg@mail.gmail.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jun 23, 2023 at 05:07:44PM +0200, Geert Uytterhoeven wrote:
> On Fri, Jun 23, 2023 at 3:03 PM Laurent Pinchart wrote:
> > On Thu, Jun 22, 2023 at 11:23:14AM +0200, Geert Uytterhoeven wrote:
> > > Add device nodes for the two LCD Controllers (LCDC) on the R-Mobile A1
> > > SoC, and for the two optional external LCDL clock inputs.
> > >
> > > Note that the HDMI clock for LCDC1 is not added, as this clock is not
> > > yet supported.
> > >
> > > Based on a patch by Laurent Pinchart adding the first LCDC device node.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > ---
> > > Changes compared to Laurent's original:
> > >   - Add lcdc0 label,
> > >   - Rename node from display to lcdc-controller,
> > >   - Rename compatible value from "renesas,lcdc-r8a7740" to
> > >     "renesas,r8a7740-lcdc",
> > >   - Correct syntax of reg property,
> > >   - Use GIC_SPI macro,
> > >   - Add more clocks,
> > >   - Add power-domains property,
> > >   - Add status disabled,
> > >   - Remove second port from lcdc0, as only lcdc1 has an HDMI port,
> > >   - Add lcdc1 device node.
> > > ---
> > >  arch/arm/boot/dts/r8a7740.dtsi | 65 ++++++++++++++++++++++++++++++++++
> > >  1 file changed, 65 insertions(+)
> > >
> > > diff --git a/arch/arm/boot/dts/r8a7740.dtsi b/arch/arm/boot/dts/r8a7740.dtsi
> > > index 1b2cf5fa322b2985..55884ec701f8dab4 100644
> > > --- a/arch/arm/boot/dts/r8a7740.dtsi
> > > +++ b/arch/arm/boot/dts/r8a7740.dtsi
> > > @@ -398,6 +398,61 @@ sh_fsi2: sound@fe1f0000 {
> > >               status = "disabled";
> > >       };
> > >
> > > +     lcdc0: lcd-controller@fe940000 {
> > > +             compatible = "renesas,r8a7740-lcdc";
> > > +             reg = <0xfe940000 0x4000>;
> > > +             interrupts = <GIC_SPI 177 IRQ_TYPE_LEVEL_HIGH>;
> > > +             clocks = <&mstp1_clks R8A7740_CLK_LCDC0>,
> > > +                      <&cpg_clocks R8A7740_CLK_M3>, <&lcdlclk0_clk>,
> > > +                      <&vou_clk>;
> > > +             clock-names = "fck", "media", "lclk", "video";
> > > +             power-domains = <&pd_a4lc>;
> > > +             status = "disabled";
> > > +
> > > +             ports {
> > > +                     #address-cells = <1>;
> > > +                     #size-cells = <0>;
> > > +
> > > +                     port@0 {
> > > +                             reg = <0>;
> > > +
> > > +                             lcdc0_rgb: endpoint {
> > > +                             };
> > > +                     };
> > > +             };
> > > +     };
> > > +
> > > +     lcdc1: lcd-controller@fe944000 {
> > > +             compatible = "renesas,r8a7740-lcdc";
> > > +             reg = <0xfe944000 0x4000>;
> > > +             interrupts = <GIC_SPI 178 IRQ_TYPE_LEVEL_HIGH>;
> > > +             clocks = <&mstp1_clks R8A7740_CLK_LCDC1>,
> > > +                      <&cpg_clocks R8A7740_CLK_M3>, <&lcdlclk1_clk>,
> > > +                      <&vou_clk>;
> > > +             clock-names = "fck", "media", "lclk", "video";
> > > +             power-domains = <&pd_a4lc>;
> > > +             status = "disabled";
> > > +
> > > +             ports {
> > > +                     #address-cells = <1>;
> > > +                     #size-cells = <0>;
> > > +
> > > +                     port@0 {
> > > +                             reg = <0>;
> > > +
> > > +                             lcdc1_rgb: endpoint {
> > > +                             };
> > > +                     };
> > > +
> > > +                     port@1 {
> > > +                             reg = <1>;
> > > +
> > > +                             lcdc1_hdmi: endpoint {
> > > +                             };
> > > +                     };
> > > +             };
> > > +     };
> > > +
> > >       tmu0: timer@fff80000 {
> > >               compatible = "renesas,tmu-r8a7740", "renesas,tmu";
> > >               reg = <0xfff80000 0x2c>;
> > > @@ -474,6 +529,16 @@ fsibck_clk: fsibck {
> > >                       #clock-cells = <0>;
> > >                       clock-frequency = <0>;
> > >               };
> > > +             lcdlclk0_clk: lcdlclk0 {
> > > +                     compatible = "fixed-clock";
> > > +                     #clock-cells = <0>;
> > > +                     clock-frequency = <0>;
> > > +             };
> > > +             lcdlclk1_clk: lcdlclk1 {
> > > +                     compatible = "fixed-clock";
> > > +                     #clock-cells = <0>;
> > > +                     clock-frequency = <0>;
> > > +             };
> >
> > The clock frequency seems quite low :-) As far as I understand, there
> > are the clocks fed to the external LCDLCLK pins. They belong to the
> > board DTS, not here. If a board doesn't provide an external clock, the
> > clock should simply be ommitted. The driver must thus treat it as
> > optional.
> 
> Usually, we do provide clock nodes with a zero rate in the SoC-specific
> .dtsi for optional clocks.

Who is "we" ? Is that a kernel-wide practice ? For rcar-du that's not
the case as far as I can tell.

-- 
Regards,

Laurent Pinchart
