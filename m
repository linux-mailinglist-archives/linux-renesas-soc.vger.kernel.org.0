Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38586100FB8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Nov 2019 01:11:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726911AbfKSALA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 18 Nov 2019 19:11:00 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:60834 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726809AbfKSALA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Nov 2019 19:11:00 -0500
Received: from pendragon.ideasonboard.com (unknown [38.98.37.142])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0C6AF563;
        Tue, 19 Nov 2019 01:10:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1574122258;
        bh=XFfX/G7NzxqQJnTAHlH2fQVX+Bu3b8f6Wws4eHPfM18=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZN+K8HElpgO7xbpEGcacnAQOAu2goym+RxZLiXaBlXjW6ello1hsY8LPZ7NWTt0Dq
         huHhazVuHL3u6G99lVTOPi+vldsHs36dVlRw8D+99k1pTcaMpVz2zfCm9oo0Pco3Wj
         lqKqgvCx6j5QcHBfdnrYbxGLaTxUDuvhUpocaBuY=
Date:   Tue, 19 Nov 2019 02:10:40 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Peter Rosin <peda@axentia.se>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: Re: [PATCH v4 10/13] ARM: dts: iwg20d-q7-common: Add LCD support
Message-ID: <20191119001040.GJ5171@pendragon.ideasonboard.com>
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1573660292-10629-11-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1573660292-10629-11-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Fabrizio,

Thank you for the patch.

On Wed, Nov 13, 2019 at 03:51:29PM +0000, Fabrizio Castro wrote:
> The iwg20d comes with a 7" capacitive touch screen, therefore
> add support for it.
> 
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I expect Geert to pick this up.

> ---
> v3->v4:
> * Reworked compatibility of DT node lvds-receiver
> * s/powerdown/powerdown-gpios/g in lvds-receiver
> * Reworked compatibility of DT node panel
> v2->v3:
> * No change
> v1->v2:
> * No change
> ---
>  arch/arm/boot/dts/iwg20d-q7-common.dtsi  | 85 ++++++++++++++++++++++++++++++++
>  arch/arm/boot/dts/iwg20d-q7-dbcm-ca.dtsi |  1 -
>  2 files changed, 85 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/iwg20d-q7-common.dtsi b/arch/arm/boot/dts/iwg20d-q7-common.dtsi
> index ae75a1db..ab5ae93 100644
> --- a/arch/arm/boot/dts/iwg20d-q7-common.dtsi
> +++ b/arch/arm/boot/dts/iwg20d-q7-common.dtsi
> @@ -46,6 +46,49 @@
>  		clock-frequency = <26000000>;
>  	};
>  
> +	lcd_backlight: backlight {
> +		compatible = "pwm-backlight";
> +
> +		pwms = <&pwm3 0 5000000 0>;
> +		brightness-levels = <0 4 8 16 32 64 128 255>;
> +		default-brightness-level = <7>;
> +		enable-gpios = <&gpio5 14 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	lvds-receiver {
> +		compatible = "ti,ds90cf384a", "lvds-decoder";
> +		powerdown-gpios = <&gpio7 25 GPIO_ACTIVE_LOW>;
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
> @@ -120,6 +163,18 @@
>  	status = "okay";
>  };
>  
> +&du {
> +	status = "okay";
> +};
> +
> +&gpio2 {
> +	touch-interrupt {
> +		gpio-hog;
> +		gpios = <12 GPIO_ACTIVE_LOW>;
> +		input;
> +	};
> +};
> +
>  &hsusb {
>  	status = "okay";
>  	pinctrl-0 = <&usb0_pins>;
> @@ -147,6 +202,25 @@
>  		VDDIO-supply = <&reg_3p3v>;
>  		VDDD-supply = <&reg_1p5v>;
>  	};
> +
> +	touch: touchpanel@38 {
> +		compatible = "edt,edt-ft5406";
> +		reg = <0x38>;
> +		interrupt-parent = <&gpio2>;
> +		interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
> +	};
> +};
> +
> +&lvds0 {
> +	status = "okay";
> +
> +	ports {
> +		port@1 {
> +			lvds0_out: endpoint {
> +				remote-endpoint = <&lvds_receiver_in>;
> +			};
> +		};
> +	};
>  };
>  
>  &pci0 {
> @@ -180,6 +254,11 @@
>  		function = "i2c2";
>  	};
>  
> +	pwm3_pins: pwm3 {
> +		groups = "pwm3";
> +		function = "pwm3";
> +	};
> +
>  	scif0_pins: scif0 {
>  		groups = "scif0_data_d";
>  		function = "scif0";
> @@ -218,6 +297,12 @@
>  	};
>  };
>  
> +&pwm3 {
> +	pinctrl-0 = <&pwm3_pins>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};
> +
>  &rcar_sound {
>  	pinctrl-0 = <&sound_pins>;
>  	pinctrl-names = "default";
> diff --git a/arch/arm/boot/dts/iwg20d-q7-dbcm-ca.dtsi b/arch/arm/boot/dts/iwg20d-q7-dbcm-ca.dtsi
> index 0e99df2..ede2e0c 100644
> --- a/arch/arm/boot/dts/iwg20d-q7-dbcm-ca.dtsi
> +++ b/arch/arm/boot/dts/iwg20d-q7-dbcm-ca.dtsi
> @@ -39,7 +39,6 @@
>  &du {
>  	pinctrl-0 = <&du_pins>;
>  	pinctrl-names = "default";
> -	status = "okay";
>  
>  	ports {
>  		port@0 {

-- 
Regards,

Laurent Pinchart
