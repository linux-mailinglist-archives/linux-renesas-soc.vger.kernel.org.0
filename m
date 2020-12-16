Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A278F2DC5A4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Dec 2020 18:48:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727984AbgLPRrQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Dec 2020 12:47:16 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:43080 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727978AbgLPRrP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Dec 2020 12:47:15 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B7E582CF;
        Wed, 16 Dec 2020 18:46:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1608140793;
        bh=F1I8kpwJ/Y7W06xiep37AW2/M6Ym3cv/FRi8ZLu/y8E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=sErRLg27LALpRC/k49rCYFd4GRKj9bIO2lFEb65jy/4m9GgAxW6k/+fywYak4wpvg
         g+qQ1v6/fR879wSjZg2Ktp/kyVgWiCMloSiVlQZC3bETKXxRLHr+/AbUg0x1SYqwkn
         TEw0RxuNdC9U9cHCVTawenwSR7410SkCFK8mIKCQ=
Date:   Wed, 16 Dec 2020 19:46:27 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     Geert Uytterhoeven <geert@glider.be>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 2/3] arm64: dts: renesas: r8a779a0: Add VSPD support
Message-ID: <X9pH83gPyGf6miCa@pendragon.ideasonboard.com>
References: <20201216170018.861710-1-kieran.bingham+renesas@ideasonboard.com>
 <20201216170018.861710-3-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201216170018.861710-3-kieran.bingham+renesas@ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

Thank you for the patch.

On Wed, Dec 16, 2020 at 05:00:17PM +0000, Kieran Bingham wrote:
> Provide VSPD support on the V3U.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> index ba6fbbd8710e..a23b4ce2e5f4 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> @@ -133,6 +133,28 @@ fcpvd1: fcp@fea11000 {
>  			resets = <&cpg 509>;
>  		};
>  
> +		vspd0: vsp@fea20000 {
> +			compatible = "renesas,vsp2";
> +			reg = <0 0xfea20000 0 0x5000>;
> +			interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 830>;
> +			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +			resets = <&cpg 830>;
> +
> +			renesas,fcp = <&fcpvd0>;
> +		};
> +
> +		vspd1: vsp@fea28000 {
> +			compatible = "renesas,vsp2";
> +			reg = <0 0xfea28000 0 0x5000>;
> +			interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 831>;
> +			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +			resets = <&cpg 831>;
> +
> +			renesas,fcp = <&fcpvd1>;
> +		};
> +
>  		prr: chipid@fff00044 {
>  			compatible = "renesas,prr";
>  			reg = <0 0xfff00044 0 4>;

-- 
Regards,

Laurent Pinchart
