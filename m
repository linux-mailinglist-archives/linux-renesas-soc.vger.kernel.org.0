Return-Path: <linux-renesas-soc+bounces-18653-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D903AE6B32
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jun 2025 17:35:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D6A617A598
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jun 2025 15:30:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C40F02E0B6F;
	Tue, 24 Jun 2025 15:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lvRymQg2"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43AA2D2380;
	Tue, 24 Jun 2025 15:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750778194; cv=none; b=FKeB/DHbgmXONbgIuSWjhe6qq0e+G9bsqxtLk6FP7jwAwd3fhHvXKxWNKE6SAd7VhSX/aIz5PwswUJkKeLENtOY9/75HXvzjAj200ikuAGPvmalhd9yQBBdQZ/pIyh77b3/lk9T8XXZpf4YCmrNajRyEN3+TzwjBIfmKbFCdlGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750778194; c=relaxed/simple;
	bh=2HwvlF2LYWERMPVKFChh7P5jnSjjJLwyRgHLxB0Oddc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lazDXaSte+79S9mzl/azeCfnD3hWMQ+Fq++s7fQoSMRJqboYza3YYjKy/e+B15MYVLd+0bBbgpXHkefl2kaurh1FUI2q4pBJAlUrnUwZ+nplSMaMDyVhpqsmIBEcFBSKI/Q8MV3nRkOQinWgKUU8Pr3vq8B/lJQtjJgXpNz2rfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lvRymQg2; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-607cc1a2bd8so8346828a12.2;
        Tue, 24 Jun 2025 08:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750778191; x=1751382991; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xz6lF9XniltLisPEnyJriOyTCQCRxSp9Qc6C+GjVXIs=;
        b=lvRymQg2IpLc5oDCR+GFDazyhzKh7roA5U2NyEBCupXzR64Yl24+L4y1xcMpJ0XB+3
         +/AHa3sh0vR1FlZIcNXF0aC47d8IcqVjEp9VmnYn1Q8+6BC+5R1iSfKmlEeSD7vaGOxN
         EOYZJnPU7BJXoM6oUkmEnc6qh2vANgsewIsNTi5UPumed/IaK01ElSHKELhYnuXaWqDR
         QdRbe57i/sPKHB9HATFAqieIEZCg5eGzPeMePHw8klh+K1wv0mabYOltcMe8+T2J9Bgq
         yc05A7lpR3sgFgHNN5cJXvhTm4nF1muBe/O9YtSY9T28qVv7e0oAIekbOjNJTvaTT4z0
         NmZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750778191; x=1751382991;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xz6lF9XniltLisPEnyJriOyTCQCRxSp9Qc6C+GjVXIs=;
        b=hon+LHMyx1gF6R38An0cNXZkVnPjeMTDL2BB/HLBPhwSjxA3yXPEgWt/5UDutHuBef
         CfiIXHbCvq1lFvOuK9pJN3M29DBmAd9yJPYuyyBYmdPm7KAHWxRSCrqTdOS/HWJeyUoQ
         b8eJDw8D+dRI9Uz84krE6MGEYm0zdGy+zXY04g5/RfMk7IMGnMfbo/VzNZXOAvzZL4FA
         XvNn5jMZrpRtubDY0lPjHB7LwQEOZd4CVfvpsPSrfjqitjdE/FUNqrpkQ0INeEdBdPAb
         0ORQppOzIYiUiVdI2txs5t9qi0oJVtSg99bOqHFLvTRaIhRdCgZOBGYA+veZI2AG0gm+
         M/Rg==
X-Forwarded-Encrypted: i=1; AJvYcCU4JBCtBy+ia4asaEox+cV1/W1ff7XP7QYjb2Sb91TArXzJJLzeUIP4V7l3fAuMEL7PgfvekylVLPHE@vger.kernel.org, AJvYcCW+99RxePhxmhJtxQRj2I+isLAoEnlN9OD5iyRGYQ8vB2xNHm9lpbDI5TSUhV1ydSgQN/mMPHNQvf4bwi2q@vger.kernel.org, AJvYcCW7R5UWnx08WJv0sJOBh7qBqCGzsYcWCxk0pXEiGxpMRKF/k4jmi4Kv2GjiqlD4C0QMVNhX6Kns+NDl@vger.kernel.org, AJvYcCXa+l2yafG6C26OOqxFJOkmhabRFptuK7Q2CU3sMGX60qpQXhEXyzZWotywLfCXpFprNR7CMdccxkd1u0KtrZoQzTE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzyz9Gx/gdFUnpBqIX8dP/3SalytRJEVf5XTHF3GhIQ5qM9BJZK
	g8KyG9dk4S7NsOZYUBc8XB12oENml+fwPWeXVnJD7p9h8jntsoMS0Rty18aPzNXxcW8/NOX1fyi
	CbzNUouE7whA13ADoddPzU7ZiSFwnib0=
X-Gm-Gg: ASbGnctt4g43OoiImEEiBEH/aQjWXhJa/XnKIm+7VOBZGPVYGIV+e2toTw9bZEmUYp8
	aHPEMw3668LErFgPZPX3WVWKhJ0bf4zCvMysn76ibnuQqz006m5cHjclpmlWxfrDCc5nZG6wcwE
	z68nS6rEKQCEkOWW3+tIXqPPdh4Lp0TB743/ICzbGT3j6tjSypJVo3+KUZ
X-Google-Smtp-Source: AGHT+IG+Z5NuC4RG8ReXh+ijI0QVvcrGpC6q73clRUZr6aJi8i6CQO+smzxdbdwirUDg+z0XbAcVWnQEOSlhWZ83ilc=
X-Received: by 2002:a05:6402:1d53:b0:604:5bba:61a0 with SMTP id
 4fb4d7f45d1cf-60a1cf2d130mr14287673a12.23.1750778190705; Tue, 24 Jun 2025
 08:16:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530171841.423274-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250530171841.423274-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB11346A62FDF84C5F2C1240BBF8677A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8sZfTgOENXfR2NnykgjGHd+2-vS9Jk-dNLWTVQyAGbQTw@mail.gmail.com> <TYCPR01MB11332F40696148C7216866D3B8670A@TYCPR01MB11332.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB11332F40696148C7216866D3B8670A@TYCPR01MB11332.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 24 Jun 2025 16:16:03 +0100
X-Gm-Features: AX0GCFtI-IF1eAXq4c-T_qlior0_QFH7KRpC7NQJfzxetksCcBYQKOzsOlDjoug
Message-ID: <CA+V-a8txzBEwSSNEgoPkxBGAoQDrdGFtnYoLo49SqN-aZUUVXw@mail.gmail.com>
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

On Mon, Jun 16, 2025 at 11:54=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.c=
om> wrote:
>
>
>
> > -----Original Message-----
> > From: Lad, Prabhakar <prabhakar.csengg@gmail.com>
> > Sent: Monday, June 16, 2025 11:48 AM
> > To: Biju Das <biju.das.jz@bp.renesas.com>
> > Cc: Geert Uytterhoeven <geert+renesas@glider.be>; Andrzej Hajda
> > <andrzej.hajda@intel.com>; Neil Armstrong <neil.armstrong@linaro.org>;
> > Robert Foss <rfoss@kernel.org>; laurent.pinchart
> > <laurent.pinchart@ideasonboard.com>; Jonas Karlman <jonas@kwiboo.se>;
> > Jernej Skrabec <jernej.skrabec@gmail.com>; Maarten Lankhorst
> > <maarten.lankhorst@linux.intel.com>; Maxime Ripard <mripard@kernel.org>=
;
> > Thomas Zimmermann <tzimmermann@suse.de>; David Airlie <airlied@gmail.co=
m>;
> > Simona Vetter <simona@ffwll.ch>; Rob Herring <robh@kernel.org>; Krzyszt=
of
> > Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>;
> > Michael Turquette <mturquette@baylibre.com>; Stephen Boyd
> > <sboyd@kernel.org>; Magnus Damm <magnus.damm@gmail.com>; dri-
> > devel@lists.freedesktop.org; devicetree@vger.kernel.org; linux-
> > kernel@vger.kernel.org; linux-renesas-soc@vger.kernel.org; linux-
> > clk@vger.kernel.org; Fabrizio Castro <fabrizio.castro.jz@renesas.com>;
> > Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Subject: Re: [PATCH v6 4/4] drm: renesas: rz-du: mipi_dsi: Add support =
for
> > RZ/V2H(P) SoC
> >
> > Hi Biju,
> >
> > Thank you for the review.
> >
> > On Fri, Jun 13, 2025 at 7:17=E2=80=AFAM Biju Das <biju.das.jz@bp.renesa=
s.com>
> > wrote:
> > >
> > > Hi Prabhakar,
> > >
> > > > -----Original Message-----
> > > > From: Prabhakar <prabhakar.csengg@gmail.com>
> > > > Sent: 30 May 2025 18:19
> > > > Subject: [PATCH v6 4/4] drm: renesas: rz-du: mipi_dsi: Add support
> > > > for RZ/V2H(P) SoC
> > > >
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Add DSI support for Renesas RZ/V2H(P) SoC.
> > > >
> > > > Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > > > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > > > Signed-off-by: Lad Prabhakar
> > > > <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > ---
> > > > v5->v6:
> > > > - Made use of GENMASK() macro for PLLCLKSET0R_PLL_*,
> > > >   PHYTCLKSETR_* and PHYTHSSETR_* macros.
> > > > - Replaced 10000000UL with 10 * MEGA
> > > > - Renamed mode_freq_hz to mode_freq_khz in rzv2h_dsi_mode_calc
> > > > - Replaced `i -=3D 1;` with `i--;`
> > > > - Renamed RZV2H_MIPI_DPHY_FOUT_MIN_IN_MEGA to
> > > >   RZV2H_MIPI_DPHY_FOUT_MIN_IN_MHZ and
> > > >   RZV2H_MIPI_DPHY_FOUT_MAX_IN_MEGA to
> > > >   RZV2H_MIPI_DPHY_FOUT_MAX_IN_MHZ.
> > > >
> > > > v4->v5:
> > > > - No changes
> > > >
> > > > v3->v4
> > > > - In rzv2h_dphy_find_ulpsexit() made the array static const.
> > > >
> > > > v2->v3:
> > > > - Simplifed V2H DSI timings array to save space
> > > > - Switched to use fsleep() instead of udelay()
> > > >
> > > > v1->v2:
> > > > - Dropped unused macros
> > > > - Added missing LPCLK flag to rzv2h info
> > > > ---
> > > >  .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 345
> > ++++++++++++++++++
> > > >  .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  34 ++
> > > >  2 files changed, 379 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > > > b/drivers/gpu/drm/renesas/rz- du/rzg2l_mipi_dsi.c index
> > > > a31f9b6aa920..ea554ced6713 100644
> > > > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > > > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > > > @@ -5,6 +5,7 @@
> > > >   * Copyright (C) 2022 Renesas Electronics Corporation
> > > >   */
> > > >  #include <linux/clk.h>
> > > > +#include <linux/clk/renesas-rzv2h-dsi.h>
> > > >  #include <linux/delay.h>
> > > >  #include <linux/io.h>
> > > >  #include <linux/iopoll.h>
> > <snip>
> > > > +
> > > > +static int rzv2h_dphy_conf_clks(struct rzg2l_mipi_dsi *dsi, unsign=
ed
> > long mode_freq,
> > > > +                             u64 *hsfreq_millihz) {
> > > > +     struct rzv2h_plldsi_parameters *dsi_parameters =3D &dsi-
> > >dsi_parameters;
> > > > +     unsigned long status;
> > > > +
> > > > +     if (dsi->mode_calc.mode_freq_khz !=3D mode_freq) {
> > > > +             status =3D rzv2h_dphy_mode_clk_check(dsi, mode_freq);
> > > > +             if (status !=3D MODE_OK) {
> > > > +                     dev_err(dsi->dev, "No PLL parameters found fo=
r
> > mode clk %lu\n",
> > > > +                             mode_freq);
> > > > +                     return -EINVAL;
> > > > +             }
> > > > +     }
> > > > +
> > > > +     clk_set_rate(dsi->vclk, dsi->mode_calc.mode_freq_hz);
> > >
> > > Not sure, Can we use the DSI divider required based on the data rate
> > > (vclk, bpp and numlanes) here
> > >
> > > and then the set parent clk of PLLDSI as well here (dsi->vclk * the
> > divider value) ??
> > >
> > > 24MHZ->PLL DSI->DSI DIVIDER->VCLOCK
> > >
> > > Maybe then the clock framework has all the information for setting
> > PLL_DSI and DSI_DIVIDER clks??
> > >
> > Can you please elaborate here with a detailed example.
>
> There will be determine_clk followed by set_clock for setting new rate fo=
r PLL DSI(dsi->vclk * the divider value)
> For eg:  vclk_max =3D 187.5 MHz, DSI Divider required =3D 16
> Then set PLL_DSI =3D 187.5 * 16 MHz using clk_set.
>
This will trigger the algorithm twice, so I'll go with the current
approach which is optimal.

Cheers,
Prabhakar

