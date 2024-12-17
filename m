Return-Path: <linux-renesas-soc+bounces-11489-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A17A99F5A97
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 00:42:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E22C18905C1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 23:42:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 312591FA826;
	Tue, 17 Dec 2024 23:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HcMUA7eY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116AB1FA15E;
	Tue, 17 Dec 2024 23:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734478942; cv=none; b=COI46YI3KjTjrOgdjnx9cUVwDi5AJiXJrVva9rFl+El6IN0DofHumRZq9Ar99TuEgd6SG6BxORI3h0TXR5WUbQUsQ9W8ipkjxe/w0833gevAdHLM3ltUN/hrsCbtKPotSO11XO5F9SrBLfsMrFmWeSsdlpDwht7778ic0zF6wOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734478942; c=relaxed/simple;
	bh=bPEX45w+AOSS0JiDFIAR28D1ZvLS8uGwXLhPHtcFTmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=euGjnPLO1cKHkL2CjyegEX923zS6jffPP8Sa+WdlSvTANYdiWEHNo2JJpsooKCBcDHOjvIXbhZfZBAdcouznSGqZEMWcgfTQk7xtWlRKwFPoyksMw/ix5cV1QsSAIuKZCPo3wRL6eFiWrzolRDh01Nit/ydS6LGGUd9oQCKLpo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HcMUA7eY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B2A86415;
	Wed, 18 Dec 2024 00:41:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734478900;
	bh=bPEX45w+AOSS0JiDFIAR28D1ZvLS8uGwXLhPHtcFTmQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HcMUA7eYN5q4DnSKKQsnObKmjMiJf6KtE77hQxl1HbzwKEmOUn9euMrDTglqbNVAr
	 552IntsRNEijv2C35a929DVP4m+ZlclEjuO2tXMXAUzblZnzEgjXUZDu6O4uMvhg2L
	 K2iLofnAaL5MD8nTd7R4VV24sSBPWN+AJQV25ISU=
Date: Wed, 18 Dec 2024 01:42:15 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: renesas: r8a779g0: Add VSPX instances
Message-ID: <20241217234215.GQ23470@pendragon.ideasonboard.com>
References: <20241217-rcar-v4h-vspx-v1-0-de04ea044ed4@ideasonboard.com>
 <20241217-rcar-v4h-vspx-v1-4-de04ea044ed4@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241217-rcar-v4h-vspx-v1-4-de04ea044ed4@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Tue, Dec 17, 2024 at 06:53:17PM +0100, Jacopo Mondi wrote:
> Add device nodes for the VSPX instances on R-Car V4H (R8A779G0) SoC.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> index e49748563e2f5706ed982d6c9cc1df59f27bd0dc..bf4ec5fb7bbdba55e2994f332fcbd623839079c2 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> @@ -2211,6 +2211,28 @@ vspd1: vsp@fea28000 {
>  			renesas,fcp = <&fcpvd1>;
>  		};
>  
> +		vspx0: vsp@fedd0000 {

Please keep those sorted by unit address too.

> +			compatible = "renesas,vsp2";
> +			reg = <0 0xfedd0000 0 0x8000>;
> +			interrupts = <GIC_SPI 556 IRQ_TYPE_LEVEL_HIGH>;

The interrupts are listed as "negative level sensitive" in the
documentation. Tomi encountered a similar situation with the V4M VSP,
and setting the level to low in the DT didn't work. I assume this will
be fine, but if you encounter interrupt issues, this is one possible
area to investigate.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> +			clocks = <&cpg CPG_MOD 1028>;
> +			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
> +			resets = <&cpg 1028>;
> +
> +			renesas,fcp = <&fcpvx0>;
> +		};
> +
> +		vspx1: vsp@fedd8000 {
> +			compatible = "renesas,vsp2";
> +			reg = <0 0xfedd8000 0 0x8000>;
> +			interrupts = <GIC_SPI 557 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 1029>;
> +			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
> +			resets = <&cpg 1029>;
> +
> +			renesas,fcp = <&fcpvx1>;
> +		};
> +
>  		du: display@feb00000 {
>  			compatible = "renesas,du-r8a779g0";
>  			reg = <0 0xfeb00000 0 0x40000>;

-- 
Regards,

Laurent Pinchart

