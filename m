Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C5D1415448
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Sep 2021 01:56:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238576AbhIVX5e (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Sep 2021 19:57:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238505AbhIVX5e (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Sep 2021 19:57:34 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDFFEC061574;
        Wed, 22 Sep 2021 16:56:03 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 12089E52;
        Thu, 23 Sep 2021 01:56:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1632354962;
        bh=xt5a5frTZ4VAbHQhcId47xRLhbugeZ/AH58yn8Mv6WI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ATlK6e8eiFcYih2LQ4zAt7/OpHq+sg+QloUakcdgqNcZ/K+mDJdUwq/4MB5VZb9ou
         6FgW1Houaap1QzJE9nbvhFrG5cTx51D4OWFvQu1n0ga6l/uw+6lllDtkol18liubBU
         v6fhHan+4Gtya6+VUZzrVF97bwtW5zozhYFiYLDM=
Date:   Thu, 23 Sep 2021 02:56:00 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Geert Uytterhoeven <geert@glider.be>,
        linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/3] arm64: dts: renesas: falcon-cpu: Add DSI display
 output
Message-ID: <YUvCkA57x1VncKAV@pendragon.ideasonboard.com>
References: <20210901235330.1611086-1-kieran.bingham@ideasonboard.com>
 <20210901235330.1611086-4-kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210901235330.1611086-4-kieran.bingham@ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

Thank you for the patch.

On Thu, Sep 02, 2021 at 12:53:30AM +0100, Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> Provide the display output using the sn65dsi86 MIPI DSI bridge.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
>  .../boot/dts/renesas/r8a779a0-falcon-cpu.dtsi | 84 +++++++++++++++++++
>  1 file changed, 84 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
> index a0a1a1da0d87..5530bb82de6b 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
> @@ -66,6 +66,15 @@ memory@700000000 {
>  		reg = <0x7 0x00000000 0x0 0x80000000>;
>  	};
>  
> +	reg_1p2v: regulator-1p2v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "fixed-1.2V";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;

1.8V is a weird voltage for a 1.2V regulator :-)

> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
>  	reg_1p8v: regulator-1p8v {
>  		compatible = "regulator-fixed";
>  		regulator-name = "fixed-1.8V";
> @@ -83,6 +92,46 @@ reg_3p3v: regulator-3p3v {
>  		regulator-boot-on;
>  		regulator-always-on;
>  	};
> +
> +	mini-dp-con {
> +		compatible = "dp-connector";
> +		label = "CN5";
> +		type = "mini";
> +
> +		port {
> +			mini_dp_con_in: endpoint {
> +				remote-endpoint = <&sn65dsi86_out>;
> +			};
> +		};
> +	};
> +
> +	sn65dsi86_refclk: sn65dsi86-refclk {

I'd name the node x6-clk after the components on the board (or clk-x6).
The label can stay the same, up to you.

> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <38400000>;
> +	};
> +};
> +
> +&dsi0 {
> +	status = "okay";
> +
> +	clocks = <&cpg CPG_MOD 415>,
> +		 <&cpg CPG_CORE R8A779A0_CLK_DSI>,
> +		 <&extal_clk>;
> +	clock-names = "fck", "dsi", "extal";

As discussed separately, this should go to r8a79a0.dtsi, and the last
clock should be named "pll".

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
> +	ports {
> +		port@1 {
> +			endpoint {
> +				remote-endpoint = <&sn65dsi86_in>;
> +				data-lanes = <1 2 3 4>;
> +			};
> +		};
> +	};
> +};
> +
> +&du {
> +	status = "okay";
>  };
>  
>  &extal_clk {
> @@ -114,6 +163,41 @@ &i2c1 {
>  
>  	status = "okay";
>  	clock-frequency = <400000>;
> +
> +	sn65dsi86@2c {
> +		compatible = "ti,sn65dsi86";
> +		reg = <0x2c>;
> +
> +		clocks = <&sn65dsi86_refclk>;
> +		clock-names = "refclk";
> +
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <24 IRQ_TYPE_LEVEL_HIGH>;
> +
> +		vccio-supply = <&reg_1p8v>;
> +		vpll-supply = <&reg_1p8v>;
> +		vcca-supply = <&reg_1p2v>;
> +		vcc-supply = <&reg_1p2v>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				sn65dsi86_in: endpoint {
> +					remote-endpoint = <&dsi0_out>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +				sn65dsi86_out: endpoint {
> +					remote-endpoint = <&mini_dp_con_in>;
> +				};
> +			};
> +		};
> +	};
>  };
>  
>  &i2c6 {

-- 
Regards,

Laurent Pinchart
