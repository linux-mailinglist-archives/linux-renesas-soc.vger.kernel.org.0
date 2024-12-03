Return-Path: <linux-renesas-soc+bounces-10816-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 851AC9E1C4F
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 13:37:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8FC01B47D25
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 10:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E26B1E3768;
	Tue,  3 Dec 2024 10:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SUMpr5Pq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FAF1E2605;
	Tue,  3 Dec 2024 10:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733222424; cv=none; b=J81/xUHA4KyGzQjtO0nP4J9hrrDYGk5KVXHgsbNaxW/DNtSRjmcV7ZPlio4SIQqFtHqhDRhtUaBTLdA66Z+102ZHotWBYkRfUZEfWxQga5mqZGzxrSqDhXhrv06nX1DPbpeFPuZA7nBOtnGYzdaulRKnHNR5CGsSgcc4C68hWVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733222424; c=relaxed/simple;
	bh=AgD4sUxGspGjnJqKj6uE5BA2J1nTqX8g/zDM10q08B0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WvwTwm5g8CBryfC9t55twLB1ElSjPGFkG+anaQJyOyHcHqJ4z8CkHF4tM8itoiCm2pQeatMbigpFnmy1Sjo8whwqLfL7Qi3ty1JetaidGaNcfAX4iJIaWCab92+jQ4BnmU8zlnCnFIp1eYt0PRUUHfQ48dCliZWFEHUiEEuOGds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SUMpr5Pq; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E67808DB;
	Tue,  3 Dec 2024 11:39:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733222391;
	bh=AgD4sUxGspGjnJqKj6uE5BA2J1nTqX8g/zDM10q08B0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SUMpr5Pqiart36e+UnmS+68J5xy25ZrQyWErnK4XJLIgVtNJU4/SAhaAfipIiBgmP
	 CE0aC+w9ZivDv7e+1tHUXYv/ImhqMj3wOGDRlILD9yzvBosAuEvZpxSxdiqfY9VSH/
	 pyfYwBSmifXlB+eymmPgl5Dthvo+lh0rNjiB9nVo=
Date: Tue, 3 Dec 2024 12:40:06 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, LUU HOAI <hoai.luu.ub@renesas.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: Re: [PATCH 9/9] arm64: dts: renesas: gray-hawk-single: Add
 DisplayPort support
Message-ID: <20241203104006.GM10736@pendragon.ideasonboard.com>
References: <20241203-rcar-gh-dsi-v1-0-738ae1a95d2a@ideasonboard.com>
 <20241203-rcar-gh-dsi-v1-9-738ae1a95d2a@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241203-rcar-gh-dsi-v1-9-738ae1a95d2a@ideasonboard.com>

Hi Tomi,

Thank you for the patch.

On Tue, Dec 03, 2024 at 10:01:43AM +0200, Tomi Valkeinen wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> Add support for the mini DP output on the Gray Hawk board.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Assuming this has passed the DT checks,

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  .../boot/dts/renesas/r8a779h0-gray-hawk-single.dts | 95 ++++++++++++++++++++++
>  1 file changed, 95 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
> index 057f959d67b3..7cdf07b6dde6 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
> @@ -59,6 +59,12 @@ chosen {
>  		stdout-path = "serial0:921600n8";
>  	};
>  
> +	sn65dsi86_refclk: clk-x6 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <38400000>;
> +	};
> +
>  	keys {
>  		compatible = "gpio-keys";
>  
> @@ -126,6 +132,27 @@ memory@480000000 {
>  		reg = <0x4 0x80000000 0x1 0x80000000>;
>  	};
>  
> +	mini-dp-con {
> +		compatible = "dp-connector";
> +		label = "CN5";
> +		type = "mini";
> +
> +		port {
> +			mini_dp_con_in: endpoint {
> +				remote-endpoint = <&sn65dsi86_out0>;
> +			};
> +		};
> +	};
> +
> +	reg_1p2v: regulator-1p2v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "fixed-1.2V";
> +		regulator-min-microvolt = <1200000>;
> +		regulator-max-microvolt = <1200000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
> +
>  	reg_1p8v: regulator-1p8v {
>  		compatible = "regulator-fixed";
>  		regulator-name = "fixed-1.8V";
> @@ -200,6 +227,24 @@ channel1 {
>  	};
>  };
>  
> +&dsi0 {
> +	status = "okay";
> +
> +	ports {
> +		port@1 {
> +			reg = <1>;
> +			dsi0_out: endpoint {
> +				remote-endpoint = <&sn65dsi86_in0>;
> +				data-lanes = <1 2 3 4>;
> +			};
> +		};
> +	};
> +};
> +
> +&du {
> +	status = "okay";
> +};
> +
>  &extal_clk {
>  	clock-frequency = <16666666>;
>  };
> @@ -269,6 +314,51 @@ eeprom@53 {
>  	};
>  };
>  
> +&i2c1 {
> +	pinctrl-0 = <&i2c1_pins>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +	clock-frequency = <400000>;
> +
> +	bridge@2c {
> +		compatible = "ti,sn65dsi86";
> +		reg = <0x2c>;
> +
> +		clocks = <&sn65dsi86_refclk>;
> +		clock-names = "refclk";
> +
> +		interrupt-parent = <&intc_ex>;
> +		interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
> +
> +		enable-gpios = <&gpio1 26 GPIO_ACTIVE_HIGH>;
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
> +				sn65dsi86_in0: endpoint {
> +					remote-endpoint = <&dsi0_out>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +				sn65dsi86_out0: endpoint {
> +					remote-endpoint = <&mini_dp_con_in>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
>  &i2c3 {
>  	pinctrl-0 = <&i2c3_pins>;
>  	pinctrl-names = "default";
> @@ -361,6 +451,11 @@ i2c0_pins: i2c0 {
>  		function = "i2c0";
>  	};
>  
> +	i2c1_pins: i2c1 {
> +		groups = "i2c1";
> +		function = "i2c1";
> +	};
> +
>  	i2c3_pins: i2c3 {
>  		groups = "i2c3";
>  		function = "i2c3";

-- 
Regards,

Laurent Pinchart

