Return-Path: <linux-renesas-soc+bounces-18352-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AF8ADAE37
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Jun 2025 13:21:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C4671703E9
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Jun 2025 11:21:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E2762D541F;
	Mon, 16 Jun 2025 11:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T/t603yT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E75E2D0283;
	Mon, 16 Jun 2025 11:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750072883; cv=none; b=s3Py/bkJLQZBw3z20+wQuZeGglzfxNwppkcxICWD8IcV1cEmKOX3rnp9cPEeOwA1FforPE/JC5+uBn1ZpSlEpOHWosfp4v/YFk3HMLT3HHsm5bJJiKoOf9rncFD4S4Qktwu5GysHx3iNVgtSbxQ6Hihii8o6rRv7FiDTt75j8aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750072883; c=relaxed/simple;
	bh=1dSXR/UyoNR9Nrxz61oGFFAxMFZZaFzRmt7p4pCLMG4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nx93p3RjZ1rE3sQVEsUYXHaxD15UlXCXggk1Qhob5t7CFG4fmHdXuBglRj+0OeZbc7weNDFiUK9SZxLxYlHBucEYxb59LaSp3XThQMDcehuefJ9Ej2gyROimlgjwQ275TV4cyPI4Geiw59Mz3mycOXYtbhfIdPWbEzBSKEqPlX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T/t603yT; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-450cfb6a794so25145985e9.1;
        Mon, 16 Jun 2025 04:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750072880; x=1750677680; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HH/XG6DTsco8TheFYVMqA8WWvPjyKgOz5uHAKCaL2jQ=;
        b=T/t603yTQrxVwdlZimtwaoUvC1kBKqNNvqaX7fTwA00Rtxnxj2OcjDWJJ/3Ob2/g5V
         ehawDlg9rZB7WYPnQsDvCim1AvPEj8EJSy6v8RQCmJsXlglpfZFhsFcoYCQWyfIKeZml
         +kVV7LKux+MT3ZXHiQZwwh3AEYJRjviTuLVyQqiE5hAsEBGPrxBpK5V4WMR0/9LcmmBP
         6L9h05Vf+wrCg/59TSre+6SJVAl5/2sYQcsX/Ks+YxDJIFXk6sVRsvwl3Tc+gvTKFgC2
         xMsk8MW3kL4NOaNetXtfxi8SluwBk+8BIox1qpzOIfGRzJT3dQ8qXttAYYmKEZ0B/SeS
         NebQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750072880; x=1750677680;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HH/XG6DTsco8TheFYVMqA8WWvPjyKgOz5uHAKCaL2jQ=;
        b=riUlVqDstjLSuycfbl7geMS8EnilpfDO3+aYc10BAU5Tg+4fTCjsFikLy/04+dKeYy
         jeg1qsm3tOLabYd9uobOaPNyp4c6f1ZneBlZeUU/f7S8ftNfnODlkhPGGzClBbafYAPx
         gUX7B/Cygdwip3//aII4usgYk7f3tThrtrMbvWI20SSShTulyrsHbORV41rk6er+gr4b
         Y3y286J+N19N7pWoDDH3c30Vs9QnQJ0lxCuHdWYeFUl9l5Ts7ToBQY5r96yNXL8j/TFI
         N82YByoS5hxKBh2Bx5+JK++DOaSG8L5EmtbcerZ7gFQicyFmsGb4QhI+StPQydMxSHKN
         qtXQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9lcUjNB3jo+LQLoww7i5+ttnlMcJQZ6703AMsvyId1zr3AFx7qPpWsICl2FDDW6LZKfIExi+T7/AhFX9GFvlJwCw=@vger.kernel.org, AJvYcCULw6B1bJzzU7HyZcNNu6JMQgP59g4VGc97XOC8mXIrtQqmrXU7UyqHYGyh7s0iIQPMF2HXo1lWs9T6WjPM@vger.kernel.org, AJvYcCURBfisnMomi9ApvmF3JXq+Bhgs9+EKvQi+JrLwtRmt0OaFeBQuAjuxQro7NzlpWn74ey15hlTdC+4I@vger.kernel.org, AJvYcCXsZcPuTS/IyanZNaO5yKGiWjxkYUQ6++U0dT8VN8Odg8yfRKA/v47OkiMn/NL1CFELXAEGGKgADeiT@vger.kernel.org
X-Gm-Message-State: AOJu0YxHK0fkdgpQk7Pe2e1esP1ejWf1pfMKAVGFaL3/+x9jlievvZrj
	g7XPMqgXIFFDqyZbtYgo7iJEfsYe9D4lNbiWA2SkERK7RMmg+osbv5JRHnN1sZlHVkqsb+x4UCv
	PptmzL4xWICULxJXkYJ4VtMkltsfJOSo=
X-Gm-Gg: ASbGncu2+FWoBoIOlt6iz7RkOGL0wwGTyvV4WHZ+9UUBeU5OjgQgzppX5Hn26dmEPcZ
	MOx3+YUcbkeMeTdFAZkGJLQuiPJCfeH6Ndem2DfE1EkHxZKx2kwKw1dHSeulBPZXsfZ3CUHFSqF
	gembjk2ZQfe9xWIsXR6kEOSsr06lk/cP6OBDQxsfunzA==
X-Google-Smtp-Source: AGHT+IFQFbpkJW8fhrHvXulTMgusuzcINLRFAAfYmf5HJpOcM0iLUansHMeU1JtnA7xzSFm6QhKrX41V1m0Oq6cxIQk=
X-Received: by 2002:a05:600c:1c0a:b0:451:e394:8920 with SMTP id
 5b1f17b1804b1-4533cab8564mr76816335e9.27.1750072879570; Mon, 16 Jun 2025
 04:21:19 -0700 (PDT)
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
Date: Mon, 16 Jun 2025 12:20:53 +0100
X-Gm-Features: AX0GCFtgrcxJq-tg2C4PkYvICy9lU_woFiUNZXsfPzvEdHMwe4O6KkHnXumJ2Xc
Message-ID: <CA+V-a8tKm4yjEG_ZbajXcgTdOB=GxqA=kt63svJ4ZF609tXHDA@mail.gmail.com>
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
You mean to use `clk_set_rate(dsi->vclk, (clk_get_rate(dsi->vclk) *
dsi_divider));` ?

Cheers,
Prabhakar

