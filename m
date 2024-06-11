Return-Path: <linux-renesas-soc+bounces-6035-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 110F890332F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Jun 2024 09:03:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5A154B25AC0
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Jun 2024 07:03:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D91F3171E66;
	Tue, 11 Jun 2024 07:03:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A1AB657;
	Tue, 11 Jun 2024 07:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718089432; cv=none; b=aVXKTcGDDtUzgaHp8V2Qnm/kyWee/bvHAre3XNa8/SKu7JTSvH4ccnM2XApTiGvcWJj1o67bOhp4lH523jADlPQ5usGgpw6ipWqluLU/7Sr2ufBGyf7uWv+Tn5nsE5Wx2JqUGedS9jP0OMQnbj9O1o1kVqlEU9o9P6XrPO7mjTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718089432; c=relaxed/simple;
	bh=534zje78Vmh7/8/3gk/F5m97kl9O7VC9jDh6In6iEIY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yv38+bayDLeCR5ES0fMM71inQadSP4TbC7rrR4zGFavWhPKmu+IKmRBPbqXzWiO999wcXTLjNICe/zN6Rd39+3f/WdrZkYYfwxGvxtZFHufs4BZklWR1kTYlc+5vWd00bkXGe6hZg7LrliVkBN/li21/saE9CoRwLrpz0kUD+tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-62a080a171dso54666627b3.0;
        Tue, 11 Jun 2024 00:03:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718089429; x=1718694229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nW56XVygKDEJ/sK4L22c/J11/mN3vlpwHRil5rep5WE=;
        b=m7bi3vptQyyCjYS5nWBljLnUO7Bf+oy1tyb2+MH2pCIjmcSlGfMIaItENvOa+5aEQ6
         QnMB/1Vo0riEnNZOwy8HiovaHxVmFaN1GQ+BJk0ySUqQGkHQuLrVq/EaTU5QzzK3X9V9
         zexTC9SvVmLIEdDEWuq21tvPuLZiNzzsIWtzYf/8rCW3J1q0k4KICgcmsY+EJ/0hK1Il
         4ZJwm0ZXaphS2CNeH3if2HCKKJabWH+yFUPbIFRxo5oyUo/eiPDGfCMj5ln2S3+d2FMk
         iU6h0c47yKONBuhFfU5Wl8/2oll6H5M7k9HGQbcJkKJrI/BBi1fHgv6kHmLga4ksAV7h
         LAOg==
X-Forwarded-Encrypted: i=1; AJvYcCUZ3kSEMe/qcU1vOZmJLvkBP6HEVWghj1lXTrw4ab3plknXqCJP9bXJojusvjRFzpWPgkk7nYxrlYVPuFL82X4ZZgZNhh1xjTDeOFx7Akgpf1FICPjFezIceXKbmMSP8rIjLGrM10//CIEyQvuUY8vUUEvRa0JtM1i6lf6OoCFYYp3bOto98I/4tbMGhSjn55TraKllQirq7JMWnP21x/U3lvSOeOLo
X-Gm-Message-State: AOJu0Yzv8+PHoaYe512tUYilU2Gz5YctJWMJNthnA7WAbjbS+Aiit0Bt
	jJywne7xsAefDjNJJWYWtKni0LdeYCp/sP2MVrdK+ZSPsL9iqZBRfzjlFhRb
X-Google-Smtp-Source: AGHT+IE1tkhRYa3O+NdsAkcFq5KicoFmer6laI9NH7+JvINjkGXBxcHmtNVp17KMR4nlF5uuIlCGBw==
X-Received: by 2002:a81:83c5:0:b0:61b:eb65:4a87 with SMTP id 00721157ae682-62cd56a9ff1mr106826837b3.48.1718089429020;
        Tue, 11 Jun 2024 00:03:49 -0700 (PDT)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com. [209.85.219.170])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-62ccace6713sm19150267b3.38.2024.06.11.00.03.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jun 2024 00:03:48 -0700 (PDT)
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dfa6e0add60so5195533276.3;
        Tue, 11 Jun 2024 00:03:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXWqG66kV/qOW5xF2vDPCdixhDamdmqJpvEekDhA5xqjQwz0G97bOv8Vof/uhFaYnjrq9iclvXRv8qhjHRWoeP630Lj/RpsCGj7MQfWGh3vncoO4pY0k7chk2w32Y1tuy7vGVbU8SYJmmpI7t2eUmemgefm49sDZn3otJqEl4DXUNGhn6w1hmbU41WG7na2yiowe7To56xmSLFYB4xhiPxPK0hluV8X
X-Received: by 2002:a25:aa6d:0:b0:dc6:aebb:168e with SMTP id
 3f1490d57ef6-dfaf64bf568mr11147486276.26.1718089428640; Tue, 11 Jun 2024
 00:03:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240524082800.333991-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240524082800.333991-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdVPZgxsM1OsFt-+802mzajKR6CO8B9ofFzaThKsBAdGTQ@mail.gmail.com> <CA+V-a8tQr8gXxAfRcffP9Bz2dL66+NOYUacKx0nmZd=TTVA9FA@mail.gmail.com>
In-Reply-To: <CA+V-a8tQr8gXxAfRcffP9Bz2dL66+NOYUacKx0nmZd=TTVA9FA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Jun 2024 09:03:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWY7SaL40oiFJ-wSA+x7NNZgE_0Wyj850QhbFz+yWwWTg@mail.gmail.com>
Message-ID: <CAMuHMdWY7SaL40oiFJ-wSA+x7NNZgE_0Wyj850QhbFz+yWwWTg@mail.gmail.com>
Subject: Re: [PATCH 3/4] clk: renesas: Add RZ/V2H CPG core wrapper driver
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Tue, Jun 11, 2024 at 12:03=E2=80=AFAM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Tue, Jun 4, 2024 at 5:01=E2=80=AFPM Geert Uytterhoeven <geert@linux-m6=
8k.org> wrote:
> > On Fri, May 24, 2024 at 10:29=E2=80=AFAM Prabhakar <prabhakar.csengg@gm=
ail.com> wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Add CPG core helper wrapper driver for RZ/V2H SoC.
> >
> > What is a "core helper wrapper"? ;-)
> >
> As this file basically uses core API for clock and reset, I worded the
> commit as such.
>
> > Looking at the structure, this looks like a family-specific clock drive=
r?
> Yes, as the CPG on RZ/V2H varies quite a bit compared to RZ/G2L I have
> introduced a family-specific clock driver
>
> > Will there be more RZ/V2H-alike SoCs?
> >
> I'm not sure about it tbh!

OK, I see we did the same when introducing RZ/G2L support.

> > > --- /dev/null
> > > +++ b/drivers/clk/renesas/rzv2h-cpg.h

> > > +/**
> > > + * struct rzv2h_cpg_info - SoC-specific CPG Description
> > > + *
> > > + * @core_clks: Array of Core Clock definitions
> > > + * @num_core_clks: Number of entries in core_clks[]
> > > + * @num_total_core_clks: Total number of Core Clocks (exported + int=
ernal)
> > > + *
> > > + * @mod_clks: Array of Module Clock definitions
> > > + * @num_mod_clks: Number of entries in mod_clks[]
> > > + * @num_hw_mod_clks: Number of Module Clocks supported by the hardwa=
re
> > > + *
> > > + * @resets: Array of Module Reset definitions
> > > + * @num_resets: Number of entries in resets[]
> > > + *
> > > + * @crit_mod_clks: Array with Module Clock IDs of critical clocks th=
at
> > > + *                 should not be disabled without a knowledgeable dr=
iver
> > > + * @num_crit_mod_clks: Number of entries in crit_mod_clks[]
> > > + * @pll_get_clk1_offset: Function pointer to get PLL CLK1 offset
> > > + * @pll_get_clk2_offset: Function pointer to get PLL CLK2 offset
> > > + */
> > > +struct rzv2h_cpg_info {
> >
> > > +       /* function pointers for PLL information */
> > > +       int (*pll_get_clk1_offset)(int clk);
> > > +       int (*pll_get_clk2_offset)(int clk);
> >
> > Why are these function pointers?

I meant "... and not pointer/len pairs?".

> To get the offsets for PLL CLK1/2. But I plan to drop these and get
> the offset from conf instead.

OK

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

