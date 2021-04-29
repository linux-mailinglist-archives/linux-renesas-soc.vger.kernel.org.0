Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACD8636ED75
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Apr 2021 17:34:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233148AbhD2Pey (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 29 Apr 2021 11:34:54 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54162 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232989AbhD2Pey (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Apr 2021 11:34:54 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 56048DA8;
        Thu, 29 Apr 2021 17:34:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1619710446;
        bh=G2OeB8Ead5OG71/Ox0v6t4IIlF7AKAPhIY2E4Icvgjg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=u9vAKicB+0P7Fec19DtfsVyuNo+7pOkBQ/8dq3eJHa4d+1Lb7eeaDU9G00rh2i6kc
         BGmasLDjINj4kgYUAJi+6A2sBreCTI8wATZESzHQKLUrZMTVrLrMojtwvcCg2LfVJI
         I3I1c+evAo/6g+KI1NM2+J0aaIOeVlJ0PYYEN0Yg=
Date:   Thu, 29 Apr 2021 18:34:00 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: r8a7779, marzen: Fix DU clock names
Message-ID: <YIrR6NGTKA6z/wNE@pendragon.ideasonboard.com>
References: <9d5e1b371121883b3b3e10a3df43802a29c6a9da.1619699965.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9d5e1b371121883b3b3e10a3df43802a29c6a9da.1619699965.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thank you for the patch.

On Thu, Apr 29, 2021 at 02:41:15PM +0200, Geert Uytterhoeven wrote:
> "make dtbs_check" complains:
> 
>     arch/arm/boot/dts/r8a7779-marzen.dt.yaml: display@fff80000: clock-names:0: 'du.0' was expected
> 
> Change the first clock name to match the DT bindings.
> This has no effect on actual operation, as the Display Unit driver in
> Linux does not use the first clock name on R-Car H1, but just grabs the
> first clock.

The driver agrees with that statement. I haven't tested it though.

> Fixes: 665d79aa47cb3983 ("ARM: shmobile: marzen: Add DU external pixel clock to DT")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> To be queued in renesas-devel for v5.14.
> 
>  arch/arm/boot/dts/r8a7779-marzen.dts | 2 +-
>  arch/arm/boot/dts/r8a7779.dtsi       | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/r8a7779-marzen.dts b/arch/arm/boot/dts/r8a7779-marzen.dts
> index d2240b89ee52929b..46584532349590d1 100644
> --- a/arch/arm/boot/dts/r8a7779-marzen.dts
> +++ b/arch/arm/boot/dts/r8a7779-marzen.dts
> @@ -145,7 +145,7 @@ &du {
>  	status = "okay";
>  
>  	clocks = <&mstp1_clks R8A7779_CLK_DU>, <&x3_clk>;
> -	clock-names = "du", "dclkin.0";
> +	clock-names = "du.0", "dclkin.0";
>  
>  	ports {
>  		port@0 {
> diff --git a/arch/arm/boot/dts/r8a7779.dtsi b/arch/arm/boot/dts/r8a7779.dtsi
> index 74d7e9084eabe173..3c5fcdfe16b87182 100644
> --- a/arch/arm/boot/dts/r8a7779.dtsi
> +++ b/arch/arm/boot/dts/r8a7779.dtsi
> @@ -463,6 +463,7 @@ du: display@fff80000 {
>  		reg = <0xfff80000 0x40000>;
>  		interrupts = <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>;
>  		clocks = <&mstp1_clks R8A7779_CLK_DU>;
> +		clock-names = "du.0";
>  		power-domains = <&sysc R8A7779_PD_ALWAYS_ON>;
>  		status = "disabled";
>  

-- 
Regards,

Laurent Pinchart
