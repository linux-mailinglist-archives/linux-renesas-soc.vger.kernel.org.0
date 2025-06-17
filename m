Return-Path: <linux-renesas-soc+bounces-18415-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C11AADC30A
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 09:17:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 52EA97A2165
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 07:15:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB43928C5CE;
	Tue, 17 Jun 2025 07:17:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448D219047F;
	Tue, 17 Jun 2025 07:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750144620; cv=none; b=msM5bkD5m4zsXo7y/VKrQUgkP5AqutUYho+RpP+aWJAgRjpF3LyuXG+dxN9YYWHnyTwcP6CPKiCBP2l9b6wqKp/4DHLuX9K+EMTU528oRGfJJjQUcyBfq8burdP1CxeR5cw64CGLEx8sFSwWXBW1sj7KOvbGwDKuraRr5jy45CM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750144620; c=relaxed/simple;
	bh=vJfnfZo46y9GEvS0iOv7XCEvS5tUoHWEXPhprydyMMY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c19qGtTsSqX7aGfi5NxY1dJM16BwSmzLB9A7By7lg0CUmdRTKbbyZPRVpJyLn5v/N5sADHap9Iq1qdM57uQB23HxLKdIMNPoE3qMUNRtReJA/hhvKZxrvl3mlek5A6RumE4l8r7n56dLweq3xTDzJNpjkxebetpTV2FSXaFKDw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4e7949d9753so1749147137.2;
        Tue, 17 Jun 2025 00:16:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750144617; x=1750749417;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M261FUbjDGS7IxZQCcj9y1Rgp/W6CtrsJj62qQj1ziU=;
        b=U9D4yPLf0iPI0PM+kIlc6r0GX7pbMdRIkLTt23sv6Yqv/M+VxT8ipq4YYkDtxwfmWA
         szyElzQX5hmtZLx7DjHZcnjI+xOBrF1JAGJEYqmzOLswpzrBkO3oxVodM1bKMcCSebCZ
         JC3rmuRe/TaOg1ijbEqgCnUacqhNlLCCxfVgovyuKmAs+z+UG9625eU+yMLIID4+G2OH
         FtcH29erNuL+ErCHVu9zPWUfRg4Gv0uvDJHXbgUrollmaCVa5aJpXSe/jJQqfx8LY+hF
         uENvbn85upffldaA7YD6ZGmGQVWyS/zd2oTZIEQiCFzS/SvxugdF1gS9STAAcP8RmCH9
         wO0w==
X-Forwarded-Encrypted: i=1; AJvYcCUIMaHfY2qexiSYhDrwfX60wb/3ibCnE4pilst4PNQHzypr6guA+n1S1rsGTsoyZmKxCPKHDUxy9yK0n5ML@vger.kernel.org, AJvYcCUVvaxSPlB7nHqPzEw48pC1UfwglL99fdrNcHKd8XPQan5Lb7YqjDmmzXDcCw/Vmbwz94e8cLAgTFV4@vger.kernel.org, AJvYcCVCMWlIz1TXyRs0oOrL6e9c4scxk/7VKqlCg/oZc89h00IistKJcfsRcfPH3z/cMxKAnbPjL6+DkgR0ZjrECZ/39yI=@vger.kernel.org, AJvYcCWSv8Om9BXoiKbeGLwrxgxyR780bfk8VlnilQ+70aERI5+Zh2IjeUwogkJIgq+zfFuhPhiTizhuVHqW@vger.kernel.org
X-Gm-Message-State: AOJu0YwkF1CjH1Vv6iAWSOPsi2NRlELA2V2M5F5IJvSozC2xIicsQhOp
	nJvvK9cZrQHvA5Fm916ZNAJ0BmRIDsCG+L9Uc3/ZVsit4yyQwg9Yq4G105TozmGL
X-Gm-Gg: ASbGncviRNFsk1YobrXGuqD9tcgJkIH3HCqeSbe8Xp/VLjExlJGFJWirQRENdlI8IHP
	/ok3kittiqpGA1indCbiSgp1ygbOBGJjGrkYQYhXY2VN9dF5NhsCPnjMZ21jP/8UJv1zyxfsdYf
	CJForPMO0imUm+vheM3DHmbqNjq10cczVKycd9hfnYpA6DYv2B222gvGMSldjOmUyY520tUBJyo
	vvH7jyXIfz5zNfLPT1jhBY7FjepxnN0jzx3OPLSxRoCWEoXiU/9hNz7todAaLIKNK3XlpsUx3IK
	bekYfkAIdE3+ll6TrWgyH7H/oRVW8tUHKvXeSCbTTqvbamMRcqTNBcmBwlelbAkQRCrBtwCdnsk
	2M50mnmgM7Y5dkGOe/Tgev55Z
X-Google-Smtp-Source: AGHT+IFSldgcspJdYfaqoXpvSdUG8xksqj/EMeYw6DZ+KFVXYnKNUWOT/5UIW2zyFx3PErO5bOITvw==
X-Received: by 2002:a05:6102:38d0:b0:4dd:b9bc:df71 with SMTP id ada2fe7eead31-4e7f61ced95mr7948299137.10.1750144616698;
        Tue, 17 Jun 2025 00:16:56 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4e7e70c6886sm1534977137.24.2025.06.17.00.16.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 00:16:56 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4e77d1333aeso1460299137.0;
        Tue, 17 Jun 2025 00:16:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUS+77P2SATXhNdpDT94nv+r1Gnx7XVmyhm2c+B9v3DjTBm08wAER9lbcuWwNaCPK5+Cr1BBIZeAaqH@vger.kernel.org, AJvYcCUiiXCZXAa5vB0GXCJ+5EjVJG5GXS5E6ZtR4LT7oAAXUC7KOEgD7dV0/qDf8COUtRzLKL3B5gA7H/MH@vger.kernel.org, AJvYcCWOWdRDQoIHejzUeV1KXMHKHkXy2uuo6NergREDwmi9cnIVc32At5lqFNSJkcimuWvaqEu8wQLNiua0Ts45EXTrUAY=@vger.kernel.org, AJvYcCWwHSGBXry1Imvudr4WDmYlc8zvAa1wQEBgksnoejgvZr2FGANQmyr7ikQQhjT7XcMi5kQDlgF99D83Zhnt@vger.kernel.org
X-Received: by 2002:a05:6102:4a98:b0:4e6:a338:a421 with SMTP id
 ada2fe7eead31-4e7f61b1f1bmr7111790137.6.1750144615617; Tue, 17 Jun 2025
 00:16:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609203656.333138-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250609203656.333138-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdVvQEC9c9wHDrFiY6iixuP-JjOgHZQjfzOkAjvxs=LuqQ@mail.gmail.com> <CA+V-a8vUdBwAx5x1FfWJZK0BeXQQqFeDRLtvyETiPDQc1Pftiw@mail.gmail.com>
In-Reply-To: <CA+V-a8vUdBwAx5x1FfWJZK0BeXQQqFeDRLtvyETiPDQc1Pftiw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Jun 2025 09:16:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVDqoBEaBg+Tqj1nxTHJXGG8LWyo1xenSuTXTf0DQw9nQ@mail.gmail.com>
X-Gm-Features: AX0GCFvTdSEkTtmnY7ITCikl3hKxLbzpvQWPX_2lfUXVw80Wv9KR5OXOX2w3SaQ
Message-ID: <CAMuHMdVDqoBEaBg+Tqj1nxTHJXGG8LWyo1xenSuTXTf0DQw9nQ@mail.gmail.com>
Subject: Re: [PATCH 3/8] dt-bindings: clock: renesas,cpg-mssr: Document RZ/N2H support
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Fri, 13 Jun 2025 at 17:29, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Thu, Jun 12, 2025 at 3:38=E2=80=AFPM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Mon, 9 Jun 2025 at 22:37, Prabhakar <prabhakar.csengg@gmail.com> wro=
te:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Document support for Module Standby and Software Reset found on the
> >
> > the Clock Generator and Module Standby and Software Reset
> >
> Ok, I'll amend the commit message as above.
>
> > > Renesas RZ/N2H (R9A09G087) SoC. The Module Standby and Software Reset=
 IP
> >
> > Clock Generator and ...
> >
> Ok, I'll amend the commit message as above.
>
> > > is similar to that found on the RZ/T2H SoC.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> >
> > > --- /dev/null
> > > +++ b/include/dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h
> > > @@ -0,0 +1,28 @@
> > > +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > + *
> > > + * Copyright (C) 2025 Renesas Electronics Corp.
> > > + */
> > > +
> > > +#ifndef __DT_BINDINGS_CLOCK_RENESAS_R9A09G087_CPG_H__
> > > +#define __DT_BINDINGS_CLOCK_RENESAS_R9A09G087_CPG_H__
> > > +
> > > +#include <dt-bindings/clock/renesas-cpg-mssr.h>
> > > +
> > > +/* R9A09G087 CPG Core Clocks */
> > > +#define R9A09G087_CLK_CA55C0           0
> > > +#define R9A09G087_CLK_CA55C1           1
> > > +#define R9A09G087_CLK_CA55C2           2
> > > +#define R9A09G087_CLK_CA55C3           3
> > > +#define R9A09G087_CLK_CA55S            4
> > > +#define R9A09G087_CLK_CR52_CPU0                5
> > > +#define R9A09G087_CLK_CR52_CPU1                6
> > > +#define R9A09G087_CLK_CKIO             7
> > > +#define R9A09G087_CLK_PCLKAH           8
> > > +#define R9A09G087_CLK_PCLKAM           9
> > > +#define R9A09G087_CLK_PCLKAL           10
> > > +#define R9A09G087_CLK_PCLKGPTL         11
> > > +#define R9A09G087_CLK_PCLKH            12
> > > +#define R9A09G087_CLK_PCLKM            13
> > > +#define R9A09G087_CLK_PCLKL            14
> >
> > The RZ/T2H DT bindings file lacks PCLKL, which was probably a harmless
> > oversight (it can always be added later), as it does exist on RZ/T2H,
> > too, according to the documentation.
> >
> > However, given drivers/clk/renesas/r9a09g077-cpg.c has
> > LAST_DT_CORE_CLK =3D R9A09G077_CLK_PCLKM,
> > using R9A09G087_CLK_PCLKL will lead to wrong results.
> >
> > So either you want to add R9A09G077_CLK_PCLKL and update
> > LAST_DT_CORE_CLK first, or set LAST_DT_CORE_CLK to R9A09G087_CLK_PCLKL
> > in this patch.
> >
> Actually I already have a patch which includes a couple of fixes and
> to the orignal bring up series for T2H + I2C support which adds
> R9A09G077_CLK_PCLKL and updates LAST_DT_CORE_CLK. I intend to send
> them when the base patches are accepted. As there are no users for
> PCLKL in the bringup series this won't cause any issues. Is that OK
> with you?

Please include that fix in your v2 series, to avoid any possible
issues with using R9A09G087_CLK_PCLKL.
Thanks!

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

