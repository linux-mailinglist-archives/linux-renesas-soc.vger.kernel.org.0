Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E45535BB64
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 Apr 2021 09:52:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237174AbhDLHxL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 12 Apr 2021 03:53:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236918AbhDLHxK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Apr 2021 03:53:10 -0400
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AA01C061574
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Apr 2021 00:52:53 -0700 (PDT)
Received: by mail-vs1-xe36.google.com with SMTP id l8so6168894vsj.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Apr 2021 00:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hHG46604vXSlChJZb1OLrV0NileKsJ9CNgyqfPD+Kp0=;
        b=fL8jni8nBGpccGv+OM78lQD7ibnD3f9bB/O6HR5XkA92yB+6h/x3ZrMsdMjfNk0A3o
         Ku4OQCPkvnhkJ06wAE810evYnWbYhr5yaBeaofcqVk24ub52ay5k5ryfXEJQecn3FcF3
         nUfAZSp17PfaGdEMABz+M4FMS1V8+SmLkLrIDz/pJn1yQA5b6uiSoM0YDKHyvtEc5Ut9
         mZ0XMWvbA3ohQRKVLDQkYvOWUcRHMnMU69w1nAAXd77M9Col5yl+odNyz1IwS6ohdQTV
         5F0rdj2wYU6F67Z3YJ3x8Q8BFRHqD5xUnckOwxQJCFW9rnJHEBiz2YjaTcaD/NufNuJ8
         Em3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hHG46604vXSlChJZb1OLrV0NileKsJ9CNgyqfPD+Kp0=;
        b=LOJ4ZgGigZo6pRoXYlUo8AD2Ga8qA+52f50tiUhigFMYp8azYKmuwAQFpfS8bDjdVc
         FOBZnsnHo8rFMLn7vipsuocdpNUzBUDkA+Dw24kd5t6UHXStD5ntT92OHYieI0D24clf
         fktq+VEQOndz4DOZmDRxmCfwkb9y/tjAmIbnL+h62T0mIgLqP07164OlpitU+LjSSQXi
         5tyZWhWSJ3ie+qv5Y+tCORPWSZXG4HSC916h26va9OVxz3jlEkzLyDC0vN5aKFJajBuW
         ahHN433Av2qW/3zgYC5h/3h+otKeRhQlPxI8rk7PIrtbii2SilJRJyupLc0uSoyOWy1G
         JEZA==
X-Gm-Message-State: AOAM531h3u0i0DIA58M77WEJkQ7F8Fsizsgh+JpLiMLhYlZxbQALPbej
        kngPCXuwI+t6V1bz4Dyip2EoNDGTE2maDzHXbl76DA==
X-Google-Smtp-Source: ABdhPJz2BJ5ZrQEKKWp9epIQZfUXJlXLmLw1XXmWWjM6eKrP0s3FUlE2HB6N8/FbLBjzwgl6hQ/RQse313Py7BcJoHM=
X-Received: by 2002:a67:6942:: with SMTP id e63mr19266513vsc.48.1618213972555;
 Mon, 12 Apr 2021 00:52:52 -0700 (PDT)
MIME-Version: 1.0
References: <20210409094606.4317-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210409094606.4317-1-wsa+renesas@sang-engineering.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 12 Apr 2021 09:52:15 +0200
Message-ID: <CAPDyKFoM7SvSPtsL_nRbHm84ALbHd206boQhsR_VR6=KVYG=HA@mail.gmail.com>
Subject: Re: [PATCH RFT v2] mmc: renesas_sdhi: enable WAIT_WHILE_BUSY
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, 9 Apr 2021 at 11:46, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Now that we got the timeout handling in the driver correct, we can use
> this capability to avoid polling via the MMC core.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>
> Change since v1:
> * moved wrongly set flags from tmio_flags to capabilities
>
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 4 ++--
>  drivers/mmc/host/renesas_sdhi_sys_dmac.c      | 8 +++++---
>  2 files changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> index ff97f15e317c..e8f4863d8f1a 100644
> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -97,7 +97,7 @@ static const struct renesas_sdhi_of_data of_rza2_compatible = {
>                           TMIO_MMC_HAVE_CBSY,
>         .tmio_ocr_mask  = MMC_VDD_32_33,
>         .capabilities   = MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
> -                         MMC_CAP_CMD23,
> +                         MMC_CAP_CMD23 | MMC_CAP_WAIT_WHILE_BUSY,
>         .bus_shift      = 2,
>         .scc_offset     = 0 - 0x1000,
>         .taps           = rcar_gen3_scc_taps,
> @@ -111,7 +111,7 @@ static const struct renesas_sdhi_of_data of_rcar_gen3_compatible = {
>         .tmio_flags     = TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL |
>                           TMIO_MMC_HAVE_CBSY | TMIO_MMC_MIN_RCAR2,
>         .capabilities   = MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
> -                         MMC_CAP_CMD23,
> +                         MMC_CAP_CMD23 | MMC_CAP_WAIT_WHILE_BUSY,
>         .capabilities2  = MMC_CAP2_NO_WRITE_PROTECT | MMC_CAP2_MERGE_CAPABLE,
>         .bus_shift      = 2,
>         .scc_offset     = 0x1000,
> diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> index c5f789675302..ffa64211f4de 100644
> --- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> @@ -33,12 +33,14 @@ static const struct renesas_sdhi_of_data of_rz_compatible = {
>         .tmio_flags     = TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_32BIT_DATA_PORT |
>                           TMIO_MMC_HAVE_CBSY,
>         .tmio_ocr_mask  = MMC_VDD_32_33,
> -       .capabilities   = MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ,
> +       .capabilities   = MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
> +                         MMC_CAP_WAIT_WHILE_BUSY,
>  };
>
>  static const struct renesas_sdhi_of_data of_rcar_gen1_compatible = {
>         .tmio_flags     = TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL,
> -       .capabilities   = MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ,
> +       .capabilities   = MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
> +                         MMC_CAP_WAIT_WHILE_BUSY,
>         .capabilities2  = MMC_CAP2_NO_WRITE_PROTECT,
>  };
>
> @@ -58,7 +60,7 @@ static const struct renesas_sdhi_of_data of_rcar_gen2_compatible = {
>         .tmio_flags     = TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL |
>                           TMIO_MMC_HAVE_CBSY | TMIO_MMC_MIN_RCAR2,
>         .capabilities   = MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
> -                         MMC_CAP_CMD23,
> +                         MMC_CAP_CMD23 | MMC_CAP_WAIT_WHILE_BUSY,
>         .capabilities2  = MMC_CAP2_NO_WRITE_PROTECT,
>         .dma_buswidth   = DMA_SLAVE_BUSWIDTH_4_BYTES,
>         .dma_rx_offset  = 0x2000,
> --
> 2.30.0
>
