Return-Path: <linux-renesas-soc+bounces-19045-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 394AAAF62AB
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 21:31:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6DE01177749
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Jul 2025 19:31:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC6011369B4;
	Wed,  2 Jul 2025 19:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fhfCHhjj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A012F7D18;
	Wed,  2 Jul 2025 19:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751484656; cv=none; b=oEkC6kh1RhVN0fmI0tk8qW9WJwhWKFZRZnBRAtdvVqmt4nKFWdim1Upfv6mrODzpY9IlpTCHUKA3QG+dDhwv8zd9fryTvaJkvmvxQ126Wlayq3ILORw1M1eB2rar+yhxcxCn0es+DbaoXwtr62Dc9XRvLYdnck2pTF7vR1in2WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751484656; c=relaxed/simple;
	bh=XvL0C829DR4uLfyjmvI2QXqcasxHCv74BitAVS8zZB4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n20/95wSUdugLGGJ2QPb82Fng2+wBLqpDm8sXrAA+4dWBL6h7luHVp5xsmZKLPgoXC84xb5geJJRqi8TncWcNZgvrxlbvJQ+nSXjK8kTO+Ei17uo/G4IWDFaR3ikimU4GKyhHq1cTjcYyCSblIxA6Rx+tKXl9BI5iqLBikaJvhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fhfCHhjj; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-60c4521ae2cso12856891a12.0;
        Wed, 02 Jul 2025 12:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751484653; x=1752089453; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=93mGoSsbqUlAUrH7FmREdhftiUMk4vyp04kuxZtnNOw=;
        b=fhfCHhjjvdYuW34TbGG7f1K4wSmttkteaKexnz4nCXZAhHoV58XHTw5uB55PHy9Br0
         PSzQ4CVq60yhAaDAifuYNtN7yAFq8V/czh7EWmAG/+LJ24jda0Ds1Ycyd31uGiYj7rbT
         y7Jh9b843HbRa/2QyWwT+QqaTMkzEQFq0OJf7eRe/zWvPxRgitJ0pEACa0WCzFyxW6Ha
         2wX63SoilywN3KGntGiLshlTDsUu3n6qojpy+AtTkg5WFPKqvJ2GeapXVt8cZWt6EoR0
         uEUwOQPVshmkAKbdxoNBoO0uzZWMkbvyEt+UWB/AD+xxsLvfYCMnffPX8T/zV6OiqP0N
         Idhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751484653; x=1752089453;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=93mGoSsbqUlAUrH7FmREdhftiUMk4vyp04kuxZtnNOw=;
        b=gscmCi1oRcithA/4FeXorNrok3hfHHGFTGMYkgJnVULGXKu1RHBwZdekARUZIq7l03
         kdvakpYzs1Wn8UusZtHt0hOYNa50nfrlivxgkiaNPV4uZ5r5crHaS1Y31zVI843iC4p/
         bK8+sil7Akc1TYEw4Tgmi0UWzu7YXU6/Rr8hgwDCaqaSAEVYLTaFSn3NMAU8L3cndW2W
         UWHcDWWoKUntocOc7C2gClqEdO+QToruckj1Om2pVC7w9J4/FyX0F5QABX2UPJ3Ylg5S
         F8dGKsdTcYv6OvluSA+6+f6o4aMmXWsY4OU5jYlHLk6r0/NYB2+4WykjMUub7NMf88ry
         f4Aw==
X-Forwarded-Encrypted: i=1; AJvYcCVOyaX3qxT/e9ebTzYmwYTMj2Xzg3fOB/xXickuKy/kfUO1te4DLasL8To2eIFWdFetBJv15gHik0eW@vger.kernel.org, AJvYcCW/ZQZzUQ2lODLV1Uxq0QTlU904O9COzaVIkAxaaHlAwNdKbOBHtR9X9dCbM0diKiV7niuhfKMECXK/Cpzz@vger.kernel.org, AJvYcCWoeDAkFi41fCy/YqrRV/Ina2HyMIv/LoTwjxXnQWgA3DGCsi13BYGbK1KVPGSDIyLlQHh38dDq4cw/@vger.kernel.org, AJvYcCWpgVL5HH0fvX0kAOxHcM5qHP7Yo/OD5/N51zCX2Q0ZBYSUUWizVl51zRW4x9/xrSXZnUYW3xqi9W86Im6EK+iINYY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzki0ed/jAKCqUJE7OgRK7ZmVw6N3RhOnrp+UEd4IVSdu5t3oza
	sereXu8ucZwMyRnbDf4whhId97SEIc8tN7wtEHg/3ZImPpmSR41GYHlB2vt9/wU2DmlweHmXOdM
	J0N3XJu7HY+TyJ3MVthQBzBgDjMFJRM8=
X-Gm-Gg: ASbGncuP30FE94KWm8SPotOiD115Je9I4Rtcfoo2d0TTDdF0P1weNuNkNzT1YqQZTs1
	O59CJWMsq3MDTXK3u1NKfLexhx3i1LaayHh8T6zZPg18zyxlz3NfL5zzAQ7lCBJUQiR7G3ZytrR
	utBUY3xHLkDSg1iQshqE+mzTI7EwurV4KBcP1Q56NmRNLxLQ==
X-Google-Smtp-Source: AGHT+IG/AKI0oxrqbwK7VdmQ2uGe1VyMW31q872pricgjgznY3drPRYj8SluRe6zmCcF8lMQHmCMqmXiPcY3b4ugoRs=
X-Received: by 2002:a17:907:728a:b0:ae3:5368:be85 with SMTP id
 a640c23a62f3a-ae3d8b20366mr37282466b.47.1751484653205; Wed, 02 Jul 2025
 12:30:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625141705.151383-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250625141705.151383-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdWnDhhJ+G5GvMZw+7WGBdiMfWHPXSwkwOqnK5XtKdyS1A@mail.gmail.com>
In-Reply-To: <CAMuHMdWnDhhJ+G5GvMZw+7WGBdiMfWHPXSwkwOqnK5XtKdyS1A@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 2 Jul 2025 20:30:26 +0100
X-Gm-Features: Ac12FXwkxxZV9AZ9JoAjDma36LcnTBBV9NTDM4QNSyVnYBMWZF3A5jQl4JGa2HI
Message-ID: <CA+V-a8tMV+eHduBduu_xRYAo7m+AH3ttWBM+BCMAGzF8fzFJLQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] clk: renesas: r9a09g077-cpg: Add RIIC module clocks
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

On Wed, Jul 2, 2025 at 2:46=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Wed, 25 Jun 2025 at 16:17, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add RIIC module clocks for: iic0, iic1, and iic2.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/drivers/clk/renesas/r9a09g077-cpg.c
> > +++ b/drivers/clk/renesas/r9a09g077-cpg.c
> > @@ -154,6 +154,9 @@ static const struct cpg_core_clk r9a09g077_core_clk=
s[] __initconst =3D {
> >
> >  static const struct mssr_mod_clk r9a09g077_mod_clks[] __initconst =3D =
{
> >         DEF_MOD("sci0fck", 8, CLK_SCI0ASYNC),
> > +       DEF_MOD("iic0", 100, R9A09G077_CLK_PCLKL),
> > +       DEF_MOD("iic1", 101, R9A09G077_CLK_PCLKL),
> > +       DEF_MOD("iic2", 501, R9A09G077_CLK_PCLKL),
>
> Shouldn't that be 601?
> (MSTPCRA =3D> xx, MSTPCRB =3D> 1xx, MSTPCRG =3D> 6xx)
> If you agree, I can fix that while applying...
>
Agreed, thank you for taking care of it.

Cheers,
Prabhakar

> >         DEF_MOD("sdhi0", 1212, R9A09G077_CLK_PCLKAM),
> >         DEF_MOD("sdhi1", 1213, R9A09G077_CLK_PCLKAM),
> >  };
>
> The rest LGTM, so with the above fixed:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds

