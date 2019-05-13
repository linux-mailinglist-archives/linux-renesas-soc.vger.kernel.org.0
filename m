Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0B9961B577
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 May 2019 14:04:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727487AbfEMMEw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 May 2019 08:04:52 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:57350 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729602AbfEMMEw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 May 2019 08:04:52 -0400
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 4033B25AD63;
        Mon, 13 May 2019 22:04:50 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id EDB49E22B88; Mon, 13 May 2019 14:04:47 +0200 (CEST)
Date:   Mon, 13 May 2019 14:04:47 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <marc.zyngier@arm.com>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] irqchip/renesas-irqc: Remove unneeded inclusion of
 <linux/spinlock.h>
Message-ID: <20190513120447.l6gzewa5cb7riar7@verge.net.au>
References: <20190429152006.22593-1-geert+renesas@glider.be>
 <20190429152006.22593-2-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190429152006.22593-2-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Apr 29, 2019 at 05:20:02PM +0200, Geert Uytterhoeven wrote:
> The driver never used spinlocks, and thus does not need to include
> <linux/spinlock.h>.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
>  drivers/irqchip/irq-renesas-irqc.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/irqchip/irq-renesas-irqc.c b/drivers/irqchip/irq-renesas-irqc.c
> index a449a7c839b3ec08..438a063c76156d98 100644
> --- a/drivers/irqchip/irq-renesas-irqc.c
> +++ b/drivers/irqchip/irq-renesas-irqc.c
> @@ -7,7 +7,6 @@
>  
>  #include <linux/init.h>
>  #include <linux/platform_device.h>
> -#include <linux/spinlock.h>
>  #include <linux/interrupt.h>
>  #include <linux/ioport.h>
>  #include <linux/io.h>
> -- 
> 2.17.1
> 
