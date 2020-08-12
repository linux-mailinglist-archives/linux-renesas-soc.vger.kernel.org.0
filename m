Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A68B242CF8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Aug 2020 18:16:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726506AbgHLQQp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Aug 2020 12:16:45 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54126 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726456AbgHLQQp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Aug 2020 12:16:45 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0C5F29E7;
        Wed, 12 Aug 2020 18:16:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1597249003;
        bh=GnILM1wkEwi3g4hfG94JDaooe1G0Qp5Zk9v7L7UWwCY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=C7wUEdBWQukyaPAWrzPc4mvzUc0Nd2ezktEH3lKe/YEDVlet1xFJz0J2aoWWAZ9Pd
         zp4D0mgz5IhndPu49MVV/e3FwVm+RwXiZUSGhiwwS51f0ZumcjNWnIDxpqYNG2dvmf
         AU4g0PrhGgZX4kOspOdG9kw87nNmzxPzgmSxCdXg=
Date:   Wed, 12 Aug 2020 19:16:29 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Marian-Cristian Rotariu 
        <marian-cristian.rotariu.rb@bp.renesas.com>
Subject: Re: [PATCH 3/9] arm64: dts: renesas: r8a774e1: Populate DU device
 node
Message-ID: <20200812161629.GM6057@pendragon.ideasonboard.com>
References: <20200812140217.24251-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200812140217.24251-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200812140217.24251-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

Thank you for the patch.

On Wed, Aug 12, 2020 at 03:02:11PM +0100, Lad Prabhakar wrote:
> From: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> 
> Populate the DU device node properties in R8A774E1 SoC dtsi.
> 
> Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  arch/arm64/boot/dts/renesas/r8a774e1.dtsi | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
> index abaa6d7f6b31..4b57c1ea762c 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
> @@ -2623,22 +2623,39 @@
>  		};
>  
>  		du: display@feb00000 {
> +			compatible = "renesas,du-r8a774e1";
>  			reg = <0 0xfeb00000 0 0x80000>;
> +			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 270 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 724>,
> +				 <&cpg CPG_MOD 723>,
> +				 <&cpg CPG_MOD 721>;
> +			clock-names = "du.0", "du.1", "du.3";
> +			resets = <&cpg 724>, <&cpg 722>;
> +			reset-names = "du.0", "du.3";
>  			status = "disabled";
>  
> -			/* placeholder */
> +			renesas,vsps = <&vspd0 0>, <&vspd1 0>, <&vspd0 1>;
> +
>  			ports {
>  				#address-cells = <1>;
>  				#size-cells = <0>;
>  
>  				port@0 {
>  					reg = <0>;
> +					du_out_rgb: endpoint {
> +					};
>  				};
>  				port@1 {
>  					reg = <1>;
> +					du_out_hdmi0: endpoint {
> +					};
>  				};
>  				port@2 {
>  					reg = <2>;
> +					du_out_lvds0: endpoint {
> +					};
>  				};
>  			};
>  		};

-- 
Regards,

Laurent Pinchart
