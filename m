Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C81443CFA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2019 17:38:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731951AbfFMPid (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 Jun 2019 11:38:33 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:41128 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731946AbfFMJ6k (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Jun 2019 05:58:40 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 4697725B7FA;
        Thu, 13 Jun 2019 19:58:38 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 45C56940483; Thu, 13 Jun 2019 11:58:36 +0200 (CEST)
Date:   Thu, 13 Jun 2019 11:58:36 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        linux-renesas-soc@vger.kernel.org,
        uclinux-h8-devel@lists.sourceforge.jp, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] irqchip: Enable compile-testing for Renesas drivers
Message-ID: <20190613095835.p3hjztlesr4pqwvj@verge.net.au>
References: <20190607095036.9466-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190607095036.9466-1-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jun 07, 2019 at 11:50:36AM +0200, Geert Uytterhoeven wrote:
> Enable compile-testing for all Renesas interrupt controller drivers,
> except for RENESAS_H8300H_INTC.  The latter relies on a function
> (ctrl_bclr()) that is not available on other architectures.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  drivers/irqchip/Kconfig | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> index 2d3b5a27cc988ab6..fe509b88f99a8f10 100644
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -217,17 +217,26 @@ config RDA_INTC
>  	select IRQ_DOMAIN
>  
>  config RENESAS_INTC_IRQPIN
> -	bool
> +	bool "Renesas INTC External IRQ Pin Support" if COMPILE_TEST
>  	select IRQ_DOMAIN
> +	help
> +	  Enable support for the Renesas Interrupt Controller for external
> +	  interrupt pins, as found on SH/R-Mobile and R-Car Gen1 SoCs.
>  
>  config RENESAS_IRQC
> -	bool
> +	bool "Renesas R-Mobile APE6 and R-Car IRQC support" if COMPILE_TEST
>  	select GENERIC_IRQ_CHIP
>  	select IRQ_DOMAIN
> +	help
> +	  Enable support for the Renesas Interrupt Controller for external
> +	  devices, as found on R-Mobile APE6, R-Car Gen2, and R-Car Gen3 SoCs.
>  
>  config RENESAS_RZA1_IRQC
> -	bool
> +	bool "Renesas RZ/A1 IRQC support" if COMPILE_TEST
>  	select IRQ_DOMAIN_HIERARCHY
> +	help
> +	  Enable support for the Renesas RZ/A1 Interrupt Controller, to use up
> +	  to 8 external interrupts with configurable sense select.
>  
>  config ST_IRQCHIP
>  	bool
> @@ -303,8 +312,11 @@ config RENESAS_H8300H_INTC
>  	select IRQ_DOMAIN
>  
>  config RENESAS_H8S_INTC
> -        bool
> +	bool "Renesas H8S Interrupt Controller Support" if COMPILE_TEST
>  	select IRQ_DOMAIN
> +	help
> +	  Enable support for the Renesas H8/300 Interrupt Controller, as found
> +	  on Renesas H8S SoCs.
>  
>  config IMX_GPCV2
>  	bool
> -- 
> 2.17.1
> 
