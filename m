Return-Path: <linux-renesas-soc+bounces-16131-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66CDCA92A0A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Apr 2025 20:46:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DBEC016A9DF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Apr 2025 18:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5013256C6B;
	Thu, 17 Apr 2025 18:45:50 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com [209.85.222.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7AE0254878;
	Thu, 17 Apr 2025 18:45:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744915550; cv=none; b=tkfvXot1+lF6Np1srjXUdlh6+YTIUgVMx+aiV8UqJbrNKpw36EX5NivLJXu0ERCypyY6rUN1Y+B8MqzRCRHzf52GG24R4qzUvnhAXzkhGmWcfkRaY5nxbtdd6p17WflP2ZcTpg+3Bu7cmgdIF83Rtqt0s6a5tOimz6oMG2V2yEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744915550; c=relaxed/simple;
	bh=UQJ3cHPNIJfNTtThVCS67J6ZgiGWA9N7kySvOgBXqas=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XlUEliKK0bt3IbTwzh2F2OKYDLgFMqiWZYj3PKQ8O5PXGJcPhM9fpf2Zk4AWjWm8IOgJ+4alx8BXxBtaYrFIAeXpEPZ2TBEM/R97D/Rjz9HDJM22awKo68Z8xRsmwTKkLpByRcGcdsY9hzTq4PeLIiJxtPpxLN6ZmsdwgOIuQyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-86b9ea43955so418272241.2;
        Thu, 17 Apr 2025 11:45:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744915546; x=1745520346;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iZMQj8X0iJJsX3N+tJ9eTXYmTEjQP3GlXyGoqldKnSo=;
        b=A03If6SQTl/MWGAZ5X2lZs0Ot2uf3r1gv8R18zJc+wrbgvSb2+O5FP9Npw5rzJnno6
         bq1Khf+fSk2t6XDmiPhh3pzuUeXASMyZp9z8/VD6CYj9WgAnOXwvYlp7r9HGITRZ6N1W
         lej8VfPIz8XH8ozGbtCJVgoX4raNJk7ECK0693g4+DvafCNrS/zEhzD7xqj0IkGIUK4d
         ESs4h9En59T7qlc+IylpV9D/dAvODMzSguq7O1/1ieVjSyS6wfyzNshgvFsAUYxFJlfD
         9/dm8TbOcZzlr8gPyEZ0RdN+0Gecj9a18pAbAGCQFNBZI4QYqwk/GgUwSTQERvMQV4aQ
         +AMg==
X-Forwarded-Encrypted: i=1; AJvYcCUXz/UeWEUwEGp7IXeKT+i9oYVNn8TadwZm1l99DMDW0lPSRixuaB2sESsdSiCMFsfy8eZvM1vrlInoBC5Asa8LsHU=@vger.kernel.org, AJvYcCUZENO/he/9zy1cuPyF0PpPan3DLlGCRaLFCwjz/sgny6BM2V3fSXLTKp988bBXB6DTqzl+mBQj1V4BIQlh@vger.kernel.org, AJvYcCUtXsYl6AdwhjyP2c5nsIvFDDqvSuttdsfXL3v93uE40Q+hlhSC/yRVsThdfURJtAjNVYm439GCgDQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIvF+etFHHlew85V7bU4GNWVY+ghKA50A108h+8RdrRaD25Z43
	Q7f60/imfup0yADDq4npT4WL+6cKTJncCtN2i9OCsyABfF4PUPM/BClbTBjR
X-Gm-Gg: ASbGncuhXBbO+X4P1B2sM43I3Jvaurqpg+GphAUhhygiyMPXef0FKxtVQUI4+L7oSpf
	4eXvSbJp8tkeYYB2xlzDkxL2ZBuvXx+zi36uiF/rbItzTvYcgltOy2oiCrPDH4Qlemoogm/TA/P
	qvR2Kq2tepzcEFqGMlkJ88DoIMma4YdfHLMBHbuAISiNBT9Rr2+5k6WPshhlK7w3ScbSLLic/tR
	zrnt8k/X7TLwHx7vj88QAJNkVEM6eQs2XiFXF4onDTJ4ySlQKn/lwfrHAM0RelohUH/4GQ//Mti
	+ZwYfR5FuM5lk/FTNpCWPAQ8ogiKPrYUP4zloDqOxO+/g7m1aJX83+NKzZ3WQEHPMuxTcifvZXl
	U76o=
X-Google-Smtp-Source: AGHT+IFm2ig/d7BSUEQmb59Q9K3L0b82e6dI9tddyJCG2FiIwoXW9Z0dg/kZAX3Zo3VJzIjAbzAynQ==
X-Received: by 2002:a05:6102:5f0b:b0:4cb:5d6c:993e with SMTP id ada2fe7eead31-4cb8011ca76mr218649137.14.1744915545860;
        Thu, 17 Apr 2025 11:45:45 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4cb7dde4512sm91837137.18.2025.04.17.11.45.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 11:45:45 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-86b9ea43955so418261241.2;
        Thu, 17 Apr 2025 11:45:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW15kZdJfEaqOfn2kpCQqZiDCLxslkGPcr7XGu8N+m7xbn/NYwpg9eXM+TjWxplvk4nFxTZg0ue30mZQmoov1XMK34=@vger.kernel.org, AJvYcCW47u2T5w5dq0I5rcd9YH2Ln9M4A3U6D85mPpmC4wU0lbb33FG4IP5To1XhfRP8Muf4idQ8/nIGYuw=@vger.kernel.org, AJvYcCXxEM6CmwRbTvc2vuRQ4iekZhX2vbsaUWOmWBqSmp+hmRqDtUghxTKqIlpEYgdts4ormQQPFdC4u92rGnsY@vger.kernel.org
X-Received: by 2002:a05:6102:115b:b0:4b9:bd00:454b with SMTP id
 ada2fe7eead31-4cb8011c0aemr212004137.13.1744915544925; Thu, 17 Apr 2025
 11:45:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403212919.1137670-1-thierry.bultel.yh@bp.renesas.com> <20250403212919.1137670-7-thierry.bultel.yh@bp.renesas.com>
In-Reply-To: <20250403212919.1137670-7-thierry.bultel.yh@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 17 Apr 2025 20:45:33 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVpiZ+F0TMbLm000M_Scwozj2-SHPrUwTHqFKckVcmufQ@mail.gmail.com>
X-Gm-Features: ATxdqUHUFRXMieHo8p6cb1Azl1zd0tkLKY21-JntKnQYtIH_x1tcL-8bqw-6C7c
Message-ID: <CAMuHMdVpiZ+F0TMbLm000M_Scwozj2-SHPrUwTHqFKckVcmufQ@mail.gmail.com>
Subject: Re: [PATCH v7 06/13] clk: renesas: Add support for R9A09G077 SoC
To: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Cc: thierry.bultel@linatsea.fr, linux-renesas-soc@vger.kernel.org, 
	paul.barker.ct@bp.renesas.com, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Thierry,

Thanks for your patch!

On Thu, 3 Apr 2025 at 23:30, Thierry Bultel
<thierry.bultel.yh@bp.renesas.com> wrote:
> RZ/T2H has 2 registers blocks at different addresses.

register

> The clock tree has configurable dividers and mux selectors.
> Add these new clock types, new register layout type, and
> registration code for mux and div in registration callback.
>
> Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>

> --- a/drivers/clk/renesas/Makefile
> +++ b/drivers/clk/renesas/Makefile
> @@ -31,6 +31,7 @@ obj-$(CONFIG_CLK_R8A779A0)            += r8a779a0-cpg-mssr.o
>  obj-$(CONFIG_CLK_R8A779F0)             += r8a779f0-cpg-mssr.o
>  obj-$(CONFIG_CLK_R8A779G0)             += r8a779g0-cpg-mssr.o
>  obj-$(CONFIG_CLK_R8A779H0)             += r8a779h0-cpg-mssr.o
> +obj-$(CONFIG_CLK_R9A09G077)            += r9a09g077-cpg-mssr.o

Please keep the list sorted.

>  obj-$(CONFIG_CLK_R9A06G032)            += r9a06g032-clocks.o
>  obj-$(CONFIG_CLK_R9A07G043)            += r9a07g043-cpg.o
>  obj-$(CONFIG_CLK_R9A07G044)            += r9a07g044-cpg.o
> diff --git a/drivers/clk/renesas/r9a09g077-cpg-mssr.c b/drivers/clk/renesas/r9a09g077-cpg-mssr.c
> new file mode 100644
> index 000000000000..b67dbf5d59d8
> --- /dev/null
> +++ b/drivers/clk/renesas/r9a09g077-cpg-mssr.c
> @@ -0,0 +1,238 @@
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
> +#define SCKCR          0x00
> +#define SCKCR2         0x04

Please add comments to indicate whether an offset is against base0
(e.g. SCKCR) or base1 (e.g. SCKCR2).

Perhaps encode it in a high-bit, like for the MSTPCRx registers, instead
of storing it separately in .sel_base, which is more error-prone?

> +#define SCKCR3         0x08
> +#define SCKCR4         0x0C
> +#define PMSEL          0x10
> +#define PMSEL_PLL0     BIT(0)
> +#define PMSEL_PLL2     BIT(2)
> +#define PMSEL_PLL3     BIT(3)
> +#define PLL0EN         BIT(0)
> +#define PLL2EN         BIT(0)
> +#define PLL3EN         BIT(0)

These 6 bit definitions don't match the documentation (and are unused?)

> +#define PLL0MON                0x20
> +#define PLL0EN_REG     0x30

Why the "_REG"-suffix? Unused, anyway.

> +#define PLL0_SSC_CTR   0x34
> +#define PLL1MON                0x40
> +#define LOCOCR         0x70
> +#define HIZCTRLEN      0x80
> +#define PLL2MON                0x90
> +#define PLL2EN_REG     0xA0
> +#define PLL2_SSC_CTR   0xAC
> +#define PLL3MON                0xB0
> +#define PLL3EN_REG     0xC0
> +#define PLL3_VCO_CTR0  0xC4
> +#define PLL3_VCO_CTR1  0xC8
> +#define PLL4MON                0xD0
> +#define PHYSEL         BIT(21)

SCKCR_PHYSEL? So it would belong under SCKCR.
But is unused, as you have the DIVETHPHY macro.

> +
> +#define MRCTLA         0x240
> +#define MRCTLE         0x250
> +#define MRCTLI         0x260
> +#define MRCTLM         0x270

Unused, these should end up in srcr_for_rzt2h[] in renesas-cpg-mssr.c
when adding reset controller support for RZ/T2H.

Until then, the call to cpg_mssr_reset_controller_register()
in cpg_mssr_probe() should be skipped when priv->reg_layout ==
CLK_REG_LAYOUT_RZ_T2H.

> +
> +#define DDIV_PACK(offset, bitpos, size) \
> +               (((offset) << 20) | ((bitpos) << 12) | ((size) << 8))

Indented by 2 TABs...

> +
> +#define DIVCA55                DDIV_PACK(SCKCR2, 8, 4)

This is not correct: these 4 bits are not a single bit mask, but 4
individual bits, one for each CPU core.
Oh, due to dtable_1_2[] just having values "0" and "15", all 4 CPU
cores are always clocked at the same rate. Hmm.....

> +#define DIVCA55S       DDIV_PACK(SCKCR2, 12, 1)
> +#define DIVCR520       DDIV_PACK(SCKCR2, 2, 2)
> +#define DIVCR521       DDIV_PACK(SCKCR2, 0, 2)

Surprisingly, you do handle the 2 CR52 cores individually ;-)
Unused, anyway...

> +#define DIVLCDC                DDIV_PACK(SCKCR3, 20, 3)

Should be "4" instead of "3".

> +#define DIVCKIO                DDIV_PACK(SCKCR, 16, 3)
> +#define DIVETHPHY      DDIV_PACK(SCKCR, 21, 1)
> +#define DIVCANFD       DDIV_PACK(SCKCR, 20, 1)
> +#define DIVSPI0                DDIV_PACK(SCKCR3, 0, 2)
> +#define DIVSPI1                DDIV_PACK(SCKCR3, 2, 2)
> +#define DIVSPI2                DDIV_PACK(SCKCR3, 4, 2)
> +#define DIVSPI3                DDIV_PACK(SCKCR2, 16, 2)

Perhaps sort these definitions by SCKCR* register?

> +
> +#define SEL_PLL_PACK(offset, bitpos, size) \
> +       (((offset) << 20) | ((bitpos) << 12) | ((size) << 8))

... indented by 1 TAB.  Please match them.

> +
> +#define SEL_PLL                SEL_PLL_PACK(SCKCR, 22, 1)
> +
> +#define GET_SHIFT(val)         FIELD_GET(GENMASK(19, 12), val)
> +#define GET_WIDTH(val)         FIELD_GET(GENMASK(11, 8), val)
> +#define GET_REG_OFFSET(val)    FIELD_GET(GENMASK(31, 20), val)

Please use consistent naming:
    SHIFT ~ bitpos
    WIDTH ~ size
    REG_OFFSET ~ offset

If you would use FIELD_*() helpers for both, you could write the above as e.g.

    #define OFFSET_MASK GENMASK(31, 20)
    #define SHIFT_MASK  GENMASK(19, 12)
    #define WIDTH_MASK  GENMASK(11, 8)

   #define SEL_PLL_PACK(offset, shift, width)  \
            (FIELD_PREP_CONST(OFFSET_MASK, (offset)) | \
             FIELD_PREP_CONST(SHIFT_MASK, (shift)) | \
             FIELD_PREP_CONST(WIDTH_MASK, (width))) \

    #define GET_SHIFT(val)         FIELD_GET(SHIFT_MASK, val)
    #define GET_WIDTH(val)         FIELD_GET(WIDTH_MASK val)
    #define GET_REG_OFFSET(val)    FIELD_GET(OFFSET_MASK, val)

> +
> +enum clk_ids {
> +       /* Core Clock Outputs exported to DT */
> +       LAST_DT_CORE_CLK = R9A09G077_LCDC_CLKD,
> +
> +       /* External Input Clocks */
> +       CLK_EXTAL,
> +       CLK_LOCO,

This is an internally-generated clock.

> +
> +       /* Internal Core Clocks */
> +       CLK_PLL0,
> +       CLK_PLL1,
> +       CLK_PLL2,
> +       CLK_PLL3,
> +       CLK_PLL4,
> +       CLK_SEL_PLL0,
> +       CLK_SEL_CLK_PLL0,
> +       CLK_SEL_PLL1,
> +       CLK_SEL_CLK_PLL1,
> +       CLK_SEL_PLL2,
> +       CLK_SEL_CLK_PLL2,
> +       CLK_SEL_PLL4,
> +       CLK_SEL_CLK_PLL4,
> +       CLK_SEL_CLK_SRC,
> +       CLK_SEL_EXTAL,
> +       CLK_SEL_LOCO,
> +       CLK_PLL3_INPUT,
> +
> +       /* Module Clocks */
> +       MOD_CLK_BASE,
> +};
> +
> +static const struct clk_div_table dtable_1_2[] = {
> +       {0, 2},
> +       {15, 1},
> +       {0, 0},
> +};
> +
> +/* Mux clock tables */
> +static const char * const sel_clk_pll0[] = { ".sel_loco", ".sel_pll0" };
> +static const char * const sel_clk_pll1[] = { ".sel_loco", ".sel_pll1" };
> +static const char * const sel_clk_pll4[] = { ".sel_loco", ".sel_pll4" };
> +
> +static const struct cpg_core_clk r9a09g077_core_clks[] __initconst = {
> +       /* External Clock Inputs */
> +       DEF_INPUT("extal", CLK_EXTAL),
> +       DEF_INPUT("loco", CLK_LOCO),

DEF_RATE(), as this is an internally-generated clock.

> +
> +       /* Internal Core Clocks */
> +       DEF_FIXED(".pll0", CLK_PLL0, CLK_EXTAL, 1, 48),
> +       DEF_FIXED(".pll1", CLK_PLL1, CLK_EXTAL, 1, 40),
> +       DEF_FIXED(".pll4", CLK_PLL4, CLK_EXTAL, 1, 96),
> +       DEF_FIXED(".sel_pll0", CLK_SEL_PLL0, CLK_PLL0, 1, 1),

This is the unimplemented selector to bypass the PLL, right?

> +       DEF_MUX(".sel_clk_pll0", CLK_SEL_CLK_PLL0, SEL_PLL,
> +               sel_clk_pll0, ARRAY_SIZE(sel_clk_pll0), 0, CLK_MUX_READ_ONLY),
> +       DEF_FIXED(".sel_pll1", CLK_SEL_PLL1, CLK_PLL1, 1, 1),
> +       DEF_MUX(".sel_clk_pll1", CLK_SEL_CLK_PLL1, SEL_PLL,
> +               sel_clk_pll1, ARRAY_SIZE(sel_clk_pll1), 0, CLK_MUX_READ_ONLY),
> +       DEF_FIXED(".sel_pll4", CLK_SEL_PLL4, CLK_PLL4, 1, 1),
> +       DEF_MUX(".sel_clk_pll4", CLK_SEL_CLK_PLL4, SEL_PLL,
> +               sel_clk_pll4, ARRAY_SIZE(sel_clk_pll4), 0, CLK_MUX_READ_ONLY),
> +
> +       /* Core output clk */
> +       DEF_DIV("CA55", R9A09G077_CA55, CLK_SEL_CLK_PLL0, DIVCA55,
> +               dtable_1_2, CLK_DIVIDER_HIWORD_MASK, 1),
> +       DEF_FIXED("PCLKM", R9A09G077_PCLKM, CLK_SEL_CLK_PLL1, 8, 1),
> +       DEF_FIXED("PCLKGPTL", R9A09G077_PCLKGPTL, CLK_SEL_CLK_PLL1, 2, 1),

Please sort these two alphabetically.

> +};
> +
> +static const struct mssr_mod_clk r9a09g077_mod_clks[] __initconst = {
> +       DEF_MOD("sci0", 108, R9A09G077_PCLKM),

Shouldn't that be 8 instead of 108?
Using R9A09G077_PCLKM as the parent is a temporary simplification,
right?

> +};
> +
> +static struct clk * __init
> +r9a09g077_cpg_div_clk_register(struct device *dev,
> +                              const struct cpg_core_clk *core,
> +                              void __iomem *base,
> +                              struct cpg_mssr_pub *pub)

Fits on one line less when wrapped.

> +{
> +       const struct clk *parent;
> +       const char *parent_name;
> +       struct clk_hw *clk_hw;
> +
> +       parent = pub->clks[core->parent];
> +
> +       if (IS_ERR(parent))
> +               return ERR_CAST(parent);
> +
> +       parent_name = __clk_get_name(parent);
> +
> +       if (core->dtable)
> +               clk_hw = clk_hw_register_divider_table(dev, core->name,
> +                                                      parent_name, 0,
> +                                                      base + GET_REG_OFFSET(core->conf),
> +                                                      GET_SHIFT(core->conf),
> +                                                      GET_WIDTH(core->conf),
> +                                                      core->flag,
> +                                                      core->dtable,
> +                                                      &pub->rmw_lock);
> +       else
> +               clk_hw = clk_hw_register_divider(dev, core->name,
> +                                                parent_name, 0,
> +                                                base + GET_REG_OFFSET(core->conf),
> +                                                GET_SHIFT(core->conf),
> +                                                GET_WIDTH(core->conf),
> +                                                core->flag, &pub->rmw_lock);
> +
> +       if (IS_ERR(clk_hw))
> +               return ERR_CAST(clk_hw);
> +
> +       return clk_hw->clk;
> +
> +}
> +
> +static struct clk * __init
> +r9a09g077_cpg_mux_clk_register(struct device *dev,
> +                              const struct cpg_core_clk *core,
> +                              void __iomem *base,
> +                              struct cpg_mssr_pub *pub)

Fits on one line less when wrapped.

> +{
> +       struct clk_hw *clk_hw;
> +
> +       clk_hw = devm_clk_hw_register_mux(dev, core->name,
> +                                         core->parent_names, core->num_parents,
> +                                         core->flag,
> +                                         base + GET_REG_OFFSET(core->conf),
> +                                         GET_SHIFT(core->conf),
> +                                         GET_WIDTH(core->conf),
> +                                         core->mux_flags, &pub->rmw_lock);

Missing error check for clk_hw.

> +       return clk_hw->clk;
> +}
> +
> +static struct clk * __init
> +r9a09g077_cpg_clk_register(struct device *dev,
> +                          const struct cpg_core_clk *core,
> +                          const struct cpg_mssr_info *info,
> +                          struct cpg_mssr_pub *pub)

Fits on one line less when wrapped.

> +{
> +       void __iomem *base = core->sel_base ? pub->base1 : pub->base0;
> +
> +       switch (core->type) {
> +       case CLK_TYPE_DIV:
> +               return r9a09g077_cpg_div_clk_register(dev, core, base, pub);
> +       case CLK_TYPE_MUX:
> +               return r9a09g077_cpg_mux_clk_register(dev, core, base, pub);
> +       default:
> +               return ERR_PTR(-EINVAL);
> +       }
> +}
> +
> +const struct cpg_mssr_info r9a09g077_cpg_mssr_info = {
> +       /* Core Clocks */
> +       .core_clks = r9a09g077_core_clks,
> +       .num_core_clks = ARRAY_SIZE(r9a09g077_core_clks),
> +       .last_dt_core_clk = LAST_DT_CORE_CLK,
> +       .num_total_core_clks = MOD_CLK_BASE,
> +
> +       /* Module Clocks */
> +       .mod_clks = r9a09g077_mod_clks,
> +       .num_mod_clks = ARRAY_SIZE(r9a09g077_mod_clks),
> +       .num_hw_mod_clks = 12 * 32,

"14 * 32", to account for the two gaps in the MSTPCRx registers?

> +
> +       .reg_layout = CLK_REG_LAYOUT_RZ_T2H,
> +       .cpg_clk_register = r9a09g077_cpg_clk_register,
> +};
> diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
> index 4bdfa4f65ab4..123bc1558e53 100644
> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> @@ -79,6 +79,27 @@ static const u16 mstpcr_for_gen4[] = {
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
> +#define RZT2H_MSTPCR(block, offset)    (((block) << RZT2H_MSTPCR_BLOCK_SHIFT) & \

"|" instead of "&"

> +                                       ((offset) & RZT2H_MSTPCR_OFFSET_MASK))
> +
> +#define RZT2H_MSTPCR_BLOCK(x)          ((x) >> RZT2H_MSTPCR_BLOCK_SHIFT)
> +#define RZT2H_MSTPCR_OFFSET(x)         ((x) & RZT2H_MSTPCR_OFFSET_MASK)
> +
> +static const u16 mstpcr_for_rzt2h[] = {
> +       RZT2H_MSTPCR(0, 0x300), RZT2H_MSTPCR(0, 0x304), RZT2H_MSTPCR(0, 0x308),
> +       RZT2H_MSTPCR(0, 0x30c), RZT2H_MSTPCR(0, 0x310), RZT2H_MSTPCR(1, 0x318),
> +       RZT2H_MSTPCR(1, 0x320), RZT2H_MSTPCR(0, 0x324), RZT2H_MSTPCR(0, 0x328),
> +       RZT2H_MSTPCR(0, 0x32c), RZT2H_MSTPCR(0, 0x330), RZT2H_MSTPCR(1, 0x334),

Missing holes for non-existent MSTPCRF (0x314) and MSTPCRH (0x31c).

> +};
> +
>  /*
>   * Standby Control Register offsets (RZ/A)
>   * Base address is FRQCR register

> @@ -227,7 +257,8 @@ static int cpg_mstp_clock_endisable(struct clk_hw *hw, bool enable)
>
>         spin_unlock_irqrestore(&priv->pub.rmw_lock, flags);
>
> -       if (!enable || priv->reg_layout == CLK_REG_LAYOUT_RZ_A)
> +       if (!enable || priv->reg_layout == CLK_REG_LAYOUT_RZ_A ||
> +               priv->reg_layout == CLK_REG_LAYOUT_RZ_T2H)

Please align the continuation of the if-condition with the start of
the condition above.

>                 return 0;
>
>         error = readl_poll_timeout_atomic(priv->pub.base0 + priv->status_regs[reg],
> @@ -258,6 +289,12 @@ static int cpg_mstp_clock_is_enabled(struct clk_hw *hw)
>
>         if (priv->reg_layout == CLK_REG_LAYOUT_RZ_A)
>                 value = readb(priv->pub.base0 + priv->control_regs[reg]);
> +       else if (priv->reg_layout == CLK_REG_LAYOUT_RZ_T2H) {

Please use curly braces in all branches if you need them in at least
one branch...

> +               void __iomem *addr =
> +                       cpg_rzt2h_addr_from_offset(hw,
> +                                                  priv->control_regs[reg]);
> +               value = readw(addr);

Aren't the MSTPCR* registers 32-bit wide?

... however, you can avoid the curly braces by moving the register
read into the helper function.

> +       }
>         else
>                 value = readl(priv->pub.base0 + priv->status_regs[reg]);
>

> --- a/drivers/clk/renesas/renesas-cpg-mssr.h
> +++ b/drivers/clk/renesas/renesas-cpg-mssr.h
> @@ -22,6 +22,8 @@
>  struct cpg_core_clk {
>         /* Common */
>         const char *name;
> +       const char * const *parent_names;
> +       const struct clk_div_table *dtable;

Please move them below, as they are type-specific.
I think they are never used together, so you can reduce kernel size
by combining them into an anonymous union.

>         unsigned int id;
>         unsigned int type;
>         /* Depending on type */
> @@ -29,18 +31,26 @@ struct cpg_core_clk {
>         unsigned int div;
>         unsigned int mult;
>         unsigned int offset;
> +       unsigned int conf;

u32

> +       int flag;

u8? (or u16, cfr. clk_divider.flags? see below)

> +       int mux_flags;

u8 (cfr. clk_mux.flags)

> +       int num_parents;

u8?

> +       int sel_base;

bool?

> +};

FTR, your additions as-is would have increased the size of each core
clock on arm64 by 32 bytes.

Note to self: use unions for every core clock type.

>  /**
>   * struct cpg_mssr_pub - Private data shared with
>   * device-specific clk registration code
>   *
>   * @base0: CPG/MSSR register block base0 address
> + * @base1: CPG/MSSR register block base1 address
>   * @rmw_lock: protects RMW register accesses
>   * @notifiers: Notifier chain to save/restore clock state for system resume
>   * @clks: pointer to clocks
>   */
>  struct cpg_mssr_pub {
>         void __iomem *base0;
> +       void __iomem *base1;
>         struct raw_notifier_head notifiers;
>         spinlock_t rmw_lock;
>         struct clk **clks;
> @@ -53,6 +63,8 @@ enum clk_types {
>         CLK_TYPE_DIV6P1,        /* DIV6 Clock with 1 parent clock */
>         CLK_TYPE_DIV6_RO,       /* DIV6 Clock read only with extra divisor */
>         CLK_TYPE_FR,            /* Fixed Rate Clock */
> +       CLK_TYPE_DIV,           /* Clock with divider */
> +       CLK_TYPE_MUX,           /* Clock with clock source selector */

Please move these into a new enum in r9a09g077-cpg-mssr.c, starting
from CLK_TYPE_CUSTOM, as they are specific to RZ/T2H.

>
>         /* Custom definitions start here */
>         CLK_TYPE_CUSTOM,
> @@ -73,6 +85,15 @@ enum clk_types {
>         DEF_BASE(_name, _id, CLK_TYPE_DIV6_RO, _parent, .offset = _offset, .div = _div, .mult = 1)
>  #define DEF_RATE(_name, _id, _rate)    \
>         DEF_TYPE(_name, _id, CLK_TYPE_FR, .mult = _rate)
> +#define DEF_DIV(_name, _id, _parent, _conf, _dtable, _flag, _sel_base) \
> +       DEF_TYPE(_name, _id, CLK_TYPE_DIV, .conf = _conf, \
> +                .parent = _parent, .dtable = _dtable, .flag = _flag, .sel_base = _sel_base)
> +#define DEF_MUX(_name, _id, _conf, _parent_names, _num_parents, _flag, \
> +               _mux_flags) \
> +       DEF_TYPE(_name, _id, CLK_TYPE_MUX, .conf = _conf, \
> +                .parent_names = _parent_names, .num_parents = _num_parents, \
> +                .flag = _flag, .mux_flags = _mux_flags)

The passed _flag parameter is always 0?
So when non-zero, cpg_core_clk.flag is always clk_divider.flags.

Please move both definitions to r9a09g077-cpg-mssr.c, as they are
specific to RZ/T2H.

> +
>
>      /*
>       * Definitions of Module Clocks

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

