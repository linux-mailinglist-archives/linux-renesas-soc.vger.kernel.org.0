Return-Path: <linux-renesas-soc+bounces-19329-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F74CAFB479
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 15:25:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A723F169510
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Jul 2025 13:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE3E9296142;
	Mon,  7 Jul 2025 13:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="QN1SG3q/";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WL7ivtFc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5919528FFE6;
	Mon,  7 Jul 2025 13:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751894708; cv=none; b=Ely3K00hziPv7yX3VG3tcUi1xfHpRfj1V7nM4F3vTE4ChjQwaBJLZBY60mFGA38KUBuxDa15UzEYOgSF3Su3qvSTdgRERtoMimTfKZi0ExvLHyVMDZGVbKGfLajEBv5xAes+KRRmxchtsVDsifXHhH3Z/RC/BkJWY1HeaeVPaQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751894708; c=relaxed/simple;
	bh=57lkV+s5FxtWhz1QMWz8lvu8Btf5nzTG0YEfl87IYEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aWpREtWaNcZACWElIObelv8TNAsVsZGxZ3FHJoUubFGhGIvpvZ7FSjLf8VEy1RnqSyY8bhovqFXD+C4owmSu/AGtnU8HX1TLJD46dSM9MZAqYpLTBEjaC0/tRc4mimABtNwhx+Du3PDJcBbhAsFq2UhK55tCjnf8tL9/S36K1Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=QN1SG3q/; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=WL7ivtFc; arc=none smtp.client-ip=202.12.124.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfout.stl.internal (Postfix) with ESMTP id 58A7A1D0012F;
	Mon,  7 Jul 2025 09:25:05 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Mon, 07 Jul 2025 09:25:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751894705;
	 x=1751981105; bh=DhXOOp8FdyapjmtdtCWfvyQadM54ngkD6U3pdxaGdgM=; b=
	QN1SG3q/yaw94miLLzZWRMIyI6CPVGLHYDsZEDT7mtOGo85+pEM8QndkH2RbESIM
	MyRJQAROXwBV5nyCv5ilEuu7RETZS3w+YcTTUo+PggQU4VQTbl3RTzxcncmSSlUj
	4q/uQCTz1FiQMbpdAR7hrPwZU6ouWZnvDrfUKDEm7PB2S9YYe97hz1CadN/O5Vrc
	inKo7R7dZWaerfnrnXxIgUXaGVrrhCrwH4EaXx3M9KM/sDz1TbqkQHxg+qpoGRjw
	6PZa7bup2QAGiUyGYc/2MDz1rSmTSr3XUTTyCqpB3g8ecMIBc7gpBWdqt4p/mw8c
	hkaM5j0NRmf3GSYkuPx/Fw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751894705; x=
	1751981105; bh=DhXOOp8FdyapjmtdtCWfvyQadM54ngkD6U3pdxaGdgM=; b=W
	L7ivtFcq1jNJM4m6SdH/p0VJPM3Y5gw4CjRVZRijz6dNbuEMBQXXgtQcVlp3xqqR
	U/pynDxDSOn7o5nUa8jYu5gwmujjwZ9s83Ej1E5ZS4CKaCxDvbbqoBcDo8zwU2mi
	NOUxDADM1ZhRxNZnOm+ISlOCm9k9SsOhiafhQ6k4dVN4qdVzjr/yd9ikCIiNr7At
	JachIXsLVHv+Gr346ENAW0D5OC5jcLl0yq1sidpc0xfM1i11BUvftnsFpio98Fko
	ZRDDHBkbrWjDA1LHf6GeGaGgtEWCiOyVusyHGcweOA23/sY+YC193dsp4zPlHR98
	zYv7mpkV2qZxttGFiwEzg==
X-ME-Sender: <xms:sMpraNjEECV6o6kcYC3HKt0YI2cCJDXoqwzOPWQFTpRH4TRp1t82JQ>
    <xme:sMpraHNuXMg9IUwyYEHyIm8PWc2g7JFhcuzIwMcwynQF-he99-ONzvbrkLY6cW83h
    yCru9YjqWkHXcy-Gy4>
X-ME-Received: <xmr:sMpraN9WUsdCfENN93k3qaKkND7A2G8hdneuvMlq9wmmYEr5VCEFle_lT-N5K32pedaZKlDVWosXL8nHebtYoXgD_n3cDkSnGg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefudeludcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheppfhikhhlrghs
    ucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrg
    hssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepfefhleelhfffjefg
    fedugfegjeelhfevheeikefhueelgfdtfeeuhefftddvleeinecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhu
    nhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpthhtohepke
    dpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgr
    rhhtsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehgvggvrhhtodhrvg
    hnvghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtth
    hopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgrrhgvkhdr
    vhgrshhuthdorhgvnhgvshgrshesmhgrihhlsghogidrohhrghdprhgtphhtthhopehlih
    hnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepuggvvhhitggvthhrvggvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:sMpraIenctKzaCQiPpGSBidQ4MvqCsWRKsWONkZ2FkIwQYkm7lBDtw>
    <xmx:sMpraMx-fFI9T6llqTiks6ZoCDuSksF2Ua4hT0epFVmj92QteAu7RQ>
    <xmx:sMpraNIZG0waykyGhgaxCeLkS_kgK2m8pblxfPo8muZf0b-EPNoBgw>
    <xmx:sMpraOFf4beI7eHkGg5yGsdMBtX8zJm1O-QQznrUk1dHti8wJO9mkQ>
    <xmx:scpraP7afSU1GNRFyluwRH2AyNqLWkbJcgUnlEGmDeZ9gj7O4KqKgFsB>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 7 Jul 2025 09:25:04 -0400 (EDT)
Date: Mon, 7 Jul 2025 15:25:03 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 4/5] arm64: dts: renesas: sparrow-hawk: Add overlay
 for IMX462 on J1
Message-ID: <20250707132503.GB1410739@ragnatech.se>
References: <20250704100734.3387856-1-niklas.soderlund+renesas@ragnatech.se>
 <20250704100734.3387856-5-niklas.soderlund+renesas@ragnatech.se>
 <20250707123409.GC1821@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250707123409.GC1821@pendragon.ideasonboard.com>

Hi Laurent,

Thanks for your comments.

On 2025-07-07 15:34:09 +0300, Laurent Pinchart wrote:
> Hi Niklas,
> 
> On Fri, Jul 04, 2025 at 12:07:33PM +0200, Niklas Söderlund wrote:
> > Add an overlay to connect an IMX462 camera sensor to the J1 connector.
> > The IMX462 utilizes 4 CSI-2 D-PHY lanes. This enables the video capture
> > pipeline behind the CSI40 Rx to be enabled to process images from the
> > sensor.
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> > * Changes since v2
> > - Use the same regulator for all three supplies.
> > - Drop 'status = "okay"' property for the fixed clock.
> > - Drop 'status = "okay"' property for the sensor node.
> > - Drop unused label for sensor node.
> > 
> > * Changes since v1
> > - Drop 'status = "okay"' property for the fixed regulators.
> > ---
> >  arch/arm64/boot/dts/renesas/Makefile          |   3 +
> >  ...8a779g3-sparrow-hawk-camera-j1-imx462.dtso | 112 ++++++++++++++++++
> >  2 files changed, 115 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx462.dtso
> > 
> > diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
> > index 12803c4fbc80..79d174077ddc 100644
> > --- a/arch/arm64/boot/dts/renesas/Makefile
> > +++ b/arch/arm64/boot/dts/renesas/Makefile
> > @@ -97,10 +97,13 @@ dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g2-white-hawk-single-ard-audio-da7212.dtb
> >  DTC_FLAGS_r8a779g3-sparrow-hawk += -Wno-spi_bus_bridge
> >  dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk.dtb
> >  dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-camera-j1-imx219.dtbo
> > +dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-camera-j1-imx462.dtbo
> >  dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-camera-j2-imx219.dtbo
> >  dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-fan-pwm.dtbo
> >  r8a779g3-sparrow-hawk-camera-j1-imx219-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-camera-j1-imx219.dtbo
> >  dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-camera-j1-imx219.dtb
> > +r8a779g3-sparrow-hawk-camera-j1-imx462-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-camera-j1-imx462.dtbo
> > +dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-camera-j1-imx462.dtb
> >  r8a779g3-sparrow-hawk-camera-j2-imx219-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-camera-j2-imx219.dtbo
> >  dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-camera-j2-imx219.dtb
> >  r8a779g3-sparrow-hawk-fan-pwm-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-fan-pwm.dtbo
> > diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx462.dtso b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx462.dtso
> > new file mode 100644
> > index 000000000000..63813ed216db
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx462.dtso
> > @@ -0,0 +1,112 @@
> > +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +/*
> > + * Device Tree Overlay for an IMX462 camera sensor in connector J1 on R-Car V4H
> > + * ES3.0 Sparrow Hawk board.
> > + *
> > + * Copyright 2025 Renesas Electronics Corp.
> > + * Copyright 2025 Niklas Söderlund <niklas.soderlund@ragnatech.se>
> > + */
> > +
> > +/dts-v1/;
> > +/plugin/;
> > +
> > +#include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/media/video-interfaces.h>
> > +
> > +&{/} {
> > +	clk_cam_j1: clk_cam_j1 {
> > +		compatible = "fixed-clock";
> > +		#clock-cells = <0>;
> > +		clock-frequency = <24000000>;
> > +	};
> > +
> > +	/* Page 29 / CSI_IF_CN / J1 */
> > +	reg_cam_j1: reg_cam_j1 {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "reg_cam_j1";
> > +		enable-active-high;
> > +		gpios = <&gpio0 1 GPIO_ACTIVE_HIGH>;
> > +	};
> > +};
> > +
> > +&i2c1 {
> > +	#address-cells = <1>;
> > +	#size-cells = <0>;
> > +	status = "okay";
> > +
> > +	cam@1a {
> > +		compatible = "sony,imx462lqr";
> > +		reg = <0x1a>;
> > +
> > +		clocks = <&clk_cam_j1>;
> > +		clock-names = "xclk";
> > +		clock-frequency = <37125000>;
> 
> Usage of the clock-frequency property in camera sensors is deprecated.
> I'm working on patches that will fix that in the imx290 driver. In the
> meantime, you can apply this change for testing:
> 
> diff --git a/drivers/media/i2c/imx290.c b/drivers/media/i2c/imx290.c
> index fbf7eba3d71d..6a6cf37d62f9 100644
> --- a/drivers/media/i2c/imx290.c
> +++ b/drivers/media/i2c/imx290.c
> @@ -1426,14 +1426,8 @@ static int imx290_get_regulators(struct device *dev, struct imx290 *imx290)
>  static int imx290_init_clk(struct imx290 *imx290)
>  {
>  	u32 xclk_freq;
> -	int ret;
> 
> -	ret = device_property_read_u32(imx290->dev, "clock-frequency",
> -				       &xclk_freq);
> -	if (ret) {
> -		dev_err(imx290->dev, "Could not get xclk frequency\n");
> -		return ret;
> -	}
> +	xclk_freq = clk_get_rate(imx290->xclk);
> 
>  	/* external clock must be 37.125 MHz or 74.25MHz */
>  	switch (xclk_freq) {
> @@ -1449,12 +1443,6 @@ static int imx290_init_clk(struct imx290 *imx290)
>  		return -EINVAL;
>  	}
> 
> -	ret = clk_set_rate(imx290->xclk, xclk_freq);
> -	if (ret) {
> -		dev_err(imx290->dev, "Could not set xclk frequency\n");
> -		return ret;
> -	}
> -
>  	return 0;
>  }
> 
> 
> If you need to set the external clock rate, the assigned-clocks and
> assigned-clock-rates properties should be used instead. In this specific
> case, the external clock is a fixed frequency clock, so you can't change
> its rate.

Wit this change applied, correct clock in clk_cam_j1, and the 
clock-frequency popery removed the camera still works. But of course the 
bindings verification fails as clock-frequency is a mandatory property.

> This leads to a second comment: the clock-frequency property
> of the clk_cam_j1 node doesn't match the frequency you list here.

Woops, bad copy-past, fixed. Thanks for spotting.

> 
> These comments apply to patch 5/5.
> 
> > +
> > +		vdddo-supply = <&reg_cam_j1>;
> > +		vdda-supply = <&reg_cam_j1>;
> > +		vddd-supply = <&reg_cam_j1>;
> > +
> > +		orientation = <2>;
> > +		rotation = <0>;
> > +
> > +		port {
> > +			imx462_j1_out: endpoint {
> > +				link-frequencies = /bits/ 64 <222750000 148500000>;
> > +				data-lanes = <1 2 3 4>;
> > +				remote-endpoint = <&csi40_in>;
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +/* Page 29 / CSI_IF_CN */
> > +&csi40 {
> > +	status = "okay";
> > +
> > +	ports {
> > +		port {
> > +			csi40_in: endpoint {
> > +				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
> > +				clock-lanes = <0>;
> > +				data-lanes = <1 2 3 4>;
> > +				remote-endpoint = <&imx462_j1_out>;
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +&isp0 {
> > +	status = "okay";
> > +};
> > +
> > +&vin00 {
> > +	status = "okay";
> > +};
> > +
> > +&vin01 {
> > +	status = "okay";
> > +};
> > +
> > +&vin02 {
> > +	status = "okay";
> > +};
> > +
> > +&vin03 {
> > +	status = "okay";
> > +};
> > +
> > +&vin04 {
> > +	status = "okay";
> > +};
> > +
> > +&vin05 {
> > +	status = "okay";
> > +};
> > +
> > +&vin06 {
> > +	status = "okay";
> > +};
> > +
> > +&vin07 {
> > +	status = "okay";
> > +};
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Kind Regards,
Niklas Söderlund

