Return-Path: <linux-renesas-soc+bounces-16411-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D90A9F27D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Apr 2025 15:37:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F4D117D29C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Apr 2025 13:37:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 654B026AAA7;
	Mon, 28 Apr 2025 13:36:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB325684;
	Mon, 28 Apr 2025 13:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745847419; cv=none; b=lNxgkgBOVvjthOJF4r+VkU55tpz7W20j3Piq1TftuMp5eLgrJbmAzcot5ssshIdE8s3xmGxewD6epBBMu8xNONuytXpsvs9CDvfnRP/ksB7R/UIWGBBSoFxZMgY/pwpZWpUwxN1Hmu0jotZ9ij//ll4DbQj9E+E/ihR1cf3xlOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745847419; c=relaxed/simple;
	bh=adCeyvaAgehxj9VhO12S+3D+K4WqVyaj6ieHjjeRBpg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o/b1Jdwgyi4C8gW5yqW98xZzmVXI5WlWcxH8pFaTo+/PlbU3mWJ4CTlp4xCmBMJXoEOiRtbH+5yrDtsoh96mb8ScydTPgi4/pn6ovKU+3fgX56wK8BVsJrefivZad0+Zfkqevgs/yrku9rf+d2f9EX0ongzA5r9MOmgUDe1uwHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-524125f6cadso4462785e0c.2;
        Mon, 28 Apr 2025 06:36:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745847414; x=1746452214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7O0qeREWG+3Utjsoi1r+sV3v9UxqFtRcPYwPXx0o8mU=;
        b=q8CmB7+yKivSMQbCIDskFoHIygqzZikkXyZnHVHxLcz5e4EtGdpebeZoB8aqhrbyru
         hd3vCdtP4O2buC4MzSvYTI9+jitQmrVY9dcN26wDcbkpWBGyAJ3ZXhwjLQgp1Crfc2kG
         EORWim5yxf5v2Z+WU5Gw/Bk3ZESaivqVpQ3jGsjDk0OE9LII9WTBfaY+K7oi2HAO68/P
         VTAc6mzhmQmUnqIF4n1JU9setAVHUfiXu6GM0qoatzzUzcQ4H+5Q9KBon6sA4PL7D9/V
         QWVlJB4Zn4/9yixtP3Qrhq6WvgUAMbjur+rjDdB1pJoUJsska348Q9dLEtgbKnavbbF+
         QHnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhayL9FHGAik3BCeNjs0+95abOJgM+4xUZoqgJ7se25uuPhSTtvvB/AnJ4XW57qBrcU0TWfEjB0oHp@vger.kernel.org, AJvYcCW4NPlXUeXhuxkyctgBvqx8boGUKrtxhYnr8v/AIB7AltNtQyxCP7J0za/h9CK8IPLcpyC8Zgezhdt0LUoQdySWUPU=@vger.kernel.org, AJvYcCXtfX3dOxgTUiN0Nrn/ydB6bfeg43+YPqMOwI3qRlu3CJEtUc746sAhnuVZdh1o1Q3EgT34dqg+MNS2@vger.kernel.org, AJvYcCXx3zoQJMUqeu5lL/LoZjREeboVxpZO1VLd1K5p715uh2cvelfnEX7XOdUDixlA1hAj1Tk47+IsIV5G3FsM@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3SU2IWCCz6gCQz0Lj9lXbyuYHpx8Affdg/NIHDaFqmFUipEEp
	Z4ej/9CKHuinuPJBNErgoGjeqbknJfTUIRb+5Dkn0dXuXUL2AL912b9bWUwP
X-Gm-Gg: ASbGncssVejvEfN+/SAs+HAyECT22o1MhiaSYGqRhgTWZmgNlaaDNFpWXriCXtvqjiA
	97Ya2aC8L6Z0F1x3guogdV3kreqf3dynt5iKi31Do8b9uXf9Vib8zp7YdB1Js1ra2FbiFYeVgMD
	BkSCJcHWmHAlIaIC5VHUaEJyvuvXiUVnaYpruHFnqdzxZLtdm6hjATXJT1Nx1YbFnqJCncd4x4k
	xhoFdzEnCjIccegYcYCfvn/c7KfLcFrGdvjLXf1qoG+cfYMSI8N5g4P0T84B3l1KwDs4ohwff7n
	0mjLAJCtExS/OWNhkVFYdHRQj2qTCbsQltwgoCy/7yktXvCoNjZNxAwAN7HsslDzgnR/q+Ae8Dd
	J50CG+dPqa+cFYqDGEQ==
X-Google-Smtp-Source: AGHT+IFzb6Tbo/TwboGcJ45SHDc/U4EU3J6NTxCjw+98rgITkXeyBrY1PFuyxsFrEntt52nqGBrqCw==
X-Received: by 2002:a05:6122:d04:b0:520:61ee:c821 with SMTP id 71dfb90a1353d-52a89d692b9mr7891589e0c.3.1745847414531;
        Mon, 28 Apr 2025 06:36:54 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52a9920ac1fsm916692e0c.4.2025.04.28.06.36.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 06:36:54 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-524168b16d3so4947345e0c.0;
        Mon, 28 Apr 2025 06:36:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUXervT0qwjISHQUcGiUKOLOKTrsxA6NNiGqzY4oaEtD4fc/EJ0ldo3dLCOIRO+PyLGxUwqTda4L9FC3WbnLsrxOX0=@vger.kernel.org, AJvYcCUmXzqb/ciWARBmt+aVuIa756Ic1iPEgTAtsQNbl4vFCKdtBBphZw12iWX5wcvPqBDlt7QCCC14ABbi@vger.kernel.org, AJvYcCVBJh17tt+aGlnqc/xxeLoYUIvVV2r8mg0d927DVWIMHF+GDOky3J9W8a4TjyY/yAI9J9Ccgn54hqwsZzee@vger.kernel.org, AJvYcCXKXSFiv66ZYbMtig1OJiPpCaS7bcGRANSuKAiCRIyXPg31Gn/I/1noiJOVkcEyCLqON2HOWs/HPG17@vger.kernel.org
X-Received: by 2002:a05:6122:218d:b0:52a:79fd:34bd with SMTP id
 71dfb90a1353d-52a89d6ca46mr7884607e0c.4.1745847413664; Mon, 28 Apr 2025
 06:36:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407165202.197570-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250407165202.197570-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdXtfzp81V4uAk-oULoBz2BtipyPvc9V8oV=kDXmX90GxA@mail.gmail.com> <CA+V-a8sMOnKZjNGW2=Y+TcF9itvC4a1LeEQ+eAKvjhWvEL_K+Q@mail.gmail.com>
In-Reply-To: <CA+V-a8sMOnKZjNGW2=Y+TcF9itvC4a1LeEQ+eAKvjhWvEL_K+Q@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Apr 2025 15:36:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXEwbn2i9PJ9qzcFkHxNfaQFQ53SU_rOPJZHZskQvT3xw@mail.gmail.com>
X-Gm-Features: ATxdqUHBJwZf-hQFsvzwVQ4744f393TNHGXqwnBrONR7atyWPSCG0s5drYwtwuE
Message-ID: <CAMuHMdXEwbn2i9PJ9qzcFkHxNfaQFQ53SU_rOPJZHZskQvT3xw@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] clk: renesas: r9a09g057: Add clock and reset
 entries for GBETH0/1
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Mon, 28 Apr 2025 at 15:22, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Tue, Apr 15, 2025 at 3:55=E2=80=AFPM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Mon, 7 Apr 2025 at 18:52, Prabhakar <prabhakar.csengg@gmail.com> wro=
te:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Add clock and reset entries for GBETH instances. Include core clocks =
for
> > > PTP, sourced from PLLETH, and add PLLs, dividers, and static mux cloc=
ks
> > > used as clock sources for the GBETH IP.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> > > ---
> > >  drivers/clk/renesas/r9a09g057-cpg.c | 72 +++++++++++++++++++++++++++=
++
> > >  drivers/clk/renesas/rzv2h-cpg.h     | 11 +++++
> > >  2 files changed, 83 insertions(+)
> > >
> > > diff --git a/drivers/clk/renesas/r9a09g057-cpg.c b/drivers/clk/renesa=
s/r9a09g057-cpg.c
> > > index 3c40e36259fe..057bfa0e2a57 100644
> > > --- a/drivers/clk/renesas/r9a09g057-cpg.c
> > > +++ b/drivers/clk/renesas/r9a09g057-cpg.c
> >
> > > @@ -115,6 +138,17 @@ static const struct cpg_core_clk r9a09g057_core_=
clks[] __initconst =3D {
> > >         DEF_DDIV(".pllvdo_cru2", CLK_PLLVDO_CRU2, CLK_PLLVDO, CDDIV4_=
DIVCTL1, dtable_2_4),
> > >         DEF_DDIV(".pllvdo_cru3", CLK_PLLVDO_CRU3, CLK_PLLVDO, CDDIV4_=
DIVCTL2, dtable_2_4),
> > >
> > > +       DEF_FIXED(".plleth_250_fix", CLK_PLLETH_DIV_250_FIX, CLK_PLLE=
TH, 1, 4),
> > > +       DEF_FIXED(".plleth_125_fix", CLK_PLLETH_DIV_125_FIX, CLK_PLLE=
TH_DIV_250_FIX, 1, 2),
> > > +       DEF_CSDIV(".plleth_gbe0", CLK_CSDIV_PLLETH_GBE0,
> > > +                 CLK_PLLETH_DIV_250_FIX, CSDIV0_DIVCTL0, dtable_2_10=
0),
> > > +       DEF_CSDIV(".plleth_gbe1", CLK_CSDIV_PLLETH_GBE1,
> > > +                 CLK_PLLETH_DIV_250_FIX, CSDIV0_DIVCTL1, dtable_2_10=
0),
> > > +       DEF_SMUX(".smux2_gbe0_txclk", CLK_SMUX2_GBE0_TXCLK, SSEL0_SEL=
CTL2, smux2_gbe0_txclk),
> > > +       DEF_SMUX(".smux2_gbe0_rxclk", CLK_SMUX2_GBE0_RXCLK, SSEL0_SEL=
CTL3, smux2_gbe0_rxclk),
> > > +       DEF_SMUX(".smux2_gbe1_txclk", CLK_SMUX2_GBE1_TXCLK, SSEL1_SEL=
CTL0, smux2_gbe1_txclk),
> > > +       DEF_SMUX(".smux2_gbe1_rxclk", CLK_SMUX2_GBE1_RXCLK, SSEL1_SEL=
CTL1, smux2_gbe1_rxclk),
> > > +
> > >         DEF_DDIV(".pllgpu_gear", CLK_PLLGPU_GEAR, CLK_PLLGPU, CDDIV3_=
DIVCTL1, dtable_2_64),
> > >
> > >         /* Core Clocks */
> >
> > > @@ -233,6 +271,38 @@ static const struct rzv2h_mod_clk r9a09g057_mod_=
clks[] __initconst =3D {
> > >                                                 BUS_MSTOP(7, BIT(10))=
),
> > >         DEF_MOD("usb2_0_pclk_usbtst1",          CLK_PLLDTY_ACPU_DIV4,=
 11, 7, 5, 23,
> > >                                                 BUS_MSTOP(7, BIT(11))=
),
> > > +       DEF_MOD_EXTERNAL("gbeth_0_clk_tx_i",    CLK_SMUX2_GBE0_TXCLK,=
 11, 8, 5, 24,
> > > +                                               BUS_MSTOP(8, BIT(5)),
> > > +                                               0x300, 8, 1),
> >
> > CPG_SSEL0
> >
> > I'm wondering if you really have to store and duplicate this info here.
> > Can't you infer it from the parent's smux description?
> >
> To clarify, you mean to get the parent of the mod clock and then get
> the clk_mux to get the base?

Indeed.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

