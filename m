Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDA813608BB
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Apr 2021 14:03:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232681AbhDOMDp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Apr 2021 08:03:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232648AbhDOMDm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Apr 2021 08:03:42 -0400
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B823BC061574
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Apr 2021 05:03:18 -0700 (PDT)
Received: by mail-vs1-xe35.google.com with SMTP id l8so12031911vsj.13
        for <linux-renesas-soc@vger.kernel.org>; Thu, 15 Apr 2021 05:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a7FyRm6KTh0gv7RS+KVljQwTi9U7GSgFTjsqKhiSYho=;
        b=u4BXlDTSkhAFUxP6lywlt+Uph749BIKvbHzo77NvGE+HtpqEVITziZuryPkXUP7e9r
         i+vJKSWlIvpOkxGq0UqYnd918+P40lzahM3ar2jAADB3TxoGrcJCqCh+ailKsrAWBDAj
         ZToQJ6Z/8U1Gc2cjgMpZ4j0K/GmbeSo8m0e3oQIqbtbIIZaYUKILNniMUadUHBCgxZIo
         fFslpguYYMxci6UDmUkz1U+9nsFS7e+ml2puaj1C0ghZTYeupN4McX4mAVjUVogV8TCL
         LSxQJdpKu0h2Uti+LvsRpK7rl1oqylMCiiyDeasP/TSk8up630cHGf3tq0c3EZkbkasg
         SkfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a7FyRm6KTh0gv7RS+KVljQwTi9U7GSgFTjsqKhiSYho=;
        b=ro/Dasgi+9FI8qMu84WyFnbowAN0HVjhOnGG5wYhX4COOIVsUe4YLa7plaHMFRp7o0
         IUmIO2Arz0Uyd75Bvv/C/MWVWAHP+rHwxAqIMsStSXLaukRUnaLKOHbRppB5UG9tMdqO
         /7witMOg2V98EdLFYj95N/3KGiaCvoGQS+B0qxV6TzMLsB1UUHkg8HJikrGiVdzuTOJo
         p1Z7+qMm0ep+Yh1lTwql48blnajkitu8866yaJw/bWQZ9LORN93q5luapMDMN7HLO9aj
         uD+LAkGVy57pTMAYnZaJpL1hCKqekIY6KrVW1B63Pof8WMn+kMa3TQk3F0l0U9KhMLcU
         oxog==
X-Gm-Message-State: AOAM533Hj2Mwyrg2AuUIzFkc4RMDOcm7/FSII1VD8qgAQv4nepOsR3lE
        vvVojlzbXlEK1CG+ki3so7Bq7QDQNbJ05NQtR8kcdA==
X-Google-Smtp-Source: ABdhPJyNBl0/0s9Rk+OtPg0hzWn0atudTxxXg+zYQy29wV6Vs9TraG28QbEcxP+4avcC7bb2ETD9emPAZJoPBJ9fPgw=
X-Received: by 2002:a67:fd48:: with SMTP id g8mr1539289vsr.55.1618488197944;
 Thu, 15 Apr 2021 05:03:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210413083137.11171-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210413083137.11171-1-wsa+renesas@sang-engineering.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 15 Apr 2021 14:02:40 +0200
Message-ID: <CAPDyKFqZtg+hPf74_oQ0ugEsS3yRzbAQbpnirsVr4jOKMXo2gg@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: tmio: always restore irq register
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-mmc <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 13 Apr 2021 at 10:31, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Currently, only SDHI on R-Car Gen2+ reinitializes the irq register
> during reset but it should be done on all instances. We can move it from
> the SDHI driver to the TMIO core, because we now have the
> 'sd_irq_mask_all' variable which carries the proper value to use. That
> also means we can remove the initialization from tmio_mmc_probe()
> because it calls tmio_mmc_reset(), too. We only move that
> tmio_mmc_reset() call there a little to ensure 'sd_irq_mask_all' is
> properly set.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>
> Changes since v1:
>
> * use direct register write to initialize irq register instead of
>   masking bits. Also initialize the cache variable directly.
>
>  drivers/mmc/host/renesas_sdhi_core.c |  2 --
>  drivers/mmc/host/tmio_mmc_core.c     | 11 ++++++-----
>  2 files changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index d36181b6f687..635bf31a6735 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -588,8 +588,6 @@ static void renesas_sdhi_reset(struct tmio_mmc_host *host)
>                 renesas_sdhi_scc_reset(host, priv);
>         }
>
> -       sd_ctrl_write32_as_16_and_16(host, CTL_IRQ_MASK, TMIO_MASK_ALL_RCAR2);
> -
>         if (sd_ctrl_read16(host, CTL_VERSION) >= SDHI_VER_GEN3_SD) {
>                 val = sd_ctrl_read16(host, CTL_SD_MEM_CARD_OPT);
>                 val |= CARD_OPT_EXTOP;
> diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
> index 0c474d78b186..7dfc26f48c18 100644
> --- a/drivers/mmc/host/tmio_mmc_core.c
> +++ b/drivers/mmc/host/tmio_mmc_core.c
> @@ -192,6 +192,9 @@ static void tmio_mmc_reset(struct tmio_mmc_host *host)
>         if (host->reset)
>                 host->reset(host);
>
> +       sd_ctrl_write32_as_16_and_16(host, CTL_IRQ_MASK, host->sdcard_irq_mask_all);
> +       host->sdcard_irq_mask = host->sdcard_irq_mask_all;
> +
>         tmio_mmc_set_bus_width(host, host->mmc->ios.bus_width);
>
>         if (host->pdata->flags & TMIO_MMC_SDIO_IRQ) {
> @@ -1176,13 +1179,11 @@ int tmio_mmc_host_probe(struct tmio_mmc_host *_host)
>         if (pdata->flags & TMIO_MMC_SDIO_IRQ)
>                 _host->sdio_irq_mask = TMIO_SDIO_MASK_ALL;
>
> -       _host->set_clock(_host, 0);
> -       tmio_mmc_reset(_host);
> -
> -       _host->sdcard_irq_mask = sd_ctrl_read16_and_16_as_32(_host, CTL_IRQ_MASK);
>         if (!_host->sdcard_irq_mask_all)
>                 _host->sdcard_irq_mask_all = TMIO_MASK_ALL;
> -       tmio_mmc_disable_mmc_irqs(_host, _host->sdcard_irq_mask_all);
> +
> +       _host->set_clock(_host, 0);
> +       tmio_mmc_reset(_host);
>
>         if (_host->native_hotplug)
>                 tmio_mmc_enable_mmc_irqs(_host,
> --
> 2.30.0
>
