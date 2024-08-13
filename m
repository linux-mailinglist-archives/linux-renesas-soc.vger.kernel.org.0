Return-Path: <linux-renesas-soc+bounces-7819-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD3D9506F2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Aug 2024 15:57:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30C5F1C2293A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Aug 2024 13:57:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E610919CD19;
	Tue, 13 Aug 2024 13:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OT/S8A62"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F8E187341
	for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Aug 2024 13:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723557423; cv=none; b=rKUtx0oWgz5ew+LM5zNbI4CxebBMYHqkb6EGPMlN7UrOdus6I/QJSMXEfWL09AsmaaVa8dlj+AvB/FONffbClfnXmx7vx0SPRfdoP8xRhicvQKGcjHR8/iqk3Eg4x3YwqF+tqLFuQJa22of4QJbbueOvhi/PsuFAsVnIS5P/cCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723557423; c=relaxed/simple;
	bh=gA+QStwRj/LVatDuKESJdCv++0LFZ88d5P6I6zHRsOE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AiXMm5m4M5vVo56Q4uVk89yAaGE0On8TBPX9P8UrVK7ixoXzXlv374MYAq3nC+0M39VYZSF5FnzqYfhqmxa2AJqfLAGRAM3vBWVh+l7FJN1WfJCGqgwrKN7JCAVDWsikCs1YSRtUJbOAWq76MuV3q26zyzgNnDPfjItX+Vw+EF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OT/S8A62; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e0ea24477f0so4851096276.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 13 Aug 2024 06:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723557421; x=1724162221; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zLSLN/JNWAOSXtxRH8miLcEkaLp2UzeNqUb5zeUUf0g=;
        b=OT/S8A62y9zYsr69otgjbk24Ht0LA8z/uk936ABsW5HIJGf11g8HYOsKjDzrhVjlU2
         DbWhIJY54Mxt6D0OlbPHLXz2AEmrGHqRHj0Z30znT7onYTyc2Dq/u1qB4XOq72/a29bf
         Y8gpqNbxILEragu2S0mHpNcu22G2W9jyqDJphO9UQDc5P/puXeWafhhLE0NV7PysPpwS
         8EVFo6k9dnA0Lss+4sJ4OYwFliWT54VxY0lDKhnedXOe/JMt0cxu8rpvK0JQsIx43Ar6
         vhfQYX8skbcaK+LPVmBvJB9ztil0jVeO5yx7Kcusqx2ScOyp7jzxxtZAPuCW/PJMaaXx
         Y/Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723557421; x=1724162221;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zLSLN/JNWAOSXtxRH8miLcEkaLp2UzeNqUb5zeUUf0g=;
        b=JofKLotOkTg0nNprhC1Z0SesmdUM/Z1lI7SkbBxNzIzysapdspijAse0Xw1s+HSoYY
         V00OAejnBqOgKfgyqJ8E/z8zOfS3BrGqGrYtcBlO2AcTjxtv4cN9A5Lj67pjPtmKQlz4
         WPe08knNgLwlJfe9Sz7aEthoUJt94JZwORusC0FPFTDiLncs2bSLFzr2Y1xaWdsvLJAM
         S6yIGt7ruWepxj/IxIGAhjQDUvUwBFgNHR59zr54Sp90sR+iKwhO4WP5DbvjIotXoQhY
         cfFKHdbEiBDUEqfqS8GPWLwFVPl1HvGv6cXVxcEL6YT0pgbPHKQ9sa1U7WMiXJfFd2VP
         nHgA==
X-Forwarded-Encrypted: i=1; AJvYcCXt8DibwfWcBuQXgwm/D/znckb+RsaPWQ9FPDnDpGbiy/1GHD0z2kO+8IskCYxDKmI7CsSzlBPhCrmeScZCWJo/XN47MasrxxxRbXcnYNDh1Ms=
X-Gm-Message-State: AOJu0YzdrTk3LVdojvMtybf61tYbx6Vb6atddM09VldKFk2UCpIXBOPR
	5NbIsugIidmooOLftH13lopsP2ku3VMf3QbbIY/GjxBTvG6eMD3IBov9k2LVNeyXlDMg0D0mblH
	1HAeN4o8zdqqdXLX9vuPqb+KaoFgEpJrID9riRw==
X-Google-Smtp-Source: AGHT+IGSRXHkL7PvnTNEwvOCFZfzIGVjr9cYpYKwW+c0HMHoaWdUmQ9IzZF7tEGG+VM8etItOggTy4TAzrcmiyP930o=
X-Received: by 2002:a05:6902:2805:b0:e0b:f45f:65dd with SMTP id
 3f1490d57ef6-e113d2e303emr3310212276.57.1723557421255; Tue, 13 Aug 2024
 06:57:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240619120920.2703605-1-claudiu.beznea.uj@bp.renesas.com> <20240619120920.2703605-4-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20240619120920.2703605-4-claudiu.beznea.uj@bp.renesas.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 13 Aug 2024 15:56:24 +0200
Message-ID: <CAPDyKFq1EX1Spedhkek=50EdwmHY5erNTmvegVGbxfLzTqYjEA@mail.gmail.com>
Subject: Re: [PATCH RFC 3/3] watchdog: rzg2l_wdt: Power on the PM domain in rzg2l_wdt_restart()
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: wim@linux-watchdog.org, linux@roeck-us.net, rafael@kernel.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, geert+renesas@glider.be, 
	linux-renesas-soc@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 19 Jun 2024 at 14:09, Claudiu <claudiu.beznea@tuxon.dev> wrote:
>
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The rzg2l_wdt_restart() is called in atomic context. Calling
> pm_runtime_{get_sync, resume_and_get}() or any other runtime PM resume
> APIs is not an option as it may lead to issues as described in commit
> e4cf89596c1f ("watchdog: rzg2l_wdt: Fix 'BUG: Invalid wait context'")
> that removed the pm_runtime_get_sync() and enabled directly the clocks.
>
> Starting with RZ/G3S the watchdog could be part of its own
> software-controlled power domain. In case the watchdog is not used the
> power domain is off and accessing watchdog registers leads to aborts.
>
> To solve this, the patch powers on the power domain using
> dev_pm_genpd_resume_restart_dev() API after enabling its clock. This is
> not sleeping or taking any other locks as the watchdog power domain is not
> registered with GENPD_FLAG_IRQ_SAFE flags.

Would it be a problem to register the corresponding genpd using the
GENPD_FLAG_IRQ_SAFE?

Assuming it wouldn't, it looks like we should be able to make the
watchdog device irq-safe too, by calling pm_runtime_irq_safe() during
->probe().

In that case it should be okay to call pm_runtime_get_sync() in atomic
context, right?

Kind regards
Uffe

>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>  drivers/watchdog/rzg2l_wdt.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/drivers/watchdog/rzg2l_wdt.c b/drivers/watchdog/rzg2l_wdt.c
> index 6e3d7512f38c..bbdbbaa7b82b 100644
> --- a/drivers/watchdog/rzg2l_wdt.c
> +++ b/drivers/watchdog/rzg2l_wdt.c
> @@ -12,6 +12,7 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/reset.h>
>  #include <linux/units.h>
> @@ -169,6 +170,17 @@ static int rzg2l_wdt_restart(struct watchdog_device *wdev,
>         clk_enable(priv->pclk);
>         clk_enable(priv->osc_clk);
>
> +       /*
> +        * The device may be part of a power domain that is currently
> +        * powered off. We need to power it on before accessing registers.
> +        * We don't undo the dev_pm_genpd_resume_restart_dev() as the device
> +        * need to be on for the reboot to happen. Also, as we are in atomic
> +        * context here, there is no need to increment PM runtime usage counter
> +        * (to make sure pm_runtime_active() doesn't return wrong code).
> +        */
> +       if (!pm_runtime_active(wdev->parent))
> +               dev_pm_genpd_resume_restart_dev(wdev->parent);
> +
>         if (priv->devtype == WDT_RZG2L) {
>                 ret = reset_control_deassert(priv->rstc);
>                 if (ret)
> --
> 2.39.2
>

