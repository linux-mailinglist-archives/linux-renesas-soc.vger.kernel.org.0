Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F5734153F3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Sep 2021 01:34:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238467AbhIVXgR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Sep 2021 19:36:17 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:32954 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238464AbhIVXgR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Sep 2021 19:36:17 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5C5DFE52;
        Thu, 23 Sep 2021 01:34:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1632353685;
        bh=MIrVABDYWHCGJzB9/BmlbQLoUsEOutxAJ2L3tovFquI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=uX2PgFISYiYkNDCrwsZWgsPcjsEv5FVRn1Mbn4otc7kLnG8yY1d3CbBlFPuWqVOIe
         DrQ2qNMsr2zh7hbOULy1u2SSCbiQWufxfv4iqr2yGyY1gdD3fKpecHksLcUjEILluE
         qCRyje+D9bjDQRzobVd/vv2p+ofhfNKUIzF7UVzk=
Date:   Thu, 23 Sep 2021 02:34:44 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Geert Uytterhoeven <geert@glider.be>,
        linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] arm64: dts: renesas: r8a779a0: Add DSI encoders
Message-ID: <YUu9lKb0gdzk0ewN@pendragon.ideasonboard.com>
References: <20210901235330.1611086-1-kieran.bingham@ideasonboard.com>
 <20210901235330.1611086-3-kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210901235330.1611086-3-kieran.bingham@ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

Thank you for the patch.

On Thu, Sep 02, 2021 at 12:53:29AM +0100, Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> Provide the two MIPI DSI encoders on the V3U and connect them to the DU
> accordingly.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> 
> ---
> v2
>  - Fixup indentation
> 
>  arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 60 +++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> index 3241f7e7c01e..1ce9884ea527 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> @@ -1161,12 +1161,72 @@ ports {
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
> +				 <&cpg CPG_CORE R8A779A0_CLK_DSI>;
> +			clock-names = "fck", "dsi";
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
> +			clocks = <&cpg CPG_MOD 416>,
> +				 <&cpg CPG_CORE R8A779A0_CLK_DSI>;
> +			clock-names = "fck", "dsi";
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
