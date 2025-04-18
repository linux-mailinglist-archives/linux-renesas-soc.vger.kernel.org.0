Return-Path: <linux-renesas-soc+bounces-16149-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D4543A9359D
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Apr 2025 11:52:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 561F718889C4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Apr 2025 09:52:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D739426A1CF;
	Fri, 18 Apr 2025 09:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nKtytBLr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F41AB20897F;
	Fri, 18 Apr 2025 09:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744969919; cv=none; b=ijqUyXFFAG+N84d//vjY6qvRI2GqQSZfPPOzOrZ+xrGdg2WFxOhWlLHERl2sto+z6p3vahkbEd/JAHBEUGVP0tlKFCdc9H4GSbyua7hx0OlyfxOjh6b/v1eEjN0hkHxxI7fU+Sz2lMZXAS5TFMCQugy68zpZTf+WxxaOzQV/ysk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744969919; c=relaxed/simple;
	bh=/fYqAZVBQ8oqYvm33CfkvC9JPG/SUstnVYJb39g1x8I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sK25AHKrdqHK/2tE8vNHVv2jA/TxXbgXUtPBWc7+Cx9LYJXV1r1FKWMKpmMKvtTnolJ5IXQyXG0CVpd5ZSWLLbUSo1YibyrPCoRnibwXCaDU1s8qfyUmsBN9h1kz78qEzcWctwn9ELD0WMa5lMizPO9cFbSZ53GJhvbc68h2q6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nKtytBLr; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so12243665e9.0;
        Fri, 18 Apr 2025 02:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744969916; x=1745574716; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LTriGcJf1+d2mqFYAg9DFYbIx+5WzZgXxQPOJC5ixQk=;
        b=nKtytBLrLnB/R5kdnPjoO5ThYp0OPfxA6xlNFl+DM+5cvoGkCULMWRq/mMV6q8vrVr
         wWbqdUQB51f+yqtH9czQ492L50Qy0KSMlvfKPXwGKW3VqzarswjfmeZaCQJ/6o5Ungxk
         SY+zJ5Y87n1ndHmlcwvEXp6Qo+XvrraOKWXr8SsEaU0wSVE0faFvZYS3ujDngsJoilGz
         HOwUt5lGH9yGO1lw87sPTjR9PGJI2XCfs24dChs1LBFGOiV9aH+MJcQ9M7CjKmaFNdgT
         KBbKV/hIEfsp47BNAL7atcmfX11E6EL7McXd6JC0Z9y+VpJY9hiNTXbUIUKbNP0HPN5d
         7kwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744969916; x=1745574716;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LTriGcJf1+d2mqFYAg9DFYbIx+5WzZgXxQPOJC5ixQk=;
        b=n11DANOfNWHWPeHt8GzznVPCtB4W0uERW6IuppiJWMmuTIAwvF1otry5lrKHWEHX2z
         l2a+z9KAysveJ5/hndDsOQFUnL0dEYQWJ92CFxvWNENiDmDizvEreii4JY0C13w0LdG/
         s3QTFYWu9WP8zJiKnbW99bDdiLV+dUdUUeiBR1pqKxUyNhINOruP5Yf022stIUjBvCm2
         kRCpGnE36RyQq0XIpfY0aw9xooBR0qHmReJGm106inZYA07FlLfrLjYwI40RAdFhCF9+
         ubMsJgQrZFOhOPsuIX/5j7gGM6HnfE210LwKa2g8leZZUh7J7Z46kpfMwgNXGs/iAiRA
         UOzw==
X-Forwarded-Encrypted: i=1; AJvYcCUBhDg4vjhXneKBvC3RIOC8uAcneA8XGWnZO/ZzR/8iwY15y67Xwgo626E/yGK1jvq5s+vkgnB6Ebic@vger.kernel.org, AJvYcCV0WbLLrCXMpC5ZjV5cthPwcY/GqsgqMqANsuWkUaBshoZ2VObK5bvj973x83jm6YyIpBgStD20fOzG+dZ3@vger.kernel.org, AJvYcCWFH6CD3CQurXPZ4MZ1qvASr4lPd4tsmbumqaELFgY1K83h7EYyHRFNq4GpxUfIylqcZMSdyTV94kCg@vger.kernel.org, AJvYcCWghwdulCYCLHYhr5BKCjo8YbEuwJj0JixCorxmW9E0QDUZ02ZCW9LM7wD7DwzU5FfuQUKH1OeYQzJA+aH/HI1Ty4g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5d704Q9oqSJr+gtlCKfFF9d14yAXQl5TPQ+6GVNDD/iW1G2JQ
	sQ5NFcuRKGQGCR6cKN53bzHzouPFzXHpiMYAB+WhRuq8z4lkMZuabCsriCpKpG9M9V+CZ0cA0Fd
	nPA/yFxpsmLiOs8pbeKXuTJrO3SU=
X-Gm-Gg: ASbGnct2IMYZoLn/eqWnTqHdxf//C1GJKM4eqsW5vYtIm1aomnjjpyAcMcL7gAFJyB6
	jicOxEfbMyMcYBikU6BWkd2dIR+XfFTkcVtZd80aGeUqCvRZv+lfJPAJBnd+aH30pC1+eB6w7Jg
	TkiytDdYiHmkDRpZtownj6qyU8D1DOKiFRhslZH+QhL45ANSmL6hpQkCXO/y+ndOCF2w==
X-Google-Smtp-Source: AGHT+IH+R0wDsPZxpttzWIBTizKL16OUAhkIs8Ybf3Z1XefroUvyq7u8MBaLKEnIreBCTXJI7j1Hi4bmT3L3IR1EI3Q=
X-Received: by 2002:a05:6000:40ce:b0:39e:cbd2:9211 with SMTP id
 ffacd0b85a97d-39efbaf70b4mr1420004f8f.55.1744969915990; Fri, 18 Apr 2025
 02:51:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408200916.93793-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250408200916.93793-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdW9WhKeMyKfdiLWmLC8mabNe-4ROW5uCZhx6z503GE0Ug@mail.gmail.com>
In-Reply-To: <CAMuHMdW9WhKeMyKfdiLWmLC8mabNe-4ROW5uCZhx6z503GE0Ug@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 18 Apr 2025 10:51:29 +0100
X-Gm-Features: ATxdqUGJ33rQ0RpZLlTvPOwYpzkjsOoa22XiNfmq9rKmqKxtHcumo8VUIXPTNAE
Message-ID: <CA+V-a8tCtVQA3DnzKMy+4gZDwZqhg29E0H+7cS0YojFkQ2Os_g@mail.gmail.com>
Subject: Re: [PATCH v2 01/15] clk: renesas: rzv2h-cpg: Add support for DSI clocks
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Tue, Apr 15, 2025 at 4:57=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, 8 Apr 2025 at 22:09, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add support for PLLDSI and PLLDSI divider clocks.
> >
> > The `renesas-rzv2h-dsi.h` header file is added to share the PLL divider
> > algorithm between the CPG and DSI drivers.
> >
> > Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/clk/renesas/rzv2h-cpg.c
> > +++ b/drivers/clk/renesas/rzv2h-cpg.c
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
> > +
> > +       /*
> > +        * Adjust the requested clock rate (`req->rate`) to ensure it f=
alls within
> > +        * the supported range of 5.44 MHz to 187.5 MHz.
> > +        */
> > +       req->rate =3D clamp(req->rate, 5440000UL, 187500000UL);
> > +
> > +       rate_mhz =3D req->rate * MILLI * 1ULL;
>
> The first multiplication overflows on 32-bit systems.
> Probably you wanted to use mul_u32_u32() instead?
>
Ok, I'll switch to mul_u32_u32() .

> More review later, I fell too deep in the wrong rabbit hole ("mhz !=3D
> megaHertz"), again...
>
After fixing the review comments on this I'll send out a v3 with this
change, so that its easier to review.

> > --- /dev/null
> > +++ b/include/linux/clk/renesas-rzv2h-dsi.h
> > @@ -0,0 +1,207 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Renesas RZ/V2H(P) DSI CPG helper
> > + *
> > + * Copyright (C) 2025 Renesas Electronics Corp.
> > + */
> > +
> > +#include <linux/limits.h>
> > +#include <linux/math.h>
> > +#include <linux/math64.h>
> > +#include <linux/units.h>
> > +
> > +#define OSC_CLK_IN_MEGA                (24 * MEGA)
> > +
> > +struct rzv2h_plldsi_div_limits {
> > +       struct {
> > +               u64 min;
> > +               u64 max;
>
> u32 should be sufficient?
>
Agreed.

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
> > +
> > +       struct {
> > +               u8 min;
> > +               u8 max;
> > +       } csdiv;
> > +};
> > +
> > +struct rzv2h_plldsi_parameters {
> > +       u64 freq_mhz;
> > +       s64 error_mhz;
> > +       u16 m;
> > +       s16 k;
> > +       u8 csdiv;
> > +       u8 p;
> > +       u8 s;
> > +};
> > +
> > +#define RZV2H_CPG_PLL_DSI_LIMITS(name)                                =
 \
> > +       static const struct rzv2h_plldsi_div_limits (name) =3D {       =
   \
> > +               .m =3D { .min =3D 64, .max =3D 533 },                  =
       \
> > +               .p =3D { .min =3D 1, .max =3D 4 },                     =
       \
> > +               .s =3D { .min =3D 0, .max =3D 6 },                     =
       \
> > +               .k =3D { .min =3D -32768, .max =3D 32767 },            =
       \
> > +               .csdiv =3D { .min =3D 2, .max =3D 32 },                =
       \
> > +               .fvco =3D { .min =3D 1600 * MEGA, .max =3D 3200 * MEGA =
}      \
>
> Please initialize the members in declaration order.
>
Ok.

Cheers,
Prabhakar

