Return-Path: <linux-renesas-soc+bounces-20807-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA41B2E73A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 23:11:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3D6E1BC743C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 21:11:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2A372F0C70;
	Wed, 20 Aug 2025 21:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BHM8PvQH"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED233054CF;
	Wed, 20 Aug 2025 21:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755724241; cv=none; b=X4/5wI7oFGRw2TLXBzhGtbSBD8oW6oCkSfs/lOQrxJz1vINCdZPiyuk0EMT9ss//Gu2COoYeeziOMQbwaOiG7vEtMSAZ74aTfB40ojMWCxe0txFsB1EO3KWBHjexsfPPtyeLZMEfhTW7FJhSX87He4UisD+JvgXHR9RNpMBl3U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755724241; c=relaxed/simple;
	bh=U5FpSTONOSNaTrEso8VkT/Y4yl0IYYEefiQddUmFpG4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iZJGy2V1ceNk6xRGXljIi4gRCYxNF0/W3bbi8KKxJNmYI4MVWvMAua2n+T/uRuEqk8O6GaPrfBj1eiEn7eXCAqgHETj0bDE9aSD7ooKDcYECoQ/Y1GoEvPRXXbdIiy2CNUafGxRoDcuHUjsqby80TE39zgK8nSOgj47ohOeGOjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BHM8PvQH; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45a1b004a31so2096435e9.0;
        Wed, 20 Aug 2025 14:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755724238; x=1756329038; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zhfVPOqQ7qiTgD9cHx5brMif8atNPzf9ZTrTf/HRcG0=;
        b=BHM8PvQHsQupnbXyzWyvqBudHQuPoP1ZJ67RxnSn0FA1uT323phlM6K14LHPJMaLJB
         JQ6u3mHoSol+Hyy6IX+aljqHju27r1C5nl0F66y3/kEa3/dzE7Dxwqt12p++ecnR2KIO
         aLf41csZrL4R4R70/sM9eab/VOVwpr1lKSlz3gJWnflv0T9W+fUTEK8uyIzLq6PKN0pM
         tQ1VZNb+TrxMivWPmCwRSaQo9evDf64b5XOTpJkEPpkOdNNaOQfxiWH1tLuyGH2syQNR
         nNzwavUhzGpM/+8XEnD0h6z+sLikHE6PoJFpzbl32TgfJi8HEad56F5J4kFYpLJgP7Th
         f+0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755724238; x=1756329038;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zhfVPOqQ7qiTgD9cHx5brMif8atNPzf9ZTrTf/HRcG0=;
        b=DZ3xtMLvbn4jDJuCV9V73afBn5nxmXCd8VM3FtEeXLX+XYCEI+Yjuk9xH8y4z9koj9
         DYDnJldjXwFbhu+9vIebT8HB+scZFVVPMDjB+gJNIGXv5U9rNHbJagSl6Zw822Zs/1SR
         w4OqM0UuS/b4LhX+cIwrdFLRBMe8WOeha538482wGV7UtjWGOf40LbVbO+AmXqHy+NiK
         UVSXWIQg6R0iH0zJzI74kD6ZjvSR+eYLCiDc1r4F7X2e0uEtd9Y7dqLcWD1jjxHxBCru
         Jt9u4hgIJ5u1N251o3QHGsvax0SCRyWypdnrEkHD3I4o9GjSSnnduBwMIvfY4RF6CzpU
         /7og==
X-Forwarded-Encrypted: i=1; AJvYcCUSmMH9zgLykPk5wSMBdR319I0BrGYtGPuVU9V6B7LiA4AgD03ofJq43Eos+4Y6aGF6DqE1q2JRy/HJ@vger.kernel.org, AJvYcCVMkw2/SklrIWDg3cVkrLHlwT+6ijrLoA3xYLKQ0Cu61c3prLpi5IsA5jWdexDOtYNyT0n/ofNJB9PcH50GLJODhns=@vger.kernel.org, AJvYcCWe6EyRY2HcKUASNgfxdRreEpsSe9xKSNaJvQ4yvmpkDCPIcG9buy7hoDFyIk8O8dYwMybyP3Y8ZDfGFgun@vger.kernel.org, AJvYcCXxmcT0qSDm+n/7sHVAEkn26yoNpeWUYFpUbTXhxIe0kI20nmozuYXyKswu4J/OlDTomAf2IKmFdfp7@vger.kernel.org
X-Gm-Message-State: AOJu0YxUcy/unBaoMaqIVbaC1RCQKWPHD6ECVf6F1VKeK6XDNEDEH5UB
	TLIfEI4cgaiGGj8RITf4fKGjRccvetzt3hZGujlEUbIvmKrn8nIWazXsFReKX//0BnnMPlPeg42
	kCvZOnMdpTPXfW+E7P2gA/HWgYqfdrCA=
X-Gm-Gg: ASbGncvI2e1OxOTmpYODeJ2rDQFnTovSSHJC4yHrKYmwyQBD9cR2NXgLRu5HduTlAGp
	m8TwI3Xpis1nFZEHTrFb4ltMI5UgBCbKGRLDpeD7NGZp4jCjdVKj6iX1xBOFGA6f+lru0I9wiod
	4Q66VAZJ/ke1LgORyuDvjDXlBH0G5d+oBfCANify2H1kBVGPF3LUUJ9eKGP1WqIPVTMLzkFIAa6
	b0UoFZhTFrvtGuhIoESrhp0gajY/y6A83R5e/z+vbmbs40ouMVRxCY8gtbl
X-Google-Smtp-Source: AGHT+IFI/Nnb06sqTePoFm77dEgYckmzlnneC0ypZniz+1v8wwnLkz4GDtRyYURGqAq2iKi4RHM5Hp4u3AVwBZvEW0M=
X-Received: by 2002:a5d:584c:0:b0:3b7:8832:fdcc with SMTP id
 ffacd0b85a97d-3c496da958cmr199184f8f.38.1755724237825; Wed, 20 Aug 2025
 14:10:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250728201435.3505594-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250728201435.3505594-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWj=W17j9WHhTR1gH9MZ_fcxve_dOi6eMiL62xphXG+GQ@mail.gmail.com>
In-Reply-To: <CAMuHMdWj=W17j9WHhTR1gH9MZ_fcxve_dOi6eMiL62xphXG+GQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 20 Aug 2025 22:10:11 +0100
X-Gm-Features: Ac12FXxwXYixCbHbInjPUHZeiQbzGNTBadmyQ9W-O0ENxXQq3rvL1U61uQYPnUs
Message-ID: <CA+V-a8vzb=Hin3B2S1zpgMUctyvuwHaqKgotNYm71G=FOvHqXA@mail.gmail.com>
Subject: Re: [PATCH v7 2/6] clk: renesas: rzv2h-cpg: Add support for DSI clocks
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
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

On Tue, Aug 19, 2025 at 2:14=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, 28 Jul 2025 at 22:14, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add support for PLLDSI and PLLDSI divider clocks.
> >
> > Introduce the `renesas-rzv2h-cpg-pll.h` header to centralize and share
> > PLLDSI related data structures, limits, and algorithms between the
> > RZ/V2H(P) CPG and DSI drivers.
> >
> > The DSI PLL is functionally similar to the CPG's PLLDSI, but has slight=
ly
> > different parameter limits and omits the programmable divider present i=
n
> > CPG. To ensure precise frequency calculations, especially for milliHz-l=
evel
> > accuracy needed by the DSI driver, the shared algorithm allows both dri=
vers
> > to compute PLL parameters consistently using the same logic and input
> > clock.
> >
> > Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v6->v7:
> > - Made struct rzv2h_pll_limits more modular also added Ffout limits
> > - Made the alogirithm modular and also added apis based on the
> >   needs for lvds and dpi
>
> Thanks for the update!
>
> > --- a/drivers/clk/renesas/rzv2h-cpg.c
> > +++ b/drivers/clk/renesas/rzv2h-cpg.c
>
> > +static struct rzv2h_pll_dsi_info *rzv2h_get_pll_dsi_info(struct clk_hw=
 *pll_dsi,
> > +                                                        struct rzv2h_c=
pg_priv *priv)
> > +{
> > +       struct pll_clk *pll_clk =3D to_pll(pll_dsi);
> > +
> > +       return &priv->pll_dsi_info[pll_clk->pll.instance];
> > +}
>
> This (very simple helper) is used twice, while there are two (almost
> three) other locations where it is open-coded.  Perhaps just open-code
> it everywhere?
>
Sure, I will open code it.

> > @@ -246,7 +526,8 @@ static const struct clk_ops rzv2h_cpg_pll_ops =3D {
> >  static struct clk * __init
> >  rzv2h_cpg_pll_clk_register(const struct cpg_core_clk *core,
> >                            struct rzv2h_cpg_priv *priv,
> > -                          const struct clk_ops *ops)
> > +                          const struct clk_ops *ops,
> > +                          bool is_plldsi)
>
> No need for this parameter...
>
> >  {
> >         struct device *dev =3D priv->dev;
> >         struct clk_init_data init;
> > @@ -263,6 +544,10 @@ rzv2h_cpg_pll_clk_register(const struct cpg_core_c=
lk *core,
> >         if (!pll_clk)
> >                 return ERR_PTR(-ENOMEM);
> >
> > +       if (is_plldsi)
>
> ... as you can just test "core->type =3D=3D CLK_TYPE_PLLDSI" here.
>
Agreed, thanks for the pointer.

Cheers,
Prabhakar

> > +               priv->pll_dsi_info[core->cfg.pll.instance].pll_dsi_limi=
ts =3D
> > +                       core->cfg.pll.limits;
> > +
> >         parent_name =3D __clk_get_name(parent);
> >         init.name =3D core->name;
> >         init.ops =3D ops;
>
> The rest LGTM, so
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds

