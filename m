Return-Path: <linux-renesas-soc+bounces-22504-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 46194BAFDCD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Oct 2025 11:29:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C40EF1941374
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Oct 2025 09:30:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D99FD2D94B4;
	Wed,  1 Oct 2025 09:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XBwxTJ2D"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52D72D8DBD
	for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Oct 2025 09:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759310975; cv=none; b=ugAtl2F8QsVqbo/xcA6T+HOh9gkWIgHm9YNchfFs/nZbre08Xdf8SMvx7Jhkhuli9+THmI2sTNng791dVVW+OS5OACqgoSwTeJo2CnCSVPK5GszXxHh/wTPhCd/03q03MkK0thNTlOLlpsqnrtSc3MeiR9UtAe/DsUBPmwN4YiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759310975; c=relaxed/simple;
	bh=5JM1eelR1r2YpA1IVQMHYwf6ukkmJ2S/ulu6sMz9+kE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j7EAwxpcvil5f/7Vo1QGzVz/qsQpKaUJC6mF55mUU3ndwicXNWhKV06RfPx8TAycUmffBKq04DbVff3GDiV5kCJx9fVmqOCI3EYGbPYg9YvTkbvBxK8+Wc/FJuTZqeKNd0sa80gVnM2DwwY3Xj1SsNJdnLBiwEI0HAoo8cjG0SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XBwxTJ2D; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-46e33b260b9so24236405e9.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 01 Oct 2025 02:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759310971; x=1759915771; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2WKLYLKrfpejFEaruF+EeGPfFEMHs6sMpTeLbEZAdC4=;
        b=XBwxTJ2DyV0Kosmp8OHdzud2o21b+t9tzV/GtjnPpDOFR5BT7wgwQgNiLg2SLRFc4Y
         z7v+baNWxPGnoRzN5HPqvvUpuW+u/t7kJyMrOYA7HQsZOd2JVBdSEC+9Ci8IbJJTCAlB
         WMo3ojY+mZnnZJ1scBbpbjxaqXrrBXthBICtYBE/lYo4qClOmuAOPfZA/WzxDS1ZqXIA
         XV/QncKK3ftGlQmvtbqN/vZ2AMQfX7cFtHvGPe7z0+fZ5sawlJr0K2R6ASjR2DAPZHbT
         NdK3Y9FhZYdKFuPHbAYSwfgYsJIXi2uvjCCdcwnvGzX1wrzqqxLhBEdOer64PgDN4jpH
         tPbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759310971; x=1759915771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2WKLYLKrfpejFEaruF+EeGPfFEMHs6sMpTeLbEZAdC4=;
        b=J8fRqdC+/yUDYP4PVU4q84m8KwJTPAT0jA2jhRw6EF24xs2Il3/rCQ29qzSjVucwCt
         ixmFivXIYgmJ6yJYFKnKyh7p9HwTBQP5ZpN+RudHiXLfm83BHippp0zPCDVa2tMIwGgw
         TyY6mbeToSYeAF0aHOb+B0zolDx8Rfay52Gus9CXqJUn/QkDiJ6zk7tiYJ2uRuxjXHEL
         OzvCW74d/Vhs2gD5uXtbjQOa3UDuG/E+MZyOVibDLv2DJ/Keh54eIUK+GlRNREqVi08A
         MiHtsIBy80O5wOZf+HqB0MSAr725QH8Ga4TJPi2PuzOGv4O65pdwKZakpkFUIifLG/nx
         yukw==
X-Forwarded-Encrypted: i=1; AJvYcCU8H3G79kazfUiLyBEmj+uyAW0o26gQ9BwbHSIppVSt/Ql47rAH49ehUjlK+wPrlp5skzhKpBwKgGVwGcIZHyCqJw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyANxdwvbWPPyKHAgnX6o2aMUMgCQvyCCmeXaPfGgzeggiRKxZe
	giQPypNY75bsToGItpbg6kKQnZJ1Fn4QUzNCRPJr+8V0gJjcSD3GUSBpJxY5rRLTzo3QaQUdd3B
	6Rvr7mZrAfucFL0doy+/WmHbfkhmFizOgNp63
X-Gm-Gg: ASbGncvE3ZxMh6UuOvQ3puUl6YvvDIhDl10RLUu2xevORBC6+lpq2nAnPStiBWPkb1y
	aiPS9OA0WGfMto73TiaWwuWRvRpEPWZ5EpC7EY/lfb0N4d1nAKXiMQOkIAJFN1752AVvbwniERF
	lHKl3GBaYA+aDwq2SWN5PFnXZ8YH8fFI1yMjhsnR4+FvdJFRHigBG7Ev/QcSwYhYFWCzM14RAZ5
	ehcbqj8jcdlkfxEyYMiL5evlDIxFchA
X-Google-Smtp-Source: AGHT+IFHnGmRHmJr+YpPGsnnoZoqfJyt9jk/+n5kLjP1CHOy6XhDxWRnAYIfrfCsIi4lEcHTSz6IGQr7yPIPxN5B9f4=
X-Received: by 2002:a05:600c:1f96:b0:46e:27f7:80ce with SMTP id
 5b1f17b1804b1-46e612be465mr23677905e9.23.1759310970863; Wed, 01 Oct 2025
 02:29:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250903161718.180488-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250903161718.180488-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdUacF5UfiLTXuWOXAZZvEJ-St5+awkWML_HDp9b38=sXw@mail.gmail.com>
In-Reply-To: <CAMuHMdUacF5UfiLTXuWOXAZZvEJ-St5+awkWML_HDp9b38=sXw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 1 Oct 2025 10:29:03 +0100
X-Gm-Features: AS18NWBlqD2UHra31fOQuHsSKmsMOeniTxCTqefAG_2I-HhVlcZOHoipA4udDNA
Message-ID: <CA+V-a8sr3aMAnf5-RihtCSBFj6f-FYMoM6+NHWrE5A6FVc-zjQ@mail.gmail.com>
Subject: Re: [PATCH v8 2/6] clk: renesas: rzv2h-cpg: Add support for DSI clocks
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
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

On Wed, Sep 24, 2025 at 2:05=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Wed, 3 Sept 2025 at 18:17, Prabhakar <prabhakar.csengg@gmail.com> wrot=
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
> > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> > --- a/drivers/clk/renesas/rzv2h-cpg.c
> > +++ b/drivers/clk/renesas/rzv2h-cpg.c
>
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
> > +};
>
> Unneeded semicolon (there are three more below).
I will fix that.

Cheers,
Prabhakar

