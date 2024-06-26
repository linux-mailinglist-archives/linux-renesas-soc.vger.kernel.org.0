Return-Path: <linux-renesas-soc+bounces-6816-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E2A918512
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jun 2024 17:00:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85A171C23860
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jun 2024 15:00:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEDA01862AC;
	Wed, 26 Jun 2024 15:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NFww4XLC"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com [209.85.221.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A05D53B;
	Wed, 26 Jun 2024 15:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719414019; cv=none; b=E/aLOF62u1gDiAKLAUBOMP8qgAvhD7K3RwUPFYKqN4HqX3KZgkAQQWGeUV+R4db3S+O3NqU76oMOrKkpc5T71buOulx++942nHzBctqDUeiTNdxzYsNNmDgmxKvORByrT+/uBGGeIU6cJT8y8RokfDWZZv82lDZu7Yb+YhLgax4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719414019; c=relaxed/simple;
	bh=8gV+1ktX1hXYq6161wpMjSYvEd19KXfFB3yiE5Wrx0I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JTuVQSORDyQX0jwctd5Q0RsC+kokT3QuVBhtC/HoYer6COlpcp+lXovhlbsu/rHcRBoRqu0dE7keIKaq1zaSxTMm6rKcRjDL5MpNpoCHXa5tEcwxoEjag0oDXC0fb/z3VzB+/Hn1lkjtunhsLLMPGKfhmR5C12ATqZewdudebkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NFww4XLC; arc=none smtp.client-ip=209.85.221.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-4ef56bdc3fcso2122122e0c.2;
        Wed, 26 Jun 2024 08:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719414017; x=1720018817; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t5dWWOtGCbFsZQYKxGqk5OWYfSplj6dweBH5qDFgxbY=;
        b=NFww4XLCR0Vnlkb49bEdhYa50yoJJLt4uFlGkjVg0/sn1atVScqRR62blIGd3lHHky
         4VX0TU6jIyLXPuvKofwQiorGKzkKzTWrpvXrh5gIJlTh7J27Y7zJdrUJyVug5m/N/2Vo
         TL0OKabyenIHiAfqpZY7HCENtDmrNKZeJgMdUj+ymae2HVQvGQcaXgi7FSR9JjLdG601
         5yeYnkPFDhiBel23GpiYOSYSO2oTyRn3bFvfCAcNGURvjgsCE6TzdKrDXBrfgnxJIg87
         WKejHLuH/O3tjc2e314qYLR1zmlsOUPAMkqzHY8mqEYYeUSCpWiHjkUhyZ6b0/6XxG7u
         jZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719414017; x=1720018817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t5dWWOtGCbFsZQYKxGqk5OWYfSplj6dweBH5qDFgxbY=;
        b=E1Z/zLD/c8SJlGgxhol9xdE2q44S9wBJt8FTSbmLg4i8rRwgKA1ZBgGIKqEY38K7VZ
         Sz1kt5DH4PR+4QSOaIgzIrU9g73KHFArdUOTFlOKAE3qUHM2aI3tJCigLtmY4i0Wp16A
         Go0SNJF7e7v0/t5QI+68t5I+5XJKwCqHMvKSi6Y8tyt1tcQpax92UUArpK9IPvMuws7g
         g6/Kpv6i2DQjSKKXU0TtO1txKU7e6/JwM/GuFKbNxB4FCLiPjtJ1QEtx8Zqbn2Srv6u/
         XgF0Oo3MygVH/a5a0H4YRYlqDTW5YX4T0nci+CD9dN/iEzfE3M3EBNZsVwdgFl9zu25A
         q2AQ==
X-Forwarded-Encrypted: i=1; AJvYcCXSJ5FSzMgSsB6X+eABhCHubc/meZJzRyztEkS62xjvzTjWOMmueshY5b1gTqj+ir/O0RopCq3Y00JCaPOXxkw4G2C+sq5HpkJJHpWCt1K4MS243Ts05JHuGIfADEGjcBqGK0nZv3Xu
X-Gm-Message-State: AOJu0YxR0HLYHJ9hU/AmaLz9dA3HvMvW86JlHilnmUtp4k4+BCIPcxBy
	2eRFgF/VyKwpTorFRQ3RFFlxOEMYTRyYxBDl6yWjnIvwLAol8FFsg5PK/xbIomohAPJcAKKL1SE
	XpZRZFPDciUAF3PT05C+6a7yAfXE=
X-Google-Smtp-Source: AGHT+IFbJwp20OLUCz9efaSoloaPNl8/fS8NYTvmJm07UUdEJVAjrTjlWVcTBeq2jkM7UH0OBgQ77CZrqOSkkWbdBMQ=
X-Received: by 2002:a05:6122:2a52:b0:4ef:27db:39ca with SMTP id
 71dfb90a1353d-4ef6d690010mr10135664e0c.0.1719414016636; Wed, 26 Jun 2024
 08:00:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240626085015.32171-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240626085015.32171-2-wsa+renesas@sang-engineering.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 26 Jun 2024 15:59:49 +0100
Message-ID: <CA+V-a8vqZqyayAyNDh-f1jU8QqjAma9S9r2+Z9VKOh+AvBQz=A@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhi: Convert from tasklet to BH workqueue
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Allen Pais <allen.lkml@gmail.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 9:50=E2=80=AFAM Wolfram Sang
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
Tested on SMARC RZ/G2L and RZ/V2H EVK.

Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_s=
dhi.h
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
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/rene=
sas_sdhi_core.c
> index 58536626e6c5..04874791541f 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -970,6 +970,8 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>         if (IS_ERR(host))
>                 return PTR_ERR(host);
>
> +       priv->host =3D host;
> +
>         if (of_data) {
>                 mmc_data->flags |=3D of_data->tmio_flags;
>                 mmc_data->ocr_mask =3D of_data->tmio_ocr_mask;
> diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/=
host/renesas_sdhi_internal_dmac.c
> index 422fa63a2e99..d4b66daeda66 100644
> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -337,7 +337,7 @@ static bool renesas_sdhi_internal_dmac_dma_irq(struct=
 tmio_mmc_host *host)
>                 writel(status ^ dma_irqs, host->ctl + DM_CM_INFO1);
>                 set_bit(SDHI_DMA_END_FLAG_DMA, &dma_priv->end_flags);
>                 if (test_bit(SDHI_DMA_END_FLAG_ACCESS, &dma_priv->end_fla=
gs))
> -                       tasklet_schedule(&dma_priv->dma_complete);
> +                       queue_work(system_bh_wq, &dma_priv->dma_complete)=
;
>         }
>
>         return status & dma_irqs;
> @@ -352,7 +352,7 @@ renesas_sdhi_internal_dmac_dataend_dma(struct tmio_mm=
c_host *host)
>         set_bit(SDHI_DMA_END_FLAG_ACCESS, &dma_priv->end_flags);
>         if (test_bit(SDHI_DMA_END_FLAG_DMA, &dma_priv->end_flags) ||
>             host->data->error)
> -               tasklet_schedule(&dma_priv->dma_complete);
> +               queue_work(system_bh_wq, &dma_priv->dma_complete);
>  }
>
>  /*
> @@ -440,9 +440,9 @@ renesas_sdhi_internal_dmac_start_dma(struct tmio_mmc_=
host *host,
>         renesas_sdhi_internal_dmac_enable_dma(host, false);
>  }
>
> -static void renesas_sdhi_internal_dmac_issue_tasklet_fn(unsigned long ar=
g)
> +static void renesas_sdhi_internal_dmac_issue_work_fn(struct work_struct =
*work)
>  {
> -       struct tmio_mmc_host *host =3D (struct tmio_mmc_host *)arg;
> +       struct tmio_mmc_host *host =3D from_work(host, work, dma_issue);
>         struct renesas_sdhi *priv =3D host_to_priv(host);
>
>         tmio_mmc_enable_mmc_irqs(host, TMIO_STAT_DATAEND);
> @@ -454,7 +454,7 @@ static void renesas_sdhi_internal_dmac_issue_tasklet_=
fn(unsigned long arg)
>                 /* on CMD errors, simulate DMA end immediately */
>                 set_bit(SDHI_DMA_END_FLAG_DMA, &priv->dma_priv.end_flags)=
;
>                 if (test_bit(SDHI_DMA_END_FLAG_ACCESS, &priv->dma_priv.en=
d_flags))
> -                       tasklet_schedule(&priv->dma_priv.dma_complete);
> +                       queue_work(system_bh_wq, &priv->dma_priv.dma_comp=
lete);
>         }
>  }
>
> @@ -484,9 +484,11 @@ static bool renesas_sdhi_internal_dmac_complete(stru=
ct tmio_mmc_host *host)
>         return true;
>  }
>
> -static void renesas_sdhi_internal_dmac_complete_tasklet_fn(unsigned long=
 arg)
> +static void renesas_sdhi_internal_dmac_complete_work_fn(struct work_stru=
ct *work)
>  {
> -       struct tmio_mmc_host *host =3D (struct tmio_mmc_host *)arg;
> +       struct renesas_sdhi_dma *dma_priv =3D from_work(dma_priv, work, d=
ma_complete);
> +       struct renesas_sdhi *priv =3D container_of(dma_priv, typeof(*priv=
), dma_priv);
> +       struct tmio_mmc_host *host =3D priv->host;
>
>         spin_lock_irq(&host->lock);
>         if (!renesas_sdhi_internal_dmac_complete(host))
> @@ -544,12 +546,10 @@ renesas_sdhi_internal_dmac_request_dma(struct tmio_=
mmc_host *host,
>         /* Each value is set to non-zero to assume "enabling" each DMA */
>         host->chan_rx =3D host->chan_tx =3D (void *)0xdeadbeaf;
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
>         host->ops.pre_req =3D renesas_sdhi_internal_dmac_pre_req;
> diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/=
renesas_sdhi_sys_dmac.c
> index 9cf7f9feab72..5a6f41318645 100644
> --- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> @@ -312,9 +312,9 @@ static void renesas_sdhi_sys_dmac_start_dma(struct tm=
io_mmc_host *host,
>         }
>  }
>
> -static void renesas_sdhi_sys_dmac_issue_tasklet_fn(unsigned long priv)
> +static void renesas_sdhi_sys_dmac_issue_work_fn(struct work_struct *work=
)
>  {
> -       struct tmio_mmc_host *host =3D (struct tmio_mmc_host *)priv;
> +       struct tmio_mmc_host *host =3D from_work(host, work, dma_issue);
>         struct dma_chan *chan =3D NULL;
>
>         spin_lock_irq(&host->lock);
> @@ -401,9 +401,8 @@ static void renesas_sdhi_sys_dmac_request_dma(struct =
tmio_mmc_host *host,
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
> diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc=
_core.c
> index 2780f0a29871..b61a6310311d 100644
> --- a/drivers/mmc/host/tmio_mmc_core.c
> +++ b/drivers/mmc/host/tmio_mmc_core.c
> @@ -608,7 +608,7 @@ static void tmio_mmc_cmd_irq(struct tmio_mmc_host *ho=
st, unsigned int stat)
>                         } else {
>                                 tmio_mmc_disable_mmc_irqs(host,
>                                                           TMIO_MASK_READO=
P);
> -                               tasklet_schedule(&host->dma_issue);
> +                               queue_work(system_bh_wq, &host->dma_issue=
);
>                         }
>                 } else {
>                         if (!host->dma_on) {
> @@ -616,7 +616,7 @@ static void tmio_mmc_cmd_irq(struct tmio_mmc_host *ho=
st, unsigned int stat)
>                         } else {
>                                 tmio_mmc_disable_mmc_irqs(host,
>                                                           TMIO_MASK_WRITE=
OP);
> -                               tasklet_schedule(&host->dma_issue);
> +                               queue_work(system_bh_wq, &host->dma_issue=
);
>                         }
>                 }
>         } else {
> --
> 2.43.0
>
>

