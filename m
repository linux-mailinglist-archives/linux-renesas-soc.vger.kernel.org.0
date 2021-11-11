Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A78044D44F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Nov 2021 10:49:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232256AbhKKJvt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 11 Nov 2021 04:51:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229668AbhKKJvs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 11 Nov 2021 04:51:48 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DD48C061767
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Nov 2021 01:48:57 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id p16so12867780lfa.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 11 Nov 2021 01:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0E1f2qskJYUU0+ZWS4CVdtoQJCyw+DGDSmgQKddyiZ8=;
        b=Ebqtu5Cv3WRxiowhxY3za9FWsJEGwXahM55U97yVuv8WUEHgk6lMdqe3u8nutdLXS1
         fwfd6GrbnaZqXwV4e83yEFGOFnA/5eR3RSRk9/cQwwiIyd9wsF5egbtrLxaS5BvQ3+v/
         bBkwCmD22Q6faJC3iqEAHj28LUTV7zUr+M17G3hAk8+sCrajMnxxSvAIaUi1VtMJcbAQ
         eDhs+WrQKW4jWYMfze0CxsDXKRftE+2mJ3/qs+f+ZGeqgPE+5JLL0E9FeJtDdsF03KRl
         dGliLpKvbSsbpecE58b0O1lrnei2WDRhy0YDtGn4rRvkS3P7fbt4oEc7SWIbY4cum4d2
         MHTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0E1f2qskJYUU0+ZWS4CVdtoQJCyw+DGDSmgQKddyiZ8=;
        b=GdExCjX2pNSp5Idz98MZ+rJqU/4dWlDkyW1EQTbC3q21A0SuwApdKS+iWA0w14XmiK
         WHjIr8qszXnFfwAtVZvaujZEKCoCk2q8kKIxJ5gSz73+D63XgTIUOm+z+Qp42OZ9dPEi
         wwZl+3azGiE3TCLT6yWYoCP+1iB1s8Rg08EGog/V+LfT6mVdzlCHbDAXfMGprjBs1myn
         kKk/l5NT/WwE0b2U5cG5fn7DKL7Yv1MsZPbv+p8ti+Q4bMq5UGj9JeZ/mKvubdQmdWxR
         +j7HXTp0BR/lDPD3VDdrQotiwREDQ+MPDK3H9Uq3A8hizFl7cpdsCxvfdrt9ei5f0pYT
         yASA==
X-Gm-Message-State: AOAM531bYGneVxkdKFsfyaYePvXJOsHozIDYR7ctSjml4GF3T9jGty4+
        IC8RXGbhpb/5L4QQ6fbHgtkH0nevJ6rY/KgVQPbebg==
X-Google-Smtp-Source: ABdhPJx+AQ6WzONWp3P02+P31BY4PH/jJ0BypdBwr0IXcdDwOPqaI+E6Lb2akBkTj8jOiEkTMB+KVzDMoMfVwHpbkrA=
X-Received: by 2002:ac2:5a46:: with SMTP id r6mr5720938lfn.358.1636624135181;
 Thu, 11 Nov 2021 01:48:55 -0800 (PST)
MIME-Version: 1.0
References: <20211110191610.5664-1-wsa+renesas@sang-engineering.com> <20211110191610.5664-6-wsa+renesas@sang-engineering.com>
In-Reply-To: <20211110191610.5664-6-wsa+renesas@sang-engineering.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 11 Nov 2021 10:48:19 +0100
Message-ID: <CAPDyKFogEEoB5+LcCrgnyNCPZzY3JH+r-pStg6dmYxYuEP9nGQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 05/21] clk: renesas: rcar-gen3: switch to new SD
 clock handling
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
> The old SD handling code was huge and could not handle all the details
> which showed up on R-Car Gen3 SoCs meanwhile. It is time to switch to
> another design. Have SDnH a separate clock, use the existing divider
> clocks and move the errata handling from the clock driver to the SDHI
> driver where it belongs.
>
> This patch removes the old SD handling code and switch to the new one.
> This updates the SDHI driver at the same time. Because the SDHI driver
> can only communicate with the clock driver via clk_set_rate(), I don't
> see an alternative to this flag-day-approach, so we cross subsystems
> here.
>
> The patch sadly looks messy for the CPG lib, but it is basically a huge
> chunk of code removed and smaller chunks added. It looks much better
> when you just view the resulting source file.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> Changes since RFC v1:
> * fixed typos in commit message
> * switched to a flag instead of checking compatible for the fallback
>   mechanisam
> * used bitshift instead of multiplication for the clkh factor
> * fixed a memleak
> * simplified an if condition
> * fixed the subject prefix
>
>  drivers/clk/renesas/r8a779a0-cpg-mssr.c |   6 +-
>  drivers/clk/renesas/rcar-cpg-lib.c      | 220 +++---------------------
>  drivers/clk/renesas/rcar-cpg-lib.h      |   3 +-
>  drivers/clk/renesas/rcar-gen3-cpg.c     |   5 +-
>  drivers/mmc/host/renesas_sdhi.h         |   1 +
>  drivers/mmc/host/renesas_sdhi_core.c    |  28 ++-
>  6 files changed, 56 insertions(+), 207 deletions(-)

Acked-by: Ulf Hansson <ulf.hansson@linaro.org> # For MMC

Kind regards
Uffe


>
> diff --git a/drivers/clk/renesas/r8a779a0-cpg-mssr.c b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
> index fb7f0cf2654a..6531f23a4bea 100644
> --- a/drivers/clk/renesas/r8a779a0-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a779a0-cpg-mssr.c
> @@ -303,10 +303,8 @@ static struct clk * __init rcar_r8a779a0_cpg_clk_register(struct device *dev,
>                                            __clk_get_name(parent), notifiers);
>
>         case CLK_TYPE_R8A779A0_SD:
> -               return cpg_sd_clk_register(core->name, base, core->offset,
> -                                          __clk_get_name(parent), notifiers,
> -                                          false);
> -               break;
> +               return cpg_sd_clk_register(core->name, base + core->offset,
> +                                          __clk_get_name(parent));
>
>         case CLK_TYPE_R8A779A0_MDSEL:
>                 /*
> diff --git a/drivers/clk/renesas/rcar-cpg-lib.c b/drivers/clk/renesas/rcar-cpg-lib.c
> index 351cb9c04f5c..bec8358b599c 100644
> --- a/drivers/clk/renesas/rcar-cpg-lib.c
> +++ b/drivers/clk/renesas/rcar-cpg-lib.c
> @@ -66,214 +66,48 @@ void cpg_simple_notifier_register(struct raw_notifier_head *notifiers,
>   * SDn Clock
>   */
>
> -struct clk * __init cpg_sdh_clk_register(const char *name,
> -       void __iomem *sdnckcr, const char *parent_name,
> -       struct raw_notifier_head *notifiers)
> -{
> -       /* placeholder during transition */
> -       return clk_register_fixed_factor(NULL, name, parent_name, 0, 1, 1);
> -}
> -
> -#define CPG_SD_STP_HCK         BIT(9)
> -#define CPG_SD_STP_CK          BIT(8)
> -
> -#define CPG_SD_STP_MASK                (CPG_SD_STP_HCK | CPG_SD_STP_CK)
> -#define CPG_SD_FC_MASK         (0x7 << 2 | 0x3 << 0)
> -
> -#define CPG_SD_DIV_TABLE_DATA(stp_hck, sd_srcfc, sd_fc, sd_div) \
> -{ \
> -       .val = ((stp_hck) ? CPG_SD_STP_HCK : 0) | \
> -              ((sd_srcfc) << 2) | \
> -              ((sd_fc) << 0), \
> -       .div = (sd_div), \
> -}
> -
> -struct sd_div_table {
> -       u32 val;
> -       unsigned int div;
> -};
> +#define SDnSRCFC_SHIFT 2
> +#define STPnHCK        BIT(9 - SDnSRCFC_SHIFT)
>
> -struct sd_clock {
> -       struct clk_hw hw;
> -       const struct sd_div_table *div_table;
> -       struct cpg_simple_notifier csn;
> -       unsigned int div_num;
> -       unsigned int cur_div_idx;
> -};
> -
> -/* SDn divider
> - *           sd_srcfc   sd_fc   div
> - * stp_hck   (div)      (div)     = sd_srcfc x sd_fc
> - *---------------------------------------------------------
> - *  0         0 (1)      1 (4)      4 : SDR104 / HS200 / HS400 (8 TAP)
> - *  0         1 (2)      1 (4)      8 : SDR50
> - *  1         2 (4)      1 (4)     16 : HS / SDR25
> - *  1         3 (8)      1 (4)     32 : NS / SDR12
> - *  1         4 (16)     1 (4)     64
> - *  0         0 (1)      0 (2)      2
> - *  0         1 (2)      0 (2)      4 : SDR104 / HS200 / HS400 (4 TAP)
> - *  1         2 (4)      0 (2)      8
> - *  1         3 (8)      0 (2)     16
> - *  1         4 (16)     0 (2)     32
> - *
> - *  NOTE: There is a quirk option to ignore the first row of the dividers
> - *  table when searching for suitable settings. This is because HS400 on
> - *  early ES versions of H3 and M3-W requires a specific setting to work.
> - */
> -static const struct sd_div_table cpg_sd_div_table[] = {
> -/*     CPG_SD_DIV_TABLE_DATA(stp_hck,  sd_srcfc,   sd_fc,  sd_div) */
> -       CPG_SD_DIV_TABLE_DATA(0,        0,          1,        4),
> -       CPG_SD_DIV_TABLE_DATA(0,        1,          1,        8),
> -       CPG_SD_DIV_TABLE_DATA(1,        2,          1,       16),
> -       CPG_SD_DIV_TABLE_DATA(1,        3,          1,       32),
> -       CPG_SD_DIV_TABLE_DATA(1,        4,          1,       64),
> -       CPG_SD_DIV_TABLE_DATA(0,        0,          0,        2),
> -       CPG_SD_DIV_TABLE_DATA(0,        1,          0,        4),
> -       CPG_SD_DIV_TABLE_DATA(1,        2,          0,        8),
> -       CPG_SD_DIV_TABLE_DATA(1,        3,          0,       16),
> -       CPG_SD_DIV_TABLE_DATA(1,        4,          0,       32),
> +static const struct clk_div_table cpg_sdh_div_table[] = {
> +       { 0, 1 }, { 1, 2 }, { STPnHCK | 2, 4 }, { STPnHCK | 3, 8 },
> +       { STPnHCK | 4, 16 }, { 0, 0 },
>  };
>
> -#define to_sd_clock(_hw) container_of(_hw, struct sd_clock, hw)
> -
> -static int cpg_sd_clock_enable(struct clk_hw *hw)
> -{
> -       struct sd_clock *clock = to_sd_clock(hw);
> -
> -       cpg_reg_modify(clock->csn.reg, CPG_SD_STP_MASK,
> -                      clock->div_table[clock->cur_div_idx].val &
> -                      CPG_SD_STP_MASK);
> -
> -       return 0;
> -}
> -
> -static void cpg_sd_clock_disable(struct clk_hw *hw)
> -{
> -       struct sd_clock *clock = to_sd_clock(hw);
> -
> -       cpg_reg_modify(clock->csn.reg, 0, CPG_SD_STP_MASK);
> -}
> -
> -static int cpg_sd_clock_is_enabled(struct clk_hw *hw)
> -{
> -       struct sd_clock *clock = to_sd_clock(hw);
> -
> -       return !(readl(clock->csn.reg) & CPG_SD_STP_MASK);
> -}
> -
> -static unsigned long cpg_sd_clock_recalc_rate(struct clk_hw *hw,
> -                                               unsigned long parent_rate)
> +struct clk * __init cpg_sdh_clk_register(const char *name,
> +       void __iomem *sdnckcr, const char *parent_name,
> +       struct raw_notifier_head *notifiers)
>  {
> -       struct sd_clock *clock = to_sd_clock(hw);
> -
> -       return DIV_ROUND_CLOSEST(parent_rate,
> -                                clock->div_table[clock->cur_div_idx].div);
> -}
> +       struct cpg_simple_notifier *csn;
> +       struct clk *clk;
>
> -static int cpg_sd_clock_determine_rate(struct clk_hw *hw,
> -                                      struct clk_rate_request *req)
> -{
> -       unsigned long best_rate = ULONG_MAX, diff_min = ULONG_MAX;
> -       struct sd_clock *clock = to_sd_clock(hw);
> -       unsigned long calc_rate, diff;
> -       unsigned int i;
> +       csn = kzalloc(sizeof(*csn), GFP_KERNEL);
> +       if (!csn)
> +               return ERR_PTR(-ENOMEM);
>
> -       for (i = 0; i < clock->div_num; i++) {
> -               calc_rate = DIV_ROUND_CLOSEST(req->best_parent_rate,
> -                                             clock->div_table[i].div);
> -               if (calc_rate < req->min_rate || calc_rate > req->max_rate)
> -                       continue;
> +       csn->reg = sdnckcr;
>
> -               diff = calc_rate > req->rate ? calc_rate - req->rate
> -                                            : req->rate - calc_rate;
> -               if (diff < diff_min) {
> -                       best_rate = calc_rate;
> -                       diff_min = diff;
> -               }
> +       clk = clk_register_divider_table(NULL, name, parent_name, 0, sdnckcr,
> +                                        SDnSRCFC_SHIFT, 8, 0, cpg_sdh_div_table,
> +                                        &cpg_lock);
> +       if (IS_ERR(clk)) {
> +               kfree(csn);
> +               return clk;
>         }
>
> -       if (best_rate == ULONG_MAX)
> -               return -EINVAL;
> -
> -       req->rate = best_rate;
> -       return 0;
> -}
> -
> -static int cpg_sd_clock_set_rate(struct clk_hw *hw, unsigned long rate,
> -                                unsigned long parent_rate)
> -{
> -       struct sd_clock *clock = to_sd_clock(hw);
> -       unsigned int i;
> -
> -       for (i = 0; i < clock->div_num; i++)
> -               if (rate == DIV_ROUND_CLOSEST(parent_rate,
> -                                             clock->div_table[i].div))
> -                       break;
> -
> -       if (i >= clock->div_num)
> -               return -EINVAL;
> -
> -       clock->cur_div_idx = i;
> -
> -       cpg_reg_modify(clock->csn.reg, CPG_SD_STP_MASK | CPG_SD_FC_MASK,
> -                      clock->div_table[i].val &
> -                      (CPG_SD_STP_MASK | CPG_SD_FC_MASK));
> -
> -       return 0;
> +       cpg_simple_notifier_register(notifiers, csn);
> +       return clk;
>  }
>
> -static const struct clk_ops cpg_sd_clock_ops = {
> -       .enable = cpg_sd_clock_enable,
> -       .disable = cpg_sd_clock_disable,
> -       .is_enabled = cpg_sd_clock_is_enabled,
> -       .recalc_rate = cpg_sd_clock_recalc_rate,
> -       .determine_rate = cpg_sd_clock_determine_rate,
> -       .set_rate = cpg_sd_clock_set_rate,
> +static const struct clk_div_table cpg_sd_div_table[] = {
> +       { 0, 2 }, { 1, 4 }, { 0, 0 },
>  };
>
>  struct clk * __init cpg_sd_clk_register(const char *name,
> -       void __iomem *base, unsigned int offset, const char *parent_name,
> -       struct raw_notifier_head *notifiers, bool skip_first)
> +       void __iomem *sdnckcr, const char *parent_name)
>  {
> -       struct clk_init_data init = {};
> -       struct sd_clock *clock;
> -       struct clk *clk;
> -       u32 val;
> -
> -       clock = kzalloc(sizeof(*clock), GFP_KERNEL);
> -       if (!clock)
> -               return ERR_PTR(-ENOMEM);
> -
> -       init.name = name;
> -       init.ops = &cpg_sd_clock_ops;
> -       init.flags = CLK_SET_RATE_PARENT;
> -       init.parent_names = &parent_name;
> -       init.num_parents = 1;
> -
> -       clock->csn.reg = base + offset;
> -       clock->hw.init = &init;
> -       clock->div_table = cpg_sd_div_table;
> -       clock->div_num = ARRAY_SIZE(cpg_sd_div_table);
> -
> -       if (skip_first) {
> -               clock->div_table++;
> -               clock->div_num--;
> -       }
> -
> -       val = readl(clock->csn.reg) & ~CPG_SD_FC_MASK;
> -       val |= CPG_SD_STP_MASK | (clock->div_table[0].val & CPG_SD_FC_MASK);
> -       writel(val, clock->csn.reg);
> -
> -       clk = clk_register(NULL, &clock->hw);
> -       if (IS_ERR(clk))
> -               goto free_clock;
> -
> -       cpg_simple_notifier_register(notifiers, &clock->csn);
> -       return clk;
> -
> -free_clock:
> -       kfree(clock);
> -       return clk;
> +       return clk_register_divider_table(NULL, name, parent_name, 0, sdnckcr,
> +                                         0, 2, 0, cpg_sd_div_table, &cpg_lock);
>  }
>
>
> diff --git a/drivers/clk/renesas/rcar-cpg-lib.h b/drivers/clk/renesas/rcar-cpg-lib.h
> index 548cb9562f35..0941c95a3006 100644
> --- a/drivers/clk/renesas/rcar-cpg-lib.h
> +++ b/drivers/clk/renesas/rcar-cpg-lib.h
> @@ -31,7 +31,6 @@ struct clk * __init cpg_sdh_clk_register(const char *name,
>         struct raw_notifier_head *notifiers);
>
>  struct clk * __init cpg_sd_clk_register(const char *name,
> -       void __iomem *base, unsigned int offset, const char *parent_name,
> -       struct raw_notifier_head *notifiers, bool skip_first);
> +       void __iomem *sdnckcr, const char *parent_name);
>
>  #endif
> diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
> index 182b189bc8f4..aa0797b98e89 100644
> --- a/drivers/clk/renesas/rcar-gen3-cpg.c
> +++ b/drivers/clk/renesas/rcar-gen3-cpg.c
> @@ -491,9 +491,8 @@ struct clk * __init rcar_gen3_cpg_clk_register(struct device *dev,
>                                            __clk_get_name(parent), notifiers);
>
>         case CLK_TYPE_GEN3_SD:
> -               return cpg_sd_clk_register(core->name, base, core->offset,
> -                                          __clk_get_name(parent), notifiers,
> -                                          cpg_quirks & SD_SKIP_FIRST);
> +               return cpg_sd_clk_register(core->name, base + core->offset,
> +                                          __clk_get_name(parent));
>
>         case CLK_TYPE_GEN3_R:
>                 if (cpg_quirks & RCKCR_CKSEL) {
> diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
> index cd82420677cc..66d308e73e17 100644
> --- a/drivers/mmc/host/renesas_sdhi.h
> +++ b/drivers/mmc/host/renesas_sdhi.h
> @@ -60,6 +60,7 @@ struct tmio_mmc_dma {
>
>  struct renesas_sdhi {
>         struct clk *clk;
> +       struct clk *clkh;
>         struct clk *clk_cd;
>         struct tmio_mmc_data mmc_data;
>         struct tmio_mmc_dma dma_priv;
> diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
> index 6fc4cf3c9dce..4572242f9816 100644
> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c
> @@ -127,10 +127,12 @@ static int renesas_sdhi_clk_enable(struct tmio_mmc_host *host)
>  }
>
>  static unsigned int renesas_sdhi_clk_update(struct tmio_mmc_host *host,
> -                                           unsigned int new_clock)
> +                                           unsigned int wanted_clock)
>  {
>         struct renesas_sdhi *priv = host_to_priv(host);
> +       struct clk *ref_clk = priv->clk;
>         unsigned int freq, diff, best_freq = 0, diff_min = ~0;
> +       unsigned int new_clock, clkh_shift = 0;
>         int i;
>
>         /*
> @@ -141,6 +143,16 @@ static unsigned int renesas_sdhi_clk_update(struct tmio_mmc_host *host,
>         if (!(host->pdata->flags & TMIO_MMC_MIN_RCAR2) || mmc_doing_tune(host->mmc))
>                 return clk_get_rate(priv->clk);
>
> +       if (priv->clkh) {
> +               bool use_4tap = priv->quirks && priv->quirks->hs400_4taps;
> +               bool need_slow_clkh = (host->mmc->ios.timing == MMC_TIMING_UHS_SDR104) ||
> +                                     (host->mmc->ios.timing == MMC_TIMING_MMC_HS400);
> +               clkh_shift = use_4tap && need_slow_clkh ? 1 : 2;
> +               ref_clk = priv->clkh;
> +       }
> +
> +       new_clock = wanted_clock << clkh_shift;
> +
>         /*
>          * We want the bus clock to be as close as possible to, but no
>          * greater than, new_clock.  As we can divide by 1 << i for
> @@ -148,11 +160,10 @@ static unsigned int renesas_sdhi_clk_update(struct tmio_mmc_host *host,
>          * possible, but no greater than, new_clock << i.
>          */
>         for (i = min(9, ilog2(UINT_MAX / new_clock)); i >= 0; i--) {
> -               freq = clk_round_rate(priv->clk, new_clock << i);
> +               freq = clk_round_rate(ref_clk, new_clock << i);
>                 if (freq > (new_clock << i)) {
>                         /* Too fast; look for a slightly slower option */
> -                       freq = clk_round_rate(priv->clk,
> -                                             (new_clock << i) / 4 * 3);
> +                       freq = clk_round_rate(ref_clk, (new_clock << i) / 4 * 3);
>                         if (freq > (new_clock << i))
>                                 continue;
>                 }
> @@ -164,7 +175,10 @@ static unsigned int renesas_sdhi_clk_update(struct tmio_mmc_host *host,
>                 }
>         }
>
> -       clk_set_rate(priv->clk, best_freq);
> +       clk_set_rate(ref_clk, best_freq);
> +
> +       if (priv->clkh)
> +               clk_set_rate(priv->clk, best_freq >> clkh_shift);
>
>         return clk_get_rate(priv->clk);
>  }
> @@ -945,6 +959,10 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>                 mmc_data->max_segs = of_data->max_segs;
>                 dma_priv->dma_buswidth = of_data->dma_buswidth;
>                 host->bus_shift = of_data->bus_shift;
> +               /* Fallback for old DTs */
> +               if (of_data->sdhi_flags & SDHI_FLAG_NEED_CLKH_FALLBACK)
> +                       priv->clkh = clk_get_parent(clk_get_parent(priv->clk));
> +
>         }
>
>         host->write16_hook      = renesas_sdhi_write16_hook;
> --
> 2.30.2
>
