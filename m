Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14D9E42BA83
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Oct 2021 10:34:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238522AbhJMIgG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Oct 2021 04:36:06 -0400
Received: from mail-ua1-f48.google.com ([209.85.222.48]:33367 "EHLO
        mail-ua1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233965AbhJMIgF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Oct 2021 04:36:05 -0400
Received: by mail-ua1-f48.google.com with SMTP id i15so3065100uap.0;
        Wed, 13 Oct 2021 01:34:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l0RRw7xVwNpsAY02+ArhU1yvtoPb5CrI3VDg630/yPA=;
        b=2CnWaP2/16Cjj0584CteIi0dMUWMTHDtaDrhDS5zk6PtFtctbu1PAv3QSjkrOCbYbP
         HkGZ+hw2BJrOR/9VX8Opl1VhaSSWCBjCNVP7Vm+P424Wv9GB9JOJaOEyppL08WPsCyE5
         OTrx6R1iMQGz5FVoeIJAjSqG1CDCBWeqcfLiRPO/JKbr62klP9nkWmMNYv+08aEJkmg8
         dAv+wDe9CI+OAohLzOtZycm9uZtjT94pEVsPz5JR1LKNyhIc34wY6uVx90SLT1WcpQ7l
         sZni3Fa+onM8KCBpKl/ZQJgICOSt8agInKLR3XqWcIyBvYUbMuAaVFPmOhS11mkmxWSE
         B6ng==
X-Gm-Message-State: AOAM531ly69iKluPw87xd09mANS4G91zRHxzzPB3avXwGug1iUx8E5Vd
        milYTFDFzlhGMHXGKTJpwRpzkAXdTdASGcnf3i8=
X-Google-Smtp-Source: ABdhPJz8vAjVyFzbQZQfzWhoBtw54N4Dh37trBEyZCu0OliGre0gadpho8UeiffgHtQ5sHdjrWNiu52vneuqRScceSQ=
X-Received: by 2002:a05:6102:290c:: with SMTP id cz12mr15801153vsb.35.1634114041966;
 Wed, 13 Oct 2021 01:34:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210928200804.50922-1-wsa+renesas@sang-engineering.com> <20210928200804.50922-5-wsa+renesas@sang-engineering.com>
In-Reply-To: <20210928200804.50922-5-wsa+renesas@sang-engineering.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 13 Oct 2021 10:33:50 +0200
Message-ID: <CAMuHMdUdjNXkW-F0-aPR-o6uQaHsYz=yKf6RhC2tvxRpdhDzhw@mail.gmail.com>
Subject: Re: [RFC PATCH 4/9] clk: renesas: gen3: switch to new SD clock handling
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Wolfram,

clk: renesas: rcar-gen3: ...

Thanks for your patch!

On Tue, Sep 28, 2021 at 10:08 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> The old SD handling code was huge and could not handle all the details
> which showed up on R-Car Gen3 SoCs meanwhile. It is time to switch to
> another design. Have SDnH a seperate clock, use the existing divider

separate  (as checkpatch told me ;-)

> clocks and move the errata handling from the clock driver to the SDHI
> driver where it belongs.
>
> This patch removes the old SD handling code and switch to the new one.
> This updates the SDHI driver at the same time. Because the SDHI driver
> can only communitcate with the clock driver via clk_set_rate(), I don't

communicate (as Gmail composer told me ;-)

> see an alternative to this flag-day-approach, so we cross subsystems
> here.
>
> The patch sadly looks messy for the CPG lib, but it is basically a huge
> chunk of code removed and smaller chunks added. It looks much better
> when you just view the resulting source file.

Indeed, the end result is pretty neat.
BTW, the diff looks much better with the --histogram option of
git diff/show.

> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

> --- a/drivers/clk/renesas/rcar-cpg-lib.c
> +++ b/drivers/clk/renesas/rcar-cpg-lib.c

> -static int cpg_sd_clock_set_rate(struct clk_hw *hw, unsigned long rate,
> -                                unsigned long parent_rate)
> +struct clk * __init cpg_sdh_clk_register(const char *name,
> +       void __iomem *sdnckcr, const char *parent_name,
> +       struct raw_notifier_head *notifiers)
>  {
> -       struct sd_clock *clock = to_sd_clock(hw);
> -       unsigned int i;
> -
> -       for (i = 0; i < clock->div_num; i++)
> -               if (rate == DIV_ROUND_CLOSEST(parent_rate,
> -                                             clock->div_table[i].div))
> -                       break;
> +       struct cpg_simple_notifier *csn;
> +       struct clk *clk;
>
> -       if (i >= clock->div_num)
> -               return -EINVAL;
> +       csn = kzalloc(sizeof(*csn), GFP_KERNEL);
> +       if (!csn)
> +               return ERR_PTR(-ENOMEM);
>
> -       clock->cur_div_idx = i;
> +       csn->reg = sdnckcr;
>
> -       cpg_reg_modify(clock->csn.reg, CPG_SD_STP_MASK | CPG_SD_FC_MASK,
> -                      clock->div_table[i].val &
> -                      (CPG_SD_STP_MASK | CPG_SD_FC_MASK));
> +       clk = clk_register_divider_table(NULL, name, parent_name, 0, sdnckcr,
> +                                        SDnSRCFC_SHIFT, 8, 0, cpg_sdh_div_table,
> +                                        &cpg_lock);
> +       if (IS_ERR(clk))
> +               return clk;

Missing "kfree(csn)".

>
> -       return 0;
> +       cpg_simple_notifier_register(notifiers, csn);
> +       return clk;
>  }

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

So the SDn clock can no longer be disabled, as CPG_SD_STP_CK
handling is gone?

>  }

> --- a/drivers/mmc/host/renesas_sdhi_core.c
> +++ b/drivers/mmc/host/renesas_sdhi_core.c

> @@ -141,6 +143,16 @@ static unsigned int renesas_sdhi_clk_update(struct tmio_mmc_host *host,
>         if (!(host->pdata->flags & TMIO_MMC_MIN_RCAR2) || mmc_doing_tune(host->mmc))
>                 return clk_get_rate(priv->clk);
>
> +       if (priv->clkh) {
> +               bool use_4tap = priv->quirks && priv->quirks->hs400_4taps;
> +               bool need_slow_clkh = (host->mmc->ios.timing == MMC_TIMING_UHS_SDR104) ||
> +                                     (host->mmc->ios.timing == MMC_TIMING_MMC_HS400);
> +               clkh_mult = use_4tap && need_slow_clkh ? 2 : 4;
> +               ref_clk = priv->clkh;
> +       }
> +
> +       new_clock = wanted_clock * clkh_mult;
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
> +       if (ref_clk == priv->clkh)

"if (priv->clkh)", for consistency with above?

> +               clk_set_rate(priv->clk, best_freq / clkh_mult);
>
>         return clk_get_rate(priv->clk);
>  }
> @@ -908,6 +922,10 @@ int renesas_sdhi_probe(struct platform_device *pdev,
>                 return ret;
>         }
>
> +       /* Fallback for old DTs */
> +       if (of_device_is_compatible(pdev->dev.of_node, "renesas,rcar-gen3-sdhi"))

I think it would be cleaner to check a flag in struct
renesas_sdhi_of_data instead.

> +               priv->clkh = clk_get_parent(clk_get_parent(priv->clk));
> +
>         /*
>          * Some controllers provide a 2nd clock just to run the internal card
>          * detection logic. Unfortunately, the existing driver architecture does

The core looks good to me, but I have to admit I'm no expert on the
SDHn/SDn clock relations and the various SDHI transfer modes.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
