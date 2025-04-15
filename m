Return-Path: <linux-renesas-soc+bounces-16022-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1FBDA8A1F0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 16:55:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B39757A503A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Apr 2025 14:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C23028BABF;
	Tue, 15 Apr 2025 14:55:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8C718FDD2;
	Tue, 15 Apr 2025 14:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744728909; cv=none; b=fvg+zzy3vO4As864EEfoHtiok0am795hqUeCorhkj5/ATJKfwyXZOJaK4jfYiEiEZlsXNP/HiJpAubpTMUgqR/4UDW6yPsM3WCwgKOAXCiEgNTgBqx72ZWPT95KrKiOf1i+eZRr+ZMVeFAgpf9c4+ZaKfx1IJEIxf4Hg94DbLIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744728909; c=relaxed/simple;
	bh=WAP1jjTJ0L+B6JzPghGwZUWib1hRmJZHxlNQ2jGNYYY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AM7Jh7sUSNIUvS3b4vbctS6GeIdXV+n9e4E1TXSzc9n/KiY3F2AunB4+wdXuC2jBelVoEog40JUDA46t5VKeli1LyqBB9tX1Ko3Ln5JMeS3sFqAIchyfqmPcdwet1EKsoLnjTouHDAeM3EicyuRRCAsQHvXrcydCAjl0bC9NZKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5240a432462so4774770e0c.1;
        Tue, 15 Apr 2025 07:55:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744728905; x=1745333705;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UjnXL5knJpG/wreJMCMBALoWjlWV/3Q4ztcHY817xf8=;
        b=fcfeJbYsoOvp+ouju/pApW8Pnu9V2dBKQSbquYoCGD461B6U/VT+vyrDNjsCywrD4D
         WNu7Ajl+YEQrt9ZzMN4OmS1WFkkO8s3Tj1IHWQMk37es0qIW9h98JsXWwv5xwavEA5Og
         561EsfDCrGcjP395Z8qdQAjOrKCaD1lpeoSWQNSBEgjp0WY07nlcL1zNgp+04qfVUnKt
         Pt2KPdnJDffrRc5tLrDZwNb6r2K7HmgFdKSYsO/OLpkD3+qG9NZUlMNbfxmKIYJUC5gJ
         AVmbnwFsVNAradYLZqEvPmEc7Hq0otU6C/yFNAbCAMSao2446FfRCJZC3UBhJ4T2hhFG
         eCtg==
X-Forwarded-Encrypted: i=1; AJvYcCUs0GZYlNynbW6VWu/U0WLiWk4kH1o1R7FuWGoUuvmLSsR6J5OOj60YIgMBTJf66tl60duyHUY8BuIC@vger.kernel.org, AJvYcCWPa+n5a6Wmca4QG0bmZVnp5pKFa5xSR/byabadHv/JGUbZKDyrznp0u97m9OtP0w+CpARzinbhqLlvbhIs@vger.kernel.org, AJvYcCXL+3awUpXodYuwjExk6+GLZNwV78f5Ypn6H7aTiZqH+Ec/XkF55yBiGOVwYEuXVeyDyaNKs2c7Br5b@vger.kernel.org, AJvYcCXrei7hkmPZ00XFUFp9Y2A0Px2yWg+oyLeD7WLBDmnkw38x2ED2Ri2ivWDNhogJMEyySM8tuuUpe6MmxWxBDvf6ixc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWPzidKg3ELej3sslN2MqknpfJJBmPFDjj9XJJOWZup+v8foN8
	5NwPBmssIBrMSWKagDLlZvz8NFu3zgu77T2gx/slaNGzxuud44U175pqYHjX
X-Gm-Gg: ASbGncu34pECrq+VjkWLB0lNygxaGZigJv5rCgZNHv/YpbQhDzyQ2wOdxAkw4g7CNNt
	zfjEMO8wuS8ZF0IKib/+e11foKOOfwrVchqEsDjChrcFYdQ+gyPMSBykmo56gviIviDoyIeDDRk
	wkr8p8lEB08HQCrdob02A5v6tS2PneDQ6gTsX47uXwkRl5Ma6nXgrB9ODwAP2I9ueh2IgJrpvqV
	onr8CQXkGJlPEnt3T2qqX1SMyLiAyVyLqfV9o8b7Q6XjYAN4kmznOUYlKEUaLEQRBIyWfvut8YV
	Y2R7orov6oJ9eAnTvk7KzHXskorYoxf3iI9bRSonvFTAr7JOOrhzqA+vQzFSsTpJmryyy4uK+9e
	SeZQ=
X-Google-Smtp-Source: AGHT+IGVdFCYxjYUiHpCu4KjliUgT5NOXTnrEz67sUYfmKNXquUrp9M6SmZ5dfTuu1xfp/7h3xFLrQ==
X-Received: by 2002:a05:6122:547:b0:523:6eef:af62 with SMTP id 71dfb90a1353d-528f0c5b625mr2885463e0c.4.1744728904654;
        Tue, 15 Apr 2025 07:55:04 -0700 (PDT)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-527abd9b7edsm2693089e0c.25.2025.04.15.07.55.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 07:55:04 -0700 (PDT)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-4c315dd9252so331844137.1;
        Tue, 15 Apr 2025 07:55:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU/JswGKPk104hjehl8IKLJIPIAjcybQGeUacXuXZAD75r1Ij/Qkzqdrh4ajt8uEkmThtPoLAHZ5NSp@vger.kernel.org, AJvYcCVKkYsCdm+rRHZ+FwACTW8QfHsTMiHMcWF6SIuhbJOfXnUg7qkclBegkDjqP6O2L1zTLlQ5kmX74ZvesWP2fOlwaTk=@vger.kernel.org, AJvYcCVYDbnRsQmyXMXvM+VRrQh41vrKNbJJuWxzpXe7QFvJFFxRiii9fm0x6AhbkL3FR1LcBzseASFJqLLeRQAW@vger.kernel.org, AJvYcCXRmqD9uqFtBx8qydJmqYVMdxpt7iVdi3G56dPLdsNS1x6bRbcmVXGj8rv/snyt6B1bKm3i5Bupu0Jb@vger.kernel.org
X-Received: by 2002:a05:6102:19d3:b0:4c1:8ded:2d66 with SMTP id
 ada2fe7eead31-4cb42eb2adfmr2215740137.12.1744728903926; Tue, 15 Apr 2025
 07:55:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407165202.197570-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20250407165202.197570-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20250407165202.197570-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 15 Apr 2025 16:54:52 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXtfzp81V4uAk-oULoBz2BtipyPvc9V8oV=kDXmX90GxA@mail.gmail.com>
X-Gm-Features: ATxdqUENkdLt9_RZsiQ9Bx12mTANJYi4ogVLHQbPNmN-vU6vgw4yuDn_QhlOO9M
Message-ID: <CAMuHMdXtfzp81V4uAk-oULoBz2BtipyPvc9V8oV=kDXmX90GxA@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] clk: renesas: r9a09g057: Add clock and reset
 entries for GBETH0/1
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Mon, 7 Apr 2025 at 18:52, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add clock and reset entries for GBETH instances. Include core clocks for
> PTP, sourced from PLLETH, and add PLLs, dividers, and static mux clocks
> used as clock sources for the GBETH IP.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  drivers/clk/renesas/r9a09g057-cpg.c | 72 +++++++++++++++++++++++++++++
>  drivers/clk/renesas/rzv2h-cpg.h     | 11 +++++
>  2 files changed, 83 insertions(+)
>
> diff --git a/drivers/clk/renesas/r9a09g057-cpg.c b/drivers/clk/renesas/r9a09g057-cpg.c
> index 3c40e36259fe..057bfa0e2a57 100644
> --- a/drivers/clk/renesas/r9a09g057-cpg.c
> +++ b/drivers/clk/renesas/r9a09g057-cpg.c

> @@ -115,6 +138,17 @@ static const struct cpg_core_clk r9a09g057_core_clks[] __initconst = {
>         DEF_DDIV(".pllvdo_cru2", CLK_PLLVDO_CRU2, CLK_PLLVDO, CDDIV4_DIVCTL1, dtable_2_4),
>         DEF_DDIV(".pllvdo_cru3", CLK_PLLVDO_CRU3, CLK_PLLVDO, CDDIV4_DIVCTL2, dtable_2_4),
>
> +       DEF_FIXED(".plleth_250_fix", CLK_PLLETH_DIV_250_FIX, CLK_PLLETH, 1, 4),
> +       DEF_FIXED(".plleth_125_fix", CLK_PLLETH_DIV_125_FIX, CLK_PLLETH_DIV_250_FIX, 1, 2),
> +       DEF_CSDIV(".plleth_gbe0", CLK_CSDIV_PLLETH_GBE0,
> +                 CLK_PLLETH_DIV_250_FIX, CSDIV0_DIVCTL0, dtable_2_100),
> +       DEF_CSDIV(".plleth_gbe1", CLK_CSDIV_PLLETH_GBE1,
> +                 CLK_PLLETH_DIV_250_FIX, CSDIV0_DIVCTL1, dtable_2_100),
> +       DEF_SMUX(".smux2_gbe0_txclk", CLK_SMUX2_GBE0_TXCLK, SSEL0_SELCTL2, smux2_gbe0_txclk),
> +       DEF_SMUX(".smux2_gbe0_rxclk", CLK_SMUX2_GBE0_RXCLK, SSEL0_SELCTL3, smux2_gbe0_rxclk),
> +       DEF_SMUX(".smux2_gbe1_txclk", CLK_SMUX2_GBE1_TXCLK, SSEL1_SELCTL0, smux2_gbe1_txclk),
> +       DEF_SMUX(".smux2_gbe1_rxclk", CLK_SMUX2_GBE1_RXCLK, SSEL1_SELCTL1, smux2_gbe1_rxclk),
> +
>         DEF_DDIV(".pllgpu_gear", CLK_PLLGPU_GEAR, CLK_PLLGPU, CDDIV3_DIVCTL1, dtable_2_64),
>
>         /* Core Clocks */

> @@ -233,6 +271,38 @@ static const struct rzv2h_mod_clk r9a09g057_mod_clks[] __initconst = {
>                                                 BUS_MSTOP(7, BIT(10))),
>         DEF_MOD("usb2_0_pclk_usbtst1",          CLK_PLLDTY_ACPU_DIV4, 11, 7, 5, 23,
>                                                 BUS_MSTOP(7, BIT(11))),
> +       DEF_MOD_EXTERNAL("gbeth_0_clk_tx_i",    CLK_SMUX2_GBE0_TXCLK, 11, 8, 5, 24,
> +                                               BUS_MSTOP(8, BIT(5)),
> +                                               0x300, 8, 1),

CPG_SSEL0

I'm wondering if you really have to store and duplicate this info here.
Can't you infer it from the parent's smux description?

> +       DEF_MOD_EXTERNAL("gbeth_0_clk_rx_i",    CLK_SMUX2_GBE0_RXCLK, 11, 9, 5, 25,
> +                                               BUS_MSTOP(8, BIT(5)),
> +                                               0x300, 12, 1),
> +       DEF_MOD_EXTERNAL("gbeth_0_clk_tx_180_i", CLK_SMUX2_GBE0_TXCLK, 11, 10, 5, 26,
> +                                               BUS_MSTOP(8, BIT(5)),
> +                                               0x300, 8, 1),
> +       DEF_MOD_EXTERNAL("gbeth_0_clk_rx_180_i", CLK_SMUX2_GBE0_RXCLK, 11, 11, 5, 27,
> +                                               BUS_MSTOP(8, BIT(5)),
> +                                               0x300, 12, 1),
> +       DEF_MOD("gbeth_0_aclk_csr_i",           CLK_PLLDTY_DIV8, 11, 12, 5, 28,
> +                                               BUS_MSTOP(8, BIT(5))),
> +       DEF_MOD("gbeth_0_aclk_i",               CLK_PLLDTY_DIV8, 11, 13, 5, 29,
> +                                               BUS_MSTOP(8, BIT(5))),
> +       DEF_MOD_EXTERNAL("gbeth_1_clk_tx_i",    CLK_SMUX2_GBE1_TXCLK, 11, 14, 5, 30,
> +                                               BUS_MSTOP(8, BIT(6)),
> +                                               0x304, 8, 1),

CPG_SSEL0

> +       DEF_MOD_EXTERNAL("gbeth_1_clk_rx_i",    CLK_SMUX2_GBE1_RXCLK, 11, 15, 5, 31,
> +                                               BUS_MSTOP(8, BIT(6)),
> +                                               0x304, 12, 1),
> +       DEF_MOD_EXTERNAL("gbeth_1_clk_tx_180_i", CLK_SMUX2_GBE1_TXCLK, 12, 0, 6, 0,
> +                                               BUS_MSTOP(8, BIT(6)),
> +                                               0x304, 8, 1),
> +       DEF_MOD_EXTERNAL("gbeth_1_clk_rx_180_i", CLK_SMUX2_GBE1_RXCLK, 12, 1, 6, 1,
> +                                               BUS_MSTOP(8, BIT(6)),
> +                                               0x304, 12, 1),
> +       DEF_MOD("gbeth_1_aclk_csr_i",           CLK_PLLDTY_DIV8, 12, 2, 6, 2,
> +                                               BUS_MSTOP(8, BIT(6))),
> +       DEF_MOD("gbeth_1_aclk_i",               CLK_PLLDTY_DIV8, 12, 3, 6, 3,
> +                                               BUS_MSTOP(8, BIT(6))),
>         DEF_MOD("cru_0_aclk",                   CLK_PLLDTY_ACPU_DIV2, 13, 2, 6, 18,
>                                                 BUS_MSTOP(9, BIT(4))),
>         DEF_MOD_NO_PM("cru_0_vclk",             CLK_PLLVDO_CRU0, 13, 3, 6, 19,
> @@ -304,6 +374,8 @@ static const struct rzv2h_reset r9a09g057_resets[] __initconst = {
>         DEF_RST(10, 13, 4, 30),         /* USB2_0_U2H1_HRESETN */
>         DEF_RST(10, 14, 4, 31),         /* USB2_0_U2P_EXL_SYSRST */
>         DEF_RST(10, 15, 5, 0),          /* USB2_0_PRESETN */
> +       DEF_RST(11, 0, 5, 1),           /* GBETH_0_ARESETN_I */
> +       DEF_RST(11, 1, 5, 2),           /* GBETH_1_ARESETN_I */
>         DEF_RST(12, 5, 5, 22),          /* CRU_0_PRESETN */
>         DEF_RST(12, 6, 5, 23),          /* CRU_0_ARESETN */
>         DEF_RST(12, 7, 5, 24),          /* CRU_0_S_RESETN */
> diff --git a/drivers/clk/renesas/rzv2h-cpg.h b/drivers/clk/renesas/rzv2h-cpg.h
> index c64cfead6dc1..e730179d92aa 100644
> --- a/drivers/clk/renesas/rzv2h-cpg.h
> +++ b/drivers/clk/renesas/rzv2h-cpg.h
> @@ -93,10 +93,13 @@ struct smuxed {
>                 .width = (_width), \
>         })
>
> +#define CPG_SSEL0              (0x300)
> +#define CPG_SSEL1              (0x304)
>  #define CPG_CDDIV0             (0x400)
>  #define CPG_CDDIV1             (0x404)
>  #define CPG_CDDIV3             (0x40C)
>  #define CPG_CDDIV4             (0x410)
> +#define CPG_CSDIV0             (0x500)
>
>  #define CDDIV0_DIVCTL1 DDIV_PACK(CPG_CDDIV0, 4, 3, 1)
>  #define CDDIV0_DIVCTL2 DDIV_PACK(CPG_CDDIV0, 8, 3, 2)
> @@ -111,6 +114,14 @@ struct smuxed {
>  #define CDDIV4_DIVCTL1 DDIV_PACK(CPG_CDDIV4, 4, 1, 17)
>  #define CDDIV4_DIVCTL2 DDIV_PACK(CPG_CDDIV4, 8, 1, 18)
>
> +#define CSDIV0_DIVCTL0 DDIV_PACK(CPG_CSDIV0, 0, 2, CSDIV_NO_MON)
> +#define CSDIV0_DIVCTL1 DDIV_PACK(CPG_CSDIV0, 4, 2, CSDIV_NO_MON)
> +
> +#define SSEL0_SELCTL2  SMUX_PACK(CPG_SSEL0, 8, 1)
> +#define SSEL0_SELCTL3  SMUX_PACK(CPG_SSEL0, 12, 1)
> +#define SSEL1_SELCTL0  SMUX_PACK(CPG_SSEL1, 0, 1)
> +#define SSEL1_SELCTL1  SMUX_PACK(CPG_SSEL1, 4, 1)
> +
>  #define BUS_MSTOP_IDX_MASK     GENMASK(31, 16)
>  #define BUS_MSTOP_BITS_MASK    GENMASK(15, 0)
>  #define BUS_MSTOP(idx, mask)   (FIELD_PREP_CONST(BUS_MSTOP_IDX_MASK, (idx)) | \

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

