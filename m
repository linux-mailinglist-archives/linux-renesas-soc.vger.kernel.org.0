Return-Path: <linux-renesas-soc+bounces-18654-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 041F0AE6B4A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jun 2025 17:37:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 196CE1721B9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Jun 2025 15:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98C0A2DA765;
	Tue, 24 Jun 2025 15:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A0sGlx1q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CE82DA75B;
	Tue, 24 Jun 2025 15:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750778495; cv=none; b=qz2RIhxOm5nEAlCUbZQjZQnEZHr2gJbkr/ztJ2q0LMjbr7i1lX2pDpi1+ctx/hab376g2oWrM2OYQAuX6AFNVS9NCesvbs0g7keX6L1YtDrK0MwINzO2+WHJX4EcLeGk1IqN7lRli5RxbxU+gwHyMFE0x4laUziaETq4q6TCpt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750778495; c=relaxed/simple;
	bh=DcRWDJbb+4fUPKC/NFK3xG+5p5igfdc+A7VJxkKgkeE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GjmCnfDl//NSq4aKB7qDh7Gun3IrZ5t8A4tWyEKntnkyAsan42kIRMsSwEVpszAVMKNk1K+6rBdmDFh9t7vDqd1JlI5e5PvO18VaVVWRXi8yuOYRNL2cW/ex0LxerR0f/fB3pAm+vsEFjpjPg2314ZNtKEghJwfVCahw1e3Naxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A0sGlx1q; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-453398e90e9so37823095e9.1;
        Tue, 24 Jun 2025 08:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750778492; x=1751383292; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jMQmruM3IB4kG0gbsMC5BfGaSKgwq+QzSOZlCSJ2EU4=;
        b=A0sGlx1qxR9XMeubyhZ6u1UqtQ0Y4OwnNT2zV92UJ4Boas994MJPucraLb08IPCRcn
         XX0Aeska4yjvQOnoXKLz8r9dPaOK4qiq03fX7mYmLYCmV3eh8iHsbTVsDmHsJKFjmwrz
         ZdBHOYkUXQ9jmLTTNYRtQrT2XBHtx3v3dlKKQ020JYVRmX2KcC/QqmdInVDs9ghIZ2UN
         BbD6y9yELXrpgUXLA5cfeUAVUSiDC4MSo3Co/6iHiqs5HUcv06E9qQyWg2cOqEVtWonr
         yJ8djhLEpXdG+5H6ruOcev4DibAH2GzItpJe4uFPhZMYKiAOA2FqtYxWt0QqkjT3gcUe
         Pvyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750778492; x=1751383292;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jMQmruM3IB4kG0gbsMC5BfGaSKgwq+QzSOZlCSJ2EU4=;
        b=dRD39k7Xbiab353Qj4n7PTb9rLubmsTlfch/TfotFDD/1tA21k3NELhvygA8AUO7C9
         p1t83iOGV5vVPthA3B1uVkvtc3h6w2mvuxJdD+mw/tSlzBtff7MYGJTwPLYUppNSrGet
         5Zh9gpbStumyHeyitjj7OLKi6fUVkjgn68dR8p85hnQSy5uBW9p1PiGSfrtyV+4QtyWZ
         dKEI70MYKvMgVUbljJcyQ6uKzoaUk0+3/ZqTfrFFMLIyW/cs6rPyRg1OEyviIsQR2RTu
         oMZXYuNlrtqi93NmJ9r3A4FIAPozn9wYI9qCuqhQv3cxvgXf5H8uKyhwkJZ5ShKqrDWd
         ZLNA==
X-Forwarded-Encrypted: i=1; AJvYcCU6kYQIojX1kIGOlLOyYWaqMDRKVqoy7CBCg9XzKMGWlssOAzx0ojT+VtUILEDKd10mbX2LWOwf7YTxVTo/@vger.kernel.org, AJvYcCXBmW1ohTwTYw0hw9a0uXybI3YbQ8MtKtHrnVXQexT2O3c0y51maHxVL50HMsviqH91OLEGgcU+6SNE@vger.kernel.org, AJvYcCXvKzdztuCv7zrvpArT+qQAP9U2O0NpIoRNqTq8+fsRsumaLXO103gz8Gzn/XdvbaCrjxq+ed1uNdp10jXDSERc8Kw=@vger.kernel.org, AJvYcCXzCIJeiqjjlC6uk1R3lMJB1k+B5zxa68e5WlxrYKCV6PRxOp4Pi/MHa4kTkqiyTaW+iYbxLL0c0jsg@vger.kernel.org
X-Gm-Message-State: AOJu0YyZA3GyL6G0+9La0fDktnO+z4G9FRUoWQmVaUW0R8dcR8QkzsKO
	rTsB4zLETsinr0YroD+Jen1jcP//L7979EtdL4tUoO4NxjjC0t5PdZsMeFN7wItQEsE51qwdfsm
	As8EonVEmunMQE1fW3qahA1opkKiyIJg=
X-Gm-Gg: ASbGnct4VmtdL0vyRlNuzCoHBYGF89/yvEzS53wh0MNAxlLclFMWQ+QknEVKmB6NMqO
	10xntnBV+OdHB3CLtGC6v56gvdy6u0Ptjb4jPOp7C0lMNysQSXGVwEnq15DPcTYKBQsQ+Wcdl0m
	Uqaa6sTOGZuox3m8o5vlst1YvT7jarYBLIuyNhHhoD+H/8IA==
X-Google-Smtp-Source: AGHT+IG2+Lg1aisOevhHRbc5PY9kM66PyJertGShxjtM2Dy5bu0Y6xACQsLOOlAZtYKJLZtlIxN0gyX5pgYwSJxE7+8=
X-Received: by 2002:a05:600c:1991:b0:444:c28f:e81a with SMTP id
 5b1f17b1804b1-453659f5888mr144680775e9.27.1750778491339; Tue, 24 Jun 2025
 08:21:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250530171841.423274-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250530171841.423274-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <TY3PR01MB1134654039BA3BAB5DA8C0BB08677A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CA+V-a8tSMt9SaHAdeEd4vj=QmaDz5bMd4hwJUCx_mBF8-mw2kw@mail.gmail.com>
 <TY3PR01MB1134671558883AAE2C3E0A2C78672A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <TY3PR01MB1134657A6D7A36FC387938AF7867DA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB1134657A6D7A36FC387938AF7867DA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 24 Jun 2025 16:21:04 +0100
X-Gm-Features: Ac12FXyQhJvTm3Vt5IE8okL9cJwCx1ROPfDGJLKpKmizT9GNro2NPH4XIHLGGPU
Message-ID: <CA+V-a8tUJtABWs5d=9aHJVSY25U5zWt9xE-Ogz5mVYuC8CwVRA@mail.gmail.com>
Subject: Re: [PATCH v6 1/4] clk: renesas: rzv2h-cpg: Add support for DSI clocks
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

On Thu, Jun 19, 2025 at 6:05=E2=80=AFAM Biju Das <biju.das.jz@bp.renesas.co=
m> wrote:
>
> Hi Prabhakar,
>
> > -----Original Message-----
> > From: Biju Das
> > Sent: 18 June 2025 14:26
> > Subject: RE: [PATCH v6 1/4] clk: renesas: rzv2h-cpg: Add support for DS=
I clocks
> >
> > Hi Prabhakar,
> >
> > > -----Original Message-----
> > > From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf O=
f
> > > Lad, Prabhakar
> > > Sent: 16 June 2025 11:45
> > > Subject: Re: [PATCH v6 1/4] clk: renesas: rzv2h-cpg: Add support for
> > > DSI clocks
> > >
> > > Hi Biju,
> > >
> > > Thank you for the review.
> > >
> > > On Fri, Jun 13, 2025 at 6:57=E2=80=AFAM Biju Das <biju.das.jz@bp.rene=
sas.com> wrote:
> > > >
> > > > Hi Prabhakar,
> > > >
> > > > > -----Original Message-----
> > > > > From: Prabhakar <prabhakar.csengg@gmail.com>
> > > > > Sent: 30 May 2025 18:19
> > > > .castro.jz@renesas.com>; Prabhakar Mahadev Lad <prabhakar.mahadev-
> > > > > lad.rj@bp.renesas.com>
> > > > > Subject: [PATCH v6 1/4] clk: renesas: rzv2h-cpg: Add support for
> > > > > DSI clocks
> > > > >
> > > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > >
> > > > > Add support for PLLDSI and PLLDSI divider clocks.
> > > > >
> > > > > Introduce the `renesas-rzv2h-dsi.h` header to centralize and shar=
e
> > > > > PLLDSI-related data structures, limits, and algorithms between th=
e RZ/V2H CPG and DSI drivers.
> > > > >
> > > > > The DSI PLL is functionally similar to the CPG's PLLDSI, but has
> > > > > slightly different parameter limits and omits the programmable
> > > > > divider present in CPG. To ensure precise frequency
> > > > > calculations-especially for milliHz-level accuracy needed by the
> > > > > DSI driver-the shared algorithm
> > > allows both drivers to compute PLL parameters consistently using the =
same logic and input clock.
> > > > >
> > > > > Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > > > > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > > > > Signed-off-by: Lad Prabhakar
> > > > > <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > ---
> > > > > v5->v6:
> > > > > - Renamed CPG_PLL_STBY_SSCGEN_WEN to CPG_PLL_STBY_SSC_EN_WEN
> > > > > - Updated CPG_PLL_CLK1_DIV_K, CPG_PLL_CLK1_DIV_M, and
> > > > >   CPG_PLL_CLK1_DIV_P macros to use GENMASK
> > > > > - Updated req->rate in rzv2h_cpg_plldsi_div_determine_rate()
> > > > > - Dropped the cast in rzv2h_cpg_plldsi_div_set_rate()
> > > > > - Dropped rzv2h_cpg_plldsi_round_rate() and implemented
> > > > >   rzv2h_cpg_plldsi_determine_rate() instead
> > > > > - Made use of FIELD_PREP()
> > > > > - Moved CPG_CSDIV1 macro in patch 2/4
> > > > > - Dropped two_pow_s in rzv2h_dsi_get_pll_parameters_values()
> > > > > - Used mul_u32_u32() while calculating output_m and output_k_rang=
e
> > > > > - Used div_s64() instead of div64_s64() while calculating
> > > > >   pll_k
> > > > > - Used mul_u32_u32() while calculating fvco and fvco checks
> > > > > - Rounded the final output using DIV_U64_ROUND_CLOSEST()
> > > > >
> > > > > v4->v5:
> > > > > - No changes
> > > > >
> > > > > v3->v4:
> > > > > - Corrected parameter name in rzv2h_dsi_get_pll_parameters_values=
()
> > > > >   description freq_millihz
> > > > >
> > > > > v2->v3:
> > > > > - Update the commit message to clarify the purpose of `renesas-rz=
v2h-dsi.h`
> > > > >   header
> > > > > - Used mul_u32_u32() in rzv2h_cpg_plldsi_div_determine_rate()
> > > > > - Replaced *_mhz to *_millihz for clarity
> > > > > - Updated u64->u32 for fvco limits
> > > > > - Initialized the members in declaration order for
> > > > >   RZV2H_CPG_PLL_DSI_LIMITS() macro
> > > > > - Used clk_div_mask() in rzv2h_cpg_plldsi_div_recalc_rate()
> > > > > - Replaced `unsigned long long` with u64
> > > > > - Dropped rzv2h_cpg_plldsi_clk_recalc_rate() and reused
> > > > >   rzv2h_cpg_pll_clk_recalc_rate() instead
> > > > > - In rzv2h_cpg_plldsi_div_set_rate() followed the same style
> > > > >   of RMW-operation as done in the other functions
> > > > > - Renamed rzv2h_cpg_plldsi_set_rate() to rzv2h_cpg_pll_set_rate()
> > > > > - Dropped rzv2h_cpg_plldsi_clk_register() and reused
> > > > >   rzv2h_cpg_pll_clk_register() instead
> > > > > - Added a gaurd in renesas-rzv2h-dsi.h header
> > > > >
> > > > > v1->v2:
> > > > > - No changes
> > > > > ---
> > > > >  drivers/clk/renesas/rzv2h-cpg.c       | 278 ++++++++++++++++++++=
+++++-
> > > > >  drivers/clk/renesas/rzv2h-cpg.h       |  13 ++
> > > > >  include/linux/clk/renesas-rzv2h-dsi.h | 210 +++++++++++++++++++
> > > > >  3 files changed, 492 insertions(+), 9 deletions(-)  create mode
> > > > > 100644 include/linux/clk/renesas- rzv2h-dsi.h
> > > > >
> > > > > diff --git a/drivers/clk/renesas/rzv2h-cpg.c
> > > > > b/drivers/clk/renesas/rzv2h-cpg.c index
> > > > > 761da3bf77ce..d590f9f47371 100644
> > > > > --- a/drivers/clk/renesas/rzv2h-cpg.c
> > > > > +++ b/drivers/clk/renesas/rzv2h-cpg.c
> > > > > @@ -14,9 +14,13 @@
> > > > >  #include <linux/bitfield.h>
> > > > >  #include <linux/clk.h>
> > > > >  #include <linux/clk-provider.h>
> > > > > +#include <linux/clk/renesas-rzv2h-dsi.h>
> > > > >  #include <linux/delay.h>
> > > > >  #include <linux/init.h>
> > > > >  #include <linux/iopoll.h>
> > > > > +#include <linux/math.h>
> > > >
> > > >
> > > >
> > > > > +     req->rate =3D
> > > > > + DIV_ROUND_CLOSEST_ULL(dsi_dividers->freq_millihz,
> > > > > + MILLI);
> > > > > +
> > > > > +     return 0;
> > > > > +};
> > > > > +
> > > > > +static int rzv2h_cpg_plldsi_div_set_rate(struct clk_hw *hw,
> > > > > +                                      unsigned long rate,
> > > > > +                                      unsigned long parent_rate)=
 {
> > > > > +     struct rzv2h_plldsi_div_clk *dsi_div =3D to_plldsi_div_clk(=
hw);
> > > > > +     struct rzv2h_cpg_priv *priv =3D dsi_div->priv;
> > > > > +     struct rzv2h_plldsi_parameters *dsi_dividers =3D &priv->pll=
dsi_div_parameters;
> > > > > +     struct ddiv ddiv =3D dsi_div->ddiv;
> > > > > +     const struct clk_div_table *clkt;
> > > > > +     bool div_found =3D false;
> > > > > +     u32 val, shift, div;
> > > > > +
> > > > > +     div =3D dsi_dividers->csdiv;
> > > > > +     for (clkt =3D dsi_div->dtable; clkt->div; clkt++) {
> > > > > +             if (clkt->div =3D=3D div) {
> > > > > +                     div_found =3D true;
> > > > > +                     break;
> > > > > +             }
> > > > > +     }
> > > > > +
> > > > > +     if (!div_found)
> > > > > +             return -EINVAL;
> > > >
> > > > This check can be done in determine rate and cache the divider??
> > > >
> > > Ok, I'll drop this check as the divider is already cached. The for
> > > loop above is to determine the val which is used below to program the=
 registers.
> >
> > If you are caching actual divider value, then the check is not required=
 here.
> > Otherwise the above code is fine.
> >
> > Assume the csdiv you found, have no corresponding match in the table.
>
>
> 1) By looking at RZ/G3E, can we make this code more scalable?
>
> RZ/G3E has 2 PLL-DSI's
> PLL-DSI1 supports DUAL LVDS, Single LVDS and DSI
> PLL-DSI2 supports single LVDS,  DPI and DSI
>
Sure, I'll make it more scalable.

> In total there will be 4 limit tables (DSI, single LVDS, Dual LVDS and DP=
I)
>
> Based on the display output, each PLL needs to pick the appropriate limit=
 table
> to compute PLL parameters.
>
> 2) Can we drop DSI divider limits from the limit table and use the values=
 from dsi divider table
>    itself which is passed in DEF_PLLDSI_DIV?
>
Sure, I will do that.

Cheers,
Prabhakar

