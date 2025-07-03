Return-Path: <linux-renesas-soc+bounces-19159-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 518B9AF83F7
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 01:05:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 073F9548033
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jul 2025 23:04:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E4062D77E3;
	Thu,  3 Jul 2025 23:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="c3M5m6en"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DC81FDA89;
	Thu,  3 Jul 2025 23:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751583908; cv=none; b=LyeRrzzQe15iBRGqHmKkvFbkGWrEqeZz3648Qjwq1B7VecFEkf9kglqNgy7p/bDwRjhuY7wReOo3ZotKjz3eqRNXvj7+hu9ZvT2NGrVyg8QJ+ByU7T0sAr2KJSQ15On84k0SOenDMCuKvWgw3yNZ9MGzfLHY1c0vE8bFZavwdKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751583908; c=relaxed/simple;
	bh=JWw4FAZ6Pt8HEplq2sSwhhP9bs0KrxOw1j4Vrp2u5UY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uwG1Hy/IEBTj1V2CV25VFEtiUJhHFpqnFt1du+5r09Xr+fDI7uaZj5mNk/lBAuxmY7hh3q7A2yPc5mk+S0gL3KkKcV/XhilZwyAcFjgbPrMZZy9gfL7trJcREzBbCG+HLtCg4XOt5aTzBywOd/kyGgoKNunHGpVlVNXh7X5xkmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=c3M5m6en; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 98FF3669;
	Fri,  4 Jul 2025 01:04:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751583881;
	bh=JWw4FAZ6Pt8HEplq2sSwhhP9bs0KrxOw1j4Vrp2u5UY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c3M5m6enMFrB1TXqtWiZkG7ll5LEQA9Q+5HMh68kKvqbskp3hzCYZCYUizr7isQlg
	 naKgSCq3pQlAv2CGKerKYK4VhcWsEgqLDJ//eBp5ILndoTSemECJjBUyV0JoVWhy6N
	 w/KAoZb6ShME2JixI6fONwAhHPHtaTyL7pMSFe2Y=
Date: Fri, 4 Jul 2025 02:04:38 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 4/5] arm64: dts: renesas: sparrow-hawk: Add overlay
 for IMX462 on J1
Message-ID: <20250703230438.GK3798@pendragon.ideasonboard.com>
References: <20250701112612.3957799-1-niklas.soderlund+renesas@ragnatech.se>
 <20250701112612.3957799-5-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250701112612.3957799-5-niklas.soderlund+renesas@ragnatech.se>

Hi Niklas,

Comments on 2/5 apply here too, as well as on 5/5.

On Tue, Jul 01, 2025 at 01:26:11PM +0200, Niklas Söderlund wrote:
> Add an overlay to connect an IMX462 camera sensor to the J1 connector.
> The IMX462 utilizes 4 CSI-2 D-PHY lanes. This enables the video capture
> pipeline behind the CSI40 Rx to be enabled to process images from the
> sensor.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
> * Changes since v1
> - Drop 'status = "okay"' property for the fixed regulators.
> ---
>  arch/arm64/boot/dts/renesas/Makefile          |   3 +
>  ...8a779g3-sparrow-hawk-camera-j1-imx462.dtso | 119 ++++++++++++++++++
>  2 files changed, 122 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx462.dtso
> 
> diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
> index 12803c4fbc80..79d174077ddc 100644
> --- a/arch/arm64/boot/dts/renesas/Makefile
> +++ b/arch/arm64/boot/dts/renesas/Makefile
> @@ -97,10 +97,13 @@ dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g2-white-hawk-single-ard-audio-da7212.dtb
>  DTC_FLAGS_r8a779g3-sparrow-hawk += -Wno-spi_bus_bridge
>  dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk.dtb
>  dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-camera-j1-imx219.dtbo
> +dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-camera-j1-imx462.dtbo
>  dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-camera-j2-imx219.dtbo
>  dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-fan-pwm.dtbo
>  r8a779g3-sparrow-hawk-camera-j1-imx219-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-camera-j1-imx219.dtbo
>  dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-camera-j1-imx219.dtb
> +r8a779g3-sparrow-hawk-camera-j1-imx462-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-camera-j1-imx462.dtbo
> +dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-camera-j1-imx462.dtb
>  r8a779g3-sparrow-hawk-camera-j2-imx219-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-camera-j2-imx219.dtbo
>  dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-camera-j2-imx219.dtb
>  r8a779g3-sparrow-hawk-fan-pwm-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-fan-pwm.dtbo
> diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx462.dtso b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx462.dtso
> new file mode 100644
> index 000000000000..066e9f8f0add
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx462.dtso
> @@ -0,0 +1,119 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Overlay for an IMX462 camera sensor in connector J1 on R-Car V4H
> + * ES3.0 Sparrow Hawk board.
> + *
> + * Copyright 2025 Renesas Electronics Corp.
> + * Copyright 2025 Niklas Söderlund <niklas.soderlund@ragnatech.se>
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/media/video-interfaces.h>
> +
> +&{/} {
> +	clk_cam_j1: clk_cam_j1 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <24000000>;
> +		status = "okay";
> +	};
> +
> +	/* Page 29 / CSI_IF_CN / J1 */
> +	reg_cam_j1: reg_cam_j1 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "reg_cam_j1";
> +		enable-active-high;
> +		gpios = <&gpio0 1 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	reg_cam_j1_dummy: reg_cam_j1_dummy {
> +		compatible = "regulator-fixed";
> +		regulator-name = "reg_cam_j1_dummy";
> +	};
> +};
> +
> +&i2c1 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	status = "okay";
> +
> +	imx462_j1: imx462@1a {
> +		compatible = "sony,imx462lqr";
> +		reg = <0x1a>;
> +		status = "okay";
> +
> +		clocks = <&clk_cam_j1>;
> +		clock-names = "xclk";
> +		clock-frequency = <37125000>;
> +
> +		vdddo-supply = <&reg_cam_j1>;
> +		vdda-supply = <&reg_cam_j1_dummy>;
> +		vddd-supply = <&reg_cam_j1_dummy>;
> +
> +		orientation = <2>;
> +		rotation = <0>;
> +
> +		port {
> +			imx462_j1_out: endpoint {
> +				link-frequencies = /bits/ 64 <222750000 148500000>;
> +				data-lanes = <1 2 3 4>;
> +				remote-endpoint = <&csi40_in>;
> +			};
> +		};
> +	};
> +};
> +
> +/* Page 29 / CSI_IF_CN */
> +&csi40 {
> +	status = "okay";
> +
> +	ports {
> +		port {
> +			csi40_in: endpoint {
> +				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
> +				clock-lanes = <0>;
> +				data-lanes = <1 2 3 4>;
> +				remote-endpoint = <&imx462_j1_out>;
> +			};
> +		};
> +	};
> +};
> +
> +&isp0 {
> +	status = "okay";
> +};
> +
> +&vin00 {
> +	status = "okay";
> +};
> +
> +&vin01 {
> +	status = "okay";
> +};
> +
> +&vin02 {
> +	status = "okay";
> +};
> +
> +&vin03 {
> +	status = "okay";
> +};
> +
> +&vin04 {
> +	status = "okay";
> +};
> +
> +&vin05 {
> +	status = "okay";
> +};
> +
> +&vin06 {
> +	status = "okay";
> +};
> +
> +&vin07 {
> +	status = "okay";
> +};
> -- 
> 2.50.0
> 
> 

-- 
Regards,

Laurent Pinchart

