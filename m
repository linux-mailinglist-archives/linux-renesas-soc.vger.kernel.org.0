Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AE45D158650
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Feb 2020 00:57:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727518AbgBJX5e (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Feb 2020 18:57:34 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:42429 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727490AbgBJX5d (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Feb 2020 18:57:33 -0500
Received: by mail-lj1-f193.google.com with SMTP id d10so9503047ljl.9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Feb 2020 15:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=ikANhC1FpEy9jezC9Q3VV+jvFA+DSwuQk9SJnM3pUPU=;
        b=Ct/kOj9Veqg+ukJIXXk2kydTnf2Wx1l2btoVCP2bcWi/tgvfnx5n9bX8NWX+nScc/n
         tbd8pZMNXWwj9L1HCnpLevlCnhLUOlD0vmuL/1TclKowvjyjf0mB5ZY6yCsPLh9QwMRo
         SfYfNYwBg1FJeCHbDfC54RYNzOYx6NHGKBEWOZGJkKYNwa+KtR4gx4gWXvfFTCXatI9e
         OqZpvioD0J1s1OpTKeSoUpO0n0H/UqfS0z+VBL2ZZS9dRYiUWqFKQx2P2SgrHg7j5pUf
         NEMZeGylsQ/LanbMeHiMYpy93X41JDffPCUdsDruoKYcFW+fuktYmttbikl59axXGgTJ
         9tow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=ikANhC1FpEy9jezC9Q3VV+jvFA+DSwuQk9SJnM3pUPU=;
        b=BEr3lJQBopATMxdPswBVnlp0q7kTDBRFNMeAk2efnREmE4qjADdYCoAJzvG/bG4QiZ
         0BOJGG/XdGDI/F2iZMTDxH1V9iu4K0J0jBB2El/2U5zg8qgNEjvj8Py6ZpNkMnIRuIyU
         9Qy+ubymUk2jyfu1cDO6+pY9wy93105gNO5q9sOYzMoJ4+aUB/c8oju/qh+dWby/n/bM
         EbgWtDx09vUbkWF9uCqAt/s/7B6D5NIzJy8emrM3O6LGzjC63SHbTZCiOMBddR48XM1i
         uXOR9taY7JXpngQF0h3kStL6AW2DApyP89RJmy+tya+NCxRmHYi9cT4ccu9JrBXEqAV9
         dGqA==
X-Gm-Message-State: APjAAAU/k32WzjoyjYQIIFg4+vKp7taOKBCuWd5zkqetpIkDPHzeLuL7
        cRumH/xKzi6szLrMSC9u8bUsaQ==
X-Google-Smtp-Source: APXvYqwmXEXW7zfq8f6OqVBtYCvOGzc3WYHrhEmhmV1NsaKEyEXARKiafFrNrdTOkHTNTvDRQLFS4A==
X-Received: by 2002:a2e:3504:: with SMTP id z4mr2412841ljz.273.1581379051146;
        Mon, 10 Feb 2020 15:57:31 -0800 (PST)
Received: from localhost (h-200-138.A463.priv.bahnhof.se. [176.10.200.138])
        by smtp.gmail.com with ESMTPSA id m8sm830780lfp.4.2020.02.10.15.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 15:57:30 -0800 (PST)
Date:   Tue, 11 Feb 2020 00:57:30 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [RFC PATCH 5/6] mmc: tmio: factor out TAP usage
Message-ID: <20200210235730.GE2443363@oden.dyn.berto.se>
References: <20200129203709.30493-1-wsa+renesas@sang-engineering.com>
 <20200129203709.30493-6-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200129203709.30493-6-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

Thanks for your work.

On 2020-01-29 21:37:08 +0100, Wolfram Sang wrote:
> TAPs are Renesas SDHI specific. Now that we moved all handling to the
> SDHI core, we can also move the definitions from the TMIO struct to the
> SDHI one.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/mmc/host/renesas_sdhi.h      |  5 ++++
>  drivers/mmc/host/renesas_sdhi_core.c | 38 ++++++++++++++--------------
>  drivers/mmc/host/tmio_mmc.h          |  5 ----
>  3 files changed, 24 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
> index 11a0b2bca3aa..7a1a741547f2 100644
> --- a/drivers/mmc/host/renesas_sdhi.h
> +++ b/drivers/mmc/host/renesas_sdhi.h
> @@ -58,6 +58,11 @@ struct renesas_sdhi {
>  	u32 scc_tappos;
>  	u32 scc_tappos_hs400;
>  	bool doing_tune;
> +
> +	/* Tuning values: 1 for success, 0 for failure */
> +	DECLARE_BITMAP(taps, BITS_PER_BYTE * sizeof(long));
> +	unsigned int tap_num;
> +	unsigned long tap_set;
>  };
>  
>  #define host_to_priv(host) \
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index 0c9e5e010bda..22eaabe513d0 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -354,7 +354,7 @@ static void renesas_sdhi_hs400_complete(struct tmio_mmc_host *host)
>  
>  	if (priv->quirks && priv->quirks->hs400_4taps)
>  		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TAPSET,
> -			       host->tap_set / 2);
> +			       priv->tap_set / 2);
>  
>  	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_CKSEL,
>  		       SH_MOBILE_SDHI_SCC_CKSEL_DTSEL |
> @@ -438,11 +438,11 @@ static int renesas_sdhi_select_tuning(struct tmio_mmc_host *host)
>  	 * result requiring the tap to be good in both runs before
>  	 * considering it for tuning selection.
>  	 */
> -	for (i = 0; i < host->tap_num * 2; i++) {
> -		int offset = host->tap_num * (i < host->tap_num ? 1 : -1);
> +	for (i = 0; i < priv->tap_num * 2; i++) {
> +		int offset = priv->tap_num * (i < priv->tap_num ? 1 : -1);
>  
> -		if (!test_bit(i, host->taps))
> -			clear_bit(i + offset, host->taps);
> +		if (!test_bit(i, priv->taps))
> +			clear_bit(i + offset, priv->taps);
>  	}
>  
>  	/*
> @@ -454,8 +454,8 @@ static int renesas_sdhi_select_tuning(struct tmio_mmc_host *host)
>  	ntap = 0;
>  	tap_start = 0;
>  	tap_end = 0;
> -	for (i = 0; i < host->tap_num * 2; i++) {
> -		if (test_bit(i, host->taps)) {
> +	for (i = 0; i < priv->tap_num * 2; i++) {
> +		if (test_bit(i, priv->taps)) {
>  			ntap++;
>  		} else {
>  			if (ntap > tap_cnt) {
> @@ -474,12 +474,12 @@ static int renesas_sdhi_select_tuning(struct tmio_mmc_host *host)
>  	}
>  
>  	if (tap_cnt >= SH_MOBILE_SDHI_MAX_TAP)
> -		host->tap_set = (tap_start + tap_end) / 2 % host->tap_num;
> +		priv->tap_set = (tap_start + tap_end) / 2 % priv->tap_num;
>  	else
>  		return -EIO;
>  
>  	/* Set SCC */
> -	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TAPSET, host->tap_set);
> +	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TAPSET, priv->tap_set);
>  
>  	/* Enable auto re-tuning */
>  	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_RVSCNTL,
> @@ -494,27 +494,27 @@ static int renesas_sdhi_execute_tuning(struct tmio_mmc_host *host, u32 opcode)
>  	struct renesas_sdhi *priv = host_to_priv(host);
>  	int i, ret;
>  
> -	host->tap_num = renesas_sdhi_init_tuning(host);
> -	if (!host->tap_num)
> +	priv->tap_num = renesas_sdhi_init_tuning(host);
> +	if (!priv->tap_num)
>  		return 0; /* Tuning is not supported */
>  
> -	if (host->tap_num * 2 >= sizeof(host->taps) * BITS_PER_BYTE) {
> +	if (priv->tap_num * 2 >= sizeof(priv->taps) * BITS_PER_BYTE) {
>  		dev_err(&host->pdev->dev,
>  			"Too many taps, please update 'taps' in tmio_mmc_host!\n");
>  		return -EINVAL;
>  	}
>  
>  	priv->doing_tune = true;
> -	bitmap_zero(host->taps, host->tap_num * 2);
> +	bitmap_zero(priv->taps, priv->tap_num * 2);
>  
>  	/* Issue CMD19 twice for each tap */
> -	for (i = 0; i < 2 * host->tap_num; i++) {
> +	for (i = 0; i < 2 * priv->tap_num; i++) {
>  		/* Set sampling clock position */
> -		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TAPSET, i % host->tap_num);
> +		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TAPSET, i % priv->tap_num);
>  
>  		ret = mmc_send_tuning(host->mmc, opcode, NULL);
>  		if (ret == 0)
> -			set_bit(i, host->taps);
> +			set_bit(i, priv->taps);
>  	}
>  
>  	return renesas_sdhi_select_tuning(host);
> @@ -523,7 +523,7 @@ static int renesas_sdhi_execute_tuning(struct tmio_mmc_host *host, u32 opcode)
>  static bool renesas_sdhi_manual_correction(struct tmio_mmc_host *host, bool use_4tap)
>  {
>  	struct renesas_sdhi *priv = host_to_priv(host);
> -	unsigned long new_tap = host->tap_set;
> +	unsigned long new_tap = priv->tap_set;
>  	u32 val;
>  
>  	val = sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_RVSREQ);
> @@ -560,9 +560,9 @@ static bool renesas_sdhi_manual_correction(struct tmio_mmc_host *host, bool use_
>  			return false;
>  	}
>  
> -	host->tap_set = (new_tap % host->tap_num);
> +	priv->tap_set = (new_tap % priv->tap_num);
>  	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TAPSET,
> -		       host->tap_set / (use_4tap ? 2 : 1));
> +		       priv->tap_set / (use_4tap ? 2 : 1));
>  
>  	return false;
>  }
> diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
> index b6fffd3d2650..b4cf10109162 100644
> --- a/drivers/mmc/host/tmio_mmc.h
> +++ b/drivers/mmc/host/tmio_mmc.h
> @@ -184,11 +184,6 @@ struct tmio_mmc_host {
>  	 */
>  	int (*execute_tuning)(struct tmio_mmc_host *host, u32 opcode);
>  
> -	/* Tuning values: 1 for success, 0 for failure */
> -	DECLARE_BITMAP(taps, BITS_PER_BYTE * sizeof(long));
> -	unsigned int tap_num;
> -	unsigned long tap_set;
> -
>  	void (*prepare_hs400_tuning)(struct tmio_mmc_host *host);
>  	void (*hs400_downgrade)(struct tmio_mmc_host *host);
>  	void (*hs400_complete)(struct tmio_mmc_host *host);
> -- 
> 2.20.1
> 

-- 
Regards,
Niklas Söderlund
