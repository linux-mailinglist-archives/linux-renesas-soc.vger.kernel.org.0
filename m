Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00C1E98E83
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2019 10:59:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731974AbfHVI7A (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 22 Aug 2019 04:59:00 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:57286 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731589AbfHVI7A (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Aug 2019 04:59:00 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 7D82A25AD59;
        Thu, 22 Aug 2019 18:58:58 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 7A19F940804; Thu, 22 Aug 2019 10:58:56 +0200 (CEST)
Date:   Thu, 22 Aug 2019 10:58:56 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] soc: renesas: Enable ARM_ERRATA_814220 for affected
 Cortex-A7
Message-ID: <20190822085856.zbrry4azg4stsmcd@verge.net.au>
References: <20190821124602.29317-1-geert+renesas@glider.be>
 <20190821124602.29317-2-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190821124602.29317-2-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Aug 21, 2019 at 02:46:00PM +0200, Geert Uytterhoeven wrote:
> ARM Erratum 814220 affects Cortex-A7 revisions r0p2-r0p5.
> 
> Enable automatically support to mitigate the erratum when compiling a
> kernel for any of the affected Renesas SoCs:
>   - R-Mobile APE6: r0p2,
>   - RZ/G1E: r0p5,
>   - RZ/G1C: r0p5,
>   - R-Car H2: r0p3,
>   - R-Car E2: r0p5,
>   - RZ/N1: r0p5.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  drivers/soc/renesas/Kconfig | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
> index 2bbf49e5d441808b..a72d014ea37cc788 100644
> --- a/drivers/soc/renesas/Kconfig
> +++ b/drivers/soc/renesas/Kconfig
> @@ -72,6 +72,7 @@ config ARCH_R8A73A4
>  	bool "R-Mobile APE6 (R8A73A40)"
>  	select ARCH_RMOBILE
>  	select ARM_ERRATA_798181 if SMP
> +	select ARM_ERRATA_814220
>  	select HAVE_ARM_ARCH_TIMER
>  	select RENESAS_IRQC
>  
> @@ -95,11 +96,13 @@ config ARCH_R8A7744
>  config ARCH_R8A7745
>  	bool "RZ/G1E (R8A77450)"
>  	select ARCH_RCAR_GEN2
> +	select ARM_ERRATA_814220
>  	select SYSC_R8A7745
>  
>  config ARCH_R8A77470
>  	bool "RZ/G1C (R8A77470)"
>  	select ARCH_RCAR_GEN2
> +	select ARM_ERRATA_814220
>  	select SYSC_R8A77470
>  
>  config ARCH_R8A7778
> @@ -117,6 +120,7 @@ config ARCH_R8A7790
>  	bool "R-Car H2 (R8A77900)"
>  	select ARCH_RCAR_GEN2
>  	select ARM_ERRATA_798181 if SMP
> +	select ARM_ERRATA_814220
>  	select I2C
>  	select SYSC_R8A7790
>  
> @@ -143,11 +147,13 @@ config ARCH_R8A7793
>  config ARCH_R8A7794
>  	bool "R-Car E2 (R8A77940)"
>  	select ARCH_RCAR_GEN2
> +	select ARM_ERRATA_814220
>  	select SYSC_R8A7794
>  
>  config ARCH_R9A06G032
>  	bool "RZ/N1D (R9A06G032)"
>  	select ARCH_RZN1
> +	select ARM_ERRATA_814220
>  
>  config ARCH_SH73A0
>  	bool "SH-Mobile AG5 (R8A73A00)"
> -- 
> 2.17.1
> 
