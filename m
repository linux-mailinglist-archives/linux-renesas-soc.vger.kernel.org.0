Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9EB0090218
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Aug 2019 14:58:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726752AbfHPM6d (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 16 Aug 2019 08:58:33 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:53828 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726541AbfHPM6d (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Aug 2019 08:58:33 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id C473B25AEC0;
        Fri, 16 Aug 2019 22:58:30 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id BC67994057D; Fri, 16 Aug 2019 14:58:28 +0200 (CEST)
Date:   Fri, 16 Aug 2019 14:58:28 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Chris Brandt <Chris.Brandt@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] clocksource/drivers/renesas-ostm: Use
 DIV_ROUND_CLOSEST() helper
Message-ID: <20190816125828.jl36jytcez2okqvs@verge.net.au>
References: <20190807084635.24173-1-geert+renesas@glider.be>
 <20190807084635.24173-2-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190807084635.24173-2-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Aug 07, 2019 at 10:46:33AM +0200, Geert Uytterhoeven wrote:
> Use the DIV_ROUND_CLOSEST() helper instead of open-coding the same
> operation.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
> v3:
>   - New.
> ---
>  drivers/clocksource/renesas-ostm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clocksource/renesas-ostm.c b/drivers/clocksource/renesas-ostm.c
> index 61d5f3b539ce23df..37c39b901bb12b38 100644
> --- a/drivers/clocksource/renesas-ostm.c
> +++ b/drivers/clocksource/renesas-ostm.c
> @@ -221,7 +221,7 @@ static int __init ostm_init(struct device_node *np)
>  	}
>  
>  	rate = clk_get_rate(ostm_clk);
> -	ostm->ticks_per_jiffy = (rate + HZ / 2) / HZ;
> +	ostm->ticks_per_jiffy = DIV_ROUND_CLOSEST(rate, HZ);
>  
>  	/*
>  	 * First probed device will be used as system clocksource. Any
> -- 
> 2.17.1
> 
