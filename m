Return-Path: <linux-renesas-soc+bounces-16988-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF99AB3CD4
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 17:58:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5021D16D602
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 12 May 2025 15:58:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61C73238C3A;
	Mon, 12 May 2025 15:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d8Ht2h3W"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762F71A08CA;
	Mon, 12 May 2025 15:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747065515; cv=none; b=J2+tKL2cwv9CoLfb4B+kDzjzjcN5IgnmYBL4Ybq7QqLIKdwXnbhI1b2cWmBukBJxKvnN3VDUc59OyE7oMxKkre/PR5wszwZCx6v+kfdufmiD6rCIJM1lElkK6I1XTYUMzmWUIvAoxWAdRAh6VX+Q8SnRHhed5WDYFyZ4KoGW5CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747065515; c=relaxed/simple;
	bh=N3IupITUGFOYIokC/XqIJ6alt8Wbz30JQtkN85VBgo8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oCy3zjkvbh6dtnIaVuPrHny5howQYs8j2PncrJB859W1dlH1SNQU4nZAvSHEqXWPud01UZIKS1242qGFWvPfir5XRQlLF9XFuKrtH0+xBc6Hri0yj1DAuzPuQhxpNAGJn4HPRN+XGE7mlME/SQNA7Iq12tOqb3btl4mYUaggBH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d8Ht2h3W; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-442ea341570so1916445e9.1;
        Mon, 12 May 2025 08:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747065512; x=1747670312; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Tiu7K1d+E3ERrbWyua7cTehS3PZhz9sGhrRK35gQe8=;
        b=d8Ht2h3W97Fpc0bUICrHdDdTJBhG4XjsJfqV8rpXCeh9hF/l8LxosyFRJDwwzyby3m
         /2HBUUVJFdUe2JP0T98DkFJ0HtdWh2hgTZkQUPtwAkpbG+MQUVGyAv5tQIsXm650ZISk
         kjwX6sW2FedVKDYDJn7jdWGTDJrWScrOLkusgaBSEXZhVlGGaIl/ikF/zQtd8zHIu65B
         QhQucamzp+8S/h2ai6BPbojrM4gDpVpjuMxVa+vVQUIBP9km/X7TZuvS0B2oHwYU40MJ
         fzTVzME60A58DLFd6gmxlDVOx+Vnfh9cTT9+uZ1DnBEctF7dEjKNwnn6gB850hAbJ8tV
         Ac9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747065512; x=1747670312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7Tiu7K1d+E3ERrbWyua7cTehS3PZhz9sGhrRK35gQe8=;
        b=uBF818WZivBOh76iElWmSJI6AK2xlBD8We7FeaSUTJkKr4Ka4/etzwuwGChx02/Zw4
         qonk/RF/oz8dBPE0LKvuVXYB2/yMTsGgh9wesvrjPF14rjtrjwq6JVAG1gV05FDgIBQA
         giHq+kqkHxa0JE1H8F1g8C0YbZPBHUJpgnDnhFzMfG3l5Rax2Rvv9g0oPIVdyvm3gcVP
         N73E8IarD5naz2NtF+JHJv7rmrEwEB+QV3j2OsxLQ6kF6pKWOR11gNC0SfxpXHYaD5wn
         vpPkjnkN64BqlFmJgeLLym4/deFDt93nbkCNdAhWDClBLFwdcuJ2qINaZoahSx0Jifwr
         MPLg==
X-Forwarded-Encrypted: i=1; AJvYcCVF1nG+SUH0xgUtkroqdTUoSNrd1NyNQTaVSGfwZMzd9F2rmDvEQr+QDgWAZXfuU/OLGca7mGAbUmR4FWOx@vger.kernel.org, AJvYcCVtRsUalB2m5gB9q69Gf9H74Q9I4zLebITNRbuXU/gcLNzhQXzDlUZ9TRo7yvfBhw5yvuqUcBk7ldPV@vger.kernel.org, AJvYcCWpVS6WiQ2pWdBjy202oibAGtYKhHlLzz7Tj4Pb3kwVXCwRj25hMHb7DPALItxWmz1TXCSW2v7vQAPWoJFX9g/OlWg=@vger.kernel.org, AJvYcCXyN5TDNlOpumAoEm61BGr1ycB8C5xlH16bz5sK/HGBjUJKnSWn41m31TP06Wpdb0JxgGGCP7yTAHK2@vger.kernel.org
X-Gm-Message-State: AOJu0YwGxBZ+aY8+uay2Giyt/t6y179cR0eWrjif9b3tB1zvuF76WZja
	vl/XbVOh4zFSpp0so9Zj4IWRM1au4n9LZwupv/ipjvYSG5slE++BuAAPcfg507mByiBULl0L+ul
	sReEKQ9QWUfFCuYBKy0YtfjzGE7I=
X-Gm-Gg: ASbGncuYFn+vCwhygfhYt9WBgYXtgwCna4pn9Q6JJkAGjeTGwZkfVyIcElkPaMwIW0Z
	WPL5XPZD5lNreZIi451og1V3ovGEGxrhvD/ueFI9mYnyQUKExKSkdZWUP4nZfNYF6dNAGAmq2fK
	6C0yvX73nphnGbyBFX9H7Idlxq3sdvJkd32cm6G7sVuQ==
X-Google-Smtp-Source: AGHT+IFXbahmg2a+BTqiLfTc49OhOevVl2AgJz/PIJpOPa+2/Fc+7yusnDFsUzxWbWrLCDk5Ky9+6rU51Zl0bh1I2Eo=
X-Received: by 2002:a05:600c:1c8c:b0:442:dc6f:2f11 with SMTP id
 5b1f17b1804b1-442de4a8ca9mr58212345e9.25.1747065511651; Mon, 12 May 2025
 08:58:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430204112.342123-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250430204112.342123-15-prabhakar.mahadev-lad.rj@bp.renesas.com> <TY3PR01MB113467D1EFC9C66CD94D216F3868F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB113467D1EFC9C66CD94D216F3868F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 12 May 2025 16:58:05 +0100
X-Gm-Features: AX0GCFuR8rcyABea0qPHxH1BuKL66czaA5OEAqMZRwiSFyesM0ZStKGzdKFxm4Y
Message-ID: <CA+V-a8vz-7o96s0ok2ap+Kg2=BKMv8O8Zk667bYi+0Cu8F399Q@mail.gmail.com>
Subject: Re: [PATCH v4 14/15] drm: renesas: rz-du: mipi_dsi: Add support for
 LPCLK handling
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, "laurent.pinchart" <laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
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

On Sun, May 4, 2025 at 2:00=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.com=
> wrote:
>
> Hi Prabhakar,
>
> Thanks for the patch.
>
> > -----Original Message-----
> > From: Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: 30 April 2025 21:41
> > Subject: [PATCH v4 14/15] drm: renesas: rz-du: mipi_dsi: Add support fo=
r LPCLK handling
> >
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Introduce the `RZ_MIPI_DSI_FEATURE_LPCLK` feature flag in `rzg2l_mipi_d=
si_hw_info` to indicate the
> > need for LPCLK configuration.
> >
> > On the RZ/V2H(P) SoC, the LPCLK clock rate influences the required DPHY=
 register configuration,
> > whereas on the RZ/G2L SoC, this clock is not present. To accommodate th=
is difference, add an `lpclk`
> > clock handle in `rzg2l_mipi_dsi` and update the probe function to condi=
tionally acquire LPCLK if the
> > SoC supports it.
> >
> > Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v3->v4
> > - No changes
> >
> > v2->v3:
> > - No changes
> >
> > v1->v2:
> > - Added LPCLK as feature flag
> > ---
> >  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/g=
pu/drm/renesas/rz-
> > du/rzg2l_mipi_dsi.c
> > index df43ff59e08e..22a386ca8ae3 100644
> > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > @@ -30,6 +30,7 @@
> >
> >  #define RZ_MIPI_DSI_FEATURE_DPHY_RST BIT(0)
> >  #define RZ_MIPI_DSI_FEATURE_16BPP    BIT(1)
> > +#define RZ_MIPI_DSI_FEATURE_LPCLK    BIT(2)
> >
> >  struct rzg2l_mipi_dsi;
> >
> > @@ -63,6 +64,7 @@ struct rzg2l_mipi_dsi {
> >       struct drm_bridge *next_bridge;
> >
> >       struct clk *vclk;
> > +     struct clk *lpclk;
> >
> >       enum mipi_dsi_pixel_format format;
> >       unsigned int num_data_lanes;
> > @@ -788,6 +790,12 @@ static int rzg2l_mipi_dsi_probe(struct platform_de=
vice *pdev)
> >       if (IS_ERR(dsi->vclk))
> >               return PTR_ERR(dsi->vclk);
> >
> > +     if (dsi->info->features & RZ_MIPI_DSI_FEATURE_LPCLK) {
> > +             dsi->lpclk =3D devm_clk_get(dsi->dev, "lpclk");
> > +             if (IS_ERR(dsi->lpclk))
> > +                     return PTR_ERR(dsi->lpclk);
> > +     }
> > +
>
> Can we use devm_clk_get_optional() and get rid of this Feature bit check
> as DT binding check validates for a particular SoC this clk is required o=
r not?
> Otherwise, there is no usage for optional API's?
>
OK, I'll switch to devm_clk_get_optional().

Cheers,
Prabhakar

