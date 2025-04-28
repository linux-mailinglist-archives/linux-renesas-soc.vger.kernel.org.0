Return-Path: <linux-renesas-soc+bounces-16408-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8BAA9F215
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Apr 2025 15:22:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6BAC416D688
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Apr 2025 13:22:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DE2F25E81D;
	Mon, 28 Apr 2025 13:22:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eAO0C17A"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 429A370810;
	Mon, 28 Apr 2025 13:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745846572; cv=none; b=A2FltpBpTzIUnfPG+Fw9Dvsrr2nHQsEZCN4/d+zj5BAv/9zP3e38eYaSkw1vsfdjdKflNbRaM14hw4rRQRmbdBqViowtRNXcLIrGsJgD3sgEqLurrjI0n/EeWcMBJ+C6hxoyeGuvPfKxAqsH2Xp639Uf505SQJ5IGD3wL1NRvaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745846572; c=relaxed/simple;
	bh=b/sI8ny/1+dJG7v18IC78jCyibWHPy6Xs6Lki9wiTLg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qV8p23RWJ1Gxi7LsYfOyeY3vcIbpxShPk2nJ51AvBxq6nAIPT0p71EBaHxaJlmrUOzcvdnDeou/QVumgWlTEuRoEAinq5D2iq8mHE+UfrvVpvg01MR/pKik53a/lqxzZwcwxkcAYMk9qqhC+sf9FlzhvyXwtMXSFt8gwnFsjItg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eAO0C17A; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-39c266c2dd5so5418505f8f.3;
        Mon, 28 Apr 2025 06:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745846569; x=1746451369; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6uQD3Z3ld0wBx1gp1tlW/rooQP2uSiyFFIJlOXb+tkI=;
        b=eAO0C17AlOTuj3IewN6Bu6oJZW1neN+wmgzpP5eP77u4bi0l7aKf4K//WfoLqkAAYW
         40JKgUui97pVjBDbbRPR6XZhQqwZGhksXbgI+cVWTakexuFRwraB5zJsXM0h4jlKSsl9
         sh/XzKygv1yuffcVE1k/4q9iuI0pgUUY/p3htJ7RY4eXtB8L1VGiHGqFBBbqiK2g1wh8
         6RFacPoOdTEd9N7hadC2H9tveYcumXbkMypCcr4x3SkKEejjW3g3/aae4s5ijeyVGvZB
         /SWnV3XyN6JolcVwnkGzDI7DxenYuiAX6BfKD5cQngUD/taCCmssJSz2Y1tkM1LU1dro
         hwbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745846569; x=1746451369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6uQD3Z3ld0wBx1gp1tlW/rooQP2uSiyFFIJlOXb+tkI=;
        b=hm3tOAuUP003IsbMYAuyeGCpIaRApaJQHkgb7sgLobVwshRhV3nMX5ZclCJ8fIqSGr
         E2stXYNprIbFxwjILxaaj7WYulIrura5EC/TRVobnopGrwg+Fq6dixzkGCb5LG9hV9UI
         xBQAfDcTRWdfzh+mXd//kdJ336BzWf8xFskC90zWNpqp3f2iFApnmEx6Kx0ookloBh96
         gBi7N2Ytuv+9CkvKnAYMLJSw1ctgCVUU8Ue5pFrxcspz0r/EmG5Fn5CoQMhzAnMeYBiq
         RWf6TLofis02oqH5+yzeHFVd9UWb3uThMeuOI77CkrV4qpCwd4BE5Bcjp3NGmVL+vQRQ
         VqJw==
X-Forwarded-Encrypted: i=1; AJvYcCUSQInbRbOtxtjDbMOlAzJ06BgYVkiV7rsw6roKQtcprg8rQGPbmnTve1Ue4U7AR5LtHSpp9ZF2b1HxvFtY@vger.kernel.org, AJvYcCUTK6HPH7uS09bPDDvJQpAapY/LC5xb8T9S9IYKjyGXOGI8fLgmeJx7zuECLoESBKJ1W9u/lWLfriM/SGwdUp2rLaw=@vger.kernel.org, AJvYcCVFAgu72bmKyLKG6uFlkzV8enV3SzBQOWe3hlj6Ya+z/tkbdOJDL5R1TsHAwRKCWcmF6a32HoPh6vRB@vger.kernel.org, AJvYcCX6cInAkaVtzIDCzOAarOeltgjIe1/11Ich3Q+YgW1FdOcUkhn6Ow857fLiOi4A866ANzfltGSKRNxM@vger.kernel.org
X-Gm-Message-State: AOJu0YzTxZ8mf7d0D2p6QeuOwO+m0fGzrBHEkLsyJ7e1c75Z8Z8zxaFT
	Mc9Ij/GZQyQHQCqEzukh3CL6KfYfbfpyldvWv1Np/VRsaoptT8CFOfUSJ5B/InQd+0MimtoZU49
	R6KynI39+da8MB24whhqAxpriXTanGJEn91Y=
X-Gm-Gg: ASbGncsp/z/O/4oAOQLX+C4H0KmfNdc/nRf+h/bvwTgNrqsWyL6MAl/73tO6vduxgnJ
	WhjVxpsigo/p+oR3UULkhOwfgJY/yfZH4yRnmfotBZj6Sdf2VRHKHLoHB8XAKSYpzUoKD/LyFLN
	evNs1hQ+1ajC2LGlv1xCFFs1k=
X-Google-Smtp-Source: AGHT+IECsoGJlitMQgTg9Yd74BH9tfW/LZtEL6LR1B1ajgMHjvjVmPHyMUY+AE/jae62SSGy6KDQJyw9PXs89FygP94=
X-Received: by 2002:a05:6000:1889:b0:390:f358:85db with SMTP id
 ffacd0b85a97d-3a074e4200dmr8006896f8f.30.1745846569222; Mon, 28 Apr 2025
 06:22:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407165202.197570-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250407165202.197570-10-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXtfzp81V4uAk-oULoBz2BtipyPvc9V8oV=kDXmX90GxA@mail.gmail.com>
In-Reply-To: <CAMuHMdXtfzp81V4uAk-oULoBz2BtipyPvc9V8oV=kDXmX90GxA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 28 Apr 2025 14:22:21 +0100
X-Gm-Features: ATxdqUG_Timr8RqYhtsM__Ht9BrCGNqwUpwPEzWj7Hw7UUsVhS2mmze8RoP9oUU
Message-ID: <CA+V-a8sMOnKZjNGW2=Y+TcF9itvC4a1LeEQ+eAKvjhWvEL_K+Q@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] clk: renesas: r9a09g057: Add clock and reset
 entries for GBETH0/1
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Tue, Apr 15, 2025 at 3:55=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, 7 Apr 2025 at 18:52, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add clock and reset entries for GBETH instances. Include core clocks fo=
r
> > PTP, sourced from PLLETH, and add PLLs, dividers, and static mux clocks
> > used as clock sources for the GBETH IP.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  drivers/clk/renesas/r9a09g057-cpg.c | 72 +++++++++++++++++++++++++++++
> >  drivers/clk/renesas/rzv2h-cpg.h     | 11 +++++
> >  2 files changed, 83 insertions(+)
> >
> > diff --git a/drivers/clk/renesas/r9a09g057-cpg.c b/drivers/clk/renesas/=
r9a09g057-cpg.c
> > index 3c40e36259fe..057bfa0e2a57 100644
> > --- a/drivers/clk/renesas/r9a09g057-cpg.c
> > +++ b/drivers/clk/renesas/r9a09g057-cpg.c
>
> > @@ -115,6 +138,17 @@ static const struct cpg_core_clk r9a09g057_core_cl=
ks[] __initconst =3D {
> >         DEF_DDIV(".pllvdo_cru2", CLK_PLLVDO_CRU2, CLK_PLLVDO, CDDIV4_DI=
VCTL1, dtable_2_4),
> >         DEF_DDIV(".pllvdo_cru3", CLK_PLLVDO_CRU3, CLK_PLLVDO, CDDIV4_DI=
VCTL2, dtable_2_4),
> >
> > +       DEF_FIXED(".plleth_250_fix", CLK_PLLETH_DIV_250_FIX, CLK_PLLETH=
, 1, 4),
> > +       DEF_FIXED(".plleth_125_fix", CLK_PLLETH_DIV_125_FIX, CLK_PLLETH=
_DIV_250_FIX, 1, 2),
> > +       DEF_CSDIV(".plleth_gbe0", CLK_CSDIV_PLLETH_GBE0,
> > +                 CLK_PLLETH_DIV_250_FIX, CSDIV0_DIVCTL0, dtable_2_100)=
,
> > +       DEF_CSDIV(".plleth_gbe1", CLK_CSDIV_PLLETH_GBE1,
> > +                 CLK_PLLETH_DIV_250_FIX, CSDIV0_DIVCTL1, dtable_2_100)=
,
> > +       DEF_SMUX(".smux2_gbe0_txclk", CLK_SMUX2_GBE0_TXCLK, SSEL0_SELCT=
L2, smux2_gbe0_txclk),
> > +       DEF_SMUX(".smux2_gbe0_rxclk", CLK_SMUX2_GBE0_RXCLK, SSEL0_SELCT=
L3, smux2_gbe0_rxclk),
> > +       DEF_SMUX(".smux2_gbe1_txclk", CLK_SMUX2_GBE1_TXCLK, SSEL1_SELCT=
L0, smux2_gbe1_txclk),
> > +       DEF_SMUX(".smux2_gbe1_rxclk", CLK_SMUX2_GBE1_RXCLK, SSEL1_SELCT=
L1, smux2_gbe1_rxclk),
> > +
> >         DEF_DDIV(".pllgpu_gear", CLK_PLLGPU_GEAR, CLK_PLLGPU, CDDIV3_DI=
VCTL1, dtable_2_64),
> >
> >         /* Core Clocks */
>
> > @@ -233,6 +271,38 @@ static const struct rzv2h_mod_clk r9a09g057_mod_cl=
ks[] __initconst =3D {
> >                                                 BUS_MSTOP(7, BIT(10))),
> >         DEF_MOD("usb2_0_pclk_usbtst1",          CLK_PLLDTY_ACPU_DIV4, 1=
1, 7, 5, 23,
> >                                                 BUS_MSTOP(7, BIT(11))),
> > +       DEF_MOD_EXTERNAL("gbeth_0_clk_tx_i",    CLK_SMUX2_GBE0_TXCLK, 1=
1, 8, 5, 24,
> > +                                               BUS_MSTOP(8, BIT(5)),
> > +                                               0x300, 8, 1),
>
> CPG_SSEL0
>
> I'm wondering if you really have to store and duplicate this info here.
> Can't you infer it from the parent's smux description?
>
To clarify, you mean to get the parent of the mod clock and then get
the clk_mux to get the base?

Cheers,
Prabhakar

