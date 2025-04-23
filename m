Return-Path: <linux-renesas-soc+bounces-16252-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6C8A988F2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Apr 2025 13:54:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB4CA4444F4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Apr 2025 11:54:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7811E22F17B;
	Wed, 23 Apr 2025 11:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dq+SAIlA"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDCE2701B3;
	Wed, 23 Apr 2025 11:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745409268; cv=none; b=h9zpPBevr2tIdJx5NJSuwEb1dw8mL1jvcOJGZSaRD5deasib9R8eOmRAGx0q3Z5bKqvhrl6PUdyz5qfIE/DXRKPeRscYpH/N8UFaYAEJXFQTV4lFfIjyQXr+3NX4ViF6/gEPF2jBK0+NMf4W9qhj5w7OJqR+2qcvGvt2WlwcGKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745409268; c=relaxed/simple;
	bh=BYpJI7wi0dKwUy+fozNXlNxwk3dd5lqqJ9gdPwIJXJs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iJjEQhyhX4FCXYIaX0XMpogwXhC8FOUws4X3bkXytTWRRbea5Z9AvIFMeJMAEvx35oXl8LVvMR0BXSOTZlOk4KX+SdVsX3oHRQVL9s/wmshlJXksxfQh46Zm4gLcFfrvTGpb3wba8iPwof2mB+jK4tMtJV2+bmjKMHrGSOEhsJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dq+SAIlA; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39ee623fe64so5481763f8f.1;
        Wed, 23 Apr 2025 04:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745409265; x=1746014065; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RXiSx30w1hmWlM/Di4qv5E69sWeA1eC0NCdlxnJgn04=;
        b=dq+SAIlABbg9P+VF828AZ9mGGAUfGPOW/LNDTQb70JjenO8FN8IsbR01tQtHLABQUW
         iRYiKGxgAD9ULZazAG/k1ISK6MbqhKx/aeP7hm2qtrkF4gxMKfrhq3UPfQq+YY0o85cj
         KIdBxqgyI2fnILQ3sakAyLA3GrxuECNth6l8WX9e6LspEn8/ujKUV8zdW5UQOA90W6Xh
         QPObuDRKGJW0oaTvMRI70TrQSuCRQpPYX7MTqkLU1c8Zvut7NtfZ7mA7JMSu6sYpAYVI
         Se6gYhEfwtBf0n1shTi/xbvWET3uDt7Khu/3iHKnXb7kb7+DBEDGOAOC/ukV1uHJG30w
         ywZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745409265; x=1746014065;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RXiSx30w1hmWlM/Di4qv5E69sWeA1eC0NCdlxnJgn04=;
        b=tnPmIFwI8NZnBNSMsI1jiAbP8I2W1U8GYqAtDm1QI/USSL9Da/ttuHagRqBuJQbmjA
         vmIQUrbhph9pvStwn5+t0NQ66dBFLdX6g/DEXRnJSlQkmAbInWLl/tgEFcEHP+9Sdv3c
         ZBKpkPI3YP5Wu3nsWtXXwLl9Jw4bD+11H4PQ0Wjfgco7hmBbMX5H1mg3yd7jWEdGzQyq
         fPCa3hG3x0lG1hSA729bHHJuWtotpnMWJlzY8aboNnD6h2xVpkYmnEEzc+O/vS/Sm1ga
         C4UzHtA926Q4EokBiW4il1gR5hxyDvZT3JU72sgobvpBtcJTSeTbBoFttwTcs6BIjQKN
         skZg==
X-Forwarded-Encrypted: i=1; AJvYcCU3Y9Y4GtAf+QBNtk3WANyzZFcbBApu2yOohOL9HniQZH6ST/eqesXvUXtLnp1bohUI9qXOllD39xk1hDwXrweOZow=@vger.kernel.org, AJvYcCWrehslAPAeaxBxaTJNQTed4lx4WHiLMBHULfGyaUT1ZFT5o+Q9LJr9n9jalCcrKaLTL5IK8c1+un47Y7+a@vger.kernel.org, AJvYcCXOcuoNCo50kTUOnN4zxt5JlNbci+pWfdLqiW1iYjwT6FS+E5sadQldtFYxN7JM4j06BxbSUEIx3QUD@vger.kernel.org, AJvYcCXSE0W0aOj5AtGLoxVIiNzV6ZqbB6WHJdHkj/zqj0ycV90lWBEzTNmPT/FBD1baWSIXtwoMKoT3TZjn@vger.kernel.org
X-Gm-Message-State: AOJu0YyF/LmyoSuxQXu2dBobMzPIC8VX+AkvElFk+oyXtl1tNLLf5CnS
	Kp36haFi0+WTsBaVZwNae4Szu34mRxtmnfyaf1odUUwa4cpkrWGL06SfRcKMfDL8Bus0c+iAl1q
	g7O2H/dkDcrPGteg57ZyQzgysRMw=
X-Gm-Gg: ASbGncvzSEkl9LW67jJHXFCBbNSUW1kFPWNI095xrm5aaYjgG+jxaDbTo8e/jZY3rIt
	U+o7RaxBk054FgpzPnw0riSsPcQcAldUNn3arRe3OQiFTLZZd2vMKrIMPfm/AgnYAt7ATcRQ5+P
	cEbYfITeVAgUzAP3CcoRchl9A1ws5Gp+d7
X-Google-Smtp-Source: AGHT+IFmLMHRjZ1XgjDcqyxjk7BtcPPGf+OCSTtdICXla1NMLROjvh3kKmkIO0184O1OWZlMMASHo5tS0W9iQ2Iv8xM=
X-Received: by 2002:a05:6000:43cc:20b0:39f:fd4:aec7 with SMTP id
 ffacd0b85a97d-39f0fd4aed9mr4142583f8f.7.1745409264608; Wed, 23 Apr 2025
 04:54:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250418184658.456398-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250418184658.456398-11-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWs7R9rtS7Ur6PP9e3m9ghkM1jc_Xn3QOWG4rvTtB2omA@mail.gmail.com>
In-Reply-To: <CAMuHMdWs7R9rtS7Ur6PP9e3m9ghkM1jc_Xn3QOWG4rvTtB2omA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 23 Apr 2025 12:53:58 +0100
X-Gm-Features: ATxdqUE-OgT80-E06tUi_do9bnwXEJELC81J36DTuicZR1BwPkK_CJ9Za-SJxBA
Message-ID: <CA+V-a8tXpWf8-YL-qzWhqc+fDvV4Kzd-6gJqC5HWvE00QsNFAA@mail.gmail.com>
Subject: Re: [PATCH v3 10/15] drm: renesas: rz-du: mipi_dsi: Use mHz for D-PHY
 frequency calculations
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Tue, Apr 22, 2025 at 8:41=E2=80=AFAM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Fri, 18 Apr 2025 at 20:47, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Pass the HSFREQ in milli-Hz to the `dphy_init()` callback to improve
> > precision, especially for the RZ/V2H(P) SoC, where PLL dividers require
> > high accuracy.
> >
> > These changes prepare the driver for upcoming RZ/V2H(P) SoC support.
> >
> > Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v2->v3:
> > - Replaced `unsigned long long` with `u64`
> > - Replaced *_mhz with *_millihz` in functions
>
> Thanks for the update!
>
> > @@ -203,8 +203,9 @@ static u32 rzg2l_mipi_dsi_link_read(struct rzg2l_mi=
pi_dsi *dsi, u32 reg)
> >   */
> >
> >  static int rzg2l_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
> > -                                   unsigned long hsfreq)
> > +                                   u64 hsfreq_millihz)
> >  {
> > +       unsigned long hsfreq =3D DIV_ROUND_CLOSEST_ULL(hsfreq_millihz, =
KILO);
>
> MILLI (everywhere)
>
OK.

> It's a strange world where KILO =3D=3D MILLI ;-)
>
:-)
>     include/linux/units.h:#define KILO      1000UL
>     include/linux/units.h-#define MILLI     1000UL
>
> >         const struct rzg2l_mipi_dsi_timings *dphy_timings;
> >         unsigned int i;
> >         u32 dphyctrl0;
> > @@ -277,6 +278,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi=
_dsi *dsi,
> >                                   const struct drm_display_mode *mode)
> >  {
> >         unsigned long hsfreq, vclk_rate;
> > +       u64 hsfreq_millihz;
> >         unsigned int bpp;
> >         u32 txsetr;
> >         u32 clstptsetr;
> > @@ -305,9 +307,9 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi=
_dsi *dsi,
> >          */
> >         bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
> >         vclk_rate =3D clk_get_rate(dsi->vclk);
> > -       hsfreq =3D DIV_ROUND_CLOSEST_ULL(vclk_rate * bpp, dsi->lanes);
> > +       hsfreq_millihz =3D DIV_ROUND_CLOSEST_ULL(vclk_rate * bpp * KILO=
 * 1ULL, dsi->lanes);
>
> The "* 1ULL" only makes the last factor unsigned long long.
> "vclk_rate * bpp" is still unsigned long, causing overflow on 32-bit.
> As there is no rounding variant of mul_u64_u32_div(), you probably
> want to use mul_u32_u32() instead.
>
Agreed, I will update it to,
`DIV_ROUND_CLOSEST_ULL(mul_u32_u32(vclk_rate, bpp * KILO),
dsi->lanes);`

Cheers,
Prabhakar

