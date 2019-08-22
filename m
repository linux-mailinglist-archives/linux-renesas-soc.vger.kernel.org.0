Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BFF59930D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 Aug 2019 14:17:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725886AbfHVMOK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 22 Aug 2019 08:14:10 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:45820 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388403AbfHVMNz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 22 Aug 2019 08:13:55 -0400
Received: by mail-vs1-f65.google.com with SMTP id j25so3648457vsq.12
        for <linux-renesas-soc@vger.kernel.org>; Thu, 22 Aug 2019 05:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3vpLE8apAuk4X7bkfLY/DG1YUL+6Alc1es3W73WSO1M=;
        b=ZjKMpEROww2EasgVb62v8BDGCCBMl38IEpDsXYL9zmc+uEsEIMz34EW/dcbwrxJDzz
         ibaNNoGdlGtBMuYptiXQFHgrG21WxJ1Kgd9Zey640sMCnM63W7yfjXTC2RpMtePy3pat
         NfbmboeNLxudxvitI72F9Cwq8H9UQxppwFAr2JluXDOD/6FoUZmkeLPdQqbhxNR80zg8
         zuSF8ztKZeaDyIeVrqUCl60g8iVUHyF8BZGHK9fXzSphdHwK7l2qsw4xwQQG40YvLG4l
         VS2quxxygmtxCc34DxiMwulWVo4yJIYUwnv1HJf/cs8Lcbi2GyjtTCExkkhzm/5eSvWy
         Z4Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3vpLE8apAuk4X7bkfLY/DG1YUL+6Alc1es3W73WSO1M=;
        b=o7GrH7ulzRxsNRv4up702c87qVWrn78pSBQNIsF5NdIMTSIWDd8zsXU/7s8/XbBkKM
         jcntiZC1uD6PIpbA7FnqsluqxW1DqByL7AcREdRyPP128oIQFfJ8LkIWPdfxXa+uCdTI
         rb+yLoB3e0uxceDWJH7kR7kHwOovGctZKt75VxKRiGJdI9lrO4aC3jEL2mUZANjc7pkM
         ymYiSIIWw4qrbVhxGcNhqOsIgBYsOybpnzKAPZydSL2DlrDIBS27GohqYgKZwvG1P/mK
         T0akXto0toSXZfLynFVVZUYECkM3yVtXiv7C8lnsPVOde6goJqygJHLqwA/59uXHEqTI
         lX3g==
X-Gm-Message-State: APjAAAXN+wRyMgs/Vxm67bHZQpA3mrfB7ZftdU91Rd8+plYUmftU2D7R
        +gGBjh4zPiAsMOzGSd9a7lkutcAI6DBQTvUKsi4Hbg==
X-Google-Smtp-Source: APXvYqxJutReSo8wkl8kubUj+il9vx4Pr5j6inXYT/43vGscLMAUTvhvjIah8LLIWoYcOWvO0C28wVgid0NO/oimnNQ=
X-Received: by 2002:a67:32c5:: with SMTP id y188mr25221313vsy.191.1566476034737;
 Thu, 22 Aug 2019 05:13:54 -0700 (PDT)
MIME-Version: 1.0
References: <1566290590-2841-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1566290590-2841-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 22 Aug 2019 14:13:18 +0200
Message-ID: <CAPDyKFpHQwS+J+tO6Do+bLTwEZxw8B4NJb7ddtddCRrKBoQ5Ag@mail.gmail.com>
Subject: Re: [PATCH] mmc: host: renesas_sdhi_sys_dmac: Remove all R-Car Gen3 SoCs
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 20 Aug 2019 at 10:44, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
>
> All R-Car Gen3 SoCs with any ES version cannot use this DMAC actually.
> So, this patch removes the compatibles of R-Car Gen3 SoCs from
> renesas_sdhi_sys_dmac_of_match. Since the previous code has
> an empty whitelist to prevent probing of R-Car Gen3 SoCs,
> no behavior changes.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/renesas_sdhi_sys_dmac.c | 36 --------------------------------
>  1 file changed, 36 deletions(-)
>
> diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> index 1d29b82..13ff023 100644
> --- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> @@ -68,26 +68,6 @@ static const struct renesas_sdhi_of_data of_rcar_gen2_compatible = {
>         .max_blk_count  = UINT_MAX / TMIO_MAX_BLK_SIZE,
>  };
>
> -/* Definitions for sampling clocks */
> -static struct renesas_sdhi_scc rcar_gen3_scc_taps[] = {
> -       {
> -               .clk_rate = 0,
> -               .tap = 0x00000300,
> -       },
> -};
> -
> -static const struct renesas_sdhi_of_data of_rcar_gen3_compatible = {
> -       .tmio_flags     = TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL |
> -                         TMIO_MMC_HAVE_CBSY | TMIO_MMC_MIN_RCAR2,
> -       .capabilities   = MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
> -                         MMC_CAP_CMD23,
> -       .capabilities2  = MMC_CAP2_NO_WRITE_PROTECT,
> -       .bus_shift      = 2,
> -       .scc_offset     = 0x1000,
> -       .taps           = rcar_gen3_scc_taps,
> -       .taps_num       = ARRAY_SIZE(rcar_gen3_scc_taps),
> -};
> -
>  static const struct of_device_id renesas_sdhi_sys_dmac_of_match[] = {
>         { .compatible = "renesas,sdhi-sh73a0", .data = &of_default_cfg, },
>         { .compatible = "renesas,sdhi-r8a73a4", .data = &of_default_cfg, },
> @@ -102,11 +82,8 @@ static const struct of_device_id renesas_sdhi_sys_dmac_of_match[] = {
>         { .compatible = "renesas,sdhi-r8a7792", .data = &of_rcar_gen2_compatible, },
>         { .compatible = "renesas,sdhi-r8a7793", .data = &of_rcar_gen2_compatible, },
>         { .compatible = "renesas,sdhi-r8a7794", .data = &of_rcar_gen2_compatible, },
> -       { .compatible = "renesas,sdhi-r8a7795", .data = &of_rcar_gen3_compatible, },
> -       { .compatible = "renesas,sdhi-r8a7796", .data = &of_rcar_gen3_compatible, },
>         { .compatible = "renesas,rcar-gen1-sdhi", .data = &of_rcar_gen1_compatible, },
>         { .compatible = "renesas,rcar-gen2-sdhi", .data = &of_rcar_gen2_compatible, },
> -       { .compatible = "renesas,rcar-gen3-sdhi", .data = &of_rcar_gen3_compatible, },
>         { .compatible = "renesas,sdhi-shmobile" },
>         {},
>  };
> @@ -470,21 +447,8 @@ static const struct tmio_mmc_dma_ops renesas_sdhi_sys_dmac_dma_ops = {
>         .dataend = renesas_sdhi_sys_dmac_dataend_dma,
>  };
>
> -/*
> - * Whitelist of specific R-Car Gen3 SoC ES versions to use this DMAC
> - * implementation. Currently empty as all supported ES versions use
> - * the internal DMAC.
> - */
> -static const struct soc_device_attribute gen3_soc_whitelist[] = {
> -        { /* sentinel */ }
> -};
> -
>  static int renesas_sdhi_sys_dmac_probe(struct platform_device *pdev)
>  {
> -       if (of_device_get_match_data(&pdev->dev) == &of_rcar_gen3_compatible &&
> -           !soc_device_match(gen3_soc_whitelist))
> -               return -ENODEV;
> -
>         return renesas_sdhi_probe(pdev, &renesas_sdhi_sys_dmac_dma_ops);
>  }
>
> --
> 2.7.4
>
