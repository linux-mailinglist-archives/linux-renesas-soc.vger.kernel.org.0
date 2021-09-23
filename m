Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7FFB415504
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Sep 2021 03:10:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238760AbhIWBLv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Sep 2021 21:11:51 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33908 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238177AbhIWBLu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Sep 2021 21:11:50 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E280245E;
        Thu, 23 Sep 2021 03:10:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1632359418;
        bh=xC82oT6LgITr8YUk3dKMHpcWE6XWL0I0o1fufOnwuVY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=o/t+xKJfjJ8fXAWvFWADNci7+gEtpdarJgXJHsBxOVufpBKVeCdfrsqsz1P+1Kv+A
         0KlQ4RyJ1DHzvQ7k4XQIk4OkuyhjkcRukTkTSX9Kg8xclLxyU5xSE8QNRZOL5B5cau
         dMPCWHBo/H8Nna6y8nOolOg0o/x3tPAEZsCLyKxU=
Date:   Thu, 23 Sep 2021 04:10:16 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@glider.be>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 2/3] arm64: dts: renesas: r8a779a0: Add DSI encoders
Message-ID: <YUvT+DKiuyf6WjwR@pendragon.ideasonboard.com>
References: <20210923010402.3418555-1-kieran.bingham@ideasonboard.com>
 <20210923010402.3418555-3-kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210923010402.3418555-3-kieran.bingham@ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

Thank you for the patch.

On Thu, Sep 23, 2021 at 02:04:01AM +0100, Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> Provide the two MIPI DSI encoders on the V3U and connect them to the DU
> accordingly.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
> v2
>  - Fixup indentation
> 
> v3
>  - Fix the clock references
>  - Fixup dsi1 as well
> 
>  arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 64 +++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> index dfe99af89908..b81b2391ed29 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> @@ -1270,12 +1270,76 @@ ports {
>  				port@0 {
>  					reg = <0>;
>  					du_out_dsi0: endpoint {
> +						remote-endpoint = <&dsi0_in>;
>  					};
>  				};
>  
>  				port@1 {
>  					reg = <1>;
>  					du_out_dsi1: endpoint {
> +						remote-endpoint = <&dsi1_in>;
> +					};
> +				};
> +			};
> +		};
> +
> +		dsi0: dsi-encoder@fed80000 {
> +			compatible = "renesas,r8a779a0-dsi-csi2-tx";
> +			reg = <0 0xfed80000 0 0x10000>;
> +			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +			clocks = <&cpg CPG_MOD 415>,
> +				 <&cpg CPG_CORE R8A779A0_CLK_DSI>,
> +				 <&extal_clk>;

I'm not sure if EXTAL is the right clock, the datasheet isn't clear
about this. It's a guess as good as any other of the possible options,
so we could start with it and possibly fix it later, but could you try
to get clarification from Renesas on this ?

> +			clock-names = "fck", "dsi", "pll";
> +
> +			resets = <&cpg 415>;
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
> +					dsi0_out: endpoint {
> +					};
> +				};
> +			};
> +		};
> +
> +		dsi1: dsi-encoder@fed90000 {
> +			compatible = "renesas,r8a779a0-dsi-csi2-tx";
> +			reg = <0 0xfed90000 0 0x10000>;
> +			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +			clocks = <&cpg CPG_MOD 415>,
> +				 <&cpg CPG_CORE R8A779A0_CLK_DSI>,
> +				 <&extal_clk>;
> +			clock-names = "fck", "dsi", "pll";
> +
> +			resets = <&cpg 416>;
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					dsi1_in: endpoint {
> +						remote-endpoint = <&du_out_dsi1>;
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					dsi1_out: endpoint {
>  					};
>  				};
>  			};

-- 
Regards,

Laurent Pinchart
