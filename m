Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0888401ACE
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Sep 2021 13:55:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241543AbhIFLzi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 6 Sep 2021 07:55:38 -0400
Received: from mail-vs1-f50.google.com ([209.85.217.50]:44609 "EHLO
        mail-vs1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241530AbhIFLzi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Sep 2021 07:55:38 -0400
Received: by mail-vs1-f50.google.com with SMTP id n63so5328945vsc.11;
        Mon, 06 Sep 2021 04:54:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=so7BQ5rHfhVbS/DseL3xXE4b9CXzgk2myZ3O9Pe6uys=;
        b=p4+9J5C2Bw2gfis5yRD+zIh6Nc7dgTVmsAxZpdjG2WQIglNBNj29cFCoJyhn3Zc6cs
         EAlxOdqLjo1AM+jZGPZCrWFc04jUFxyuj0gTLvLTOJwDuj+Nko9t2L0Eq8aNYJsHkdAF
         YtiB+I/FBURZRv7FF5oickgDrpjBcyHrcQpeKrvoH1LCOoPDVFbIne+UO3Huo5NUeJ9w
         cIUoKETgtv2DnlRPDs9pNVZXDMi1MF4zc6LqDhZslqLRD3cRKArIN6KolOeqQxh3D65s
         g3eZOxLCE/DjXLNPxSra/dRgfSfpXuKQfHoFfjzf1nW0XYlMVx+JLM//GRyLmDqnzyGG
         /HPg==
X-Gm-Message-State: AOAM532lkSx/iaHDTs0Bky/WiJ3adRPpWEzp9JOTzIzUB6e1ODDfodbP
        DoI9nYk3eamw6WeC1OwpQGaJ9imIOPWHE2xDQ5A=
X-Google-Smtp-Source: ABdhPJzqaIctOXPBpXgJTSLC0xGxISPeLvLOUjkKW+Tar9dHiZ+6LIhf4viF8Fon2HegzLOSzpLGuryBSt86RTtS3dU=
X-Received: by 2002:a05:6102:b10:: with SMTP id b16mr1877184vst.41.1630929272995;
 Mon, 06 Sep 2021 04:54:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210804180803.29087-1-biju.das.jz@bp.renesas.com> <20210804180803.29087-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20210804180803.29087-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 6 Sep 2021 13:54:21 +0200
Message-ID: <CAMuHMdXDJyp=eVGRgf6vzKKMyxhPN8_znC9fUxJu+mTwXYyiHA@mail.gmail.com>
Subject: Re: [PATCH 2/2] drivers: clk: renesas: r9a07g044-cpg: Add SDHI clock
 and reset entries
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
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

On Wed, Aug 4, 2021 at 8:08 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add SDHI{0,1} mux, clock and reset entries to CPG driver.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a07g044-cpg.c
> +++ b/drivers/clk/renesas/r9a07g044-cpg.c

> @@ -77,6 +85,11 @@ static const struct cpg_core_clk r9a07g044_core_clks[] __initconst = {
>         DEF_FIXED(".pll6_2", CLK_PLL6_2, CLK_PLL6, 1, 1),
>
>         DEF_FIXED(".pll2_div2", CLK_PLL2_DIV2, CLK_PLL2, 1, 2),
> +       DEF_FIXED(".clk800fix_c", CLK_800FIX_C, CLK_PLL2, 1, 2),
> +       DEF_FIXED(".clk533fix_c", CLK_533FIX_C, CLK_PLL2, 2, 6),

"2, 6" can be simplified to "1, 3".

> +       DEF_FIXED(".div_pll2_div8", CLK_DIV_PLL2_DIV8, CLK_800FIX_C, 1, 2),
> +       DEF_FIXED(".div_pll2_div12", CLK_DIV_PLL2_DIV12, CLK_533FIX_C, 1, 2),

I just love the confusing clock naming in the User's Manual!
DIV_PLL2_DIV8 runs at PLL2 / 4, and DIV_PLL2_DIV12 runs at PLL2 / 6 :-(

> +
>         DEF_FIXED(".pll2_div16", CLK_PLL2_DIV16, CLK_PLL2, 1, 16),
>         DEF_FIXED(".pll2_div20", CLK_PLL2_DIV20, CLK_PLL2, 1, 20),
>
> @@ -103,6 +116,12 @@ static const struct cpg_core_clk r9a07g044_core_clks[] __initconst = {
>         DEF_FIXED("ZT", R9A07G044_CLK_ZT, CLK_PLL3_DIV2_4_2, 1, 1),
>         DEF_MUX("HP", R9A07G044_CLK_HP, SEL_PLL6_2,
>                 sel_pll6_2, ARRAY_SIZE(sel_pll6_2), 0, CLK_MUX_HIWORD_MASK),
> +       DEF_SD_MUX("SD0", R9A07G044_CLK_SD0, SEL_SDHI0,
> +                  sel_shdi, ARRAY_SIZE(sel_shdi), 0, 0),
> +       DEF_SD_MUX("SD1", R9A07G044_CLK_SD1, SEL_SDHI1,
> +                  sel_shdi, ARRAY_SIZE(sel_shdi), 0, 0),

Looks like both .flag and .mux_flags are unneeded?

> +       DEF_FIXED("SD0_DIV4", CLK_SD0_DIV4, R9A07G044_CLK_SD0, 1, 4),
> +       DEF_FIXED("SD1_DIV4", CLK_SD1_DIV4, R9A07G044_CLK_SD1, 1, 4),
>  };
>
>  static struct rzg2l_mod_clk r9a07g044_mod_clks[] = {

The rest looks good to me.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
