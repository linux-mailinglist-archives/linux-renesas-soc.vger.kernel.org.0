Return-Path: <linux-renesas-soc+bounces-19201-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B553AF8F35
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 11:53:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 240874A1740
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jul 2025 09:52:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AA442ED17F;
	Fri,  4 Jul 2025 09:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="vLe8xLeJ";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="JOu7N0Fw"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354D624DD00;
	Fri,  4 Jul 2025 09:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751622751; cv=none; b=oLveR4uQj9Cf2LT0CgWKvIxVEgL1SCzi/5r5NB/jYFDfKWOCPhfU6pYLFEdlcZnsTne/KQXEMD5PeB2WVjO8ZLJDvG5taCln09Kg71WgnDuX8sCOccNGIG9o98S+0UvY9D0juYJ3WhIiRsZbKUzYSuqIlko67ppEYi4iOytsIow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751622751; c=relaxed/simple;
	bh=12r0ajOSY69b+ifBWwO+QBoaFRwqSuDhDlUujLMeJec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uQ0k9hPPJPb7ZcK/J0Mv9N993zZQUKWC7bnTaGvkLVR7/ELoYcSyk3/QpXwnv4A4MHZF+kF2LYPxzA/NPyJJh0gcR9nzsz0gO9QTHiGSZ/NHF/9CMUJKNvUDKhJgcwouMpyBzHWjQ8uYXeiUhKV3NJe8QDxEWkCdTeWA1a/4puA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=vLe8xLeJ; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=JOu7N0Fw; arc=none smtp.client-ip=202.12.124.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfout.stl.internal (Postfix) with ESMTP id D93D01D00209;
	Fri,  4 Jul 2025 05:52:27 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Fri, 04 Jul 2025 05:52:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1751622747;
	 x=1751709147; bh=02WPpAVeMtNBH4K7PlL4e9iEr5qlWyL9gZ/6f+3tJqs=; b=
	vLe8xLeJpTKEVXQdRdDnOnh3O4R4TpYHbmQkv9W9HrYYeoZmEDd3WVKMYc2tgKHB
	DQDcGRr+ZM+RS1pK1JMmdXRigJ4mNbZJl6n4M1kaB0FQGvZouDnFzaumMU0S2p5Z
	7EZviBWXEFuJZM3eWBPg2Lf4bOc+YWUfi0WRXNhPFNvxBbJtVhsrLu8NeADDRaM6
	jk0iWmbkeYhb9XUnT1KivXj/zwU+KDXOGa8fy23UVcv0+H1UQEKpRY2PezuKLluJ
	3c1GDwcaH5+UDSc+TDnL1zllhVygHZyz5xnQ4hP5xsjrRHJUC8pcbXCRtHmUiQvV
	qVyhpCzm2qEtRgFfH4pOMw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1751622747; x=
	1751709147; bh=02WPpAVeMtNBH4K7PlL4e9iEr5qlWyL9gZ/6f+3tJqs=; b=J
	Ou7N0FwbyEDmLsMA2bxMut1YHUPGeYfCMvMEw0qCeeVw1LSnyBv2BEVWGcFsTxPs
	HOb1kqonlLZzlDInS4P+7RLkaZmn21TAlRpiUZvRG4rj6AshKEzmqWSvRWkh0V1x
	AUEiSpRPZAvZGP9TaHoiXJ3p5jzUaVJtwzta4Bf0eE0S8sVCObZ0Ckvv7hDgmR+z
	Z1yHQefvDYt4l/xwXTm53UWH1xuusWWvyHCoRlHLRlGU9283CYh6tT9TeqtRgrj+
	JHT4VcgS1hK0mus2VKFPbUpNmDel2j9j6XwMo3lrT7R9eUZ0L43FtthJcaUKdYrF
	aXOSmLnsk090f/DTuk/eg==
X-ME-Sender: <xms:W6RnaACeJNdfcts8S6ADPgW4FuUy1tncOEzpyBhsRiSNvtc7f8TTmA>
    <xme:W6RnaChigXAtRV-XRSAfhfvie6Jvaih0h_BqJOkWbqflxt9ZTZI-fZzO2s2GiKtiM
    1ZdSUmGswYIp0-pEoA>
X-ME-Received: <xmr:W6RnaDkTh0klLON4_-yNLNQkn8UV-_celewATXTV9VyfhvT61SGMadqC0avfXG2sM3CxfBeonP-ia5mdRy_H5tkpOclrewnE8g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvvdekgecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:W6RnaGzRNxW7CJr8Fkeu4BzNFyeOle6PZATRgEzx0iNEkACUFQqWwA>
    <xmx:W6RnaFT3viLpnU4-WTL9IpaNPT_RkVD1WRtpQSm14xneaWDqWGw-Hg>
    <xmx:W6RnaBZj27fibiquz5v3PZIXcWHStSyqtyx5ubpuTWZCduSZV9PsKg>
    <xmx:W6RnaOSFVEJtynw9gsM-sgvp1rGgYtr1imSf7ubAFTNlmdEZKUfvww>
    <xmx:W6RnaKIMCsqFyzS6BFGzpKwT15AugiCawUT_h43-fqIeS4daYhBIU0eB>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 4 Jul 2025 05:52:26 -0400 (EDT)
Date: Fri, 4 Jul 2025 11:52:25 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/5] arm64: dts: renesas: sparrow-hawk: Add overlay
 for IMX219 on J1
Message-ID: <20250704095225.GC137171@ragnatech.se>
References: <20250701112612.3957799-1-niklas.soderlund+renesas@ragnatech.se>
 <20250701112612.3957799-3-niklas.soderlund+renesas@ragnatech.se>
 <20250703230319.GJ3798@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250703230319.GJ3798@pendragon.ideasonboard.com>

Hello Laurent,

Thanks for your time to review this work.

On 2025-07-04 02:03:19 +0300, Laurent Pinchart wrote:
> Hi Niklas,
> 
> Thank you for the patch.
> 
> The comments below apply to 3/5 where applicable.
> 
> On Tue, Jul 01, 2025 at 01:26:09PM +0200, Niklas Söderlund wrote:
> > Add an overlay to connect an IMX219 camera sensor to the J1 connector.
> > The IMX219 utilizes 2 CSI-2 D-PHY lanes. This enables the video capture
> > pipeline behind the CSI40 Rx to be enabled to process images from the
> > sensor.
> > 
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> > * Changes since v1
> > - Drop 'status = "okay"' property for the fixed regulators.
> > ---
> >  arch/arm64/boot/dts/renesas/Makefile          |   3 +
> >  ...8a779g3-sparrow-hawk-camera-j1-imx219.dtso | 118 ++++++++++++++++++
> >  2 files changed, 121 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx219.dtso
> > 
> > diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
> > index 47e46ef99d36..73218f7ec9af 100644
> > --- a/arch/arm64/boot/dts/renesas/Makefile
> > +++ b/arch/arm64/boot/dts/renesas/Makefile
> > @@ -96,7 +96,10 @@ dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g2-white-hawk-single-ard-audio-da7212.dtb
> >  
> >  DTC_FLAGS_r8a779g3-sparrow-hawk += -Wno-spi_bus_bridge
> >  dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk.dtb
> > +dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-camera-j1-imx219.dtbo
> >  dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-fan-pwm.dtbo
> > +r8a779g3-sparrow-hawk-camera-j1-imx219-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-camera-j1-imx219.dtbo
> > +dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-camera-j1-imx219.dtb
> >  r8a779g3-sparrow-hawk-fan-pwm-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-fan-pwm.dtbo
> >  dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-fan-pwm.dtb
> >  
> > diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx219.dtso b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx219.dtso
> > new file mode 100644
> > index 000000000000..a9089d3a4b29
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx219.dtso
> > @@ -0,0 +1,118 @@
> > +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +/*
> > + * Device Tree Overlay for an IMX219 camera sensor in connector J1 on R-Car V4H
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
> > +		status = "okay";
> 
> No need for status.
> 
> > +	};
> > +
> > +	/* Page 29 / CSI_IF_CN / J1 */
> > +	reg_cam_j1: reg_cam_j1 {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "reg_cam_j1";
> > +		enable-active-high;
> > +		gpios = <&gpio0 1 GPIO_ACTIVE_HIGH>;
> 
> No need for a pinctrl entry ?

As far as I can tell, no. No other user of gpio in the renesas DTS sets 
pinctrl for gpio. Inspecting the pinmux configuration further makes me 
believe this is correct.

Without this overlay loaded

  # grep gpio /sys/kernel/debug/pinctrl/e6050000.pinctrl-sh-pfc/pinmux-pins
  Format: pin (name): mux_owner gpio_owner hog?
  pin 65 (GP_2_1): (MUX UNCLAIMED) e6058180.gpio:561
  pin 107 (GP_3_11): (MUX UNCLAIMED) e6058980.gpio:591
  pin 149 (GP_4_21): (MUX UNCLAIMED) e6060180.gpio:631
  pin 150 (GP_4_22): (MUX UNCLAIMED) e6060180.gpio:632
  pin 234 (GP_7_10): (MUX UNCLAIMED) e6061980.gpio:687
  pin 269 (GP_8_13): (MUX UNCLAIMED) e6068180.gpio:711

With this overlay loaded.

  # grep gpio /sys/kernel/debug/pinctrl/e6050000.pinctrl-sh-pfc/pinmux-pins
  Format: pin (name): mux_owner gpio_owner hog?
  pin 1 (GP_0_1): (MUX UNCLAIMED) e6050180.gpio:513
  pin 65 (GP_2_1): (MUX UNCLAIMED) e6058180.gpio:561
  pin 107 (GP_3_11): (MUX UNCLAIMED) e6058980.gpio:591
  pin 149 (GP_4_21): (MUX UNCLAIMED) e6060180.gpio:631
  pin 150 (GP_4_22): (MUX UNCLAIMED) e6060180.gpio:632
  pin 234 (GP_7_10): (MUX UNCLAIMED) e6061980.gpio:687
  pin 269 (GP_8_13): (MUX UNCLAIMED) e6068180.gpio:711

The GP_0_1 pin seems to behave just like the other gpio pins in the system.

I agree with all other comments, thanks!

> 
> > +	};
> > +
> > +	reg_cam_j1_dummy: reg_cam_j1_dummy {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "reg_cam_j1_dummy";
> > +	};
> > +};
> > +
> > +&i2c1 {
> > +	#address-cells = <1>;
> > +	#size-cells = <0>;
> > +	status = "okay";
> > +
> > +	imx219_j1: imx219@10 {
> 
> cam@10, and drop the label (it's unused).
> 
> > +		compatible = "sony,imx219";
> > +		reg = <0x10>;
> > +		status = "okay";
> 
> Drop status.
> 
> > +
> > +		clocks = <&clk_cam_j1>;
> > +
> > +		VANA-supply = <&reg_cam_j1>;
> > +		VDIG-supply = <&reg_cam_j1_dummy>;
> > +		VDDL-supply = <&reg_cam_j1_dummy>;
> 
> You could use the same regulator for the three supplies, and drop
> reg_cam_j1_dummy.
> 
> > +
> > +		orientation = <2>;
> > +		rotation = <0>;
> > +
> > +		port {
> > +			imx219_j1_out: endpoint {
> > +				clock-noncontinuous;
> > +				link-frequencies = /bits/ 64 <456000000>;
> > +				data-lanes = <1 2>;
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
> > +				data-lanes = <1 2>;
> > +				remote-endpoint = <&imx219_j1_out>;
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

