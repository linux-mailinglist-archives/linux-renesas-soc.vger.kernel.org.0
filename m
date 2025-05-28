Return-Path: <linux-renesas-soc+bounces-17634-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E520CAC6B79
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 May 2025 16:13:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D1F99E8329
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 May 2025 14:13:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73CB42882A6;
	Wed, 28 May 2025 14:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aj3lQrZm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D58B19B3CB;
	Wed, 28 May 2025 14:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748441613; cv=none; b=JX17+Rrqlg2brq4eqfPXk64dnYxn3IuhHy0ebjP4uHBPbEfSVbo0sKTOaY9r+tkJt4DYFOVZlf4ITMVtND9ioAyi6RM+VBLMk2GltAxczEsr11+OA5ySXniT0nx00PGjQ1wGcacFUc7yklLZ/1f2rQEsbeYRztNw7QWOsGpDGwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748441613; c=relaxed/simple;
	bh=dpXIbCAlYRmIowUQvMgyFGOg+FO7ISbS1+UG1ZIuELM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eh5UOxZqe27YJCyPegZNUsTwHatFrfvrqtooR0b1vJgKVyJf43Gk5kL9/e3d1SoMErsc4UIumnvssfIAEO0VIj2K2hUAeEYsvqTGad8YeXyuNM93FB1lmu3l+v3HgP+jL+WrIaVZJykRL8tYdnWF9tQLHKWqpd5I8rsxCe1r4e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aj3lQrZm; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cfe574976so36299995e9.1;
        Wed, 28 May 2025 07:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748441610; x=1749046410; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u/NvBcF4s3yGqfgtLGu/F6IheBb4FWCw8Mlh0+qa7IM=;
        b=aj3lQrZmOCGZLdTm/WMkY5TkY8J5IBvf2ww++U0GuXzFo+Yy5RHQmk1Bu55dSRRMSc
         cNhLOgofEkW5KqDwlRVZ0lP/jjqaHYxUs6Q/UtguxWHpdIYB0w2Vva3vd4S05AtUuY3M
         oy7oSOqJkKyD43SYTTYFHyJBtKM4HfZIKLqLxKx6LOrTBrLRRmDUsMMfKpx3g5+spxAb
         KhtXTapjS8sD+OuZPwEwcaG73Ew2TvO0WP46COqBug88jqdONMC8ct1iI4Kk1zNRceMc
         WB2IgImBKFCuOpB7Im++v6Itf4Q9ASTRxCNdHdYBgBX96V5ZZGBR5hVpKROxFxPMpWSR
         ECjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748441610; x=1749046410;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u/NvBcF4s3yGqfgtLGu/F6IheBb4FWCw8Mlh0+qa7IM=;
        b=gEzt297PDL/27IqXsRaA6sz8KoktLxt0Kkwk8ny9g3qdGfGsE9iX7hmWhxaXJssJcC
         2P7QAjb751pwpQ0PKX4m7uYq3bI4sDc4wYxUw9nKXHdvP4cw495ftDhdaYlmV09R6nND
         zT4AL0wWmIOG/N/uPxXfZF78UB+IB1ylr4l/chSCskJDfba0iObwBcJ9XxZLgvgbo4HD
         ndmzo0Uq8lbbH68bXHzxdXLB1yGsBtanuzPfoQI9r3hPBHqwats5wGIzF6RKhdC03rnG
         180Q7n8WUjy9xIg3o2dskWxqZokkxovnOHapS0oD7cGWSkVXAZ+8KuQTabSHvgOaAAph
         HEyQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4JThMBpKxFCY4l95uyXad1g0a9t3M68n1LrH83/Ve15FxLX+r+pQ+JgbinDRK9fhPcTaF2m6YRbJb@vger.kernel.org, AJvYcCWaf4Y3qMxt3+KJZ2pGMDLyWKpezByiVoQVb0xUEI+pu9TRPSpMPiIwRU9qmnoH2TEQ8C0/gWF6zOGA+QO1@vger.kernel.org, AJvYcCX/egNEtAVE8lIsvmWEK79WV5q4QQQcl74t+itvqVANEHjuYShvw+O4fr8jZB/qwXsk1uID7Ke5Hi17@vger.kernel.org, AJvYcCXw3LjwQHxzD+fHj0nMHzFUlzPdaWQSWNQWQWpr3DhDVmiFq8NkCGJOWdRIIUgFQIlhqHuBWYM9QPtGlNhyPXG5IRQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVeRkyYpPfptMKT4uas9rcQNq5tC7/gqoskh0P1sX4exiaRA6f
	EtVr2WuTX1ibiCqTccG2TfwYNjLVTEo2R9Y2A19j0PXuL2JNe28UcloJhdrmmaSXUtnvSiC9KAo
	eRQ6kJVNe2h9MWZL77vs6wFqbS9uFxGY=
X-Gm-Gg: ASbGncvwn8k0Qv+K4gDYbghXiRzJ0WQiqDonp05mHk9c5M8uiL30vuoMh0MCTEuZ5xW
	LU+9NQO0+W/ItBdAEhwXrrCrsGyN8eBMPAYWa7ft8EOLEA9YSTVtQE/QsH6s/knRQacqObBW7Jd
	aXy8taws1OisP6f8Vb0MgIcifpPDZ3jYIVtA/HUOh+A2E56bh15tmOBz8gwdy/ljvd+w==
X-Google-Smtp-Source: AGHT+IHkpT2ySjMUdtYwChJ0/5/1rzDmtMoM740OXZxSdgP34XADiDvdJ0+rhe/twNar59adXV7Gqw4wW8anaLlVuPA=
X-Received: by 2002:a05:600c:3b17:b0:43c:f1b8:16ad with SMTP id
 5b1f17b1804b1-450787c9705mr26585325e9.30.1748441609568; Wed, 28 May 2025
 07:13:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250512184302.241417-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250512184302.241417-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdU=iuVFo=VJjV7UM-fLTeZk9TwyOJwojOVOSJiniRneHA@mail.gmail.com>
 <CA+V-a8sOGEEajx9TQsVBb+NeFRUx2eSo81ZdRQMsLzd0Eiox2w@mail.gmail.com> <CAMuHMdXb5ZCX=U_BR0=AkGtdGkVosty0cGsbKQryTy11Au8H-A@mail.gmail.com>
In-Reply-To: <CAMuHMdXb5ZCX=U_BR0=AkGtdGkVosty0cGsbKQryTy11Au8H-A@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 28 May 2025 15:13:02 +0100
X-Gm-Features: AX0GCFv1m8Xej_HgH71EgZ4Kvyv9BeSbuvPePanFkBHFJSxJNoRIerOZEfcK3ek
Message-ID: <CA+V-a8sUyZHGPwUzfUan8tmsF19mB2EPN599Tzu2kaoYxSMaHw@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] clk: renesas: rzv2h-cpg: Add support for DSI clocks
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Magnus Damm <magnus.damm@gmail.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Wed, May 28, 2025 at 8:09=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, 27 May 2025 at 23:51, Lad, Prabhakar <prabhakar.csengg@gmail.com>=
 wrote:
> > On Fri, May 23, 2025 at 3:45=E2=80=AFPM Geert Uytterhoeven <geert@linux=
-m68k.org> wrote:
> > > On Mon, 12 May 2025 at 20:43, Prabhakar <prabhakar.csengg@gmail.com> =
wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Add support for PLLDSI and PLLDSI divider clocks.
> > > >
> > > > Introduce the `renesas-rzv2h-dsi.h` header to centralize and share
> > > > PLLDSI-related data structures, limits, and algorithms between the =
RZ/V2H
> > > > CPG and DSI drivers.
> > > >
> > > > The DSI PLL is functionally similar to the CPG's PLLDSI, but has sl=
ightly
> > > > different parameter limits and omits the programmable divider prese=
nt in
> > > > CPG. To ensure precise frequency calculations-especially for milliH=
z-level
> > > > accuracy needed by the DSI driver-the shared algorithm allows both =
drivers
> > > > to compute PLL parameters consistently using the same logic and inp=
ut
> > > > clock.
> > > >
> > > > Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > > > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.c=
om>
>
> > > > +static int rzv2h_cpg_plldsi_div_determine_rate(struct clk_hw *hw,
> > > > +                                              struct clk_rate_requ=
est *req)
> > > > +{
> > > > +       struct rzv2h_plldsi_div_clk *dsi_div =3D to_plldsi_div_clk(=
hw);
> > > > +       struct rzv2h_cpg_priv *priv =3D dsi_div->priv;
> > > > +       struct rzv2h_plldsi_parameters *dsi_dividers =3D &priv->pll=
dsi_div_parameters;
> > > > +       u64 rate_millihz;
> > > > +
> > > > +       /*
> > > > +        * Adjust the requested clock rate (`req->rate`) to ensure =
it falls within
> > > > +        * the supported range of 5.44 MHz to 187.5 MHz.
> > > > +        */
> > > > +       req->rate =3D clamp(req->rate, 5440000UL, 187500000UL);
> > > > +
> > > > +       rate_millihz =3D mul_u32_u32(req->rate, MILLI);
> > > > +       if (rate_millihz =3D=3D dsi_dividers->error_millihz + dsi_d=
ividers->freq_millihz)
> > > > +               goto exit_determine_rate;
> > > > +
> > > > +       if (!rzv2h_dsi_get_pll_parameters_values(priv->dsi_limits,
> > > > +                                                dsi_dividers, rate=
_millihz)) {
> > > > +               dev_err(priv->dev,
> > > > +                       "failed to determine rate for req->rate: %l=
u\n",
> > > > +                       req->rate);
> > > > +               return -EINVAL;
> > > > +       }
> > > > +
> > > > +exit_determine_rate:
> > > > +       req->best_parent_rate =3D req->rate * dsi_dividers->csdiv;
> > >
> > > Shouldn't this also update req->rate with the actual rate?
> > >
> > >     req->rate =3D DIV_ROUND_CLOSEST_ULL(dsi_dividers->freq_millihz, M=
ILLI);
> > >
> > Agreed, I will update it.
>
> I think not updating req->rate may cause clk_get_rate() to return
> an incorrect value (can error_millihz > 1000?).  Any chance this fix
> can simplify the clock handling in the DSI driver?
>
Yes, error_millihz can be greater than 1000, as result the DSI driver
does check this (>=3D 500) and proceeds to try the next one.

Cheers,
Prabhaar

