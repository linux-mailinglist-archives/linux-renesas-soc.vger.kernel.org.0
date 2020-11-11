Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF46D2AFB28
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Nov 2020 23:13:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726890AbgKKWNg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Nov 2020 17:13:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726459AbgKKWNf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Nov 2020 17:13:35 -0500
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7228DC0613D4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2020 14:13:35 -0800 (PST)
Received: by mail-lf1-x144.google.com with SMTP id 74so5394182lfo.5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2020 14:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=/RtCsQrJjqfgxayVrq4/1DDstPiK9fZla8GSUyX2SHc=;
        b=uodQw/I6mcdI6C0gg3wFP024K5ybNYBGsT1u+kDnYkvRJkgR+/lrEnhvY9K8M+oQ7a
         pIsrmyLNyws2awvqFY45Pzu8puH8IAV4nZUH+svFoKAdWSr/4Fwppa9hKidXRYrSJDL7
         a1FK3SMgPKnBfi5rKpIg4E61H/zwJuFEdsel/WtoMIc+uhCwV613Yoc8guVXCE/rJ18f
         I99/5+ImCHa1Fo49NXvsJy2KzlqiUlm+GOFrs3nUA6jvAY7QgLOBUtB730UUlvwD6hpY
         yV+j4QaSQS3WNp4YTtKTvESA8uHkB4ZZ/opAEce9H5wpoJKo9PKC2+0cDThhKXEODV5C
         lcRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=/RtCsQrJjqfgxayVrq4/1DDstPiK9fZla8GSUyX2SHc=;
        b=WGlr2AspGpMyYzqwMw3b4iHMYy8yUmI1jbrImnUghpWwIx1+/3mW4epQ0boOwzLqad
         UgTJudSsFAB0+hwRjyPk6woPPMLiOsQwDNTxvBgX7aGP6ydYMDO8jBNfEyUcCtMG/GRl
         69JtGYgBl++ZrZEgiZNl6GNZEGPptU8qY8XVk68T/Uyd8mMCaNCtq+X8r+PO8NkGO3Il
         jkkLFAETYSrg+aEo5G0cGnJAUnz9HJQO/9DnlgvQYgibfpcVEix1CfzJ5ozW2X/GdtNT
         WXP45eMrAVmBwNaq9hU3gGtqYNuGv0XRUCeNMm3X9RJe8dUOfmIA8m1/UgVesT/+rBI3
         M7bg==
X-Gm-Message-State: AOAM530mh5YsJQLTtzJyAMcU17GehvjA7KuvOa+78vFuFZfVNWWaRikw
        zmM9pLrPFeDSf72+LP+wMyeK5Q==
X-Google-Smtp-Source: ABdhPJwcMQH4bfkDaUx4a6BiOrFf/HfFfQ+tkbEh5L+7ZzIgSn35zFxtoUZTsWUHlmebkMGO7YPayQ==
X-Received: by 2002:a19:7f02:: with SMTP id a2mr11118944lfd.48.1605132813992;
        Wed, 11 Nov 2020 14:13:33 -0800 (PST)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id z5sm352418lfj.290.2020.11.11.14.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 14:13:33 -0800 (PST)
Date:   Wed, 11 Nov 2020 23:13:32 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [RFC PATCH 2/4] mmc: renesas_sdhi: probe into TMIO after SCC
 parameters have been setup
Message-ID: <20201111221332.GA1263071@oden.dyn.berto.se>
References: <20201110142058.36393-1-wsa+renesas@sang-engineering.com>
 <20201110142058.36393-3-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201110142058.36393-3-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

Thanks for your work.

On 2020-11-10 15:20:56 +0100, Wolfram Sang wrote:
> Setting up the SCC parameters does not need a probed TMIO device. But in
> the near future, probing the TMIO device needs the SCC parameters setup.
> So, fix the ordering.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/mmc/host/renesas_sdhi_core.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index a395f835e836..17ebaa324ca1 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -1067,10 +1067,6 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>  			quirks->hs400_calib_table + 1);
>  	}
>  
> -	ret = tmio_mmc_host_probe(host);
> -	if (ret < 0)
> -		goto edisclk;
> -
>  	/* Enable tuning iff we have an SCC and a supported mode */
>  	if (of_data && of_data->scc_offset &&
>  	    (host->mmc->caps & MMC_CAP_UHS_SDR104 ||
> @@ -1102,6 +1098,10 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>  		host->ops.hs400_complete = renesas_sdhi_hs400_complete;
>  	}
>  
> +	ret = tmio_mmc_host_probe(host);
> +	if (ret < 0)
> +		goto edisclk;
> +
>  	num_irqs = platform_irq_count(pdev);
>  	if (num_irqs < 0) {
>  		ret = num_irqs;
> -- 
> 2.28.0
> 

-- 
Regards,
Niklas Söderlund
