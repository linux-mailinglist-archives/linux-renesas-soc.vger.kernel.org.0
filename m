Return-Path: <linux-renesas-soc+bounces-19425-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1340DAFEB78
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jul 2025 16:14:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E2DB3B7DE4
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jul 2025 14:05:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C1292E7BAB;
	Wed,  9 Jul 2025 14:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Dxef8x8d"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07BF2E7642
	for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Jul 2025 14:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752069781; cv=none; b=mMYKju5PK5G56XENZJA7TxdoUvzDfVPKas/OXrnBJHd3u7+bnx7BC3UraDBi44nnd5UMvyjAnx3w4wjbCCqlQ/svKUD3mmED0eV1oGFd2kTNQacsTWmdshv+BtSj9JRP+XQg32oOpvrtzOS+w4OBS2VNoryDeWgZOkeXXj9x664=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752069781; c=relaxed/simple;
	bh=8ab465XL8RGJp2xwiNdST7psmhAqO4d1Mew5u/WfDXQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WeGJfUQFN3czA7/CJ7AHSLp0lB7CU2CenNAr/hKitiVRodTjIJU2yfvxfp3YC/rUAo/tdyKF8CTTso6e4phSLWPrMUbO14ZC5u0j9t3+bKKjqGO85ivBimiaWJ8oGbvsD/a+9tqAjCFcZ9mf4nP6kJUbVepbj+qUXMvHGWnn2nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Dxef8x8d; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7170344c100so36491587b3.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 09 Jul 2025 07:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752069778; x=1752674578; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0jxeF6qQ15W3iRJfD8FVALOVDq0XQ6sXFz3PZD+HrmQ=;
        b=Dxef8x8dRcZgbfIFnay55lDzXM8yBse7JQM5QQTfEPYTcFdfzPV6lyikF1cJ3Ax10F
         2BAz1FCXa+ybHZh1pddz0hkK49ZQcH+cexpRV90ri+BVT+wLEvN5ZuWeLOz231uSurxo
         09jXhJTqCc7JdgtOwgUxIcCArYAqcA47sOuyG5NABz/TkqEds30Y0bh2tEWUSfdcWLbi
         evN2M86syWQR/lp15PX0Fa8jL6TDD27H/SVL/uI8rsdERSm6Q0SpyvUQjTOR5gpP5DAS
         6YHxSIh4amUz7sJK4PxtOJO9hy8o3Bac0CRdCUfdMnpG+mOz4NNvjlGUU1S+1+kO0WVb
         ahFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752069778; x=1752674578;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0jxeF6qQ15W3iRJfD8FVALOVDq0XQ6sXFz3PZD+HrmQ=;
        b=TaH3a4VzBlnd8+omD/he/LypN2JNMFM2khkTUFF4KNxqJIl31d3VghugIhbP07Wull
         QLN2sdUpdZtFSHsLm1YBHg/Id44gAdK/okT8+LQgk1YJmPHhS68xoXFgGxP3X4u/iw05
         vIyH/0NrGu0yTSwbLigunt2WQBlBq/oZgC3b/5xxvW84OKEHPhYsYL+87t2a7WH7DRpt
         iS7MBVK+RVS81IaEwcYnV0ViqLmOclpTa34s0bNuFh+Cy/6Qi3tbPtr0gGHAgshl1icr
         xE4NpTp7hd90jWnwCCC29C11fo2gENELkeVNAQjD8m6BWK+xHhaTo4XZG4Kc4MBcQPEt
         VogQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGufI3vyfqnEHNe1gOMXCFQPs0NLzoEbwXRR1T8Z3iIEQXrqLDdKCBKTlKhGuridMafauJz7HCA34NMHWP0XfVBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyO3rWIQ7TCJ9PUajtqv+I1ujjNAYfWEzyjHABxg7aK292K5woF
	EbF+iMSVHoL9pcG1zhChLR/nj5lZAWimDUdfUsgOkOg749Ie7LOJi9c94v3xMutxFyNIu4YjB/Z
	q96PgflISg7ddzi0fhaS3vwGfGqPWLG7uax+3NPBkXQ==
X-Gm-Gg: ASbGncsAyThLW916cjFoWKEIr7rfGknB/p7cfQ87LmSQ46VoAIa/yMBjt40XMdSw13M
	CS49fDAtycYQ2KdCKRlozzndY5SliP+dU/9R24rzxPKaQmgWy/e/wDOVfFsMk5sH/l5MvSEgWkt
	fOBhn3RM0DGvlfJDERPgeWwkoJWBcSc+soGnJgvmacaVHc
X-Google-Smtp-Source: AGHT+IFtWA8c7PWFxCFRls9OTwmIX50KvZ84tz29XCIMOswJWdVGY+cHCZiaI7O65CCj8j+BQ/aRqyiXkvmlO0NA56I=
X-Received: by 2002:a05:690c:9c09:b0:70e:2d17:84b5 with SMTP id
 00721157ae682-717b13bf817mr39839927b3.0.1752069776636; Wed, 09 Jul 2025
 07:02:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com> <20250704075434.3220506-1-sakari.ailus@linux.intel.com>
In-Reply-To: <20250704075434.3220506-1-sakari.ailus@linux.intel.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 9 Jul 2025 16:02:20 +0200
X-Gm-Features: Ac12FXwuMSAHr6sQzvdlqPxk0AdX5s1c2M_fF3m8uP0HMwMi2plFNm-Wc6CWOgg
Message-ID: <CAPDyKFp+aBO9XTmvBYGj4bcL9BW26LCZb9O=6nstj29zctHi6A@mail.gmail.com>
Subject: Re: [PATCH 44/80] mmc: Remove redundant pm_runtime_mark_last_busy() calls
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Aubin Constans <aubin.constans@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Russell King <linux@armlinux.org.uk>, Adrian Hunter <adrian.hunter@intel.com>, 
	Haibo Chen <haibo.chen@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Avri Altman <avri.altman@sandisk.com>, 
	Victor Shih <victor.shih@genesyslogic.com.tw>, Binbin Zhou <zhoubinbin@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
	imx@lists.linux.dev, s32@nxp.com, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Jul 2025 at 09:54, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
>
> pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
> pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
> to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
> pm_runtime_mark_last_busy().
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>

I have pulled in pm-runtime-6.17-rc1 and applied the $subject patch
for next, thanks!

Kind regards
Uffe


> ---
> The cover letter of the set can be found here
> <URL:https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ailus@linux.intel.com>.
>
> In brief, this patch depends on PM runtime patches adding marking the last
> busy timestamp in autosuspend related functions. The patches are here, on
> rc2:
>
>         git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
>                 pm-runtime-6.17-rc1
>
>  drivers/mmc/core/core.c            | 1 -
>  drivers/mmc/host/atmel-mci.c       | 2 --
>  drivers/mmc/host/mmci.c            | 1 -
>  drivers/mmc/host/omap_hsmmc.c      | 3 ---
>  drivers/mmc/host/sdhci-esdhc-imx.c | 1 -
>  drivers/mmc/host/sdhci-msm.c       | 1 -
>  drivers/mmc/host/sdhci-omap.c      | 2 --
>  drivers/mmc/host/sdhci-pxav3.c     | 2 --
>  drivers/mmc/host/sdhci-sprd.c      | 1 -
>  drivers/mmc/host/sdhci_am654.c     | 1 -
>  drivers/mmc/host/tmio_mmc_core.c   | 1 -
>  11 files changed, 16 deletions(-)
>
> diff --git a/drivers/mmc/core/core.c b/drivers/mmc/core/core.c
> index a0e2dce70434..874c6fe92855 100644
> --- a/drivers/mmc/core/core.c
> +++ b/drivers/mmc/core/core.c
> @@ -882,7 +882,6 @@ void mmc_put_card(struct mmc_card *card, struct mmc_ctx *ctx)
>         WARN_ON(ctx && host->claimer != ctx);
>
>         mmc_release_host(host);
> -       pm_runtime_mark_last_busy(&card->dev);
>         pm_runtime_put_autosuspend(&card->dev);
>  }
>  EXPORT_SYMBOL(mmc_put_card);
> diff --git a/drivers/mmc/host/atmel-mci.c b/drivers/mmc/host/atmel-mci.c
> index c885c04e938a..43f92f48590f 100644
> --- a/drivers/mmc/host/atmel-mci.c
> +++ b/drivers/mmc/host/atmel-mci.c
> @@ -541,7 +541,6 @@ static int atmci_regs_show(struct seq_file *s, void *v)
>         memcpy_fromio(buf, host->regs, ATMCI_REGS_SIZE);
>         spin_unlock_bh(&host->lock);
>
> -       pm_runtime_mark_last_busy(dev);
>         pm_runtime_put_autosuspend(dev);
>
>         seq_printf(s, "MR:\t0x%08x%s%s ",
> @@ -2567,7 +2566,6 @@ static int atmci_probe(struct platform_device *pdev)
>         dev_info(dev, "Atmel MCI controller at 0x%08lx irq %d, %u slots\n",
>                  host->mapbase, irq, nr_slots);
>
> -       pm_runtime_mark_last_busy(dev);
>         pm_runtime_put_autosuspend(dev);
>
>         return 0;
> diff --git a/drivers/mmc/host/mmci.c b/drivers/mmc/host/mmci.c
> index c70c64f8adc4..8367283647a9 100644
> --- a/drivers/mmc/host/mmci.c
> +++ b/drivers/mmc/host/mmci.c
> @@ -2082,7 +2082,6 @@ static void mmci_enable_sdio_irq(struct mmc_host *mmc, int enable)
>         spin_unlock_irqrestore(&host->lock, flags);
>
>         if (!enable) {
> -               pm_runtime_mark_last_busy(mmc_dev(mmc));
>                 pm_runtime_put_autosuspend(mmc_dev(mmc));
>         }
>  }
> diff --git a/drivers/mmc/host/omap_hsmmc.c b/drivers/mmc/host/omap_hsmmc.c
> index bf3b9f5b067c..adc0d0b6ae37 100644
> --- a/drivers/mmc/host/omap_hsmmc.c
> +++ b/drivers/mmc/host/omap_hsmmc.c
> @@ -1663,7 +1663,6 @@ static int mmc_regs_show(struct seq_file *s, void *data)
>         seq_printf(s, "CAPA:\t\t0x%08x\n",
>                         OMAP_HSMMC_READ(host->base, CAPA));
>
> -       pm_runtime_mark_last_busy(host->dev);
>         pm_runtime_put_autosuspend(host->dev);
>
>         return 0;
> @@ -1954,7 +1953,6 @@ static int omap_hsmmc_probe(struct platform_device *pdev)
>         }
>
>         omap_hsmmc_debugfs(mmc);
> -       pm_runtime_mark_last_busy(host->dev);
>         pm_runtime_put_autosuspend(host->dev);
>
>         return 0;
> @@ -2031,7 +2029,6 @@ static int omap_hsmmc_resume(struct device *dev)
>         if (!(host->mmc->pm_flags & MMC_PM_KEEP_POWER))
>                 omap_hsmmc_conf_bus_power(host);
>
> -       pm_runtime_mark_last_busy(host->dev);
>         pm_runtime_put_autosuspend(host->dev);
>         return 0;
>  }
> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
> index 64c27349d79f..a040c0896a7b 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -2108,7 +2108,6 @@ static int sdhci_esdhc_resume(struct device *dev)
>             esdhc_is_usdhc(imx_data))
>                 sdhc_esdhc_tuning_restore(host);
>
> -       pm_runtime_mark_last_busy(dev);
>         pm_runtime_put_autosuspend(dev);
>
>         return ret;
> diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
> index 732b65d4b61a..68e56251d5e8 100644
> --- a/drivers/mmc/host/sdhci-msm.c
> +++ b/drivers/mmc/host/sdhci-msm.c
> @@ -2750,7 +2750,6 @@ static int sdhci_msm_probe(struct platform_device *pdev)
>         if (ret)
>                 goto pm_runtime_disable;
>
> -       pm_runtime_mark_last_busy(&pdev->dev);
>         pm_runtime_put_autosuspend(&pdev->dev);
>
>         return 0;
> diff --git a/drivers/mmc/host/sdhci-omap.c b/drivers/mmc/host/sdhci-omap.c
> index 429d8a517fb6..cdb09605e009 100644
> --- a/drivers/mmc/host/sdhci-omap.c
> +++ b/drivers/mmc/host/sdhci-omap.c
> @@ -1370,7 +1370,6 @@ static int sdhci_omap_probe(struct platform_device *pdev)
>                 host->mmc->pm_caps |= MMC_PM_KEEP_POWER | MMC_PM_WAKE_SDIO_IRQ;
>         }
>
> -       pm_runtime_mark_last_busy(dev);
>         pm_runtime_put_autosuspend(dev);
>
>         return 0;
> @@ -1379,7 +1378,6 @@ static int sdhci_omap_probe(struct platform_device *pdev)
>         sdhci_cleanup_host(host);
>
>  err_rpm_put:
> -       pm_runtime_mark_last_busy(dev);
>         pm_runtime_put_autosuspend(dev);
>  err_rpm_disable:
>         pm_runtime_dont_use_autosuspend(dev);
> diff --git a/drivers/mmc/host/sdhci-pxav3.c b/drivers/mmc/host/sdhci-pxav3.c
> index 34abf986573f..1371960e34eb 100644
> --- a/drivers/mmc/host/sdhci-pxav3.c
> +++ b/drivers/mmc/host/sdhci-pxav3.c
> @@ -494,7 +494,6 @@ static int sdhci_pxav3_suspend(struct device *dev)
>         if (host->tuning_mode != SDHCI_TUNING_MODE_3)
>                 mmc_retune_needed(host->mmc);
>         ret = sdhci_suspend_host(host);
> -       pm_runtime_mark_last_busy(dev);
>         pm_runtime_put_autosuspend(dev);
>
>         return ret;
> @@ -507,7 +506,6 @@ static int sdhci_pxav3_resume(struct device *dev)
>
>         pm_runtime_get_sync(dev);
>         ret = sdhci_resume_host(host);
> -       pm_runtime_mark_last_busy(dev);
>         pm_runtime_put_autosuspend(dev);
>
>         return ret;
> diff --git a/drivers/mmc/host/sdhci-sprd.c b/drivers/mmc/host/sdhci-sprd.c
> index a5dec1a0e934..fe2fe52b23b2 100644
> --- a/drivers/mmc/host/sdhci-sprd.c
> +++ b/drivers/mmc/host/sdhci-sprd.c
> @@ -863,7 +863,6 @@ static int sdhci_sprd_probe(struct platform_device *pdev)
>         if (ret)
>                 goto err_cleanup_host;
>
> -       pm_runtime_mark_last_busy(&pdev->dev);
>         pm_runtime_put_autosuspend(&pdev->dev);
>
>         return 0;
> diff --git a/drivers/mmc/host/sdhci_am654.c b/drivers/mmc/host/sdhci_am654.c
> index ea14d56558c4..e2c4a0049d61 100644
> --- a/drivers/mmc/host/sdhci_am654.c
> +++ b/drivers/mmc/host/sdhci_am654.c
> @@ -986,7 +986,6 @@ static int sdhci_am654_probe(struct platform_device *pdev)
>         /* Setting up autosuspend */
>         pm_runtime_set_autosuspend_delay(dev, SDHCI_AM654_AUTOSUSPEND_DELAY);
>         pm_runtime_use_autosuspend(dev);
> -       pm_runtime_mark_last_busy(dev);
>         pm_runtime_put_autosuspend(dev);
>         return 0;
>
> diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
> index 2cec463b5e00..21c2f9095bac 100644
> --- a/drivers/mmc/host/tmio_mmc_core.c
> +++ b/drivers/mmc/host/tmio_mmc_core.c
> @@ -160,7 +160,6 @@ static void tmio_mmc_enable_sdio_irq(struct mmc_host *mmc, int enable)
>                 sd_ctrl_write16(host, CTL_SDIO_IRQ_MASK, host->sdio_irq_mask);
>
>                 host->sdio_irq_enabled = false;
> -               pm_runtime_mark_last_busy(mmc_dev(mmc));
>                 pm_runtime_put_autosuspend(mmc_dev(mmc));
>         }
>  }
> --
> 2.39.5
>

