Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F9094A96F9
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Feb 2022 10:40:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357376AbiBDJkx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Feb 2022 04:40:53 -0500
Received: from mail-ua1-f46.google.com ([209.85.222.46]:39909 "EHLO
        mail-ua1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235827AbiBDJkx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Feb 2022 04:40:53 -0500
Received: by mail-ua1-f46.google.com with SMTP id p7so9858159uao.6;
        Fri, 04 Feb 2022 01:40:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KT45snKITe2RxAHRI+siG8UPrDmGaNxrrqOiuVMfhNc=;
        b=PvjRhJBzKyu+oDR6SjebRsB6uZUCp9ECh/YoF8FRHipv1QCKO5ctyzEPJ1qnnM8Fzn
         tiotarDApGSSIiDAIm+B/+0jMRZaFu8sVKD0O1lG7l2uBVbGrQpnArZsQJ2oqEI0ipYI
         QHp61Rtyq616noUbmcNCifcg1dWo8tiOAm/QqpekRW59FbI2SF44kfOS6fsZIXtfZMu8
         7JswICvOnBMbz5wWP/kJFRiCyjOn3+l5l44ZequjHp+NPtWXGwwhAx/28bvXHWJSxvEB
         AI54yApwDyR3dxAeQkLhHBioUYkkm6VrBzaP46prXPh/tYVKefx0EKK+c74g/mRdV8++
         kwbg==
X-Gm-Message-State: AOAM5300QaTxZ0VfGyG2z9Xtpaw+YCvpv/s7wbMLThZWG6V2ZuMTw4i4
        7C02SE6cOuOPas0uBRhDsg+F3hoFrvH7bQ==
X-Google-Smtp-Source: ABdhPJxSBYtTjoi/xOoBPYmcfkGK8qvP/fX9mMByrYStpJkTkHdl/NEUfhyl7vYLZSIHp9ZnrM2VAw==
X-Received: by 2002:a05:6102:32cc:: with SMTP id o12mr530780vss.39.1643967652192;
        Fri, 04 Feb 2022 01:40:52 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id s12sm291581vsn.29.2022.02.04.01.40.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Feb 2022 01:40:51 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id w21so9842284uan.7;
        Fri, 04 Feb 2022 01:40:51 -0800 (PST)
X-Received: by 2002:a67:fd63:: with SMTP id h3mr580169vsa.77.1643967651499;
 Fri, 04 Feb 2022 01:40:51 -0800 (PST)
MIME-Version: 1.0
References: <20220203165130.7206-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220203165130.7206-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 4 Feb 2022 10:40:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWahedJivtbT3USgzgmiT-9+hkyvjAPsMNr8jGHt2quPw@mail.gmail.com>
Message-ID: <CAMuHMdWahedJivtbT3USgzgmiT-9+hkyvjAPsMNr8jGHt2quPw@mail.gmail.com>
Subject: Re: [PATCH v3] clk: renesas: rzg2l-cpg: Add support for RZ/V2L SoC
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Thu, Feb 3, 2022 at 5:51 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> The clock structure for RZ/V2L is almost identical to RZ/G2L SoC. The only
> difference being RZ/V2L has additional registers to control the clock and
> reset for the DRP-AI block.
>
> This patch reuses r9a07g044-cpg.c, as the common clock IDS are the same
> between RZ/G2L and RZ/V2L and adding a separate r9a07g054_cpg_info to
> take care of DRP-AI clocks.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3:
> * reuse r9a07g044-cpg.c for RZ/V2L

Thanks for the update!

> --- a/drivers/clk/renesas/r9a07g044-cpg.c
> +++ b/drivers/clk/renesas/r9a07g044-cpg.c
> @@ -11,12 +11,13 @@
>  #include <linux/kernel.h>
>
>  #include <dt-bindings/clock/r9a07g044-cpg.h>
> +#include <dt-bindings/clock/r9a07g054-cpg.h>
>
>  #include "rzg2l-cpg.h"
>
>  enum clk_ids {
>         /* Core Clock Outputs exported to DT */
> -       LAST_DT_CORE_CLK = R9A07G044_CLK_P0_DIV2,
> +       LAST_DT_CORE_CLK = R9A07G054_CLK_DRP_A,
>
>         /* External Input Clocks */
>         CLK_EXTAL,
> @@ -149,131 +150,142 @@ static const struct cpg_core_clk r9a07g044_core_clks[] __initconst = {
>                 CLK_DIVIDER_HIWORD_MASK),
>  };
>
> -static struct rzg2l_mod_clk r9a07g044_mod_clks[] = {

[...]

> +static const struct {
> +       struct rzg2l_mod_clk common[62];
> +#ifdef CONFIG_CLK_R9A07G054
> +       struct rzg2l_mod_clk drp[0];
> +#endif
> +} mod_clks = {

[...]

> +       },
> +#ifdef CONFIG_CLK_R9A07G054
> +       .drp = {
> +       },
> +#endif
>  };

You should do the common/drp split for core clocks and resets, too.
It doesn't matter that much now, as currently no drp clocks or
resets are handled yet, but doing it now avoids confusion, and makes
it clear what is the future plan.

> @@ -346,11 +358,34 @@ const struct rzg2l_cpg_info r9a07g044_cpg_info = {
>         .num_crit_mod_clks = ARRAY_SIZE(r9a07g044_crit_mod_clks),
>
>         /* Module Clocks */
> -       .mod_clks = r9a07g044_mod_clks,
> -       .num_mod_clks = ARRAY_SIZE(r9a07g044_mod_clks),
> +       .mod_clks = mod_clks.common,
> +       .num_mod_clks = ARRAY_SIZE(mod_clks.common),
>         .num_hw_mod_clks = R9A07G044_TSU_PCLK + 1,
>
>         /* Resets */
>         .resets = r9a07g044_resets,
>         .num_resets = ARRAY_SIZE(r9a07g044_resets),
>  };
> +
> +#ifdef CONFIG_CLK_R9A07G054
> +const struct rzg2l_cpg_info r9a07g054_cpg_info = {
> +       /* Core Clocks */
> +       .core_clks = r9a07g044_core_clks,
> +       .num_core_clks = ARRAY_SIZE(r9a07g044_core_clks),
> +       .last_dt_core_clk = LAST_DT_CORE_CLK,
> +       .num_total_core_clks = MOD_CLK_BASE,
> +
> +       /* Critical Module Clocks */
> +       .crit_mod_clks = r9a07g044_crit_mod_clks,
> +       .num_crit_mod_clks = ARRAY_SIZE(r9a07g044_crit_mod_clks),
> +
> +       /* Module Clocks */
> +       .mod_clks = mod_clks.common,
> +       .num_mod_clks = ARRAY_SIZE(mod_clks.common) + ARRAY_SIZE(mod_clks.drp),
> +       .num_hw_mod_clks = R9A07G054_STPAI_ACLK_DRP + 1,
> +
> +       /* Resets */
> +       .resets = r9a07g044_resets,
> +       .num_resets = ARRAY_SIZE(r9a07g044_resets),
> +};
> +#endif

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
