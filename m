Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1255A90D62
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 17 Aug 2019 08:41:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725832AbfHQGlr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 17 Aug 2019 02:41:47 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:43220 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbfHQGlr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 17 Aug 2019 02:41:47 -0400
Received: by mail-lj1-f194.google.com with SMTP id h15so7134742ljg.10
        for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Aug 2019 23:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=5Cd/Q185nova4XiK7ELL+MyQNYS4sW3uwZzesUuDugs=;
        b=NaIMrskNH+qLeDrwymgec3XFhCFUhnjo8jYi8RUsBDHlMhbitOTWPCs5XmnfYwwYfo
         IrrpNZi8xMkBMhvhqvruGs5T9/CcCSTHTAzfN512N3NRmn/NPYMKDVcH0raEXkYz1oSq
         ETN6G0ADW4Y3YHEp+ocOMDOtPw8FJaS/HJXXCXQqpC9tQd3Dvgha2rkriZkQpZ43O4DW
         T6ziDmvZxsNKGO7AGrp1uKvuSd3K8u+tNXhyOb9hi/urWysBAO4087nI34iFNONiygQb
         eGmR3fNAHsnVp6dV63k87i5NLNvyku2Ps+Y3U1sOsF3SvnX6EuKGUIydCrxGl59Ey4G5
         WInQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=5Cd/Q185nova4XiK7ELL+MyQNYS4sW3uwZzesUuDugs=;
        b=SfCyGxr+z0exYtjE3oP5BsXtQvE590V2nH12Fpq/boQ3pCGfRf3NoQDgG9JfiT+vH8
         HEBcFjuFyglx73Um4fRrCetHD7aXh7mOGQTIaxYYx0BDdcLPLeZXPiUTRwSmLbB5XXwv
         5ODyHLM5c9Uzk2UPv/8ZWNiZjsEnTNd3Y/nnSryPpITEghpse70H9yme+MEfnBv+lqUF
         +r58F+2SznQCLDURpmy3kEetvBOm5gM3lWFlktw0Sj7L+pTAGPSS2k+nZtU4M2jyzbNx
         PuXq0SXfpe6BfDIGkIFvA86yS2nOu1nxjMEY/i1b4RBYINYFKbv0H5VHYV6cDBBuSH3z
         7ZCw==
X-Gm-Message-State: APjAAAVt1GqZPGB6QotgSJH5aLyEpjQxGAbiDQTEnce0yu0godn/uYA5
        BjPSUbPvLhnGDqodrfpQz5j/6Q==
X-Google-Smtp-Source: APXvYqzdHs1NWl++zUYjxNIFfpCYgPAqnJ1v2ohqn4akIbxPJ8+YnaQfYUjSiyBacRA3tB/khcmsLw==
X-Received: by 2002:a2e:9acf:: with SMTP id p15mr7541536ljj.13.1566024105007;
        Fri, 16 Aug 2019 23:41:45 -0700 (PDT)
Received: from localhost (h-177-236.A463.priv.bahnhof.se. [217.31.177.236])
        by smtp.gmail.com with ESMTPSA id z18sm1306389ljc.45.2019.08.16.23.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2019 23:41:44 -0700 (PDT)
Date:   Sat, 17 Aug 2019 08:41:43 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] soc: renesas: rcar-sysc: Eliminate local variable gov
Message-ID: <20190817064143.GF2008@bigcity.dyn.berto.se>
References: <20190816123919.15140-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190816123919.15140-1-geert+renesas@glider.be>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2019-08-16 14:39:19 +0200, Geert Uytterhoeven wrote:
> As of commit 980532a5dda319ee ("soc: renesas: rcar-sysc: Use
> GENPD_FLAG_ALWAYS_ON"), the local variable "gov" is assigned just once,
> so it can be eliminated.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> To be queued in renesas-devel for v5.4.
> 
>  drivers/soc/renesas/rcar-sysc.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/renesas/rcar-sysc.c b/drivers/soc/renesas/rcar-sysc.c
> index 20fa9f34295c2879..40c1ddaa3b4fcae5 100644
> --- a/drivers/soc/renesas/rcar-sysc.c
> +++ b/drivers/soc/renesas/rcar-sysc.c
> @@ -212,7 +212,6 @@ static int __init rcar_sysc_pd_setup(struct rcar_sysc_pd *pd)
>  {
>  	struct generic_pm_domain *genpd = &pd->genpd;
>  	const char *name = pd->genpd.name;
> -	struct dev_power_governor *gov = &simple_qos_governor;
>  	int error;
>  
>  	if (pd->flags & PD_CPU) {
> @@ -266,7 +265,7 @@ static int __init rcar_sysc_pd_setup(struct rcar_sysc_pd *pd)
>  	rcar_sysc_power(&pd->ch, true);
>  
>  finalize:
> -	error = pm_genpd_init(genpd, gov, false);
> +	error = pm_genpd_init(genpd, &simple_qos_governor, false);
>  	if (error)
>  		pr_err("Failed to init PM domain %s: %d\n", name, error);
>  
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
