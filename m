Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6653158662
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2020 01:02:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727598AbgBKACo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Feb 2020 19:02:44 -0500
Received: from mail-lf1-f65.google.com ([209.85.167.65]:35151 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727578AbgBKACn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Feb 2020 19:02:43 -0500
Received: by mail-lf1-f65.google.com with SMTP id z18so5658293lfe.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Feb 2020 16:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=cKEW2oUgOjCypiZhYcZ2lOx7hLN52eOywH4Wltad51U=;
        b=Ws25qt8Mkv/A4U/S8rkX84BJboHUsgtO0s2IOm1b3Ouqgbg+mbn3uRYX0zxHrVG1vh
         Q6FYQ4xRq6ffz4dSEqi7lKYM2ZHMBVyU53Gf1DbO+ZewK/XFl6tECFDJUlu3hcDWgKVy
         gf07fC2nMxZumeF1bQePim6cSy+sVsNSlqn6uviMdTb0ypLz8K9dczUkk26zVn46+8Qw
         QDJZeN0J4BfQfD4FFE2pjCQwzwJljSsqXYJQfCPASD1nSRd2/9oHCLTqq05IpZjcwizm
         rkBlAosOE5d6j5xdsixkJ/6Vn/5jcsDx006OYjZOUSdY12Xzjh9AGFHVO14t+AjDNDY4
         zGIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=cKEW2oUgOjCypiZhYcZ2lOx7hLN52eOywH4Wltad51U=;
        b=IqIdK12jMPkGEZCX43WQWw5XM83TdMTu86qodxW0yin4fuI1o+mY5AmRTlB3RanxF7
         w1qLX7T0RPnaE0aFX4ZLRfbJ4YZDV5bKDailQQWYCuZqpAqcCkGB+fo7td1meC/gTzrN
         f89md+fHCHOthcMfLZLQArjAZdoUWLq/MkQkAKiKoJAUgJxXpFnxqemCyVyjhQrMi6yU
         iPX0C+sAMqlvbsyMOU65og2w8dN1SgVdG/Az50y5L8h97ZxUNUAaSEeUgDXMpyD/24U6
         aYFAs9vFEUeVrUgCpwwKHQKn437exf2liwID5DYB4bpEndQqUmXC4RYKXcVPdUsRVTZI
         hm8w==
X-Gm-Message-State: APjAAAXHPsgTFlB6wYlfrHhydlgMl8ptYql8Dc0JLkXSKZHi/EAYwkw4
        cwUTS+mr4D916Aq63JhamJjM1v5Yma2ahA==
X-Google-Smtp-Source: APXvYqzANtjoaf7m4/dM3WgJzxTj1WApGl+OuWY9CAL83omkOWXL+2gatuo6NJYz74gLZNHkXiggiA==
X-Received: by 2002:a19:f610:: with SMTP id x16mr1990681lfe.80.1581379360779;
        Mon, 10 Feb 2020 16:02:40 -0800 (PST)
Received: from localhost (h-200-138.A463.priv.bahnhof.se. [176.10.200.138])
        by smtp.gmail.com with ESMTPSA id g15sm1082413ljk.8.2020.02.10.16.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 16:02:40 -0800 (PST)
Date:   Tue, 11 Feb 2020 01:02:39 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [RFC PATCH 6/6] mmc: tmio: remove superfluous callback wrappers
Message-ID: <20200211000239.GF2443363@oden.dyn.berto.se>
References: <20200129203709.30493-1-wsa+renesas@sang-engineering.com>
 <20200129203709.30493-7-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200129203709.30493-7-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

Thanks for your patch.

On 2020-01-29 21:37:09 +0100, Wolfram Sang wrote:
> After various refactoring, we can populate the mmc_ops callbacks
> directly and don't need to have wrappers for them anymore.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/mmc/host/renesas_sdhi_core.c | 18 ++++++++++------
>  drivers/mmc/host/tmio_mmc_core.c     | 32 +---------------------------
>  2 files changed, 12 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index 22eaabe513d0..0f07cc1aee34 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -321,8 +321,9 @@ static unsigned int renesas_sdhi_init_tuning(struct tmio_mmc_host *host)
>  		SH_MOBILE_SDHI_SCC_DTCNTL_TAPNUM_MASK;
>  }
>  
> -static void renesas_sdhi_hs400_complete(struct tmio_mmc_host *host)
> +static void renesas_sdhi_hs400_complete(struct mmc_host *mmc)
>  {
> +	struct tmio_mmc_host *host = mmc_priv(mmc);
>  	struct renesas_sdhi *priv = host_to_priv(host);
>  
>  	sd_ctrl_write16(host, CTL_SD_CARD_CLK_CTL, ~CLK_CTL_SCLKEN &
> @@ -376,8 +377,9 @@ static void renesas_sdhi_reset_scc(struct tmio_mmc_host *host,
>  				     SH_MOBILE_SDHI_SCC_CKSEL));
>  }
>  
> -static void renesas_sdhi_disable_scc(struct tmio_mmc_host *host)
> +static void renesas_sdhi_disable_scc(struct mmc_host *mmc)
>  {
> +	struct tmio_mmc_host *host = mmc_priv(mmc);
>  	struct renesas_sdhi *priv = host_to_priv(host);
>  
>  	renesas_sdhi_reset_scc(host, priv);
> @@ -412,9 +414,12 @@ static void renesas_sdhi_reset_hs400_mode(struct tmio_mmc_host *host,
>  			sd_ctrl_read16(host, CTL_SD_CARD_CLK_CTL));
>  }
>  
> -static void renesas_sdhi_prepare_hs400_tuning(struct tmio_mmc_host *host)
> +static int renesas_sdhi_prepare_hs400_tuning(struct mmc_host *mmc, struct mmc_ios *ios)
>  {
> +	struct tmio_mmc_host *host = mmc_priv(mmc);
> +
>  	renesas_sdhi_reset_hs400_mode(host, host_to_priv(host));
> +	return 0;
>  }
>  
>  #define SH_MOBILE_SDHI_MAX_TAP 3
> @@ -899,10 +904,9 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>  
>  		host->execute_tuning = renesas_sdhi_execute_tuning;
>  		host->check_retune = renesas_sdhi_check_scc_error;
> -		host->prepare_hs400_tuning =
> -			renesas_sdhi_prepare_hs400_tuning;
> -		host->hs400_downgrade = renesas_sdhi_disable_scc;
> -		host->hs400_complete = renesas_sdhi_hs400_complete;
> +		host->ops.prepare_hs400_tuning = renesas_sdhi_prepare_hs400_tuning;
> +		host->ops.hs400_downgrade = renesas_sdhi_disable_scc;

Would it make sens to rename renesas_sdhi_disable_scc() to 
renesas_sdhi_hs400_downgrade() to fit the pattern that it's called from 
the mmc_ops?

With or without this nit,

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> +		host->ops.hs400_complete = renesas_sdhi_hs400_complete;
>  	}
>  
>  	num_irqs = platform_irq_count(pdev);
> diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
> index aeafa1c68ce2..a2415fb5dde0 100644
> --- a/drivers/mmc/host/tmio_mmc_core.c
> +++ b/drivers/mmc/host/tmio_mmc_core.c
> @@ -997,34 +997,7 @@ static int tmio_multi_io_quirk(struct mmc_card *card,
>  	return blk_size;
>  }
>  
> -static int tmio_mmc_prepare_hs400_tuning(struct mmc_host *mmc,
> -					 struct mmc_ios *ios)
> -{
> -	struct tmio_mmc_host *host = mmc_priv(mmc);
> -
> -	if (host->prepare_hs400_tuning)
> -		host->prepare_hs400_tuning(host);
> -
> -	return 0;
> -}
> -
> -static void tmio_mmc_hs400_downgrade(struct mmc_host *mmc)
> -{
> -	struct tmio_mmc_host *host = mmc_priv(mmc);
> -
> -	if (host->hs400_downgrade)
> -		host->hs400_downgrade(host);
> -}
> -
> -static void tmio_mmc_hs400_complete(struct mmc_host *mmc)
> -{
> -	struct tmio_mmc_host *host = mmc_priv(mmc);
> -
> -	if (host->hs400_complete)
> -		host->hs400_complete(host);
> -}
> -
> -static const struct mmc_host_ops tmio_mmc_ops = {
> +static struct mmc_host_ops tmio_mmc_ops = {
>  	.request	= tmio_mmc_request,
>  	.set_ios	= tmio_mmc_set_ios,
>  	.get_ro         = tmio_mmc_get_ro,
> @@ -1033,9 +1006,6 @@ static const struct mmc_host_ops tmio_mmc_ops = {
>  	.multi_io_quirk	= tmio_multi_io_quirk,
>  	.hw_reset	= tmio_mmc_hw_reset,
>  	.execute_tuning = tmio_mmc_execute_tuning,
> -	.prepare_hs400_tuning = tmio_mmc_prepare_hs400_tuning,
> -	.hs400_downgrade = tmio_mmc_hs400_downgrade,
> -	.hs400_complete	= tmio_mmc_hs400_complete,
>  };
>  
>  static int tmio_mmc_init_ocr(struct tmio_mmc_host *host)
> -- 
> 2.20.1
> 

-- 
Regards,
Niklas Söderlund
