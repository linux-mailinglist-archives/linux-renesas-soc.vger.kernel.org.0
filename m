Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0F15E335
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 29 Apr 2019 14:59:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726017AbfD2M7B (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 29 Apr 2019 08:59:01 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:45516 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725838AbfD2M7B (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 29 Apr 2019 08:59:01 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 0F30125B263;
        Mon, 29 Apr 2019 22:58:59 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 0B5A1940376; Mon, 29 Apr 2019 14:58:56 +0200 (CEST)
Date:   Mon, 29 Apr 2019 14:58:56 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] soc: renesas: Enable RZ/A1 IRQC on RZ/A1H
Message-ID: <20190429125856.fjtlme4yqmxvensd@verge.net.au>
References: <20190429093631.10799-1-geert+renesas@glider.be>
 <20190429093631.10799-4-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190429093631.10799-4-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Apr 29, 2019 at 11:36:29AM +0200, Geert Uytterhoeven wrote:
> Auto-enable the RZ/A1 Interrupt Controller when configuring a kernel
> with support for RZ/A1H SoCs.
> 
> This is similar to how interrupt controllers for other Renesas SoCs are
> enabled.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks Geert,

this is fine by me but other parts of the series need respinning.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>


> ---
>  drivers/soc/renesas/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
> index 68bfca6f20ddf8a7..1448b6dbcdb20bae 100644
> --- a/drivers/soc/renesas/Kconfig
> +++ b/drivers/soc/renesas/Kconfig
> @@ -57,6 +57,7 @@ config ARCH_R7S72100
>  	bool "RZ/A1H (R7S72100)"
>  	select PM
>  	select PM_GENERIC_DOMAINS
> +	select RENESAS_RZA1_IRQC
>  	select SYS_SUPPORTS_SH_MTU2
>  	select RENESAS_OSTM
>  
> -- 
> 2.17.1
> 
