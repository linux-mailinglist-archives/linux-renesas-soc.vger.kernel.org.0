Return-Path: <linux-renesas-soc+bounces-20684-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 04AEDB2BB67
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 10:10:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B19FB3AE267
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 08:10:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D9923101AD;
	Tue, 19 Aug 2025 08:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kSgD3JZ8"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE9D10957;
	Tue, 19 Aug 2025 08:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755591028; cv=none; b=GIa0HZjjMuJUpXlTW6+razHFQdu3HvhMEROuz2P00r0Vl8GYlcO2xEc+ElXIdHzI9Lw3gndU6fTUvM/mpt0DkBJmtKNF4HZQjMwTJuvS7rHi3pnGcv8+L0sO6r6X0oyMMEeP2F1tBIPXG9UJEhlmdkivfU8tgeXI7a9tG1N1wn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755591028; c=relaxed/simple;
	bh=ccaNPquQtaEDdPDJ9bYg/zrw3qmQgXKFRo7Cn3yGdMs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oyxd9dUXK9BT5y1IWb4IDxzSx1Fl96LEHjay8p+Ty5KI7ZnV0+Q+sYqfVaYRM7dyciorDt47mVY49HlOSwL1+/aYykc7/ssK4MbE6Mjlq4w7wZTzYAm/thtXsGWV5pySaYitzasXV8jydOyNPaarYZXGYuX7jVac9leEQV8RKaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kSgD3JZ8; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3b9e4106460so3964193f8f.2;
        Tue, 19 Aug 2025 01:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755591025; x=1756195825; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nlm+pLswC77Rj/PqedlkaZ5MapOUa3oMOyyBpLq2NBA=;
        b=kSgD3JZ8FricXPesoxYC0ojX86kf8y9xujxY3GJfbyLDSFMK8/HupI2fAD4b5T3F2L
         3X6Og27oaW2CW1TRYPBB98nbN10lzt9xuRKs0SyoWOiE67udSUiZbuwCfGb6qoJE5LAh
         /kFFgj0ARvdwqMPjwMsf20torx0udsHgKJl4TL9KVPv6iK/4SyGPliedEeKYxSKb3kAl
         QtRU8h2bHKvDVJjS5/2uk5y7kuMEGG2cCbuC8k0UelCfFZns5lFewgJCTpMrScvH9TYy
         YS7bAy5mxrxkZ8avOLSfPvSxsJhdNhgMdaQDNv5tHMj/KS4UNBto/PwMtXHHyIq+ewr8
         fPOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755591025; x=1756195825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nlm+pLswC77Rj/PqedlkaZ5MapOUa3oMOyyBpLq2NBA=;
        b=Tv5hqmEIgKqnvNohyCeWUduGeWEbefP70aSqyPIgjtJ819En+JS2wO0mxjle+31an9
         TkK/RmjCCdfAGTWJcNKB0w4fmkBNXpv24ynnzRwrdbOyBFSYWg5ngjTlZ3FvELsIPQdl
         LPLeN+TI1L1WXYZhA308S2CfzOuo9r4XMz/728pi1RwCK9g/JmIMOTcaUspw/nhr4304
         gLUxeSOJf4489LvDF3FUw558mzkBhDta/zoLv/pzEkqdkkStTkIHC7FMbaOhxlT0yfVt
         EZHum9Dc241LIUbPyT+HHaUIFwaGDexzsulB5MHs49TRY54+ZTfyFBFqxDQAY4abEYhl
         dAzA==
X-Forwarded-Encrypted: i=1; AJvYcCWHqwlxzirFnjo3hoLNt91xNxhLlknM0LUmlctGR45YavfeA28JXl3FHPjB5RDC30Bf1xaUGC89+tod@vger.kernel.org, AJvYcCX9zXE6Lc0i84eqr0rOe/U8lFQiH3CEk5cvU+fKbFElpU7ZLzunu9x0S45EXlIGJcgI22jw+2Dvy3J+VuWa@vger.kernel.org, AJvYcCXa9jtcPf5Vfba2EQdOfOae7V++vQFZEQBbuwJDLIvMFvGJyTnaXcb0hu189aTJ4kmRjytzCNPcQQfjbJMGYUoR4CY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy9XOino/0dFJx7LgBN7qOaoF2eDHBowhOdvfRzClYl+21SNv4
	pk55OpEquVdleO5AVpoCdHA+15Mr7RkFSvJLmEEjARcBW5Pc156V13aA5Z7lHWiPjghZHzVpigY
	X03o+ab2U1VECnnm4yMFd4jFGUVLNltI=
X-Gm-Gg: ASbGncsLkDrVZ/fckncw2mgsKwA+pq62Tcn/slAQwOWagAfG+rCId/IILqb7vnONMPS
	eHf4hO7IqCBXmzrjSkhy5F+AiXEqkwXZJMyBH/hMX+IaKdd9xFi4TU+mONt65KSYjp6nDrG8ZOF
	5ilZS2sOWCSTngxGxzgrKeTwY1+R97iWGkr+GqM6QfcLfIzpmTXNJgsLgP3etmIKuiZ3AN57tB0
	QS7k22yV6KeDM+gytk=
X-Google-Smtp-Source: AGHT+IHa+dGvAzT5SVbKPPYFsRBuMiv52pGDSy25l4XRs4btwk0rdhRw2oTiICv7QYT9DPwg9TM9zx9pLikpbdHE9ZA=
X-Received: by 2002:a05:6000:2387:b0:3b7:9aff:ef22 with SMTP id
 ffacd0b85a97d-3c0ecc3206dmr1261410f8f.27.1755591024942; Tue, 19 Aug 2025
 01:10:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812200344.3253781-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250812200344.3253781-13-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXt9O==nuO7e+iWP7Efx=yy=TPakmSxC6BhPsWGw_hG_A@mail.gmail.com>
In-Reply-To: <CAMuHMdXt9O==nuO7e+iWP7Efx=yy=TPakmSxC6BhPsWGw_hG_A@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 19 Aug 2025 09:09:58 +0100
X-Gm-Features: Ac12FXy-Krk7WAxy4eBjA42e2fD1S8Ium1CVXP_oouTnK4CtkGjPsXCpttnBih8
Message-ID: <CA+V-a8tjK8tx5BsZGySuo-hO5AQk8oJs-WeY83gsxFexw=oGMA@mail.gmail.com>
Subject: Re: [PATCH 12/13] arm64: dts: renesas: rzt2h/rzn2h: Enable MicroSD
 card slot
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Mon, Aug 18, 2025 at 5:03=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, 12 Aug 2025 at 22:04, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Enable MicroSD card slot which is connected to SDHI1 on the RZ/T2H and
> > RZ/N2H EVKs.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
>
> No mmc1 alias?
>
Ouch missed it.

> > @@ -91,6 +103,30 @@ sd0-emmc-ctrl-pins {
> >                                  <RZT2H_PORT_PINMUX(13, 2, 0x29)>; /* S=
D0_RST# */
> >                 };
> >         };
> > +
> > +#if SD1_MICRO_SD
> > +       sdhi1-pwen-hog {
> > +               gpio-hog;
> > +               gpios =3D <RZT2H_GPIO(8, 5) GPIO_ACTIVE_HIGH>;
> > +               output-high;
> > +               line-name =3D "SD1_PWEN";
> > +       };
> > +#endif
> > +
> > +       sdhi1_pins: sd1-group {
> > +               sd1-data-pins {
>
> No need for repeated sd1-prefixes in the subnodes.
>
Ok, I will drop them in v2.

Cheers,
Prabhakar

>
> > +                       pinmux =3D <RZT2H_PORT_PINMUX(16, 7, 0x29)>, /*=
 SD1_DATA0 */
> > +                                <RZT2H_PORT_PINMUX(17, 0, 0x29)>, /* S=
D1_DATA1 */
> > +                                <RZT2H_PORT_PINMUX(17, 1, 0x29)>, /* S=
D1_DATA2 */
> > +                                <RZT2H_PORT_PINMUX(17, 2, 0x29)>; /* S=
D1_DATA3 */
> > +               };
> > +
> > +               sd1-ctrl-pins {
> > +                       pinmux =3D <RZT2H_PORT_PINMUX(16, 5, 0x29)>, /*=
 SD1_CLK */
> > +                                <RZT2H_PORT_PINMUX(16, 6, 0x29)>, /* S=
D1_CMD */
> > +                                <RZT2H_PORT_PINMUX(17, 4, 0x29)>; /* S=
D1_CD */
> > +               };
> > +       };
> >  };
> >
> >  &sci0 {
>
> The rest LGTM.
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

