Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF4989772E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Aug 2019 12:31:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726448AbfHUKa4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 21 Aug 2019 06:30:56 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:44522 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726317AbfHUKa4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Aug 2019 06:30:56 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 8B2BE25AD7A;
        Wed, 21 Aug 2019 20:30:54 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id CF2039405AE; Wed, 21 Aug 2019 12:30:51 +0200 (CEST)
Date:   Wed, 21 Aug 2019 12:30:51 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: r8a774c0: Fix register range of
 display node
Message-ID: <20190821103051.waztamqtb4croefp@verge.net.au>
References: <20190821095732.19001-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190821095732.19001-1-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Aug 21, 2019 at 11:57:32AM +0200, Geert Uytterhoeven wrote:
> Since the R8A774C0 SoC uses DU{0,1} only, the register block length
> should be 0x40000.
> 
> Based on commit 06585ed38b6698bc ("arm64: dts: renesas: r8a77990: Fix
> register range of display node") for R-Car E3.
> 
> Fixes: 8ed3a6b223159df3 ("arm64: dts: renesas: r8a774c0: Add display output support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> index 5ce1eb4596f54043..4ee885e7678886f6 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
> @@ -1805,7 +1805,7 @@
>  
>  		du: display@feb00000 {
>  			compatible = "renesas,du-r8a774c0";
> -			reg = <0 0xfeb00000 0 0x80000>;
> +			reg = <0 0xfeb00000 0 0x40000>;
>  			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 724>,
> -- 
> 2.17.1
> 
