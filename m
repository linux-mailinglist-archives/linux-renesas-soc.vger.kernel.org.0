Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC22A902E3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Aug 2019 15:24:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727218AbfHPNYG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 16 Aug 2019 09:24:06 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:54926 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727203AbfHPNYG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Aug 2019 09:24:06 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 3E93025AD7A;
        Fri, 16 Aug 2019 23:24:04 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 3866B94057D; Fri, 16 Aug 2019 15:24:02 +0200 (CEST)
Date:   Fri, 16 Aug 2019 15:24:02 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Ulrich Hecht <uli+renesas@fpond.eu>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: r8a7779: Use SYSC "always-on" PM Domain for
 HSCIF
Message-ID: <20190816132401.y3k5qacbof5aw2gs@verge.net.au>
References: <20190816122229.13157-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190816122229.13157-1-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Aug 16, 2019 at 02:22:29PM +0200, Geert Uytterhoeven wrote:
> Hook up HSCIF serial devices that are part of the CPG/MSTP Clock Domain
> to the SYSC "always-on" PM Domain, for a more consistent
> device-power-area description in DT.
> 
> Cfr. commit 751e29bbb64ad091 ("ARM: dts: r8a7779: Use SYSC "always-on" PM Domain").
> 
> Fixes: 055d15a88f66b096 ("ARM: dts: r8a7779: Add HSCIF0/1 device nodes")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
> To be queued in renesas-devel for v5.4.
> 
>  arch/arm/boot/dts/r8a7779.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/r8a7779.dtsi b/arch/arm/boot/dts/r8a7779.dtsi
> index 3ff2592075275555..ebf5b7cfe21599c6 100644
> --- a/arch/arm/boot/dts/r8a7779.dtsi
> +++ b/arch/arm/boot/dts/r8a7779.dtsi
> @@ -296,7 +296,7 @@
>  			 <&cpg_clocks R8A7779_CLK_S>,
>  			 <&scif_clk>;
>  		clock-names = "fck", "brg_int", "scif_clk";
> -		power-domains = <&cpg_clocks>;
> +		power-domains = <&sysc R8A7779_PD_ALWAYS_ON>;
>  		status = "disabled";
>  	};
>  
> @@ -309,7 +309,7 @@
>  			 <&cpg_clocks R8A7779_CLK_S>,
>  			 <&scif_clk>;
>  		clock-names = "fck", "brg_int", "scif_clk";
> -		power-domains = <&cpg_clocks>;
> +		power-domains = <&sysc R8A7779_PD_ALWAYS_ON>;
>  		status = "disabled";
>  	};
>  
> -- 
> 2.17.1
> 
