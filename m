Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 327ED3CB84
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Jun 2019 14:30:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728159AbfFKMab (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Jun 2019 08:30:31 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:43206 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727278AbfFKMab (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Jun 2019 08:30:31 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 318E625B81D;
        Tue, 11 Jun 2019 22:30:29 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 33C0B9403F0; Tue, 11 Jun 2019 14:30:27 +0200 (CEST)
Date:   Tue, 11 Jun 2019 14:30:27 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH/RFT] arm64: dts: renesas: r8a77990: Fix register range of
 display node
Message-ID: <20190611123022.oo4arh76w72vlkg5@verge.net.au>
References: <1560084198-2930-1-git-send-email-ykaneko0929@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1560084198-2930-1-git-send-email-ykaneko0929@gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

+ Laurent

On Sun, Jun 09, 2019 at 09:43:18PM +0900, Yoshihiro Kaneko wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> 
> Since the R8A77990 SoC uses DU{0,1}, the range from the base address to
> the 0x4000 address is used.
> This patch fixed it.
> 
> Fixes: 13ee2bfc5444 ("arm64: dts: renesas: r8a77990: Add display output support")
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>

Thanks,

This looks fine to me but I will wait to see if there are other reviews
before applying.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Is a similar fix also appropriate for D3 (r8a77995)

And a variant that reduces the register size to 0x5000
for M3-W (r8a77965).

> ---
> 
> This patch is based on the devel branch of Simon Horman's renesas tree.
> 
>  arch/arm64/boot/dts/renesas/r8a77990.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> index 547e970..9b15da1 100644
> --- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
> @@ -1760,7 +1760,7 @@
>  
>  		du: display@feb00000 {
>  			compatible = "renesas,du-r8a77990";
> -			reg = <0 0xfeb00000 0 0x80000>;
> +			reg = <0 0xfeb00000 0 0x40000>;
>  			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
>  				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
>  			clocks = <&cpg CPG_MOD 724>,
> -- 
> 1.9.1
> 
