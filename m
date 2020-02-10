Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFCE11585C0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Feb 2020 23:51:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727431AbgBJWvo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Feb 2020 17:51:44 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:34512 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727422AbgBJWvn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Feb 2020 17:51:43 -0500
Received: by mail-lj1-f193.google.com with SMTP id x7so9388253ljc.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Feb 2020 14:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=IEk+jkgV6Aeja8O8GLIWrkuJbSf/8GPxErrvdOMfU+I=;
        b=xewbsNn73BP3o9FGaily5t8DL218WTXW9TYaPzDBW6uCMQ0DTF+2mNuYeOJCb2JjZO
         0l4tZflpYvkOO6CnjtBqY11zoKg60/gLQBKbywyVJbxcIii6qAlHgCibIdXcFE+LhURk
         trnZYiCCAuFDZeyLWNGvpnce1PJbjDwLtbBZAEdfaz0W9S+KXVW0aEfSxBMAIENR+eek
         GvckFMxKdRKhK68SOwIMuSymH8ICdMd/4MFx/j/775kOgDul7cb1D/OTGYNjqB9BJA+l
         6FdPv9JSHrhrlxTnQ4OXa57j0Mm9GQdmsD5ebwHldZ7Bn6eWagQxBU4kKUdPVYOM6ufU
         fG9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=IEk+jkgV6Aeja8O8GLIWrkuJbSf/8GPxErrvdOMfU+I=;
        b=XFw1rJUC4xR3eKlXUSfXnLtX/wYsWTx9gqA4hwCbclwo19xsx0F4c/mgbZ6vJzmy55
         OKNOqR8ujfjENNz7PpvNVC9Q2IcNHl4IROP8kN7Avxzbjt/tHxu3vbRhKIqOhNA8K5xR
         8Tr4e7VQNMCDi3nAWTTaj99sk1z0xa08z6rA2toFREU04vgPYbDaHggChEqhX50eFsDF
         uUM9m5urnwtm5lcM2Ytjnyv63g0HseDXYkF6Md1DHyaSCZgVSStXOAuYMCAgdQg0QCln
         BIUmfu+dVvfHLMUFH7a7us0Cd5UBx3vo/u/SL+Or+olGtypdQGmroXNf8ZYnJNszC393
         rhEA==
X-Gm-Message-State: APjAAAXceJ4X8lvngT/tbdQdZj1Scnf52ot0zMGddpcpeCjFIcuC2eAD
        4RLC/gPbU3LwQ9rrFpRHINyK6DHcO4FyyA==
X-Google-Smtp-Source: APXvYqw4vZvOYlWNEVElf8izn5d+S/VL6ofvNnJDXAgC9H8npjPUdoueIxYECZw5Kj9bFiRuMUiJ/A==
X-Received: by 2002:a2e:8016:: with SMTP id j22mr2153180ljg.24.1581375102103;
        Mon, 10 Feb 2020 14:51:42 -0800 (PST)
Received: from localhost (h-200-138.A463.priv.bahnhof.se. [176.10.200.138])
        by smtp.gmail.com with ESMTPSA id a10sm745458lfr.94.2020.02.10.14.51.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2020 14:51:41 -0800 (PST)
Date:   Mon, 10 Feb 2020 23:51:41 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [RFC PATCH 3/6] mmc: tmio: give callback a generic name
Message-ID: <20200210225141.GC2443363@oden.dyn.berto.se>
References: <20200129203709.30493-1-wsa+renesas@sang-engineering.com>
 <20200129203709.30493-4-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200129203709.30493-4-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

Thanks for your work.

On 2020-01-29 21:37:06 +0100, Wolfram Sang wrote:
> check_scc_error() is too Renesas specific. Let's just call it
> check_retune() to make it also easier understandable what it does.
> Only a rename, no functional change.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/mmc/host/renesas_sdhi_core.c | 2 +-
>  drivers/mmc/host/tmio_mmc.h          | 2 +-
>  drivers/mmc/host/tmio_mmc_core.c     | 4 ++--
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index d63aeb35bd0b..24ee8ac1fe21 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -899,7 +899,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>  
>  		host->execute_tuning = renesas_sdhi_execute_tuning;
>  		host->select_tuning = renesas_sdhi_select_tuning;
> -		host->check_scc_error = renesas_sdhi_check_scc_error;
> +		host->check_retune = renesas_sdhi_check_scc_error;
>  		host->prepare_hs400_tuning =
>  			renesas_sdhi_prepare_hs400_tuning;
>  		host->hs400_downgrade = renesas_sdhi_disable_scc;
> diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
> index bfebbe368f02..bdb9973981ff 100644
> --- a/drivers/mmc/host/tmio_mmc.h
> +++ b/drivers/mmc/host/tmio_mmc.h
> @@ -176,7 +176,7 @@ struct tmio_mmc_host {
>  	int (*write16_hook)(struct tmio_mmc_host *host, int addr);
>  	void (*reset)(struct tmio_mmc_host *host);
>  	void (*hw_reset)(struct tmio_mmc_host *host);
> -	bool (*check_scc_error)(struct tmio_mmc_host *host);
> +	bool (*check_retune)(struct tmio_mmc_host *host);
>  
>  	/*
>  	 * Mandatory callback for tuning to occur which is optional for SDR50
> diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
> index 593f88cafb6e..3cacb516a66e 100644
> --- a/drivers/mmc/host/tmio_mmc_core.c
> +++ b/drivers/mmc/host/tmio_mmc_core.c
> @@ -818,8 +818,8 @@ static void tmio_mmc_finish_request(struct tmio_mmc_host *host)
>  	if (mrq->cmd->error || (mrq->data && mrq->data->error))
>  		tmio_mmc_abort_dma(host);
>  
> -	/* SCC error means retune, but executed command was still successful */
> -	if (host->check_scc_error && host->check_scc_error(host))
> +	/* Error means retune, but executed command was still successful */
> +	if (host->check_retune && host->check_retune(host))
>  		mmc_retune_needed(host->mmc);
>  
>  	/* If SET_BLOCK_COUNT, continue with main command */
> -- 
> 2.20.1
> 

-- 
Regards,
Niklas Söderlund
