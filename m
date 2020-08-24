Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45AFB24F0C3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Aug 2020 02:48:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727785AbgHXAsm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 23 Aug 2020 20:48:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726765AbgHXAsm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 23 Aug 2020 20:48:42 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1D3AC061573;
        Sun, 23 Aug 2020 17:48:41 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CB42A574;
        Mon, 24 Aug 2020 02:48:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1598230115;
        bh=ryNzcXvNsJKYK/OQb++1UxH4IT6WEkYbalwybh0p+gE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UIys7+tZMa/i/2BGw+7Bqfa9MDCJUNdU9Y6zjFKg5+enEVMLEO686OANUZrs6cluq
         GSBSH0LWBq3eWNE53eBoCefFf9xJk37PYwDZ5RmyBeodCuV9LUpNzdPB9oa22OMUWH
         x2wrZAQN+QYT9OFhr+PY9Sd9YkY/knX66S1hMLyE=
Date:   Mon, 24 Aug 2020 03:48:16 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH v2] ARM: dts: r8a7742-iwg21d-q7: Add LCD support
Message-ID: <20200824004816.GS6002@pendragon.ideasonboard.com>
References: <20200813140041.5082-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200813140041.5082-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

Thank you for the patch.

On Thu, Aug 13, 2020 at 03:00:41PM +0100, Lad Prabhakar wrote:
> The iwg21d comes with a 7" capacitive touch screen, therefore
> add support for it.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>

Everything seems to match the schematics :-)

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> v1->v2
> * This patch is part of series [1] (rest of the patches have be accepted
>   by Geert [2]).
> * Added regulator for lvds
> * Added reset pin for touchpanel
> * This patch is based on series [3]
> 
> [1] https://patchwork.kernel.org/project/linux-renesas-soc/list/
>     ?series=330277
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/geert/
>     renesas-devel.git/log/?h=renesas-arm-dt-for-v5.10
> [3] https://patchwork.kernel.org/project/linux-renesas-soc/list/
>     ?series=330957
> ---
>  arch/arm/boot/dts/r8a7742-iwg21d-q7.dts | 99 +++++++++++++++++++++++++
>  1 file changed, 99 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts b/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
> index b3461a61a4bf..9bf4fbd9c736 100644
> --- a/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
> +++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
> @@ -30,6 +30,7 @@
>  
>  /dts-v1/;
>  #include "r8a7742-iwg21m.dtsi"
> +#include <dt-bindings/pwm/pwm.h>
>  
>  / {
>  	model = "iWave Systems RainboW-G21D-Qseven board based on RZ/G1H";
> @@ -52,6 +53,51 @@
>  		clock-frequency = <26000000>;
>  	};
>  
> +	lcd_backlight: backlight {
> +		compatible = "pwm-backlight";
> +		pwms = <&tpu 2 5000000 0>;
> +		brightness-levels = <0 4 8 16 32 64 128 255>;
> +		pinctrl-0 = <&backlight_pins>;
> +		pinctrl-names = "default";
> +		default-brightness-level = <7>;
> +		enable-gpios = <&gpio3 11 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	lvds-receiver {
> +		compatible = "ti,ds90cf384a", "lvds-decoder";
> +		vcc-supply = <&vcc_3v3_tft1>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				lvds_receiver_in: endpoint {
> +					remote-endpoint = <&lvds0_out>;
> +				};
> +			};
> +			port@1 {
> +				reg = <1>;
> +				lvds_receiver_out: endpoint {
> +					remote-endpoint = <&panel_in>;
> +				};
> +			};
> +		};
> +	};
> +
> +	panel {
> +		compatible = "edt,etm0700g0dh6";
> +		backlight = <&lcd_backlight>;
> +		power-supply = <&vcc_3v3_tft1>;
> +
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&lvds_receiver_out>;
> +			};
> +		};
> +	};
> +
>  	reg_1p5v: 1p5v {
>  		compatible = "regulator-fixed";
>  		regulator-name = "1P5V";
> @@ -75,6 +121,17 @@
>  		};
>  	};
>  
> +	vcc_3v3_tft1: regulator-panel {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "vcc-3v3-tft1";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		enable-active-high;
> +		startup-delay-us = <500>;
> +		gpio = <&gpio5 28 GPIO_ACTIVE_HIGH>;
> +	};
> +
>  	vcc_sdhi2: regulator-vcc-sdhi2 {
>  		compatible = "regulator-fixed";
>  
> @@ -129,12 +186,34 @@
>  		VDDIO-supply = <&reg_3p3v>;
>  		VDDD-supply = <&reg_1p5v>;
>  	};
> +
> +	touch: touchpanel@38 {
> +		compatible = "edt,edt-ft5406";
> +		reg = <0x38>;
> +		interrupt-parent = <&gpio0>;
> +		interrupts = <24 IRQ_TYPE_EDGE_FALLING>;
> +		/* GP1_29 is also shared with audio codec reset pin */
> +		reset-gpios = <&gpio1 29 GPIO_ACTIVE_LOW>;
> +		vcc-supply = <&vcc_3v3_tft1>;
> +	};
>  };
>  
>  &cmt0 {
>  	status = "okay";
>  };
>  
> +&du {
> +	status = "okay";
> +};
> +
> +&gpio0 {
> +	touch-interrupt {
> +		gpio-hog;
> +		gpios = <24 GPIO_ACTIVE_LOW>;
> +		input;
> +	};
> +};
> +
>  &hsusb {
>  	pinctrl-0 = <&usb0_pins>;
>  	pinctrl-names = "default";
> @@ -165,6 +244,11 @@
>  		function = "avb";
>  	};
>  
> +	backlight_pins: backlight {
> +		groups = "tpu0_to2";
> +		function = "tpu0";
> +	};
> +
>  	i2c2_pins: i2c2 {
>  		groups = "i2c2_b";
>  		function = "i2c2";
> @@ -208,6 +292,17 @@
>  	};
>  };
>  
> +&lvds0 {
> +	status = "okay";
> +	ports {
> +		port@1 {
> +			lvds0_out: endpoint {
> +				remote-endpoint = <&lvds_receiver_in>;
> +			};
> +		};
> +	};
> +};
> +
>  &rcar_sound {
>  	pinctrl-0 = <&sound_pins>;
>  	pinctrl-names = "default";
> @@ -261,6 +356,10 @@
>  	shared-pin;
>  };
>  
> +&tpu {
> +	status = "okay";
> +};
> +
>  &usbphy {
>  	status = "okay";
>  };

-- 
Regards,

Laurent Pinchart
