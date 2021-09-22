Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B54A4153E7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Sep 2021 01:32:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238446AbhIVXdl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Sep 2021 19:33:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238418AbhIVXdk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Sep 2021 19:33:40 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65BBBC061574;
        Wed, 22 Sep 2021 16:32:10 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BDB2FE52;
        Thu, 23 Sep 2021 01:32:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1632353529;
        bh=n7HEXnLUXAI0EvxIojxjTbXjk4C1x+IvATdlxNfW1tI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nkCAnCK6cJW5EsmOJVmxapQMpPqMDunsD481Yf8CxxXyEpIfj9ehCYPmjKvOEg9HR
         EXI1/nn/9lM2+8NEQ6vizWkp1h1Qf8enhq5hyDTJK2FqWaz4u1uZYgARxpLP9wwX8m
         bWnE/VAan/Rmdr/PojjqxhgBtJ3amHAu+ULpL71A=
Date:   Thu, 23 Sep 2021 02:32:07 +0300
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
Subject: Re: [PATCH v2 1/3] arm64: dts: renesas: r8a779a0: Add DU support
Message-ID: <YUu898oHnMP3caqL@pendragon.ideasonboard.com>
References: <20210901235330.1611086-1-kieran.bingham@ideasonboard.com>
 <20210901235330.1611086-2-kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210901235330.1611086-2-kieran.bingham@ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

Thank you for the patch.

On Thu, Sep 02, 2021 at 12:53:28AM +0100, Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> Provide the device nodes for the DU on the V3U platforms.
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> ---
> v2
>  - Use a single clock specification for the whole DU.
> 
>  arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 30 +++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> index 631d520cebee..3241f7e7c01e 100644
> --- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
> @@ -1142,6 +1142,36 @@ vspd1: vsp@fea28000 {
>  			renesas,fcp = <&fcpvd1>;
>  		};
>  
> +		du: display@feb00000 {
> +			compatible = "renesas,du-r8a779a0";
> +			reg = <0 0xfeb00000 0 0x40000>;
> +			interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cpg CPG_MOD 411>;
> +			clock-names = "du";

With the clock name set to "du.0" as discussed in the DT bindings
review,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
> +			resets = <&cpg 411>;
> +			vsps = <&vspd0 0>, <&vspd1 0>;
> +			status = "disabled";
> +
> +			ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@0 {
> +					reg = <0>;
> +					du_out_dsi0: endpoint {
> +					};
> +				};
> +
> +				port@1 {
> +					reg = <1>;
> +					du_out_dsi1: endpoint {
> +					};
> +				};
> +			};
> +		};
> +
>  		prr: chipid@fff00044 {
>  			compatible = "renesas,prr";
>  			reg = <0 0xfff00044 0 4>;

-- 
Regards,

Laurent Pinchart
