Return-Path: <linux-renesas-soc+bounces-24467-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66FF4C4F055
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 17:24:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B0553AE1AA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Nov 2025 16:23:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8FE236CDE3;
	Tue, 11 Nov 2025 16:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cC07iDMz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D8736C584
	for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Nov 2025 16:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762878193; cv=none; b=MtX1IAQwn9Tfn78nqzOwvP/L6GgvWpCBIO3dh/5hyzdcUuACfQSvHceJD4fvfSCvMCgCV7bBNBB1i/8mPihgVHYNo+rgw3mPRWWFVTjhql30yBc5vrPY5kb8RtxTHbSw3a5bYFPPFzTL37nGIBHBrAMbu+VIAfonrqw8ItreaLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762878193; c=relaxed/simple;
	bh=XLpA0EYpR5zzkaJHl/CV48qTdO1WTdqSNFnTs6ePeII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e5uPL7zVJHSJL8sjMIGPI5ExclB10w1z/jvoAYYMNUMLG/EIgaFRhH9Rnz+XFxJ3DoFD2a8KDhNtFnRA9lLYAAxBRZjlW8LPOdJQ6ShAR5ne1Ehcf5Q0xZepqoOlAOxFiIM6RZ/PJdN/qhWZZjAaycv295/AHFTk50WoRi9bJmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cC07iDMz; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-78802ac22abso13904797b3.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Nov 2025 08:23:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762878191; x=1763482991; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aKHoe4ZUftCieGZc+VBEpPhpv2xgJIE+8PlicL/y9wM=;
        b=cC07iDMzDDWQfQiinfTnNlNdkZgVgmFUMTk/7L8Vs0Q5ChHorZRuYgayt6JPlKX4F8
         G8OwrTAkkeG+SYNMBZUORV1v01u2Yir2h+Um0q8ss/vr/fjlQx9iDZjoXMVhNoL0eNWo
         VHijvgnef61AllVJmCBaACmiwXz7538ZMuHAgCuqWXEhEVQyFAdoljqAzlELYDdjs2gN
         x5HuPF4BG7GARxwvfhGoU0qlAXRvbAhlY9IrQBjbFHVZLXwQbPdSe4sxUH0I+SfHnz4T
         /OwlitxwecDsSA8XHC/I/rouREtCl+XVqtoDqrZU2lPX5LuKVPYSEyc5qrdmpdfb2K6w
         287Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762878191; x=1763482991;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aKHoe4ZUftCieGZc+VBEpPhpv2xgJIE+8PlicL/y9wM=;
        b=BsKnMuSgHHroZvImDru7nlX87z0Txrf1BxUMpKHYcvbOJNcdPQfWlWF+x6baoLbw2W
         OiW8/rinScS/n5CyAzfx74lvVewp0h9jVuQ1/XI1U5a+yZNeXw3dS//DMuDf93/dgTEP
         f46FEjxeCtgaGo+0UeqJZ8hfZJyChZxtI3thSbUm9iTz8eR65grgk70ildR2nNaKZVIl
         MA0BHvFLIbqUTDI9RG5uO1F5vPCe0UifGCwDowq+3HfNxXalz0gRgKPiShWwRrs+DxLA
         vMs0Oo9OZhPkBFe3/WiUWkREmaVjvIQng2K/dkYNFpUtGHBE+vi5bZmPsdDmPKdloPlE
         ARig==
X-Forwarded-Encrypted: i=1; AJvYcCWjzzh9XHklYJugJ1Txjh7KDaiByiWAX84CLJo55tpY0hN3R9FO6aB0qVr9yWMREmNW3ej04owLS4m+9O7K4Q6L5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz81IuZXxfk321ObBmOsjoSnvqC/jB8kb7GFVu6p9Ha4odlLTh/
	7SJL7m+JPs1jdbz/v6SOz/FTEp3OSeAC4MXmyjs+w2E8/TGCx1zcgJ/sbOAzkcyYFgjn1XTZd5b
	gaMgHDHrf2HP2+F/nj+/ZehR5gt7Y7XDdDM27Tn2/9Q==
X-Gm-Gg: ASbGnct+uW4lh9we1vLPtW2pKbrFNx0cx0AcISlKwBGMqGKjwJvnlsjAVPxWq8jXYXJ
	5AIpPxG+G/Sr2JcV6xoJZwbrQGtTOC3YP9X8GfZOWcCATKcJHPotwUwQ8nGfIlO858peainXal9
	6i717U3Pf/B4uInW9SCe15UH5p5DBWNdKgxzslMzo7J7ScAJindfyxOWY80fnnbHMo3RFGXEWCc
	nQkH2I4r5+A8DCU7Mhuvjo9wupZR7aFmMOPCQOdzUm4QzF39MJ3h2r9M3A9yikOH9M3+ozo
X-Google-Smtp-Source: AGHT+IHoQJuVlfR9zMeIjwFbdHyeRQTWRolkki2DvpnTUSRyJF5SQPQubSTTdGS99udcI0gt7LdJrt7VWnXSm3e14Rk=
X-Received: by 2002:a05:690c:360e:b0:787:e3c1:99 with SMTP id
 00721157ae682-787e3c1484bmr93601677b3.57.1762878190703; Tue, 11 Nov 2025
 08:23:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251008042526.3312597-1-claudiu.beznea.uj@bp.renesas.com> <20251008042526.3312597-3-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20251008042526.3312597-3-claudiu.beznea.uj@bp.renesas.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 11 Nov 2025 17:22:34 +0100
X-Gm-Features: AWmQ_bkUAFq5YOr6A8R1RiBxjuQKLYXMePQi6OIcghsKKf0GW8rB8B1X1sNOzgk
Message-ID: <CAPDyKFpFYeD9tLA+w4NARKq-Wj-7O2Caa3y8i2Z9NX6J4XLahA@mail.gmail.com>
Subject: Re: [PATCH 2/3] mmc: renesas_sdhi: Switch to SYSTEM_SLEEP_PM_OPS()/RUNTIME_PM_OPS()
 and pm_ptr()
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
> SET_SYSTEM_SLEEP_PM_OPS() and SET_RUNTIME_PM_OPS() are deprecated now
> and require __maybe_unused protection against unused function warnings.

I don't see them marked deprecated, is that really the case?

> The usage of pm_ptr() and SYSTEM_SLEEP_PM_OPS()/RUNTIME_PM_OPS() allows
> the compiler to see the functions, thus suppressing the warning. Thus
> drop the __maybe_unused markings.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Other than the above, this looks fine to me!

Kind regards
Uffe

> ---
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 11 +++++------
>  drivers/mmc/host/tmio_mmc.h                   |  2 --
>  drivers/mmc/host/tmio_mmc_core.c              |  2 --
>  3 files changed, 5 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> index 9e3ed0bcddd6..7ceb7b977a0b 100644
> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -599,18 +599,17 @@ static int renesas_sdhi_internal_dmac_probe(struct platform_device *pdev)
>  }
>
>  static const struct dev_pm_ops renesas_sdhi_internal_dmac_dev_pm_ops = {
> -       SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> -                               pm_runtime_force_resume)
> -       SET_RUNTIME_PM_OPS(tmio_mmc_host_runtime_suspend,
> -                          tmio_mmc_host_runtime_resume,
> -                          NULL)
> +       SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
> +       RUNTIME_PM_OPS(tmio_mmc_host_runtime_suspend,
> +                      tmio_mmc_host_runtime_resume,
> +                      NULL)
>  };
>
>  static struct platform_driver renesas_internal_dmac_sdhi_driver = {
>         .driver         = {
>                 .name   = "renesas_sdhi_internal_dmac",
>                 .probe_type = PROBE_PREFER_ASYNCHRONOUS,
> -               .pm     = &renesas_sdhi_internal_dmac_dev_pm_ops,
> +               .pm     = pm_ptr(&renesas_sdhi_internal_dmac_dev_pm_ops),
>                 .of_match_table = renesas_sdhi_internal_dmac_of_match,
>         },
>         .probe          = renesas_sdhi_internal_dmac_probe,
> diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
> index c8cdb1c0722e..b9de03325c58 100644
> --- a/drivers/mmc/host/tmio_mmc.h
> +++ b/drivers/mmc/host/tmio_mmc.h
> @@ -209,10 +209,8 @@ void tmio_mmc_enable_mmc_irqs(struct tmio_mmc_host *host, u32 i);
>  void tmio_mmc_disable_mmc_irqs(struct tmio_mmc_host *host, u32 i);
>  irqreturn_t tmio_mmc_irq(int irq, void *devid);
>
> -#ifdef CONFIG_PM
>  int tmio_mmc_host_runtime_suspend(struct device *dev);
>  int tmio_mmc_host_runtime_resume(struct device *dev);
> -#endif
>
>  static inline u16 sd_ctrl_read16(struct tmio_mmc_host *host, int addr)
>  {
> diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
> index 775e0d9353d5..8be642f737c7 100644
> --- a/drivers/mmc/host/tmio_mmc_core.c
> +++ b/drivers/mmc/host/tmio_mmc_core.c
> @@ -1286,7 +1286,6 @@ void tmio_mmc_host_remove(struct tmio_mmc_host *host)
>  }
>  EXPORT_SYMBOL_GPL(tmio_mmc_host_remove);
>
> -#ifdef CONFIG_PM
>  static int tmio_mmc_clk_enable(struct tmio_mmc_host *host)
>  {
>         if (!host->clk_enable)
> @@ -1331,7 +1330,6 @@ int tmio_mmc_host_runtime_resume(struct device *dev)
>         return 0;
>  }
>  EXPORT_SYMBOL_GPL(tmio_mmc_host_runtime_resume);
> -#endif
>
>  MODULE_DESCRIPTION("TMIO MMC core driver");
>  MODULE_LICENSE("GPL v2");
> --
> 2.43.0
>

