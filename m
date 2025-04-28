Return-Path: <linux-renesas-soc+bounces-16420-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 09223A9F4FB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Apr 2025 17:55:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 53845189F02A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Apr 2025 15:55:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D650427A113;
	Mon, 28 Apr 2025 15:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TcpN7R2w"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7B92566E2;
	Mon, 28 Apr 2025 15:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745855695; cv=none; b=U8VNKM87CB2KAf8xVUJg7O/ugXrVQ6iJEt6sLLDNYr5pjdVvU5e5A9UCC6m3gtHjbcnjTJluhRdQNt6219XBg5TKL1IK26tV2m8uy5WgoG9WPF0hFcfm2FmpWeULjk8UkyDQn3Fs6sKgRFkg0SW42HcWhV3rEFK/uzgBhWwg+Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745855695; c=relaxed/simple;
	bh=T30cwNjEyi+9OgUhLR/przC9ZWD7wLfG/sp5mfOndCs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LLtrXfunBCtJ0tXpE7gYruyC5goFPVh/zYkteKy8wq13Zq5I8K9wrt9WQ7NvsHTK0z++U2y+xEGJs6VEXJurFdyZnYwLHwVUJVG5Is9k78RyKTkw57hZYxmLF8kkokDctVyBLIAAdOnLzJNfLwjQ/6y03iVwhDPCd8y0xY/QKR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TcpN7R2w; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a07a7b4ac7so1271209f8f.2;
        Mon, 28 Apr 2025 08:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745855691; x=1746460491; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k0FRMB/2DQwc8kqqfNvJspFCxHUfwt6gte9tlexlAOo=;
        b=TcpN7R2wsci5AJXMcKKRnPCt26f48QHK1I6XiiKnEp2pAtb1fLQZxURJgU0tBGdej9
         AhDrgsbCMdt5TcF8UZbKA2u9Bw/5OryqKONN6MBH171CYkrF04rWP8yQ3atjKisvRXjO
         Sfg6q0SNLhH82yuQBRuRg2+rJbIw27+nKJQgtkoWqKFM+w1Xo3CCnmsk17Q7OYjQNcvA
         mEFKmF1vJLJCOEJiXI59LSJK394oI/WFdGoJ7HqqWdy0d0Ml+KO5eRlg0klMytywHgrs
         k3abiqOYiZn3YWpOv+oZqXZq1CQA3tmmHq0Ni0nnEnn8M1i7mkbyf1uqBdlN7XahLr7Y
         MceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745855691; x=1746460491;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k0FRMB/2DQwc8kqqfNvJspFCxHUfwt6gte9tlexlAOo=;
        b=Dp73f1bd4sUV8bOzUI8N0s/NiHvXEEoTsAWpDE5IpBBKP2s79GeJFsBq4ybTQiEv9J
         y78CptN6syu8ExTzRF9YY9vm5Zc3m/TFpgQvcm2WMZQxSs/aVs3gq3Plrg+4P4LAvUZH
         IMbDMoEUdNlVS0tpqGRyNGD5uDlY7fx4Z+jYYoH5qRXZSFjjY0s2SZgK1c9SHhpfLBd4
         ucGjAYciaxfCPSC0nbOjj/tFFsLqrkcF2WWW5ygHsEy9ZnaOcyBVJ28QwDt5YUh8J2E7
         fnbmLfnoUKPKwWzllXLW8COy2mXb3TmkNuwJTe8x7bsmDsh+j9asj5YO7GQEmjoUkQ9m
         Ob5A==
X-Forwarded-Encrypted: i=1; AJvYcCU/Hnvzuse7aIobR3E4keizVneB76+sqqDx/Ll9r3RJryqcjfhO/ydWwyvntTTWs8j/iCiMUjZkTzn8@vger.kernel.org, AJvYcCUUP4oNVc5bmMZ14e5Dxb3prB9Tby+kiYCWQFCc5/UuaelFMC8gxzdjXVS8HzBQLWZut3QgsmMW+facOhNPMrdfGFE=@vger.kernel.org, AJvYcCVYOpymSse3wmCjCqSLfukY7tVVqwjDTwaIFwRoaWFDR7MHkZe/ONUN4UcCnZc5ssOpGJbNtKXJNVxu@vger.kernel.org, AJvYcCVsJkx7tiv63RalXGMSzv1ESYIt1aspL8nUX5gavgH+wPHpISqIrsD5TfHvJPCkygebRs0qiWtgN4UVHJ/j@vger.kernel.org
X-Gm-Message-State: AOJu0YyBEzLy6cXUKl2wi/4MWCwa+KbVp1TZmaZJHDUSHP6pmr0qFafE
	q32ZDhdC/H6LMWf5w2x6gWe9uNbufHTW2NhxuhajYVdXoZJ59Dvj9RwSSG7luTDBjUyxKnbLb+C
	t1127d7ofUme5b0Olu6Sa2chMBbg=
X-Gm-Gg: ASbGncsL1O+bSF+0hYnDcdlYtivUS6QilQFZ0ao/5dHMmqYQTiiKlcTbDEB9sKiSqDi
	OONEJYdauxnS22wjNEkbdULnUAS0CTK6L9zVA8pekS9AaPS66NWHwLS8gKFf6WZXSCi6n3s5Jsc
	y1+ZvVpLPzrqTxHqKHEn+jQg==
X-Google-Smtp-Source: AGHT+IFntGK5lSDb8irDCuaYzRBYnVhqMQyX6NyZEOb7L/OBjRhxSN+3ZnBViJ66Z16/9zrd4Y8cNzafDkkcON8ilz4=
X-Received: by 2002:a05:6000:1889:b0:39c:1257:dbaa with SMTP id
 ffacd0b85a97d-3a0894a3da8mr283905f8f.58.1745855691012; Mon, 28 Apr 2025
 08:54:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407165202.197570-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250407165202.197570-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdXtfzp81V4uAk-oULoBz2BtipyPvc9V8oV=kDXmX90GxA@mail.gmail.com>
 <CA+V-a8sMOnKZjNGW2=Y+TcF9itvC4a1LeEQ+eAKvjhWvEL_K+Q@mail.gmail.com> <CAMuHMdXEwbn2i9PJ9qzcFkHxNfaQFQ53SU_rOPJZHZskQvT3xw@mail.gmail.com>
In-Reply-To: <CAMuHMdXEwbn2i9PJ9qzcFkHxNfaQFQ53SU_rOPJZHZskQvT3xw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 28 Apr 2025 16:54:24 +0100
X-Gm-Features: ATxdqUFxNCYBOsoh1ZJ6fagkv9r2rDgfFsZnYAqVunmDATR1S3ML5ON7itzkA1A
Message-ID: <CA+V-a8sp7LsJru-CEgv_Y-o5_SmE1ZKnshvYe6x37=+=y1pzMQ@mail.gmail.com>
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

On Mon, Apr 28, 2025 at 2:36=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, 28 Apr 2025 at 15:22, Lad, Prabhakar <prabhakar.csengg@gmail.com>=
 wrote:
> > On Tue, Apr 15, 2025 at 3:55=E2=80=AFPM Geert Uytterhoeven <geert@linux=
-m68k.org> wrote:
> > > On Mon, 7 Apr 2025 at 18:52, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Add clock and reset entries for GBETH instances. Include core clock=
s for
> > > > PTP, sourced from PLLETH, and add PLLs, dividers, and static mux cl=
ocks
> > > > used as clock sources for the GBETH IP.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.c=
om>
> > > > ---
> > > >  drivers/clk/renesas/r9a09g057-cpg.c | 72 +++++++++++++++++++++++++=
++++
> > > >  drivers/clk/renesas/rzv2h-cpg.h     | 11 +++++
> > > >  2 files changed, 83 insertions(+)
> > > >
> > > > diff --git a/drivers/clk/renesas/r9a09g057-cpg.c b/drivers/clk/rene=
sas/r9a09g057-cpg.c
> > > > index 3c40e36259fe..057bfa0e2a57 100644
> > > > --- a/drivers/clk/renesas/r9a09g057-cpg.c
> > > > +++ b/drivers/clk/renesas/r9a09g057-cpg.c
> > >
> > > > @@ -115,6 +138,17 @@ static const struct cpg_core_clk r9a09g057_cor=
e_clks[] __initconst =3D {
> > > >         DEF_DDIV(".pllvdo_cru2", CLK_PLLVDO_CRU2, CLK_PLLVDO, CDDIV=
4_DIVCTL1, dtable_2_4),
> > > >         DEF_DDIV(".pllvdo_cru3", CLK_PLLVDO_CRU3, CLK_PLLVDO, CDDIV=
4_DIVCTL2, dtable_2_4),
> > > >
> > > > +       DEF_FIXED(".plleth_250_fix", CLK_PLLETH_DIV_250_FIX, CLK_PL=
LETH, 1, 4),
> > > > +       DEF_FIXED(".plleth_125_fix", CLK_PLLETH_DIV_125_FIX, CLK_PL=
LETH_DIV_250_FIX, 1, 2),
> > > > +       DEF_CSDIV(".plleth_gbe0", CLK_CSDIV_PLLETH_GBE0,
> > > > +                 CLK_PLLETH_DIV_250_FIX, CSDIV0_DIVCTL0, dtable_2_=
100),
> > > > +       DEF_CSDIV(".plleth_gbe1", CLK_CSDIV_PLLETH_GBE1,
> > > > +                 CLK_PLLETH_DIV_250_FIX, CSDIV0_DIVCTL1, dtable_2_=
100),
> > > > +       DEF_SMUX(".smux2_gbe0_txclk", CLK_SMUX2_GBE0_TXCLK, SSEL0_S=
ELCTL2, smux2_gbe0_txclk),
> > > > +       DEF_SMUX(".smux2_gbe0_rxclk", CLK_SMUX2_GBE0_RXCLK, SSEL0_S=
ELCTL3, smux2_gbe0_rxclk),
> > > > +       DEF_SMUX(".smux2_gbe1_txclk", CLK_SMUX2_GBE1_TXCLK, SSEL1_S=
ELCTL0, smux2_gbe1_txclk),
> > > > +       DEF_SMUX(".smux2_gbe1_rxclk", CLK_SMUX2_GBE1_RXCLK, SSEL1_S=
ELCTL1, smux2_gbe1_rxclk),
> > > > +
> > > >         DEF_DDIV(".pllgpu_gear", CLK_PLLGPU_GEAR, CLK_PLLGPU, CDDIV=
3_DIVCTL1, dtable_2_64),
> > > >
> > > >         /* Core Clocks */
> > >
> > > > @@ -233,6 +271,38 @@ static const struct rzv2h_mod_clk r9a09g057_mo=
d_clks[] __initconst =3D {
> > > >                                                 BUS_MSTOP(7, BIT(10=
))),
> > > >         DEF_MOD("usb2_0_pclk_usbtst1",          CLK_PLLDTY_ACPU_DIV=
4, 11, 7, 5, 23,
> > > >                                                 BUS_MSTOP(7, BIT(11=
))),
> > > > +       DEF_MOD_EXTERNAL("gbeth_0_clk_tx_i",    CLK_SMUX2_GBE0_TXCL=
K, 11, 8, 5, 24,
> > > > +                                               BUS_MSTOP(8, BIT(5)=
),
> > > > +                                               0x300, 8, 1),
> > >
> > > CPG_SSEL0
> > >
> > > I'm wondering if you really have to store and duplicate this info her=
e.
> > > Can't you infer it from the parent's smux description?
> > >
> > To clarify, you mean to get the parent of the mod clock and then get
> > the clk_mux to get the base?
>
> Indeed.
>
Thank you for the clarification.

Cheers,
Prabhakar

