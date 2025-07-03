Return-Path: <linux-renesas-soc+bounces-19158-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D94AF83F6
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 01:03:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 381591C80E3E
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Jul 2025 23:04:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD4352D5C6B;
	Thu,  3 Jul 2025 23:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uMkgI9zg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 151AE1FDA89;
	Thu,  3 Jul 2025 23:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751583829; cv=none; b=ugjicyoqSYyYY4hvQw3XYnzCMWy5Yb46m2qMlDyiy43wiV68D2epq75WzOlrSsG/1jUW9PirCcCb0BcBJBkb1dkj6+fJeG2kdeWNj1Kv9V9HOgTwlgIGRXhHWKBnN9bAceofl2Jl70Z0MDVE01ysro4+YMPvnj49moV2vp90tjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751583829; c=relaxed/simple;
	bh=ldQTKfdbYRNA67LImfxDV3Ma3Yn6QcGWtCJE+w0uLH8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gWh0f1yOlwOwtUxuXGoHgMnlkPLzb+Bnsejp3rgkOEh8MU0xQ44CSAiikhdi8KLhuK7HA254RT1QnSBSjifts+E/yd4FHODcL+ulAR8+AjX/TMYUdtZzbGLVhCrzt7N0yX7MCGprS6gK9Ta09LfUeIt01wxR1SVcZyzZs66MraA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uMkgI9zg; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 6C889669;
	Fri,  4 Jul 2025 01:03:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751583802;
	bh=ldQTKfdbYRNA67LImfxDV3Ma3Yn6QcGWtCJE+w0uLH8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uMkgI9zgFMX8CYhLRzq3q0NcTiNwDdwM+36CdiHRDrKbxms9hV6iECKx8aNBVlUe+
	 KhbO6bzrjkwxwAEcov1DOLwwN7XdZWw+kl//sDkhRSV2zRQTRVeTng8ym9NBFjqMpL
	 kQEEx09428b0F/B3Fj1w9uk4mKqx9n/suUU3NexY=
Date: Fri, 4 Jul 2025 02:03:19 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/5] arm64: dts: renesas: sparrow-hawk: Add overlay
 for IMX219 on J1
Message-ID: <20250703230319.GJ3798@pendragon.ideasonboard.com>
References: <20250701112612.3957799-1-niklas.soderlund+renesas@ragnatech.se>
 <20250701112612.3957799-3-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250701112612.3957799-3-niklas.soderlund+renesas@ragnatech.se>

Hi Niklas,

Thank you for the patch.

The comments below apply to 3/5 where applicable.

On Tue, Jul 01, 2025 at 01:26:09PM +0200, Niklas Söderlund wrote:
> Add an overlay to connect an IMX219 camera sensor to the J1 connector.
> The IMX219 utilizes 2 CSI-2 D-PHY lanes. This enables the video capture
> pipeline behind the CSI40 Rx to be enabled to process images from the
> sensor.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
> * Changes since v1
> - Drop 'status = "okay"' property for the fixed regulators.
> ---
>  arch/arm64/boot/dts/renesas/Makefile          |   3 +
>  ...8a779g3-sparrow-hawk-camera-j1-imx219.dtso | 118 ++++++++++++++++++
>  2 files changed, 121 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx219.dtso
> 
> diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
> index 47e46ef99d36..73218f7ec9af 100644
> --- a/arch/arm64/boot/dts/renesas/Makefile
> +++ b/arch/arm64/boot/dts/renesas/Makefile
> @@ -96,7 +96,10 @@ dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g2-white-hawk-single-ard-audio-da7212.dtb
>  
>  DTC_FLAGS_r8a779g3-sparrow-hawk += -Wno-spi_bus_bridge
>  dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk.dtb
> +dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-camera-j1-imx219.dtbo
>  dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-fan-pwm.dtbo
> +r8a779g3-sparrow-hawk-camera-j1-imx219-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-camera-j1-imx219.dtbo
> +dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-camera-j1-imx219.dtb
>  r8a779g3-sparrow-hawk-fan-pwm-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-fan-pwm.dtbo
>  dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-fan-pwm.dtb
>  
> diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx219.dtso b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx219.dtso
> new file mode 100644
> index 000000000000..a9089d3a4b29
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx219.dtso
> @@ -0,0 +1,118 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Device Tree Overlay for an IMX219 camera sensor in connector J1 on R-Car V4H
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

No need for status.

> +	};
> +
> +	/* Page 29 / CSI_IF_CN / J1 */
> +	reg_cam_j1: reg_cam_j1 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "reg_cam_j1";
> +		enable-active-high;
> +		gpios = <&gpio0 1 GPIO_ACTIVE_HIGH>;

No need for a pinctrl entry ?

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
> +	imx219_j1: imx219@10 {

cam@10, and drop the label (it's unused).

> +		compatible = "sony,imx219";
> +		reg = <0x10>;
> +		status = "okay";

Drop status.

> +
> +		clocks = <&clk_cam_j1>;
> +
> +		VANA-supply = <&reg_cam_j1>;
> +		VDIG-supply = <&reg_cam_j1_dummy>;
> +		VDDL-supply = <&reg_cam_j1_dummy>;

You could use the same regulator for the three supplies, and drop
reg_cam_j1_dummy.

> +
> +		orientation = <2>;
> +		rotation = <0>;
> +
> +		port {
> +			imx219_j1_out: endpoint {
> +				clock-noncontinuous;
> +				link-frequencies = /bits/ 64 <456000000>;
> +				data-lanes = <1 2>;
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
> +				data-lanes = <1 2>;
> +				remote-endpoint = <&imx219_j1_out>;
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

-- 
Regards,

Laurent Pinchart

