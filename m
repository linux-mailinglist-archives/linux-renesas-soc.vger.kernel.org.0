Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29A1E98E8C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2019 10:59:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732072AbfHVI76 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 22 Aug 2019 04:59:58 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:57342 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731589AbfHVI76 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Aug 2019 04:59:58 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 9420725AD59;
        Thu, 22 Aug 2019 18:59:56 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 781BC940804; Thu, 22 Aug 2019 10:59:54 +0200 (CEST)
Date:   Thu, 22 Aug 2019 10:59:54 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] soc: renesas: Enable ARM_ERRATA_754322 for affected
 Cortex-A9
Message-ID: <20190822085954.pgid6tjd35tz3uam@verge.net.au>
References: <20190821124602.29317-1-geert+renesas@glider.be>
 <20190821124602.29317-3-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190821124602.29317-3-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Aug 21, 2019 at 02:46:01PM +0200, Geert Uytterhoeven wrote:
> ARM Erratum 754322 affects Cortex-A9 revisions r2p* and r3p*.
> 
> Enable support code to mitigate the erratum when compiling a kernel for
> any of the affected Renesas SoCs:
>   - RZ/A1: r3p0,
>   - R-Mobile A1: r2p4,
>   - R-Car M1A: r2p2-00rel0,
>   - R-Car H1: r3p0,
>   - SH-Mobile AG5: r2p2,
> and drop the corresponding config symbol from shmobile_defconfig.
> 
> EMMA Mobile EV2 (r1p3) and RZ/A2 (r4p1) are not affected.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Looks like my R-Mobile A1 is actually r2p3, and the R-Car M1A in Magnus'
> farm is r2p4?
> 
>  arch/arm/configs/shmobile_defconfig | 1 -
>  drivers/soc/renesas/Kconfig         | 5 +++++
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/configs/shmobile_defconfig b/arch/arm/configs/shmobile_defconfig
> index c6c70355141c38fa..123821e63873dafa 100644
> --- a/arch/arm/configs/shmobile_defconfig
> +++ b/arch/arm/configs/shmobile_defconfig
> @@ -9,7 +9,6 @@ CONFIG_PERF_EVENTS=y
>  CONFIG_SLAB=y
>  CONFIG_ARCH_RENESAS=y
>  CONFIG_PL310_ERRATA_588369=y
> -CONFIG_ARM_ERRATA_754322=y
>  CONFIG_SMP=y
>  CONFIG_SCHED_MC=y
>  CONFIG_NR_CPUS=8
> diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
> index a72d014ea37cc788..3c5e017bacbaca11 100644
> --- a/drivers/soc/renesas/Kconfig
> +++ b/drivers/soc/renesas/Kconfig
> @@ -55,6 +55,7 @@ config ARCH_EMEV2
>  
>  config ARCH_R7S72100
>  	bool "RZ/A1H (R7S72100)"
> +	select ARM_ERRATA_754322
>  	select PM
>  	select PM_GENERIC_DOMAINS
>  	select RENESAS_OSTM
> @@ -79,6 +80,7 @@ config ARCH_R8A73A4
>  config ARCH_R8A7740
>  	bool "R-Mobile A1 (R8A77400)"
>  	select ARCH_RMOBILE
> +	select ARM_ERRATA_754322
>  	select RENESAS_INTC_IRQPIN
>  
>  config ARCH_R8A7743
> @@ -108,10 +110,12 @@ config ARCH_R8A77470
>  config ARCH_R8A7778
>  	bool "R-Car M1A (R8A77781)"
>  	select ARCH_RCAR_GEN1
> +	select ARM_ERRATA_754322
>  
>  config ARCH_R8A7779
>  	bool "R-Car H1 (R8A77790)"
>  	select ARCH_RCAR_GEN1
> +	select ARM_ERRATA_754322
>  	select HAVE_ARM_SCU if SMP
>  	select HAVE_ARM_TWD if SMP
>  	select SYSC_R8A7779
> @@ -158,6 +162,7 @@ config ARCH_R9A06G032
>  config ARCH_SH73A0
>  	bool "SH-Mobile AG5 (R8A73A00)"
>  	select ARCH_RMOBILE
> +	select ARM_ERRATA_754322
>  	select HAVE_ARM_SCU if SMP
>  	select HAVE_ARM_TWD if SMP
>  	select RENESAS_INTC_IRQPIN
> -- 
> 2.17.1
> 
