Return-Path: <linux-renesas-soc+bounces-33624-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4g20CCbSImo7eAEAu9opvQ
	(envelope-from <linux-renesas-soc+bounces-33624-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>)
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Jun 2026 15:41:58 +0200
X-Original-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A75D26489A6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 05 Jun 2026 15:41:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-renesas-soc+bounces-33624-lists+linux-renesas-soc=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-renesas-soc+bounces-33624-lists+linux-renesas-soc=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2ACA83044BB6
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jun 2026 13:39:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BC032F49F1;
	Fri,  5 Jun 2026 13:39:16 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E3E2F7F15
	for <linux-renesas-soc@vger.kernel.org>; Fri,  5 Jun 2026 13:39:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780666755; cv=none; b=ssb1bdiCXL7P8+GaiGj93Dcmb2wg2/tfidQa1VP0mLD9NgcMOAgcdnsv06KChqbFEHqrAleckTNNG7vdtRdFbxwFTg0jEPYBv2+o7PZgj5Xsy1HqgmsucplhqIigcH0JWV1SRPzOWR337qsXs+R9IQHDJ1753KAcE8OqQqw7d34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780666755; c=relaxed/simple;
	bh=neuVlX5E09C2CCGMgZEk9w7Fn/XLCZt+ud6kGcA9fkQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gnhqGEx3fRt79Dwkbe4J/mEgAXxhFwfqYhOu28K233JrGfks+pDJfjyAShyZebC2P6CpMxHGbYgoldDH/dvY+nBNxKdJZrCG1cbuVT2+ZMAn7KpldQZJJWBgzyZZUrV6Dx4W9U8icPUSqwowso/IsERRedEraO3jKI9SoOBHcG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-59eb57ed4cbso662858e0c.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 Jun 2026 06:39:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780666753; x=1781271553;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ng6MztXRVUw+6gX3lTf5HZ3/GBPHOvI81OwZahcGNXA=;
        b=sHXAn2fDVuReftFhTq9UtwJ/Sl9gszKGxDPLV4bFw8NwQVYxKNq7G3eFIA1X4wzzEC
         Edh2lwm/0cwKh9HuX03KOTwGyckd+1PHAGvxXQUIHr6uNtm54/tUVU0ztrQyyol+8b9+
         Yp87f4RBhLY2hyA3s116bQzvqT9FmUzsYVz4PjBkiT/v96aZD9g5W3fjnNnBzj53pjFB
         44uSTxpIKQrfwNRBFh4baLobRlQopYTRV23lWI75uy0TLBQyevMoNJp/nMrxhKlpopAQ
         r65w2HcXHk47FXw7pEtzZFh0HMFFRYWDZvWTt+LVcT9RqiUUJXwlPKx6eLboARTSj6DP
         FXfA==
X-Forwarded-Encrypted: i=1; AFNElJ+eIwRoh5ZUooM24OSIuEmcmyxUrW8Pn2kQXZJKZYbJWnp6gDbxEm/fIamY/p93DSXchz2tqfo57HCquyWKnSNivw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNQXPR0kR1t4UPt2G606BD/4VZHymHkZehKTDf/NtTUAs9FpVG
	8WQjych+YtDFFxSqQqXTH7s15W8Cvm/SzNr5u1q733UEWSQ6hx39v/bAD/q7uMse
X-Gm-Gg: Acq92OEoSjBCcdJC/2Vq3DZZyp1RyAm+Uw4x0z2148WdzeZOJQC9tjNniImUxBWvPH4
	gtCO4+86yOIASSPPhnK8euARLO/4C7K0IBsMN/etmHnBHalST80zZXXkmlL7PFyb7GxAiAWn5/n
	5rOSLlxAYMAZk3HA4t1SGDdLhIFTdkxVHL7oeg6UNoCyWgsMNQgAV+vUSf7znZJsJEn52k2QtVx
	QYIIB/vgrskFrmkvo3JfMwBiPCKryKg2REjjj4j5EyYQ1f/yT807sCQlmSAhGYppZSSolOU9ubP
	ttOAnefv3EwmZH2tvYBQnUQDHN4l3dcJn5TMOklyD1xnXWxjsuvXvDXg9c1105gVZ04Vs023sSW
	p9GQOA9zXRKp+h0QBhS7NYUkR0O/N1YQ+eZxSv+DRCcJmlWwGLsiKzKkyozIHcwEJg+4XBqcZSw
	ge5T1tk2jbUR5qsLehOxRir+F7jlAP2uIKYBtTy2k3avkPxZd9PajJKvpVPz3txAEDoEgwgGRr1
	0EzBSo35DpDlQ==
X-Received: by 2002:a05:6122:3d12:b0:59f:4c56:9d0e with SMTP id 71dfb90a1353d-5ac4ec9396bmr1829418e0c.5.1780666753447;
        Fri, 05 Jun 2026 06:39:13 -0700 (PDT)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com. [209.85.221.179])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5a6dd501a90sm7789913e0c.17.2026.06.05.06.39.11
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 06:39:12 -0700 (PDT)
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-59dc1714d44so614670e0c.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 Jun 2026 06:39:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/y/ffklIrbF1Y55UAF4XJgfvMZS0qob85PJcmX4O6gAv23ey5tyFZrtXaz9IObX6tpBRN331YJbOtEYVc6QMWrGw==@vger.kernel.org
X-Received: by 2002:a05:6122:2895:b0:5a1:19d4:a363 with SMTP id
 71dfb90a1353d-5ac4da02fb1mr1517139e0c.3.1780666750627; Fri, 05 Jun 2026
 06:39:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511191910.1945705-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260511191910.1945705-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260511191910.1945705-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 5 Jun 2026 15:38:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXh6YhDp7nEra3GbrR9hkhqqj15UXnv0DHeei=mj56XJQ@mail.gmail.com>
X-Gm-Features: AVVi8CesdJciMHdsefYeL2Id77B4Nq_zyNVq-BWBcQxt_zUG2CODWutZURFB3Cs
Message-ID: <CAMuHMdXh6YhDp7nEra3GbrR9hkhqqj15UXnv0DHeei=mj56XJQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] clk: renesas: r9a09g077: Add LCDC and PLL3 clock
 support for RZ/T2H display pipeline
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	TAGGED_FROM(0.00)[bounces-33624-lists,linux-renesas-soc=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:prabhakar.csengg@gmail.com,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:biju.das.jz@bp.renesas.com,m:fabrizio.castro.jz@renesas.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:prabhakarcsengg@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[baylibre.com,kernel.org,gmail.com,vger.kernel.org,bp.renesas.com,renesas.com];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-renesas-soc@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-renesas-soc,dt];
	TO_DN_SOME(0.00)[];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:from_mime,linux-m68k.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,renesas.com:email,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A75D26489A6

Hi Prabhakar,

On Mon, 11 May 2026 at 21:19, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add the clock definitions and PLL logic required to supply the LCDC
> (VSPD/FCPVD/DU) blocks on the RZ/T2H (R9A09G077) SoC. The RZ/T2H display
> subsystem depends on a dedicated PLL (PLL3) and a set of new derived
> clocks.
>
> Introduce a new PLL clock type and implement rate recalculation,
> programming and locking sequences for PLL3 using the RZ/T2H specific
> divider and VCO limits. Add the corresponding muxes and divider entries,
> expose the LCDC core clock, and register the LCDC module clock using the
> correct PCLK parent.
>
> This enables the RZ/T2H clock driver to generate the display pipeline
> clocking tree needed by the DU and VSP-based composition engines, allowing
> upcoming display support to be integrated without duplicating CPG logic.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/Kconfig
> +++ b/drivers/clk/renesas/Kconfig
> @@ -218,10 +218,12 @@ config CLK_R9A09G057
>  config CLK_R9A09G077
>         bool "RZ/T2H clock support" if COMPILE_TEST
>         select CLK_RENESAS_CPG_MSSR
> +       select CLK_RZV2H

That includes a lot. Perhaps spin off the required functionality in a
separate file, like CLK_RCAR_CPG_LIB?
That would impact the MODULE_IMPORT_NS("RZV2H_CPG") in
drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c, too, though.

>
>  config CLK_R9A09G087
>         bool "RZ/N2H clock support" if COMPILE_TEST
>         select CLK_RENESAS_CPG_MSSR
> +       select CLK_RZV2H
>
>  config CLK_SH73A0
>         bool "SH-Mobile AG5 clock support" if COMPILE_TEST
> diff --git a/drivers/clk/renesas/r9a09g077-cpg.c b/drivers/clk/renesas/r9a09g077-cpg.c
> index f777601a23b9..48052e7b93fd 100644
> --- a/drivers/clk/renesas/r9a09g077-cpg.c
> +++ b/drivers/clk/renesas/r9a09g077-cpg.c

> @@ -66,11 +73,26 @@
>  #define DIVSCI2ASYNC   CONF_PACK(SCKCR3, 10, 2)
>  #define DIVSCI3ASYNC   CONF_PACK(SCKCR3, 12, 2)
>  #define DIVSCI4ASYNC   CONF_PACK(SCKCR3, 14, 2)
> +#define LCDCDIVSEL     CONF_PACK(SCKCR3, 20, 4)
> +
> +#define PLL3EN         FIELD_PREP_CONST(OFFSET_MASK, (0xc0))
> +
> +#define CPG_PLLEN              BIT(0)

CPG_PLL_EN_EN, for consistency with CPG_PLL_MON_LOCK below?

> +#define CPG_PLL3_VCO_CTR0(x)   ((x) + 0x4)
> +#define CPG_PLL3_VCO_CTR0_PDIV GENMASK(21, 16)
> +#define CPG_PLL3_VCO_CTR0_MDIV GENMASK(9, 0)
> +#define CPG_PLL3_VCO_CTR1(x)   ((x) + 0x8)
> +#define CPG_PLL3_VCO_CTR1_KDIV GENMASK(31, 16)
> +#define CPG_PLL3_VCO_CTR1_SDIV GENMASK(2, 0)
> +#define CPG_PLL_MON(x)         ((x) - 0x10)
> +#define CPG_PLL_MON_LOCK       BIT(0)

So all registers are calculated based on the CPG_PLL3EN register
address...

>
>  enum rzt2h_clk_types {
>         CLK_TYPE_RZT2H_DIV = CLK_TYPE_CUSTOM,   /* Clock with divider */
>         CLK_TYPE_RZT2H_MUX,                     /* Clock with clock source selector */
>         CLK_TYPE_RZT2H_FSELXSPI,                /* Clock with FSELXSPIn source selector */
> +       CLK_TYPE_RZT2H_PLL3,                    /* PLL3 Clock */
> +       CLK_TYPE_RZT2H_LCDCDIV,                 /* LCDC divider clock */
>  };
>
>  #define DEF_DIV(_name, _id, _parent, _conf, _dtable) \
> @@ -83,10 +105,51 @@ enum rzt2h_clk_types {
>  #define DEF_DIV_FSELXSPI(_name, _id, _parent, _conf, _dtable) \
>         DEF_TYPE(_name, _id, CLK_TYPE_RZT2H_FSELXSPI, .conf = _conf, \
>                  .parent = _parent, .dtable = _dtable, .flag = 0)
> +#define DEF_PLL3(_name, _id, _parent, _conf) \
> +       DEF_TYPE(_name, _id, CLK_TYPE_RZT2H_PLL3, .conf = _conf, \
> +                .parent = _parent)
> +#define DEF_DIV_LCDC(_name, _id, _parent, _conf, _dtable) \
> +       DEF_TYPE(_name, _id, CLK_TYPE_RZT2H_LCDCDIV, .conf = _conf, \
> +                .parent = _parent, .dtable = _dtable, .flag = CLK_SET_RATE_PARENT)

I assume you can't reuse DEF_DIV() because you need the extra accuracy
from interfacing with rzv2h_get_pll_divs_pars()?

> +
> +struct pll_clk {
> +       void __iomem *reg;

This is the PLLxEN register address, from which all other register
addresses are calculated: pllen?

> +       const struct rzv2h_pll_limits *limits;
> +       struct device *dev;
> +       struct rzv2h_pll_pars pll_parameters;
> +       struct clk_hw hw;
> +       unsigned long cur_rate;
> +};
> +
> +#define to_pll(_hw)    container_of(_hw, struct pll_clk, hw)
> +
> +struct r9a09g077_lcdc_div_clk {
> +       const struct clk_div_table *dtable;
> +       void __iomem *reg;
> +       struct device *dev;
> +       struct clk_hw hw;
> +       u32 conf;
> +       u8 divider;
> +};
> +
> +#define to_lcdc_div_clk(_hw) \
> +       container_of(_hw, struct r9a09g077_lcdc_div_clk, hw)
> +
> +#define RZT2H_MAX_LCDC_DIV_TABLES      16
> +
> +static const struct rzv2h_pll_limits r9a09g077_cpg_pll3_limits = {
> +       .input_fref = 48 * MEGA,
> +       .fout = { .min = 25 * MEGA, .max = 430 * MEGA },
> +       .fvco = { .min = 1600 * MEGA, .max = 3200 * MEGA },
> +       .m = { .min = 0x40, .max = 0x3ff },
> +       .p = { .min = 0x2, .max = 0x8 },
> +       .s = { .min = 0x0, .max = 0x6 },
> +       .k = { .min = -32768, .max = 32767 },
> +};
>
>  enum clk_ids {
>         /* Core Clock Outputs exported to DT */
> -       LAST_DT_CORE_CLK = R9A09G077_PCLKCAN,
> +       LAST_DT_CORE_CLK = R9A09G077_LCDC_CLKD,
>
>         /* External Input Clocks */
>         CLK_EXTAL,

> @@ -242,6 +335,8 @@ static const struct cpg_core_clk r9a09g077_core_clks[] __initconst = {
>                          FSELXSPI1, dtable_6_8_16_32_64),
>         DEF_MUX("PCLKCAN", R9A09G077_PCLKCAN, FSELCANFD,
>                 sel_clk_pll4d3_div10_div20, ARRAY_SIZE(sel_clk_pll4d3_div10_div20), 0),
> +       DEF_DIV_LCDC("LCDCDIV", R9A09G077_LCDC_CLKD, CLK_SEL_CLK_PLL3, LCDCDIVSEL,

"LCDC_CLKD"


> +                    dtable_2_32),
>  };
>
>  static const struct mssr_mod_clk r9a09g077_mod_clks[] __initconst = {

> @@ -481,6 +577,272 @@ r9a09g077_cpg_fselxspi_div_clk_register(struct device *dev,
>         return hw->clk;
>  }
>
> +static unsigned long r9a09g077_cpg_pll3_clk_recalc_rate(struct clk_hw *hw,
> +                                                       unsigned long parent_rate)
> +{
> +       struct pll_clk *pll_clk = to_pll(hw);
> +       unsigned int ctr0, ctr1;

u32

> +       u8 pdiv, sdiv;
> +       u64 rate;
> +       u16 mdiv;
> +       s16 kdiv;
> +
> +       ctr0 = readl(CPG_PLL3_VCO_CTR0(pll_clk->reg));
> +       ctr1 = readl(CPG_PLL3_VCO_CTR1(pll_clk->reg));
> +
> +       pdiv = FIELD_GET(CPG_PLL3_VCO_CTR0_PDIV, ctr0);
> +       mdiv = FIELD_GET(CPG_PLL3_VCO_CTR0_MDIV, ctr0);
> +       kdiv = (s16)FIELD_GET(CPG_PLL3_VCO_CTR1_KDIV, ctr1);
> +       sdiv = FIELD_GET(CPG_PLL3_VCO_CTR1_SDIV, ctr1);
> +
> +       rate = mul_u64_u32_shr(parent_rate, (mdiv << 16) + kdiv, 16 + sdiv);
> +
> +       return DIV_ROUND_CLOSEST_ULL(rate, pdiv);
> +}

The rest LGTM.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

