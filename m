Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10180260A8A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  8 Sep 2020 08:04:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728876AbgIHGEY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 8 Sep 2020 02:04:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728680AbgIHGEY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 8 Sep 2020 02:04:24 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38812C061573;
        Mon,  7 Sep 2020 23:04:23 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B9F5E35;
        Tue,  8 Sep 2020 08:04:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1599545061;
        bh=ca7O6RFFRSVQZqqqL9m9ZU0O5qL+e0TLreO9J8eIsQ0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ugtEGusrDDt1uwGWsO3xbJwMaj9Q5XSrz3taDRhJlivsqszwzK0zh4X7XB8R7redg
         qd+vYleIfP0NRZjVbK4yCFzwejIcGbLQiaQSfHvy9AClB8KuB/EkNPiqGt/NJjtS2w
         zATIxjw8cWBZlWtWJJbyJen332/mcBkJWbAoq6Ds=
Date:   Tue, 8 Sep 2020 09:03:57 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-DT <devicetree@vger.kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        shimoda <yoshihiro.shimoda.uh@renesas.com>,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 08/10] arm64: dts: renesas: r8a77961: Add HDMI device
 nodes
Message-ID: <20200908060357.GS6047@pendragon.ideasonboard.com>
References: <87o8mhrtxo.wl-kuninori.morimoto.gx@renesas.com>
 <87d02xrtux.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87d02xrtux.wl-kuninori.morimoto.gx@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Morimoto-san,

Thank you for the patch.

On Tue, Sep 08, 2020 at 09:35:15AM +0900, Kuninori Morimoto wrote:
> 
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> This patch adds HDMI device nodes for R-Car M3-W+ (r8a77961) SoC.
> This patch was tested on R-Car M3-W+ Salvator-XS board.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  arch/arm64/boot/dts/renesas/r8a77961.dtsi | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> index c7fabd9e875b..7f21491f6436 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
> @@ -2145,14 +2145,23 @@ port@1 {
>  		};
>  
>  		hdmi0: hdmi@fead0000 {
> +			compatible = "renesas,r8a77961-hdmi", "renesas,rcar-gen3-hdmi";
>  			reg = <0 0xfead0000 0 0x10000>;
> -			/* placeholder */
> +			interrupts = <GIC_SPI 389 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 729>, <&cpg CPG_CORE R8A77961_CLK_HDMI>;
> +			clock-names = "iahb", "isfr";
> +			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
> +			resets = <&cpg 729>;
> +			status = "disabled";
>  
>  			ports {
>  				#address-cells = <1>;
>  				#size-cells = <0>;
>  				port@0 {
>  					reg = <0>;
> +					dw_hdmi0_in: endpoint {
> +						remote-endpoint = <&du_out_hdmi0>;
> +					};
>  				};
>  				port@1 {
>  					reg = <1>;
> @@ -2191,6 +2200,7 @@ du_out_rgb: endpoint {
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
