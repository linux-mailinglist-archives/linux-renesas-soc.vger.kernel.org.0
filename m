Return-Path: <linux-renesas-soc+bounces-20630-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 934A7B2A8FD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 16:13:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 946811B6669C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Aug 2025 14:06:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AD2F320CC3;
	Mon, 18 Aug 2025 13:58:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A65331B11E;
	Mon, 18 Aug 2025 13:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755525510; cv=none; b=kCvPZw1pruOPhtYrRPFAILG4Z66J5aPQoFmy8qtLhd7jFKOIgaxZ1HMq+pMPBXyhkknxQKvyMJ6wKvgXrCzfdUWhftKFw5PG2jQnxCgHFQkLVUMA0cwnPKUrY3rDR0Xqg3UrNpmzPSnYh7g7wgKPxwLEfe69C8gsDFqcI/dQ9sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755525510; c=relaxed/simple;
	bh=r6b8o6bsLro/7yyL8l9nrunXrsD6uZ1zGQTYvzQ1BfE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UhLqOwk/9sBHypbFQpLWlWUYEDEzhr0P4ZHueSvempb0/wT9jLeTJZW5tLbAX9w+X8qIoO/pp8phY4JDXCGi934UUrOtUvZuWKjs7ta0ny9IxQUkj6Qv2ZbAgk6a/3vwT0N4GyakPqgt4SBClFYPwuTTx7RdJbwfuMKLZMnBJVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-8901912bcfeso959248241.3;
        Mon, 18 Aug 2025 06:58:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755525507; x=1756130307;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dQFafCNnR6ehDHFzyrrp2DqVJKO1WFVvZqmwWpe95Nk=;
        b=ZsgiTbD4VW3AGga2wpvvYAtMeNUuhcELgLWOe1EeoNESbZq0SNdAcimilinHWtZ/q4
         e/w8jRBxV8XeieCbt4S1KYpbTtFIhdQbKmPLUV+FqR6JKKliLAXuvYchYA3TsDhJeArh
         9rdc8jeRfTgstyDe8Nj45Jfs1bkWxHLAaDPmVTS9HtcOS3loypqjPHhN14tl+VXikDIu
         F0vCPVVUI6845wwZZ2gnEnTc+0B86nWkUkqMmvSZuz3xVVw8DNvY/0pO3TEg1QzF8hLZ
         rSru5bTXfHJtYdRnyt2J8KPbjeYVVCRtn+QK45truyUVNU7v3Q1PR4ZPJMiaouW+7Few
         6YmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVf10X+TKLlEpd2yMOSYIOl0Gx3wBtQtOVwX5wUAK97DDkTj1jcj0t4nlh3vIgXoel7NFq+NALixZ7S@vger.kernel.org, AJvYcCVqGfO9sd4g1CiqNmva5sh8lU7aN871nk0Vflh+pLV5cIB0pQ2LvYsZu1m4q8dg5suaWk3zSVQCM26lPHT1@vger.kernel.org, AJvYcCWLTrTHWWNnIg5xl/5GGIY7hDT/HgYKfkqEBekhtFVqaPaFhh/TEsAT+rRJuhU1F0P5CUFm4GBvfppuoZmtn1MOS04=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZnxCQoOcnMhL/4+miLzSlgFodcps52kc1FK1c0MfRDMDkCZjG
	ZC5wHrJHzaiu0tpbxR5fKJ+rUG9RrW0gQlt5hh0iVw8qMLbq/kSS11UWOiEG75pZ
X-Gm-Gg: ASbGnctixoB5KV8ggCfKNdTZprTTdfia9FzqkoswEdN4hijYbLlqZydg3KR3/moSxz/
	NW4ygHA1TkodDyswgASpoCq3CTeE31sGij+CpnTyOB4lHfOGz1VJGAtZ3LiPCjzvm97dFojicG6
	ChJwKMWlqS9uYc2pp0savgxh3kmNNntmBZCo7GAi8TLRhhVFZQfV/Wqi6IMdOT1gbeQLBc1vL4J
	q6u48KFxkYbD5ckz4ClcWij2TWuQc84ig4xHCXAvpWd3GeLfmv3wqbNzWPcXQvnjnHqU33APU56
	dxX3EdOEBUBSqDOvv7EjIDk313CaxPioVsJ1oJj/n0R77/2i7ALI+r8B84LqmFUsgkkE8i2cOxr
	fMs8dwegDzwyYbOGbBKwFx4SHTHVxFT9sgJQoc5Urp2YtWXZHKGP2b2/MAbYw
X-Google-Smtp-Source: AGHT+IGLnhLc+85W8owZdOh7XwNLQcGE2xXp77/E+SXCQFiMg28WkivDwqcw/hHJZAIEILR91tdWrQ==
X-Received: by 2002:a05:6102:809e:b0:50a:530f:baad with SMTP id ada2fe7eead31-5126cd388cdmr5032717137.13.1755525507193;
        Mon, 18 Aug 2025 06:58:27 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5127d4dc422sm2026687137.6.2025.08.18.06.58.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Aug 2025 06:58:27 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-89021b256eeso971823241.1;
        Mon, 18 Aug 2025 06:58:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV6vfugWBAIvDO3CfJjfmOdmvo+9zu4ZfETRfJonfwamEDYTOrcdzomUv39p0HsgyZghB/l2+w+hKdG@vger.kernel.org, AJvYcCVlkLlkkwC9DPiwxr4s9JKSoA8aVJ/OD6ubHob0HGbHRFZ0N1HxOoFByMv0kASp/XmXCr+7zwlgoE1O7wew@vger.kernel.org, AJvYcCVvg9SVq5LepxDCn+PSeMchz4P3p/+0kJGboh2HTi8w3uwXmLGwB7OgR2kzcsjA4eRE56iPy9esdiOi8VkjCae5UNE=@vger.kernel.org
X-Received: by 2002:a05:6102:2911:b0:4f6:25ca:e797 with SMTP id
 ada2fe7eead31-5126d8dcd68mr3610886137.25.1755525506566; Mon, 18 Aug 2025
 06:58:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812200344.3253781-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250812200344.3253781-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdX=8rdWHyTpUmreOy5Nf-kiAoQMVakU051AyC2BoVP8vA@mail.gmail.com> <CA+V-a8tk8FJoynigy0JSWbb7x-BOjUEuzC9fYY0wC+GQKCRiBA@mail.gmail.com>
In-Reply-To: <CA+V-a8tk8FJoynigy0JSWbb7x-BOjUEuzC9fYY0wC+GQKCRiBA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 18 Aug 2025 15:58:15 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVG4EUkEL18ugJAyoKDnoy=8Wzkw5hrwSJMqLkuoH09cQ@mail.gmail.com>
X-Gm-Features: Ac12FXwTBblVBQX_UscO6NJ4rEO0w4zfYRKGXgyDshWqIwj6XIqRWHLY2icOQZs
Message-ID: <CAMuHMdVG4EUkEL18ugJAyoKDnoy=8Wzkw5hrwSJMqLkuoH09cQ@mail.gmail.com>
Subject: Re: [PATCH 04/13] arm64: dts: renesas: r9a09g087: Add pinctrl node
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Mon, 18 Aug 2025 at 15:44, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Mon, Aug 18, 2025 at 2:34=E2=80=AFPM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Tue, 12 Aug 2025 at 22:03, Prabhakar <prabhakar.csengg@gmail.com> wr=
ote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Add pinctrl node to RZ/N2H ("R9A09G087") SoC DTSI.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com=
>
> >
> > Thanks for your patch!
> >
> > > --- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
> > > @@ -5,6 +5,17 @@
> > >   * Copyright (C) 2025 Renesas Electronics Corp.
> > >   */
> > >
> > > +#define RZN2H_PINS_PER_PORT    8
> > > +
> > > +/*
> > > + * Create the pin index from its bank and position numbers and store=
 in
> > > + * the upper 16 bits the alternate function identifier
> > > + */
> > > +#define RZN2H_PORT_PINMUX(b, p, f)     ((b) * RZN2H_PINS_PER_PORT + =
(p) | ((f) << 16))
> > > +
> > > +/* Convert a port and pin label to its global pin index */
> > > +#define RZN2H_GPIO(port, pin)  ((port) * RZN2H_PINS_PER_PORT + (pin)=
)
> >
> > Shouldn't this be in a header file under include/dt-bindings/pinctrl/?
>
> Agreed, theT2H related macros are used in the driver whereas the above
> aren't. In the past DT maintainers opposed including such headers
> which aren't used in the DT and drivers. Hence I choose this approach.
> Please let me know if you want me to move this into a header file
> under dt-bindings.

We need to share the definitions between DT sources and DT overlay
sources, so that sounds like a convincing argument for a header file
to me.

Now, as RZT2H_PORT_PINMUX() must be identical to RZN2H_PORT_PINMUX(),
this could be the existing
<dt-bindings/pinctrl/renesas,r9a09g077-pinctrl.h> file
(cfr. my comment on [PATCH 07/13]).

> > Else you have to duplicate these definitions in DT overlays.

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

