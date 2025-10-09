Return-Path: <linux-renesas-soc+bounces-22827-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9CC8BC934A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 09 Oct 2025 15:08:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EAD263A5121
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Oct 2025 13:08:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 375032E6CDF;
	Thu,  9 Oct 2025 13:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DJQLaO4F"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E29602494D8
	for <linux-renesas-soc@vger.kernel.org>; Thu,  9 Oct 2025 13:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760015330; cv=none; b=paghoEmSlVjffh9ZqbXbXS4JyRceYmZJq0uOwm0oNCasOsF337ER3P9+KIG4eMBf/majKh6dQfsSdiBAj4U5mzTOe6T1yG/HugbVxaHvOiHzCD91sBYXub5FgHGivS+QKKXcubn/zYIMkCabc+ZmXOGFK0ggqGRE/l9f4MRBdIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760015330; c=relaxed/simple;
	bh=brMLkJnhR4MJcvZ7cy6uJzkSB3AkGPRzWnGN9KMZzd8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sd+wkFDxWOwuYkriZUHa4b0fSyh/6109wYQo/smUt/j12LRESDYlRe9i2ZkuGB37mPp8ygcQm7aRVy35gLMFA4SJm29zDJVaRGIgYFCiESp/zwNft+0fmJlVTu63UlaNMAnP0xoKJRodtU6W5LDXoboGWx6d8wAPQcPqO9oTZOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DJQLaO4F; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-46e491a5b96so5374195e9.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 09 Oct 2025 06:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760015326; x=1760620126; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qhovi4HUngN4Wor+KHpxSd3sVb2276HUKfA4yNG8cvE=;
        b=DJQLaO4FB2lD4k7FmMA9nhdVy6AEYVf3+5fAKbAuLPSeNxk56ltU+k7ISyUve9kfcn
         hw+Pvxwut0qNVcuW9gOMGhQhRlJhGkUQilgs6kxad7aMT7IbLTGcq/wDe8J+sVHn7Kl7
         WxD6DBcTiO/oyfmTwKBZEHzlmIDvADst7fbYd3Dkjvune1rUsmpLGpC8ZpBE/eBshOkM
         xz3D/G4nn+7zGoLQbyXcGMzHwxpiPWwceANt+lkw+XKV7O1+v7tajMZerw/T++gi/dC2
         QaXpCE7w3QqpxWS36NVdgcJIWz9/4WXGzWZx4hVqxnolm97yilYWZEMBqxMKobDrQmbo
         nPug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760015326; x=1760620126;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qhovi4HUngN4Wor+KHpxSd3sVb2276HUKfA4yNG8cvE=;
        b=l4oJKKWq70R4uzE8WZX/TnBi+9Qodd3e+4bu+gZ+tbXdW64hdEFWWJ4uFYeBdpR3lv
         OU27bQE3+7Ex7Ol1Lpf3Gbpez24LUe57kxaiETtzdltTh1/wkXNYYqmUBZpLifI4QGB1
         qEGQQ/qNnPUeT2hZmorAxyweivTM+1rYZbHsUdVJ48TO9noz/85Z5ewkXhXW8bszzjvK
         sPPO22UZ51OmZd7ckvB0GFehC985EaWcn9S/Zk2qNrD16wVZlNk9Yc2wUEHTuwYb1L4L
         0q2o+kHcjm912lajuzyPA4XT+q8YipccxyyFIMvHyRfXTxHY9/Mq8eMCPiGrToqbpUFR
         80eQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3D6MMM9K5Yk7Zm073usiff0tL2P/DkU/EG7YCv1N4n0qGN1iQIpiCF6x7Gly3ElqBBJhG9OKUaiXSs/j79har1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwGC7UP12qLk4Bo8dCHD32RBC7UgYyNJdM7StbtGCG5ltOceUy
	kTWkAKXWclzYLPoIS3Ra2mk1qN4M1JMMnCErOnfCnpGjm6JFUTVEX3d4W7veyDtKLZJWXaeeHi8
	hQsOo780eHEx/AlxhVbM/2fbSpgzahyU=
X-Gm-Gg: ASbGncstI1HYZbErC8uUhfvqOsq5IdF/d7rtF9UYkS9bUz8rUmDn/CEtah1RpVT0N5l
	4Fdt3xCxdmLfXZysOERg+2+oYN3SfpP3L2X+B2Y2bZX9TGr/SXWXJtMFnbd5yuSTAQ80tHemOye
	suc1xogbzHQgDRAVWs8mXr7a40UYR+FDwWeQ5NsjVBB2staOacvPRKBk1tGq2K62DV9D47OyKkH
	ILk2AoPc888dHIxv9aCEPwZrMXxblpUgt0d8vItRWXLcGdcrEJlM6ob8QnW0jXR6u7ABigoGF4=
X-Google-Smtp-Source: AGHT+IFBEmfcqddrXrL/Z1EH2lks0Dwq8+yKxv5/UdWltkE4DG7UysEBFkKmbef4z8X6f+H3A2Gk6BgSHDVYwx1ZvP4=
X-Received: by 2002:a05:600c:6383:b0:46e:32dd:1b1a with SMTP id
 5b1f17b1804b1-46fa9a8f146mr49327895e9.7.1760015326038; Thu, 09 Oct 2025
 06:08:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251002161728.186024-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20251002161728.186024-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVP4xgsc6rD_Z6OMAXR-mOe9WdfZb2jXZSzDmXdgZzFSw@mail.gmail.com>
In-Reply-To: <CAMuHMdVP4xgsc6rD_Z6OMAXR-mOe9WdfZb2jXZSzDmXdgZzFSw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 9 Oct 2025 14:08:19 +0100
X-Gm-Features: AS18NWC5rsslB-cfQdgL7VawbRMgX6qh2J8jZ5sIkVStSJ8rbfHF59Zw3xWMXPw
Message-ID: <CA+V-a8uWYsQcfHx-4BRaLoH30uy3vaT-e9zqrW_kwoX_bsb8Xw@mail.gmail.com>
Subject: Re: [PATCH v9 2/6] clk: renesas: rzv2h-cpg: Add support for DSI clocks
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Mon, Oct 6, 2025 at 1:45=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Thu, 2 Oct 2025 at 18:17, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add support for PLLDSI and its post-dividers in the RZ/V2H CPG driver a=
nd
> > export helper APIs for use by the DSI driver.
> >
> > Introduce per-PLL-DSI state in the CPG private structure and provide a
> > set of helper functions that find valid PLL parameter combinations for
> > a requested frequency. The new helpers are rzv2h_get_pll_pars(),
> > rzv2h_get_pll_div_pars(), rzv2h_get_pll_divs_pars() and
> > rzv2h_get_pll_dtable_pars() and they are exported in the "RZV2H_CPG"
> > namespace for use by other consumers (notably the DSI driver). These
> > helpers perform iterative searches over PLL parameters (M, K, P, S)
> > and optional post-dividers and return the best match (or an exact
> > match when possible).
> >
> > Move PLL/CLK related limits and parameter types into the shared
> > include (include/linux/clk/renesas.h) by adding struct rzv2h_pll_limits=
,
> > struct rzv2h_pll_pars and struct rzv2h_pll_div_pars plus the
> > RZV2H_CPG_PLL_DSI_LIMITS() helper macro to define DSI PLL limits.
> >
> > This change centralises the PLLDSI algorithms so the CPG and DSI
> > drivers compute PLL parameters consistently and allows the DSI driver
> > to accurately request rates and program its PLL.
> >
> > Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v8->v9:
> > - Dropped `renesas-rzv2h-cpg-pll.h` header and merged into `renesas.h`
> > - Exported the symbols for PLL calculation apis
> > - Updated commit message
> > - Dropped reviewed-by tags due to above changes
>
> Thanks for the update!
>
> > --- a/drivers/clk/renesas/rzv2h-cpg.c
> > +++ b/drivers/clk/renesas/rzv2h-cpg.c
>
> > +/*
> > + * rzv2h_get_pll_div_pars - Finds the best combination of PLL paramete=
rs
> > + * and divider value for a given frequency.
> > + *
> > + * @limits: Pointer to the structure containing the limits for the PLL=
 parameters
> > + * @pars: Pointer to the structure where the best calculated PLL param=
eters and
> > + * divider values will be stored
> > + * @divider: Divider value to be applied to the PLL output
> > + * @freq_millihz: Target output frequency in millihertz
> > + *
> > + * This function calculates the best set of PLL parameters (M, K, P, S=
) where
> > + * the divider value is already known. See rzv2h_get_pll_pars() for mo=
re details
> > + * on how the PLL parameters are calculated.
> > + */
> > +bool rzv2h_get_pll_div_pars(const struct rzv2h_pll_limits *limits,
> > +                           struct rzv2h_pll_div_pars *pars, u8 divider=
,
> > +                           u64 freq_millihz)
> > +{
> > +       if (!rzv2h_get_pll_pars(limits, &pars->pll, freq_millihz * divi=
der))
> > +               return false;
> > +
> > +       pars->div.divider_value =3D divider;
> > +       pars->div.freq_millihz =3D DIV_U64_ROUND_CLOSEST(pars->pll.freq=
_millihz, divider);
> > +       pars->div.error_millihz =3D freq_millihz - pars->div.freq_milli=
hz;
> > +
> > +       return true;
> > +}
> > +EXPORT_SYMBOL_NS_GPL(rzv2h_get_pll_div_pars, "RZV2H_CPG");
>
> This function does not seem to be used outside this module yet,
> so why is it exported?
>
Agreed, I will drop it.

> If you do ever need it, you could define a simple wrapper in the
> header file:
>
>     static inline bool rzv2h_get_pll_div_pars(const struct
> rzv2h_pll_limits *limits,
>                                               struct rzv2h_pll_div_pars *=
pars,
>                                               u8 divider, u64 freq_millih=
z)
>     {
>             return rzv2h_get_pll_divs_pars(limits, pars, &divider, 1,
> freq_millihz);
>     }
>
Agreed.

> > +
> > +/*
> > + * rzv2h_get_pll_divs_pars - Finds the best combination of PLL paramet=
ers
> > + * and divider value for a given frequency.
> > + *
> > + * @limits: Pointer to the structure containing the limits for the PLL=
 parameters
> > + * @pars: Pointer to the structure where the best calculated PLL param=
eters and
> > + * divider values will be stored
> > + * @table: Pointer to the array of valid divider values
> > + * @table_size: Size of the divider values array
> > + * @freq_millihz: Target output frequency in millihertz
> > + *
> > + * This function calculates the best set of PLL parameters (M, K, P, S=
) and divider
> > + * value to achieve the desired frequency. See rzv2h_get_pll_pars() fo=
r more details
> > + * on how the PLL parameters are calculated.
> > + *
> > + * freq_millihz is the desired frequency generated by the PLL followed=
 by a
> > + * a gear.
> > + */
> > +bool rzv2h_get_pll_divs_pars(const struct rzv2h_pll_limits *limits,
> > +                            struct rzv2h_pll_div_pars *pars,
> > +                            const u8 *table, u8 table_size, u64 freq_m=
illihz)
> > +{
> > +       struct rzv2h_pll_div_pars p, best;
> > +
> > +       best.div.error_millihz =3D S64_MAX;
> > +       p.div.error_millihz =3D S64_MAX;
> > +       for (unsigned int i =3D 0; i < table_size; i++) {
> > +               if (!rzv2h_get_pll_div_pars(limits, &p, table[i], freq_=
millihz))
>
> If you don't need rzv2h_get_pll_div_pars() elsewhere, you could just
> expand it here.
>
Agreed, I will expand it here and drop rzv2h_get_pll_div_pars().

> > +                       continue;
> > +
> > +               if (p.div.error_millihz =3D=3D 0) {
> > +                       *pars =3D p;
> > +                       return true;
> > +               }
> > +
> > +               if (abs(best.div.error_millihz) > abs(p.div.error_milli=
hz))
> > +                       best =3D p;
> > +       }
> > +
> > +       if (best.div.error_millihz =3D=3D S64_MAX)
> > +               return false;
> > +
> > +       *pars =3D best;
> > +       return true;
> > +}
> > +EXPORT_SYMBOL_NS_GPL(rzv2h_get_pll_divs_pars, "RZV2H_CPG");
> > +
> > +/*
> > + * rzv2h_get_pll_dtable_pars - Finds the best combination of PLL param=
eters
> > + * and divider value for a given frequency using a divider table.
> > + *
> > + * @limits: Pointer to the structure containing the limits for the PLL=
 parameters
> > + * @pars: Pointer to the structure where the best calculated PLL param=
eters and
> > + * divider values will be stored
> > + * @dtable: Pointer to the array of valid divider values
> > + * @freq_millihz: Target output frequency in millihertz
> > + *
> > + * See rzv2h_get_pll_divs_pars() for more details on how the PLL
> > + * parameters and divider values are calculated.
> > + */
> > +bool rzv2h_get_pll_dtable_pars(const struct rzv2h_pll_limits *limits,
> > +                              struct rzv2h_pll_div_pars *pars,
> > +                              const struct clk_div_table *dtable, u64 =
freq_millihz)
> > +{
> > +       const struct clk_div_table *div =3D dtable;
> > +       u8 table[RZV2H_MAX_DIV_TABLES] =3D { 0 };
> > +       unsigned int i =3D 0;
> > +
> > +       for (; div->div; div++) {
> > +               if (i >=3D RZV2H_MAX_DIV_TABLES)
> > +                       return false;
> > +               table[i++] =3D div->div;
> > +       }
> > +
> > +       return rzv2h_get_pll_divs_pars(limits, pars, table, i, freq_mil=
lihz);
> > +}
> > +EXPORT_SYMBOL_NS_GPL(rzv2h_get_pll_dtable_pars, "RZV2H_CPG");
>
> This function does not seem to be used outside this module yet,
> so why is it exported?
>
Agreed, I will drop it.

> > +
> > +static unsigned long rzv2h_cpg_plldsi_div_recalc_rate(struct clk_hw *h=
w,
> > +                                                     unsigned long par=
ent_rate)
> > +{
> > +       struct rzv2h_plldsi_div_clk *dsi_div =3D to_plldsi_div_clk(hw);
> > +       struct rzv2h_cpg_priv *priv =3D dsi_div->priv;
> > +       struct ddiv ddiv =3D dsi_div->ddiv;
> > +       u32 div;
> > +
> > +       div =3D readl(priv->base + ddiv.offset);
> > +       div >>=3D ddiv.shift;
> > +       div &=3D clk_div_mask(ddiv.width);
> > +       div =3D dsi_div->dtable[div].div;
> > +
> > +       return DIV_ROUND_CLOSEST_ULL(parent_rate, div);
> > +}
> > +
> > +static int rzv2h_cpg_plldsi_div_determine_rate(struct clk_hw *hw,
> > +                                              struct clk_rate_request =
*req)
> > +{
> > +       struct rzv2h_plldsi_div_clk *dsi_div =3D to_plldsi_div_clk(hw);
> > +       struct pll_clk *pll_clk =3D to_pll(clk_hw_get_parent(hw));
> > +       struct rzv2h_cpg_priv *priv =3D dsi_div->priv;
> > +       struct rzv2h_pll_div_pars *dsi_params;
> > +       struct rzv2h_pll_dsi_info *dsi_info;
> > +       u64 rate_millihz;
> > +
> > +       dsi_info =3D &priv->pll_dsi_info[pll_clk->pll.instance];
> > +       dsi_params =3D &dsi_info->pll_dsi_parameters;
> > +
> > +       rate_millihz =3D mul_u32_u32(req->rate, MILLI);
> > +       if (rate_millihz =3D=3D dsi_params->div.error_millihz + dsi_par=
ams->div.freq_millihz)
> > +               goto exit_determine_rate;
> > +
> > +       if (!rzv2h_get_pll_dtable_pars(dsi_info->pll_dsi_limits, dsi_pa=
rams, dsi_div->dtable,
> > +                                      rate_millihz)) {
>
> If you don't need rzv2h_get_pll_dtable_pars() elsewhere, you could just
> expand it here.
>
Ok, I will expand it here.

> > +               dev_err(priv->dev,
> > +                       "failed to determine rate for req->rate: %lu\n"=
,
> > +                       req->rate);
> > +               return -EINVAL;
> > +       }
> > +
> > +exit_determine_rate:
> > +       req->rate =3D DIV_ROUND_CLOSEST_ULL(dsi_params->div.freq_millih=
z, MILLI);
> > +       req->best_parent_rate =3D req->rate * dsi_params->div.divider_v=
alue;
> > +       dsi_info->req_pll_dsi_rate =3D req->best_parent_rate;
> > +
> > +       return 0;
> > +}
>
> > --- a/include/linux/clk/renesas.h
> > +++ b/include/linux/clk/renesas.h
> > @@ -10,7 +10,9 @@
> >  #ifndef __LINUX_CLK_RENESAS_H_
> >  #define __LINUX_CLK_RENESAS_H_
> >
> > +#include <linux/clk-provider.h>
> >  #include <linux/types.h>
> > +#include <linux/units.h>
> >
> >  struct device;
> >  struct device_node;
> > @@ -32,4 +34,138 @@ void cpg_mssr_detach_dev(struct generic_pm_domain *=
unused, struct device *dev);
> >  #define cpg_mssr_attach_dev    NULL
> >  #define cpg_mssr_detach_dev    NULL
> >  #endif
> > +
> > +/**
> > + * struct rzv2h_pll_limits - PLL parameter constraints
> > + *
> > + * This structure defines the minimum and maximum allowed values for
> > + * various parameters used to configure a PLL. These limits ensure
> > + * the PLL operates within valid and stable ranges.
> > + *
> > + * @fout: Output frequency range (in MHz)
> > + * @fout.min: Minimum allowed output frequency
> > + * @fout.max: Maximum allowed output frequency
> > + *
> > + * @fvco: PLL oscillation frequency range (in MHz)
> > + * @fvco.min: Minimum allowed VCO frequency
> > + * @fvco.max: Maximum allowed VCO frequency
> > + *
> > + * @m: Main-divider range
> > + * @m.min: Minimum main-divider value
> > + * @m.max: Maximum main-divider value
> > + *
> > + * @p: Pre-divider range
> > + * @p.min: Minimum pre-divider value
> > + * @p.max: Maximum pre-divider value
> > + *
> > + * @s: Divider range
> > + * @s.min: Minimum divider value
> > + * @s.max: Maximum divider value
> > + *
> > + * @k: Delta-sigma modulator range (signed)
> > + * @k.min: Minimum delta-sigma value
> > + * @k.max: Maximum delta-sigma value
> > + */
> > +struct rzv2h_pll_limits {
> > +       struct {
> > +               u32 min;
> > +               u32 max;
> > +       } fout;
> > +
> > +       struct {
> > +               u32 min;
> > +               u32 max;
> > +       } fvco;
> > +
> > +       struct {
> > +               u16 min;
> > +               u16 max;
> > +       } m;
> > +
> > +       struct {
> > +               u8 min;
> > +               u8 max;
> > +       } p;
> > +
> > +       struct {
> > +               u8 min;
> > +               u8 max;
> > +       } s;
> > +
> > +       struct {
> > +               s16 min;
> > +               s16 max;
> > +       } k;
> > +};
> > +
> > +/**
> > + * struct rzv2h_pll_pars - PLL configuration parameters
> > + *
> > + * This structure contains the configuration parameters for the
> > + * Phase-Locked Loop (PLL), used to achieve a specific output frequenc=
y.
> > + *
> > + * @m: Main divider value
> > + * @p: Pre-divider value
> > + * @s: Output divider value
> > + * @k: Delta-sigma modulation value
> > + * @freq_millihz: Calculated PLL output frequency in millihertz
> > + * @error_millihz: Frequency error from target in millihertz (signed)
> > + */
> > +struct rzv2h_pll_pars {
> > +       u16 m;
> > +       u8 p;
> > +       u8 s;
> > +       s16 k;
> > +       u64 freq_millihz;
> > +       s64 error_millihz;
> > +};
> > +
> > +/**
> > + * struct rzv2h_pll_div_pars - PLL parameters with post-divider
> > + *
> > + * This structure is used for PLLs that include an additional post-div=
ider
> > + * stage after the main PLL block. It contains both the PLL configurat=
ion
> > + * parameters and the resulting frequency/error values after the divid=
er.
> > + *
> > + * @pll: Main PLL configuration parameters (see struct rzv2h_pll_pars)
> > + *
> > + * @div: Post-divider configuration and result
> > + * @div.divider_value: Divider applied to the PLL output
> > + * @div.freq_millihz: Output frequency after divider in millihertz
> > + * @div.error_millihz: Frequency error from target in millihertz (sign=
ed)
> > + */
> > +struct rzv2h_pll_div_pars {
> > +       struct rzv2h_pll_pars pll;
> > +       struct {
> > +               u8 divider_value;
> > +               u64 freq_millihz;
> > +               s64 error_millihz;
> > +       } div;
> > +};
> > +
> > +#define RZV2H_CPG_PLL_DSI_LIMITS(name)                                =
 \
> > +       static const struct rzv2h_pll_limits (name) =3D {              =
   \
> > +               .fout =3D { .min =3D 25 * MEGA, .max =3D 375 * MEGA }, =
       \
> > +               .fvco =3D { .min =3D 1600 * MEGA, .max =3D 3200 * MEGA =
},     \
> > +               .m =3D { .min =3D 64, .max =3D 533 },                  =
       \
> > +               .p =3D { .min =3D 1, .max =3D 4 },                     =
       \
> > +               .s =3D { .min =3D 0, .max =3D 6 },                     =
       \
> > +               .k =3D { .min =3D -32768, .max =3D 32767 },            =
       \
> > +       }                                                              =
 \
> > +
> > +bool rzv2h_get_pll_pars(const struct rzv2h_pll_limits *limits,
> > +                       struct rzv2h_pll_pars *pars, u64 freq_millihz);
>
> Please add a dummy returning false for the !CONFIG_CLK_RZV2H case.
>
Agreed, I will add a static inline helper returning false.

> > +
> > +bool rzv2h_get_pll_div_pars(const struct rzv2h_pll_limits *limits,
> > +                           struct rzv2h_pll_div_pars *pars, u8 divider=
,
> > +                           u64 freq_millihz);
>
> Unused, please drop.
>
OK.

> > +
> > +bool rzv2h_get_pll_divs_pars(const struct rzv2h_pll_limits *limits,
> > +                            struct rzv2h_pll_div_pars *pars,
> > +                            const u8 *table, u8 table_size, u64 freq_m=
illihz);
>
> Please add a dummy returning false for the !CONFIG_CLK_RZV2H case.
>
Agreed, I will add a static inline helper returning false.

> > +
> > +bool rzv2h_get_pll_dtable_pars(const struct rzv2h_pll_limits *limits,
> > +                              struct rzv2h_pll_div_pars *pars,
> > +                              const struct clk_div_table *dtable, u64 =
freq_millihz);
>
> Unused, please drop.
>
Ok.

Cheers,
Prabhakar

