Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63ED7241A54
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Aug 2020 13:26:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728750AbgHKL04 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Aug 2020 07:26:56 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57056 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728597AbgHKL0z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Aug 2020 07:26:55 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6D0489A8;
        Tue, 11 Aug 2020 13:26:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1597145211;
        bh=FPgMx4hsU5udWYYn893FI57b2GW6J+FF/0EKBckiJ8E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZsygxymD4JImSM9UlmIkEMdQngn/+ycmQGnvnLQajYziw87LU73HJJXSAF7qUjwy0
         woyavfk+CoHL/0ch1tZFbwx7GUqKM6c3zdVAUV2pUQPZaECoHkfm4ivx2T+S7AHWAe
         jFPt3O4l2NWpm//IMKIPRSc0qj9aE+Wahz0CGF4s=
Date:   Tue, 11 Aug 2020 14:26:38 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH 7/7] ARM: dts: r8a7742-iwg21d-q7: Add LCD support
Message-ID: <20200811112638.GF6054@pendragon.ideasonboard.com>
References: <20200807174954.14448-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200807174954.14448-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200807174954.14448-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

Thank you for the patch.

On Fri, Aug 07, 2020 at 06:49:54PM +0100, Lad Prabhakar wrote:
> The iwg21d comes with a 7" capacitive touch screen, therefore
> add support for it.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> ---
>  arch/arm/boot/dts/r8a7742-iwg21d-q7.dts | 84 +++++++++++++++++++++++++
>  1 file changed, 84 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts b/arch/arm/boot/dts/r8a7742-iwg21d-q7.dts
> index b3461a61a4bf..cf59fd61e422 100644
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
> @@ -52,6 +53,50 @@
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

It's actually a power supply, not an enable GPIO, but it doesn't matter
much, I don't think there's a need to declare a regulator just for the
sake of it.

> +	};
> +
> +	lvds-receiver {
> +		compatible = "ti,ds90cf384a", "lvds-decoder";
> +		powerdown-gpios = <&gpio5 28 GPIO_ACTIVE_LOW>;

This should be handled as a shared power supply, as it's also needed for
the touch screen. Biju has sent patches for the iwg20d that fixes a
probe issue due to that problem, I think you can just copy the fix.

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
> @@ -129,12 +174,31 @@
>  		VDDIO-supply = <&reg_3p3v>;
>  		VDDD-supply = <&reg_1p5v>;
>  	};
> +
> +	touch: touchpanel@38 {
> +		compatible = "edt,edt-ft5406";
> +		reg = <0x38>;
> +		interrupt-parent = <&gpio0>;
> +		interrupts = <24 IRQ_TYPE_EDGE_FALLING>;

Should the reset GPIO also be wired ? It seems to be shared with the
audio codec though, which is annoying.

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

Is this needed, or does requesting the interrupt in the touch screen
driver configured the GPIO to an input automatically ?

> +};
> +
>  &hsusb {
>  	pinctrl-0 = <&usb0_pins>;
>  	pinctrl-names = "default";
> @@ -165,6 +229,11 @@
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
> @@ -208,6 +277,17 @@
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
> @@ -261,6 +341,10 @@
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
