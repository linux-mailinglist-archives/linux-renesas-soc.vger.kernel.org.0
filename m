Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB3F11B2551
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Apr 2020 13:48:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726018AbgDULs1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 21 Apr 2020 07:48:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728659AbgDULs0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Apr 2020 07:48:26 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA4EFC061A10
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Apr 2020 04:48:25 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id y4so13616968ljn.7
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Apr 2020 04:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=WthWl0ofkQVZ0izGYsGCgjoGn+5tpeaX1xtYlSrM77E=;
        b=M3e+03IQQHh19vu3+IqCDJ5CnRk6OeROGlnw2Zkq7mV6IalUnUKeoGrqRcjgQywzQS
         FgbixJWGUage8cAMSMzNDew7fwXWh9ZbbcIhVWGN87RTh3wm3UOHnTXym3VAdHL/LoNG
         bnXmIWT0Le1Wqkz42PF1c+ZMs6MQv49RzN90pcDv2EThvx9vwyaS3QaRhV0tWXlAQbs4
         PmIKgV35BxwfY+V1M9xTPNrRbSzcv5plfYS7jIjgg7DtTGX7zdnm+23xYwn7LcHApfSc
         neHSck8pNHdKa+66NHV4fike/U3LYFaQcl3D3VNd60nSmmmhAG/tPJtzpRKYTywAl+M2
         vfyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=WthWl0ofkQVZ0izGYsGCgjoGn+5tpeaX1xtYlSrM77E=;
        b=eQIduFAF2cLUZVNbQJsBV3bHMy0zBChRVAxF+MlQqR8vm0aUpiZ6te13d41nO6u6Uv
         NkZrj6k7fGpWFRk3qj0d5/Do7byzBSnf61qdd3wUs63D+eoz5ycTcu38K+HM8UMMPgd0
         6bN7+G3DpHOL9T8dvvN4Fgh9zypiQbr7Rm4GPaAlo18vtT2oLUI+RUuz+WNAiXMN54h/
         RDyxDAufaPop/0ZpJTsgHfF5U3ipx40Y/+cWBWFnuwOPDC3tjT/1159/0H4CC7aDPoAR
         z5wO1aXYGYi4JPgnV1ReYXn351mVkN25lOodnkZWjfB5hJKLqeEipNgREnzZpyaT6qCO
         m9lw==
X-Gm-Message-State: AGi0PuY6Utfk3kyckykrhFsGavN6QhQtChz/X9xMlsvnjmRLKt25ylZ/
        bVBUvNW8yZkFYlWQ7L87Z9zmZf9Z/eY=
X-Google-Smtp-Source: APiQypJto+OJO85STpa7GBrtCU5Pmo1PrVliKXZ+6uAxNpDecvO79fXnI+G4ut+oJKLb1TctABJxmA==
X-Received: by 2002:a2e:b00a:: with SMTP id y10mr12203805ljk.158.1587469704455;
        Tue, 21 Apr 2020 04:48:24 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id z7sm1765798ljc.17.2020.04.21.04.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2020 04:48:23 -0700 (PDT)
Date:   Tue, 21 Apr 2020 13:48:23 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] mmc: renesas_sdhi: shorten types after refactorization
Message-ID: <20200421114823.GC2600980@oden.dyn.berto.se>
References: <20200420170230.9091-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200420170230.9091-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

Thanks for your patch.

On 2020-04-20 19:02:30 +0200, Wolfram Sang wrote:
> After TAP refactorization, we can use 'unsigned int' for two more
> variables because all the calculations work on this type now.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/mmc/host/renesas_sdhi.h      | 2 +-
>  drivers/mmc/host/renesas_sdhi_core.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
> index 12d8016672b0..86efa9d5cd6d 100644
> --- a/drivers/mmc/host/renesas_sdhi.h
> +++ b/drivers/mmc/host/renesas_sdhi.h
> @@ -64,7 +64,7 @@ struct renesas_sdhi {
>  	/* Sampling data comparison: 1 for match, 0 for mismatch */
>  	DECLARE_BITMAP(smpcmp, BITS_PER_LONG);
>  	unsigned int tap_num;
> -	unsigned long tap_set;
> +	unsigned int tap_set;
>  };
>  
>  #define host_to_priv(host) \
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index 1dfe6c32280b..28b0830c4251 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -527,7 +527,7 @@ static int renesas_sdhi_execute_tuning(struct tmio_mmc_host *host, u32 opcode)
>  static bool renesas_sdhi_manual_correction(struct tmio_mmc_host *host, bool use_4tap)
>  {
>  	struct renesas_sdhi *priv = host_to_priv(host);
> -	unsigned long new_tap = priv->tap_set;
> +	unsigned int new_tap = priv->tap_set;
>  	u32 val;
>  
>  	val = sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_RVSREQ);
> -- 
> 2.20.1
> 

-- 
Regards,
Niklas Söderlund
