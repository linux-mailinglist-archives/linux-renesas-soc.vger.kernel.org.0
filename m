Return-Path: <linux-renesas-soc+bounces-17038-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B86AB5459
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 14:10:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1355189D0BB
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 12:10:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1A7828D8E5;
	Tue, 13 May 2025 12:10:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2571FBC8E;
	Tue, 13 May 2025 12:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747138202; cv=none; b=tyKlxmsJBhUC1Hm/HV/OY4HWXW7liLf0agdZ2x04z3tqd8WQiW4Y67c6zfxef1W0PMdfWAEvQyWyMEjsQTbbHd16v4XiBDiqDOeUnp+IM17OtrVx8bx3WI/uEmabcnJ1TZqnXNVVAEYbRWAF3WVFYUgdpaOSyJlDXSMwXAcfSfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747138202; c=relaxed/simple;
	bh=OOCmrOGo8wRSqk/g2eCOcBigLOt5KiEh+wWaz3iMqZE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JaJWMXqj3jZz1YsCUQchlgnC0hFep4MKNXny7rOedPuctJFkcCMHk6OE+xcfCkYwGEfzcJrkVASVEktvJPt2FSWOZZXGCld03DBNog+IGp3hZUQt708t/GP/6CJZKCZtVv4AsUv0DAzUkoJJ8em9LtTbbEqgGJq/UZsAYaTHqss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-7c922169051so332559785a.0;
        Tue, 13 May 2025 05:09:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747138198; x=1747742998;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fXD6aabLA63dPEeU/mjH0tJFtrIJBG0g/v6sCENvq9U=;
        b=qha8JLHj7nEs/BXiYkn0xCJYmPcLFsbyT4bXt6fvHfwW5SOOeUyoqiAVGf8Vkxtv5a
         pJMv+Ra2e5lx2KAg5v7S91qjPdRTySMJ8+uVr3CmYp8idgsDhQurTo6JUhbQ2y7PsMEy
         r/IZ7pURGAsJdbkswZlCFRI4WLuifGhGZ6kXx1xV1bUpLYmieQuffV2eOQbq7ED6A8V7
         qZ2PZl75AbQbfCLJw8XMJ/otjVsla5B980FTog7VSgZ9GrIL/VKLHa38X0IiVfqpeeyw
         tmjgGdkR9nZmFOAzzxvJwiFlDngPw++Ns7SSQ38tDjYetb/kGR3u5t+a/b5jxvDBRzfY
         U01A==
X-Forwarded-Encrypted: i=1; AJvYcCVIfolGdjeLqw9GpYFrdK2RpClpdMEo3sL3SStqHjgZWF+3FYCoXZC8bMxx5sctM3E2GIVw7EFrR8+DpIDT@vger.kernel.org, AJvYcCVTburuae2plBZRGgNz1xF4WqB1mwsk0i85w9sLf7ak9upwqP+33a0e+wD8EQGOWChAuuUht14EUEs=@vger.kernel.org, AJvYcCXtS91ks3hJE58NsUpo5YTk+D0Nf9BqdNJdlOiWoq4s+ROwVObsI5OBXje4/KE8e45bPgrGDd5++jwJ3dzz6dcF1Rg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxktkjqiBTYyAkIUNxx/OBB+iPnQOayu/2JPZrewiRcTvtoR1gu
	4zUMxxuihtaKoVQ+65TSBKEwW4QY/Q3Kj7n2T32A4NlA2wPssMlzW9cDev9m
X-Gm-Gg: ASbGncu3+pSKrY/APQidcKt+bYpr4RM94SL0Wu6glbhlXLJLeBuuCRo+7y+SKjurCWB
	6fzN07eZOFqQceqO9VIX8RBk12uhGJNQtJd2FHjcYPHCHINeNGEGo577M/RboD+6K4xoQdSBZDL
	6yQy9Ua9Yx+OTqEibe9FFMFJQmuy5C6jG9N7GT4a9E/raK73CQk/0kdCOTnQtj+vb6smIAwYjgR
	2GV/WL2/zlJJLWQ14Apjt5W+aWU9sMi6SSytb0nxeiDPUnMHiEMNM19qljeCDV1QursTRCCoEu5
	WHhei8cruUcKTcVlOCA9GufXU0TR+3rOeUXB3l8Rjn8e/hKcrWQAqNY3NpuONsNveLR1suDadjq
	Zi/I32nqxHRCUy9bVTsQayGP/IPzE
X-Google-Smtp-Source: AGHT+IEw+wbkwaOk777lJB/gGf+0slabc4dDUIOZIN9Xw22n3bNNhlLHcdTi9kcffd1Jeab9IkiHOw==
X-Received: by 2002:a05:620a:4591:b0:7c5:5e5b:2fdb with SMTP id af79cd13be357-7cd01141124mr2536415685a.41.1747138198189;
        Tue, 13 May 2025 05:09:58 -0700 (PDT)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com. [209.85.222.171])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd00fdc47bsm698053685a.67.2025.05.13.05.09.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 05:09:58 -0700 (PDT)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7cd0a7b672bso237404885a.2;
        Tue, 13 May 2025 05:09:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWtHxUC522/CUjlfm5rUs/s/HGVbQqiscTS/SUOrA4JjrFlFMUjh9lBLCP7KIImycY/2yPRIb9jtSoMrUtT@vger.kernel.org, AJvYcCXqSNl8FKPlRbimfsallv6m7jjL7EX/TgGfreRhLdoW59kduQ49tSLcJuUrLVFgsM26U2vJSY4BuA4NHLikYGeHWE8=@vger.kernel.org, AJvYcCXz/f22OKeS23Ec4Oz+B05Uzehvq8Q6ma/epVQLS9TOz/864fLvScpFh7XAfmP5DdbY1nqke8j1ksE=@vger.kernel.org
X-Received: by 2002:a05:620a:c4d:b0:7c9:2394:4195 with SMTP id
 af79cd13be357-7cd0113d85bmr2487599185a.35.1747138197636; Tue, 13 May 2025
 05:09:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429081956.3804621-1-thierry.bultel.yh@bp.renesas.com> <20250429081956.3804621-7-thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250429081956.3804621-7-thierry.bultel.yh@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 May 2025 14:09:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVvHG+UBBwWbBgiFh10u-sAYj_sONj6YPh4c5De2gyJOQ@mail.gmail.com>
X-Gm-Features: AX0GCFsvmqxOFXq2DIBYpJiLIK4VmjZniG8celEq7o_3R_HZEOaNYaGVogIfTIk
Message-ID: <CAMuHMdVvHG+UBBwWbBgiFh10u-sAYj_sONj6YPh4c5De2gyJOQ@mail.gmail.com>
Subject: Re: [PATCH v8 06/11] clk: renesas: Add support for R9A09G077 SoC
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org, 
	paul.barker.ct@bp.renesas.com, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thierry,

On Tue, 29 Apr 2025 at 10:20, Thierry Bultel
<thierry.bultel.yh@bp.renesas.com> wrote:
> RZ/T2H has 2 register blocks at different addresses.
>
> The clock tree has configurable dividers and mux selectors.
> Add these new clock types, new register layout type, and
> registration code for mux and div in registration callback.
>
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
> ---
> Changes v7->v8:
>  - Makefile: keep ordered list
>  - r9a09g077-cpg-mssr.c: use high bit instead of sel_base,
>    same macro for DIV and MUX
>  - removed unused clocks
>  - CLK_LOCO is internal with a DEF_RATE definition
>  - added CLK_PLL4D1 & CLK_SCI0ASYNC
>  - added per-CA55 clocks
>  - added missing error check in r9a09g077_cpg_mux_clk_register
>  - fixed num_hw_mod_clks to 14
>  - added missing 2 holes in mstpcr_for_rzt2h
>  - renamed cpg_read_rzt2h_mstp_from_offset to cpg_read_rzt2h_mstp,
>    directly reads at calculated address
>  - added cpg_write_rzt2h_mstp and call in cpg_mstp_clock_endisable
>  - do not register reset controller in case of CLK_REG_LAYOUT_RZ_T2H
>  - moved CLK_DIV & CLK_MUX definitions to RZT2H specifics

Thanks for the update!

> index 000000000000..029619a6cb19
> --- /dev/null
> +++ b/drivers/clk/renesas/r9a09g077-cpg-mssr.c

r9a09g077-cpg.c

> @@ -0,0 +1,252 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * r9a09g077 Clock Pulse Generator / Module Standby and Software Reset
> + *
> + * Copyright (C) 2025 Renesas Electronics Corp.
> + *
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/clk-provider.h>
> +#include <linux/device.h>
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +
> +#include <dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h>
> +#include "renesas-cpg-mssr.h"
> +
> +#define RZT2H_REG_BLOCK_SHIFT  11
> +#define RZT2H_REG_OFFSET_MASK  GENMASK(10, 0)
> +#define RZT2H_REG_CONF(block, offset)  (((block) << RZT2H_REG_BLOCK_SHIFT) | \
> +                                       ((offset) & RZT2H_REG_OFFSET_MASK))
> +
> +#define RZT2H_REG_BLOCK(x)             ((x) >> RZT2H_REG_BLOCK_SHIFT)
> +#define RZT2H_REG_OFFSET(x)            ((x) & RZT2H_REG_OFFSET_MASK)
> +
> +#define SCKCR          RZT2H_REG_CONF(0, 0x00)
> +#define SCKCR2         RZT2H_REG_CONF(1, 0x04)
> +#define SCKCR3         RZT2H_REG_CONF(0, 0x08)
> +
> +#define OFFSET_MASK    GENMASK(31, 20)
> +#define SHIFT_MASK     GENMASK(19, 12)
> +#define WIDTH_MASK     GENMASK(11, 8)
> +
> +#define CONF_PACK(offset, shift, width)  \
> +       (FIELD_PREP_CONST(OFFSET_MASK, (offset)) | \
> +       FIELD_PREP_CONST(SHIFT_MASK, (shift)) | \
> +       FIELD_PREP_CONST(WIDTH_MASK, (width)))
> +
> +#define GET_SHIFT(val)         FIELD_GET(SHIFT_MASK, val)
> +#define GET_WIDTH(val)         FIELD_GET(WIDTH_MASK, val)
> +#define GET_REG_OFFSET(val)    FIELD_GET(OFFSET_MASK, val)
> +
> +#define DIVCA55C0      CONF_PACK(SCKCR2, 8, 1)
> +#define DIVCA55C1      CONF_PACK(SCKCR2, 9, 1)
> +#define DIVCA55C2      CONF_PACK(SCKCR2, 10, 1)
> +#define DIVCA55C3      CONF_PACK(SCKCR2, 11, 1)
> +#define DIVCA55S       CONF_PACK(SCKCR2, 12, 1)
> +
> +#define DIVSCI0ASYNC   CONF_PACK(SCKCR3, 6, 1)

This field holds two bits, not one.

> +
> +#define SEL_PLL                CONF_PACK(SCKCR, 22, 1)
> +
> +
> +enum rzt2h_clk_types {
> +       CLK_TYPE_RZT2H_DIV = CLK_TYPE_CUSTOM,   /* Clock with divider */
> +       CLK_TYPE_RZT2H_MUX,                     /* Clock with clock source selector */
> +};
> +
> +#define DEF_DIV(_name, _id, _parent, _conf, _dtable, _flag) \
> +       DEF_TYPE(_name, _id, CLK_TYPE_RZT2H_DIV, .conf = _conf, \
> +                .parent = _parent, .dtable = _dtable, .flag = _flag)

The _flag parameter is always zero?

> +#define DEF_MUX(_name, _id, _conf, _parent_names, _num_parents, _flag, \
> +               _mux_flags) \
> +       DEF_TYPE(_name, _id, CLK_TYPE_RZT2H_MUX, .conf = _conf, \
> +                .parent_names = _parent_names, .num_parents = _num_parents, \
> +                .flag = _flag, .mux_flags = _mux_flags)

The _flag parameter is always zero (see below)?

> +
> +enum clk_ids {
> +       /* Core Clock Outputs exported to DT */
> +       LAST_DT_CORE_CLK = R9A09G077_CLK_PCLKM,
> +
> +       /* External Input Clocks */
> +       CLK_EXTAL,
> +
> +       /* Internal Core Clocks */
> +       CLK_LOCO,
> +       CLK_MAIN,

Unused

> +       CLK_PLL0,
> +       CLK_PLL1,
> +       CLK_PLL4,
> +       CLK_SEL_PLL0,
> +       CLK_SEL_CLK_PLL0,
> +       CLK_SEL_PLL1,
> +       CLK_SEL_CLK_PLL1,
> +       CLK_SEL_PLL4,
> +       CLK_SEL_CLK_PLL4,
> +       CLK_PLL4D1,
> +       CLK_SCI0ASYNC,
> +
> +       /* Module Clocks */
> +       MOD_CLK_BASE,
> +};
> +
> +static const struct clk_div_table dtable_1_2[] = {
> +       {0, 2},
> +       {1, 1},
> +       {0, 0},
> +};
> +
> +static const struct clk_div_table dtable_24_25_30_32[] = {
> +       {0, 24},
> +       {0, 25},
> +       {0, 30},
> +       {0, 32},

The first value of each tuple must contain the register bit field value,
and usually the tables are sorted by value (although the code doesn't
seem to rely on that):

    {0, 32},
    {1, 30},
    {2, 25},
    {3, 24},

> +       {0, 0},
> +};
> +
> +/* Mux clock tables */
> +
> +static const char * const sel_clk_pll0[] = { "loco", ".sel_pll0" };
> +static const char * const sel_clk_pll1[] = { "loco", ".sel_pll1" };
> +static const char * const sel_clk_pll4[] = { "loco", ".sel_pll4" };

".loco", as this is an internal clock.

> +
> +static const struct cpg_core_clk r9a09g077_core_clks[] __initconst = {
> +       /* External Clock Inputs */
> +       DEF_INPUT("extal", CLK_EXTAL),
> +
> +       /* Internal Core Clocks */
> +       DEF_RATE("loco", CLK_LOCO, 1000 * 1000),

".loco", as this is an internal clock.

> +       DEF_FIXED(".pll0", CLK_PLL0, CLK_EXTAL, 1, 48),
> +       DEF_FIXED(".pll1", CLK_PLL1, CLK_EXTAL, 1, 40),
> +       DEF_FIXED(".pll4", CLK_PLL4, CLK_EXTAL, 1, 96),
> +       /* unimplemented CLMA0 selector */
> +       DEF_FIXED(".sel_pll0", CLK_SEL_PLL0, CLK_PLL0, 1, 1),

Will there ever be a need to implement these CLMAx selectors?
If not, you can just drop all SEL_PLLx clocks with 1/1 mul/div.
IIUIC, the CPG will switch automatically to clocks derived from the
LOCO if an anomaly is detected, yielding the same clock frequencies
as during normal operation (albeit with less precision)?

> +       DEF_MUX(".sel_clk_pll0", CLK_SEL_CLK_PLL0, SEL_PLL,
> +               sel_clk_pll0, ARRAY_SIZE(sel_clk_pll0), 0, CLK_MUX_READ_ONLY),
> +       /* unimplemented CLMA1 selector */
> +       DEF_FIXED(".sel_pll1", CLK_SEL_PLL1, CLK_PLL1, 1, 1),
> +       DEF_MUX(".sel_clk_pll1", CLK_SEL_CLK_PLL1, SEL_PLL,
> +               sel_clk_pll1, ARRAY_SIZE(sel_clk_pll1), 0, CLK_MUX_READ_ONLY),
> +       /* unimplemented CLMA4 selector */
> +       DEF_FIXED(".sel_pll4", CLK_SEL_PLL4, CLK_PLL4, 1, 1),
> +       DEF_MUX(".sel_clk_pll4", CLK_SEL_CLK_PLL4, SEL_PLL,
> +               sel_clk_pll4, ARRAY_SIZE(sel_clk_pll4), 0, CLK_MUX_READ_ONLY),
> +
> +       DEF_FIXED(".pll4d1", CLK_PLL4D1, CLK_SEL_CLK_PLL4, 1, 1),
> +       DEF_DIV(".sci0async", CLK_SCI0ASYNC, CLK_PLL4D1, DIVSCI0ASYNC,
> +               dtable_24_25_30_32, CLK_DIVIDER_HIWORD_MASK),

CLK_DIVIDER_HIWORD_MASK is wrong, as there is no mask in
the higher 16-bit of the SCKCR3 register...

> +
> +       /* Core output clk */
> +       DEF_DIV("CA55C0", R9A09G077_CLK_CA55C0, CLK_SEL_CLK_PLL0, DIVCA55C0,
> +               dtable_1_2, CLK_DIVIDER_HIWORD_MASK),

... nor in the SCKCR2 register.

> +       DEF_DIV("CA55C1", R9A09G077_CLK_CA55C1, CLK_SEL_CLK_PLL0, DIVCA55C1,
> +               dtable_1_2, CLK_DIVIDER_HIWORD_MASK),
> +       DEF_DIV("CA55C2", R9A09G077_CLK_CA55C2, CLK_SEL_CLK_PLL0, DIVCA55C2,
> +               dtable_1_2, CLK_DIVIDER_HIWORD_MASK),
> +       DEF_DIV("CA55C3", R9A09G077_CLK_CA55C3, CLK_SEL_CLK_PLL0, DIVCA55C3,
> +               dtable_1_2, CLK_DIVIDER_HIWORD_MASK),
> +       DEF_DIV("CA55S", R9A09G077_CLK_CA55S, CLK_SEL_CLK_PLL0, DIVCA55S,
> +               dtable_1_2, CLK_DIVIDER_HIWORD_MASK),
> +       DEF_FIXED("PCLKGPTL", R9A09G077_CLK_PCLKGPTL, CLK_SEL_CLK_PLL1, 2, 1),
> +       DEF_FIXED("PCLKM", R9A09G077_CLK_PCLKM, CLK_SEL_CLK_PLL1, 8, 1),
> +};
> +
> +static const struct mssr_mod_clk r9a09g077_mod_clks[] __initconst = {
> +       DEF_MOD("sci0fck", R9A09G077_PCLK_SCI0, CLK_SCI0ASYNC),
> +};
> +
> +static struct clk * __init
> +r9a09g077_cpg_div_clk_register(struct device *dev,
> +                              const struct cpg_core_clk *core,
> +                              void __iomem *addr, struct cpg_mssr_pub *pub)
> +{
> +       const struct clk *parent;
> +       const char *parent_name;
> +       struct clk_hw *clk_hw;
> +
> +       parent = pub->clks[core->parent];
> +

Please drop this blank line.

> +       if (IS_ERR(parent))
> +               return ERR_CAST(parent);

> +static struct clk * __init
> +r9a09g077_cpg_clk_register(struct device *dev, const struct cpg_core_clk *core,
> +                          const struct cpg_mssr_info *info,
> +                          struct cpg_mssr_pub *pub)
> +{
> +       u32 offset = GET_REG_OFFSET(core->conf);
> +       void __iomem *base = RZT2H_REG_BLOCK(offset) ? pub->base1 : pub->base0;
> +       void __iomem *addr = base + offset;

... + RZT2H_REG_OFFSET(offset);

> +
> +       switch (core->type) {
> +       case CLK_TYPE_RZT2H_DIV:
> +               return r9a09g077_cpg_div_clk_register(dev, core, addr, pub);
> +       case CLK_TYPE_RZT2H_MUX:
> +               return r9a09g077_cpg_mux_clk_register(dev, core, addr, pub);
> +       default:
> +               return ERR_PTR(-EINVAL);
> +       }
> +}

> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> @@ -79,6 +79,37 @@ static const u16 mstpcr_for_gen4[] = {
>         0x2D60, 0x2D64, 0x2D68, 0x2D6C, 0x2D70, 0x2D74,
>  };
>
> +/*
> + * Module Stop Control Register (RZ/T2H)
> + * RZ/T2H has 2 registers blocks,
> + * Bit 12 is used to differentiate them
> + */
> +
> +#define RZT2H_MSTPCR_BLOCK_SHIFT       12
> +#define RZT2H_MSTPCR_OFFSET_MASK       GENMASK(11, 0)
> +#define RZT2H_MSTPCR(block, offset)    (((block) << RZT2H_MSTPCR_BLOCK_SHIFT) | \
> +                                       ((offset) & RZT2H_MSTPCR_OFFSET_MASK))
> +
> +#define RZT2H_MSTPCR_BLOCK(x)          ((x) >> RZT2H_MSTPCR_BLOCK_SHIFT)
> +#define RZT2H_MSTPCR_OFFSET(x)         ((x) & RZT2H_MSTPCR_OFFSET_MASK)

> @@ -187,6 +218,26 @@ struct mstp_clock {
>
>  #define to_mstp_clock(_hw) container_of(_hw, struct mstp_clock, hw)
>
> +static u32 cpg_read_rzt2h_mstp(struct clk_hw *hw, u16 offset)

rzt2h_mstpcr_read(), to match the naming of the helper macros above?

> +{
> +       struct mstp_clock *clock = to_mstp_clock(hw);
> +       struct cpg_mssr_priv *priv = clock->priv;
> +       void __iomem *base =
> +               RZT2H_MSTPCR_BLOCK(offset) ? priv->pub.base1 : priv->pub.base0;
> +
> +       return readl(base + RZT2H_MSTPCR_OFFSET(offset));
> +}
> +
> +static void cpg_write_rzt2h_mstp(struct clk_hw *hw, u16 offset, u32 value)

rzt2h_mstpcr_write()?

> +{
> +       struct mstp_clock *clock = to_mstp_clock(hw);
> +       struct cpg_mssr_priv *priv = clock->priv;
> +       void __iomem *base =
> +               RZT2H_MSTPCR_BLOCK(offset) ? priv->pub.base1 : priv->pub.base0;
> +
> +       writel(value, base + RZT2H_MSTPCR_OFFSET(offset));
> +}
> +
>  static int cpg_mstp_clock_endisable(struct clk_hw *hw, bool enable)
>  {
>         struct mstp_clock *clock = to_mstp_clock(hw);
> @@ -215,6 +266,19 @@ static int cpg_mstp_clock_endisable(struct clk_hw *hw, bool enable)
>                 readb(priv->pub.base0 + priv->control_regs[reg]);
>                 barrier_data(priv->pub.base0 + priv->control_regs[reg]);
>
> +       } else if (priv->reg_layout == CLK_REG_LAYOUT_RZ_T2H) {
> +               pr_info("RZTH2 case");

Please drop this pr_info() call.

> +               value = cpg_read_rzt2h_mstp(hw,
> +                                           priv->control_regs[reg]);
> +
> +               if (enable)
> +                       value &= ~bitmask;
> +               else
> +                       value |= bitmask;
> +
> +               cpg_write_rzt2h_mstp(hw,
> +                                    priv->control_regs[reg],
> +                                    value);
>         } else {
>                 value = readl(priv->pub.base0 + priv->control_regs[reg]);
>                 if (enable)

> @@ -1064,6 +1138,13 @@ static int __init cpg_mssr_common_init(struct device *dev,
>                 error = -ENOMEM;
>                 goto out_err;
>         }
> +       if (info->reg_layout == CLK_REG_LAYOUT_RZ_T2H) {
> +               priv->pub.base1 = of_iomap(np, 1);
> +               if (!priv->pub.base1) {
> +                       error = -ENOMEM;
> +                       goto out_err;
> +               }
> +       }
>
>         priv->num_core_clks = info->num_total_core_clks;
>         priv->num_mod_clks = info->num_hw_mod_clks;
> @@ -1077,6 +1158,8 @@ static int __init cpg_mssr_common_init(struct device *dev,
>                 priv->reset_clear_regs = srstclr;
>         } else if (priv->reg_layout == CLK_REG_LAYOUT_RZ_A) {
>                 priv->control_regs = stbcr;
> +       } else if (priv->reg_layout == CLK_REG_LAYOUT_RZ_T2H) {
> +               priv->control_regs = mstpcr_for_rzt2h;
>         } else if (priv->reg_layout == CLK_REG_LAYOUT_RCAR_GEN4) {
>                 priv->status_regs = mstpsr_for_gen4;
>                 priv->control_regs = mstpcr_for_gen4;
> @@ -1107,6 +1190,8 @@ static int __init cpg_mssr_common_init(struct device *dev,
>  out_err:
>         if (priv->pub.base0)
>                 iounmap(priv->pub.base0);
> +       if (priv->pub.base1)
> +               iounmap(priv->pub.base1);
>         kfree(priv);
>
>         return error;
> @@ -1171,7 +1256,8 @@ static int __init cpg_mssr_probe(struct platform_device *pdev)
>                 goto reserve_exit;
>
>         /* Reset Controller not supported for Standby Control SoCs */
> -       if (priv->reg_layout == CLK_REG_LAYOUT_RZ_A)
> +       if (priv->reg_layout == CLK_REG_LAYOUT_RZ_A ||
> +           priv->reg_layout == CLK_REG_LAYOUT_RZ_T2H)
>                 goto reserve_exit;
>
>         error = cpg_mssr_reset_controller_register(priv);
> diff --git a/drivers/clk/renesas/renesas-cpg-mssr.h b/drivers/clk/renesas/renesas-cpg-mssr.h
> index 7ce3cc9a64c1..2801d6bf2f6d 100644
> --- a/drivers/clk/renesas/renesas-cpg-mssr.h
> +++ b/drivers/clk/renesas/renesas-cpg-mssr.h
> @@ -22,6 +22,10 @@
>  struct cpg_core_clk {
>         /* Common */
>         const char *name;
> +       union {
> +               const char * const *parent_names;
> +               const struct clk_div_table *dtable;
> +       };

Please move them below, as they are type-specific.

>         unsigned int id;
>         unsigned int type;
>         /* Depending on type */
> @@ -29,18 +33,24 @@ struct cpg_core_clk {
>         unsigned int div;
>         unsigned int mult;
>         unsigned int offset;
> +       u32 conf;
> +       u16 flag;
> +       u8 mux_flags;
> +       u8 num_parents;
>  };
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

