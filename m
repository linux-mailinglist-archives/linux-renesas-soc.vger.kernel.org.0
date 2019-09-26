Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DE4DBED4E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2019 10:23:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbfIZIXG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Sep 2019 04:23:06 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:50626 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725815AbfIZIXG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Sep 2019 04:23:06 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id E6F8D25AF0D;
        Thu, 26 Sep 2019 18:23:04 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id ECA80943750; Thu, 26 Sep 2019 10:23:02 +0200 (CEST)
Date:   Thu, 26 Sep 2019 10:23:02 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Navid Emamdoost <navid.emamdoost@gmail.com>
Cc:     emamd001@umn.edu, smccaman@umn.edu, kjlu@umn.edu,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] soc: renesas: rcar-sysc: fix memory leak in
 rcar_sysc_pd_init
Message-ID: <20190926082302.smaruxtgamgwoxad@verge.net.au>
References: <20190925210354.8845-1-navid.emamdoost@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190925210354.8845-1-navid.emamdoost@gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Ni Navid,

thanks for your patch.

On Wed, Sep 25, 2019 at 04:03:53PM -0500, Navid Emamdoost wrote:
> In rcar_sysc_pd_init when looping over info->areas errors may happen but
> the error handling path does not clean up the intermediate allocated
> memories.
> 
> This patch changes the error handling path in major and a little the loop
>  itself. Inside the loop if an error happens the current pd will be
> released and then it goes to error handling path where it releases any
>  previously allocated domains.
> 
> Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
> ---
>  drivers/soc/renesas/rcar-sysc.c | 27 ++++++++++++++++++++++++---
>  1 file changed, 24 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soc/renesas/rcar-sysc.c b/drivers/soc/renesas/rcar-sysc.c
> index 59b5e6b10272..f9613c1ee0a0 100644
> --- a/drivers/soc/renesas/rcar-sysc.c
> +++ b/drivers/soc/renesas/rcar-sysc.c
> @@ -330,10 +330,10 @@ static int __init rcar_sysc_pd_init(void)
>  {
>  	const struct rcar_sysc_info *info;
>  	const struct of_device_id *match;
> -	struct rcar_pm_domains *domains;
> +	struct rcar_pm_domains *domains = NULL;
>  	struct device_node *np;
>  	void __iomem *base;
> -	unsigned int i;
> +	unsigned int i, num_areas = 0;
>  	int error;

Please preserve reverse xmas tree sorting of local variables.

>  	np = of_find_matching_node_and_match(NULL, rcar_sysc_matches, &match);
> @@ -382,6 +382,7 @@ static int __init rcar_sysc_pd_init(void)
>  		pd = kzalloc(sizeof(*pd) + strlen(area->name) + 1, GFP_KERNEL);
>  		if (!pd) {
>  			error = -ENOMEM;
> +			num_areas = i;
>  			goto out_put;
>  		}
>  
> @@ -393,8 +394,11 @@ static int __init rcar_sysc_pd_init(void)
>  		pd->flags = area->flags;
>  
>  		error = rcar_sysc_pd_setup(pd);
> -		if (error)
> +		if (error) {
> +			kfree(pd);
> +			num_areas = i;
>  			goto out_put;
> +		}
>  
>  		domains->domains[area->isr_bit] = &pd->genpd;
>  
> @@ -406,13 +410,30 @@ static int __init rcar_sysc_pd_init(void)
>  		if (error) {
>  			pr_warn("Failed to add PM subdomain %s to parent %u\n",
>  				area->name, area->parent);
> +			kfree(pd);
> +			num_areas = i;
>  			goto out_put;
>  		}
>  	}
>  
>  	error = of_genpd_add_provider_onecell(np, &domains->onecell_data);
> +	of_node_put(np);
> +
> +	return error;
>  
>  out_put:
> +	if (domains) {
> +		for (i = 0; i < num_areas; i++) {
> +			const struct rcar_sysc_area *area = &info->areas[i];
> +
> +			if (!area->name) {
> +				/* Skip NULLified area */
> +				continue;
> +			}
> +			kfree(domains->domains[area->isr_bit]);

This cleanup doesn't feel correct to me.

For one I think the allocated memory is at
to_rcar_pd(domains->domains[area->isr_bit]);

And for antoher I wonder if it is also necessary to unwind initialisation done
by rcar_sysc_pd_setup() and pm_genpd_add_subdomain();

I think this leads us to the heart of why such unwinding is not present
and that is, I suspect, that its reasonably complex and in the event of
failure the system is very likely unusable. So leaking a bit of memory,
while unpleasent, doesn't effect the user experience.

> +		}
> +		kfree(domains);
> +	}
>  	of_node_put(np);
>  	return error;

I think it would be more in keeping with kernel coding style to add
some extra labels for different error paths. I also think you can
utilise the fact that i is already set to the number of allocated areas.

Something like this (completely untested):

out_free_areas:
	while (--i > 0) {
		/* Cleanup of 'i' goes here */
	}
out_free_domains:
	kfree(domains);
out_put:
	of_node_put(np);
	return error;

>  }
> -- 
> 2.17.1
> 
