Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2CC01D497B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 15 May 2020 11:26:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727977AbgEOJ0p (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 15 May 2020 05:26:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727116AbgEOJ0p (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 15 May 2020 05:26:45 -0400
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5B00C061A0C
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 May 2020 02:26:43 -0700 (PDT)
Received: by mail-vs1-xe44.google.com with SMTP id u12so843826vsq.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 15 May 2020 02:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D86ctkG/EKahVd2mLUr3OwGMC4UoKIQg0Mj9DKIQ2i4=;
        b=SP8qtpxe1vGu5l0t0dYI/NlK+JR4LZ/WP4zIOvl9agVCpr3/CWSLV5fBW6CHg/E3jd
         k2iEm4LEfVPz2am2laMIQYmaq6P0XDvvRbw3u8FC8qQRlau4rLLwK8uT6BS+Dg8rfhzx
         GclBqJA8Fc1soSNWKVXU3Eek5uiuTaE7RBUVtsivUmnQwYOOxd0nu8h2XZRNDxSv7Hrs
         2twhE6y6mV1cxRb9aT18FtXBwEU052lc3I1iiEnCe+0ISDw6F6xHV6IXi2DTruajxG2H
         2A3KaHTMGsQ5aD9hdPrRxUDoshExhv3WFh7C6Mpg2Oz3CPoYZZu/A+gz9Z4ddwU17TPG
         SiSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D86ctkG/EKahVd2mLUr3OwGMC4UoKIQg0Mj9DKIQ2i4=;
        b=PZE/6FKPcrs7jTOHz4XVA64GwpuOX+yxiC95G+ONUSDRSk3Z8P9QeINqvcd4wtnBaN
         vvrQKNjOhTyQ+E6eYRujTo6fgEdBpi+hsSFrmCKDSOR5dPQLgnhjMWtlgcE0Eqv9IhQx
         9kDHnbgVrPfK+vIGAdsG2FdWjamcGawgRCSRZqZjmW1KLArm1Gj31Onduc0r3yX1eDqo
         e1wrru8Bq7ZB+csx0G6gU2uswnCDORqDvZLPSJU2nVGN3pMR6wuOrkyzxFI9yXYvvYlD
         UnUWJcHMzrBPT3aPaNmOueEbkMxxtOIVBpN4Pt9QLqlE8bBblG031MhsBgYAFdiZNKKT
         BuSg==
X-Gm-Message-State: AOAM5319yrj87zytk5Ietl1M5gNMB/ZTsNyjlkBklCDe0teVa5l88N51
        pGF4JoVOJ+8PU0n2ESb4RqL+ruOrSfMaNtO7gSm58UGJMAs=
X-Google-Smtp-Source: ABdhPJyD8EeY76xuk/rriWXVKz8C3Ulj9hq3+7nwTuoMOp2npjM347hFAErzP4d1iN6q3xkzKlFo/9/DJIqBklloNtc=
X-Received: by 2002:a67:302:: with SMTP id 2mr1761142vsd.165.1589534802848;
 Fri, 15 May 2020 02:26:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200513173131.11200-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20200513173131.11200-1-wsa+renesas@sang-engineering.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Fri, 15 May 2020 11:26:06 +0200
Message-ID: <CAPDyKFpaaVdpv22VO_OS7a2rw67xmD7qXcxUqD_g5CDdqiZiHA@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: don't lose RPM savings because of
 manual clk handling
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

+ Niklas, Geert, Yamada-san,


On Wed, 13 May 2020 at 19:31, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> The SDHI driver en-/disabled clocks on its own during probe() and
> remove(). This basically killed all potential RPM power savings. Now, we
> just enable the clocks for a short time when we access registers in
> probe(). We otherwise leave all handling to RPM. That means, we need to
> shift the RPM enabling code in the TMIO core a bit up, so we can access
> registers there, too.

No, this doesn't sound entirely right to me.

However, I do admit that we may need to move the pm_runtime
initialization earlier (perhaps even out of tmio_mmc_core), but for
slightly different reasons. Let me elaborate.

For uniphier-sd, renesas_sdhi_sys_dmac and renesas_sdhi_internal_dmac
- they all have assigned the ->clk_enable|disable() ops. Which means
they have internal clock management (calling clk_prepare|enable()
etc). For tmio_mmc, that's not the case.

On top of this, the device may also have a potential PM domain
attached. If that is the case, the PM domain may or may not have clock
management implemented through genpd's ->start|stop() callbacks.

So, in the end we are going to have to rely on clock enable/prepare
reference counting, as we have to manage the clock(s) at both the
driver and the PM domain level. Taking into account all various
combinations (and that CONFIG_PM may not always be set). I have
started to hack on some patches, but before I share them, let me ask a
few questions.

1. tmio_mmc: - is that used solely with clock management through
genpd? Or has no clock management at all?
2. uniphier-sd: Don't have runtime PM callbacks assigned. It looks
like it doesn't care about runtime PM, but maybe it does through a PM
domain? Can we skip to enable runtime PM for uniphier-sd, no?

Kind regards
Uffe

>
> clk_summary before:
> sd0                   1        1        0    12480000          0     0  50000
>    sdif0              2        2        0    12480000          0     0  50000
>
> clk_summary after:
> sd0                   1        1        0    12480000          0     0  50000
>    sdif0              1        1        0    12480000          0     0  50000
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Tested on a Salvator-XS board with R-Car M3-N.
>
>  drivers/mmc/host/renesas_sdhi_core.c |  7 +++----
>  drivers/mmc/host/tmio_mmc_core.c     | 14 +++++++-------
>  2 files changed, 10 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index ff72b381a6b3..d581142634f8 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -910,6 +910,8 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>                 goto efree;
>
>         ver = sd_ctrl_read16(host, CTL_VERSION);
> +       renesas_sdhi_clk_disable(host);
> +
>         /* GEN2_SDR104 is first known SDHI to use 32bit block count */
>         if (ver < SDHI_VER_GEN2_SDR104 && mmc_data->max_blk_count > U16_MAX)
>                 mmc_data->max_blk_count = U16_MAX;
> @@ -920,7 +922,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>
>         ret = tmio_mmc_host_probe(host);
>         if (ret < 0)
> -               goto edisclk;
> +               goto efree;
>
>         /* Enable tuning iff we have an SCC and a supported mode */
>         if (of_data && of_data->scc_offset &&
> @@ -985,8 +987,6 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>
>  eirq:
>         tmio_mmc_host_remove(host);
> -edisclk:
> -       renesas_sdhi_clk_disable(host);
>  efree:
>         tmio_mmc_host_free(host);
>
> @@ -999,7 +999,6 @@ int renesas_sdhi_remove(struct platform_device *pdev)
>         struct tmio_mmc_host *host = platform_get_drvdata(pdev);
>
>         tmio_mmc_host_remove(host);
> -       renesas_sdhi_clk_disable(host);
>
>         return 0;
>  }
> diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
> index 9a4ae954553b..6968177dd1cd 100644
> --- a/drivers/mmc/host/tmio_mmc_core.c
> +++ b/drivers/mmc/host/tmio_mmc_core.c
> @@ -1116,6 +1116,13 @@ int tmio_mmc_host_probe(struct tmio_mmc_host *_host)
>
>         _host->set_pwr = pdata->set_pwr;
>
> +       dev_pm_domain_start(&pdev->dev);
> +       pm_runtime_get_noresume(&pdev->dev);
> +       pm_runtime_set_active(&pdev->dev);
> +       pm_runtime_set_autosuspend_delay(&pdev->dev, 50);
> +       pm_runtime_use_autosuspend(&pdev->dev);
> +       pm_runtime_enable(&pdev->dev);
> +
>         ret = tmio_mmc_init_ocr(_host);
>         if (ret < 0)
>                 return ret;
> @@ -1192,13 +1199,6 @@ int tmio_mmc_host_probe(struct tmio_mmc_host *_host)
>         /* See if we also get DMA */
>         tmio_mmc_request_dma(_host, pdata);
>
> -       dev_pm_domain_start(&pdev->dev);
> -       pm_runtime_get_noresume(&pdev->dev);
> -       pm_runtime_set_active(&pdev->dev);
> -       pm_runtime_set_autosuspend_delay(&pdev->dev, 50);
> -       pm_runtime_use_autosuspend(&pdev->dev);
> -       pm_runtime_enable(&pdev->dev);
> -
>         ret = mmc_add_host(mmc);
>         if (ret)
>                 goto remove_host;
> --
> 2.20.1
>
