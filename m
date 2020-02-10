Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F8351585B1
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2020 23:44:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727436AbgBJWoU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Feb 2020 17:44:20 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:37499 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727431AbgBJWoU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Feb 2020 17:44:20 -0500
Received: by mail-lf1-f66.google.com with SMTP id b15so5547901lfc.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Feb 2020 14:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=JdjT6OWmfWNg4+tGELhUvYLd74rHsrzybvKL1bpvgss=;
        b=YzsjI5w1Z/4h6gD378/0zMRRZKP5XaBlb3C7PXt6LfGAI7BWbdJ0EDA0nuBIT6hfQz
         IcHNqAmhDnmTs5NdgmvvOkP2NmDG16IH1RGvNJpQ9nL3ONoxSCqEbrKUi+akp79ZTtVQ
         Te70fz+oHqLXqkGe2j62zzvp8r0KTXHyatVq6IGno7uRDi3sTjB6lcVI/AzKmDlTayEl
         u1t7AGypbtIL1rTbUvGSBoKqMkMftOxpVuBgRLcVaaHDAONQAJvZ+QnJQm6DEswE+8od
         MS0a9iFp+OVa3aUnhq2jSEsKFHgsw3vwGuLWdlvzkQc4nDvL6h7iJVjpKeuFeULG/kNW
         jsZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=JdjT6OWmfWNg4+tGELhUvYLd74rHsrzybvKL1bpvgss=;
        b=fuObE1iqvkNrxIAfCykhTKP+lLIhNk7TlgYP6g2YlTwVeBhw56yxw7psoOaAhFVQpv
         h+dlkWXldmd2HBxVdWidVUox2kyNXpN+8hCV+6UpNO8llxA5PuEV2BgCah3GtoXhLpRV
         Z9nGRFbR4mAsK2/FtZmDCU75aH9wP3ujHwNCEuMBE3F+M3+9ROFZb8vmMbeJL7KkVOqb
         j2GyZwRBtNgbjAy2lcquQRGkbZ0uYbPriqBSwbj+BMvgXm4HEyKpaX1SWfmIgVww+uk3
         5Sc1rTmVjZ8seoRZBGZjUmmxYTgeI//kOpVasJ5mAQJzpqOX/dYIPEW0GhQ/Mn86xZv5
         9y0A==
X-Gm-Message-State: APjAAAV7wB8svw8hA5siEU/O01+WxEvGoqIxdQVZnGS4fVGcBZqUcRTC
        gnMkXoyELTESUSz13UTOUeLbkA==
X-Google-Smtp-Source: APXvYqyY4Bna8n1jvPeQwgAJ/9MxDYuhJQo2iEIi4PIYEzgcxhke01QNXOXDBl1F4vSSY6InN4nF6A==
X-Received: by 2002:a19:5212:: with SMTP id m18mr1904226lfb.7.1581374657718;
        Mon, 10 Feb 2020 14:44:17 -0800 (PST)
Received: from localhost (h-200-138.A463.priv.bahnhof.se. [176.10.200.138])
        by smtp.gmail.com with ESMTPSA id t29sm740504lfg.84.2020.02.10.14.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 14:44:16 -0800 (PST)
Date:   Mon, 10 Feb 2020 23:44:16 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [RFC PATCH 1/6] mmc: tmio: refactor tuning execution into SDHI
 driver
Message-ID: <20200210224416.GA2443363@oden.dyn.berto.se>
References: <20200129203709.30493-1-wsa+renesas@sang-engineering.com>
 <20200129203709.30493-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200129203709.30493-2-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

Thanks for your work.

On 2020-01-29 21:37:04 +0100, Wolfram Sang wrote:
> Move Renesas specific code for executing the tuning with a SCC into the
> SDHI driver and leave only a generic call in the TMIO driver. Simplify
> the code a little by removing init_tuning() and prepare_tuning()
> callbacks. The latter is directly folded into the new execute_tuning()
> callbacks.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  drivers/mmc/host/renesas_sdhi_core.c | 45 ++++++++++++++++++++--------
>  drivers/mmc/host/tmio_mmc.h          |  3 +-
>  drivers/mmc/host/tmio_mmc_core.c     | 33 +++-----------------
>  3 files changed, 37 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index 6a112454ca26..b3ab66f963f8 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -321,17 +321,6 @@ static unsigned int renesas_sdhi_init_tuning(struct tmio_mmc_host *host)
>  		SH_MOBILE_SDHI_SCC_DTCNTL_TAPNUM_MASK;
>  }
>  
> -static void renesas_sdhi_prepare_tuning(struct tmio_mmc_host *host,
> -					unsigned long tap)
> -{
> -	struct renesas_sdhi *priv = host_to_priv(host);
> -
> -	priv->doing_tune = true;
> -
> -	/* Set sampling clock position */
> -	sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TAPSET, tap);
> -}
> -
>  static void renesas_sdhi_hs400_complete(struct tmio_mmc_host *host)
>  {
>  	struct renesas_sdhi *priv = host_to_priv(host);
> @@ -500,6 +489,37 @@ static int renesas_sdhi_select_tuning(struct tmio_mmc_host *host)
>  	return 0;
>  }
>  
> +static int renesas_sdhi_execute_tuning(struct tmio_mmc_host *host, u32 opcode)
> +{
> +	struct renesas_sdhi *priv = host_to_priv(host);
> +	int i, ret;
> +
> +	host->tap_num = renesas_sdhi_init_tuning(host);
> +	if (!host->tap_num)
> +		return 0; /* Tuning is not supported */
> +
> +	if (host->tap_num * 2 >= sizeof(host->taps) * BITS_PER_BYTE) {
> +		dev_warn_once(&host->pdev->dev,
> +			"Too many taps, skipping tuning. Please consider updating size of taps field of tmio_mmc_host\n");
> +		return 0;
> +	}
> +
> +	priv->doing_tune = true;
> +	bitmap_zero(host->taps, host->tap_num * 2);
> +
> +	/* Issue CMD19 twice for each tap */
> +	for (i = 0; i < 2 * host->tap_num; i++) {
> +		/* Set sampling clock position */
> +		sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_TAPSET, i % host->tap_num);
> +
> +		ret = mmc_send_tuning(host->mmc, opcode, NULL);
> +		if (ret == 0)

The variable ret is only used here after the refactor so you could 
possibly drop it and just check mmc_send_tuning() == 0. With or without 
this small nit addressed,

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> +			set_bit(i, host->taps);
> +	}
> +
> +	return renesas_sdhi_select_tuning(host);
> +}
> +
>  static bool renesas_sdhi_manual_correction(struct tmio_mmc_host *host, bool use_4tap)
>  {
>  	struct renesas_sdhi *priv = host_to_priv(host);
> @@ -877,8 +897,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>  		if (!hit)
>  			dev_warn(&host->pdev->dev, "Unknown clock rate for tuning\n");
>  
> -		host->init_tuning = renesas_sdhi_init_tuning;
> -		host->prepare_tuning = renesas_sdhi_prepare_tuning;
> +		host->execute_tuning = renesas_sdhi_execute_tuning;
>  		host->select_tuning = renesas_sdhi_select_tuning;
>  		host->check_scc_error = renesas_sdhi_check_scc_error;
>  		host->prepare_hs400_tuning =
> diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
> index c5ba13fae399..bfebbe368f02 100644
> --- a/drivers/mmc/host/tmio_mmc.h
> +++ b/drivers/mmc/host/tmio_mmc.h
> @@ -176,14 +176,13 @@ struct tmio_mmc_host {
>  	int (*write16_hook)(struct tmio_mmc_host *host, int addr);
>  	void (*reset)(struct tmio_mmc_host *host);
>  	void (*hw_reset)(struct tmio_mmc_host *host);
> -	void (*prepare_tuning)(struct tmio_mmc_host *host, unsigned long tap);
>  	bool (*check_scc_error)(struct tmio_mmc_host *host);
>  
>  	/*
>  	 * Mandatory callback for tuning to occur which is optional for SDR50
>  	 * and mandatory for SDR104.
>  	 */
> -	unsigned int (*init_tuning)(struct tmio_mmc_host *host);
> +	int (*execute_tuning)(struct tmio_mmc_host *host, u32 opcode);
>  	int (*select_tuning)(struct tmio_mmc_host *host);
>  
>  	/* Tuning values: 1 for success, 0 for failure */
> diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
> index c4a1d49fbea4..593f88cafb6e 100644
> --- a/drivers/mmc/host/tmio_mmc_core.c
> +++ b/drivers/mmc/host/tmio_mmc_core.c
> @@ -718,38 +718,13 @@ static int tmio_mmc_start_data(struct tmio_mmc_host *host,
>  static int tmio_mmc_execute_tuning(struct mmc_host *mmc, u32 opcode)
>  {
>  	struct tmio_mmc_host *host = mmc_priv(mmc);
> -	int i, ret = 0;
> -
> -	if (!host->init_tuning || !host->select_tuning)
> -		/* Tuning is not supported */
> -		goto out;
> -
> -	host->tap_num = host->init_tuning(host);
> -	if (!host->tap_num)
> -		/* Tuning is not supported */
> -		goto out;
> -
> -	if (host->tap_num * 2 >= sizeof(host->taps) * BITS_PER_BYTE) {
> -		dev_warn_once(&host->pdev->dev,
> -			"Too many taps, skipping tuning. Please consider updating size of taps field of tmio_mmc_host\n");
> -		goto out;
> -	}
> -
> -	bitmap_zero(host->taps, host->tap_num * 2);
> -
> -	/* Issue CMD19 twice for each tap */
> -	for (i = 0; i < 2 * host->tap_num; i++) {
> -		if (host->prepare_tuning)
> -			host->prepare_tuning(host, i % host->tap_num);
> +	int ret;
>  
> -		ret = mmc_send_tuning(mmc, opcode, NULL);
> -		if (ret == 0)
> -			set_bit(i, host->taps);
> -	}
> +	if (!host->execute_tuning)
> +		return 0;
>  
> -	ret = host->select_tuning(host);
> +	ret = host->execute_tuning(host, opcode);
>  
> -out:
>  	if (ret < 0) {
>  		dev_warn(&host->pdev->dev, "Tuning procedure failed\n");
>  		tmio_mmc_hw_reset(mmc);
> -- 
> 2.20.1
> 

-- 
Regards,
Niklas Söderlund
