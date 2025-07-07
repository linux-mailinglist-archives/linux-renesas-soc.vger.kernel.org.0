Return-Path: <linux-renesas-soc+bounces-19322-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F33DAFB35D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 14:34:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1489F189EE85
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 12:35:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 995312980AC;
	Mon,  7 Jul 2025 12:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mfBd9+MH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06EB191499;
	Mon,  7 Jul 2025 12:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751891681; cv=none; b=bY0IkfiZQ4598IUY1Z+4hK4IJ/Fm9XpPhFE8lQhQkcnSuvOSXc5YSr2gb6AW2QvW6KDse8MpnD2t8TJ1b29chMZqPPdSc/jtE0XomctX6BpMPV5ENjlpiNo3GJEwE1dtNoWRjdz8ddoHr3E/HbeCtm/emNfBBGxIlqxMO8da3cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751891681; c=relaxed/simple;
	bh=M3ZTU3iNpEFfjU4DccJ0Zv/xQYSM5998hfl3u5BQRgc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rSQuvwl0POyJ7suujTetM9vc8e4tvEpXHN8uBA7EAo3NN5RYctN1gESS7L+RMHV3jpCS4kKWjT0TtKL4b1ljP7JvFr5kdY8MyuGUsswGEPjmXZP+WLLZRNSGSXKFUmEmGPCUgdbLy0NAGPc1Udfska7hiUC9+PUaKxvhTuhBuLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mfBd9+MH; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id EFD259CA;
	Mon,  7 Jul 2025 14:34:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751891651;
	bh=M3ZTU3iNpEFfjU4DccJ0Zv/xQYSM5998hfl3u5BQRgc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mfBd9+MHx8NmcN+L+XFsNuKLD7H6yfl3whTaPZ6m675ONIZNLelTfGdVyvnrmNIUI
	 yTOEx+XZ5+pacuky4J3Ns7p7cIYvsGCGOYALqzcKFfXwZHHit26blfLmawX0RL4ki6
	 B03y9D9wew1p8ZDze/EPxrj9AQtu14Ce1VR/OXt0=
Date: Mon, 7 Jul 2025 15:34:09 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 4/5] arm64: dts: renesas: sparrow-hawk: Add overlay
 for IMX462 on J1
Message-ID: <20250707123409.GC1821@pendragon.ideasonboard.com>
References: <20250704100734.3387856-1-niklas.soderlund+renesas@ragnatech.se>
 <20250704100734.3387856-5-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250704100734.3387856-5-niklas.soderlund+renesas@ragnatech.se>

Hi Niklas,

On Fri, Jul 04, 2025 at 12:07:33PM +0200, Niklas Söderlund wrote:
> Add an overlay to connect an IMX462 camera sensor to the J1 connector.
> The IMX462 utilizes 4 CSI-2 D-PHY lanes. This enables the video capture
> pipeline behind the CSI40 Rx to be enabled to process images from the
> sensor.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
> * Changes since v2
> - Use the same regulator for all three supplies.
> - Drop 'status = "okay"' property for the fixed clock.
> - Drop 'status = "okay"' property for the sensor node.
> - Drop unused label for sensor node.
> 
> * Changes since v1
> - Drop 'status = "okay"' property for the fixed regulators.
> ---
>  arch/arm64/boot/dts/renesas/Makefile          |   3 +
>  ...8a779g3-sparrow-hawk-camera-j1-imx462.dtso | 112 ++++++++++++++++++
>  2 files changed, 115 insertions(+)
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
> index 000000000000..63813ed216db
> --- /dev/null
> +++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx462.dtso
> @@ -0,0 +1,112 @@
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
> +	};
> +
> +	/* Page 29 / CSI_IF_CN / J1 */
> +	reg_cam_j1: reg_cam_j1 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "reg_cam_j1";
> +		enable-active-high;
> +		gpios = <&gpio0 1 GPIO_ACTIVE_HIGH>;
> +	};
> +};
> +
> +&i2c1 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	status = "okay";
> +
> +	cam@1a {
> +		compatible = "sony,imx462lqr";
> +		reg = <0x1a>;
> +
> +		clocks = <&clk_cam_j1>;
> +		clock-names = "xclk";
> +		clock-frequency = <37125000>;

Usage of the clock-frequency property in camera sensors is deprecated.
I'm working on patches that will fix that in the imx290 driver. In the
meantime, you can apply this change for testing:

diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
index fbf7eba3d71d..6a6cf37d62f9 100644
--- a/drivers/media/i2c/imx290.c
+++ b/drivers/media/i2c/imx290.c
@@ -1426,14 +1426,8 @@ static int imx290_get_regulators(struct device *dev, struct imx290 *imx290)
 static int imx290_init_clk(struct imx290 *imx290)
 {
 	u32 xclk_freq;
-	int ret;

-	ret = device_property_read_u32(imx290->dev, "clock-frequency",
-				       &xclk_freq);
-	if (ret) {
-		dev_err(imx290->dev, "Could not get xclk frequency\n");
-		return ret;
-	}
+	xclk_freq = clk_get_rate(imx290->xclk);

 	/* external clock must be 37.125 MHz or 74.25MHz */
 	switch (xclk_freq) {
@@ -1449,12 +1443,6 @@ static int imx290_init_clk(struct imx290 *imx290)
 		return -EINVAL;
 	}

-	ret = clk_set_rate(imx290->xclk, xclk_freq);
-	if (ret) {
-		dev_err(imx290->dev, "Could not set xclk frequency\n");
-		return ret;
-	}
-
 	return 0;
 }


If you need to set the external clock rate, the assigned-clocks and
assigned-clock-rates properties should be used instead. In this specific
case, the external clock is a fixed frequency clock, so you can't change
its rate. This leads to a second comment: the clock-frequency property
of the clk_cam_j1 node doesn't match the frequency you list here.

These comments apply to patch 5/5.

> +
> +		vdddo-supply = <&reg_cam_j1>;
> +		vdda-supply = <&reg_cam_j1>;
> +		vddd-supply = <&reg_cam_j1>;
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

-- 
Regards,

Laurent Pinchart

