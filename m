Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCCD55CE4E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jul 2019 13:22:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726252AbfGBLWw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 2 Jul 2019 07:22:52 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:33762 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725972AbfGBLWv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 Jul 2019 07:22:51 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id D331625AEC8;
        Tue,  2 Jul 2019 21:22:49 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id DBE95940476; Tue,  2 Jul 2019 13:22:47 +0200 (CEST)
Date:   Tue, 2 Jul 2019 13:22:47 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH/RFT] arm64: dts: renesas: r8a77995: Fix register range of
 display node
Message-ID: <20190702112246.a5wbikkoccocpzs7@verge.net.au>
References: <1560802696-19042-1-git-send-email-ykaneko0929@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1560802696-19042-1-git-send-email-ykaneko0929@gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jun 18, 2019 at 05:18:16AM +0900, Yoshihiro Kaneko wrote:
> Since the R8A77995 SoC uses DU{0,1}, the range from the base address to
> the 0x4000 address is used.
> This patch fixed it.
> 
> Fixes: 18f1a773e3f9 ("arm64: dts: renesas: r8a77995: add DU support")
> 
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> ---
> 
> This patch is based on the devel branch of Simon Horman's renesas tree.
> 
>  arch/arm64/boot/dts/renesas/r8a77995.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> index 0a344eb..0567b36 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
> @@ -995,7 +995,7 @@
>  
>  		du: display@feb00000 {
>  			compatible = "renesas,du-r8a77995";
> -			reg = <0 0xfeb00000 0 0x80000>;
> +			reg = <0 0xfeb00000 0 0x40000>;
>  			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 724>,
> -- 
> 1.9.1
> 
