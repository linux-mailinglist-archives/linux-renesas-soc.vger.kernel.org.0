Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2FAB44D44D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Nov 2021 10:48:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbhKKJvf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 11 Nov 2021 04:51:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230021AbhKKJvf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Nov 2021 04:51:35 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 835DAC061767
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Nov 2021 01:48:46 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id i63so10822876lji.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Nov 2021 01:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QmldYMtdECEgCOXCIrX8riBsFyaOmDcKmwtf9tnktPc=;
        b=otCtRaIwyN0WzJC0bH4KBfEiAvcDxEC20lCUM8mOrvRjpQZYiGHrZ90yNkW72djGAS
         L1q0hUHlWmH85uPd5ayAt763aIaCP9owGVeh2SbTjTBRVoM8rgi+cR4Abgoc+ssLK06R
         qlJQxdkosx616r2hXVWsXeOQqKJsbu+cyocRpUFrlVls9IHgFhTsynS4Okftz9XS2+a+
         tzODziTcKephE5h9aLI3Bp4A0Mv6sO1Ln+bVYUyL0AT+0cRH8kScsGqxZIqDJtptOHx8
         bsRrzuKtT9tHfn8OTiaeUYTcwqjGQub8UFrQSrE/8PMzjYPf+8rtNVgdvMEnLI439y7I
         FV2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QmldYMtdECEgCOXCIrX8riBsFyaOmDcKmwtf9tnktPc=;
        b=LKTPCFapSU/zr/U4HLIQHWJ6q/jkTB5mhkfqjbAoa9ufaz/KWzu1B32smBdK2vT5rv
         RpMOvEPOHgEtN4ec9eHzqXsRQWc612ra83yEyKZnXUE2Mc0DbSurnsbQk7yGUiH7MBMa
         gX2TZMwAO7z5b/vV4JZY0GRAokbEXLnZGMT1xUdi5rOa2/4JnqpHICvnqZWVM0hz2tpL
         Tvg+K1C2LelAvJGRCPGQYiQ/+81REnud32ywMxkdV2YJhSXw+cy1jATeo9hXdu5u8sMk
         x/g59FbJGmaNrK2EEyTfRhqg3TA1ZAoSflEbtV2GbRFtMKrQvBtjT0EZxdV2pavnmLwr
         +LwA==
X-Gm-Message-State: AOAM533g3DYk1Kgx7HSpa0tf7VkxdoMhqLKFF/A7NEsto7qmRMDrAIII
        bXHnJVXIgAjwgqMDsaNZBWF/XCMjVBMwaIjMRXGLU1+a3Mk=
X-Google-Smtp-Source: ABdhPJwxzCdTgfOA9njTrGloi0wWbRdlkLosHRvCfvoZmsrypWbhjUA72lNnf+2PqkseGAhzILZjy79W53YI3tN+jK4=
X-Received: by 2002:a05:651c:10b1:: with SMTP id k17mr5774360ljn.463.1636624123410;
 Thu, 11 Nov 2021 01:48:43 -0800 (PST)
MIME-Version: 1.0
References: <20211110191610.5664-1-wsa+renesas@sang-engineering.com> <20211110191610.5664-5-wsa+renesas@sang-engineering.com>
In-Reply-To: <20211110191610.5664-5-wsa+renesas@sang-engineering.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 11 Nov 2021 10:48:07 +0100
Message-ID: <CAPDyKFpzu1Pb+AgAd0W-FsL8ejCxg88UpBJccK0rEndAhHRAmQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 04/21] mmc: sdhi: internal_dmac: flag non-standard
 SDnH handling for V3M
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-mmc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 10 Nov 2021 at 20:16, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> V3M handles SDnH differently than other Gen3 SoCs, so let's add a
> separate entry for that. This will allow better SDnH handling in the
> future.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe




> ---
> Changes since RFC v1:
> * new patch
>
>  drivers/mmc/host/renesas_sdhi.h               |  3 +++
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 21 +++++++++++++++++++
>  2 files changed, 24 insertions(+)
>
> diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
> index 0c45e82ff0de..cd82420677cc 100644
> --- a/drivers/mmc/host/renesas_sdhi.h
> +++ b/drivers/mmc/host/renesas_sdhi.h
> @@ -18,6 +18,8 @@ struct renesas_sdhi_scc {
>         u32 tap_hs400_4tap;     /* sampling clock position for HS400 (4 TAP) */
>  };
>
> +#define SDHI_FLAG_NEED_CLKH_FALLBACK   BIT(0)
> +
>  struct renesas_sdhi_of_data {
>         unsigned long tmio_flags;
>         u32           tmio_ocr_mask;
> @@ -31,6 +33,7 @@ struct renesas_sdhi_of_data {
>         int taps_num;
>         unsigned int max_blk_count;
>         unsigned short max_segs;
> +       unsigned long sdhi_flags;
>  };
>
>  #define SDHI_CALIB_TABLE_MAX 32
> diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> index 7660f7ea74dd..9d2c600fd4ce 100644
> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -125,6 +125,22 @@ static const struct renesas_sdhi_of_data of_data_rcar_gen3 = {
>         /* DMAC can handle 32bit blk count but only 1 segment */
>         .max_blk_count  = UINT_MAX / TMIO_MAX_BLK_SIZE,
>         .max_segs       = 1,
> +       .sdhi_flags     = SDHI_FLAG_NEED_CLKH_FALLBACK,
> +};
> +
> +static const struct renesas_sdhi_of_data of_data_rcar_gen3_no_fallback = {
> +       .tmio_flags     = TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL |
> +                         TMIO_MMC_HAVE_CBSY | TMIO_MMC_MIN_RCAR2,
> +       .capabilities   = MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
> +                         MMC_CAP_CMD23 | MMC_CAP_WAIT_WHILE_BUSY,
> +       .capabilities2  = MMC_CAP2_NO_WRITE_PROTECT | MMC_CAP2_MERGE_CAPABLE,
> +       .bus_shift      = 2,
> +       .scc_offset     = 0x1000,
> +       .taps           = rcar_gen3_scc_taps,
> +       .taps_num       = ARRAY_SIZE(rcar_gen3_scc_taps),
> +       /* DMAC can handle 32bit blk count but only 1 segment */
> +       .max_blk_count  = UINT_MAX / TMIO_MAX_BLK_SIZE,
> +       .max_segs       = 1,
>  };
>
>  static const u8 r8a7796_es13_calib_table[2][SDHI_CALIB_TABLE_MAX] = {
> @@ -214,6 +230,10 @@ static const struct renesas_sdhi_of_data_with_quirks of_r8a77965_compatible = {
>         .quirks = &sdhi_quirks_r8a77965,
>  };
>
> +static const struct renesas_sdhi_of_data_with_quirks of_r8a77970_compatible = {
> +       .of_data = &of_data_rcar_gen3_no_fallback,
> +};
> +
>  static const struct renesas_sdhi_of_data_with_quirks of_r8a77980_compatible = {
>         .of_data = &of_data_rcar_gen3,
>         .quirks = &sdhi_quirks_nohs400,
> @@ -235,6 +255,7 @@ static const struct of_device_id renesas_sdhi_internal_dmac_of_match[] = {
>         { .compatible = "renesas,sdhi-r8a7796", .data = &of_rcar_gen3_compatible, },
>         { .compatible = "renesas,sdhi-r8a77961", .data = &of_r8a77961_compatible, },
>         { .compatible = "renesas,sdhi-r8a77965", .data = &of_r8a77965_compatible, },
> +       { .compatible = "renesas,sdhi-r8a77970", .data = &of_r8a77970_compatible, },
>         { .compatible = "renesas,sdhi-r8a77980", .data = &of_r8a77980_compatible, },
>         { .compatible = "renesas,sdhi-r8a77990", .data = &of_r8a77990_compatible, },
>         { .compatible = "renesas,rcar-gen3-sdhi", .data = &of_rcar_gen3_compatible, },
> --
> 2.30.2
>
