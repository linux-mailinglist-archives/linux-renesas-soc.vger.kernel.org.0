Return-Path: <linux-renesas-soc+bounces-21209-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B1FB40880
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 17:06:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BF3FB48115C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Sep 2025 15:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C6FF314B6C;
	Tue,  2 Sep 2025 15:06:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PPIUQq/Q"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFB8313558;
	Tue,  2 Sep 2025 15:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756825575; cv=none; b=apGQiKAAkFktuKgbCg1L+reon3s2G5y4gTDCym5KGNxj7421XH9paXdGlasBo8+rD6/1Jz5RO6iRx5upQuOmhNKM66NFWkGDVBHfPOKhOUWZdnc5mElNDfZgJqeQvR6UgWcoNLcktQBKDyMuayCDd7skAnIdtbuE121RirSycfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756825575; c=relaxed/simple;
	bh=KaWopFh3G3Ute3M/+mCT3RtU/jaEiwXVKes2viZVV3M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XewZ67nmr6KWiU4uHZEv8gPQclubKEt/0vkfZe6T6HCS1mfVrH1QNrks2ccfPh+9sk4rFbbIjgfOiF4rMJJb30V/hyCMvIj3lVzngISOJ8eig7ixnBS9Em/ysME5OGbEZeHi8Ap83pMx9HjENV+F8sZ/bDfD+qppmrl2zLjVdcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PPIUQq/Q; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-afcb7ae6ed0so821723066b.3;
        Tue, 02 Sep 2025 08:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756825571; x=1757430371; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0NCG6V1OgZuEp/3w3OM2cgGYGg9eJuDQh4/kEQfZckU=;
        b=PPIUQq/Qk+ERWuTjiqLoT9aknn34Sj321B98gxtNE28XuzZZ5bWewA9brX08UIkV0c
         Fxl10sXC2cXnNmnYh/GdncR+U/nkwIUJXGWIBoKQRSt4jodnAPxF4mrMh3njBINE2gxA
         1L6hmuslvH+dl/WhjpjXyyvBjJhydyEXMprgTp6iEI4YR5XE81hcqKXOhhFMckg6mUjt
         YMipAcmdUJ7olf69ubj132BWRKUAaAeoHlWaG56rKZjPk5H5eADItMg6yXR00j2CM+jb
         Al5GNW2kJLg3UQv47iP+GGsfBAUN+rOLm2p70lthVAAKkf7b2wdY63xQ+C6Lu2OF6ESE
         WT7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756825571; x=1757430371;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0NCG6V1OgZuEp/3w3OM2cgGYGg9eJuDQh4/kEQfZckU=;
        b=o4GiU2fKjvjZzEkGnm0SUNKZSsDwsHqQDy/EMukEhnt1etlf3qQYDNRjcnT16bkUdZ
         px8FrBfNttQTECgThhBv1cUCjwCOc7PKvRlehIug9uEuQn7sLkkejALNDzsF8DZ5FetZ
         hQHPHgV1AlBy8AxsNllA8BlLM5bx9Spr1VLPD8aaQmtB2//WFxpFL0/wraK50ncIQHip
         58NfHYyPcBmUeVRD1yIsV+CfgPly4pM+jAiugcuXR812+i3tMp643Ss6xGYUl9b16cFf
         w2DAQrdd5kGuhRhjyHaouqmC0aHJTGAnvJxz68OxEzoplUy/3uVogLEpXffbEm36NF7o
         xZ+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVSNXW1mO1k/kqhcxx+itySxkcVwsblV36gXLPZT/IaS9fBRZEmDw+vihXqoLjBNwztrknx1AtgIJgC@vger.kernel.org, AJvYcCWX8yTvIIVodhZNPSrJ0fdtyYhCRuX3RDw1m3oaKHZGoO548+Us2QFZYgCvHA2b6u2VsbiGa1Mp2j1yhIxi@vger.kernel.org, AJvYcCWchvQz/L70jsNuuE5VKaA7DRVZimTNzgnBJdYWRqjkeStfGnqZB275TMuorCY/akAP+YKcE/KPZfmdDvufqpiR5S4=@vger.kernel.org, AJvYcCWxS+gzwyIX1pR8SKtNC85PgJhosnJg2u83Jj9yPL67vdyECpMbMedMw10fHaLaNzryDJqwCY4aRVYA@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+xUHHkj6v40XzktFdL+yK/qRP/fOgCyReaWHHJ+UyIA/Oc1fR
	9pvSArgoQp+jt9c4ED2VnkObktjtAuGrfIFPaYHYUlhBOkTuGhT9I+J6Oeo/iuqB+RVQdIUMhOk
	+nae6I/fgFVfPaVXahdbV+8GsUNeK73A=
X-Gm-Gg: ASbGncs3qQmiPtXQS982qOkJgy9kn46W+Bedtv+ZFfB0TyZqnk9Uo9D/hzTxNJMK9iU
	iTOYnaCGT+UYRpTHpP22wMXN9BYyQIg4QG08U6ejj6meh1b/46OEsKxzIOY7SqbP/pwKnfk9BaP
	IluqRN3rW1oqlEaKOmi1aQZTykpq4PT/3GzRFsXZ7n9II1r3X9YFHmwZ6QYQKdGNhM73W9N5sv7
	GSNW/Xf4iHWdNQVMlOklsslz0bd5zzbvWGyNP5t
X-Google-Smtp-Source: AGHT+IHguZjKKQpFgGBpEEZVhDrXk7hGpOY5dXVvoNorkpEWWGQ2lapDQQSna02A2GKMR90XdVnQaTddKjZuWppnqeg=
X-Received: by 2002:a17:907:3f96:b0:ae3:5e70:32fb with SMTP id
 a640c23a62f3a-b01d8a277f3mr1333364166b.4.1756825571160; Tue, 02 Sep 2025
 08:06:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250901183000.1357758-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250901183000.1357758-3-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWARu=9__pqcHXUq92LYuxAQPZNJ6Fn_b7Z6x78i4twDw@mail.gmail.com>
In-Reply-To: <CAMuHMdWARu=9__pqcHXUq92LYuxAQPZNJ6Fn_b7Z6x78i4twDw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 2 Sep 2025 16:05:44 +0100
X-Gm-Features: Ac12FXxzvbsiyDdyR1GBbboEmEPc8JYS2vptgHxISPySqH13BqLFpjPt2hwkG4A
Message-ID: <CA+V-a8t1PDpqqMAdWxPeQfH6MWQe0GHsuBSzRbaRFRPPMf_iQA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] clk: renesas: r9a09g077: Add Ethernet Subsystem
 core and module clocks
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

Thank you for the review.

On Tue, Sep 2, 2025 at 2:01=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, 1 Sept 2025 at 20:30, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add module and core clocks used by Ethernet Subsystem (Ethernet_SS),
> > Ethernet MAC (GMAC), Ethernet Switch (ETHSW).
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/clk/renesas/r9a09g077-cpg.c
> > +++ b/drivers/clk/renesas/r9a09g077-cpg.c
> > @@ -72,7 +72,7 @@ enum rzt2h_clk_types {
> >
> >  enum clk_ids {
> >         /* Core Clock Outputs exported to DT */
> > -       LAST_DT_CORE_CLK =3D R9A09G077_USB_CLK,
> > +       LAST_DT_CORE_CLK =3D R9A09G077_GMAC2_PCLKAH,
> >
> >         /* External Input Clocks */
> >         CLK_EXTAL,
> > @@ -166,11 +166,21 @@ static const struct cpg_core_clk r9a09g077_core_c=
lks[] __initconst =3D {
> >         DEF_DIV("CA55S", R9A09G077_CLK_CA55S, CLK_SEL_CLK_PLL0, DIVCA55=
S,
> >                 dtable_1_2),
> >         DEF_FIXED("PCLKGPTL", R9A09G077_CLK_PCLKGPTL, CLK_SEL_CLK_PLL1,=
 2, 1),
> > +       DEF_FIXED("PCLKH", R9A09G077_CLK_PCLKH, CLK_SEL_CLK_PLL1, 4, 1)=
,
> >         DEF_FIXED("PCLKM", R9A09G077_CLK_PCLKM, CLK_SEL_CLK_PLL1, 8, 1)=
,
> >         DEF_FIXED("PCLKL", R9A09G077_CLK_PCLKL, CLK_SEL_CLK_PLL1, 16, 1=
),
> > +       DEF_FIXED("PCLKAH", R9A09G077_CLK_PCLKAH, CLK_PLL4D1, 6, 1),
> >         DEF_FIXED("PCLKAM", R9A09G077_CLK_PCLKAM, CLK_PLL4D1, 12, 1),
> >         DEF_FIXED("SDHI_CLKHS", R9A09G077_SDHI_CLKHS, CLK_SEL_CLK_PLL2,=
 1, 1),
> >         DEF_FIXED("USB_CLK", R9A09G077_USB_CLK, CLK_PLL4D1, 48, 1),
> > +       DEF_FIXED("ETCLKA", R9A09G077_ETCLKA, CLK_SEL_CLK_PLL1, 5, 1),
> > +       DEF_FIXED("ETCLKB", R9A09G077_ETCLKB, CLK_SEL_CLK_PLL1, 8, 1),
> > +       DEF_FIXED("ETCLKC", R9A09G077_ETCLKC, CLK_SEL_CLK_PLL1, 10, 1),
> > +       DEF_FIXED("ETCLKD", R9A09G077_ETCLKD, CLK_SEL_CLK_PLL1, 20, 1),
> > +       DEF_FIXED("ETCLKE", R9A09G077_ETCLKE, CLK_SEL_CLK_PLL1, 40, 1),
> > +       DEF_FIXED("GMAC0_PCLKH", R9A09G077_GMAC0_PCLKH, R9A09G077_CLK_P=
CLKH, 1, 1),
> > +       DEF_FIXED("GMAC1_PCLKH", R9A09G077_GMAC1_PCLKAH, R9A09G077_CLK_=
PCLKAH, 1, 1),
> > +       DEF_FIXED("GMAC2_PCLKH", R9A09G077_GMAC2_PCLKAH, R9A09G077_CLK_=
PCLKAH, 1, 1),
>
> Do you need these? I can't seem to find them in the documentation,
> so they are not just for aiding the casual reader.  As their
> multipliers/dividers are 1/1, you can just use R9A09G077_CLK_PCLKH
> resp. R9A09G077_CLK_PCLKAH in the DTS?
>
Agreed, we can get rid of these and just use R9A09G077_CLK_PCLK{A}H in
the SoC DTSI.

> >  };
> >
> >  static const struct mssr_mod_clk r9a09g077_mod_clks[] __initconst =3D =
{
> > @@ -181,7 +191,12 @@ static const struct mssr_mod_clk r9a09g077_mod_clk=
s[] __initconst =3D {
> >         DEF_MOD("sci4fck", 12, CLK_SCI4ASYNC),
> >         DEF_MOD("iic0", 100, R9A09G077_CLK_PCLKL),
> >         DEF_MOD("iic1", 101, R9A09G077_CLK_PCLKL),
> > +       DEF_MOD("gmac0", 400, R9A09G077_CLK_PCLKM),
> > +       DEF_MOD("ethsw", 401, R9A09G077_CLK_PCLKM),
>
> According to Table 7.13 ("Overview of Clock Generation Circuit
> Specifications (Internal Clock)"), ETCLKA is used as the operating
> clock for ETHSW?
>
There are 3 clock inputs to ETHSW,
- PCLKM -  bus clock
- ETCLKA - operating clock
- ETCLKB - Ts clock

Based on Documentation/devicetree/bindings/net/dsa/renesas,rzn1-a5psw.yaml
we have two clocks for RZ/N1 (Ts clock is missing)
- description: AHB clock used for the switch register interface
- description: Switch system clock

- const: hclk
- const: clk

So I was treating,
- hclk -> PCLKM,
- clk   -> ETCLKA
- ts    -> ETCLKB

Since pclkm is used for register access, I added this entry to the
r9a09g077_mod_clks array as I was under the impression the clocks used
for reg access need to go into this array.

> > +       DEF_MOD("ethss", 403, R9A09G077_CLK_PCLKM),
> >         DEF_MOD("usb", 408, R9A09G077_CLK_PCLKAM),
> > +       DEF_MOD("gmac1", 416, R9A09G077_CLK_PCLKAM),
> > +       DEF_MOD("gmac2", 417, R9A09G077_CLK_PCLKAM),
> >         DEF_MOD("sci5fck", 600, CLK_SCI5ASYNC),
> >         DEF_MOD("iic2", 601, R9A09G077_CLK_PCLKL),
> >         DEF_MOD("sdhi0", 1212, R9A09G077_CLK_PCLKAM),
>
> The rest LGTM.  But as the full wiring is not clear to me, I guess
> I'll have to wait for the DTS...
>
I'll soon post the Ethernet enabling patches.

Cheers,
Prabhakar

