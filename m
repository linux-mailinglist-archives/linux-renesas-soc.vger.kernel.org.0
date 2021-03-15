Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EBD933C94C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Mar 2021 23:24:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232307AbhCOWYB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Mar 2021 18:24:01 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:42100 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232426AbhCOWXf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Mar 2021 18:23:35 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2BC00316;
        Mon, 15 Mar 2021 23:23:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1615847014;
        bh=i5Gp2H8N3R+I/w0dXvW9UnL1rsZiOHMIgbZGs1M6FiA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pYoi7x0ASrHmtXLjLk9IGo1mysffbC65rSM4yMfqXkOXsHPV2a1wXOaN/wQi2Ss24
         hM8XIepF4Reoqb9JgZfbOX3rDugKGN/eAOaMXDe2tWKQNXlUr1lcc8qBafqbUxQFvu
         zrbGuAlb/KNN6NL/v947bCRHAVESWD9anKCEqHG4=
Date:   Tue, 16 Mar 2021 00:22:58 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/4] arm64: dts: renesas: eagle: Enable MAX9286
Message-ID: <YE/eQrBTAKtQ1cyR@pendragon.ideasonboard.com>
References: <20210315163028.173148-1-jacopo+renesas@jmondi.org>
 <20210315163028.173148-3-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210315163028.173148-3-jacopo+renesas@jmondi.org>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Mon, Mar 15, 2021 at 05:30:26PM +0100, Jacopo Mondi wrote:
> From: Kieran Bingham <kieran.bingham@ideasonboard.com>
> 
> Enable the MAX9286 GMSL deserializer on the Eagle-V3M board.
> 
> Connected cameras should be defined in a device-tree overlay or included
> after these definitions.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  .../arm64/boot/dts/renesas/r8a77970-eagle.dts | 132 ++++++++++++++++++
>  1 file changed, 132 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> index 874a7fc2730b..d2f63cccc238 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77970-eagle.dts
> @@ -6,6 +6,8 @@
>   * Copyright (C) 2017 Cogent Embedded, Inc.
>   */
>  
> +#include <dt-bindings/gpio/gpio.h>
> +
>  /dts-v1/;
>  #include "r8a77970.dtsi"
>  
> @@ -188,6 +190,11 @@ i2c0_pins: i2c0 {
>  		function = "i2c0";
>  	};
>  
> +	i2c3_pins: i2c3 {
> +		groups = "i2c3_a";
> +		function = "i2c3";
> +	};
> +
>  	qspi0_pins: qspi0 {
>  		groups = "qspi0_ctrl", "qspi0_data4";
>  		function = "qspi0";
> @@ -266,6 +273,131 @@ &rwdt {
>  	status = "okay";
>  };

Could we keep the nodes alphabetically sorted ?

> +&csi40 {
> +	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;

This is already present in r8a77970.dtsi, you can drop it.

> +
> +		port@0 {
> +			reg = <0>;

Similarly, should we add port@0 in r8a77970.dtsi, with its reg property
?

> +
> +			csi40_in: endpoint {
> +				clock-lanes = <0>;
> +				data-lanes = <1 2 3 4>;
> +				remote-endpoint = <&max9286_out0>;
> +			};
> +		};
> +	};
> +};
> +
> +&i2c3 {
> +	pinctrl-0 = <&i2c3_pins>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +	clock-frequency = <400000>;
> +
> +	gmsl: gmsl-deserializer@48 {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		compatible = "maxim,max9286";
> +		reg = <0x48>;
> +
> +		/* eagle-pca9654-max9286-pwdn */
> +		enable-gpios = <&io_expander 0 GPIO_ACTIVE_HIGH>;
> +
> +		/*
> +		 * Workaround: Hog the CAMVDD line high as we can't establish a
> +		 * regulator-fixed on the gpio_chip exposed by &gmsl due to
> +		 * circular-dependency issues.
> +		 */
> +		camvdd-en-hog {
> +			gpio-hog;
> +			gpios = <0 0>;
> +			output-low;
> +			line-name = "CAMVDD_EN";
> +		};
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				max9286_in0: endpoint {
> +				};

Shouldn't we leave out empty endpoints, and add them to the overlays
instead ? Endpoints describe links, so they shouldn't exist on their
own.

With these minor issues addressed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +				max9286_in1: endpoint {
> +				};
> +			};
> +
> +			port@2 {
> +				reg = <2>;
> +				max9286_in2: endpoint {
> +				};
> +			};
> +
> +			port@3 {
> +				reg = <3>;
> +				max9286_in3: endpoint {
> +				};
> +			};
> +
> +			port@4 {
> +				reg = <4>;
> +				max9286_out0: endpoint {
> +					clock-lanes = <0>;
> +					data-lanes = <1 2 3 4>;
> +					remote-endpoint = <&csi40_in>;
> +				};
> +			};
> +		};
> +
> +		i2c-mux {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			i2c@0 {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				reg = <0>;
> +
> +				status = "disabled";
> +			};
> +
> +			i2c@1 {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				reg = <1>;
> +
> +				status = "disabled";
> +			};
> +
> +			i2c@2 {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				reg = <2>;
> +
> +				status = "disabled";
> +			};
> +
> +			i2c@3 {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				reg = <3>;
> +
> +				status = "disabled";
> +			};
> +		};
> +	};
> +};
> +
>  &scif0 {
>  	pinctrl-0 = <&scif0_pins>;
>  	pinctrl-names = "default";

-- 
Regards,

Laurent Pinchart
