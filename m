Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90AF0B5B60
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Sep 2019 07:55:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726034AbfIRFzD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 Sep 2019 01:55:03 -0400
Received: from mail-ua1-f66.google.com ([209.85.222.66]:34850 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725868AbfIRFzD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Sep 2019 01:55:03 -0400
Received: by mail-ua1-f66.google.com with SMTP id n63so1953810uan.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 17 Sep 2019 22:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=y2QteH55/uw8xk8TfmuiYN+/migIXlq/KzctUglrM54=;
        b=ZTzCiqaYpOrp0ONwQ69i00RMDXKtXW+333/D66kdMMwtU4pk/dBy11OhXpenQzl3sn
         k1e0a47AC36pgRFI/wo4QojzcRe9qWiyk9zhMZh6XduI1ubpuz1rtO470XjvpX9EJYfW
         1cFvudw3AV9kFHvdwWSsQ0LEJRXSknZoh8Frg93oytQJQiXJqif1aXRJQuSOoLASndIA
         /MpdlxoxejKi3eOLbqYAMXJuoAuQ4mSZpj58tJvd65bUNr4WwwjQquVd/rIu/Lj61dRi
         fl5OBUnmlRHTuwAAIFdFMxQxN89US3POI+KBhjjbLaFQN7/cT5kP7ZhxQH5L+UGoJSYG
         uITg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=y2QteH55/uw8xk8TfmuiYN+/migIXlq/KzctUglrM54=;
        b=Jr9CSN70tM3rZyCyAJAsbvG1gGhwFLQF6VFyFrHGVNt1vrmXTwguUzif1k3pkRVt7S
         DZAsgQFJeiSmxpJTPOgdUvTFoK5RNYr/RE8z/6EFw30cTTDHasCHE9aR+R5Yz/IVFCXC
         RuNpdYqaDGM1cEe9mRgw2yT3zBLchExCOAoF0COtDuRbuFLoDkb7QqgfYUyjY8w9TR+B
         KuU/cCKmCM/cMxKiyEX/2G6S1ipJRZX8Yu13wsuOfEiWv8RtxH6Ppwt9wxVSztFbASCS
         VufEFWYtG59lUxcfeq+RYM7DWc2Jz5KN9Hox1L6IC/lZ+E2ohLYxCprlHY2N1HyY0Rpw
         x/Nw==
X-Gm-Message-State: APjAAAW0/l8jUNe+txY/hKX0MjbzsRvW0a5nlL5ycH8esIPgUsMBYRln
        oczACVNB9/KVXg2xU4OZGsssjyj2mzghxO1BZ8GTcQ==
X-Google-Smtp-Source: APXvYqxVSjoCAGtAL9WPGwxmOzKzi+Hh0L/7NT0Jc3Riwg3+rEKL3k7t4hbVmV6sl4PaDOFROuRN2kPY+aBouz535AM=
X-Received: by 2002:ab0:d8f:: with SMTP id i15mr1363688uak.15.1568786101785;
 Tue, 17 Sep 2019 22:55:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190917225023.6035-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190917225023.6035-1-wsa+renesas@sang-engineering.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 18 Sep 2019 07:54:24 +0200
Message-ID: <CAPDyKFo=x2+x6zXwqNnMJEZJfwfEDaF2T+ow_MQMqAzNgf4D8w@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: fix hang up in HS400 timing mode selection
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 18 Sep 2019 at 00:50, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> From: Takeshi Saito <takeshi.saito.xv@renesas.com>
>
> In HS400 timing mode selection, SD clock is switched like:
>
> 1) HS200 (200MHz) for tuning
> 2) High Speed (<= 52MHz) for select HS400 mode (card)
> 3) HS400 (200MHz)
>
> The SDHI controller needs its internal SCC component for HS400 and other
> modes which need tuning. However, SCC gets only fed a clock when the
> module clk is > 100MHz. Make sure the SCC is always active with tuning
> by enforcing at least 100MHz. Note that we only change the module clock.
> An internal divider ensures that we will still talk to the card at
> 52MHz.
>
> Signed-off-by: Takeshi Saito <takeshi.saito.xv@renesas.com>
> [wsa: don't overwrite 'new_freq', use 'mmc_doing_retune', improve docs]
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Assuming you want this for stable as well, but perhaps we can also
find a commit to add a fixes tag? Do you have any suggestions for a
commit?

Kind regards
Uffe

> ---
>
> Shimoda-san: can you forward this patch to the BSP team to have a look,
> too? I needed to change their version of checking various MMC_TIMING_*
> constants because this approach did not work with current mainline for
> me. After some testing and researching, I think the solution with
> 'mmc_doing_retune' is not only working again, but also more future
> proof, in general.
>
>  drivers/mmc/host/renesas_sdhi.h               | 2 ++
>  drivers/mmc/host/renesas_sdhi_core.c          | 8 +++++++-
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 2 ++
>  3 files changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
> index c0504aa90857..33a1acc67cb4 100644
> --- a/drivers/mmc/host/renesas_sdhi.h
> +++ b/drivers/mmc/host/renesas_sdhi.h
> @@ -27,6 +27,7 @@ struct renesas_sdhi_of_data {
>         dma_addr_t dma_rx_offset;
>         unsigned int bus_shift;
>         int scc_offset;
> +       unsigned int scc_base_f_min;
>         struct renesas_sdhi_scc *taps;
>         int taps_num;
>         unsigned int max_blk_count;
> @@ -49,6 +50,7 @@ struct renesas_sdhi {
>         struct pinctrl *pinctrl;
>         struct pinctrl_state *pins_default, *pins_uhs;
>         void __iomem *scc_ctl;
> +       unsigned int scc_base_f_min;
>         u32 scc_tappos;
>         u32 scc_tappos_hs400;
>  };
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index 4a2872f49a60..82a492567016 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -120,16 +120,21 @@ static int renesas_sdhi_clk_enable(struct tmio_mmc_host *host)
>  }
>
>  static unsigned int renesas_sdhi_clk_update(struct tmio_mmc_host *host,
> -                                           unsigned int new_clock)
> +                                           unsigned int req_clock)
>  {
>         struct renesas_sdhi *priv = host_to_priv(host);
>         unsigned int freq, diff, best_freq = 0, diff_min = ~0;
> +       unsigned int new_clock = req_clock;
>         int i, ret;
>
>         /* tested only on R-Car Gen2+ currently; may work for others */
>         if (!(host->pdata->flags & TMIO_MMC_MIN_RCAR2))
>                 return clk_get_rate(priv->clk);
>
> +       /* When SCC is needed, make sure it gets a proper clock */
> +       if (mmc_doing_retune(host->mmc) && new_clock < priv->scc_base_f_min)
> +               new_clock = priv->scc_base_f_min;
> +
>         /*
>          * We want the bus clock to be as close as possible to, but no
>          * greater than, new_clock.  As we can divide by 1 << i for
> @@ -709,6 +714,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>                 mmc_data->max_segs = of_data->max_segs;
>                 dma_priv->dma_buswidth = of_data->dma_buswidth;
>                 host->bus_shift = of_data->bus_shift;
> +               priv->scc_base_f_min = of_data->scc_base_f_min;
>         }
>
>         host->write16_hook      = renesas_sdhi_write16_hook;
> diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> index 751fe91c7571..7010c524b180 100644
> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -109,6 +109,8 @@ static const struct renesas_sdhi_of_data of_rcar_gen3_compatible = {
>         .capabilities2  = MMC_CAP2_NO_WRITE_PROTECT,
>         .bus_shift      = 2,
>         .scc_offset     = 0x1000,
> +       /* SCC module clock (SDnH) is enabled at 100MHz or more */
> +       .scc_base_f_min = 100000000,
>         .taps           = rcar_gen3_scc_taps,
>         .taps_num       = ARRAY_SIZE(rcar_gen3_scc_taps),
>         /* DMAC can handle 32bit blk count but only 1 segment */
> --
> 2.20.1
>
