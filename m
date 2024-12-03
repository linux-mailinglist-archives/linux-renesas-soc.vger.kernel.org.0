Return-Path: <linux-renesas-soc+bounces-10814-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2699E17D8
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 10:38:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04941283405
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 09:38:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBBEE1DFE20;
	Tue,  3 Dec 2024 09:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="YKuB4AXb"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181981DFE2E;
	Tue,  3 Dec 2024 09:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733218639; cv=none; b=glglvok/m6enF8IlZ9LB/nu0VJ4ThkTaTY3vvFfWIKGcSYR6E90NsMfA88d90gWzPy6lnsf6LxlzUp+USV6ev1Ox5nW1dym9idMmhp5xsScw5h5MmfB2/x8YVfoWzuzsQvf+biCV27Nw/hay9GVyOwlOSGMZzOq7pyBEOzuP5KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733218639; c=relaxed/simple;
	bh=jQXX/Tc40kph/7OBLJnEEHlRiFU1zhsnN3QXwzQG3EA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M1pRPBaDJ2IDR9Ch1BEgzvvIqzzPun3IdTeTdi+X+VujlPZ1QgkarcDhJEDMbfUbakkQz3Hbjrv4BeNfYfnM0FvZxxdwJQEajejwSUvhJhkRXbCKhfNMuOyfmuRx5+O2OnpvoozwrX7RMP10OXlXi9SaclY6D6pd/xaIPiITekE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=YKuB4AXb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C59994CE;
	Tue,  3 Dec 2024 10:36:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733218608;
	bh=jQXX/Tc40kph/7OBLJnEEHlRiFU1zhsnN3QXwzQG3EA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YKuB4AXbRMhscTWbDWfRTbNGPURysibT8ay+/BUsYsk5ruwPwvod/Z8ANtwVLPX+m
	 4YUAPFw7VbQrfWN2PeXlVZ4elGmpGiXE/IkctEaJ3V6P5Bhn17BRaPHmPKJMeiipoL
	 1eD1zdRGU6DB72E6rDe9aTcpZCkqD+QwOjko6uCk=
Date: Tue, 3 Dec 2024 11:37:03 +0200
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
Subject: Re: [PATCH 8/9] arm64: dts: renesas: r8a779h0: Add display support
Message-ID: <20241203093703.GL10736@pendragon.ideasonboard.com>
References: <20241203-rcar-gh-dsi-v1-0-738ae1a95d2a@ideasonboard.com>
 <20241203-rcar-gh-dsi-v1-8-738ae1a95d2a@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241203-rcar-gh-dsi-v1-8-738ae1a95d2a@ideasonboard.com>

Hi Tomi,

Thank you for the patch.

On Tue, Dec 03, 2024 at 10:01:42AM +0200, Tomi Valkeinen wrote:
> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> 
> Add the device nodes for supporting DU and DSI.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a779h0.dtsi | 77 +++++++++++++++++++++++++++++++
>  1 file changed, 77 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
> index 12d8be3fd579..82df6ee98afb 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
> @@ -1828,6 +1828,54 @@ csi41isp1: endpoint {
>  			};
>  		};
>  
> +		fcpvd0: fcp@fea10000 {
> +			compatible = "renesas,fcpv";
> +			reg = <0 0xfea10000 0 0x200>;
> +			clocks = <&cpg CPG_MOD 508>;
> +			power-domains = <&sysc R8A779H0_PD_C4>;
> +			resets = <&cpg 508>;
> +		};
> +
> +		vspd0: vsp@fea20000 {
> +			compatible = "renesas,vsp2";
> +			reg = <0 0xfea20000 0 0x8000>;
> +			interrupts = <GIC_SPI 546 IRQ_TYPE_LEVEL_HIGH>;

The documentation lists this interrupt as being LevelSensitive and
Negative. I wouldn't expect the VSP to work at all with a wrong polarity
in DT, so the level may get inverted somewhere.

> +			clocks = <&cpg CPG_MOD 830>;
> +			power-domains = <&sysc R8A779H0_PD_C4>;
> +			resets = <&cpg 830>;
> +			renesas,fcp = <&fcpvd0>;
> +		};
> +
> +		du: display@feb00000 {
> +			compatible = "renesas,du-r8a779h0";
> +			reg = <0 0xfeb00000 0 0x40000>;
> +			interrupts = <GIC_SPI 523 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 411>;
> +			clock-names = "du.0";
> +			power-domains = <&sysc R8A779H0_PD_C4>;
> +			resets = <&cpg 411>;
> +			reset-names = "du.0";
> +			renesas,vsps = <&vspd0 0>;
> +
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					du_out_dsi0: endpoint {
> +						remote-endpoint = <&dsi0_in>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +				};

On V4M the DU has a single channel, so there should be a single port.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> +			};
> +		};
> +
>  		isp0: isp@fed00000 {
>  			compatible = "renesas,r8a779h0-isp",
>  				     "renesas,rcar-gen4-isp";
> @@ -1996,6 +2044,35 @@ isp1vin15: endpoint {
>  			};
>  		};
>  
> +		dsi0: dsi-encoder@fed80000 {
> +			compatible = "renesas,r8a779h0-dsi-csi2-tx";
> +			reg = <0 0xfed80000 0 0x10000>;
> +			clocks = <&cpg CPG_MOD 415>,
> +				 <&cpg CPG_CORE R8A779H0_CLK_DSIEXT>,
> +				 <&cpg CPG_CORE R8A779H0_CLK_DSIREF>;
> +			clock-names = "fck", "dsi", "pll";
> +			power-domains = <&sysc R8A779H0_PD_C4>;
> +			resets = <&cpg 415>;
> +
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					dsi0_in: endpoint {
> +						remote-endpoint = <&du_out_dsi0>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +				};
> +			};
> +		};
> +
>  		prr: chipid@fff00044 {
>  			compatible = "renesas,prr";
>  			reg = <0 0xfff00044 0 4>;

-- 
Regards,

Laurent Pinchart

