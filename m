Return-Path: <linux-renesas-soc+bounces-18349-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AD984ADADBE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Jun 2025 12:48:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2EB8E3A7A07
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Jun 2025 10:48:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E790277803;
	Mon, 16 Jun 2025 10:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MhF7j1XG"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880B51465A5;
	Mon, 16 Jun 2025 10:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750070913; cv=none; b=XUDy4jjZxfmz4Btf2tm6dADqRHdrJpryHcy+nNL46z5IfHuvd5OKW3urVAR91qNWrh2ve3gS3epDq+/y0WXUIlkSbChYwaAHiv5WjcAJk4S58qN4iJPwo9FsjD3uIMD8sIUJaw5xdjSdShBXiMw0Q0OroQpuRIZRKpfQHYZ8DNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750070913; c=relaxed/simple;
	bh=TN0IXkVrp4lVOuNQ/RGdMfIJZCU7XDadGYk3N5Xjq2o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qmpQwAHQf/bqPZ2mNAUSXWDGRIdE0N+SZdtoKsWskhu5DXl0397zS7FiSogo2NdEylVjtGswUT3A4FEBEurjemBkgEpx7EgPKVvghnR/9RI3+K43uA7DgwAIppg7uDEz2z3YoXr5ZJ6+Fz5IB8BYtePXng7a37YfZSLW5vm/VUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MhF7j1XG; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-451d54214adso33681875e9.3;
        Mon, 16 Jun 2025 03:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750070910; x=1750675710; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w1RZoaBd7s53Gl4EEOyB88bEuvLGxVXm4s1GPYIyQz4=;
        b=MhF7j1XGqKzWLNsA1Q51VylKE3vjp69nfdP+HAqrY2Wy+BrH0CORd2h+Eyjvm2Dj8g
         r84rQOnms6k5D1NTnpimUlX8GOll+WC4JJyBj3CAEAa26gnv200p39XFi8C2j0X6/wGx
         W7lieoukos89OpIsy87feAw4eeP4S2GE2/INPYpUh64PXuEk8riyofX6vC2Ghp8SFWdc
         Bi4Ml2xCrDUCJ6KjHmc7ZZxdPTTib+RtMRghNrlkmaBy4GJ814whaWQYXcTLuvSFSK/4
         ObEO+vuHOQtI2jSRdUVRegFyD3oxFLcwCZ6asXGnCIhQH7QGc7hArTLCJvcWk5dWWcbK
         rxBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750070910; x=1750675710;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w1RZoaBd7s53Gl4EEOyB88bEuvLGxVXm4s1GPYIyQz4=;
        b=CObW3ihylbH0Ys7NbS5woh8nRbXsmrY7tcdkaXvpSFsz3sn+1oSYNIiZ7OAhqpTDvw
         R/iOAoacpmP83kshCiIZcLxEHfTrKj/tM+Yi1q52NHfPA2XZUWGjjCKwHz8K7SgUjJ0D
         wwFo2h/M26oHAbbmyKdjOihLZy4POz3IxR4/GGuk5BmQJhNYqLV9aofCbVweaq9BtMZQ
         xzZad1jiOKr/o3agDVtuAFWVdY7P6HG1oFmbKbxFQXUN5Zqz4+AE6Ihv505votGfyOIX
         p7X01i1D91Y0Ztg73r0baDfdhlts3QaQfe18qT1caJtYzdE6IPjj9zvreDhKH2L0v00J
         HTVA==
X-Forwarded-Encrypted: i=1; AJvYcCU+x5/HVUBEBU6sGttZO+kSTMkcJHLuMxFv/xgInb2KKvK9vcKNEe/Pim4fUZWy5FJTLl5QlgUhuIgN@vger.kernel.org, AJvYcCUVNIyVpaKrC+KZT6oLwmk+Nn8Dwaun/mKOTxPEZWHgiza6XVgDG4OsB1WM4oLaTQSxgT6/dqxz5bGQesOd@vger.kernel.org, AJvYcCWDwPASOw7R8SEfWLouSUwP0e+Ti8devM4TsSfl9x1oM1Z+3e7sKOfkCXuBlSJ+/UOYjDSM726PAZNreFdezGpwpqs=@vger.kernel.org, AJvYcCXiI9mmvQtFtvamTxiJ4ZuAbOmqst4r8U29m55AxzOk/25zqHW8sIreZsCjcq+O1Lp735QloKSTrrax@vger.kernel.org
X-Gm-Message-State: AOJu0YyF0ow/OjQRHjwEKCdXeJKh+QZauTQiDtCmzi240gS9VEe5KUg7
	WF+q7Q8y6ej4Q36Jt60KvoGRrArlP/ADGX42SOGxUjr/MpIljgPxiN71yaQxuFcfZguPblkC1g5
	uN+sqbBoF5Dl1pPb/ySDU/iivqMM2UgI=
X-Gm-Gg: ASbGncuA80GM/U/xa/5vnnN0ufP+7aITjYiP2VJtoBckfHZc2nkcudYmkk8C+ZGQ9yX
	c6MVybSL5XZbT7hFGLw4gzw222XttAgT6ZD0MvUfvRy38EtBChGZ5rZEyw9s6GadvxrLK7Bzkvb
	paTyc6xxooaM0s25n45B1g3ddF3/Pw8uvo+FSyqsizXIZW4FaDgxBT
X-Google-Smtp-Source: AGHT+IHcaplUPGix4GRlSL0W5Y/N0Lt6acvjpm0+HqL8j14FYOo7Lfk9Q2H+n0iMYgc/RHSXREVhO7cCwWXNoFyP7QY=
X-Received: by 2002:a05:600c:4e02:b0:453:c39:d0c2 with SMTP id
 5b1f17b1804b1-4533cab541amr75662465e9.24.1750070909375; Mon, 16 Jun 2025
 03:48:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530171841.423274-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250530171841.423274-5-prabhakar.mahadev-lad.rj@bp.renesas.com> <TY3PR01MB11346A62FDF84C5F2C1240BBF8677A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346A62FDF84C5F2C1240BBF8677A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 16 Jun 2025 11:48:03 +0100
X-Gm-Features: AX0GCFubtUqu3fATVHFAzwxeT_PzWF71UNeBGrXqzwID3Wlx7D2bVaFvFl7UOIk
Message-ID: <CA+V-a8sZfTgOENXfR2NnykgjGHd+2-vS9Jk-dNLWTVQyAGbQTw@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] drm: renesas: rz-du: mipi_dsi: Add support for
 RZ/V2H(P) SoC
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

On Fri, Jun 13, 2025 at 7:17=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> Hi Prabhakar,
>
> > -----Original Message-----
> > From: Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: 30 May 2025 18:19
> > Subject: [PATCH v6 4/4] drm: renesas: rz-du: mipi_dsi: Add support for =
RZ/V2H(P) SoC
> >
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add DSI support for Renesas RZ/V2H(P) SoC.
> >
> > Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v5->v6:
> > - Made use of GENMASK() macro for PLLCLKSET0R_PLL_*,
> >   PHYTCLKSETR_* and PHYTHSSETR_* macros.
> > - Replaced 10000000UL with 10 * MEGA
> > - Renamed mode_freq_hz to mode_freq_khz in rzv2h_dsi_mode_calc
> > - Replaced `i -=3D 1;` with `i--;`
> > - Renamed RZV2H_MIPI_DPHY_FOUT_MIN_IN_MEGA to
> >   RZV2H_MIPI_DPHY_FOUT_MIN_IN_MHZ and
> >   RZV2H_MIPI_DPHY_FOUT_MAX_IN_MEGA to
> >   RZV2H_MIPI_DPHY_FOUT_MAX_IN_MHZ.
> >
> > v4->v5:
> > - No changes
> >
> > v3->v4
> > - In rzv2h_dphy_find_ulpsexit() made the array static const.
> >
> > v2->v3:
> > - Simplifed V2H DSI timings array to save space
> > - Switched to use fsleep() instead of udelay()
> >
> > v1->v2:
> > - Dropped unused macros
> > - Added missing LPCLK flag to rzv2h info
> > ---
> >  .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 345 ++++++++++++++++++
> >  .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  34 ++
> >  2 files changed, 379 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/g=
pu/drm/renesas/rz-
> > du/rzg2l_mipi_dsi.c
> > index a31f9b6aa920..ea554ced6713 100644
> > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > @@ -5,6 +5,7 @@
> >   * Copyright (C) 2022 Renesas Electronics Corporation
> >   */
> >  #include <linux/clk.h>
> > +#include <linux/clk/renesas-rzv2h-dsi.h>
> >  #include <linux/delay.h>
> >  #include <linux/io.h>
> >  #include <linux/iopoll.h>
<snip>
> > +
> > +static int rzv2h_dphy_conf_clks(struct rzg2l_mipi_dsi *dsi, unsigned l=
ong mode_freq,
> > +                             u64 *hsfreq_millihz)
> > +{
> > +     struct rzv2h_plldsi_parameters *dsi_parameters =3D &dsi->dsi_para=
meters;
> > +     unsigned long status;
> > +
> > +     if (dsi->mode_calc.mode_freq_khz !=3D mode_freq) {
> > +             status =3D rzv2h_dphy_mode_clk_check(dsi, mode_freq);
> > +             if (status !=3D MODE_OK) {
> > +                     dev_err(dsi->dev, "No PLL parameters found for mo=
de clk %lu\n",
> > +                             mode_freq);
> > +                     return -EINVAL;
> > +             }
> > +     }
> > +
> > +     clk_set_rate(dsi->vclk, dsi->mode_calc.mode_freq_hz);
>
> Not sure, Can we use the DSI divider required based on the data rate (vcl=
k, bpp and numlanes) here
>
> and then the set parent clk of PLLDSI as well here (dsi->vclk * the divid=
er value) ??
>
> 24MHZ->PLL DSI->DSI DIVIDER->VCLOCK
>
> Maybe then the clock framework has all the information for setting PLL_DS=
I and DSI_DIVIDER clks??
>
Can you please elaborate here with a detailed example.

Cheers,
Prabhakar

