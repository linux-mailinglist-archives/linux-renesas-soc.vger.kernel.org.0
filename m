Return-Path: <linux-renesas-soc+bounces-17651-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFFAAC6F99
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 May 2025 19:44:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 713A3170CB3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 May 2025 17:44:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C7A528DF48;
	Wed, 28 May 2025 17:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kSp1zPWT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F9121324D;
	Wed, 28 May 2025 17:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748454269; cv=none; b=ZXv6NAu1a7JKIBJ080THgj4Mm41PWmmZ30wnYpkq/Ykz2SB8vrpstbBDIVX1iCrcymxf62MNdbCjDU2kGZlErnbOBM4gezxWV0PWdG8sSmkw5m+v2lxiReuUNMD91GGHPhA6bk24Zvi28Oa8P3Wfwx3qNlBgPQi1I3rDAszRJRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748454269; c=relaxed/simple;
	bh=gUy6NNJmw+kS5vlKntx0l5gO1StE1Ee1SuUfAKAKaZA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rtp6Q9nHp+1RTTjtJ+nyblevofLSOlAejJCxY3NtpLg9DmXVg3y3Men3rhROIScPjVGRVFsUwOWruc/Pg1pieQwwuZswhgPKKWcn4m8zq7sBLPg0l9X+ahqpO8ZMhxn814JOquZEvS/Ro8AS5o8IYH4KXp4RUPbBUYdzc9jIw1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kSp1zPWT; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a4d877dfb3so75018f8f.1;
        Wed, 28 May 2025 10:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748454266; x=1749059066; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iImHkaPCeMoo0L7Q9HhWe7/FK2OKN9y4GidsHlvGedI=;
        b=kSp1zPWTE0zR3ptfBk8zLWPCQST/qk6P2g0FWD6lrPZ/wryNX1VLjzTy4xTofZ94p9
         roZXPKInCtg4oe4mtUokkDqlZ3qqns31hgT9HtdXcuaN+34/cKlGpTqpjBL8yH+69tkv
         0P7kW0rwS1Oatv0PhrsmKgANQX5Ap+whVsWA47nvZSqkH3ht+htudm2ek0+8sToeyKyN
         74gtNhnvqCKFkAoc8Pkt2+eCujqwm4UCvJXSpjsagN98PXF7g7/BZzUizsLZtrY1ySTK
         ZI0hRrSh7cAPfxsxRhE543OVTQJI1Jn2HwmLrIq/sM6sn64/7l3+WXmTgiE26qPqSvTK
         CN4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748454266; x=1749059066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iImHkaPCeMoo0L7Q9HhWe7/FK2OKN9y4GidsHlvGedI=;
        b=MLzpvxNz5CE/6fX+P4xgennosnuXWC5S+44LZxt0eo0taDClfgEsO6+8KBuSPIXxO1
         XTSKm+Nd7TZuNAMmaLipWK1rUEhV8fHkI9uaP4Wq9tFCQ2ajkv9yH7U5x53LObvbshay
         q0ohS/jG6ug+0MoTj17CN1/b59/F3S1RAm2tsAqQj3b8wKQoF4QK6dVROKgSzJo7azyR
         TW3lNvUoMmlOQ78QTYeX4qS5/T7nUCam6P+fIwX+UgafR0aRfh3WIsDfaBQWNQOzP/ej
         ru9hc4gVz1uzuW8Iiq//QWtLa1LbFisuIJagMOmQDUueaY1RCzHv7GPJhC/pCctFmDFY
         6PUA==
X-Forwarded-Encrypted: i=1; AJvYcCV6/iegbYMFByd1I+FHn/HdVG6p9l7HA1NU2Rv+6YrQLC/RjW3QXqW5iuIoF1gnT6PqHJV0m6V0bDQR@vger.kernel.org, AJvYcCWKKLfo+BPHmchCAIiOsowLaQBVoTQcLCj+ry0z2nA0491lruf5B4Yf45O71ahO8xBAQ+sQcZMPzPqmDsx+kd1iWo8=@vger.kernel.org, AJvYcCWg9yNgcO0RvJtJdPCob+kwMjV8BEcfFS3CoAbZrtPQwTW+7uZBoA2expz5ndlenSEVWPAiY+DCWmR7@vger.kernel.org, AJvYcCXWuomflTgDfLY/gRFktGYJlEp9+woW4Hyu/TVcJ/ntzFPq7zuhxSMMAseeB+qXd79q6+Y8147yFpb0s3B3@vger.kernel.org
X-Gm-Message-State: AOJu0YyO8UVRAjMBJ8Pq/2qthxrCxfXjjE7/tXyqOcfm2LvRVAjspIdk
	5wVyDQdvOxbRWhgTTmxVoBp3sTY1BXS2ewtqEn0DpQm4E85sgeUvGHx+NjtB4WkEe3vW/NQJ9SP
	dmfOgFwV8MImEAJSxl9WYBVV8g4YMdpY=
X-Gm-Gg: ASbGncsb/rGe8ZYuLOZ1/Iibkh8A9w1Wgu/o3p1Y/7LH32DPJvL7X3xrhCOaZpNTEd7
	IeLBNpCkD5WgsHXSxGDLmQws6h1cHCIASMb5dPJ7k2roSIpezE1jGSpdpc16dOTyBS7K2ub4Ahk
	zGRtiNGPTGNj+UOG+WFOJvBtEsxvTVTgzaZxAEdchiD+uUgwqiG5RYwNykEsysO5hh/PGFwUdKe
	W/d
X-Google-Smtp-Source: AGHT+IH9504RmRkVsDgrKrAvwoP8w5aV6xAcVxZzAGs088F0fEReN2tW49KZxtVHasfT6GuCbd0iN516mghNhtJnsVI=
X-Received: by 2002:a05:6000:1ac5:b0:3a3:7baf:f06a with SMTP id
 ffacd0b85a97d-3a4cb489b45mr13800385f8f.37.1748454265458; Wed, 28 May 2025
 10:44:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250512184302.241417-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250512184302.241417-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdX5_P4R43HOPuZc3JSAOQ5O2xOBDVhVVg1SxU1ucPdbPA@mail.gmail.com>
 <CA+V-a8sde6Zaz3Z2uDt3OGZ52UBJfR3vQMs4-ZUusDu=oNwFhg@mail.gmail.com> <CAMuHMdXSbEWVpMbDx7UC3Zn3YteZLCdJ=kOOakE38k1TeTxKqA@mail.gmail.com>
In-Reply-To: <CAMuHMdXSbEWVpMbDx7UC3Zn3YteZLCdJ=kOOakE38k1TeTxKqA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 28 May 2025 18:43:59 +0100
X-Gm-Features: AX0GCFvdj3XLPfL3aRRQHdvvebvcoxJnXwBCdUg5vPACSx9PQuJJG2JLXtCzW8c
Message-ID: <CA+V-a8uKzGxbU5A9nRTRL2azykGdhMmawni2ME4T2jqJxBBtew@mail.gmail.com>
Subject: Re: [PATCH v5 4/4] drm: renesas: rz-du: mipi_dsi: Add support for
 RZ/V2H(P) SoC
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

On Wed, May 28, 2025 at 1:32=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Wed, 28 May 2025 at 11:48, Lad, Prabhakar <prabhakar.csengg@gmail.com>=
 wrote:
> > On Fri, May 23, 2025 at 4:19=E2=80=AFPM Geert Uytterhoeven <geert@linux=
-m68k.org> wrote:
> > > On Mon, 12 May 2025 at 20:43, Prabhakar <prabhakar.csengg@gmail.com> =
wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Add DSI support for Renesas RZ/V2H(P) SoC.
> > > >
> > > > Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > > > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.c=
om>
> > >
> > > Thanks for your patch!
> > >
> > > > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > > > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
>
> > > > @@ -47,6 +52,11 @@ struct rzg2l_mipi_dsi_hw_info {
> > > >         u8 features;
> > > >  };
> > > >
> > > > +struct rzv2h_dsi_mode_calc {
> > > > +       unsigned long mode_freq;
> > > > +       u64 mode_freq_hz;
> > >
> > > Interesting... I guess mode_freq is not in Hz?
> > >
> > Actually it is int Hz, I will make it unsigned long.
>
> I really meant the first member.
> As rzv2h_dphy_mode_clk_check() does "mode_freq_hz =3D mode_freq * MILLI",
> mode_freq may be in kHz?
>
Sorry, I got confused. mode_freq is in kHz probably I'll rename this
to make it clear.

> > > > +};
>
> > > > @@ -308,6 +479,158 @@ static int rzg2l_dphy_conf_clks(struct rzg2l_=
mipi_dsi *dsi, unsigned long mode_f
> > > >         return 0;
> > > >  }
> > > >
> > > > +static unsigned int rzv2h_dphy_mode_clk_check(struct rzg2l_mipi_ds=
i *dsi,
> > > > +                                             unsigned long mode_fr=
eq)
> > > > +{
> > > > +       struct rzv2h_plldsi_parameters *dsi_parameters =3D &dsi->ds=
i_parameters;
> > > > +       u64 hsfreq_millihz, mode_freq_hz, mode_freq_millihz;
> > > > +       struct rzv2h_plldsi_parameters cpg_dsi_parameters;
> > > > +       unsigned int bpp, i;
> > > > +
> > > > +       bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
> > > > +
> > > > +       for (i =3D 0; i < 10; i +=3D 1) {
> > > > +               unsigned long hsfreq;
> > > > +               bool parameters_found;
> > > > +
> > > > +               mode_freq_hz =3D mode_freq * MILLI + i;
> > >
> > > KILO?
> > >
> > OK, as mode_freq_hz is in Hz I'll make it unsigned long.
>
> I am not sure if "unsigned long" is OK. Is mode_freq in kHz?
> What is its largest value?
>
Sorry I got confused, I will reinstate mode_freq_hz to be u64. The
largest value can depend on the max resolution by the display.

Cheers,
Prabhakar

