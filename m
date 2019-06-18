Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9A53A49EF5
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jun 2019 13:09:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729630AbfFRLJl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Jun 2019 07:09:41 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:53476 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729458AbfFRLJl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 07:09:41 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id C413125AED3;
        Tue, 18 Jun 2019 21:09:39 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id C5A0C9408C4; Tue, 18 Jun 2019 13:09:37 +0200 (CEST)
Date:   Tue, 18 Jun 2019 13:09:37 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/5] clk: renesas: rcar-gen2-legacy: Switch Z clock to
 .determine_rate()
Message-ID: <20190618110937.2s7h5vtssymfrxxq@verge.net.au>
References: <20190617125238.13761-1-geert+renesas@glider.be>
 <20190617125238.13761-2-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190617125238.13761-2-geert+renesas@glider.be>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jun 17, 2019 at 02:52:34PM +0200, Geert Uytterhoeven wrote:
> As the .round_rate() callback returns a long clock rate, it cannot
> return clock rates that do not fit in signed long, but do fit in
> unsigned long.  Hence switch the Z clock on R-Car Gen2 from the old
> .round_rate() callback to the newer .determine_rate() callback, which
> does not suffer from this limitation.
> 
> This includes implementing range checking.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  drivers/clk/renesas/clk-rcar-gen2.c | 23 +++++++++++++----------
>  1 file changed, 13 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/clk/renesas/clk-rcar-gen2.c b/drivers/clk/renesas/clk-rcar-gen2.c
> index da9fe3f032eb2a0d..f85837716d2840cf 100644
> --- a/drivers/clk/renesas/clk-rcar-gen2.c
> +++ b/drivers/clk/renesas/clk-rcar-gen2.c
> @@ -66,19 +66,22 @@ static unsigned long cpg_z_clk_recalc_rate(struct clk_hw *hw,
>  	return div_u64((u64)parent_rate * mult, 32);
>  }
>  
> -static long cpg_z_clk_round_rate(struct clk_hw *hw, unsigned long rate,
> -				 unsigned long *parent_rate)
> +static int cpg_z_clk_determine_rate(struct clk_hw *hw,
> +				    struct clk_rate_request *req)
>  {
> -	unsigned long prate  = *parent_rate;
> -	unsigned int mult;
> +	unsigned long prate = req->best_parent_rate;
> +	unsigned int min_mult, max_mult, mult;
>  
> -	if (!prate)
> -		prate = 1;
> +	min_mult = max(div_u64(req->min_rate * 32ULL, prate), 1ULL);
> +	max_mult = min(div_u64(req->max_rate * 32ULL, prate), 32ULL);

nit: the type of the second parameter doesn't look correct to me,
div_u64 expects a u32 divisor.

> +	if (max_mult < min_mult)
> +		return -EINVAL;
>  
> -	mult = div_u64((u64)rate * 32, prate);
> -	mult = clamp(mult, 1U, 32U);
> +	mult = div_u64(req->rate * 32ULL, prate);

Likewise, do we care that prate will be 64bit on 64bit platforms?
(Yes, I know gen2 SoCs are 32bit :)

> +	mult = clamp(mult, min_mult, max_mult);
>  
> -	return *parent_rate / 32 * mult;
> +	req->rate = prate / 32 * mult;
> +	return 0;
>  }
>  
>  static int cpg_z_clk_set_rate(struct clk_hw *hw, unsigned long rate,
> @@ -129,7 +132,7 @@ static int cpg_z_clk_set_rate(struct clk_hw *hw, unsigned long rate,
>  
>  static const struct clk_ops cpg_z_clk_ops = {
>  	.recalc_rate = cpg_z_clk_recalc_rate,
> -	.round_rate = cpg_z_clk_round_rate,
> +	.determine_rate = cpg_z_clk_determine_rate,
>  	.set_rate = cpg_z_clk_set_rate,
>  };
>  
> -- 
> 2.17.1
> 
