Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 37A29C3F98
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Oct 2019 20:17:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727012AbfJASP3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Oct 2019 14:15:29 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:52764 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726873AbfJASP3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Oct 2019 14:15:29 -0400
Received: from pendragon.ideasonboard.com (modemcable151.96-160-184.mc.videotron.ca [184.160.96.151])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 37D5423F;
        Tue,  1 Oct 2019 20:15:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1569953727;
        bh=86nsN552q+haf8jDERWIzoLql1be2Mxs5f7/mvm6Pag=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Kgtvuw3QpqgbgGUq1B9ctnRkkJ3lpnO0PVnmzJajrVeMXnySGOL/dmyuJi3R4lWBB
         9+0OmNsYtSesA9tA32uXq+IXuCViarTpXM5Ek8XLRmwNt31eTyxBDTpFricXr28MUE
         Dk8Mwc3rwCmuRwf/EQv9+0iicJsrng1iGkT5Eo9I=
Date:   Tue, 1 Oct 2019 21:15:12 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Simon Horman <horms@verge.net.au>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH 3/8] arm64: dts: renesas: r8a774b1: Add HDMI encoder
 instance
Message-ID: <20191001181512.GE4735@pendragon.ideasonboard.com>
References: <1569932124-32010-1-git-send-email-biju.das@bp.renesas.com>
 <1569932124-32010-4-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1569932124-32010-4-git-send-email-biju.das@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

Thank you for the patch.

On Tue, Oct 01, 2019 at 01:15:19PM +0100, Biju Das wrote:
> Add the HDMI encoder to the R8A774B1 DT in disabled state.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  arch/arm64/boot/dts/renesas/r8a774b1.dtsi | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
> index 777b45d..979be5a 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
> @@ -1267,7 +1267,16 @@
>  		};
>  
>  		hdmi0: hdmi@fead0000 {
> +			compatible = "renesas,r8a774b1-hdmi",
> +				     "renesas,rcar-gen3-hdmi";
>  			reg = <0 0xfead0000 0 0x10000>;
> +			interrupts = <GIC_SPI 389 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 729>,
> +				 <&cpg CPG_CORE R8A774B1_CLK_HDMI>;
> +			clock-names = "iahb", "isfr";
> +			power-domains = <&sysc R8A774B1_PD_ALWAYS_ON>;
> +			resets = <&cpg 729>;
> +			status = "disabled";
>  
>  			ports {
>  				#address-cells = <1>;
> @@ -1276,11 +1285,16 @@
>  				port@0 {
>  					reg = <0>;
>  					dw_hdmi0_in: endpoint {
> +						remote-endpoint = <&du_out_hdmi0>;
>  					};
>  				};
>  				port@1 {
>  					reg = <1>;
>  				};
> +				port@2 {
> +					/* HDMI sound */
> +					reg = <2>;
> +				};
>  			};
>  		};
>  
> @@ -1310,6 +1324,7 @@
>  				port@1 {
>  					reg = <1>;
>  					du_out_hdmi0: endpoint {
> +						remote-endpoint = <&dw_hdmi0_in>;
>  					};
>  				};
>  				port@2 {

-- 
Regards,

Laurent Pinchart
