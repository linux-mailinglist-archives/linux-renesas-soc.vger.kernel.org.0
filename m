Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72C5351031B
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 26 Apr 2022 18:19:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236365AbiDZQWw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 26 Apr 2022 12:22:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352909AbiDZQWq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 26 Apr 2022 12:22:46 -0400
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B33D1A2054;
        Tue, 26 Apr 2022 09:19:28 -0700 (PDT)
Received: by mail-qv1-f52.google.com with SMTP id k12so6554676qvc.4;
        Tue, 26 Apr 2022 09:19:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lr1xhCSooIdpZUOkFbGvIBY4fakjdofYbyQdU6q2CY0=;
        b=faAbJ25RyuL2rTKdWxiORtxLoGAXw1UogfjYI1qfuXe6JojwyaMMwXnqdAtoTHRlDF
         m/kdtTMtMNKXD1GxfNcB5tf7cpiLis1D0SP5ERB2QM1ZsoAo6h8B1wg4OL+A4lvWr6mr
         AGmHFq4WM3zmcjl+/uJXkiUfIDZxMx56k85Ub4xF7sN0IuAouyel5JWv0fMDQpp7aFi0
         DLT7Q6sevphjDkzZYi8IGWYieQuea1Gr3iTTVx2ZWY7eCz8sKUKJmUrmzVBch8ZuwAPH
         OKo53H+xkmh28J9MgIDZb08PVpOtt6Ttk57obF9wuClL5sCW5FqDauq5o+cWKr8OyX7H
         liIQ==
X-Gm-Message-State: AOAM532HNtetRKOuMWNPNUx7Mkn85AIowDRyO7UWYIhXmRq4F1vYjES+
        i1VETf8Y2dkY5aeDQZcxL8AIGnBPfxksbQ==
X-Google-Smtp-Source: ABdhPJzl/R+Jr3znQc+wTiG+BnNGuB6TRvyiidV+XVzskR+DX7rKacX/9oQP8LrPsSJQT/IoXx2NBw==
X-Received: by 2002:a05:6214:4104:b0:42c:1db0:da28 with SMTP id kc4-20020a056214410400b0042c1db0da28mr16820703qvb.67.1650989967122;
        Tue, 26 Apr 2022 09:19:27 -0700 (PDT)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id d134-20020a37688c000000b0069f7bc789cesm978611qkc.24.2022.04.26.09.19.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Apr 2022 09:19:26 -0700 (PDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-2f7b815ac06so111919087b3.3;
        Tue, 26 Apr 2022 09:19:26 -0700 (PDT)
X-Received: by 2002:a81:618b:0:b0:2db:d952:8a39 with SMTP id
 v133-20020a81618b000000b002dbd9528a39mr22820030ywb.132.1650989966368; Tue, 26
 Apr 2022 09:19:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220330154024.112270-1-phil.edworthy@renesas.com> <20220330154024.112270-11-phil.edworthy@renesas.com>
In-Reply-To: <20220330154024.112270-11-phil.edworthy@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 26 Apr 2022 18:19:14 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWH8VebM3-N77aVt9YgxPfH9tTrNwMAb7E6kED9LYjxZg@mail.gmail.com>
Message-ID: <CAMuHMdWH8VebM3-N77aVt9YgxPfH9tTrNwMAb7E6kED9LYjxZg@mail.gmail.com>
Subject: Re: [PATCH v2 10/13] clk: renesas: Add RZ/V2M support using the rzg2l driver
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Phil,

On Wed, Mar 30, 2022 at 5:42 PM Phil Edworthy <phil.edworthy@renesas.com> wrote:
> The Renesas RZ/V2M SoC is very similar to RZ/G2L, though it doesn't have
> any CLK_MON registers.
>
> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/Kconfig
> +++ b/drivers/clk/renesas/Kconfig
> @@ -35,6 +35,7 @@ config CLK_RENESAS
>         select CLK_R9A06G032 if ARCH_R9A06G032
>         select CLK_R9A07G044 if ARCH_R9A07G044
>         select CLK_R9A07G054 if ARCH_R9A07G054
> +        select CLK_R9A09G011 if ARCH_R9A09G011

Please use a single TAB for indentation, instead of 8 spaces.

>         select CLK_SH73A0 if ARCH_SH73A0
>
>  if CLK_RENESAS
> @@ -168,6 +169,10 @@ config CLK_R9A07G054
>         bool "RZ/V2L clock support" if COMPILE_TEST
>         select CLK_RZG2L
>
> +config CLK_R9A09G011
> +       bool "RZ/V2M clock support" if COMPILE_TEST
> +       select CLK_RZG2L

Please use a single TAB for indentation, instead of 7 spaces.

> --- /dev/null
> +++ b/drivers/clk/renesas/r9a09g011-cpg.c
> @@ -0,0 +1,164 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * RZ/V2M Clock Pulse Generator / Module Standby and Software Reset
> + *
> + * Copyright (C) 2022 Renesas Electronics Corp.
> + *
> + * Based on r9a07g044-cpg.c
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/device.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +
> +#include <dt-bindings/clock/r9a09g011-cpg.h>
> +
> +#include "rzg2l-cpg.h"
> +
> +#define RZV2M_SAMPLL4_CLK1     0x104
> +#define RZV2M_SAMPLL4_CLK2     0x108
> +
> +#define PLL4_CONF      (RZV2M_SAMPLL4_CLK1 << 22 | RZV2M_SAMPLL4_CLK2 << 12)
> +
> +#define DIV_A          DDIV_PACK(0x200, 0, 3)
> +#define DIV_B          DDIV_PACK(0x204, 0, 2)
> +#define DIV_E          DDIV_PACK(0x204, 8, 1)
> +#define DIV_W          DDIV_PACK(0x328, 0, 3)
> +
> +#define SEL_B          SEL_PLL_PACK(0x214, 0, 1)
> +#define SEL_E          SEL_PLL_PACK(0x214, 2, 1)
> +#define SEL_W0         SEL_PLL_PACK(0x32C, 0, 1)
> +
> +enum clk_ids {
> +       /* Core Clock Outputs exported to DT */
> +       LAST_DT_CORE_CLK = 0,
> +
> +       /* External Input Clocks */
> +       CLK_EXTAL,
> +
> +       /* Internal Core Clocks */
> +       CLK_MAIN,
> +       CLK_MAIN_24,
> +       CLK_MAIN_2,
> +       CLK_PLL1,
> +       CLK_PLL2,
> +       CLK_PLL2_800,
> +       CLK_PLL2_400,
> +       CLK_PLL2_200,
> +       CLK_PLL2_100,
> +       CLK_PLL4,
> +       CLK_DIV_A,
> +       CLK_DIV_B,
> +       CLK_DIV_E,
> +       CLK_DIV_W,
> +       CLK_SEL_B,
> +       CLK_SEL_B_D2,
> +       CLK_SEL_E,
> +       CLK_SEL_W0,
> +
> +       /* Module Clocks */
> +       MOD_CLK_BASE
> +};

> +/* Mux clock tables */
> +static const char * const sel_b[] = { ".main", ".divb" };
> +static const char * const sel_e[] = { ".main", ".dive" };

While DIV_E and CLK_DIV_E are defined above, the actual clock
definition for ".dive" is missing.
Fortunately(?) sel_e[] itself is unused.

> +static const struct rzg2l_mod_clk r9a09g011_mod_clks[] __initconst = {
> +       DEF_MOD("gic",          R9A09G011_GIC_CLK,      CLK_SEL_B_D2, 0x400, 5),
> +       DEF_MOD("syc_cnt_clk",  R9A09G011_SYC_CNT_CLK,  CLK_MAIN_24,  0x41c, 12),
> +       DEF_MOD("urt0_clk",     R9A09G011_URT0_CLK,     CLK_SEL_W0,   0x438, 5),

The second UART clock (urt_pclk, shared by UART0 and UART1) is missing.

> +       DEF_MOD("ca53",         R9A09G011_CA53_CLK,     CLK_DIV_A,    0x448, 0),
> +};

> --- a/drivers/clk/renesas/rzg2l-cpg.h
> +++ b/drivers/clk/renesas/rzg2l-cpg.h
> @@ -103,11 +103,17 @@ enum clk_types {
>         DEF_TYPE(_name, _id, CLK_TYPE_DIV, .conf = _conf, \
>                  .parent = _parent, .dtable = _dtable, \
>                  .flag = CLK_DIVIDER_HIWORD_MASK | _flag)
> +#define DEF_DIV_RO(_name, _id, _parent, _conf, _dtable) \
> +       DEF_DIV(_name, _id, _parent, _conf, _dtable, CLK_DIVIDER_READ_ONLY)

It feels a bit strange CLK_DIVIDER_HIWORD_MASK (or CLK_MUX_HIWORD_MASK
below) is set for a read-only clock, but I guess it doesn't hurt,
as the hiword flag won't be used anyway.

>  #define DEF_MUX(_name, _id, _conf, _parent_names, _num_parents, _flag, \
>                 _mux_flags) \
>         DEF_TYPE(_name, _id, CLK_TYPE_MUX, .conf = _conf, \
>                  .parent_names = _parent_names, .num_parents = _num_parents, \
>                  .flag = _flag, .mux_flags = CLK_MUX_HIWORD_MASK | _mux_flags)
> +#define DEF_MUX2(_name, _id, _conf, _parent_names, _flag, _mux_flags) \
> +       DEF_MUX(_name, _id, _conf, _parent_names, 2, _flag, _mux_flags)

Instead of adding a new variant for muxes with 2 parents, perhaps
it makes sense to move the ARRAY_SIZE() into the DEF_MUX() macro,
so the number of parents is always detected automatically?

> +#define DEF_MUX2_RO(_name, _id, _conf, _parent_names, _flag) \
> +       DEF_MUX2(_name, _id, _conf, _parent_names, _flag, CLK_MUX_READ_ONLY)

Same for CLK_MUX_HIWORD_MASK.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
