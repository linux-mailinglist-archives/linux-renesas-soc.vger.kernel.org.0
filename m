Return-Path: <linux-renesas-soc+bounces-16043-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49123A8B250
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Apr 2025 09:37:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 50357176136
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Apr 2025 07:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B18B22D4D0;
	Wed, 16 Apr 2025 07:37:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACE322B8AF;
	Wed, 16 Apr 2025 07:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744789045; cv=none; b=TqYWLRrWKF6piPf/nEygWvp5orAhnMYALBYWmcK+K5yh4uew/XTVxQTqL+HcJx33GY+50S92Q7uwfS4bTd8vaXPzmGrWUifxyS3azGOMzksKBuUz09+OCFUacKex7lczFrpXM/a2TmVqVNaZIoX70bUyd4EL5eleIQmdZGbxB/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744789045; c=relaxed/simple;
	bh=oGodWPuUb5+MnGToBbtDq5Xpwb8zsCN7+byc82DrjYk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=C1SwP41M787cW9o7+/BdBGwuCkxIrGyuoWDiAEwLYfLPVMj/LxO7oJ1BmNmhHwiV7pCE81bKpnmzevit8m68TGJam7j/eNZB/LR/YGZy1owmVGrcRVHdNu81/zSm0giEPla5Q7Y5xaeIPhSclTdEs/+URo0Qs8Yui9LhLkSSnyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-86715793b1fso2508378241.0;
        Wed, 16 Apr 2025 00:37:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744789041; x=1745393841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2AaYCWwqfJc5zQMIS4PXsP90RkF2Rh7XV6isLc25jDU=;
        b=vMiRHJ0bwATQIF4B8aGOI9xmeoWCNhR3uQ1M5EIDU1z+cQpxAp/sm+JRR+mvJ2i4og
         eyWd+e1L5sKGyH7fYzbdokLl0TnZMwvMrtkK3zoqrL2Rr16elZQYXOPIoPQ4QH/ZX9h1
         NZFfKfhnIwjp/DKf8qvz3iHOozVVYI2aqy0gtsBDcGudJ3ffdzsToSA4pObERP2y5rgl
         oVVjPnXBAhBnovN1jWa3u4+WozxOeKbL5eTOaHk2xMlsyjm1WwBFRcQaI/fhFm5h+I5U
         cKtC7ApTaEYlA5uQHWp6W4tQMXYJKjPbr9w5U2Ht8WHmcirKXv3GUQ/is+bajPQvnxSv
         sfOg==
X-Forwarded-Encrypted: i=1; AJvYcCUEOrQj8v9bxEEOsWZ6LepHn4xRoYHMjtjs+fnfcoGX19CbLk4gmJjYshJHVjTrH4Nu235EaGmik9sVJKg7GWK0Reo=@vger.kernel.org, AJvYcCWBOmqw+w0OuceayvyjEEvrcX1qZOXLMAPFKD5YB/9aF9YJA5OcKX/QlSo4S4cm4lvVl2dNT9FxJw643yEx@vger.kernel.org, AJvYcCWXqCuC9fheDDxVYPGNa+Mf2BWpzqt5pbpxBRFVYsS55jagafvprR63wB+4etYx0yr7vOurRtKgytq1@vger.kernel.org, AJvYcCXaP5JrlA1s4QmhSpjmKYqsthh+8yzbK1VnAN77n5xPYeVdPy0ftUN4iYD7a2V+YsuiMTaRdCp7ngtU@vger.kernel.org
X-Gm-Message-State: AOJu0YwUIVEnp+W++sqtDhN3ICov81oQKWFubmthPL2ET8FX6QAgNQ4u
	giyDjx4Tw//DACBq3qa6eKpkSG5bMIVZv0Jhdq5k3zbU0zlizkLfQ9LuArzS
X-Gm-Gg: ASbGncu3obKWVmalrC8iLC5m0c/gWJRYTgMuzg6TX3AqrP/5t7qlqOMPcvVziJQuI7t
	JScz7aophvenOsAoE2SePiEFZtD0uZfGJ7Opg/3/IqxzXXQT4Eq0jC46PTbEVC4E91KN5cyYKmF
	dPtCMg5XARfqG4XJa8YfawEGaePDkkmKHCCdN9mVV2wYXM7VizuoA3Z0MLUr88tF8bEKBt2KaVb
	k9nbpiYQNVCl0+9VXOMDkmSiAk4OBxwYT1la3KfsT5mimQJXoe7/zfsWacPoqw7kNIqQMS2pooh
	BX3yn9CGfBo75dNLCI/O+WL47A9k26XS2V4LYU5lB0ohCzjR2+5SHq0JvEh0NjxH1yIhjy0hr5f
	nd27blYw=
X-Google-Smtp-Source: AGHT+IFMBo+Qq0LRXY49Rmg73p9OJkNoE1G2IsGCJUfZmD2i2ZxEv5+kFfMpZ/b4+bXtdYjraWORRQ==
X-Received: by 2002:a67:f094:0:b0:4c4:dead:59a3 with SMTP id ada2fe7eead31-4cb591aeccdmr188559137.2.1744789041360;
        Wed, 16 Apr 2025 00:37:21 -0700 (PDT)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com. [209.85.221.177])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-87555547509sm3176098241.0.2025.04.16.00.37.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 00:37:21 -0700 (PDT)
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-523d8c024dfso2491998e0c.3;
        Wed, 16 Apr 2025 00:37:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUM+6s4vFnRjdKdefjd4H9AaMRP3R7OTcnxt8q9gpY8RWl5NsAoEcMmTkZ11aro33x2frMGlh24ApHc@vger.kernel.org, AJvYcCV5Vw6DolqhYSFwEKFynHMaRGAXJRCC66Gb3HoIThetHDu3McFfGH/PfltEyAzhBJeUjLuiAyHlQQE7rSVQAkmvpzo=@vger.kernel.org, AJvYcCWObDTWL8hlnAHNtOdJ7ddEGNPgXy9pciNfqknPY6u8/OMoH+UK5oy43LfLxIuWnKUBR1segFofiaQr@vger.kernel.org, AJvYcCXfLmFMeMTltE3S2BMDdu2c3y4T7GWKDWyoIyXoDpjHFLQxXcLkm8h3ESRu6z5dEfJ2eyeBJnFAvu90RWMW@vger.kernel.org
X-Received: by 2002:a05:6122:20a3:b0:520:61ee:c815 with SMTP id
 71dfb90a1353d-5290e20a1a6mr224554e0c.10.1744789040901; Wed, 16 Apr 2025
 00:37:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407165202.197570-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250407165202.197570-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdXDDBS1POX3AmvTLWBbYcpXjnZm6sNqRpKfghF4uPGsUA@mail.gmail.com> <CA+V-a8uSB62TSxgcGTaWbfkPsNOmxZmO31jH3TREE6g2HHtcXA@mail.gmail.com>
In-Reply-To: <CA+V-a8uSB62TSxgcGTaWbfkPsNOmxZmO31jH3TREE6g2HHtcXA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 16 Apr 2025 09:37:07 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVXjs75gVEfS3WMtvtywP_m7wWaf2HQKCwkJZqX4T5M8w@mail.gmail.com>
X-Gm-Features: ATxdqUHfLWZozTEbKvWHo6ddKkD-_L7IeLSAvaYLwHnDrViN4zVvtP7UkamFSY8
Message-ID: <CAMuHMdVXjs75gVEfS3WMtvtywP_m7wWaf2HQKCwkJZqX4T5M8w@mail.gmail.com>
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

On Tue, 15 Apr 2025 at 21:25, Lad, Prabhakar <prabhakar.csengg@gmail.com> w=
rote:
> On Tue, Apr 15, 2025 at 3:37=E2=80=AFPM Geert Uytterhoeven <geert@linux-m=
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
> >
> > Thanks for your patch!
> >
> > > --- a/drivers/clk/renesas/r9a09g057-cpg.c
> > > +++ b/drivers/clk/renesas/r9a09g057-cpg.c
> >
> > > @@ -78,6 +87,19 @@ static const struct clk_div_table dtable_2_64[] =
=3D {
> > >         {0, 0},
> > >  };
> > >
> > > +static const struct clk_div_table dtable_2_100[] =3D {
> > > +       {0, 2},
> > > +       {1, 10},
> > > +       {2, 100},
> > > +       {0, 0},
> > > +};
> > > +
> > > +/* Mux clock tables */
> > > +static const char * const smux2_gbe0_rxclk[] =3D { ".plleth_gbe0", "=
et0-rxc-rxclk" };
> > > +static const char * const smux2_gbe0_txclk[] =3D { ".plleth_gbe0", "=
et0-txc-txclk" };
> > > +static const char * const smux2_gbe1_rxclk[] =3D { ".plleth_gbe1", "=
et1-rxc-rxclk" };
> > > +static const char * const smux2_gbe1_txclk[] =3D { ".plleth_gbe1", "=
et1-txc-txclk" };
> >
> > The "et[01]-[rt]xc-[rt]xclk" clocks are not created by this driver.
> > IIUIC, they are actually Ethernet PHY signals.
> > How is this supposed to work?
> >
> My intention was to add support for PHY drivers to provide the clocks
> and hook them up accordingly. Currently, for the RX clocks, we get a
> rate of 0 since they are external.

So the link would not be provided by DT?
If these clocks are inputs to the clock controller, they should be
listed in the clock controller's clock{,-name}s' properties...

> I haven=E2=80=99t written a prototype yet for the PHY driver to provide t=
he
> clocks, but the plan is to get the initial pieces in place and then
> extend support for that.
>
> Is my understanding correct that the PHY should provide the clocks? Or
> would you suggest a different approach?

The Static Mux Control Registers (CPG_SSEL[01]) registers treat them as
clock inputs.  However, Figure 6.3-1 ("Block Diagram of the Ethernet
Interface") shows the TX clocks are bidirectional, so they can be used
as either inputs or outputs?  On RGMII[1], RXC is an input (PHY-to-MAC),
while TXC is an output (MAC-to-PHY).

I'm a bit lost on how this works, and how to model and handle this...

[1] https://en.wikipedia.org/wiki/Media-independent_interface#Reduced_gigab=
it_media-independent_interface

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

