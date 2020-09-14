Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F25182693F3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Sep 2020 19:47:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726155AbgINRq1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Sep 2020 13:46:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726076AbgINMD4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Sep 2020 08:03:56 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0432CC06178A
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Sep 2020 04:54:13 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id k25so18370229ljk.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Sep 2020 04:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=zjdRdVewBNz6bXTR/96hRuG4jQDF97H/qFQIJtyLqPA=;
        b=yAUfhrrLWO2cjdsnZ04SwrIq5fnFFZArwfa1/vIyn86XuOOmFfGPlece+QLayEvxVP
         8DQXfQE9UkMLy0EvSppwOq2pIZFyTCeWgo/lMJGIDxbYSA4wUUSsD4pZZbXC95sRrCFb
         EItLsdbBGtfv3Vcth8EPlhv/3kEno6NdgeKf+pP8wqoPeFRamAy7Y5dzkIzm3ZgBXpYd
         WVIuq9M3YN55jmcRVj+IvtAYRnRgLlfJd+LAL0AtBLbIGQjCLQfQ7pv3s5bZVKASZ2Cm
         sT0/pzW22uexJGfOoIifZVYbCEsqcGADe39Hb55wK35XZE0L2r+TEPjJ9HmxNeUq9qXt
         nhJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=zjdRdVewBNz6bXTR/96hRuG4jQDF97H/qFQIJtyLqPA=;
        b=sj0LtedFBKbBR43gYqEPL+BqRU0bXH1sM97b2HnefMo7c4aeHnjuZAuKpcUGoMaGh8
         Ahj0R0mBUkERUj2flEFGzFYQg89VtklCdbwgfuxJ+N5GUzXUKxtnC79fkAS00bZphnLp
         aDcwS9OODHU13r5FroYgv2oxDAq0daR9buZLrflf1VExb4nkrn1ImtVj2U07bnK8cRTJ
         FGK1M1niEZKAP+x0741cVFGGfEgQoeUJSi3+/XK+AYVb1TDvPiEfif0CvSBRaB7Wcv6v
         Dcrc6KSKm/warFCr+Hh/Ukf7GLCylrni2apFtrZs6RiC3WfjYjpzVkggo2vvw9kEkd6c
         8uXA==
X-Gm-Message-State: AOAM531EcidnIwhT5WskHEfJ7EOc1/jKnjwEWSzbgfoSuo6CxNJQc8Lh
        Au1Cc1Oy9tjX1hPkW7EwTWy6nMzZWZYUGg==
X-Google-Smtp-Source: ABdhPJzInNQ1q7yxRTp/DjL1B7Zb0KZiWbCU68M5qyRxDaZUvRJqhtmoFPL1TgDxKjuDrF3Py5+Dkg==
X-Received: by 2002:a2e:240e:: with SMTP id k14mr4719168ljk.169.1600084451418;
        Mon, 14 Sep 2020 04:54:11 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id z6sm3332234lfq.297.2020.09.14.04.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2020 04:54:10 -0700 (PDT)
Date:   Mon, 14 Sep 2020 13:54:10 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH] mmc: core: clear 'doing_init_tune' also after failures
Message-ID: <20200914115410.GM1127199@oden.dyn.berto.se>
References: <20200914112845.21855-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200914112845.21855-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

Thanks for your work.

On 2020-09-14 13:28:45 +0200, Wolfram Sang wrote:
> Reorganize the code, so that the flag is always cleared independently of
> a good or bad case.
> 
> Fixes: 97a7d87e96b0 ("mmc: core: add a 'doing_init_tune' flag and a 'mmc_doing_tune' helper")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> 
> Sorry for overlooking this :(
> 
>  drivers/mmc/core/mmc.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mmc/core/mmc.c b/drivers/mmc/core/mmc.c
> index 67e95eba0e82..ff3063ce2acd 100644
> --- a/drivers/mmc/core/mmc.c
> +++ b/drivers/mmc/core/mmc.c
> @@ -1766,14 +1766,14 @@ static int mmc_init_card(struct mmc_host *host, u32 ocr,
>  		host->doing_init_tune = 1;
>  
>  		err = mmc_hs200_tuning(card);
> -		if (err)
> -			goto free_card;
> +		if (!err)
> +			err = mmc_select_hs400(card);
> +
> +		host->doing_init_tune = 0;
>  
> -		err = mmc_select_hs400(card);
>  		if (err)
>  			goto free_card;
>  
> -		host->doing_init_tune = 0;
>  	} else if (!mmc_card_hs400es(card)) {
>  		/* Select the desired bus width optionally */
>  		err = mmc_select_bus_width(card);
> -- 
> 2.20.1
> 

-- 
Regards,
Niklas Söderlund
