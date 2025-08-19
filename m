Return-Path: <linux-renesas-soc+bounces-20682-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C27AB2BB4D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 10:00:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B258D17AB08
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 08:00:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC3F03101C2;
	Tue, 19 Aug 2025 08:00:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GR76L6yq"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0338825A2DA;
	Tue, 19 Aug 2025 08:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755590419; cv=none; b=gt4EE7miUvDon0Fmi2jrHLYoB8YPXn4B8zyXLcDkVqo4RjIW8MRhCR8TUE6DyVBJkUN6uRc8Lfub/oRGQ2ylLcm2OeiqJmL80nLvVrQITLduCTNegu6sKzeZgrOaGJXousTF3aaMobabG8oJZcYXsku8YBLFvwJxN/0ODtdk8BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755590419; c=relaxed/simple;
	bh=Nx8qIbi9SAkXbLGaFH71R/tnLFDf4K94bN5+uJ2TPc8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dUUtz8YNQ31qRgztfZjlkKQWB3+7HQFKKoOyOQSs68BAwukWK38mBju4RIYRO/71qbvkppx3UodYDIx9B1IAUrbOKYjuHAcsdoMFpuuu4KjR6l2TwPYaCgmw1185s18PkRZgDgRonuTcKfCDNnaFoyfXpmBVetZO59Zzb5LFg8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GR76L6yq; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3b9e418ba08so2746979f8f.3;
        Tue, 19 Aug 2025 01:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755590414; x=1756195214; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VRkdl0D7uOf0r2y3rQHAJ6SZi0yVeRGRkxwoZZVAQIA=;
        b=GR76L6yquM7fMUXzA2GTN1axRfkR//6pJ9yHBx8aSyvGDwAFqLBjGjrQvdApSkL9Tn
         byNR5RS0tfW8tLvYp14s01vP6/S0CGXmxKjqA7CynN5T/au+dASdcxD024Z6cAptYczx
         pSNWndrSNSSvQ1Kt3N3yWq08CYdFB8nDoBNpA3sv+vUobJ3P6onffpcwjWJUuhd0aTdI
         AhMaGgAYQme5xEjxGRVmckFyEtbRjywzfJIsiAih7EHIScUlaBgrS4khMI+NGoFhx1y8
         QcjqYkfstXAEEwPL6F6QPwktZQJPqIxvQF74VFI1YU5nQgKQw0wGxbgbaOOyJ+9SdjZ3
         2tdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755590414; x=1756195214;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VRkdl0D7uOf0r2y3rQHAJ6SZi0yVeRGRkxwoZZVAQIA=;
        b=eVSsv/zYWy0igeFYWjP5YHy9jsy9i6ttpyxPrzr9l0isGO4VFGq9+teoTh7KMoyh7B
         honHMomQ3W6yxGm6nrOJaVpqfOlUoNSZo+rWnoH6m7fiSajg2lFiWjJnBK9x8pB23c2P
         lK40WyPbWwFl7ectWIH2B64BX6Rks2h0s2I3cvzrX+6c1pyqa2NUy7UbzLqzdbdq0t7i
         YxcSpws39SFKOnL64RHWKgCcWTxbaUSJ4qBJSJGWYgmtJpMyLiJ2eGJ4MUwsiQWpJ9sn
         CPbJHBnZu3O7jBgfgSV0VqAJaORtmWPcGhMCsSGB69RRh2idLXFiuRpMoE9ITI/l52cV
         rxMA==
X-Forwarded-Encrypted: i=1; AJvYcCUR6PyyklUmsh/qDvwFk8zqVvr/u3DvV8o1tUpkqE2syDqcJikitgR3Nfs9fKAFWkl/2M9TmKz/CfO7sF/aoOtsTu8=@vger.kernel.org, AJvYcCWbm7WEOW9heLeo9ix0rrJ7Y3NVntYpHJjPaUOeuBPf5N+m/K0xjQn2n48S+pp+CouCINDLiSZDU4YOsBLx@vger.kernel.org, AJvYcCXT3Rr57jSFS6UWDPI8NLxdl1jppRqvKOiYChMWIfnhu3sVTivcsjb55u8NQjKyYTsY4kUybGt0nTCy@vger.kernel.org
X-Gm-Message-State: AOJu0YwvKOqFBme8U3kaTH9Fp3K/B0zYxleMYvaTMRV2wTDTqXriEo6e
	RJ0dRHodtVrKV3c3DhaAeGx00vHiR3S28DNTK1QkIVR7iuml3TF7KqeSa8Gp9TWODLi5uqEKemt
	G2sZ6arFBI3m9dtUIlOS5dRuN2dbgtozYCc+p
X-Gm-Gg: ASbGnctnZJzYXcLaTlu6LQQWVhOh6j2wHTQoJ+YzLjSji2fPBrDEdoqWXv28gK/kjE3
	scmlghxUWQSj4ta3fu1i9O2BCZwNSZAA6qnQa2C+0x+BzQjMHVtuoMLep2hC5yDaCyJQ+u1jqzH
	o/fisvT/6TJbfEL5gSrQwpK1jW/7eNJpy+yN31vLtuRJ8LvRdmVZROlEx/ioTKSaA1iCwhpOoeE
	unlPd/HaejxLOMWPmg=
X-Google-Smtp-Source: AGHT+IEflyYOgnjuJ8k5zdcmtQD7PXqL/yUuZjz4sozRotIwvgXG7UBVdB+gHtBDdUMTj4mP5zp3V0wCp/5sfgn2ktw=
X-Received: by 2002:a05:6000:4387:b0:3b8:d15e:ed35 with SMTP id
 ffacd0b85a97d-3c0e9f010d8mr1173323f8f.23.1755590413977; Tue, 19 Aug 2025
 01:00:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812200344.3253781-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250812200344.3253781-12-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdUeLewbDu-pge0ee0+AKzicKuS7fzce7d0pNc20h6CoGQ@mail.gmail.com>
In-Reply-To: <CAMuHMdUeLewbDu-pge0ee0+AKzicKuS7fzce7d0pNc20h6CoGQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 19 Aug 2025 08:59:47 +0100
X-Gm-Features: Ac12FXx3a_vfRR0cCVmfuQu70K6rUoEc6UqjsVGIG0wNRXq_W7RD2fJ5FCybwxI
Message-ID: <CA+V-a8s5Z+X-ueGdNWGs1i3PDN4P4COxCR9p-k0X8v22BkfvUg@mail.gmail.com>
Subject: Re: [PATCH 11/13] arm64: dts: renesas: rzt2h/rzn2h: Enable eMMC
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

On Mon, Aug 18, 2025 at 5:02=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Tue, 12 Aug 2025 at 22:03, Prabhakar <prabhakar.csengg@gmail.com> wrot=
e:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Enable eMMC on RZ/T2H and RZ/N2H EVKs. As SDHI0 can be connected to
> > either eMMC0/SD0 `SD0_EMMC` macro is added.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
> > +++ b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
> > @@ -10,6 +10,15 @@
> >  #include <dt-bindings/gpio/gpio.h>
> >
> >  #include "r9a09g087m44.dtsi"
> > +
> > +/*
> > + * SD0 can be connected to either eMMC (U33) or SD card slot CN21
> > + * Lets by default enable the eMMC, note we need the below SW settings
> > + * for eMMC.
> > + * DSW5[1] =3D ON; DSW5[2] =3D ON
> > + */
>
> Both SD0 and eMMC also need DSW17[5] =3D OFF; DSW17[6] =3D ON.
>
Agreed.

> > +#define SD0_EMMC       1
> > +
> >  #include "rzt2h-n2h-evk-common.dtsi"
> >
> >  /*
>
> > --- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
>
> > @@ -44,6 +63,34 @@ sci0_pins: sci0-pins {
> >                 pinmux =3D <RZT2H_PORT_PINMUX(27, 4, 0x14)>,
> >                          <RZT2H_PORT_PINMUX(27, 5, 0x14)>;
> >         };
> > +
> > +#if SD0_EMMC
> > +       sdhi0-emmc-iovs-hog {
> > +               gpio-hog;
> > +               gpios =3D <RZT2H_GPIO(2, 6) GPIO_ACTIVE_HIGH>;
> > +               output-high;
> > +               line-name =3D "SD0_IOVS";
> > +       };
> > +#endif
> > +
> > +       sdhi0_emmc_pins: sd0-emmc-group {
> > +               sd0-emmc-data-pins {
>
> No need for repeated sd0-emmc-prefixes in the subnodes.
>
>
Ok, I will get rid of them.

Cheers,
Prabhakar

> > +                       pinmux =3D <RZT2H_PORT_PINMUX(12, 2, 0x29)>, /*=
 SD0_DATA0 */
> > +                                <RZT2H_PORT_PINMUX(12, 3, 0x29)>, /* S=
D0_DATA1 */
> > +                                <RZT2H_PORT_PINMUX(12, 4, 0x29)>, /* S=
D0_DATA2 */
> > +                                <RZT2H_PORT_PINMUX(12, 5, 0x29)>, /* S=
D0_DATA3 */
> > +                                <RZT2H_PORT_PINMUX(12, 6, 0x29)>, /* S=
D0_DATA4 */
> > +                                <RZT2H_PORT_PINMUX(12, 7, 0x29)>, /* S=
D0_DATA5 */
> > +                                <RZT2H_PORT_PINMUX(13, 0, 0x29)>, /* S=
D0_DATA6 */
> > +                                <RZT2H_PORT_PINMUX(13, 1, 0x29)>; /* S=
D0_DATA7 */
> > +               };
> > +
> > +               sd0-emmc-ctrl-pins {
> > +                       pinmux =3D <RZT2H_PORT_PINMUX(12, 0, 0x29)>, /*=
 SD0_CLK */
> > +                                <RZT2H_PORT_PINMUX(12, 1, 0x29)>, /* S=
D0_CMD */
> > +                                <RZT2H_PORT_PINMUX(13, 2, 0x29)>; /* S=
D0_RST# */
> > +               };
> > +       };
> >  };
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

