Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 405A13ED84B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Aug 2021 16:00:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231312AbhHPOAy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Aug 2021 10:00:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231997AbhHPOAh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Aug 2021 10:00:37 -0400
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47C72C06179A
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Aug 2021 07:00:02 -0700 (PDT)
Received: by mail-vs1-xe29.google.com with SMTP id b5so1300003vsq.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 16 Aug 2021 07:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Et+WrWdNu0yjmwXErnodYyLcy9rHJksxXEvGuQpf8E8=;
        b=vVdoMGNQ2QOTT44l9u7wdSq5xpFtFT5lITCwGrHDglyqPv3h23v1Ix04bdCn/T/i87
         ekmfXvkU8x6PcW1+KRv3Ca5oDvLubZNUizq55PPYrXXXHUUBnLjdJaQH/aDVfeJP7ZBz
         pey7ofDtN6X9u3xlpxiCeOTbpnkXDM0AasANIclZ2++6VHRcqAKUVCgiDEKIw7POPYg2
         aQrEfhhKDULyPARLpwbQ5sqoWoZac7/ef9LMQ7V3SU5GLhkfMO+6o0GkaBDpfQLH9B3M
         1hrf3Kp3a6cJomrLnV9SghM2oMJETh7G9pCI6952Gv5UfwU3auUtfMl1StZgpX/3em8+
         36Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Et+WrWdNu0yjmwXErnodYyLcy9rHJksxXEvGuQpf8E8=;
        b=rNK9UK8PH77NhKlvXHD36Y2EKxx1Och8rGIhz9FiuHJ5SCspyO+9AOikSaqFUUj24N
         RNOuLz5N3DuSTmhOCuyKWRoRNPHxPxDmufEei/lOEtlcIXqtxVDOezpumhI6hgmMaJSr
         0+/ARnm5fBWzBm6myLEJ2hV4V0o5awq54nzNtt3wUqN35f+KKlEJoVvxR2z3oMXhMXwo
         nIpbD0+d4laSTTflwSfzQM7ALmTNe5sIHyjlZh6pYJGAjn0XybYpcMj6ykWJKEmmresb
         yNWmRGPwDcBkTQ9Hsk1q2GVbRe7h98caSgfAOdfVmgpEDws7v7adpr6YZaj/H9Jlh/Sv
         Tojw==
X-Gm-Message-State: AOAM533O5/1ft1u4cW9LocQC9gqObSSt81lOF7NxL2mstCaCbIBUJ40m
        kqVCb5IrmWFPtA/iIKBwgOg9YHLkHd/ZqSlhZyciYA==
X-Google-Smtp-Source: ABdhPJwC6DUPbo/POngKb6y4++E1AK8UVwZeY4J37H6CF3z0xFYU2QqgucvAhm+n7TRv/cRdsPbxPkHdHMe3X/QIJw0=
X-Received: by 2002:a67:f6d8:: with SMTP id v24mr10131075vso.48.1629122401179;
 Mon, 16 Aug 2021 07:00:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210729103234.480743-1-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <20210729103234.480743-1-yoshihiro.shimoda.uh@renesas.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 16 Aug 2021 15:59:25 +0200
Message-ID: <CAPDyKFoSyJK=gWtSvk6N_u8BwWxFq8g-mF+xZpFC+tiXa-kZjw@mail.gmail.com>
Subject: Re: [PATCH v4] mmc: host: renesas_sdhi: Refactor renesas_sdhi_probe()
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 29 Jul 2021 at 12:32, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
>
> Refactor renesas_sdhi_probe() to avoid increasing numbers of
> sdhi_quirks_match[] entry when we add other stable SoCs like
> r8a779m*.
>
> Note that the sdhi_quirks_match[] is only needed on
> renesas_sdhi_internal_dmac.c so that of_data of
> renesas_sdhi_sys_dmac.c keeps as-is.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  Changes from v3:
>  - Add Reviewed-by tag (Geert-san, thanks!)
>  - Remove Reported-by tag.
>  - Modify renesas_sdhi_internal_dmac_probe() for readability.
>  https://lore.kernel.org/linux-mmc/20210702112956.1065875-1-yoshihiro.shimoda.uh@renesas.com/
>
>  Changes from RFC v2:
>  - Remove "RFC" mark from the subject.
>  - Add a comment to the Reported-by tag.
>  - Move all quirks to internal_dmac.c so that expands the renesas_sdhi_probe()
>    arguments. So, update the commit subject and description.
>  - Don't modify the renesas_sdhi_sys_dmac.c's of_data.
>  - Replace tabs with a space in of_data_with_quirks variables.
>  https://lore.kernel.org/linux-renesas-soc/20210629102033.847369-1-yoshihiro.shimoda.uh@renesas.com/
>
>  Changes from RFC v1:
>  - Fix build error in sys_dmac.c, reported by kernel test robot, so that
>    add Reported-by tag.
>  - Always set quirks, not using else statement.
>  - Fix a NULL dereference if of_device_get_match_data() returns NULL.
>  https://lore.kernel.org/linux-renesas-soc/20210625075508.664674-1-yoshihiro.shimoda.uh@renesas.com/
>
>  drivers/mmc/host/renesas_sdhi.h               |   9 +-
>  drivers/mmc/host/renesas_sdhi_core.c          |  90 +-----------
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 135 +++++++++++++++++-
>  drivers/mmc/host/renesas_sdhi_sys_dmac.c      |   3 +-
>  4 files changed, 141 insertions(+), 96 deletions(-)
>
> diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
> index 53eded81a53e..0c45e82ff0de 100644
> --- a/drivers/mmc/host/renesas_sdhi.h
> +++ b/drivers/mmc/host/renesas_sdhi.h
> @@ -42,6 +42,11 @@ struct renesas_sdhi_quirks {
>         const u8 (*hs400_calib_table)[SDHI_CALIB_TABLE_MAX];
>  };
>
> +struct renesas_sdhi_of_data_with_quirks {
> +       const struct renesas_sdhi_of_data *of_data;
> +       const struct renesas_sdhi_quirks *quirks;
> +};
> +
>  struct tmio_mmc_dma {
>         enum dma_slave_buswidth dma_buswidth;
>         bool (*filter)(struct dma_chan *chan, void *arg);
> @@ -78,6 +83,8 @@ struct renesas_sdhi {
>         container_of((host)->pdata, struct renesas_sdhi, mmc_data)
>
>  int renesas_sdhi_probe(struct platform_device *pdev,
> -                      const struct tmio_mmc_dma_ops *dma_ops);
> +                      const struct tmio_mmc_dma_ops *dma_ops,
> +                      const struct renesas_sdhi_of_data *of_data,
> +                      const struct renesas_sdhi_quirks *quirks);
>  int renesas_sdhi_remove(struct platform_device *pdev);
>  #endif
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index e49ca0f7fe9a..6fc4cf3c9dce 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -305,27 +305,6 @@ static int renesas_sdhi_start_signal_voltage_switch(struct mmc_host *mmc,
>  #define SH_MOBILE_SDHI_SCC_TMPPORT_CALIB_CODE_MASK     0x1f
>  #define SH_MOBILE_SDHI_SCC_TMPPORT_MANUAL_MODE         BIT(7)
>
> -static const u8 r8a7796_es13_calib_table[2][SDHI_CALIB_TABLE_MAX] = {
> -       { 3,  3,  3,  3,  3,  3,  3,  4,  4,  5,  6,  7,  8,  9, 10, 15,
> -        16, 16, 16, 16, 16, 16, 17, 18, 18, 19, 20, 21, 22, 23, 24, 25 },
> -       { 5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  6,  7,  8, 11,
> -        12, 17, 18, 18, 18, 18, 18, 18, 18, 19, 20, 21, 22, 23, 25, 25 }
> -};
> -
> -static const u8 r8a77965_calib_table[2][SDHI_CALIB_TABLE_MAX] = {
> -       { 1,  2,  6,  6,  7,  8,  9, 10, 11, 12, 13, 14, 15, 15, 15, 16,
> -        17, 18, 19, 20, 21, 22, 23, 24, 25, 25, 26, 27, 28, 29, 30, 31 },
> -       { 2,  3,  4,  4,  5,  6,  7,  9, 10, 11, 12, 13, 14, 15, 16, 17,
> -        17, 17, 20, 21, 22, 23, 24, 25, 27, 28, 29, 30, 31, 31, 31, 31 }
> -};
> -
> -static const u8 r8a77990_calib_table[2][SDHI_CALIB_TABLE_MAX] = {
> -       { 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
> -         0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 },
> -       { 0,  0,  0,  1,  2,  3,  3,  4,  4,  4,  5,  5,  6,  8,  9, 10,
> -        11, 12, 13, 15, 16, 17, 17, 18, 18, 19, 20, 22, 24, 25, 26, 26 }
> -};
> -
>  static inline u32 sd_scc_read32(struct tmio_mmc_host *host,
>                                 struct renesas_sdhi *priv, int addr)
>  {
> @@ -895,69 +874,12 @@ static void renesas_sdhi_enable_dma(struct tmio_mmc_host *host, bool enable)
>         renesas_sdhi_sdbuf_width(host, enable ? width : 16);
>  }
>
> -static const struct renesas_sdhi_quirks sdhi_quirks_4tap_nohs400 = {
> -       .hs400_disabled = true,
> -       .hs400_4taps = true,
> -};
> -
> -static const struct renesas_sdhi_quirks sdhi_quirks_4tap = {
> -       .hs400_4taps = true,
> -       .hs400_bad_taps = BIT(2) | BIT(3) | BIT(6) | BIT(7),
> -};
> -
> -static const struct renesas_sdhi_quirks sdhi_quirks_nohs400 = {
> -       .hs400_disabled = true,
> -};
> -
> -static const struct renesas_sdhi_quirks sdhi_quirks_bad_taps1357 = {
> -       .hs400_bad_taps = BIT(1) | BIT(3) | BIT(5) | BIT(7),
> -};
> -
> -static const struct renesas_sdhi_quirks sdhi_quirks_bad_taps2367 = {
> -       .hs400_bad_taps = BIT(2) | BIT(3) | BIT(6) | BIT(7),
> -};
> -
> -static const struct renesas_sdhi_quirks sdhi_quirks_r8a7796_es13 = {
> -       .hs400_4taps = true,
> -       .hs400_bad_taps = BIT(2) | BIT(3) | BIT(6) | BIT(7),
> -       .hs400_calib_table = r8a7796_es13_calib_table,
> -};
> -
> -static const struct renesas_sdhi_quirks sdhi_quirks_r8a77965 = {
> -       .hs400_bad_taps = BIT(2) | BIT(3) | BIT(6) | BIT(7),
> -       .hs400_calib_table = r8a77965_calib_table,
> -};
> -
> -static const struct renesas_sdhi_quirks sdhi_quirks_r8a77990 = {
> -       .hs400_calib_table = r8a77990_calib_table,
> -};
> -
> -/*
> - * Note for r8a7796 / r8a774a1: we can't distinguish ES1.1 and 1.2 as of now.
> - * So, we want to treat them equally and only have a match for ES1.2 to enforce
> - * this if there ever will be a way to distinguish ES1.2.
> - */
> -static const struct soc_device_attribute sdhi_quirks_match[]  = {
> -       { .soc_id = "r8a774a1", .revision = "ES1.[012]", .data = &sdhi_quirks_4tap_nohs400 },
> -       { .soc_id = "r8a7795", .revision = "ES1.*", .data = &sdhi_quirks_4tap_nohs400 },
> -       { .soc_id = "r8a7795", .revision = "ES2.0", .data = &sdhi_quirks_4tap },
> -       { .soc_id = "r8a7795", .revision = "ES3.*", .data = &sdhi_quirks_bad_taps2367 },
> -       { .soc_id = "r8a7796", .revision = "ES1.[012]", .data = &sdhi_quirks_4tap_nohs400 },
> -       { .soc_id = "r8a7796", .revision = "ES1.*", .data = &sdhi_quirks_r8a7796_es13 },
> -       { .soc_id = "r8a77961", .data = &sdhi_quirks_bad_taps1357 },
> -       { .soc_id = "r8a77965", .data = &sdhi_quirks_r8a77965 },
> -       { .soc_id = "r8a77980", .data = &sdhi_quirks_nohs400 },
> -       { .soc_id = "r8a77990", .data = &sdhi_quirks_r8a77990 },
> -       { /* Sentinel. */ },
> -};
> -
>  int renesas_sdhi_probe(struct platform_device *pdev,
> -                      const struct tmio_mmc_dma_ops *dma_ops)
> +                      const struct tmio_mmc_dma_ops *dma_ops,
> +                      const struct renesas_sdhi_of_data *of_data,
> +                      const struct renesas_sdhi_quirks *quirks)
>  {
>         struct tmio_mmc_data *mmd = pdev->dev.platform_data;
> -       const struct renesas_sdhi_quirks *quirks = NULL;
> -       const struct renesas_sdhi_of_data *of_data;
> -       const struct soc_device_attribute *attr;
>         struct tmio_mmc_data *mmc_data;
>         struct tmio_mmc_dma *dma_priv;
>         struct tmio_mmc_host *host;
> @@ -966,12 +888,6 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>         struct resource *res;
>         u16 ver;
>
> -       of_data = of_device_get_match_data(&pdev->dev);
> -
> -       attr = soc_device_match(sdhi_quirks_match);
> -       if (attr)
> -               quirks = attr->data;
> -
>         res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>         if (!res)
>                 return -EINVAL;
> diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> index e8f4863d8f1a..7660f7ea74dd 100644
> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -15,6 +15,7 @@
>  #include <linux/mmc/host.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/module.h>
> +#include <linux/of_device.h>
>  #include <linux/pagemap.h>
>  #include <linux/scatterlist.h>
>  #include <linux/sys_soc.h>
> @@ -92,7 +93,7 @@ static struct renesas_sdhi_scc rcar_gen3_scc_taps[] = {
>         },
>  };
>
> -static const struct renesas_sdhi_of_data of_rza2_compatible = {
> +static const struct renesas_sdhi_of_data of_data_rza2 = {
>         .tmio_flags     = TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL |
>                           TMIO_MMC_HAVE_CBSY,
>         .tmio_ocr_mask  = MMC_VDD_32_33,
> @@ -107,7 +108,11 @@ static const struct renesas_sdhi_of_data of_rza2_compatible = {
>         .max_segs       = 1,
>  };
>
> -static const struct renesas_sdhi_of_data of_rcar_gen3_compatible = {
> +static const struct renesas_sdhi_of_data_with_quirks of_rza2_compatible = {
> +       .of_data        = &of_data_rza2,
> +};
> +
> +static const struct renesas_sdhi_of_data of_data_rcar_gen3 = {
>         .tmio_flags     = TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL |
>                           TMIO_MMC_HAVE_CBSY | TMIO_MMC_MIN_RCAR2,
>         .capabilities   = MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
> @@ -122,11 +127,116 @@ static const struct renesas_sdhi_of_data of_rcar_gen3_compatible = {
>         .max_segs       = 1,
>  };
>
> +static const u8 r8a7796_es13_calib_table[2][SDHI_CALIB_TABLE_MAX] = {
> +       { 3,  3,  3,  3,  3,  3,  3,  4,  4,  5,  6,  7,  8,  9, 10, 15,
> +        16, 16, 16, 16, 16, 16, 17, 18, 18, 19, 20, 21, 22, 23, 24, 25 },
> +       { 5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  6,  7,  8, 11,
> +        12, 17, 18, 18, 18, 18, 18, 18, 18, 19, 20, 21, 22, 23, 25, 25 }
> +};
> +
> +static const u8 r8a77965_calib_table[2][SDHI_CALIB_TABLE_MAX] = {
> +       { 1,  2,  6,  6,  7,  8,  9, 10, 11, 12, 13, 14, 15, 15, 15, 16,
> +        17, 18, 19, 20, 21, 22, 23, 24, 25, 25, 26, 27, 28, 29, 30, 31 },
> +       { 2,  3,  4,  4,  5,  6,  7,  9, 10, 11, 12, 13, 14, 15, 16, 17,
> +        17, 17, 20, 21, 22, 23, 24, 25, 27, 28, 29, 30, 31, 31, 31, 31 }
> +};
> +
> +static const u8 r8a77990_calib_table[2][SDHI_CALIB_TABLE_MAX] = {
> +       { 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
> +         0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 },
> +       { 0,  0,  0,  1,  2,  3,  3,  4,  4,  4,  5,  5,  6,  8,  9, 10,
> +        11, 12, 13, 15, 16, 17, 17, 18, 18, 19, 20, 22, 24, 25, 26, 26 }
> +};
> +
> +static const struct renesas_sdhi_quirks sdhi_quirks_4tap_nohs400 = {
> +       .hs400_disabled = true,
> +       .hs400_4taps = true,
> +};
> +
> +static const struct renesas_sdhi_quirks sdhi_quirks_4tap = {
> +       .hs400_4taps = true,
> +       .hs400_bad_taps = BIT(2) | BIT(3) | BIT(6) | BIT(7),
> +};
> +
> +static const struct renesas_sdhi_quirks sdhi_quirks_nohs400 = {
> +       .hs400_disabled = true,
> +};
> +
> +static const struct renesas_sdhi_quirks sdhi_quirks_bad_taps1357 = {
> +       .hs400_bad_taps = BIT(1) | BIT(3) | BIT(5) | BIT(7),
> +};
> +
> +static const struct renesas_sdhi_quirks sdhi_quirks_bad_taps2367 = {
> +       .hs400_bad_taps = BIT(2) | BIT(3) | BIT(6) | BIT(7),
> +};
> +
> +static const struct renesas_sdhi_quirks sdhi_quirks_r8a7796_es13 = {
> +       .hs400_4taps = true,
> +       .hs400_bad_taps = BIT(2) | BIT(3) | BIT(6) | BIT(7),
> +       .hs400_calib_table = r8a7796_es13_calib_table,
> +};
> +
> +static const struct renesas_sdhi_quirks sdhi_quirks_r8a77965 = {
> +       .hs400_bad_taps = BIT(2) | BIT(3) | BIT(6) | BIT(7),
> +       .hs400_calib_table = r8a77965_calib_table,
> +};
> +
> +static const struct renesas_sdhi_quirks sdhi_quirks_r8a77990 = {
> +       .hs400_calib_table = r8a77990_calib_table,
> +};
> +
> +/*
> + * Note for r8a7796 / r8a774a1: we can't distinguish ES1.1 and 1.2 as of now.
> + * So, we want to treat them equally and only have a match for ES1.2 to enforce
> + * this if there ever will be a way to distinguish ES1.2.
> + */
> +static const struct soc_device_attribute sdhi_quirks_match[]  = {
> +       { .soc_id = "r8a774a1", .revision = "ES1.[012]", .data = &sdhi_quirks_4tap_nohs400 },
> +       { .soc_id = "r8a7795", .revision = "ES1.*", .data = &sdhi_quirks_4tap_nohs400 },
> +       { .soc_id = "r8a7795", .revision = "ES2.0", .data = &sdhi_quirks_4tap },
> +       { .soc_id = "r8a7796", .revision = "ES1.[012]", .data = &sdhi_quirks_4tap_nohs400 },
> +       { .soc_id = "r8a7796", .revision = "ES1.*", .data = &sdhi_quirks_r8a7796_es13 },
> +       { /* Sentinel. */ },
> +};
> +
> +static const struct renesas_sdhi_of_data_with_quirks of_r8a7795_compatible = {
> +       .of_data = &of_data_rcar_gen3,
> +       .quirks = &sdhi_quirks_bad_taps2367,
> +};
> +
> +static const struct renesas_sdhi_of_data_with_quirks of_r8a77961_compatible = {
> +       .of_data = &of_data_rcar_gen3,
> +       .quirks = &sdhi_quirks_bad_taps1357,
> +};
> +
> +static const struct renesas_sdhi_of_data_with_quirks of_r8a77965_compatible = {
> +       .of_data = &of_data_rcar_gen3,
> +       .quirks = &sdhi_quirks_r8a77965,
> +};
> +
> +static const struct renesas_sdhi_of_data_with_quirks of_r8a77980_compatible = {
> +       .of_data = &of_data_rcar_gen3,
> +       .quirks = &sdhi_quirks_nohs400,
> +};
> +
> +static const struct renesas_sdhi_of_data_with_quirks of_r8a77990_compatible = {
> +       .of_data = &of_data_rcar_gen3,
> +       .quirks = &sdhi_quirks_r8a77990,
> +};
> +
> +static const struct renesas_sdhi_of_data_with_quirks of_rcar_gen3_compatible = {
> +       .of_data = &of_data_rcar_gen3,
> +};
> +
>  static const struct of_device_id renesas_sdhi_internal_dmac_of_match[] = {
>         { .compatible = "renesas,sdhi-r7s9210", .data = &of_rza2_compatible, },
>         { .compatible = "renesas,sdhi-mmc-r8a77470", .data = &of_rcar_gen3_compatible, },
> -       { .compatible = "renesas,sdhi-r8a7795", .data = &of_rcar_gen3_compatible, },
> +       { .compatible = "renesas,sdhi-r8a7795", .data = &of_r8a7795_compatible, },
>         { .compatible = "renesas,sdhi-r8a7796", .data = &of_rcar_gen3_compatible, },
> +       { .compatible = "renesas,sdhi-r8a77961", .data = &of_r8a77961_compatible, },
> +       { .compatible = "renesas,sdhi-r8a77965", .data = &of_r8a77965_compatible, },
> +       { .compatible = "renesas,sdhi-r8a77980", .data = &of_r8a77980_compatible, },
> +       { .compatible = "renesas,sdhi-r8a77990", .data = &of_r8a77990_compatible, },
>         { .compatible = "renesas,rcar-gen3-sdhi", .data = &of_rcar_gen3_compatible, },
>         {},
>  };
> @@ -405,16 +515,27 @@ static const struct soc_device_attribute soc_dma_quirks[] = {
>
>  static int renesas_sdhi_internal_dmac_probe(struct platform_device *pdev)
>  {
> -       const struct soc_device_attribute *soc = soc_device_match(soc_dma_quirks);
> +       const struct soc_device_attribute *attr;
> +       const struct renesas_sdhi_of_data_with_quirks *of_data_quirks;
> +       const struct renesas_sdhi_quirks *quirks;
>         struct device *dev = &pdev->dev;
>
> -       if (soc)
> -               global_flags |= (unsigned long)soc->data;
> +       of_data_quirks = of_device_get_match_data(&pdev->dev);
> +       quirks = of_data_quirks->quirks;
> +
> +       attr = soc_device_match(soc_dma_quirks);
> +       if (attr)
> +               global_flags |= (unsigned long)attr->data;
> +
> +       attr = soc_device_match(sdhi_quirks_match);
> +       if (attr)
> +               quirks = attr->data;
>
>         /* value is max of SD_SECCNT. Confirmed by HW engineers */
>         dma_set_max_seg_size(dev, 0xffffffff);
>
> -       return renesas_sdhi_probe(pdev, &renesas_sdhi_internal_dmac_dma_ops);
> +       return renesas_sdhi_probe(pdev, &renesas_sdhi_internal_dmac_dma_ops,
> +                                 of_data_quirks->of_data, quirks);
>  }
>
>  static const struct dev_pm_ops renesas_sdhi_internal_dmac_dev_pm_ops = {
> diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> index 6956b83469c8..99e3426df702 100644
> --- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
> @@ -451,7 +451,8 @@ static const struct tmio_mmc_dma_ops renesas_sdhi_sys_dmac_dma_ops = {
>
>  static int renesas_sdhi_sys_dmac_probe(struct platform_device *pdev)
>  {
> -       return renesas_sdhi_probe(pdev, &renesas_sdhi_sys_dmac_dma_ops);
> +       return renesas_sdhi_probe(pdev, &renesas_sdhi_sys_dmac_dma_ops,
> +                                 of_device_get_match_data(&pdev->dev), NULL);
>  }
>
>  static const struct dev_pm_ops renesas_sdhi_sys_dmac_dev_pm_ops = {
> --
> 2.25.1
>
