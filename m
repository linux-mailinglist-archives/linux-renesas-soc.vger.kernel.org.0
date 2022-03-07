Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 503B44CFDFB
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Mar 2022 13:18:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238326AbiCGMSz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Mar 2022 07:18:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240675AbiCGMSw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Mar 2022 07:18:52 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 477D63BBDE
        for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Mar 2022 04:17:58 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id u7so20045539ljk.13
        for <linux-renesas-soc@vger.kernel.org>; Mon, 07 Mar 2022 04:17:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MUl25lJj2nH3NDROtS6gUeielVh4d0KqkRbXqt0jB04=;
        b=CPw1pQDJVAVPvIR2tjvGiBheh0L2cvIklgARnnHw0sIxQ1prOBemBwMlAKL/1fYYyw
         lvj8hoNSo1c0T8RW2c+rsrIj9hQyn8yB1Zafxj4KSET8X3ynxULVpwDLdrf+EZUaH3rv
         BztjIe4a7acXBJRS0VebvozFstIORExCNcXxAqLBxbc9pCv9vb8o0aK4gH6g8KD9krcz
         ehveVo6Oa9EI/QH0vNfXswStnWJ/YoNcBVzpp/1iy5T+QPqklw+8FJF6QPzYqRu26lWc
         P8yrAbGBPzxBBC5R5Z5hWFcoMU0dWnA+AwQDIrAGSFYqjkv00bER08mmZX1X8CPoe9SD
         AEDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MUl25lJj2nH3NDROtS6gUeielVh4d0KqkRbXqt0jB04=;
        b=FiBHKgcgFIBa+KElOCOsYWpcG9cgPYd/POJzoXJ/8y/RAdInoKZ3sd9orvw27m7yjN
         nt3TqakxnIMz+4R0ydvq1IUhxxQ1srtZgD/JpPidAZII+J80KMjUhwGxQUCsF1hiYDpI
         Ax5Tgxf338KggXZOhBvViAdnbc07TVjjvcEKSZXFsVWR0epWVQFHibOuPVxrNs5zaTfa
         +NZam90DjslYBWMjBCnTiGODvUPTtAaZRrspuhVWAA5CFGqkxZhSB+8tb70NlR5soaAK
         0+HMsuEity2Z1WDhkPcf0Q3uwz4d4cKTi7kW7ORp9KDuXJxMnheK1GoTfsaIkwKbHJSq
         95AQ==
X-Gm-Message-State: AOAM532/AdwDoVo0DJNeEaP0pqubY3OWmrMLOgL2F8CQZwB874vraNIj
        2FyXTG3R4Mz9/Qylte2CuThnBiuCZC2npVqF+wawYA==
X-Google-Smtp-Source: ABdhPJwplsSM8k3C5blS4ezIDm0slUSfA6D2v6GSYz+H4/1qWM5T1q2iBltk76EldBou+2o/ZnC+SFSsYc3lb6CV6DA=
X-Received: by 2002:a2e:9045:0:b0:247:da7d:a460 with SMTP id
 n5-20020a2e9045000000b00247da7da460mr7025636ljg.300.1646655475600; Mon, 07
 Mar 2022 04:17:55 -0800 (PST)
MIME-Version: 1.0
References: <9050fa278eaaa9e6ec719a3b158a2fad285560d0.1646311673.git.geert+renesas@glider.be>
In-Reply-To: <9050fa278eaaa9e6ec719a3b158a2fad285560d0.1646311673.git.geert+renesas@glider.be>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 7 Mar 2022 13:17:18 +0100
Message-ID: <CAPDyKFp7d7OZYeK8jyjoWq9trRhqurjMZJS17Fdpi-3jTMAxug@mail.gmail.com>
Subject: Re: [PATCH] mmc: Drop commas after SoC match table sentinels
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 3 Mar 2022 at 13:49, Geert Uytterhoeven <geert+renesas@glider.be> wrote:
>
> It does not make sense to have a comma after a sentinel, as any new
> elements must be added before the sentinel.
>
> Add comments to clarify the purpose of the empty elements.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c |  2 +-
>  drivers/mmc/host/sdhci-of-esdhc.c             | 10 +++++-----
>  2 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> index 9d2c600fd4ce2484..1685df00863b941a 100644
> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -212,7 +212,7 @@ static const struct soc_device_attribute sdhi_quirks_match[]  = {
>         { .soc_id = "r8a7795", .revision = "ES2.0", .data = &sdhi_quirks_4tap },
>         { .soc_id = "r8a7796", .revision = "ES1.[012]", .data = &sdhi_quirks_4tap_nohs400 },
>         { .soc_id = "r8a7796", .revision = "ES1.*", .data = &sdhi_quirks_r8a7796_es13 },
> -       { /* Sentinel. */ },
> +       { /* Sentinel. */ }
>  };
>
>  static const struct renesas_sdhi_of_data_with_quirks of_r8a7795_compatible = {
> diff --git a/drivers/mmc/host/sdhci-of-esdhc.c b/drivers/mmc/host/sdhci-of-esdhc.c
> index 0f3658b36513c681..d9dc41143bb35d49 100644
> --- a/drivers/mmc/host/sdhci-of-esdhc.c
> +++ b/drivers/mmc/host/sdhci-of-esdhc.c
> @@ -934,7 +934,7 @@ static struct soc_device_attribute soc_tuning_erratum_type1[] = {
>         { .family = "QorIQ T1040", },
>         { .family = "QorIQ T2080", },
>         { .family = "QorIQ LS1021A", },
> -       { },
> +       { /* sentinel */ }
>  };
>
>  static struct soc_device_attribute soc_tuning_erratum_type2[] = {
> @@ -944,7 +944,7 @@ static struct soc_device_attribute soc_tuning_erratum_type2[] = {
>         { .family = "QorIQ LS1080A", },
>         { .family = "QorIQ LS2080A", },
>         { .family = "QorIQ LA1575A", },
> -       { },
> +       { /* sentinel */ }
>  };
>
>  static void esdhc_tuning_block_enable(struct sdhci_host *host, bool enable)
> @@ -1316,21 +1316,21 @@ static const struct sdhci_pltfm_data sdhci_esdhc_le_pdata = {
>  static struct soc_device_attribute soc_incorrect_hostver[] = {
>         { .family = "QorIQ T4240", .revision = "1.0", },
>         { .family = "QorIQ T4240", .revision = "2.0", },
> -       { },
> +       { /* sentinel */ }
>  };
>
>  static struct soc_device_attribute soc_fixup_sdhc_clkdivs[] = {
>         { .family = "QorIQ LX2160A", .revision = "1.0", },
>         { .family = "QorIQ LX2160A", .revision = "2.0", },
>         { .family = "QorIQ LS1028A", .revision = "1.0", },
> -       { },
> +       { /* sentinel */ }
>  };
>
>  static struct soc_device_attribute soc_unreliable_pulse_detection[] = {
>         { .family = "QorIQ LX2160A", .revision = "1.0", },
>         { .family = "QorIQ LX2160A", .revision = "2.0", },
>         { .family = "QorIQ LS1028A", .revision = "1.0", },
> -       { },
> +       { /* sentinel */ }
>  };
>
>  static void esdhc_init(struct platform_device *pdev, struct sdhci_host *host)
> --
> 2.25.1
>
