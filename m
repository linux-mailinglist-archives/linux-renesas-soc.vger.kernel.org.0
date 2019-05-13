Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C76AD1B57B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 May 2019 14:05:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728268AbfEMMFB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 May 2019 08:05:01 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:57374 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729630AbfEMMFA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 May 2019 08:05:00 -0400
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id BC31A25AD69;
        Mon, 13 May 2019 22:04:58 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id A11E6E22B88; Mon, 13 May 2019 14:04:56 +0200 (CEST)
Date:   Mon, 13 May 2019 14:04:56 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] irqchip/renesas-irqc: Remove
 devm_kzalloc()/ioremap_nocache() error printing
Message-ID: <20190513120456.f63s7p37wwtmneyq@verge.net.au>
References: <20190429152006.22593-1-geert+renesas@glider.be>
 <20190429152006.22593-3-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190429152006.22593-3-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Apr 29, 2019 at 05:20:03PM +0200, Geert Uytterhoeven wrote:
> There is no need to print a message if devm_kzalloc() or
> ioremap_nocache() fails, as the memory allocation core already takes
> care of that.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  drivers/irqchip/irq-renesas-irqc.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-renesas-irqc.c b/drivers/irqchip/irq-renesas-irqc.c
> index 438a063c76156d98..0955ffe12b32eb36 100644
> --- a/drivers/irqchip/irq-renesas-irqc.c
> +++ b/drivers/irqchip/irq-renesas-irqc.c
> @@ -133,7 +133,6 @@ static int irqc_probe(struct platform_device *pdev)
>  
>  	p = kzalloc(sizeof(*p), GFP_KERNEL);
>  	if (!p) {
> -		dev_err(&pdev->dev, "failed to allocate driver data\n");
>  		ret = -ENOMEM;
>  		goto err0;
>  	}
> @@ -173,7 +172,6 @@ static int irqc_probe(struct platform_device *pdev)
>  	/* ioremap IOMEM and setup read/write callbacks */
>  	p->iomem = ioremap_nocache(io->start, resource_size(io));
>  	if (!p->iomem) {
> -		dev_err(&pdev->dev, "failed to remap IOMEM\n");
>  		ret = -ENXIO;
>  		goto err2;
>  	}
> -- 
> 2.17.1
> 
