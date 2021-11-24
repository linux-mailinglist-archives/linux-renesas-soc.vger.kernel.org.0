Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DDF2245D000
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Nov 2021 23:24:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343703AbhKXW1R (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 24 Nov 2021 17:27:17 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:41490 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235257AbhKXW1Q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Nov 2021 17:27:16 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 22BA490E;
        Wed, 24 Nov 2021 23:24:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1637792645;
        bh=vGq/mWDN73zRjz5iYjQyDsaWynM5Pl579Af8Jj8N4T8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Vg9ONYU4JmUHPYeU9lmXZacaxmFX4qiaVAbN9Mvusd+vxP3gT9unwY/3lIoWdbkQm
         MPVrmXqXGHukDcLbXzQmt6sa/XRmgzUyKnoZQIyitzn1D27991YndR2mErMcbHEH7J
         ARakHk/D28WJsYwBwQpm7gVGJCdEjr/DiSv0tb+c=
Date:   Thu, 25 Nov 2021 00:23:42 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/2] arm64: dts: renesas: ulcb: Merge hdmi0_con
Message-ID: <YZ67btQ8IxlIBdsh@pendragon.ideasonboard.com>
References: <20211124152815.3926961-1-kieran.bingham+renesas@ideasonboard.com>
 <20211124152815.3926961-2-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211124152815.3926961-2-kieran.bingham+renesas@ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

Thank you for the patch.

On Wed, Nov 24, 2021 at 03:28:14PM +0000, Kieran Bingham wrote:
> The remote endpoint for the hdmi connector is specfied through a
> reference to the hdmi0_con endpoint, which is in the same file.
> 
> Simplify by specifying the remote-endpoint directly in the hdmi0_con
> endpoint.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

I saw this earlier today and made a note to fix it. You were faster :-)

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  arch/arm64/boot/dts/renesas/ulcb.dtsi | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/ulcb.dtsi b/arch/arm64/boot/dts/renesas/ulcb.dtsi
> index 7edffe7f8cfa..a7e93df4ced8 100644
> --- a/arch/arm64/boot/dts/renesas/ulcb.dtsi
> +++ b/arch/arm64/boot/dts/renesas/ulcb.dtsi
> @@ -48,6 +48,7 @@ hdmi0-out {
>  
>  		port {
>  			hdmi0_con: endpoint {
> +				remote-endpoint = <&rcar_dw_hdmi0_out>;
>  			};
>  		};
>  	};
> @@ -199,10 +200,6 @@ dw_hdmi0_snd_in: endpoint {
>  	};
>  };
>  
> -&hdmi0_con {
> -	remote-endpoint = <&rcar_dw_hdmi0_out>;
> -};
> -
>  &i2c2 {
>  	pinctrl-0 = <&i2c2_pins>;
>  	pinctrl-names = "default";

-- 
Regards,

Laurent Pinchart
