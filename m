Return-Path: <linux-renesas-soc+bounces-16156-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 975A0A93AC2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Apr 2025 18:25:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C52719E1393
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Apr 2025 16:24:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A691721518F;
	Fri, 18 Apr 2025 16:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RBVJNQVz"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1608213E97;
	Fri, 18 Apr 2025 16:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744993219; cv=none; b=Etej9utsAk86nN0tnJQzRwG3ijzD36o85xSDdH+Oq1e1urTwNWv1ac2YNYQGOkpzJ1LpaVkrwSrDqipKdFgIbwOmOm/OiE0s4/tLX/nZ3DS2aO1lQWfuaMTfyLGs0OuVv9Adr7b4ORcyJWSw0Hx81C2Jw3LRsU64dYLNacaxmxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744993219; c=relaxed/simple;
	bh=I2VhVRCgiNFctECKZ2afmPrwUUdZbmuKc1mrvxhU3Nw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z5HeAyjGZlOEJe6CWl80AkQ4Ex//C0Liekf/WmGTCAbEi+qob63izkil7AKpm7c0x+fxyrz6EReOXU+GaUC7GVGey4BmOkBRPvgvoi4qdXkjecXh+6khCynp8YAyoHS64KNT0QMKXbT79fuQvzCtqnZ8zKVaUvWP5757PMLmzVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RBVJNQVz; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39c13fa05ebso1346266f8f.0;
        Fri, 18 Apr 2025 09:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744993216; x=1745598016; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lg2nEDrkhUSorPX1TF01jndQPRc7b/tFFfdzWj6Yd3c=;
        b=RBVJNQVzur7JnHaJEu6CdmOKGdsWQ9xpXc4VDFrbJ2WO2YyvxKtlOVF+q+vgh5iKN9
         dQZH2n2ppgGpGKhY+GkikqhCUZAJSIymLYDeAL1yuusHCZTcBvWsH33HsOSRzW1B6VTQ
         uRFygJYE/G5pQIMpGmNPEpOs/W7tSpVltvWhh7RTVVQsKbXGHIgF/iKJ5si+lJISCJ4V
         u1rO6ZmbxLQMjB4mYCrRPBE3KtmU/cHTUp6U0ZJKV8AjIBHvyNVKI8pTbV/xx6VBZRsd
         0wPEEE9iELtym5TWyI+mLs+rxp1JCU9S4IRhTT76gWNm2E62ZGc+M1NAJxp2X/ckAgo+
         uf/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744993216; x=1745598016;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lg2nEDrkhUSorPX1TF01jndQPRc7b/tFFfdzWj6Yd3c=;
        b=FEJTg6f0s4rSCOiOyURX77yqADtekMX8dfnuH9qpvUjbk1uktRyDxaTBsKywvNiptj
         x+F1Gpd1GxqpJufKsSmF70TVCK+he/j03DFKbYfc2G0XsEZ6Rptz6PgLDbJltLwTR/hs
         mVYFjrG/LHlhs00tKDYhPAvEcDZMgQybUUtWi4LsLThGPDhNoSwFYKo+eOBTVIAjhNwo
         jlAg7kcw5WjHnRcbQFzp8SJkKuiGetrBFEN2k1Wi3W2kP0A4OPXcLqpy2LzM4DVLMMz3
         p6Wh4mTAwjGczG+YFMixN/6YS2Gs/MuxWHSG1xNt4xM5PBYQfafqIAm4U1kcte0DzV29
         DQ9w==
X-Forwarded-Encrypted: i=1; AJvYcCU+UFKBS+nKsxZmhJxQf9rRJdgFz1O6vfcaZ7nsbFtP5iWjjnuyluOjFiIXkfx4i2QWQCfULX5hgj83wIMi@vger.kernel.org, AJvYcCU93dT/yu+vkahfc0r5ZBR5YsILIVeP4UzcILwPyccjYVjWoaBCU0lKRVgROxSfAMMN/6zPQtDDRI3z7NHYC/jHPXM=@vger.kernel.org, AJvYcCUaKnzWEsERdNrzDWGw29OloUQlMGnHWDe4vnVADWvb3n7WHR3MKtib46pBE467Y0rs1qYAbG+YYrED@vger.kernel.org, AJvYcCXASRb3RQhJWFs7IaduokdfRNZ8DgRD5DgLkMbkrsNgDGiNEdlySKFlP8/6KYIA/b2lZrVp356PvXP6@vger.kernel.org
X-Gm-Message-State: AOJu0YyDY5/trR5G1MPijDlOlLKiuknJ/a/58EfvNEja8Nie8y03nTKd
	5l9m5G+aVcqihuHKcTaHy1y08ifsVdm06DlMLLEBGleCJBCqtXyO9YnpxuWwZg0g7pKvN0vysAQ
	dox+iAeDFR8RZ1JxzTTeaPDGgsUg=
X-Gm-Gg: ASbGncvMd6r+jO3OnPu/81cUodQ4Hgiq/bbrw1vn+5+FOJD0Sj3j40adr56QO9lcEYI
	aTPlbAtX4FffXYf8YMJH5w5RFlJukkpb6YA17n3X8nEEhFvWuGRrW1m34KEP01D7L1Ekgdlj7Z8
	dyvcWZvoHflgeeiLD1C0W0VpADbFCgf0rGAmx6r/Cfv7+4RUwQ2pl4e3Y=
X-Google-Smtp-Source: AGHT+IEV8nQTdx71bXcsntH0008bnHpQrtXie8jNHCgnnEl5r+L0tBJL/zzaH6f3dMSiz8NUoJhMEwSZKKUKtHX5/lU=
X-Received: by 2002:a05:6000:2913:b0:39e:f641:c43 with SMTP id
 ffacd0b85a97d-39efbaf689bmr2593076f8f.53.1744993215679; Fri, 18 Apr 2025
 09:20:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408200916.93793-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250408200916.93793-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdVjVEVh+dHKG_afZwyqsXwHj2FR7enHNrfuE9HJ0ELjEA@mail.gmail.com>
In-Reply-To: <CAMuHMdVjVEVh+dHKG_afZwyqsXwHj2FR7enHNrfuE9HJ0ELjEA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 18 Apr 2025 17:19:49 +0100
X-Gm-Features: ATxdqUEv6B6wG3-yJDLbiPWcjxc0fko3GJZ2QYvMG7cMut2VaxrivVkJC_7m9sY
Message-ID: <CA+V-a8sqpv=Gbj+TDgkayx9ya_YfYQ=-v0-9J+GDEjHzyWEbJg@mail.gmail.com>
Subject: Re: [PATCH v2 01/15] clk: renesas: rzv2h-cpg: Add support for DSI clocks
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Wed, Apr 16, 2025 at 10:27=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Prabhakar, Fabrizio,
>
> Thanks for your patch!
>
> On Tue, 8 Apr 2025 at 22:09, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add support for PLLDSI and PLLDSI divider clocks.
> >
> > The `renesas-rzv2h-dsi.h` header file is added to share the PLL divider
> > algorithm between the CPG and DSI drivers.
>
> Please explain here why the DSI driver needs access to this algorithm.
>
> > Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> > --- a/drivers/clk/renesas/rzv2h-cpg.c
> > +++ b/drivers/clk/renesas/rzv2h-cpg.c
>
> > @@ -196,6 +225,253 @@ static int rzv2h_cpg_pll_clk_enable(struct clk_hw=
 *hw)
> >         return ret;
> >  }
> >
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
> > +       div &=3D ((2 << ddiv.width) - 1);
>
> Shouldn't that "2" be "1"?
> GENMASK(ddiv.width - 1, 0), or even better: clk_div_mask(ddiv.width).
>
> > +
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
> > +       struct rzv2h_cpg_priv *priv =3D dsi_div->priv;
> > +       struct rzv2h_plldsi_parameters *dsi_dividers =3D &priv->plldsi_=
div_parameters;
> > +       unsigned long long rate_mhz;
>
> u64?
> Please use "millihz" instead of "mhz" everywhere, so it becomes very
> clear this is really "mHz" and not "MHz".
>
> > +
> > +       /*
> > +        * Adjust the requested clock rate (`req->rate`) to ensure it f=
alls within
> > +        * the supported range of 5.44 MHz to 187.5 MHz.
> > +        */
> > +       req->rate =3D clamp(req->rate, 5440000UL, 187500000UL);
> > +
> > +       rate_mhz =3D req->rate * MILLI * 1ULL;
> > +       if (rate_mhz =3D=3D dsi_dividers->error_mhz + dsi_dividers->fre=
q_mhz)
> > +               goto exit_determine_rate;
> > +
> > +       if (!rzv2h_dsi_get_pll_parameters_values(priv->dsi_limits,
> > +                                                dsi_dividers, rate_mhz=
)) {
> > +               dev_err(priv->dev,
> > +                       "failed to determine rate for req->rate: %lu\n"=
,
> > +                       req->rate);
> > +               return -EINVAL;
> > +       }
> > +
> > +exit_determine_rate:
> > +       req->best_parent_rate =3D req->rate * dsi_dividers->csdiv;
> > +
> > +       return 0;
> > +};
> > +
> > +static int rzv2h_cpg_plldsi_div_set_rate(struct clk_hw *hw,
> > +                                        unsigned long rate,
> > +                                        unsigned long parent_rate)
> > +{
> > +       struct rzv2h_plldsi_div_clk *dsi_div =3D to_plldsi_div_clk(hw);
> > +       struct rzv2h_cpg_priv *priv =3D dsi_div->priv;
> > +       struct rzv2h_plldsi_parameters *dsi_dividers =3D &priv->plldsi_=
div_parameters;
> > +       struct ddiv ddiv =3D dsi_div->ddiv;
> > +       const struct clk_div_table *clkt;
> > +       u32 reg, shift, div;
> > +
> > +       div =3D dsi_dividers->csdiv;
> > +       for (clkt =3D dsi_div->dtable; clkt->div; clkt++) {
> > +               if (clkt->div =3D=3D div)
> > +                       break;
> > +       }
> > +
> > +       if (!clkt->div && !clkt->val)
> > +               return -EINVAL;
>
> No need to check clkt->dev.
>
> > +
> > +       shift =3D ddiv.shift;
> > +       reg =3D readl(priv->base + ddiv.offset);
> > +       reg &=3D ~(GENMASK(shift + ddiv.width, shift));
> > +
> > +       writel(reg | (clkt->val << shift) |
> > +              DDIV_DIVCTL_WEN(shift), priv->base + ddiv.offset);
> > +
> > +       return 0;
>
> This function is very similar to the existing rzv2h_ddiv_set_rate().
> If you can't re-use it as-is, please consider factoring out the common
> part, or at least follow the same style of RMW-operation.
>
> > +};
>
>
> > +static long rzv2h_cpg_plldsi_round_rate(struct clk_hw *hw,
> > +                                       unsigned long rate,
> > +                                       unsigned long *parent_rate)
> > +{
> > +       return clamp(rate, 25000000UL, 375000000UL);
>
> This only rounds rates outside the range from 25 to 375 MHz.
> What about rates between 25 and 375 MHz?
>
My intention was to clamp it and let the PLL DSI DIV determine_rate
handle rejecting the rates if they dont get best dividers. Let's take
this discussion to v3.

Cheers,
Prabhakar

