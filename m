Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9778523F8FB
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  8 Aug 2020 23:13:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726457AbgHHVNm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 8 Aug 2020 17:13:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726200AbgHHVNl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 8 Aug 2020 17:13:41 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A745AC061756;
        Sat,  8 Aug 2020 14:13:41 -0700 (PDT)
Received: from pendragon.ideasonboard.com (85-76-78-184-nat.elisa-mobile.fi [85.76.78.184])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 92B2AF9;
        Sat,  8 Aug 2020 23:13:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1596921219;
        bh=rtS6tS3nmrZ2AAjnJbktvLuwGb3JE1Bru8oeDg8DkDk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NL2MjYY6cydNHOnjQ3wufTITscClL0972hLsySCWwOibCWKCN688Uw4V3/Fbm2suL
         W9K5hSXQP1N+476ZYm7l669wpGinOL66oDPrQi+t44XlEiJkRABi64nwAu30io5yBK
         4FlXBL5PUt15aEtA3ql4FPp941fPuSr382DhpS+I=
Date:   Sun, 9 Aug 2020 00:13:23 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH 6/7] ARM: dts: r8a7742: Add LVDS support
Message-ID: <20200808211323.GR6186@pendragon.ideasonboard.com>
References: <20200807174954.14448-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20200807174954.14448-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200807174954.14448-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Prabhakar,

Thank you for the patch.

On Fri, Aug 07, 2020 at 06:49:53PM +0100, Lad Prabhakar wrote:
> Add LVDS encoder node to r8a7742 SoC DT.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
> ---
>  arch/arm/boot/dts/r8a7742.dtsi | 54 ++++++++++++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/r8a7742.dtsi b/arch/arm/boot/dts/r8a7742.dtsi
> index a979a4b3de61..a7e66220d63a 100644
> --- a/arch/arm/boot/dts/r8a7742.dtsi
> +++ b/arch/arm/boot/dts/r8a7742.dtsi
> @@ -1534,11 +1534,65 @@
>  				port@1 {
>  					reg = <1>;
>  					du_out_lvds0: endpoint {
> +						remote-endpoint = <&lvds0_in>;
>  					};
>  				};
>  				port@2 {
>  					reg = <2>;
>  					du_out_lvds1: endpoint {
> +						remote-endpoint = <&lvds1_in>;
> +					};
> +				};
> +			};
> +		};
> +
> +		lvds0: lvds@feb90000 {
> +			compatible = "renesas,r8a7742-lvds";
> +			reg = <0 0xfeb90000 0 0x1c>;

Isn't 0x14 enough for the size ? 0x1c won't hurt though. Same comment
below.

With or without this addressed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +			clocks = <&cpg CPG_MOD 726>;
> +			power-domains = <&sysc R8A7742_PD_ALWAYS_ON>;
> +			resets = <&cpg 726>;
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					lvds0_in: endpoint {
> +						remote-endpoint = <&du_out_lvds0>;
> +					};
> +				};
> +				port@1 {
> +					reg = <1>;
> +					lvds0_out: endpoint {
> +					};
> +				};
> +			};
> +		};
> +
> +		lvds1: lvds@feb94000 {
> +			compatible = "renesas,r8a7742-lvds";
> +			reg = <0 0xfeb94000 0 0x1c>;
> +			clocks = <&cpg CPG_MOD 725>;
> +			power-domains = <&sysc R8A7742_PD_ALWAYS_ON>;
> +			resets = <&cpg 725>;
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					lvds1_in: endpoint {
> +						remote-endpoint = <&du_out_lvds1>;
> +					};
> +				};
> +				port@1 {
> +					reg = <1>;
> +					lvds1_out: endpoint {
>  					};
>  				};
>  			};

-- 
Regards,

Laurent Pinchart
