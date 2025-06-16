Return-Path: <linux-renesas-soc+bounces-18348-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2C6ADADAB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Jun 2025 12:45:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A861188CC85
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Jun 2025 10:45:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E46F27FB10;
	Mon, 16 Jun 2025 10:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i0Wj6v8m"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E4AB2980BF;
	Mon, 16 Jun 2025 10:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750070732; cv=none; b=dS4ZqQrgow/dQS6LfpljNP9lsn63N6zKIuHA5zyQkeedf91H3rbBrK4ZnQanPKBAbGQmcAjtMdr41M1+/Lda3j2U9SVVPsas/p+iMKhInHv6uYDrS7i+bMdKp89TC91wKUFEvqnLhDqt9xgJK92F5c3KF9pC6y6vaIPL3FP4BiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750070732; c=relaxed/simple;
	bh=+AnXL+rMVMXhh4f/+erM44ThdTxIodxHBnw/jR8wlxY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YeXr/IRzPxtz5sxKsNfD1+Vg5o/x3WTnDXce+4CFBz8kacM1JGV9UayG1u59/55XsZK+gLJY84O/bs1Qb78me7LElnUb2znHefgHuTgikGuUvAiurI+tuBtsMpKIZrXmCYm8ThOPmeGVLboajfSbmbpW4nFXJ1mb1c7Yl/vdpjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i0Wj6v8m; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a36748920cso5124065f8f.2;
        Mon, 16 Jun 2025 03:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750070725; x=1750675525; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NSDl2PiJGaG4FkK+fLWvA+1Qct2FhEDuUrKC3P6/vhQ=;
        b=i0Wj6v8mk66W7EWstunyT3gAAJxdHS7Wx9vz7M9yQr09/Kl11mgWMmaQ3FoecvtI1H
         iwhkyXiZYcdEBhB9qNfi52GS09w2+nv0rRsFUpcE3ogpK//K1XTC5tZUAWh8Db2OH8DD
         y/I42CQBbyzsRUFHSd+WQvR17JOAl1KRuqjQTtAZdx3oO3KyAoYtiOnDnyFm7Tg7VO/5
         M6SdoFgvNvQ0v4Bt0CgzdCYKUBDHw1oSE0qI1Cj5jtXAI4sDFPUageoDG2Y2LlKiK6Ep
         GTp8Ol55oYCSIdIh6+mILrpyRWBrzpPpFoOuyTCVuNu3m90i5qOSADjgMqUsdCEC4JfN
         FB3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750070725; x=1750675525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NSDl2PiJGaG4FkK+fLWvA+1Qct2FhEDuUrKC3P6/vhQ=;
        b=TulYGRxIQ+9FfJubENxhnI1k/Mr8ydzfxIQhJrmXzSiAuf1hje/Kk30neXgHqO3+Ib
         hlHuIdhAGMdAdempnlG9XoSNV6ddgNZj8UU1PgCWdE2ZOKguOo3rb6JG0kW3dhxP/FSG
         4a0xwgIWvBrZqv6DQTkRJLtLDacUy28JLQY+7X21giXzYAkkyJmmNhGGgoi/yfaILpJv
         rl2CSs84VHqoofrjems/Zg/7piE8LzJh62PExNv/zg/ObmcgSxjWM8QHVragwrb+jqvs
         fHFfBsfxUWK3KN4+3FAjEcgSubp0Iwrlz9CegfQrLeasLmCIobnJal4s4Lupd4yVZe1L
         /47g==
X-Forwarded-Encrypted: i=1; AJvYcCUmwC64gAZJ06sAT6TLZp2w80ZoS3LBYHKIY0SO8WaT7C22dgbY/HB9TtDCUZOQdu00MM6lJd7LbQWv@vger.kernel.org, AJvYcCVtzLvGv2d0JYgVUGqnLF+63DqS2JDFwIaeWpb18ZUc0XYf1rp9vS6TmeXUYjRk4uMObEgWnO+6sYmdK+ExENidRIs=@vger.kernel.org, AJvYcCWOECy3xoMX41GiiISn8YvwEMqv1kFUxN+xvBLL5mzzeqW6GH2wM1H5P3qKwkKarsm5scEmgtQuPHfs@vger.kernel.org, AJvYcCXG9cAe0EdmtNTR87bjjhDtyrW4WgNX7G57UAEyyh5mzIfQuMz5ZOX/Odz03cgsm0hXerzNHCWE4dWJQw2n@vger.kernel.org
X-Gm-Message-State: AOJu0YzVpe0DLOEYoFtV3D/PPvf71Cm+AHKVACK0foa+Hhqvppmn8KtG
	bOVmpTKhE0MEb461jQCn/BUkup3BfGkXOC7uGXBap1m4F2pemgyKF8lMjFwk+vwaw/9M2Pu4Vyz
	fI/wwuIRF7gXd1onFLRd16v2BQvHTNvs=
X-Gm-Gg: ASbGncvAgiEj30WaZsy8I7ZglEamWTPPvt6runsKV7UCqszMHW8QO8tajZdiizj6MLp
	keWu+L+zM1pG5whQx0FZ4BWXDKgIBA0ocBcZlTrD4MCLymfq6pHIyCP1awn5grICdWirpv6knfA
	0Bxetbf/s8AYtJQaRwXjtEgxWBTkKKsh91/7gpIg3p8g==
X-Google-Smtp-Source: AGHT+IEgQgiyztxqvtZKll0mOfiV5M1uoxnaWLnIuq/McTRUg97y7B4O7fuqHTvpQIDbJeirPhUGsHjX7qpzXfEpLio=
X-Received: by 2002:a05:6000:2088:b0:3a5:3e47:8af5 with SMTP id
 ffacd0b85a97d-3a5723a26d6mr7502087f8f.27.1750070725289; Mon, 16 Jun 2025
 03:45:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530171841.423274-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250530171841.423274-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <TY3PR01MB1134654039BA3BAB5DA8C0BB08677A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB1134654039BA3BAB5DA8C0BB08677A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 16 Jun 2025 11:44:58 +0100
X-Gm-Features: AX0GCFslazxqxWe5-uy3WUsn7KLkJazXk2uLh7M8KS7bYpORB5xGv-n0ot5eFC8
Message-ID: <CA+V-a8tSMt9SaHAdeEd4vj=QmaDz5bMd4hwJUCx_mBF8-mw2kw@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] clk: renesas: rzv2h-cpg: Add support for DSI clocks
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	"laurent.pinchart" <laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Biju,

Thank you for the review.

On Fri, Jun 13, 2025 at 6:57=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> Hi Prabhakar,
>
> > -----Original Message-----
> > From: Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: 30 May 2025 18:19
> .castro.jz@renesas.com>; Prabhakar Mahadev Lad <prabhakar.mahadev-
> > lad.rj@bp.renesas.com>
> > Subject: [PATCH v6 1/4] clk: renesas: rzv2h-cpg: Add support for DSI cl=
ocks
> >
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add support for PLLDSI and PLLDSI divider clocks.
> >
> > Introduce the `renesas-rzv2h-dsi.h` header to centralize and share PLLD=
SI-related data structures,
> > limits, and algorithms between the RZ/V2H CPG and DSI drivers.
> >
> > The DSI PLL is functionally similar to the CPG's PLLDSI, but has slight=
ly different parameter limits
> > and omits the programmable divider present in CPG. To ensure precise fr=
equency calculations-especially
> > for milliHz-level accuracy needed by the DSI driver-the shared algorith=
m allows both drivers to
> > compute PLL parameters consistently using the same logic and input cloc=
k.
> >
> > Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v5->v6:
> > - Renamed CPG_PLL_STBY_SSCGEN_WEN to CPG_PLL_STBY_SSC_EN_WEN
> > - Updated CPG_PLL_CLK1_DIV_K, CPG_PLL_CLK1_DIV_M, and
> >   CPG_PLL_CLK1_DIV_P macros to use GENMASK
> > - Updated req->rate in rzv2h_cpg_plldsi_div_determine_rate()
> > - Dropped the cast in rzv2h_cpg_plldsi_div_set_rate()
> > - Dropped rzv2h_cpg_plldsi_round_rate() and implemented
> >   rzv2h_cpg_plldsi_determine_rate() instead
> > - Made use of FIELD_PREP()
> > - Moved CPG_CSDIV1 macro in patch 2/4
> > - Dropped two_pow_s in rzv2h_dsi_get_pll_parameters_values()
> > - Used mul_u32_u32() while calculating output_m and output_k_range
> > - Used div_s64() instead of div64_s64() while calculating
> >   pll_k
> > - Used mul_u32_u32() while calculating fvco and fvco checks
> > - Rounded the final output using DIV_U64_ROUND_CLOSEST()
> >
> > v4->v5:
> > - No changes
> >
> > v3->v4:
> > - Corrected parameter name in rzv2h_dsi_get_pll_parameters_values()
> >   description freq_millihz
> >
> > v2->v3:
> > - Update the commit message to clarify the purpose of `renesas-rzv2h-ds=
i.h`
> >   header
> > - Used mul_u32_u32() in rzv2h_cpg_plldsi_div_determine_rate()
> > - Replaced *_mhz to *_millihz for clarity
> > - Updated u64->u32 for fvco limits
> > - Initialized the members in declaration order for
> >   RZV2H_CPG_PLL_DSI_LIMITS() macro
> > - Used clk_div_mask() in rzv2h_cpg_plldsi_div_recalc_rate()
> > - Replaced `unsigned long long` with u64
> > - Dropped rzv2h_cpg_plldsi_clk_recalc_rate() and reused
> >   rzv2h_cpg_pll_clk_recalc_rate() instead
> > - In rzv2h_cpg_plldsi_div_set_rate() followed the same style
> >   of RMW-operation as done in the other functions
> > - Renamed rzv2h_cpg_plldsi_set_rate() to rzv2h_cpg_pll_set_rate()
> > - Dropped rzv2h_cpg_plldsi_clk_register() and reused
> >   rzv2h_cpg_pll_clk_register() instead
> > - Added a gaurd in renesas-rzv2h-dsi.h header
> >
> > v1->v2:
> > - No changes
> > ---
> >  drivers/clk/renesas/rzv2h-cpg.c       | 278 +++++++++++++++++++++++++-
> >  drivers/clk/renesas/rzv2h-cpg.h       |  13 ++
> >  include/linux/clk/renesas-rzv2h-dsi.h | 210 +++++++++++++++++++
> >  3 files changed, 492 insertions(+), 9 deletions(-)  create mode 100644=
 include/linux/clk/renesas-
> > rzv2h-dsi.h
> >
> > diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2=
h-cpg.c index
> > 761da3bf77ce..d590f9f47371 100644
> > --- a/drivers/clk/renesas/rzv2h-cpg.c
> > +++ b/drivers/clk/renesas/rzv2h-cpg.c
> > @@ -14,9 +14,13 @@
> >  #include <linux/bitfield.h>
> >  #include <linux/clk.h>
> >  #include <linux/clk-provider.h>
> > +#include <linux/clk/renesas-rzv2h-dsi.h>
> >  #include <linux/delay.h>
> >  #include <linux/init.h>
> >  #include <linux/iopoll.h>
> > +#include <linux/math.h>
> > +#include <linux/math64.h>
> > +#include <linux/minmax.h>
> >  #include <linux/mod_devicetable.h>
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> > @@ -26,6 +30,7 @@
> >  #include <linux/refcount.h>
> >  #include <linux/reset-controller.h>
> >  #include <linux/string_choices.h>
> > +#include <linux/units.h>
> >
> >  #include <dt-bindings/clock/renesas-cpg-mssr.h>
> >
> > @@ -48,12 +53,13 @@
> >  #define CPG_PLL_STBY(x)              ((x))
> >  #define CPG_PLL_STBY_RESETB  BIT(0)
> >  #define CPG_PLL_STBY_RESETB_WEN      BIT(16)
> > +#define CPG_PLL_STBY_SSC_EN_WEN BIT(18)
> >  #define CPG_PLL_CLK1(x)              ((x) + 0x004)
> > -#define CPG_PLL_CLK1_KDIV(x) ((s16)FIELD_GET(GENMASK(31, 16), (x)))
> > -#define CPG_PLL_CLK1_MDIV(x) FIELD_GET(GENMASK(15, 6), (x))
> > -#define CPG_PLL_CLK1_PDIV(x) FIELD_GET(GENMASK(5, 0), (x))
> > +#define CPG_PLL_CLK1_KDIV    GENMASK(31, 16)
> > +#define CPG_PLL_CLK1_MDIV    GENMASK(15, 6)
> > +#define CPG_PLL_CLK1_PDIV    GENMASK(5, 0)
> >  #define CPG_PLL_CLK2(x)              ((x) + 0x008)
> > -#define CPG_PLL_CLK2_SDIV(x) FIELD_GET(GENMASK(2, 0), (x))
> > +#define CPG_PLL_CLK2_SDIV    GENMASK(2, 0)
> >  #define CPG_PLL_MON(x)               ((x) + 0x010)
> >  #define CPG_PLL_MON_RESETB   BIT(0)
> >  #define CPG_PLL_MON_LOCK     BIT(4)
> > @@ -79,6 +85,8 @@
> >   * @last_dt_core_clk: ID of the last Core Clock exported to DT
> >   * @mstop_count: Array of mstop values
> >   * @rcdev: Reset controller entity
> > + * @dsi_limits: PLL DSI parameters limits
> > + * @plldsi_div_parameters: PLL DSI and divider parameters configuratio=
n
> >   */
> >  struct rzv2h_cpg_priv {
> >       struct device *dev;
> > @@ -95,6 +103,9 @@ struct rzv2h_cpg_priv {
> >       atomic_t *mstop_count;
> >
> >       struct reset_controller_dev rcdev;
> > +
> > +     const struct rzv2h_pll_div_limits *dsi_limits;
> > +     struct rzv2h_plldsi_parameters plldsi_div_parameters;
> >  };
> >
> >  #define rcdev_to_priv(x)     container_of(x, struct rzv2h_cpg_priv, rc=
dev)
> > @@ -150,6 +161,24 @@ struct ddiv_clk {
> >
> >  #define to_ddiv_clock(_div) container_of(_div, struct ddiv_clk, div)
> >
> > +/**
> > + * struct rzv2h_plldsi_div_clk - PLL DSI DDIV clock
> > + *
> > + * @dtable: divider table
> > + * @priv: CPG private data
> > + * @hw: divider clk
> > + * @ddiv: divider configuration
> > + */
> > +struct rzv2h_plldsi_div_clk {
> > +     const struct clk_div_table *dtable;
> > +     struct rzv2h_cpg_priv *priv;
> > +     struct clk_hw hw;
> > +     struct ddiv ddiv;
> > +};
> > +
> > +#define to_plldsi_div_clk(_hw) \
> > +     container_of(_hw, struct rzv2h_plldsi_div_clk, hw)
> > +
> >  static int rzv2h_cpg_pll_clk_is_enabled(struct clk_hw *hw)  {
> >       struct pll_clk *pll_clk =3D to_pll(hw);
> > @@ -198,6 +227,214 @@ static int rzv2h_cpg_pll_clk_enable(struct clk_hw=
 *hw)
> >       return ret;
> >  }
> >
> > +static unsigned long rzv2h_cpg_plldsi_div_recalc_rate(struct clk_hw *h=
w,
> > +                                                   unsigned long paren=
t_rate)
> > +{
> > +     struct rzv2h_plldsi_div_clk *dsi_div =3D to_plldsi_div_clk(hw);
> > +     struct rzv2h_cpg_priv *priv =3D dsi_div->priv;
> > +     struct ddiv ddiv =3D dsi_div->ddiv;
> > +     u32 div;
> > +
> > +     div =3D readl(priv->base + ddiv.offset);
> > +     div >>=3D ddiv.shift;
> > +     div &=3D clk_div_mask(ddiv.width);
> > +     div =3D dsi_div->dtable[div].div;
> > +
> > +     return DIV_ROUND_CLOSEST_ULL(parent_rate, div); }
> > +
> > +static int rzv2h_cpg_plldsi_div_determine_rate(struct clk_hw *hw,
> > +                                            struct clk_rate_request *r=
eq) {
> > +     struct rzv2h_plldsi_div_clk *dsi_div =3D to_plldsi_div_clk(hw);
> > +     struct rzv2h_cpg_priv *priv =3D dsi_div->priv;
> > +     struct rzv2h_plldsi_parameters *dsi_dividers =3D &priv->plldsi_di=
v_parameters;
> > +     u64 rate_millihz;
> > +
> > +     /*
> > +      * Adjust the requested clock rate (`req->rate`) to ensure it fal=
ls within
> > +      * the supported range of 5.44 MHz to 187.5 MHz.
> > +      */
> > +     req->rate =3D clamp(req->rate, 5440000UL, 187500000UL);
> > +
> > +     rate_millihz =3D mul_u32_u32(req->rate, MILLI);
> > +     if (rate_millihz =3D=3D dsi_dividers->error_millihz + dsi_divider=
s->freq_millihz)
> > +             goto exit_determine_rate;
> > +
> > +     if (!rzv2h_dsi_get_pll_parameters_values(priv->dsi_limits,
> > +                                              dsi_dividers, rate_milli=
hz)) {
> > +             dev_err(priv->dev,
> > +                     "failed to determine rate for req->rate: %lu\n",
> > +                     req->rate);
> > +             return -EINVAL;
> > +     }
>
>
> > +
> > +exit_determine_rate:
> > +     req->best_parent_rate =3D req->rate * dsi_dividers->csdiv;
>
> I believe this has to go after below assignment.
>
Good catch, agreed.

> As parent_rate =3D rate * calculated DSI divider value.
>
> req->rate =3D DIV_ROUND_CLOSEST_ULL(dsi_dividers->freq_millihz, MILLI);
> req->best_parent_rate =3D req->rate * dsi_dividers->csdiv;
>
>
>
> > +     req->rate =3D DIV_ROUND_CLOSEST_ULL(dsi_dividers->freq_millihz, M=
ILLI);
> > +
> > +     return 0;
> > +};
> > +
> > +static int rzv2h_cpg_plldsi_div_set_rate(struct clk_hw *hw,
> > +                                      unsigned long rate,
> > +                                      unsigned long parent_rate)
> > +{
> > +     struct rzv2h_plldsi_div_clk *dsi_div =3D to_plldsi_div_clk(hw);
> > +     struct rzv2h_cpg_priv *priv =3D dsi_div->priv;
> > +     struct rzv2h_plldsi_parameters *dsi_dividers =3D &priv->plldsi_di=
v_parameters;
> > +     struct ddiv ddiv =3D dsi_div->ddiv;
> > +     const struct clk_div_table *clkt;
> > +     bool div_found =3D false;
> > +     u32 val, shift, div;
> > +
> > +     div =3D dsi_dividers->csdiv;
> > +     for (clkt =3D dsi_div->dtable; clkt->div; clkt++) {
> > +             if (clkt->div =3D=3D div) {
> > +                     div_found =3D true;
> > +                     break;
> > +             }
> > +     }
> > +
> > +     if (!div_found)
> > +             return -EINVAL;
>
> This check can be done in determine rate and cache the divider??
>
Ok, I'll drop this check as the divider is already cached. The for
loop above is to determine the val which is used below to program the
registers.

> > +
> > +     shift =3D ddiv.shift;
> > +     val =3D readl(priv->base + ddiv.offset) | DDIV_DIVCTL_WEN(shift);
> > +     val &=3D ~(clk_div_mask(ddiv.width) << shift);
> > +     val |=3D clkt->val << shift;
> > +     writel(val, priv->base + ddiv.offset);
> > +
> > +     return 0;
> > +};
> > +
> > +static const struct clk_ops rzv2h_cpg_plldsi_div_ops =3D {
> > +     .recalc_rate =3D rzv2h_cpg_plldsi_div_recalc_rate,
> > +     .determine_rate =3D rzv2h_cpg_plldsi_div_determine_rate,
> > +     .set_rate =3D rzv2h_cpg_plldsi_div_set_rate, };
> > +
> > +static struct clk * __init
> > +rzv2h_cpg_plldsi_div_clk_register(const struct cpg_core_clk *core,
> > +                               struct rzv2h_cpg_priv *priv)
> > +{
> > +     struct rzv2h_plldsi_div_clk *clk_hw_data;
> > +     struct clk **clks =3D priv->clks;
> > +     struct clk_init_data init;
> > +     const struct clk *parent;
> > +     const char *parent_name;
> > +     struct clk_hw *clk_hw;
> > +     int ret;
> > +
> > +     parent =3D clks[core->parent];
> > +     if (IS_ERR(parent))
> > +             return ERR_CAST(parent);
> > +
> > +     clk_hw_data =3D devm_kzalloc(priv->dev, sizeof(*clk_hw_data), GFP=
_KERNEL);
> > +     if (!clk_hw_data)
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     clk_hw_data->priv =3D priv;
> > +     clk_hw_data->ddiv =3D core->cfg.ddiv;
> > +     clk_hw_data->dtable =3D core->dtable;
> > +
> > +     parent_name =3D __clk_get_name(parent);
> > +     init.name =3D core->name;
> > +     init.ops =3D &rzv2h_cpg_plldsi_div_ops;
> > +     init.flags =3D core->flag;
> > +     init.parent_names =3D &parent_name;
> > +     init.num_parents =3D 1;
> > +
> > +     clk_hw =3D &clk_hw_data->hw;
> > +     clk_hw->init =3D &init;
> > +
> > +     ret =3D devm_clk_hw_register(priv->dev, clk_hw);
> > +     if (ret)
> > +             return ERR_PTR(ret);
> > +
> > +     return clk_hw->clk;
> > +}
> > +
> > +static int rzv2h_cpg_plldsi_determine_rate(struct clk_hw *hw,
> > +                                        struct clk_rate_request *req)
> > +{
> > +     struct rzv2h_pll_div_limits dsi_limits;
> > +     struct rzv2h_plldsi_parameters dsi_dividers;
> > +     struct pll_clk *pll_clk =3D to_pll(hw);
> > +     struct rzv2h_cpg_priv *priv =3D pll_clk->priv;
> > +     u64 rate_millihz;
> > +
> > +     memcpy(&dsi_limits, priv->dsi_limits, sizeof(dsi_limits));
> > +     dsi_limits.csdiv.min =3D 1;
> > +     dsi_limits.csdiv.max =3D 1;
> > +
> > +     req->rate =3D clamp(req->rate, 25000000UL, 375000000UL);
>
> I guess this clamping is not required as the child already has clamping
> and max DSI divider is fixed.
>
> rate(Max) =3D 187500 * 1000 * divider =3D 187.5 MHz(clamped value) * dsi =
divider
>
Agreed, I will drop the clamp.

> > +
> > +     rate_millihz =3D mul_u32_u32(req->rate, MILLI);
> > +     if (!rzv2h_dsi_get_pll_parameters_values(priv->dsi_limits,
> > +                                              &dsi_dividers, rate_mill=
ihz)) {
> > +             dev_err(priv->dev,
> > +                     "failed to determine rate for req->rate: %lu\n",
> > +                     req->rate);
> > +             return -EINVAL;
> > +     }
> > +
> > +     req->best_parent_rate =3D req->rate * dsi_dividers.csdiv;
>
> This is wrong as it will lead to high value for  parent as the rate is fi=
xed 24MHz.
>
> 24MHz-> PLL_DSI(This clock) -> DSI DIVIDER-> DoT clock
>
Agreed we cannot adjust the best_parent_rate here.

Cheers,
Prabhakar

