Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16F494153FD
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Sep 2021 01:40:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230159AbhIVXll (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Sep 2021 19:41:41 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33010 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230145AbhIVXll (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Sep 2021 19:41:41 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0FF24E52;
        Thu, 23 Sep 2021 01:40:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1632354009;
        bh=gJac9EwI/a236I+4gT7/6CxMN/VTnbwyibB6JDZnL5k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IH7gGoI1HkWPYu+ZzvtXd6P6WKWdHjwKBqPOasrNkpBFgZ37PWGr89J0owK0RhhGS
         C0n6dHTLcqySJLeppWwOTW5Q8F+FsxMA9IkfyIXRUIHgAy/KjKsQ4OndXuWY9a0VwU
         unPRjNs2CxMfTC1cb2AFPYZkj0D10Hwe5SNtGaLg=
Date:   Thu, 23 Sep 2021 02:40:07 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] arm64: dts: renesas: falcon-cpu: Add DSI display
 output
Message-ID: <YUu+14+9DnQZM7SE@pendragon.ideasonboard.com>
References: <20210901235330.1611086-1-kieran.bingham@ideasonboard.com>
 <20210901235330.1611086-4-kieran.bingham@ideasonboard.com>
 <CAMuHMdU5WzvdfeSqEESt0r7_7XX0Mc9jRNGCBHLtt_JCMCWZyw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdU5WzvdfeSqEESt0r7_7XX0Mc9jRNGCBHLtt_JCMCWZyw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello,

On Tue, Sep 21, 2021 at 05:59:24PM +0200, Geert Uytterhoeven wrote:
> On Thu, Sep 2, 2021 at 1:53 AM Kieran Bingham wrote:
> > From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> >
> > Provide the display output using the sn65dsi86 MIPI DSI bridge.
> >
> > Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> Thanks for your patch!
> 
> > --- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
> > @@ -66,6 +66,15 @@ memory@700000000 {
> >                 reg = <0x7 0x00000000 0x0 0x80000000>;
> >         };
> >
> > +       reg_1p2v: regulator-1p2v {
> > +               compatible = "regulator-fixed";
> > +               regulator-name = "fixed-1.2V";
> > +               regulator-min-microvolt = <1800000>;
> > +               regulator-max-microvolt = <1800000>;
> > +               regulator-boot-on;
> > +               regulator-always-on;
> > +       };
> > +
> >         reg_1p8v: regulator-1p8v {
> >                 compatible = "regulator-fixed";
> >                 regulator-name = "fixed-1.8V";
> > @@ -83,6 +92,46 @@ reg_3p3v: regulator-3p3v {
> >                 regulator-boot-on;
> >                 regulator-always-on;
> >         };
> > +
> > +       mini-dp-con {
> > +               compatible = "dp-connector";
> > +               label = "CN5";
> > +               type = "mini";
> > +
> > +               port {
> > +                       mini_dp_con_in: endpoint {
> > +                               remote-endpoint = <&sn65dsi86_out>;
> > +                       };
> > +               };
> > +       };
> > +
> > +       sn65dsi86_refclk: sn65dsi86-refclk {
> > +               compatible = "fixed-clock";
> > +               #clock-cells = <0>;
> > +               clock-frequency = <38400000>;
> > +       };
> > +};
> > +
> > +&dsi0 {
> > +       status = "okay";
> > +
> > +       clocks = <&cpg CPG_MOD 415>,
> > +                <&cpg CPG_CORE R8A779A0_CLK_DSI>,
> > +                <&extal_clk>;
> > +       clock-names = "fck", "dsi", "extal";
> 
> Ah, that's where the third clock was hiding ;-)
> 
> Is this hardwired to extal, or board-specific?
> In case of the former, I think it should be moved to the .dtsi.

I think this is actually incorrect. The clock name, according to the
bindings, is "pll", and it's documented as a 16.66MHz PLL reference
clock. It comes from the CPG, but I'm not sure which clock it actually
is.

-- 
Regards,

Laurent Pinchart
