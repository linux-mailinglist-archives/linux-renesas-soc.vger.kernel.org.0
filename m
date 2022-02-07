Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C1434AC1D7
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Feb 2022 15:49:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1441901AbiBGOqZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Feb 2022 09:46:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1392128AbiBGOYB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Feb 2022 09:24:01 -0500
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BE5FC0401C8;
        Mon,  7 Feb 2022 06:24:00 -0800 (PST)
Received: by mail-ua1-f51.google.com with SMTP id g18so12902397uak.5;
        Mon, 07 Feb 2022 06:24:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tBG65btqjKnrtOXYzj97x0Tpp2FieJYY+mjia0/4uaI=;
        b=pEB5loNS1akCKmsNwgGN01JFliEJm6zTZWjvLPJE2Oj/+wg1Y38dSykqp9Fx6YpZHd
         sscLTZF7tTPfp2xDZQLHT8agTrX2WyC9mCLxa0ETqCGZ1vkYRlsBDzoYNKeRRKqRp9QR
         ITZR7I7LO9UI9UU7jDudi11b/S3BNinsAyI+lpJqg42lSIVQoXoNUo8PgdGIgTZgXB4T
         0MYeXiRJ9GeLoWeWbphMXNfqwZbDUcwmUsCPcLG/DQ8+c8uNuiiTt60s4uIlpDwJPdOF
         0kE8zL7psKploGbm/FN65EJ4g+XEOVBWECfISE4dTQod91tF5DA0axHgspkfGq9ZRE4s
         hsWQ==
X-Gm-Message-State: AOAM531FNfXzfahbR4p6RA1fX9+RA+kS5iapsS5B2RX0ZfgJYq2+qAZH
        fPftm0fwhQp5KqTbMBGhDu8rG67mV2NHCA==
X-Google-Smtp-Source: ABdhPJyQQuEnehO0Njo58qUfgjqu1AS2n2oE/v3a2haJi9HpX8yavLxzFgCItSF0yAsODmraR/9vDw==
X-Received: by 2002:a67:c58b:: with SMTP id h11mr4360966vsk.82.1644243838964;
        Mon, 07 Feb 2022 06:23:58 -0800 (PST)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id n10sm2234178vso.34.2022.02.07.06.23.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Feb 2022 06:23:58 -0800 (PST)
Received: by mail-ua1-f48.google.com with SMTP id u77so9307548uau.6;
        Mon, 07 Feb 2022 06:23:58 -0800 (PST)
X-Received: by 2002:a67:c198:: with SMTP id h24mr4664195vsj.5.1644243838027;
 Mon, 07 Feb 2022 06:23:58 -0800 (PST)
MIME-Version: 1.0
References: <20220205084006.7142-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220205084006.7142-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 7 Feb 2022 15:23:47 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXqzQOatPXxEPfuSRyzJ81ADX0EhR5xng7XwpoCAh325g@mail.gmail.com>
Message-ID: <CAMuHMdXqzQOatPXxEPfuSRyzJ81ADX0EhR5xng7XwpoCAh325g@mail.gmail.com>
Subject: Re: [PATCH v5] clk: renesas: rzg2l-cpg: Add support for RZ/V2L SoC
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Biju,

On Sat, Feb 5, 2022 at 9:40 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> The clock structure for RZ/V2L is almost identical to RZ/G2L SoC. The only
> difference being RZ/V2L has an additional registers to control clock and
> reset for the DRP-AI block.
>
> This patch reuses r9a07g044-cpg.c, as the common clock IDS and rest IDS are
> same between RZ/G2L and RZ/V2L and adding a separate r9a07g054_cpg_info to
> take care of DRP-AI clocks/resets.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> This patch depend upon [1]
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/include/dt-bindings/clock?h=next-20220204&id=4decd2e54b61686787f36b727d2772e067a46ea5
> v4->v5:
> * Rebased on latest clk-driver
> * Added base commit ID
> v3->v4:
> * Added common/drp split for core clocks and resets

Thanks for the updates!

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
> @@ -80,252 +81,285 @@ static const char * const sel_pll6_2[]    = { ".pll6_250", ".pll5_250" };
>  static const char * const sel_shdi[] = { ".clk_533", ".clk_400", ".clk_266" };
>  static const char * const sel_gpu2[] = { ".pll6", ".pll3_div2_2" };
>
> -static const struct cpg_core_clk r9a07g044_core_clks[] __initconst = {
> -       /* External Clock Inputs */
> -       DEF_INPUT("extal", CLK_EXTAL),
> +static struct {
> +       const struct cpg_core_clk common[44];
> +#ifdef CONFIG_CLK_R9A07G054
> +       const struct cpg_core_clk drp[0];
> +#endif
> +} const core_clks __initconst = {

Having a single "const" between "static" and "struct" is sufficient.

> +       .common = {
> +               /* External Clock Inputs */
> +               DEF_INPUT("extal", CLK_EXTAL),
>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.18, with the above fixed.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
