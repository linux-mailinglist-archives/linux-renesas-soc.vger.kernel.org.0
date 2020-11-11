Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C6802AFA42
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Nov 2020 22:18:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726205AbgKKVSO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 11 Nov 2020 16:18:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726108AbgKKVSO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Nov 2020 16:18:14 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 345B7C0613D1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2020 13:18:14 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id e27so5195358lfn.7
        for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Nov 2020 13:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=c7mso2viC1SJS7AqlelAZfkI9SWQHNhnB5GpC2v39s0=;
        b=ESLAH/2Z2s/u0Ojl3oWEsnpG2nDfFVsDUvFKZ5twHoBlg+tRYRyU5KNlxRxPq7q1yc
         1meMoYwwx4h2nXgDcjHA2F/h4gifXhJu1c0gRaS9g/0x+QM3z2X9Vb4uJLniOEtB+K5B
         wMshMnLSnqRdG11vum8OODzMU7VcWDtJMLRCt6x4U4UKFUYs26NvNTIH+s7+UWay3hiw
         Rk1eOlbAvYQl/0R8/+/8rKEQWmBX5RCo0xUdWTfT6Df443jT/DMyJS7Cm094AEdx8IZV
         LSQebTnH2uI/Std9V25sPBQeL1ZcYerpW3gZFrU5qmLuTt6cxBbFGy13Eesdnk5ZzCoy
         8xYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=c7mso2viC1SJS7AqlelAZfkI9SWQHNhnB5GpC2v39s0=;
        b=myzKCDXk134KvPtsKZlIepnHd8DVHsvNRDPYVsdz0igyam/P0BX+qdyxwVPhAqRFgg
         rCXRybb1DAml954fuxhuM0aSf10NEgORL/WaB7jj4apLoHt0XDLd7OPix3tmaIURGIY/
         lTp7bYHwynDyIP0zms7jXGhHzj2SA/9iuV9at1WC5DFOyfwkWquqjMosjU1XMWdQtR5Y
         PejnThFLP1BcrUIxqwQxKUGYa6iQ7X2889jOcLxbrddS9qIsj/PWeLQ6zGMepQa5t5W5
         9uEolOIuAUyAtHw8as8YcxlbnLmk2Ep3C7OhW1bc6mwfc3UiwJ1BSrQAc2Pk4Di+/UDw
         iWww==
X-Gm-Message-State: AOAM531LVQY44oRUKW6CZNboHK7pKKC3tYNnw//ZRL7KyoSeGzs3V4Ou
        eeGRgM8kXMLivm3kSdCuQ1ch2Q==
X-Google-Smtp-Source: ABdhPJwZGoG0JdQlf3WLqCzOCCJ+eqSjf5trqrMFitG/xd1YNhF2kkmo29bY0w1RILvKyHZEL6vNvg==
X-Received: by 2002:a05:6512:24d:: with SMTP id b13mr7344688lfo.544.1605129492745;
        Wed, 11 Nov 2020 13:18:12 -0800 (PST)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id o3sm331170lfo.217.2020.11.11.13.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2020 13:18:11 -0800 (PST)
Date:   Wed, 11 Nov 2020 22:18:11 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [RFC PATCH 1/4] mmc: renesas_sdhi: only reset SCC when its
 pointer is populated
Message-ID: <20201111211811.GC667473@oden.dyn.berto.se>
References: <20201110142058.36393-1-wsa+renesas@sang-engineering.com>
 <20201110142058.36393-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201110142058.36393-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

Thanks for your work.

On 2020-11-10 15:20:55 +0100, Wolfram Sang wrote:
> Only re-initialize SCC and tuning when an SCC was found during probe().
> This is currently a noop because all R-Car Gen2+ are considered to have
> an SCC. But this will change in a later patch, so we need this
> preparation.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/mmc/host/renesas_sdhi_core.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index acb9c81a4e45..a395f835e836 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -556,16 +556,18 @@ static void renesas_sdhi_reset(struct tmio_mmc_host *host)
>  {
>  	struct renesas_sdhi *priv = host_to_priv(host);
>  
> -	renesas_sdhi_reset_scc(host, priv);
> -	renesas_sdhi_reset_hs400_mode(host, priv);
> -	priv->needs_adjust_hs400 = false;
> +	if (priv->scc_ctl) {
> +		renesas_sdhi_reset_scc(host, priv);
> +		renesas_sdhi_reset_hs400_mode(host, priv);
> +		priv->needs_adjust_hs400 = false;
>  
> -	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, CLK_CTL_SCLKEN |
> -			sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
> +		sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, CLK_CTL_SCLKEN |
> +				sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
>  
> -	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_RVSCNTL,
> -		       ~SH_MOBILE_SDHI_SCC_RVSCNTL_RVSEN &
> -		       sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_RVSCNTL));
> +		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_RVSCNTL,
> +			       ~SH_MOBILE_SDHI_SCC_RVSCNTL_RVSEN &
> +			       sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_RVSCNTL));
> +	}
>  
>  	if (host->pdata->flags & TMIO_MMC_MIN_RCAR2)
>  		sd_ctrl_write32_as_16_and_16(host, CTL_IRQ_MASK,
> -- 
> 2.28.0
> 

-- 
Regards,
Niklas Söderlund
