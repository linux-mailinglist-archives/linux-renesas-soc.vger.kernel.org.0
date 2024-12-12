Return-Path: <linux-renesas-soc+bounces-11265-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0629EEC6F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Dec 2024 16:34:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A765A164014
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Dec 2024 15:32:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EB97212F9E;
	Thu, 12 Dec 2024 15:32:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECB621764F;
	Thu, 12 Dec 2024 15:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734017567; cv=none; b=L7IhacY/lhm4UfQZljVz1/BmopOxLwbNk4SIWK7NzKoLecC1+cP0i0dd5knKIpuuzTQxEOGrM4rklfg1T8QhNVlqq/ufg1gfiJ6iA4Q3PEnM8KEvpSwBsMPBQk7bWmvHM88M+C/7E/WLIInzX9PEEeQw1nUz7ZC79hcYK+aLJKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734017567; c=relaxed/simple;
	bh=vb6HNuGBRa19ICjEtekkZFeYMfqSphcTpTA8S6lCg8o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jPLCANsyATn+KDo+q4RTcaXWIvfcLj2NzFIpOnTzTijQSAoM7DFCH02jKY81KBBA6klAyv75Qk/eNWRfMHny7stg1199G0bpRHA6hc8pJZZ/37OpL9vvv32ysRc88t8HRGOTARuWpG1sli2Tkm3XC5C1QOPAu1llvUvJw8LwSLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6d932b5081eso6489706d6.1;
        Thu, 12 Dec 2024 07:32:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734017564; x=1734622364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JbqAAEBkrK83sVx5URt80SeC5aqZk2L2mmBVuNzAcTM=;
        b=tp5l2E1zmDwpETE6OoeLy1ruQgUr/GHI5Ux5tV1BKCe5yILljow2EWW7EdWbBE8kWI
         d3WTpyEajYrb+VUQukNqXYZ/ziSs20HNtyJBNoAvgCGe/hGbl0Uo5hxMf/iCSgJ6Bwu9
         1hWmwple7Rf6SGvfytCrkzPqN8jKRM6Vn9kmkFb8MzRcojCpK/aCxlm0efsTJ7Q1Q25U
         eptAnLW/PM3T+/se7IYrPDSLqKFr05kezumXLBqUgtrvC994iiYC857el4io/01H9ZXv
         rg7c3tUmV0tRVOAbsGjQOEQ0s6AWl5viIyAiSLxPxNih0Ul1ApjFO7GWUgmZ48sAAEF5
         IdPA==
X-Forwarded-Encrypted: i=1; AJvYcCVT+JrnH5h7a0E3T0BwigM9NI1/SPVBIcIHwjoznU6M2bsU5CCgf8FKqmMTcVNm8aIM3GDnqlmZAr6LblYCjnE91So=@vger.kernel.org, AJvYcCXY/gLJCXnSmYUA47mB0hr48pWVNbEQTk/ZEwIyGujIFi7GRhbzNZFf7u2utBIspGvBPzonWi/0HAE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMUx0yke9Lgq2IZIoVxACIHFqYoLKdkobjhXjes5a86XhG6SfL
	BTpgQPdX1YdhpgH2qKbxsgs5DYeJqqCUJkXok799YsdIJRuzKeB2hW0ukhRmk8M=
X-Gm-Gg: ASbGncvkNIIeffnHdmLYsml6ScSTAhm78LRcQLqpZRM0Lm6DBlptvo5bSYUTch50+Z7
	wEJYuRTkHApkOqlkjzYkuJjBe21WEwS7C5bu4kPzKLX6LpSw4POoAzdUicqS/CRQfbvkFWnLCyD
	oHess4Ak14ESS249VHo5YBy8Aa2XRmbbzlLMBhSU4IDLXIiWy2ASFYQd31E1Mt75CdQ937Of1G9
	6DgrzviQB1DPTyO/mGshysb5rD0xtUFy7JDMCKJUp8Jn3WNA9lpnF4SN7nXuU7MeXSADte5oHVn
	4eDlOuDfLGh1Xo2tUnU=
X-Google-Smtp-Source: AGHT+IFAlZMXEU1rnOpq8xNfd69svqWmrMU/clCzsVAwBtq42waGhnlF088ilG4mVqe0fBRz4bT6jA==
X-Received: by 2002:ad4:4ee4:0:b0:6d8:8a7b:66a4 with SMTP id 6a1803df08f44-6db0f73375amr10231506d6.14.1734017563965;
        Thu, 12 Dec 2024 07:32:43 -0800 (PST)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com. [209.85.219.45])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d8dabffcbfsm82904906d6.119.2024.12.12.07.32.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 07:32:43 -0800 (PST)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6d8e8445219so6146146d6.0;
        Thu, 12 Dec 2024 07:32:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVqgVtsqS1JDKKD9tHKp4b2AYGmFI+p4h6Pl4jZCAl98+zGqjyzZzj6zy+WQpiItHc46PXcbtNJbkcdUoLUGazS6v8=@vger.kernel.org, AJvYcCXLCsy4b7FFR4nhS5YdZpS84q2l5eNGHxRudj0VCfZXjybgxkU2laTdHH7NqEDagoOwGjaHN2BlEPY=@vger.kernel.org
X-Received: by 2002:a05:6214:20cd:b0:6d4:243f:6c9c with SMTP id
 6a1803df08f44-6db0f7093bamr10094306d6.9.1734017563515; Thu, 12 Dec 2024
 07:32:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241203105005.103927-1-biju.das.jz@bp.renesas.com> <20241203105005.103927-8-biju.das.jz@bp.renesas.com>
In-Reply-To: <20241203105005.103927-8-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Dec 2024 16:32:31 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVinf4grXtKPfPfzBJoBoFiRk0K+A60811Eh5+iJx5zYg@mail.gmail.com>
Message-ID: <CAMuHMdVinf4grXtKPfPfzBJoBoFiRk0K+A60811Eh5+iJx5zYg@mail.gmail.com>
Subject: Re: [PATCH v2 07/13] clk: renesas: rzv2h-cpg: Add MSTOP support
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

On Tue, Dec 3, 2024 at 11:50=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
> Add bus MSTOP support for RZ/{V2H, G3E}. For some module clocks, there
> are no MSTOP bits and the sequence ordering for mstop and clock on
> is different compared to the RZ/G2L family.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v1->v2:
>  * This patch has dependency on [1]
>  * Added MSTOP data for RZ/V2H CRU IP.
>  * Fixed typo clock->clk in error path of rzv2h_cpg_register_mod_clk()

Thanks for the update!

>  drivers/clk/renesas/r9a09g047-cpg.c |   6 +-
>  drivers/clk/renesas/r9a09g057-cpg.c | 153 ++++++++++++++++++----------
>  drivers/clk/renesas/rzv2h-cpg.c     |  92 ++++++++++++++++-
>  drivers/clk/renesas/rzv2h-cpg.h     |  26 +++--
>  4 files changed, 214 insertions(+), 63 deletions(-)

Please split this patch in two parts, to ease backporting:
  A. New MSTOP support for RZ/V2H,
  B. RZ/G3E MSTOP support.
Then, move part A forward in the series, and fold part B into "[PATCH
v2 06/13] clk: renesas: Add support for RZ/G3E SoC".

> --- a/drivers/clk/renesas/r9a09g057-cpg.c
> +++ b/drivers/clk/renesas/r9a09g057-cpg.c
> @@ -115,57 +115,108 @@ static const struct cpg_core_clk r9a09g057_core_cl=
ks[] __initconst =3D {
>  };
>
>  static const struct rzv2h_mod_clk r9a09g057_mod_clks[] __initconst =3D {

[...]

> +                                               BUS_MSTOP(1, BIT(8))),
> +       DEF_MOD("sdhi_0_imclk",                 CLK_PLLCLN_DIV8, 10, 3, 5=
, 3,
> +                                               BUS_MSTOP_NO_DATA),
> +       DEF_MOD("sdhi_0_imclk2",                CLK_PLLCLN_DIV8, 10, 4, 5=
, 4,
> +                                               BUS_MSTOP_NO_DATA),
> +       DEF_MOD("sdhi_0_clk_hs",                CLK_PLLCLN_DIV2, 10, 5, 5=
, 5,
> +                                               BUS_MSTOP_NO_DATA),
> +       DEF_MOD("sdhi_0_aclk",                  CLK_PLLDTY_ACPU_DIV4, 10,=
 6, 5, 6,
> +                                               BUS_MSTOP_NO_DATA),

BUS_MSTOP(8), BIT(2)) for all four above?

> +       DEF_MOD("sdhi_1_imclk",                 CLK_PLLCLN_DIV8, 10, 7, 5=
, 7,
> +                                               BUS_MSTOP_NO_DATA),
> +       DEF_MOD("sdhi_1_imclk2",                CLK_PLLCLN_DIV8, 10, 8, 5=
, 8,
> +                                               BUS_MSTOP_NO_DATA),
> +       DEF_MOD("sdhi_1_clk_hs",                CLK_PLLCLN_DIV2, 10, 9, 5=
, 9,
> +                                               BUS_MSTOP_NO_DATA),
> +       DEF_MOD("sdhi_1_aclk",                  CLK_PLLDTY_ACPU_DIV4, 10,=
 10, 5, 10,
> +                                               BUS_MSTOP_NO_DATA),

BUS_MSTOP(8), BIT(3)) for all four above?

> +       DEF_MOD("sdhi_2_imclk",                 CLK_PLLCLN_DIV8, 10, 11, =
5, 11,
> +                                               BUS_MSTOP_NO_DATA),
> +       DEF_MOD("sdhi_2_imclk2",                CLK_PLLCLN_DIV8, 10, 12, =
5, 12,
> +                                               BUS_MSTOP_NO_DATA),
> +       DEF_MOD("sdhi_2_clk_hs",                CLK_PLLCLN_DIV2, 10, 13, =
5, 13,
> +                                               BUS_MSTOP_NO_DATA),
> +       DEF_MOD("sdhi_2_aclk",                  CLK_PLLDTY_ACPU_DIV4, 10,=
 14, 5, 14,
> +                                               BUS_MSTOP_NO_DATA),

BUS_MSTOP(8), BIT(4)) for all four above?

> +       DEF_MOD("cru_0_aclk",                   CLK_PLLDTY_ACPU_DIV2, 13,=
 2, 6, 18,
> +                                               BUS_MSTOP(9, BIT(4))),
> +       DEF_MOD_NO_PM("cru_0_vclk",             CLK_PLLVDO_CRU0, 13, 3, 6=
, 19,
> +                                               BUS_MSTOP(9, BIT(4))),
> +       DEF_MOD("cru_0_pclk",                   CLK_PLLDTY_DIV16, 13, 4, =
6, 20,
> +                                               BUS_MSTOP(9, BIT(4))),
> +       DEF_MOD("cru_1_aclk",                   CLK_PLLDTY_ACPU_DIV2, 13,=
 5, 6, 21,
> +                                               BUS_MSTOP(9, BIT(5))),
> +       DEF_MOD_NO_PM("cru_1_vclk",             CLK_PLLVDO_CRU1, 13, 6, 6=
, 22,
> +                                               BUS_MSTOP(9, BIT(5))),
> +       DEF_MOD("cru_1_pclk",                   CLK_PLLDTY_DIV16, 13, 7, =
6, 23,
> +                                               BUS_MSTOP(9, BIT(5))),
> +       DEF_MOD("cru_2_aclk",                   CLK_PLLDTY_ACPU_DIV2, 13,=
 8, 6, 24,
> +                                               BUS_MSTOP(9, BIT(6))),
> +       DEF_MOD_NO_PM("cru_2_vclk",             CLK_PLLVDO_CRU2, 13, 9, 6=
, 25,
> +                                               BUS_MSTOP(9, BIT(6))),
> +       DEF_MOD("cru_2_pclk",                   CLK_PLLDTY_DIV16, 13, 10,=
 6, 26,
> +                                               BUS_MSTOP(9, BIT(6))),
> +       DEF_MOD("cru_3_aclk",                   CLK_PLLDTY_ACPU_DIV2, 13,=
 11, 6, 27,
> +                                               BUS_MSTOP(9, BIT(7))),
> +       DEF_MOD_NO_PM("cru_3_vclk",             CLK_PLLVDO_CRU3, 13, 12, =
6, 28,
> +                                               BUS_MSTOP(9, BIT(7))),
> +       DEF_MOD("cru_3_pclk",                   CLK_PLLDTY_DIV16, 13, 13,=
 6, 29,
> +                                               BUS_MSTOP(9, BIT(7))),
>  };
>
>  static const struct rzv2h_reset r9a09g057_resets[] __initconst =3D {

> --- a/drivers/clk/renesas/rzv2h-cpg.c
> +++ b/drivers/clk/renesas/rzv2h-cpg.c
> @@ -83,6 +84,11 @@ struct rzv2h_cpg_priv {
>
>  #define rcdev_to_priv(x)       container_of(x, struct rzv2h_cpg_priv, rc=
dev)
>
> +struct rzv2h_mstop {
> +       u32 data;

u16 idx;
u16 mask;

> +       refcount_t ref_cnt;
> +};
> +
>  struct pll_clk {
>         struct rzv2h_cpg_priv *priv;
>         void __iomem *base;

> --- a/drivers/clk/renesas/rzv2h-cpg.h
> +++ b/drivers/clk/renesas/rzv2h-cpg.h
> @@ -35,6 +35,7 @@ struct ddiv {
>  #define CPG_CDDIV1             (0x404)
>  #define CPG_CDDIV3             (0x40C)
>  #define CPG_CDDIV4             (0x410)
> +#define CPG_BUS_1_MSTOP                (0xd00)
>
>  #define CDDIV0_DIVCTL2 DDIV_PACK(CPG_CDDIV0, 8, 3, 2)
>  #define CDDIV1_DIVCTL0 DDIV_PACK(CPG_CDDIV1, 0, 2, 4)
> @@ -46,6 +47,14 @@ struct ddiv {
>  #define CDDIV4_DIVCTL1 DDIV_PACK(CPG_CDDIV4, 4, 1, 17)
>  #define CDDIV4_DIVCTL2 DDIV_PACK(CPG_CDDIV4, 8, 1, 18)
>
> +#define CPG_BUS_MSTOP_START    (CPG_BUS_1_MSTOP - 4)

No need for CPG_BUS_MSTOP_START...

> +#define CPG_BUS_MSTOP(x)       (CPG_BUS_MSTOP_START + (x) * 4)

#define CPG_BUS_MSTOP(m)       (CPG_BUS_1_MSTOP + ((m) - 1) * 4)

cfr. the formula for Address in Section 4.4.4.37/39
("MSTOP Registers (CPG_BUS_m_MSTOP) (m =3D 1 to 12/13)").

> +
> +#define BUS_MSTOP(index, mask) ((CPG_BUS_MSTOP(index) & 0xffff) << 16 | =
(mask))
> +#define BUS_MSTOP_OFF(val)     (((val) >> 16) & 0xffff)
> +#define BUS_MSTOP_VAL(val)     ((val) & 0xffff)
> +#define BUS_MSTOP_NO_DATA      GENMASK(31, 0)

BUS_MSTOP_NONE?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

