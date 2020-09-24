Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D3D1B27718F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Sep 2020 14:50:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727944AbgIXMuh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Sep 2020 08:50:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727943AbgIXMuZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Sep 2020 08:50:25 -0400
Received: from mail-vk1-xa43.google.com (mail-vk1-xa43.google.com [IPv6:2607:f8b0:4864:20::a43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E440C0613D3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Sep 2020 05:50:25 -0700 (PDT)
Received: by mail-vk1-xa43.google.com with SMTP id a16so865817vke.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Sep 2020 05:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A50fDOOKNyv2Ev8Swfae1dGr9M1g0YMVi9mWla00hDU=;
        b=mH/Z53QrMi2Xxfu7rCBEG6DOGtq2gtzu9Xn0Hx+4OL9nQx6uwaYCgiHXjfYK90Ykg/
         J8YUH4CIMYujQkPNcAXlbaF/6+naibYcfpzjyElE48ZF6n+gxIXDZFi1wAyVKqWUOSKU
         4unnizW7zqZtWZYTZ4GQFi9ruDFR5SZ5el40dikPUlB3Vitq2o0Pc5E34itX8N0ozD12
         lCw+VSVaZEJ3bPzXofaU+a031VPfa6wE6OF2Id7qtCU0WuMmKO1QqkO/3lGg1Xhm+v3k
         vZip/y1gRqCA1T03Kz8DvJfIC+CbznA5s31kf9raarwVM4MPPRLGJzu7N8rnPDDJMOLN
         aJ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A50fDOOKNyv2Ev8Swfae1dGr9M1g0YMVi9mWla00hDU=;
        b=iPNQWb5Ng27+JgnytLn40iF2SUGzTYoWmqWcRTVjntUUALRNUm16KfvB6Ac0uq7wgE
         uz1YMW1qBXqGxk5Ka8eFYbLBMRns9z+/zrI+s5nA/mbR2ytRkhLnR1DF/uHtw9Je6bQ4
         HbOv9qHW1ivcrIzztCxQJXGTBNWdH9yUUDfQVW0CGpcvatcqtdX2DtuksJa1x9/xdG/k
         J0SKapd3irPs1BWRoMX66OQE7AHfd2zKX2ebe/xvpjH/XnEJpi7dkjxJZoRS006cxuVA
         /2mMbfFhabjUP7979aA9BoeC/G92aaUwd1WeTqh+9pfzAN3Rx3SzoHFg9VDz+AZBIUvC
         9jpQ==
X-Gm-Message-State: AOAM533lrTxWIXUCd/3zT/t3N41WzTHW4lOu2VrUX+MVl/X+PNS6CS1V
        3fmvOU+zJaAsCW8hJSocAolBZVRSkpeNNCyZ/+XngUiUrCmiIA==
X-Google-Smtp-Source: ABdhPJzBZQnxDcw00NSOe5PSltkjWOUHMAqt22WMd4hPdzgfhIVbjk6GXULijUmodg8Oj8sULI8TLw7M3coSTsqSS7E=
X-Received: by 2002:a1f:6ec4:: with SMTP id j187mr3431849vkc.15.1600951824397;
 Thu, 24 Sep 2020 05:50:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200922172253.4458-1-wsa@kernel.org>
In-Reply-To: <20200922172253.4458-1-wsa@kernel.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 24 Sep 2020 14:49:45 +0200
Message-ID: <CAPDyKFpdvHt06awMy2FQzd2Lk81ZwsmW1AXVTdf2F7BX=iAfMA@mail.gmail.com>
Subject: Re: [PATCH RFT] mmc: renesas_sdhi: drop local flag for tuning
To:     Wolfram Sang <wsa@kernel.org>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 22 Sep 2020 at 19:23, Wolfram Sang <wsa@kernel.org> wrote:
>
> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> The MMC core has now a generic check if some tuning is in progress. Its
> protected area is a bit larger than the custom one in this driver but we
> concluded that this works equally well for the intended case. So, drop
> the local flag and switch to the generic one.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>
> I had this patch applied while working on other SDHI topics and
> experienced no regressions. But I'd like to give Shimoda-san and the BSP
> team some time for testing. We agreed on the approach already.
>
>  drivers/mmc/host/renesas_sdhi.h      | 1 -
>  drivers/mmc/host/renesas_sdhi_core.c | 4 +---
>  2 files changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
> index 24958de274c1..cb962c7883dc 100644
> --- a/drivers/mmc/host/renesas_sdhi.h
> +++ b/drivers/mmc/host/renesas_sdhi.h
> @@ -63,7 +63,6 @@ struct renesas_sdhi {
>         u32 scc_tappos_hs400;
>         const u8 *adjust_hs400_calib_table;
>         bool needs_adjust_hs400;
> -       bool doing_tune;
>
>         /* Tuning values: 1 for success, 0 for failure */
>         DECLARE_BITMAP(taps, BITS_PER_LONG);
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index d621a4af8e87..20e5eb63caf8 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -581,7 +581,6 @@ static int renesas_sdhi_select_tuning(struct tmio_mmc_host *host)
>         unsigned int taps_size = priv->tap_num * 2, min_tap_row;
>         unsigned long *bitmap;
>
> -       priv->doing_tune = false;
>         sd_scc_write32(host, priv, SH_MOBILE_SDHI_SCC_RVSREQ, 0);
>
>         /*
> @@ -656,7 +655,6 @@ static int renesas_sdhi_execute_tuning(struct mmc_host *mmc, u32 opcode)
>                 return -EINVAL;
>         }
>
> -       priv->doing_tune = true;
>         bitmap_zero(priv->taps, priv->tap_num * 2);
>         bitmap_zero(priv->smpcmp, priv->tap_num * 2);
>
> @@ -765,7 +763,7 @@ static bool renesas_sdhi_check_scc_error(struct tmio_mmc_host *host)
>             !(host->mmc->ios.timing == MMC_TIMING_MMC_HS400 && !use_4tap))
>                 return false;
>
> -       if (mmc_doing_retune(host->mmc) || priv->doing_tune)
> +       if (mmc_doing_tune(host->mmc))
>                 return false;
>
>         if (sd_scc_read32(host, priv, SH_MOBILE_SDHI_SCC_RVSCNTL) &
> --
> 2.20.1
>
