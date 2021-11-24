Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 116E845D00D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Nov 2021 23:25:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344015AbhKXW20 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Nov 2021 17:28:26 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:41518 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344009AbhKXW20 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Nov 2021 17:28:26 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B7FAB90E;
        Wed, 24 Nov 2021 23:25:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1637792715;
        bh=Ys1JyMWswwJKFefYGZWxSZ3HmhY+U086vJxl2DFCfDs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UQfG4gjBPfhwl8YMeFEBAcLa6IYytZ+xaf3VpbHUU7Ta37j0vx8VIBxrNwZ/JyL2U
         vIBS2TKb+jfV2JY3nuCqgAVRaqI5+z1q5YoOPTW1Osr0k6jmKXoG/f5LP+nirapm7h
         4VUjk6JTW3AjDD98VRh1hbXcmluIkhayNHAwmNGk=
Date:   Thu, 25 Nov 2021 00:24:52 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: salvator-common: Merge hdmi0_con
Message-ID: <YZ67tAytE4B7PBTZ@pendragon.ideasonboard.com>
References: <20211124152815.3926961-1-kieran.bingham+renesas@ideasonboard.com>
 <20211124152815.3926961-3-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211124152815.3926961-3-kieran.bingham+renesas@ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

Thank you for the patch.

On Wed, Nov 24, 2021 at 03:28:15PM +0000, Kieran Bingham wrote:
> The remote endpoint for the hdmi connector is specfied through a
> reference to the hdmi0_con endpoint, which is in the same file.
> 
> Simplify by specifying the remote-endpoint directly in the hdmi0_con
> endpoint.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

This one I hadn't found earlier today, but it's equally valid.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  arch/arm64/boot/dts/renesas/salvator-common.dtsi | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> index bf37777dca31..6092dc4531ad 100644
> --- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> +++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> @@ -97,6 +97,7 @@ hdmi0-out {
>  
>  		port {
>  			hdmi0_con: endpoint {
> +				remote-endpoint = <&rcar_dw_hdmi0_out>;
>  			};
>  		};
>  	};
> @@ -424,10 +425,6 @@ dw_hdmi0_snd_in: endpoint {
>  	};
>  };
>  
> -&hdmi0_con {
> -	remote-endpoint = <&rcar_dw_hdmi0_out>;
> -};
> -
>  #ifdef SOC_HAS_HDMI1
>  &hdmi1 {
>  	status = "okay";

-- 
Regards,

Laurent Pinchart
