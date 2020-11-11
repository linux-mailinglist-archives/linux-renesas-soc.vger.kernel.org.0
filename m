Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FF352AFC17
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Nov 2020 02:32:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728303AbgKLBcK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Nov 2020 20:32:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727991AbgKKX4T (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Nov 2020 18:56:19 -0500
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B191EC0613D1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2020 15:56:18 -0800 (PST)
Received: by mail-lj1-x243.google.com with SMTP id o24so4054903ljj.6
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2020 15:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=yZBInjEhqGJoQNzhkaJOLMFbqjSqBvR/K7kmtW5Xg1E=;
        b=NBhlVTDtw5GtpKvQgUL1lnCappyhHsYiRieriM+llP2UueqvCoxFQshv9Qxq6SXgks
         w9WcFO+AHzN+zLIMk3xNvLmdlhguwXpPOKzBhw66wydE5vdBcK5n/CpeaQXj4TUoMMpB
         xDJ5zVeK8jTqXHBc4/ZO4WROjOlv6/tnM+Nt48CBQIFpbDxGcgm1dU/BSEeqrgW9z/s/
         RqfkAQvX/bDXEcczJBk4ezpUp93aHwXo3YXN/qAvqh+8liD0Kfn5un3OO+a5bzu4Pc64
         n1ds6A2RBSz+uOTApo5129NzLbCjmr8j4tUBkYCiGFd8T6nWwSNr5vNV4TSfkELshFk2
         tklg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=yZBInjEhqGJoQNzhkaJOLMFbqjSqBvR/K7kmtW5Xg1E=;
        b=KO+HiBgc8pVow8dFsztAJ46jLD36Sn67CGKTR5sjLVeMEeu2NzuKEROn7xc2GfW2Yb
         Af3wG5exIhwKlj8hqlFtZ46nxGjEPwbjsOPRnq5pw6pnRIL2jZTy6FbiC5tlK+S0mteT
         PrySChcKUuqEnBC7Gx3IdWPdRBY6oaa/n0o/R+sKI2KJ8Ix/FhdqpUPdOeUbOKHatm1Y
         sHKgsmqCLZkosI3wXoHcjxy8LONIdwd92qdjA5wP6a+prpRi3vlk/+wPlb0ZNkr2zSQA
         fX+eKOxL9hUIXM9iuxC3XBEj1Mn+vSYlHpCnrlaQs/ynxKvhxyRZswVf16V3kbA3otK4
         AYdQ==
X-Gm-Message-State: AOAM5330sloWrzmsqVUOlXlHEHiKXEMDNxe75F+hsVAf71rLV1qfAX3P
        iuDomrzYbRoSt1sQnC+wCfpkl7YDLCe8iQ==
X-Google-Smtp-Source: ABdhPJxJbswP/LoSLpqOlKmpJS7kGci5xukGqAeg9hHP+pHsHjG5+76/XAqdhfg5wS6CwL0dwCHtWw==
X-Received: by 2002:a2e:8098:: with SMTP id i24mr6111469ljg.152.1605138977138;
        Wed, 11 Nov 2020 15:56:17 -0800 (PST)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id s5sm366513lfd.58.2020.11.11.15.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 15:56:16 -0800 (PST)
Date:   Thu, 12 Nov 2020 00:56:15 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [RFC PATCH 4/4] mmc: renesas_sdhi: simplify reset routine a
 little
Message-ID: <20201111235615.GC1263071@oden.dyn.berto.se>
References: <20201110142058.36393-1-wsa+renesas@sang-engineering.com>
 <20201110142058.36393-5-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201110142058.36393-5-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

Thanks for your work.

On 2020-11-10 15:20:58 +0100, Wolfram Sang wrote:
> The 'reset' pointer is only populated for Gen2+. So, we don't need to
> check for that flag inside the routine.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/mmc/host/renesas_sdhi_core.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index 4a1ed5bf216c..1fabf8c5773c 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -552,6 +552,7 @@ static int renesas_sdhi_prepare_hs400_tuning(struct mmc_host *mmc, struct mmc_io
>  	return 0;
>  }
>  
> +/* only populated for TMIO_MMC_MIN_RCAR2 */
>  static void renesas_sdhi_reset(struct tmio_mmc_host *host)
>  {
>  	struct renesas_sdhi *priv = host_to_priv(host);
> @@ -569,9 +570,7 @@ static void renesas_sdhi_reset(struct tmio_mmc_host *host)
>  			       sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_RVSCNTL));
>  	}
>  
> -	if (host->pdata->flags & TMIO_MMC_MIN_RCAR2)
> -		sd_ctrl_write32_as_16_and_16(host, CTL_IRQ_MASK,
> -					     TMIO_MASK_INIT_RCAR2);
> +	sd_ctrl_write32_as_16_and_16(host, CTL_IRQ_MASK, TMIO_MASK_INIT_RCAR2);
>  }
>  
>  #define SH_MOBILE_SDHI_MIN_TAP_ROW 3
> -- 
> 2.28.0
> 

-- 
Regards,
Niklas Söderlund
