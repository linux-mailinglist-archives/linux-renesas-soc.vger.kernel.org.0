Return-Path: <linux-renesas-soc+bounces-20987-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 938A3B3827D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Aug 2025 14:35:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 502D93AFCFB
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 27 Aug 2025 12:35:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F50031812C;
	Wed, 27 Aug 2025 12:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jIJv1N1Q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF1E3176E8;
	Wed, 27 Aug 2025 12:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756298108; cv=none; b=dhwjVOXcNYkOQZyPjlrLYZBv1BKRlX03S5NYN2JYuT8ZzAkZbHFPV3gOMP7hMgtx2VhS1e24fCpsGnXfmpfgi9xJGvtbC8adHXCyO1b9xlBP7QUsHmFyaxyaq7ymTTXa9BhlhdayWpfBx2swvadKo8gKF2ZrOFGeryHcTOZztRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756298108; c=relaxed/simple;
	bh=I9S8dhFfwhYVV9LJP5nrwF2h1OWEBnaPPUJukMGPR6E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WUmQ6M5z6pBmzPWvV0gM90DcfKoIcvgyE125u5qr6dn+UVutPwWuUzSDI3FTi+ErhKxyWI2LuLYTkghhllzYAItK4DlCB1aM5uEcB2ZcemAHZvu0ckF0umAKhAXzGblqYsIdgrgaa+AayaXbpt007UmG1EXgO/XMRGmjjOPiTvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jIJv1N1Q; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6188b6f7f15so8035811a12.2;
        Wed, 27 Aug 2025 05:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756298104; x=1756902904; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SHFgmAZOGjeLkGcvGE0FBaqwDaI12623dASzVp4BTPM=;
        b=jIJv1N1QEi0qc8bJIGsymQ0YxC5M+38g7W/tkArm8bFQ/+Fwrt8IuLBba+KscvTgkJ
         GE3uFgUXlPSzODQfwG8wH1Tu1AcQ+H3KOeIJPSD5reoaXkfkSKGTgzoUKCtt/Orxk9/i
         A6i6HR85FBKJgFnjRPmeMz8awYvxbHgIIS3XMlzk8MvmoivqhNUkyLWEZY8jbdN1NgCQ
         IDeMdvUco5Z7V5I/3crZDnRo4pVsH63QcrA3ND0ECUuyzNXyn5sBfWv+RiriRyMQ926j
         0oyBUOBXzeWXwFVGNCNoT+K0kQf2XyNiVVudg/+5yuqlfjRUJLcjzRfk9l0JIWjVohAI
         4lKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756298104; x=1756902904;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SHFgmAZOGjeLkGcvGE0FBaqwDaI12623dASzVp4BTPM=;
        b=dCuZ1sqejPymRLoqG8ZhagPdIryERI3amDnCSlzojkYMojfKkspYbM4IjZbk2eCJPJ
         XtCkMrOdIqFcGcBNm3cEItHQ0xk6wxdB9DX0JTLPMAlrancxhzCMoIQf+xv11XXgicgu
         2OnpyIOQ4AnBWME+Yb9UIrVj3LcTEExr4iEmWAx5sZoQtmJY12GYAQCAkNbQv7ksjXZj
         Pa4QvDUnRX6IyWTldVbpjlo3cKq3YMFh3sO0wXW/tga7SxnopfShIHqac0hqfHzS5Qds
         w45z/O8Poj5Hx+1VIdozY5x7iDP3wHlXFO3Da8oYaCWutvzqBrihYo45GZPLn0LsHCYQ
         vsKQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1A0x8bbAxcd/NUmzRhsQncuB10FLZiKNNMBuN/62VfDXkgpk52/dUMcJW8gZB2NO4QggMcxaI/MAoazD24Hcf4gM=@vger.kernel.org, AJvYcCWJMOE8gg27nYuF8i8eUoEgYmb9VM/h1kI79hLGx6FVT1J82TqbX2/zaO4vzIev/U+jjgBT/2XgbUManFTi@vger.kernel.org, AJvYcCXE6k6w4cbU7+Za2wv/h9ssj/Tse39FoLNWPaS6AmIId6aAeOPf73fYHVW6RmsYaQn6cDMo5avPRkJK@vger.kernel.org, AJvYcCXavny0qDw4JUzhrNctYs7T7svK99B+yqk8tXhaApVCFfe8AjBlbgBXrMajG1Q/oJITAQFLod60WqhQ@vger.kernel.org
X-Gm-Message-State: AOJu0YykZu2esd+OfxhPACrR/kLprnZgnlgv5BFF+7PsdYO6rz9sw/2+
	c91ezVmwT20Xyqa40oVbK9AunAzikaDE6csdIANiSwyrAJVdSuzAT98FZ3pOHKzz2vZzf0Gimrx
	8E9WO200IG4VHadRvXOQExQ13m3M945o=
X-Gm-Gg: ASbGnct81sYg8wY+hyt6eHkeawnX/+D0Qsy5dhZuTwKfaxbLU2t/U93TiBFCG+Oxkps
	tXp7z3ipB8UAqBY1ZI+yZbOGlJ/pb+DMAz8yVP5heQzczKnYKKh0Lv+g6rsmKdXIC5WN8LBvsD/
	WcVT+aJEWMU5Ie5EG7FFHsWqbZQbsiRx0lvJ6zZcBKcCD4nKVwNWrjPZTBb89mBxHmaaqRyDDGg
	+nq/lFm
X-Google-Smtp-Source: AGHT+IEW9kDEeEJu5U/vbfc8A6J2wAYUKMjqkVwvtun1hnGaHdKolJO0k+wwdChOzQTBUTNfkT4zcnvbbtaO0USTHmk=
X-Received: by 2002:a05:6402:44d2:b0:615:8db4:2602 with SMTP id
 4fb4d7f45d1cf-61c1b6f3f1fmr13199591a12.22.1756298103678; Wed, 27 Aug 2025
 05:35:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250728201435.3505594-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250728201435.3505594-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <7284cad0-b71b-49dc-bb09-cd9f1ff00028@ideasonboard.com> <TY3PR01MB11346B44AEFCB6B76F00FF160863DA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <e6f4a0dd-deff-408a-a5ff-8fdc74a6fd25@ideasonboard.com>
In-Reply-To: <e6f4a0dd-deff-408a-a5ff-8fdc74a6fd25@ideasonboard.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 27 Aug 2025 13:34:37 +0100
X-Gm-Features: Ac12FXyQcNCKuyLxAqAkoHSfiemZgMTWZD4BEsEV1IyJ4ImKKRnOUvoFIYMABhA
Message-ID: <CA+V-a8udtvk1vWnMZngPLqnD3n3G4ZnG-DxMSqmqXD+Q=Zi4pA@mail.gmail.com>
Subject: Re: [PATCH v7 6/6] drm: renesas: rz-du: mipi_dsi: Add support for
 RZ/V2H(P) SoC
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	"laurent.pinchart" <laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	"magnus.damm" <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tomi,

On Fri, Aug 22, 2025 at 8:05=E2=80=AFAM Tomi Valkeinen
<tomi.valkeinen+renesas@ideasonboard.com> wrote:
>
> Hi,
>
> On 22/08/2025 10:01, Biju Das wrote:
> > Hi Tomi,
> >
> >> -----Original Message-----
> >> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of=
 Tomi Valkeinen
> >> Sent: 21 August 2025 10:29
> >> Subject: Re: [PATCH v7 6/6] drm: renesas: rz-du: mipi_dsi: Add support=
 for RZ/V2H(P) SoC
> >>
> >> Hi,
> >>
> >> On 28/07/2025 23:14, Prabhakar wrote:
> >>> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >>>
> >>> Add DSI support for Renesas RZ/V2H(P) SoC.
> >>
> >> I think a bit longer desc would be in order, as this is not just a "ad=
d a new compatible string" patch,
> >> but we have new registers and functions.
> >>
> >>> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> >>> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> >>> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> >>> ---
> >>> v6->v7:
> >>> - Used the new apis for calculating the PLLDSI
> >>>   parameters in the DSI driver.
> >>>
> >>> v5->v6:
> >>> - Made use of GENMASK() macro for PLLCLKSET0R_PLL_*,
> >>>   PHYTCLKSETR_* and PHYTHSSETR_* macros.
> >>> - Replaced 10000000UL with 10 * MEGA
> >>> - Renamed mode_freq_hz to mode_freq_khz in rzv2h_dsi_mode_calc
> >>> - Replaced `i -=3D 1;` with `i--;`
> >>> - Renamed RZV2H_MIPI_DPHY_FOUT_MIN_IN_MEGA to
> >>>   RZV2H_MIPI_DPHY_FOUT_MIN_IN_MHZ and
> >>>   RZV2H_MIPI_DPHY_FOUT_MAX_IN_MEGA to
> >>>   RZV2H_MIPI_DPHY_FOUT_MAX_IN_MHZ.
> >>>
> >>> v4->v5:
> >>> - No changes
> >>>
> >>> v3->v4
> >>> - In rzv2h_dphy_find_ulpsexit() made the array static const.
> >>>
> >>> v2->v3:
> >>> - Simplifed V2H DSI timings array to save space
> >>> - Switched to use fsleep() instead of udelay()
> >>>
> >>> v1->v2:
> >>> - Dropped unused macros
> >>> - Added missing LPCLK flag to rzv2h info
> >>> ---
> >>>  .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 345 ++++++++++++++++=
++
> >>>  .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  34 ++
> >>>  2 files changed, 379 insertions(+)
> >>>
> >>> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> >>> b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> >>> index 893a90c7a886..3b2f77665309 100644
> >>> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> >>> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> >>> @@ -7,6 +7,7 @@
> >>>
> >>>  #include <linux/bitfield.h>
> >>>  #include <linux/clk.h>
> >>> +#include <linux/clk/renesas-rzv2h-cpg-pll.h>
> >>>  #include <linux/delay.h>
> >>>  #include <linux/dma-mapping.h>
> >>>  #include <linux/io.h>
> >>> @@ -46,6 +47,11 @@ struct rzg2l_mipi_dsi_hw_info {
> >>>                           u64 *hsfreq_millihz);
> >>>     unsigned int (*dphy_mode_clk_check)(struct rzg2l_mipi_dsi *dsi,
> >>>                                         unsigned long mode_freq);
> >>> +   struct {
> >>> +           const struct rzv2h_pll_limits **limits;
> >>> +           const u8 *table;
> >>> +           const u8 table_size;
> >>> +   } cpg_plldsi;
> >>>     u32 phy_reg_offset;
> >>>     u32 link_reg_offset;
> >>>     unsigned long min_dclk;
> >>> @@ -53,6 +59,11 @@ struct rzg2l_mipi_dsi_hw_info {
> >>>     u8 features;
> >>>  };
> >>>
> >>> +struct rzv2h_dsi_mode_calc {
> >>> +   unsigned long mode_freq_khz;
> >>> +   struct rzv2h_pll_pars dsi_parameters; };
> >>> +
> >>>  struct rzg2l_mipi_dsi {
> >>>     struct device *dev;
> >>>     void __iomem *mmio;
> >>> @@ -75,11 +86,22 @@ struct rzg2l_mipi_dsi {
> >>>     unsigned int lanes;
> >>>     unsigned long mode_flags;
> >>>
> >>> +   struct rzv2h_dsi_mode_calc mode_calc;
> >>> +
> >>>     /* DCS buffer pointers when using external memory. */
> >>>     dma_addr_t dcs_buf_phys;
> >>>     u8 *dcs_buf_virt;
> >>>  };
> >>>
> >>> +static const struct rzv2h_pll_limits rzv2h_plldsi_div_limits =3D {
> >>> +   .fout =3D { .min =3D 80 * MEGA, .max =3D 1500 * MEGA },
> >>> +   .fvco =3D { .min =3D 1050 * MEGA, .max =3D 2100 * MEGA },
> >>> +   .m =3D { .min =3D 64, .max =3D 1023 },
> >>> +   .p =3D { .min =3D 1, .max =3D 4 },
> >>> +   .s =3D { .min =3D 0, .max =3D 5 },
> >>> +   .k =3D { .min =3D -32768, .max =3D 32767 }, };
> >>> +
> >>>  static inline struct rzg2l_mipi_dsi *
> >>> bridge_to_rzg2l_mipi_dsi(struct drm_bridge *bridge)  { @@ -194,6
> >>> +216,155 @@ static const struct rzg2l_mipi_dsi_timings rzg2l_mipi_dsi=
_global_timings[] =3D {
> >>>     },
> >>>  };
> >>>
> >>> +struct rzv2h_mipi_dsi_timings {
> >>> +   const u8 *hsfreq;
> >>> +   u8 len;
> >>> +   u8 start_index;
> >>> +};
> >>> +
> >>> +enum {
> >>> +   TCLKPRPRCTL,
> >>> +   TCLKZEROCTL,
> >>> +   TCLKPOSTCTL,
> >>> +   TCLKTRAILCTL,
> >>> +   THSPRPRCTL,
> >>> +   THSZEROCTL,
> >>> +   THSTRAILCTL,
> >>> +   TLPXCTL,
> >>> +   THSEXITCTL,
> >>> +};
> >>> +
> >>> +static const u8 tclkprprctl[] =3D {
> >>> +   15, 26, 37, 47, 58, 69, 79, 90, 101, 111, 122, 133, 143, 150, };
> >>> +
> >>> +static const u8 tclkzeroctl[] =3D {
> >>> +   9, 11, 13, 15, 18, 21, 23, 24, 25, 27, 29, 31, 34, 36, 38,
> >>> +   41, 43, 45, 47, 50, 52, 54, 57, 59, 61, 63, 66, 68, 70, 73,
> >>> +   75, 77, 79, 82, 84, 86, 89, 91, 93, 95, 98, 100, 102, 105,
> >>> +   107, 109, 111, 114, 116, 118, 121, 123, 125, 127, 130, 132,
> >>> +   134, 137, 139, 141, 143, 146, 148, 150, };
> >>> +
> >>> +static const u8 tclkpostctl[] =3D {
> >>> +   8, 21, 34, 48, 61, 74, 88, 101, 114, 128, 141, 150, };
> >>> +
> >>> +static const u8 tclktrailctl[] =3D {
> >>> +   14, 25, 37, 48, 59, 71, 82, 94, 105, 117, 128, 139, 150, };
> >>> +
> >>> +static const u8 thsprprctl[] =3D {
> >>> +   11, 19, 29, 40, 50, 61, 72, 82, 93, 103, 114, 125, 135, 146, 150,=
 };
> >>> +
> >>> +static const u8 thszeroctl[] =3D {
> >>> +   18, 24, 29, 35, 40, 46, 51, 57, 62, 68, 73, 79, 84, 90,
> >>> +   95, 101, 106, 112, 117, 123, 128, 134, 139, 145, 150, };
> >>> +
> >>> +static const u8 thstrailctl[] =3D {
> >>> +   10, 21, 32, 42, 53, 64, 75, 85, 96, 107, 118, 128, 139, 150, };
> >>> +
> >>> +static const u8 tlpxctl[] =3D {
> >>> +   13, 26, 39, 53, 66, 79, 93, 106, 119, 133, 146, 150,
> >>> +};
> >>> +
> >>> +static const u8 thsexitctl[] =3D {
> >>> +   15, 23, 31, 39, 47, 55, 63, 71, 79, 87,
> >>> +   95, 103, 111, 119, 127, 135, 143, 150, };
> >>> +
> >>> +static const struct rzv2h_mipi_dsi_timings rzv2h_dsi_timings_tables[=
] =3D {
> >>> +   [TCLKPRPRCTL] =3D {
> >>> +           .hsfreq =3D tclkprprctl,
> >>> +           .len =3D ARRAY_SIZE(tclkprprctl),
> >>> +           .start_index =3D 0,
> >>> +   },
> >>> +   [TCLKZEROCTL] =3D {
> >>> +           .hsfreq =3D tclkzeroctl,
> >>> +           .len =3D ARRAY_SIZE(tclkzeroctl),
> >>> +           .start_index =3D 2,
> >>> +   },
> >>> +   [TCLKPOSTCTL] =3D {
> >>> +           .hsfreq =3D tclkpostctl,
> >>> +           .len =3D ARRAY_SIZE(tclkpostctl),
> >>> +           .start_index =3D 6,
> >>> +   },
> >>> +   [TCLKTRAILCTL] =3D {
> >>> +           .hsfreq =3D tclktrailctl,
> >>> +           .len =3D ARRAY_SIZE(tclktrailctl),
> >>> +           .start_index =3D 1,
> >>> +   },
> >>> +   [THSPRPRCTL] =3D {
> >>> +           .hsfreq =3D thsprprctl,
> >>> +           .len =3D ARRAY_SIZE(thsprprctl),
> >>> +           .start_index =3D 0,
> >>> +   },
> >>> +   [THSZEROCTL] =3D {
> >>> +           .hsfreq =3D thszeroctl,
> >>> +           .len =3D ARRAY_SIZE(thszeroctl),
> >>> +           .start_index =3D 0,
> >>> +   },
> >>> +   [THSTRAILCTL] =3D {
> >>> +           .hsfreq =3D thstrailctl,
> >>> +           .len =3D ARRAY_SIZE(thstrailctl),
> >>> +           .start_index =3D 3,
> >>> +   },
> >>> +   [TLPXCTL] =3D {
> >>> +           .hsfreq =3D tlpxctl,
> >>> +           .len =3D ARRAY_SIZE(tlpxctl),
> >>> +           .start_index =3D 0,
> >>> +   },
> >>> +   [THSEXITCTL] =3D {
> >>> +           .hsfreq =3D thsexitctl,
> >>> +           .len =3D ARRAY_SIZE(thsexitctl),
> >>> +           .start_index =3D 1,
> >>> +   },
> >>> +};
> >>> +
> >>> +static u16 rzv2h_dphy_find_ulpsexit(unsigned long freq) {
> >>> +   static const unsigned long hsfreq[] =3D {
> >>> +           1953125UL,
> >>> +           3906250UL,
> >>> +           7812500UL,
> >>> +           15625000UL,
> >>> +   };
> >>> +   static const u16 ulpsexit[] =3D {49, 98, 195, 391};
> >>> +   unsigned int i;
> >>> +
> >>> +   for (i =3D 0; i < ARRAY_SIZE(hsfreq); i++) {
> >>> +           if (freq <=3D hsfreq[i])
> >>> +                   break;
> >>> +   }
> >>> +
> >>> +   if (i =3D=3D ARRAY_SIZE(hsfreq))
> >>> +           i--;
> >>> +
> >>> +   return ulpsexit[i];
> >>> +}
> >>> +
> >>> +static u16 rzv2h_dphy_find_timings_val(unsigned long freq, u8 index)
> >>> +{
> >>> +   const struct rzv2h_mipi_dsi_timings *timings;
> >>> +   u16 i;
> >>> +
> >>> +   timings =3D &rzv2h_dsi_timings_tables[index];
> >>> +   for (i =3D 0; i < timings->len; i++) {
> >>> +           unsigned long hsfreq =3D timings->hsfreq[i] * 10 * MEGA;
> >>> +
> >>> +           if (freq <=3D hsfreq)
> >>> +                   break;
> >>> +   }
> >>> +
> >>> +   if (i =3D=3D timings->len)
> >>> +           i--;
> >>> +
> >>> +   return timings->start_index + i;
> >>> +};
> >>
> >> I have to say I really don't like this... In the minimum, the method h=
ow this works has to be explained
> >> in a comment. These values can't really be calculated? If we really ha=
ve to deal with hardcoded values
> >> and with that table from the docs, I would say that just replicate the=
 table in the driver (i.e. a
> >> struct that represents one row of the table), instead of the method in=
 this driver.
> >>
> >> Or was this method added based on earlier feedback, for v3? I see "Sim=
plifed V2H DSI timings array to
> >> save space" in the change log. If so, at least document it clearly.
> >
> > It was added based on v3 based on my comment on v2[1].
> >
> > If you see each table entries it is now just 1 byte vs 10 bytes (u8 vs =
(u64 + u16)).
> >
> > So, it is saving considerable space by using this methos. Maybe we need=
 to document this
> >
> > [1] https://lore.kernel.org/all/TY3PR01MB113462CC30072B670E23EC7F586B12=
@TY3PR01MB11346.jpnprd01.prod.outlook.com/
>
> Ok. I guess it's fine if it's documented. It wasn't super hard to
> reverse engineer it, but a short comment would have saved me the time =3D=
).
>
> But still, where do the numbers come from? Is there a formula that was
> used to generate the values in the doc? Maybe the Renesas HW people
> know? If yes, it'd be much better to use that formula. These are normal
> DSI timings, based on the hs clock, so I think they should be calculable.
>
I did check this internally with the HW team, based on the feedback
the IP vendor which provides the DSI IP does not disclose any formula
so unfortunately we will have to stick with the current lookup table
implementation. I'll add some comments for the lookup table in the
next version.

Cheers,
Prabhakar

