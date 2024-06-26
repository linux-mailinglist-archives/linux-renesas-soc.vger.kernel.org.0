Return-Path: <linux-renesas-soc+bounces-6815-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 471BB9183D3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jun 2024 16:21:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 176331C21607
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jun 2024 14:21:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD5A7185091;
	Wed, 26 Jun 2024 14:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="liuL8SuY";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="FVOTb8Ch"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from fhigh5-smtp.messagingengine.com (fhigh5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1140318508E;
	Wed, 26 Jun 2024 14:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719411714; cv=none; b=lOikMTHHeZRMO9BZre8TLqpGT5PFdeZhjxiDLnSDnArtKa5j/N2cNIFb23lsYvP1LGOeJlKFkkIlPTmmPhihG7SDA3ZU9NEocWGnUoUnctAso8YcrNNDjRot7pjv4pNsUxHMQ6b7idKIIr4Ca2dfJo0HMVPkac4M1tj5hwt57y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719411714; c=relaxed/simple;
	bh=+UHISq9d9dCxudteCn3VFbXjHOe8z8uLLj+CpDvMMUA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IuGhD/BFDpVo4io2BZbGMnzW2Xi9oYR0zBssxBaOlB0/xJ69We/IhAsbpG23y2JPxXNsaOlZ96KcmZle7Uv8Y60u/T2NEImOc3RDnnN+IH3DrvovnHBAgQJw28da5qu8dZrSEe5C/AwhffmCg4jTSziOc8sbPUzWa+qOrmV5Iq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=liuL8SuY; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=FVOTb8Ch; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id BDB381140232;
	Wed, 26 Jun 2024 10:21:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 26 Jun 2024 10:21:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1719411708;
	 x=1719498108; bh=M5ThTnpuJkC5dGI62CAlp5mAcnBkqRFL99DOX0uCYHQ=; b=
	liuL8SuYdz3VtDOhbTITHcJ3iqFEVFjIDdhCA8LDxzSh6AnJ0356R2Jxml6KSjtj
	zZJia09Y52E/8yoLqVzR5Ntr3AQNCttQDMpelFkXEkzz1FBaaepFsqy2xMqeyt5B
	GHP0hudSrBlYqV6lgzqN10M5pMH7jlDds/BLdGCUuPw3CbZ8AVZRc3ADshe26ACd
	imKvrBRn9WJvxa1RkyAa2EowdHjP6J0m/prX3d9+oOYBg9zfsvn6MYjE97yR6BOY
	1tfrPVjyMPhM4D/gamJ6ADCP+PM2Rfb2wois//fLEJOhvqk36h7crc8ckUDwJbnH
	l+IqZAJ/V9lQPDaIYtYEUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1719411708; x=
	1719498108; bh=M5ThTnpuJkC5dGI62CAlp5mAcnBkqRFL99DOX0uCYHQ=; b=F
	VOTb8Chxpd2R8fp06Qb4658tldw5UzLB92qBvFEqmuxrrtqMxxa29NOKDL962XWQ
	mBTC3EBX4+CrYg3jQbErPw8QzztaxLSilvG9gnUyl4VCvZDw9ReDBGPoeGoYCZqN
	6T8Uh4BvXWxv7Ih7mqId5jvMiXYsJqi38zCh7BOp507Wf4EI9AbLSXxFpwWcwkYR
	zrXQk6O0kZCb9wS6zBIXa2az/ox5ZKKgnBKGNfJKOu3YqVSm7SqepN9Pqtv2EHvN
	3kE07713Lc9EjnwiEqc7XvfNmJ0PjRvmN5fczPAOwEVMmQqDTvwh3QKBOvl4qb/2
	04MdsW5Cq6Drhm0sS3OKw==
X-ME-Sender: <xms:_CN8ZgAypncUR3g3EuZ1gs0OoXKRrndQ3RNmEwZsAoQfpqUogS-lAg>
    <xme:_CN8ZihmpaLJ1PZI3t3rFQP9WDeyYME5_9OPZ2MKBZ6wWwYrIHoT6Kq0e6WIOvWWP
    Ey6IS02pA3r05_e1KA>
X-ME-Received: <xmr:_CN8ZjnHdK6HGDvJDwN5priyuYye7GthzNHotXaNRR6D6kUm-NbIWGj42DhXoXqJmiyCOV5M_0aXB9Z_iAs83EZBk34TF4o>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrtddvgdejhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomheppfhikhhl
    rghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvghrlhhunhgusehrrghgnh
    grthgvtghhrdhsvgeqnecuggftrfgrthhtvghrnhepveetgedtvddvhfdtkeeghfeffeeh
    teehkeekgeefjeduieduueelgedtheekkeetnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhgusehrrghg
    nhgrthgvtghhrdhsvg
X-ME-Proxy: <xmx:_CN8Zmx1JY4sriUwQEEL52C7R-1XqxRg3paLlgeA7Q7RBJsbo-eCjQ>
    <xmx:_CN8ZlTLRVG6vPfuNBdgiM0hGTIx9VK5gwNzZuq1YM9GZwHqjA_X9A>
    <xmx:_CN8ZhanuxlSFIPJPkMQOiJamc_3jGneOhsSpEVyEMvbnqLhabDjBg>
    <xmx:_CN8ZuR56RsXJqsw-YLVjvn5s56Hc00dlC8cA8IucuLMUpiW1_US9g>
    <xmx:_CN8ZkEXBAGZp9zZZsHfn3rjV3sCZk_aOx7xEMXg_y3GEXLuoriz5OEi>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 26 Jun 2024 10:21:47 -0400 (EDT)
Date: Wed, 26 Jun 2024 16:21:46 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Allen Pais <allen.lkml@gmail.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mmc: sdhi: Convert from tasklet to BH workqueue
Message-ID: <20240626142146.GK3655345@ragnatech.se>
References: <20240626085015.32171-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240626085015.32171-2-wsa+renesas@sang-engineering.com>

Hi Allen and Wolfram,

Nice work.

On 2024-06-26 10:48:21 +0200, Wolfram Sang wrote:
> From: Allen Pais <allen.lkml@gmail.com>
> 
> The only generic interface to execute asynchronously in the BH context is
> tasklet; however, it's marked deprecated and has some design flaws. To
> replace tasklets, BH workqueue support was recently added. A BH workqueue
> behaves similarly to regular workqueues except that the queued work items
> are executed in the BH context.
> 
> This patch converts the SDHI driver from tasklet to BH workqueue.
> 
> Based on the work done by Tejun Heo <tj@kernel.org>
> 
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> [wsa: fixed build faliures, corrected whitespace issues]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> 
> Tested on a Renesas Salvator X board with a R-Car M3-W SoC. Same
> performance as with tasklets. Thank you Allen for your work!
> 
> 
>  drivers/mmc/host/renesas_sdhi.h               |  4 ++-
>  drivers/mmc/host/renesas_sdhi_core.c          |  2 ++
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 26 +++++++++----------
>  drivers/mmc/host/renesas_sdhi_sys_dmac.c      |  9 +++----
>  drivers/mmc/host/tmio_mmc.h                   |  3 ++-
>  drivers/mmc/host/tmio_mmc_core.c              |  4 +--
>  6 files changed, 26 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
> index 586f94d4dbfd..f12a87442338 100644
> --- a/drivers/mmc/host/renesas_sdhi.h
> +++ b/drivers/mmc/host/renesas_sdhi.h
> @@ -11,6 +11,7 @@
>  
>  #include <linux/dmaengine.h>
>  #include <linux/platform_device.h>
> +#include <linux/workqueue.h>
>  #include "tmio_mmc.h"
>  
>  struct renesas_sdhi_scc {
> @@ -67,7 +68,7 @@ struct renesas_sdhi_dma {
>  	dma_filter_fn filter;
>  	void (*enable)(struct tmio_mmc_host *host, bool enable);
>  	struct completion dma_dataend;
> -	struct tasklet_struct dma_complete;
> +	struct work_struct dma_complete;
>  };
>  
>  struct renesas_sdhi {
> @@ -93,6 +94,7 @@ struct renesas_sdhi {
>  	unsigned int tap_set;
>  
>  	struct reset_control *rstc;
> +	struct tmio_mmc_host *host;
>  };
>  
>  #define host_to_priv(host) \
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index 58536626e6c5..04874791541f 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -970,6 +970,8 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>  	if (IS_ERR(host))
>  		return PTR_ERR(host);
>  
> +	priv->host = host;
> +
>  	if (of_data) {
>  		mmc_data->flags |= of_data->tmio_flags;
>  		mmc_data->ocr_mask = of_data->tmio_ocr_mask;
> diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> index 422fa63a2e99..d4b66daeda66 100644
> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -337,7 +337,7 @@ static bool renesas_sdhi_internal_dmac_dma_irq(struct tmio_mmc_host *host)
>  		writel(status ^ dma_irqs, host->ctl + DM_CM_INFO1);
>  		set_bit(SDHI_DMA_END_FLAG_DMA, &dma_priv->end_flags);
>  		if (test_bit(SDHI_DMA_END_FLAG_ACCESS, &dma_priv->end_flags))
> -			tasklet_schedule(&dma_priv->dma_complete);
> +			queue_work(system_bh_wq, &dma_priv->dma_complete);
>  	}
>  
>  	return status & dma_irqs;
> @@ -352,7 +352,7 @@ renesas_sdhi_internal_dmac_dataend_dma(struct tmio_mmc_host *host)
>  	set_bit(SDHI_DMA_END_FLAG_ACCESS, &dma_priv->end_flags);
>  	if (test_bit(SDHI_DMA_END_FLAG_DMA, &dma_priv->end_flags) ||
>  	    host->data->error)
> -		tasklet_schedule(&dma_priv->dma_complete);
> +		queue_work(system_bh_wq, &dma_priv->dma_complete);
>  }
>  
>  /*
> @@ -440,9 +440,9 @@ renesas_sdhi_internal_dmac_start_dma(struct tmio_mmc_host *host,
>  	renesas_sdhi_internal_dmac_enable_dma(host, false);
>  }
>  
> -static void renesas_sdhi_internal_dmac_issue_tasklet_fn(unsigned long arg)
> +static void renesas_sdhi_internal_dmac_issue_work_fn(struct work_struct *work)
>  {
> -	struct tmio_mmc_host *host = (struct tmio_mmc_host *)arg;
> +	struct tmio_mmc_host *host = from_work(host, work, dma_issue);
>  	struct renesas_sdhi *priv = host_to_priv(host);
>  
>  	tmio_mmc_enable_mmc_irqs(host, TMIO_STAT_DATAEND);
> @@ -454,7 +454,7 @@ static void renesas_sdhi_internal_dmac_issue_tasklet_fn(unsigned long arg)
>  		/* on CMD errors, simulate DMA end immediately */
>  		set_bit(SDHI_DMA_END_FLAG_DMA, &priv->dma_priv.end_flags);
>  		if (test_bit(SDHI_DMA_END_FLAG_ACCESS, &priv->dma_priv.end_flags))
> -			tasklet_schedule(&priv->dma_priv.dma_complete);
> +			queue_work(system_bh_wq, &priv->dma_priv.dma_complete);
>  	}
>  }
>  
> @@ -484,9 +484,11 @@ static bool renesas_sdhi_internal_dmac_complete(struct tmio_mmc_host *host)
>  	return true;
>  }
>  
> -static void renesas_sdhi_internal_dmac_complete_tasklet_fn(unsigned long arg)
> +static void renesas_sdhi_internal_dmac_complete_work_fn(struct work_struct *work)
>  {
> -	struct tmio_mmc_host *host = (struct tmio_mmc_host *)arg;
> +	struct renesas_sdhi_dma *dma_priv = from_work(dma_priv, work, dma_complete);
> +	struct renesas_sdhi *priv = container_of(dma_priv, typeof(*priv), dma_priv);
> +	struct tmio_mmc_host *host = priv->host;
>  
>  	spin_lock_irq(&host->lock);
>  	if (!renesas_sdhi_internal_dmac_complete(host))
> @@ -544,12 +546,10 @@ renesas_sdhi_internal_dmac_request_dma(struct tmio_mmc_host *host,
>  	/* Each value is set to non-zero to assume "enabling" each DMA */
>  	host->chan_rx = host->chan_tx = (void *)0xdeadbeaf;
>  
> -	tasklet_init(&priv->dma_priv.dma_complete,
> -		     renesas_sdhi_internal_dmac_complete_tasklet_fn,
> -		     (unsigned long)host);
> -	tasklet_init(&host->dma_issue,
> -		     renesas_sdhi_internal_dmac_issue_tasklet_fn,
> -		     (unsigned long)host);
> +	INIT_WORK(&priv->dma_priv.dma_complete,
> +		  renesas_sdhi_internal_dmac_complete_work_fn);
> +	INIT_WORK(&host->dma_issue,
> +		  renesas_sdhi_internal_dmac_issue_work_fn);
>  
>  	/* Add pre_req and post_req */
>  	host->ops.pre_req = renesas_sdhi_internal_dmac_pre_req;
> diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> index 9cf7f9feab72..5a6f41318645 100644
> --- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> @@ -312,9 +312,9 @@ static void renesas_sdhi_sys_dmac_start_dma(struct tmio_mmc_host *host,
>  	}
>  }
>  
> -static void renesas_sdhi_sys_dmac_issue_tasklet_fn(unsigned long priv)
> +static void renesas_sdhi_sys_dmac_issue_work_fn(struct work_struct *work)
>  {
> -	struct tmio_mmc_host *host = (struct tmio_mmc_host *)priv;
> +	struct tmio_mmc_host *host = from_work(host, work, dma_issue);
>  	struct dma_chan *chan = NULL;
>  
>  	spin_lock_irq(&host->lock);
> @@ -401,9 +401,8 @@ static void renesas_sdhi_sys_dmac_request_dma(struct tmio_mmc_host *host,
>  			goto ebouncebuf;
>  
>  		init_completion(&priv->dma_priv.dma_dataend);
> -		tasklet_init(&host->dma_issue,
> -			     renesas_sdhi_sys_dmac_issue_tasklet_fn,
> -			     (unsigned long)host);
> +		INIT_WORK(&host->dma_issue,
> +			  renesas_sdhi_sys_dmac_issue_work_fn);
>  	}
>  
>  	renesas_sdhi_sys_dmac_enable_dma(host, true);
> diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
> index 2af5730c21f4..a75755f31d31 100644
> --- a/drivers/mmc/host/tmio_mmc.h
> +++ b/drivers/mmc/host/tmio_mmc.h
> @@ -21,6 +21,7 @@
>  #include <linux/scatterlist.h>
>  #include <linux/spinlock.h>
>  #include <linux/interrupt.h>
> +#include <linux/workqueue.h>
>  
>  #define CTL_SD_CMD 0x00
>  #define CTL_ARG_REG 0x04
> @@ -153,7 +154,7 @@ struct tmio_mmc_host {
>  	bool			dma_on;
>  	struct dma_chan		*chan_rx;
>  	struct dma_chan		*chan_tx;
> -	struct tasklet_struct	dma_issue;
> +	struct work_struct	dma_issue;
>  	struct scatterlist	bounce_sg;
>  	u8			*bounce_buf;
>  
> diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
> index 2780f0a29871..b61a6310311d 100644
> --- a/drivers/mmc/host/tmio_mmc_core.c
> +++ b/drivers/mmc/host/tmio_mmc_core.c
> @@ -608,7 +608,7 @@ static void tmio_mmc_cmd_irq(struct tmio_mmc_host *host, unsigned int stat)
>  			} else {
>  				tmio_mmc_disable_mmc_irqs(host,
>  							  TMIO_MASK_READOP);
> -				tasklet_schedule(&host->dma_issue);
> +				queue_work(system_bh_wq, &host->dma_issue);
>  			}
>  		} else {
>  			if (!host->dma_on) {
> @@ -616,7 +616,7 @@ static void tmio_mmc_cmd_irq(struct tmio_mmc_host *host, unsigned int stat)
>  			} else {
>  				tmio_mmc_disable_mmc_irqs(host,
>  							  TMIO_MASK_WRITEOP);
> -				tasklet_schedule(&host->dma_issue);
> +				queue_work(system_bh_wq, &host->dma_issue);
>  			}
>  		}
>  	} else {
> -- 
> 2.43.0
> 
> 

-- 
Kind Regards,
Niklas Söderlund

