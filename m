Return-Path: <linux-renesas-soc+bounces-11488-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5019F5A5A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Dec 2024 00:31:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7FED47A2009
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Dec 2024 23:31:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E580F1DF260;
	Tue, 17 Dec 2024 23:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="b2l+jcA+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4418C38F9C;
	Tue, 17 Dec 2024 23:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734478261; cv=none; b=bQBQD0PTcy4rxs1UhXkFzxwVO2ZvwMazKG4zGjtZ5ZDWEia/He8YdtXvwnmLtLI7oBT8Dj6OFndugAU+26M/+hTLx7kdwQwR5+FGD1bz6/Trb7DBH+Vg97dLbDeZdLHlD+Xz5q7YKXMLN/h0Ihj+1YuU4CKvptY3HZLDxWwjdds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734478261; c=relaxed/simple;
	bh=pqFb0fRhDaGQe9FnLfQabvYYIWWhDb/yY9LO2iXNCfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QGqzZEQc0LaabnaFcy5FS9aqiMR9s7qDDQNrjdLR7eAH3a1HmlgCbN8M5M35spInCQBKkLgXLy79xYnt+n+uQ7xW8s3HK2AD+DF+HFP6jt0cxgoJCWIokYabqVdcKUB+OrdVBFchTEgr+OIAXuWCt2PicgmiZiZSy7ZgZhqp/BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=b2l+jcA+; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 91207415;
	Wed, 18 Dec 2024 00:30:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1734478219;
	bh=pqFb0fRhDaGQe9FnLfQabvYYIWWhDb/yY9LO2iXNCfY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b2l+jcA+Z/C41+Q1PFlZO2U1xLZzFGgcMRs48tBdLA6SgCtvl/Tye9djLG2Krf10P
	 BEDf1jtuxkCSY/RpprBUzu5fVmZAjd90aV43JTiGHHbthw54lTGjrZMtI92kmarVQQ
	 fToB7p/4x/lY5H2o4Wsz2SvoD15kMmrbXP7WEVUs=
Date: Wed, 18 Dec 2024 01:30:54 +0200
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
Subject: Re: [PATCH 2/4] arm64: dts: renesas: r8a779g0: Add FCPVX instances
Message-ID: <20241217233054.GP23470@pendragon.ideasonboard.com>
References: <20241217-rcar-v4h-vspx-v1-0-de04ea044ed4@ideasonboard.com>
 <20241217-rcar-v4h-vspx-v1-2-de04ea044ed4@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241217-rcar-v4h-vspx-v1-2-de04ea044ed4@ideasonboard.com>

Hi Jacopo,

Thank you for the patch.

On Tue, Dec 17, 2024 at 06:53:15PM +0100, Jacopo Mondi wrote:
> Add device nodes for the FCPVX instances on R-Car V4H (R8A779G0) SoC.
> 
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> ---
>  arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> index 61c6b8022ffdc3b22444fb13e748b4aaebe454a4..e49748563e2f5706ed982d6c9cc1df59f27bd0dc 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
> @@ -2171,6 +2171,24 @@ fcpvd1: fcp@fea11000 {
>  			iommus = <&ipmmu_vi1 7>;
>  		};
>  
> +		fcpvx0: fcp@fedb0000 {

Please sort the nodes by unit address.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> +			compatible = "renesas,fcpv";
> +			reg = <0 0xfedb0000 0 0x200>;
> +			clocks = <&cpg CPG_MOD 1100>;
> +			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
> +			resets = <&cpg 1100>;
> +			iommus = <&ipmmu_vi1 24>;
> +		};
> +
> +		fcpvx1: fcp@fedb8000 {
> +			compatible = "renesas,fcpv";
> +			reg = <0 0xfedb8000 0 0x200>;
> +			clocks = <&cpg CPG_MOD 1101>;
> +			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
> +			resets = <&cpg 1101>;
> +			iommus = <&ipmmu_vi1 25>;
> +		};
> +
>  		vspd0: vsp@fea20000 {
>  			compatible = "renesas,vsp2";
>  			reg = <0 0xfea20000 0 0x7000>;

-- 
Regards,

Laurent Pinchart

