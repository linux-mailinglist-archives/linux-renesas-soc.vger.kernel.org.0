Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E00622DC602
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Dec 2020 19:16:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729859AbgLPSQD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Dec 2020 13:16:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729855AbgLPSQD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Dec 2020 13:16:03 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 11ACDC061794;
        Wed, 16 Dec 2020 10:15:23 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C04FC2CF;
        Wed, 16 Dec 2020 19:15:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1608142521;
        bh=Zod74+lU0JtBwqEtrDwHbiwjFkzk6Uqdpwthggmdb3M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rZQwj8j282864o40wilarrhFB/Nlh+GMEJBcz8GWkgcrxVebbb3y3iK2PNvfyzA5I
         Z+oGfOPvsUl3ESP2nS4Dd/yocRzK7CR3C2VEMt/KyzPYCilFn7TmrXqXbtcajN149u
         HyMvCY1WG/R4bEBf9AfcWZ6FYxDW5rTd1NNgzXGY=
Date:   Wed, 16 Dec 2020 20:15:14 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Geert Uytterhoeven <geert@glider.be>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: r8a779a0: Add VSPX support
Message-ID: <X9pOshuRzdT6cs1Z@pendragon.ideasonboard.com>
References: <20201216170018.861710-1-kieran.bingham+renesas@ideasonboard.com>
 <20201216170018.861710-4-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201216170018.861710-4-kieran.bingham+renesas@ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

Thank you for the patch.

On Wed, Dec 16, 2020 at 05:00:18PM +0000, Kieran Bingham wrote:
> Provide VSP-X support on the V3U.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
> The FCPvX is not yet connected here, as the clock domains are unclear
> for that.
> 
> The register mapping space is kept at 0x8000 for now as this is a bit of
> an unknown entity (with the IIF) so playing it safe and keeping the same
> value as the BSP (0x8000) - however with no CLU on these nodes, I expect
> the register space to be suitable to be mapped at length 0x4000.

I think so too.

>  arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 36 +++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> index a23b4ce2e5f4..4fb28df5cd6b 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> @@ -155,6 +155,42 @@ vspd1: vsp@fea28000 {
>  			renesas,fcp = <&fcpvd1>;
>  		};
>  
> +		vspx0: vsp@fedd0000 {
> +			compatible = "renesas,vsp2";
> +			reg = <0 0xfedd0000 0 0x8000>;
> +			interrupts = <GIC_SPI 600 IRQ_TYPE_LEVEL_HIGH>;

I'm not entirely sure about the interrupt number, as there are other
VSP-related interrupts listed in the datasheet that don't seem to
correspond to any IP core. I suppose there will be a documentation
update at some point. For now I have no reason to believe the interrupts
here are incorrect.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +			clocks = <&cpg CPG_MOD 1028>;
> +			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +			resets = <&cpg 1028>;
> +		};
> +
> +		vspx1: vsp@fedd8000 {
> +			compatible = "renesas,vsp2";
> +			reg = <0 0xfedd8000 0 0x8000>;
> +			interrupts = <GIC_SPI 601 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 1029>;
> +			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +			resets = <&cpg 1029>;
> +		};
> +
> +		vspx2: vsp@fede0000 {
> +			compatible = "renesas,vsp2";
> +			reg = <0 0xfede0000 0 0x8000>;
> +			interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 1030>;
> +			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +			resets = <&cpg 1030>;
> +		};
> +
> +		vspx3: vsp@fede8000 {
> +			compatible = "renesas,vsp2";
> +			reg = <0 0xfede8000 0 0x8000>;
> +			interrupts = <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 1031>;
> +			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +			resets = <&cpg 1031>;
> +		};
> +
>  		prr: chipid@fff00044 {
>  			compatible = "renesas,prr";
>  			reg = <0 0xfff00044 0 4>;

-- 
Regards,

Laurent Pinchart
