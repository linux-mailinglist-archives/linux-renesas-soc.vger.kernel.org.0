Return-Path: <linux-renesas-soc+bounces-7176-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 149B292A2BB
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jul 2024 14:27:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 944441F220B9
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jul 2024 12:27:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4675A135A4A;
	Mon,  8 Jul 2024 12:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wRoEXjlh"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6933E3FB94
	for <linux-renesas-soc@vger.kernel.org>; Mon,  8 Jul 2024 12:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720441475; cv=none; b=X680SFbMIF38mAUv+KfP8+ZosZPK2Gy2UnDQvoS0DqYg1616nuWdXXukLo5gLZ5xjVYUqj+k/rjWykYWMz3sVgt6xWPs/oxBTn4PLCik1BUH/qeKvke0cNEiO+3tqQwS4pV4nhCQvrsTjLEc6Pw8WuYdmsKHDYavV/+1rn8tPY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720441475; c=relaxed/simple;
	bh=z4Bxyaz3edi58Dv+RWSps+oc8Kq4P5/yglpQA2xRq30=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FrPfZEVDSJGkq5QNH66LUPifORo+djt/VQCwj45kcOAGCW6aBXlugsc9III3Hg/n3K2mOe1cnMpDVdrgn4iw/PKXrQLSJcBEltTkibH9Ory/bCRRonuqgx2NhTII9OhirHQuRNHQXacAh83ilaJlYeHjkkSSbYObljAOlxOlPO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wRoEXjlh; arc=none smtp.client-ip=209.85.219.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e035ecb35ffso3462935276.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 08 Jul 2024 05:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720441472; x=1721046272; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=almR4RPYd5gvZMAGgdontA0x4hmK/ZK4iBBbFg6yQ2o=;
        b=wRoEXjlh/xjFYAxhq30q3k9/5vY5CupKQ+c4A+H5XWtw0VQlEXyMqauXQONMTgE9Jt
         9t2qKXU+tpU+hxqgMNCfYB4L6twSGNZ1ZiwsYU9kESN1mrKlut/SbvVvAEGJp552LLbr
         IBPF08txvoV7mLfelUpUchOR5vm2u6C5tHA0tc8PpcxMTBRATZHNL7OHp3M+2/YxljYB
         B3d3O5bh1QHxaWaI0+Kx5L2DFartxlBuAA2z7+vrNdbmuKhfu8OJewqfY/dQTP7eViJ8
         gxDojyMQuKmLIjYlwKEmQpXofCNnDSvh+2i3/HKlJ1LaLf3/fqexjA04SHfPGV9ijbJU
         lw8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720441472; x=1721046272;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=almR4RPYd5gvZMAGgdontA0x4hmK/ZK4iBBbFg6yQ2o=;
        b=gZlMr1FOn3S4ba+eRx0p7niqyCrG7fCJCZtEAjb2ZKbNy8fYn412MXw2e7hkopkdAl
         A++ggmyi3ADSK+l+vlfqJoaz23Jauk8nbK5bw5WLkyaWVu9UeSbTR0pb9l51EL3cCTZJ
         MJhB1lmxajiBV/E4b3zgNulln3yKQxqy+pS5eUKWm+9Z2vgcpbPh48B/XRGG8ASpPn6f
         xmklWck78V83uDMw61Npp6lTAMunWvMBBGCRvksg2ug4RqPpgl9wiZrK8gPcHLXpAj0c
         Z3GnnE2SIfS7AYkMQLgChtOsCIRmmLEHfDzRHrOgbAH2KIY3reLfeQa/suD7gzJRcQXg
         gWIw==
X-Gm-Message-State: AOJu0Yyd5vLN1UZz5j93ybRtQN9hZMJ3OGXmSp/sEpZrGdZGM8KvYtrv
	NwiF6SAsdcZVwB+G6MZkZH14OtKe6Q2nLb822QDkWJYPDfqh4qfZHL2t2u3lFg8mCxVGIL61JIh
	lcmQOBPKfKGFEFgC/YzwVquEHP8UAsfyrCc5MpQ==
X-Google-Smtp-Source: AGHT+IEQvDvjhBXKfQG2jiyWtN1usfStgmrPBbnvkMNvrXvleZQpVkqNiu/KrE5nUew5T3wR0xXXzM+GreViEZC2+Vs=
X-Received: by 2002:a25:9103:0:b0:df7:6c37:5bb3 with SMTP id
 3f1490d57ef6-e03c1964619mr12293581276.15.1720441472418; Mon, 08 Jul 2024
 05:24:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240626085015.32171-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240626085015.32171-2-wsa+renesas@sang-engineering.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 8 Jul 2024 14:23:56 +0200
Message-ID: <CAPDyKFqUVxjqyD09Cr0BgL2BTG_CTMoJHMk3PJSJJxRHmHx9vA@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhi: Convert from tasklet to BH workqueue
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Allen Pais <allen.lkml@gmail.com>, 
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 26 Jun 2024 at 10:50, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
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

Applied for next, thanks!

Kind regards
Uffe


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
>         dma_filter_fn filter;
>         void (*enable)(struct tmio_mmc_host *host, bool enable);
>         struct completion dma_dataend;
> -       struct tasklet_struct dma_complete;
> +       struct work_struct dma_complete;
>  };
>
>  struct renesas_sdhi {
> @@ -93,6 +94,7 @@ struct renesas_sdhi {
>         unsigned int tap_set;
>
>         struct reset_control *rstc;
> +       struct tmio_mmc_host *host;
>  };
>
>  #define host_to_priv(host) \
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index 58536626e6c5..04874791541f 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -970,6 +970,8 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>         if (IS_ERR(host))
>                 return PTR_ERR(host);
>
> +       priv->host = host;
> +
>         if (of_data) {
>                 mmc_data->flags |= of_data->tmio_flags;
>                 mmc_data->ocr_mask = of_data->tmio_ocr_mask;
> diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> index 422fa63a2e99..d4b66daeda66 100644
> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -337,7 +337,7 @@ static bool renesas_sdhi_internal_dmac_dma_irq(struct tmio_mmc_host *host)
>                 writel(status ^ dma_irqs, host->ctl + DM_CM_INFO1);
>                 set_bit(SDHI_DMA_END_FLAG_DMA, &dma_priv->end_flags);
>                 if (test_bit(SDHI_DMA_END_FLAG_ACCESS, &dma_priv->end_flags))
> -                       tasklet_schedule(&dma_priv->dma_complete);
> +                       queue_work(system_bh_wq, &dma_priv->dma_complete);
>         }
>
>         return status & dma_irqs;
> @@ -352,7 +352,7 @@ renesas_sdhi_internal_dmac_dataend_dma(struct tmio_mmc_host *host)
>         set_bit(SDHI_DMA_END_FLAG_ACCESS, &dma_priv->end_flags);
>         if (test_bit(SDHI_DMA_END_FLAG_DMA, &dma_priv->end_flags) ||
>             host->data->error)
> -               tasklet_schedule(&dma_priv->dma_complete);
> +               queue_work(system_bh_wq, &dma_priv->dma_complete);
>  }
>
>  /*
> @@ -440,9 +440,9 @@ renesas_sdhi_internal_dmac_start_dma(struct tmio_mmc_host *host,
>         renesas_sdhi_internal_dmac_enable_dma(host, false);
>  }
>
> -static void renesas_sdhi_internal_dmac_issue_tasklet_fn(unsigned long arg)
> +static void renesas_sdhi_internal_dmac_issue_work_fn(struct work_struct *work)
>  {
> -       struct tmio_mmc_host *host = (struct tmio_mmc_host *)arg;
> +       struct tmio_mmc_host *host = from_work(host, work, dma_issue);
>         struct renesas_sdhi *priv = host_to_priv(host);
>
>         tmio_mmc_enable_mmc_irqs(host, TMIO_STAT_DATAEND);
> @@ -454,7 +454,7 @@ static void renesas_sdhi_internal_dmac_issue_tasklet_fn(unsigned long arg)
>                 /* on CMD errors, simulate DMA end immediately */
>                 set_bit(SDHI_DMA_END_FLAG_DMA, &priv->dma_priv.end_flags);
>                 if (test_bit(SDHI_DMA_END_FLAG_ACCESS, &priv->dma_priv.end_flags))
> -                       tasklet_schedule(&priv->dma_priv.dma_complete);
> +                       queue_work(system_bh_wq, &priv->dma_priv.dma_complete);
>         }
>  }
>
> @@ -484,9 +484,11 @@ static bool renesas_sdhi_internal_dmac_complete(struct tmio_mmc_host *host)
>         return true;
>  }
>
> -static void renesas_sdhi_internal_dmac_complete_tasklet_fn(unsigned long arg)
> +static void renesas_sdhi_internal_dmac_complete_work_fn(struct work_struct *work)
>  {
> -       struct tmio_mmc_host *host = (struct tmio_mmc_host *)arg;
> +       struct renesas_sdhi_dma *dma_priv = from_work(dma_priv, work, dma_complete);
> +       struct renesas_sdhi *priv = container_of(dma_priv, typeof(*priv), dma_priv);
> +       struct tmio_mmc_host *host = priv->host;
>
>         spin_lock_irq(&host->lock);
>         if (!renesas_sdhi_internal_dmac_complete(host))
> @@ -544,12 +546,10 @@ renesas_sdhi_internal_dmac_request_dma(struct tmio_mmc_host *host,
>         /* Each value is set to non-zero to assume "enabling" each DMA */
>         host->chan_rx = host->chan_tx = (void *)0xdeadbeaf;
>
> -       tasklet_init(&priv->dma_priv.dma_complete,
> -                    renesas_sdhi_internal_dmac_complete_tasklet_fn,
> -                    (unsigned long)host);
> -       tasklet_init(&host->dma_issue,
> -                    renesas_sdhi_internal_dmac_issue_tasklet_fn,
> -                    (unsigned long)host);
> +       INIT_WORK(&priv->dma_priv.dma_complete,
> +                 renesas_sdhi_internal_dmac_complete_work_fn);
> +       INIT_WORK(&host->dma_issue,
> +                 renesas_sdhi_internal_dmac_issue_work_fn);
>
>         /* Add pre_req and post_req */
>         host->ops.pre_req = renesas_sdhi_internal_dmac_pre_req;
> diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> index 9cf7f9feab72..5a6f41318645 100644
> --- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> @@ -312,9 +312,9 @@ static void renesas_sdhi_sys_dmac_start_dma(struct tmio_mmc_host *host,
>         }
>  }
>
> -static void renesas_sdhi_sys_dmac_issue_tasklet_fn(unsigned long priv)
> +static void renesas_sdhi_sys_dmac_issue_work_fn(struct work_struct *work)
>  {
> -       struct tmio_mmc_host *host = (struct tmio_mmc_host *)priv;
> +       struct tmio_mmc_host *host = from_work(host, work, dma_issue);
>         struct dma_chan *chan = NULL;
>
>         spin_lock_irq(&host->lock);
> @@ -401,9 +401,8 @@ static void renesas_sdhi_sys_dmac_request_dma(struct tmio_mmc_host *host,
>                         goto ebouncebuf;
>
>                 init_completion(&priv->dma_priv.dma_dataend);
> -               tasklet_init(&host->dma_issue,
> -                            renesas_sdhi_sys_dmac_issue_tasklet_fn,
> -                            (unsigned long)host);
> +               INIT_WORK(&host->dma_issue,
> +                         renesas_sdhi_sys_dmac_issue_work_fn);
>         }
>
>         renesas_sdhi_sys_dmac_enable_dma(host, true);
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
>         bool                    dma_on;
>         struct dma_chan         *chan_rx;
>         struct dma_chan         *chan_tx;
> -       struct tasklet_struct   dma_issue;
> +       struct work_struct      dma_issue;
>         struct scatterlist      bounce_sg;
>         u8                      *bounce_buf;
>
> diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
> index 2780f0a29871..b61a6310311d 100644
> --- a/drivers/mmc/host/tmio_mmc_core.c
> +++ b/drivers/mmc/host/tmio_mmc_core.c
> @@ -608,7 +608,7 @@ static void tmio_mmc_cmd_irq(struct tmio_mmc_host *host, unsigned int stat)
>                         } else {
>                                 tmio_mmc_disable_mmc_irqs(host,
>                                                           TMIO_MASK_READOP);
> -                               tasklet_schedule(&host->dma_issue);
> +                               queue_work(system_bh_wq, &host->dma_issue);
>                         }
>                 } else {
>                         if (!host->dma_on) {
> @@ -616,7 +616,7 @@ static void tmio_mmc_cmd_irq(struct tmio_mmc_host *host, unsigned int stat)
>                         } else {
>                                 tmio_mmc_disable_mmc_irqs(host,
>                                                           TMIO_MASK_WRITEOP);
> -                               tasklet_schedule(&host->dma_issue);
> +                               queue_work(system_bh_wq, &host->dma_issue);
>                         }
>                 }
>         } else {
> --
> 2.43.0
>

