Return-Path: <linux-renesas-soc+bounces-18286-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AABBAD8C5B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jun 2025 14:44:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A50F33A4E4F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 13 Jun 2025 12:43:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C89A14C92;
	Fri, 13 Jun 2025 12:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N91ii9A3"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2884C97;
	Fri, 13 Jun 2025 12:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749818638; cv=none; b=UACYAQS2ml0eWEbs7n7yfBMWhlsp47vRM/tDK1/WxDgNS76aOWtxpX6jXeTov5wr8Zv4D6OdUFqt0kHmCkB2vfVc6aLauX2BQp5IpWleApArZyw4tzAS86cDbjc9RzHMGzXF6w6eAFFaIwpodi18z8FKFJG8Ad85SpDBRxwLAdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749818638; c=relaxed/simple;
	bh=zpDVdjYhK2I8xsbQtHeIQ7//k3NZkgd5iBenS9Sm588=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FzAJDzVxd7sk1eCqPt+ajGNEHsIWizwdvGmgXPRsdqt8/nqwz9SlHQhZdVpMJvgfsY48P8vanwBJgoUff3eslONS/Rq2WSECwTlEc9czctEjXFUXBMVeEbsoOi5T6hnLhxQIHSyRNokCIWjrmlVaNKk/zCX4TKg+8XPjD/IEXLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N91ii9A3; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-450cf214200so17927525e9.1;
        Fri, 13 Jun 2025 05:43:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749818635; x=1750423435; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QSzXWhN/raBWTiTPkiF0KQOC1xc4h5AJxVQUi0l6KqY=;
        b=N91ii9A3BimgrjxCR8lpTaXs1KELczJFTHFSf0XYrlq5ckKYawkhSAO81pAvQ2vKW1
         QkT9n8TLtI/zPQkoJCf0s/MOPOVGICD8PEvvdb06rBrWdA8DLLH8uUOANeia0QFIO72a
         6AnRKzSwRPZZl2zjme96EZwhqYTKfBKgIjuWl1ipiWwFKDWzX5nQH7m18+ZcxTDQAc/u
         FxzkLGzR/qDSq8EV0/9+++4PkS4jmR5iOyiZ0byDrGfS2h3aXtnDOnbay5n7264L8+Tm
         40JB3mJPwr8Ujk7wNQR4aN4xcrmzrjpsYR0uDHcje4mOB1Km1jJ9v5cInBNAUXzxFMq9
         lJUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749818635; x=1750423435;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QSzXWhN/raBWTiTPkiF0KQOC1xc4h5AJxVQUi0l6KqY=;
        b=Ks0jgiMyHGBtrD+mEKtbEqRYjRlJlJAJ2c8VtCOh0vEtV7wM1D+56Wk+Qb5dLOZojv
         kR5SVFdIMQexLOQeUwqhKCJHGNnGNZCaQf/IcljNwqpiCIPa5X/y+7e/Mvh/V/RDTnwH
         ureDsmdXFVd2p7opJvX/eOwe1hdS5+jBpdNlMcnCNgGLN68ysifJHVF6E5B+//VD83DF
         qqREizB3dFIYfv0bPcp3mjJEeH0GsqG2KTRnuGEsTwDvTIzPnUvwIAeMwfg/EGGJdOY7
         qoUtP+l68nW7T8//0qV9BWs00IOUrHVzvpXrdCAZMDwLpAtkbfaxAYVulhgqfK0eJU3l
         rtAg==
X-Forwarded-Encrypted: i=1; AJvYcCUaGdo3Adi8MNOw+lzfwgk1NiHiO/hZsUsrCTeTQ9stv+ZYR/2bjtuNkDGf7yXAKbTsT41rTtYAirwLw/MH@vger.kernel.org, AJvYcCVB+m/WeAFM0jXqxbHG8swW7bwjec2z3mffWTUbZWbgcTcnVcaoxMGzYWKYlLSVkOXt7eu/h/n16Od+@vger.kernel.org, AJvYcCVX2AsD9dzTpzdCdhDs57EXh2VvSXRrgZBL7Ex2Kvek1TKaGrwEcuFiiSi3YH8n4VSUf7IWjEJIUGvw@vger.kernel.org, AJvYcCWHSW1sesKKv0gKAxLIrInr96QsmYFwRpGsP9JFAKavtnzY4KzHXHMsSQI7y86fxqwPmFj1GwJo0Mk/JXwSjoLmxYQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1jl01fGtkSjC9JBxpz3wrZGjmV1EgeXp/fDmOF6ygSqsue8Vv
	SxWBqksF1664KeO7l41ycU/v/70quwvQB7S5vMRqUSsbqQ3YhvBOZJvnB3/XJuCWOtJ9+KE09qf
	QGUZGzwppgAn9g1aoWlPTuJxpC/x5NjI=
X-Gm-Gg: ASbGnct87D6jaTH6g3CYNvdQ+/OJgVn3ruGf3iBV7VZT6kD8ArXwtry02P0NaJwlKJR
	VCERyoK/zs43KxQ3qGppwwdJuyMrnTOokmFChuM5Pl5tfdDyE5bYQBsD4oJprnXdEzbGFFxCLX/
	30oi1c9dVmh1vqDJSarppeWtFn1Ob8e/qqsCNcJ3dwB7y74TnalFAGa8cDJZsCiLfyKGvmVF1oY
	Gtwv1o47VAM9Q==
X-Google-Smtp-Source: AGHT+IEgP77ApvkePGUXbDz5b2URG0Tqka6fWKxmrlHoPPjLt6eXfMRuQsc3BlD+NOvRaghPFy/NaAhZ9nDY7Waa6rE=
X-Received: by 2002:a05:600c:c162:b0:439:9424:1b70 with SMTP id
 5b1f17b1804b1-45339a3b38cmr16993865e9.30.1749818634634; Fri, 13 Jun 2025
 05:43:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609203656.333138-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250609203656.333138-6-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdUyce8qxwStb-adR=ywJRdPynOSdZn9DV106VRptaa67w@mail.gmail.com>
In-Reply-To: <CAMuHMdUyce8qxwStb-adR=ywJRdPynOSdZn9DV106VRptaa67w@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 13 Jun 2025 13:43:27 +0100
X-Gm-Features: AX0GCFsk-_bL3wETvaMr4BaAQMx3wbt70A6JfaYg8NsgwG6lufDuRSiVfN-lk_k
Message-ID: <CA+V-a8s_9WeKJPvyi5-eAVAR2t-z03iC2niFUP-OJgkc-yhD-A@mail.gmail.com>
Subject: Re: [PATCH 5/8] arm64: dts: renesas: Add initial SoC DTSI for RZ/N2H SoC
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Thu, Jun 12, 2025 at 3:59=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, 9 Jun 2025 at 22:37, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Add initial SoC DTSI for Renesas RZ/N2H ("R9A09G087") SoC, below are
> > the list of blocks added:
> > - EXT CLKs
> > - 4X CA55
> > - SCIF
> > - CPG
> > - GIC
> > - ARMv8 Timer
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Thanks for your patch!
>
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
> > @@ -0,0 +1,135 @@
> > +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +/*
> > + * Device Tree Source for the RZ/N2H SoC
> > + *
> > + * Copyright (C) 2025 Renesas Electronics Corp.
> > + */
> > +
> > +#define RZN2H_PINS_PER_PORT    8
> > +
> > +/*
> > + * Create the pin index from its bank and position numbers and store i=
n
> > + * the upper 16 bits the alternate function identifier
> > + */
> > +#define RZN2H_PORT_PINMUX(b, p, f)     ((b) * RZN2H_PINS_PER_PORT + (p=
) | ((f) << 16))
> > +
> > +/* Convert a port and pin label to its global pin index */
> > +#define RZN2H_GPIO(port, pin)  ((port) * RZN2H_PINS_PER_PORT + (pin))
>
> These 3 defines belong in the (future) patch that adds the pinctrl node.
>
Ok, I'll make it to the later patch.

> > +       timer {
> > +               compatible =3D "arm,armv8-timer";
> > +               interrupts-extended =3D <&gic GIC_PPI 13 IRQ_TYPE_LEVEL=
_LOW>,
> > +                                     <&gic GIC_PPI 14 IRQ_TYPE_LEVEL_L=
OW>,
> > +                                     <&gic GIC_PPI 11 IRQ_TYPE_LEVEL_L=
OW>,
> > +                                     <&gic GIC_PPI 10 IRQ_TYPE_LEVEL_L=
OW>,
> > +                                     <&gic GIC_PPI 12 IRQ_TYPE_LEVEL_L=
OW>;
> > +               interrupt-names =3D "sec-phys", "phys", "virt", "hyp-ph=
ys", "hyp-virt";
>
> Thanks, this brought to my attention that the node in the posted RZ/T2H
> patch is wrong ;-)
>
I have some fixup patches for T2H which apply on v10, maybe I'll post them.

Cheers,
Prabhakar

> > +       };
> > +};
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
>

