Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 804CA634503
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Nov 2022 20:56:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234670AbiKVT4d (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Nov 2022 14:56:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234693AbiKVTz7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Nov 2022 14:55:59 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A9DBB4804;
        Tue, 22 Nov 2022 11:55:25 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D5FCD1180;
        Tue, 22 Nov 2022 20:55:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669146924;
        bh=WzSIMsYU/d0WawMrnTfWGlU2lh42HVvfA1ZXrsZQ8Vo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZjYdwgMsbM8ZAaPlzEDK2CdVIx6eK0fFuLDugYhF3gP6vzmzs8smoGxsGli7mWQOP
         EMKEKdts/wzBrmMOMz4nLcbkh5v/S32IDK3icQhWFkx9VdSfafCod/sj/SVFPnH1jh
         7ei384tPz5nsrKmd/S1YbPgr6eT6DJLMeVfNiEPw=
Date:   Tue, 22 Nov 2022 21:55:08 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: renesas: rzg2l-smarc: Enable ADV7535 on
 carrier board
Message-ID: <Y30pHOylptuMxFgX@pendragon.ideasonboard.com>
References: <20221122185802.1853648-1-biju.das.jz@bp.renesas.com>
 <Y30j7Q6Jc/y8mGTu@pendragon.ideasonboard.com>
 <OS0PR01MB59224A76B83B9A2318A8D4E9860D9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <OS0PR01MB59224A76B83B9A2318A8D4E9860D9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Tue, Nov 22, 2022 at 07:41:13PM +0000, Biju Das wrote:
> > Subject: Re: [PATCH] arm64: dts: renesas: rzg2l-smarc: Enable ADV7535 on
> > carrier board
> > 
> > Hi Biju,
> > 
> > Thank you for the patch.
> > 
> > On Tue, Nov 22, 2022 at 06:58:02PM +0000, Biju Das wrote:
> > > Enable ADV7535 (MIPI DSI Receiver with HDMI Transmitter) on RZ/G2L
> > > SMARC EVK.
> > >
> > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > >  arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi | 44
> > > ++++++++++++++++++++
> > >  1 file changed, 44 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
> > > b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
> > > index e180a955b6ac..01ea8759c192 100644
> > > --- a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
> > > @@ -16,12 +16,56 @@ aliases {
> > >  		serial1 = &scif2;
> > >  		i2c3 = &i2c3;
> > >  	};
> > > +
> > > +	hdmi-out {
> > > +		compatible = "hdmi-connector";
> > > +		type = "d";
> > > +
> > > +		port {
> > > +			hdmi_con_out: endpoint {
> > > +				remote-endpoint = <&adv7535_out>;
> > > +			};
> > > +		};
> > > +	};
> > >  };
> > >
> > >  &cpu_dai {
> > >  	sound-dai = <&ssi0>;
> > >  };
> > >
> > > +&i2c1 {
> > > +	pinctrl-0 = <&i2c1_pins>;
> > > +	pinctrl-names = "default";
> > > +
> > > +	status = "okay";
> > > +
> > > +	adv7535: hdmi@3d {
> > > +		compatible = "adi,adv7535";
> > > +		reg = <0x3d>;
> > > +
> > > +		avdd-supply = <&reg_1p8v>;
> > > +		dvdd-supply = <&reg_1p8v>;
> > > +		pvdd-supply = <&reg_1p8v>;
> > > +		a2vdd-supply = <&reg_1p8v>;
> > > +		v3p3-supply = <&reg_3p3v>;
> > > +		v1p2-supply = <&reg_1p8v>;
> > > +
> > > +		adi,dsi-lanes = <4>;
> > > +
> > > +		ports {
> > > +			#address-cells = <1>;
> > > +			#size-cells = <0>;
> > > +
> > 
> > How about port@0 ? That's the DSI input, I expect it should be connected
> > to the DSI encoder output.
> 
> Yes, I will enable DSI node and link with port@0.  Since both RZ/G2L and RZ/V2L
> uses same Carrier board, I need to send binding patch for RZ/V2L.
> 
> dts Patches for enabling DSI for RZ/G2L ready. But V2L there is dependency on bindings.
> 
> If you prefer both ports together, then I can defer this later.

It could be easier to review (not to mention testing). I'll let Geert
decide.

> > > +			port@1 {
> > > +				reg = <1>;
> > > +				adv7535_out: endpoint {
> > > +					remote-endpoint = <&hdmi_con_out>;
> > > +				};
> > > +			};
> > > +		};
> > > +	};
> > > +};
> > > +
> > >  &i2c3 {
> > >  	pinctrl-0 = <&i2c3_pins>;
> > >  	pinctrl-names = "default";

-- 
Regards,

Laurent Pinchart
