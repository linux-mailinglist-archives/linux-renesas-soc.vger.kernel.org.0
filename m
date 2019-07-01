Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 742212E71C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2019 23:11:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726462AbfE2VLH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 May 2019 17:11:07 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:44501 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726326AbfE2VLH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 May 2019 17:11:07 -0400
Received: by mail-lj1-f195.google.com with SMTP id e13so3909889ljl.11
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 May 2019 14:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=V+zBrsPH+2OSRodMwuZ9huc4K3MelCGCmI8U611rstQ=;
        b=0REuaA8fosdgKFbOBIuJozgm9lBZ68FoXT2yD+5YI4lrRsvA6I79x+O02kdXYnnl2b
         noNqxdxwRWggbwtv/hxmthcUjOUT+buBeWkUxo9u4JwJgtWAU/4ty2s8tJvorhtu6v/J
         xwHPjRDhFn8ipEp4+V9LV3f6CgHh4g8vqY/6VqK+sXVKl+RPRZn/pkoXbmimLBhPLpS8
         wrr2aDg9rgUIr6sTDbOPMejPGZhGSidvXnSC4XegwXYBtdSovyi4c24eTC/eYccmddzy
         KRQlB36XN4v5fcLDfBhyq+lCv41WEy893RqAx9rTlTSl2IXCCu7FLA5wta7+cyN/y+UJ
         h9vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=V+zBrsPH+2OSRodMwuZ9huc4K3MelCGCmI8U611rstQ=;
        b=f1AWpBHjouC86AviXSjCer+JmhLzlfZ7rr+aH6JBWcHpBcNoOeEEbrwwh1y2jlD0eE
         UBqlsUXB31m+yOTPNAnqD7SYpkrGKP5WZ1NK70E70yAMc2FcGNHaLWg6h40EcmJIw5aa
         AuG5nYs7XXGebwUiQ+Iayzz7P6795YkXOSCdmkDE1VuZPvg+bLeFQAWY5MGQAvvZZge8
         EtyhvNpPfpepmQzH26ilNJMMSRY9C8aLWTrTZPO0Y0opaq1YU1hIh4HdBLrzVzKqefZ8
         JMsXOU07BwamHujusRpvoxkj++r0s5tjb8eZSEw4Hh6uc8801YSprblT4h9a2fXsBN0y
         V3lg==
X-Gm-Message-State: APjAAAUH5G3LUDpawm3/sfbpVQ4xme660lOtvIVSLz2N8qjLmVQJXlHu
        S9J2NTILUBXFXMMCJcjKi9qwb2SLgAM=
X-Google-Smtp-Source: APXvYqwr7b1fGmDWNtLOsTPY3vjoq3oQT4j6E7g6lnEvGipxMliij6ZazrR7mK0vgT9zj2rZ/lP6Sg==
X-Received: by 2002:a2e:8555:: with SMTP id u21mr6576741ljj.133.1559164265570;
        Wed, 29 May 2019 14:11:05 -0700 (PDT)
Received: from localhost (89-233-230-99.cust.bredband2.com. [89.233.230.99])
        by smtp.gmail.com with ESMTPSA id v20sm125883lfe.11.2019.05.29.14.11.04
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 May 2019 14:11:04 -0700 (PDT)
Date:   Wed, 29 May 2019 23:11:04 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: cpg-mssr: Use genpd of_node instead of
 local copy
Message-ID: <20190529211104.GP1651@bigcity.dyn.berto.se>
References: <20190527123323.6912-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190527123323.6912-1-geert+renesas@glider.be>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2019-05-27 14:33:23 +0200, Geert Uytterhoeven wrote:
> Since commit 6a0ae73d95956f7e ("PM / Domain: Add support to parse
> domain's OPP table"), of_genpd_add_provider_simple() fills in
> the dev.of_node field in the generic_pm_domain structure.
> 
> Hence cpg_mssr_is_pm_clk() can use that instead of its own copy in the
> driver-private cpg_mssr_clk_domain structure.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> To be queued in clk-renesas-for-v5.3.
> 
>  drivers/clk/renesas/renesas-cpg-mssr.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
> index 0201809bbd377df4..d1054204f3a75022 100644
> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> @@ -447,7 +447,6 @@ static void __init cpg_mssr_register_mod_clk(const struct mssr_mod_clk *mod,
>  
>  struct cpg_mssr_clk_domain {
>  	struct generic_pm_domain genpd;
> -	struct device_node *np;
>  	unsigned int num_core_pm_clks;
>  	unsigned int core_pm_clks[0];
>  };
> @@ -459,7 +458,7 @@ static bool cpg_mssr_is_pm_clk(const struct of_phandle_args *clkspec,
>  {
>  	unsigned int i;
>  
> -	if (clkspec->np != pd->np || clkspec->args_count != 2)
> +	if (clkspec->np != pd->genpd.dev.of_node || clkspec->args_count != 2)
>  		return false;
>  
>  	switch (clkspec->args[0]) {
> @@ -549,7 +548,6 @@ static int __init cpg_mssr_add_clk_domain(struct device *dev,
>  	if (!pd)
>  		return -ENOMEM;
>  
> -	pd->np = np;
>  	pd->num_core_pm_clks = num_core_pm_clks;
>  	memcpy(pd->core_pm_clks, core_pm_clks, pm_size);
>  
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas S�derlund
