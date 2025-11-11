Return-Path: <linux-renesas-soc+bounces-24468-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D97C4F064
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 17:25:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D2D7F4E3F0C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 16:24:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F93336C584;
	Tue, 11 Nov 2025 16:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ELaVCBH0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC69036C58E
	for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Nov 2025 16:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762878297; cv=none; b=tl9JJD4V4AyD7gnxn0PFwJ7q5BPfCiO56N77pfVsPRsChN2AZg5iCFuumR+o5j08sRPzIFuumOP5hA7WgTYKWpsz6YkBqxjcGVDmoAnm0/c4tvR74ygnZqerjz8/DrdgHLwgswiwYNt5aEkgMQ4npkhvbG5Wghn85DRuK+LwEOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762878297; c=relaxed/simple;
	bh=D6r061tkwctTmLha1quZkKuh9UNyTVD9blrVtdPxe5M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k05BnL8zSyrmPJ323rfpnAcHLIwh8Bx2AbH4sy0NZLZ2eHEJveGO5UWsQrd7hsdCJx7vAnxQuc71vGERVWJPqIjtfos6SXLfkarfNN91+rl+YHsXp/KAZLLers15tSWuJJ8lNeZUgTxSqBMloyfCWGGELGSL22C8o3PH6pLoy6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ELaVCBH0; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-640d0895d7cso1490356d50.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Nov 2025 08:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762878294; x=1763483094; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OObdX9pib6NpwlrND45MftVr5ZcTJI6juiOxyVxxj4s=;
        b=ELaVCBH0QXiSDc5egHC+hfc69NACMMIgLQ864xF/YF6g/k1RuKWMh/I5l4o4bS1Nth
         8E2FPD+FrrEYqZ/pY8AE3HVlTwtjVDU0Jto4uuolQ5xoYog1J+nJVmiZ0aAmaN/W/WzP
         6MlKTLEYGAYnbUgHAkrbWXpDJ8+fovOM+2XGZhQc+sQQ2UPAQ85bsPlRu2tNaMYKiyKP
         10ruqC1FuvzJt5wiFcNDAJCmWDua0WkcixK3wJIsICUOVwpsjgs+ZXupEli6JdGTJrJA
         p94lx/rnhS4lgVv1SKZcVqpN+moGz/TdXGta1P421hSkcABHMKUrpNPOfSql7x8R3+sy
         n6ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762878294; x=1763483094;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OObdX9pib6NpwlrND45MftVr5ZcTJI6juiOxyVxxj4s=;
        b=POSpcDsPBosGI8b/uFc6DUThJiBQI2hizk3olYwoF8XeHGHVnHSTJK4JnXfGBiWjoA
         ThNfMAMf+iwtlUhDB4zIwXpUvDEKtYqEtYx6FES+VIiJACrmdbg+xynYSF+OOQz4zyQ1
         mukvxu3jI1AIPUU5OyeqxqIK/m3z4AP1R6DBNfM5nym992SeoLKHbxFDb/lDJrImJz9V
         6n8dqYuKgluHTCvTPYsfIVRUJI4ioR6oKUt3Icm5cBH0Ee+wwG14JC0O78FEDxJA54Kp
         ECh80AcMHJy3CbDK0f6o4YrpXVKh5Cabn9WjTSaxJ8UtBLj388LAOHYuuJmuWa/YINBY
         mhvQ==
X-Forwarded-Encrypted: i=1; AJvYcCVG7g4ORMiG526gj9dVvReZCB3bX4NI7mlJ+ZlkWVPKAEYbj7jsr33Erqw/IRcf/SEjQh6rLrfp/9rUYiZBA3xkdA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzblU9wyIBslK+cI8vJxalkJZM4RD4eRqCmJbspBHCgipAbSO5d
	ajfG0JLVJjGB2RXMIYUAIT9IFyO+w8hZa8Mc489ucZkTqXysiVcuzOl2SreQsDFiOXDYMapU5a0
	g+lVIBx7KFx0EQbJKSkXP8WKDLw8bxrsNwEMaGtfuQw==
X-Gm-Gg: ASbGncukK+LgoZmghQlR697mHXG/uOLrOOEK6HNJq3OLSdCn0CfG9yrxA84NzedL0dI
	4LysvmAta4tPfSHDR1FMZpHgy7PM9P8KOp3J0JkqeWxhq/kuRK9ngVPxRR9OiTp+cYQmVLZEO1I
	k/IEUEDweBfbAOwqzo/GKxnOqNCWn0T1B81DdgRmpluvZJ7eIwT0EAgkSYRyS4titsSddJK3Sne
	sV3GsT5uFfXHxX73mFYyARCtdyyqOWOgUdT2BXBzd/IZy5u9/EtQ4pXmWdqYg==
X-Google-Smtp-Source: AGHT+IHJmpd62CCALMSU8bf7zusT4BdJ9p+vVG2/WVor+YHRNNBx1h9njaTb9nUoDXRzsAjTTTODvx4t5ElIgqBFg5w=
X-Received: by 2002:a05:690e:1189:b0:63f:aa88:5f6b with SMTP id
 956f58d0204a3-640f733832fmr2668238d50.6.1762878293596; Tue, 11 Nov 2025
 08:24:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251008042526.3312597-1-claudiu.beznea.uj@bp.renesas.com> <20251008042526.3312597-4-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20251008042526.3312597-4-claudiu.beznea.uj@bp.renesas.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 11 Nov 2025 17:24:17 +0100
X-Gm-Features: AWmQ_bmTf-MnTFtNtf3XeAoBv6oLP-Y3wG9fKzMxT4w-pivAEB1XqW0hQQcxyJo
Message-ID: <CAPDyKFpTyY+OhiGsMX35fnLT5Am5-rJnnvOfArXAhXCuSQDiLg@mail.gmail.com>
Subject: Re: [PATCH 3/3] mmc: renesas_sdhi: Add suspend/resume hooks
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: wsa+renesas@sang-engineering.com, p.zabel@pengutronix.de, 
	linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Oct 2025 at 06:25, Claudiu <claudiu.beznea@tuxon.dev> wrote:
>
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> Add suspend/resume hooks which assert/deassert the reset signals, along
> with forcing runtime suspend/resume. This allows using the driver in
> scenarios where the resume is done with the help of bootloader and the
> bootloader disables the SDHI clocks, resets, IRQs before passing execution
> to Linux.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

FYI, this looks good to me.

Kind regards
Uffe

> ---
>  drivers/mmc/host/renesas_sdhi.h               |  3 ++
>  drivers/mmc/host/renesas_sdhi_core.c          | 37 +++++++++++++++++++
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c |  3 +-
>  3 files changed, 41 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
> index 084964cecf9d..afc36a407c2c 100644
> --- a/drivers/mmc/host/renesas_sdhi.h
> +++ b/drivers/mmc/host/renesas_sdhi.h
> @@ -9,6 +9,7 @@
>  #ifndef RENESAS_SDHI_H
>  #define RENESAS_SDHI_H
>
> +#include <linux/device.h>
>  #include <linux/dmaengine.h>
>  #include <linux/platform_device.h>
>  #include <linux/workqueue.h>
> @@ -107,4 +108,6 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>                        const struct renesas_sdhi_of_data *of_data,
>                        const struct renesas_sdhi_quirks *quirks);
>  void renesas_sdhi_remove(struct platform_device *pdev);
> +int renesas_sdhi_suspend(struct device *dev);
> +int renesas_sdhi_resume(struct device *dev);
>  #endif
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index c4aaf534868c..2a310a145785 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -31,6 +31,7 @@
>  #include <linux/platform_data/tmio.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/regulator/driver.h>
>  #include <linux/regulator/of_regulator.h>
> @@ -1317,5 +1318,41 @@ void renesas_sdhi_remove(struct platform_device *pdev)
>  }
>  EXPORT_SYMBOL_GPL(renesas_sdhi_remove);
>
> +int renesas_sdhi_suspend(struct device *dev)
> +{
> +       struct tmio_mmc_host *host = dev_get_drvdata(dev);
> +       struct renesas_sdhi *priv = host_to_priv(host);
> +       int ret;
> +
> +       ret = pm_runtime_force_suspend(dev);
> +       if (ret)
> +               return ret;
> +
> +       ret = reset_control_assert(priv->rstc);
> +       if (ret)
> +               pm_runtime_force_resume(dev);
> +
> +       return ret;
> +}
> +EXPORT_SYMBOL_GPL(renesas_sdhi_suspend);
> +
> +int renesas_sdhi_resume(struct device *dev)
> +{
> +       struct tmio_mmc_host *host = dev_get_drvdata(dev);
> +       struct renesas_sdhi *priv = host_to_priv(host);
> +       int ret;
> +
> +       ret = reset_control_deassert(priv->rstc);
> +       if (ret)
> +               return ret;
> +
> +       ret = pm_runtime_force_resume(dev);
> +       if (ret)
> +               reset_control_assert(priv->rstc);
> +
> +       return ret;
> +}
> +EXPORT_SYMBOL_GPL(renesas_sdhi_resume);
> +
>  MODULE_DESCRIPTION("Renesas SDHI core driver");
>  MODULE_LICENSE("GPL v2");
> diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> index 7ceb7b977a0b..9347017d47c4 100644
> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -18,7 +18,6 @@
>  #include <linux/pagemap.h>
>  #include <linux/platform_data/tmio.h>
>  #include <linux/platform_device.h>
> -#include <linux/pm_runtime.h>
>  #include <linux/scatterlist.h>
>  #include <linux/sys_soc.h>
>
> @@ -599,7 +598,7 @@ static int renesas_sdhi_internal_dmac_probe(struct platform_device *pdev)
>  }
>
>  static const struct dev_pm_ops renesas_sdhi_internal_dmac_dev_pm_ops = {
> -       SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
> +       SYSTEM_SLEEP_PM_OPS(renesas_sdhi_suspend, renesas_sdhi_resume)
>         RUNTIME_PM_OPS(tmio_mmc_host_runtime_suspend,
>                        tmio_mmc_host_runtime_resume,
>                        NULL)
> --
> 2.43.0
>

