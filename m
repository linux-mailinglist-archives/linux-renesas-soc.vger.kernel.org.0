Return-Path: <linux-renesas-soc+bounces-7319-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC6D92FF42
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jul 2024 19:14:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67042287234
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Jul 2024 17:14:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A6AB17838F;
	Fri, 12 Jul 2024 17:11:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C54A176ABA;
	Fri, 12 Jul 2024 17:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720804314; cv=none; b=k1csL7gvAhsPDWF0XYzZSSVxmoPDHQPj3WF5YvDRH61Nh6kWZLQ/DcuPJLj+SkMIp6umJxSNzyxPFG4rzNypqXrdwJ7ekVdpM3DJLg17D1ERLcdk66ZlXoet3jRBv8YKS/NdDvEckuT/S+QQssWdBWMHfmUBwJkb9i+m8p37Q+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720804314; c=relaxed/simple;
	bh=ToX8IFguKI6AuYIu5THsWwJhz6qwI3H0hiFjFo2ZBhU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O4UyBBpGz17T2bYut6pyIMYKAKq4cmQkaCzk6NxpsbMXOl8dRg2+v49ucW0+h1bfLpGsqWGR+gyXXk6Et3tQt+r7Y0S+npkqDRFgzN1jHMuWC+CSA90egoqF5x6xr3HNd/tC6jVTty3ArDeEBJGgmpTqhIQifYPU2Tox6nSmscQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e03a17a50a9so2432306276.1;
        Fri, 12 Jul 2024 10:11:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720804311; x=1721409111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/nkm6YLkplxvAGXzVBdoGkR8cn0AreohBASNrv2JryM=;
        b=W60o/9zDv5jHa9dYyLfte0gmQTMUE2xpqh+A4BjwDgpy9Lya4if9Cg29LD/alo+ccM
         dOusYt0tA43xW43az0a2nLwb0+mBxuBvGJTDQVf5SrjlInx8mTyMK2peUDVb0Wb65Htk
         +KKsv1LjojGljZHiaYxA9CrifrgLA0hhjMhRvMFMif6HHeeiYkogsh86kXTQwPBYubCV
         8KypJXNTMrVnYA0k8dccQhWs66Udrl1RLsjkvkH01Ro2s0miPmh63VOrJiVKHi262Dg8
         A918EbA2P+9wzAB9L0Ga1KIZ1a+evLkd2JygFa/snDGVQG6VXtTIpRZ6b+8vYhDb4Khu
         FqSA==
X-Forwarded-Encrypted: i=1; AJvYcCW3/QKQmqJeC4DxhTMbw0DjohSKxZh3mFY792UVCVtMgsv2jSsbBBGdgjaqFbThIkKRtb/SDBalvsCQVgV2VLsaThme0x5hgdF3BxjnGj/mbX22JYASB1s3/LO9QP4oWCDoPEldqNsmXJyulqRGyJ4Ziu8A2B+wI1oj3vVKr63cnsePa/U6lZzEP6z0ncr0OBZK3IaVeMUo63oyZG38H3FG0+8PncE9
X-Gm-Message-State: AOJu0Yw/djsJy9fmV95FETkrrMeueWMNxKqmxzRV13whSiujGSMg/Exc
	mdX/0RsdlocpDg6YpK2b1QLc/RHEEGuLeYCtFXchdPYd9cOYjDEOr6jXBKQA
X-Google-Smtp-Source: AGHT+IE91bI4TtQdMlMmUqo/ujIqZ+GzMKeXKzadtp6pU+2IDLsOLZjp+hanPxXO5E0PjRrrzWkOhA==
X-Received: by 2002:a05:690c:3403:b0:631:2dc5:34ef with SMTP id 00721157ae682-658ee790bb1mr151417827b3.2.1720804310680;
        Fri, 12 Jul 2024 10:11:50 -0700 (PDT)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-658e4d2a8d9sm15669467b3.34.2024.07.12.10.11.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Jul 2024 10:11:50 -0700 (PDT)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-650469f59d7so23285087b3.2;
        Fri, 12 Jul 2024 10:11:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXs33hHv7wvlPb7RJrdsWfGefTKb3OV7yHSZkJv6bfV5Lxzt0ndbZ3KU/7Qje/K6Uy0Ul9OoHVl94C/nDz7ZkHmvzcK6qaGJutQXgqcYLzaTScbcKgIndG401BRr0Hbig/rKUBjdoqDoWME0ztn0cw/zZozxfqjNuWdX7vHmVAk3wUGni2aU/fhB8vmwi/jdQIjjrxG9iL2hhMAeyPHpVOla5AY/sQ9
X-Received: by 2002:a81:84cc:0:b0:627:de70:f2f8 with SMTP id
 00721157ae682-658eed5e08fmr121918067b3.14.1720804309901; Fri, 12 Jul 2024
 10:11:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240627161315.98143-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240627161315.98143-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdVLSpaUtdXFv3VXFc5G61dmRX2C1iW9C+km23g6EgZJOg@mail.gmail.com>
 <CA+V-a8vABF6vg+J7DAGzgnw8612oe6VfJkc5y-krySvnpAnPkQ@mail.gmail.com>
 <CAMuHMdXuyQZ=SFfQa5kvZTwYa0uRXc7khJ-vOYBRE5SCd11rPw@mail.gmail.com> <CA+V-a8ui9AKDOZzg_dgPXeGhGE-+rBHU8O1tpdb8w8myo-1p5Q@mail.gmail.com>
In-Reply-To: <CA+V-a8ui9AKDOZzg_dgPXeGhGE-+rBHU8O1tpdb8w8myo-1p5Q@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 12 Jul 2024 19:11:38 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVyqBmipMLeYd0nw3kEHwc=RvWJvrD8EYKVt+36E7oS+A@mail.gmail.com>
Message-ID: <CAMuHMdVyqBmipMLeYd0nw3kEHwc=RvWJvrD8EYKVt+36E7oS+A@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] clk: renesas: Add family-specific clock driver for RZ/V2H(P)
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Prabhakar,

On Fri, Jul 12, 2024 at 5:29=E2=80=AFPM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
> On Fri, Jul 12, 2024 at 4:23=E2=80=AFPM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > On Fri, Jul 12, 2024 at 5:14=E2=80=AFPM Lad, Prabhakar
> > <prabhakar.csengg@gmail.com> wrote:
> > > On Fri, Jul 12, 2024 at 12:59=E2=80=AFPM Geert Uytterhoeven
> > > > On Thu, Jun 27, 2024 at 6:14=E2=80=AFPM Prabhakar <prabhakar.csengg=
@gmail.com> wrote:
> > > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > >
> > > > > Add family-specific clock driver for RZ/V2H(P) SoCs.
> > > > >
> > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas=
.com>
> > > > > ---
> > > > > v2->v3
> > > > > - Dropped num_hw_resets from struct rzv2h_cpg_priv
> > > > > - Dropped range_check for module clocks
> > > > > - Made mon_index to s8 instead of u8 in struct rzv2h_mod_clk
> > > > > - Added support for critical module clocks with DEF_MOD_CRITICAL
> > > > > - Added check for mon_index in rzv2h_mod_clock_endisable and
> > > > >   rzv2h_mod_clock_is_enabled()
> >
> > > > > --- /dev/null
> > > > > +++ b/drivers/clk/renesas/rzv2h-cpg.h
> >
> > > > > +/**
> > > > > + * struct rzv2h_reset - Reset definitions
> > > > > + *
> > > > > + * @reset_index: reset register index
> > > > > + * @reset_bit: reset bit
> > > > > + * @mon_index: monitor register index
> > > > > + * @mon_bit: monitor bit
> > > > > + */
> > > > > +struct rzv2h_reset {
> > > > > +       u8 reset_index;
> > > > > +       u8 reset_bit;
> > > > > +       u8 mon_index;
> > > > > +       u8 mon_bit;
> > > > > +};
> > > > > +
> > > > > +#define RST_ID(x, y)   ((((x) * 16)) + (y))
> > > > > +
> > > > > +#define DEF_RST_BASE(_id, _resindex, _resbit, _monindex, _monbit=
)      \
> > > > > +       [_id] =3D { \
> > > >
> > > > Indexing by _id means the reset array will be very sparse.  E.g. th=
e
> > > > innocent-looking r9a09g057_resets[] with only a single entry takes
> > > > 600 bytes.
> > > >
> > > > If you do need the full array for indexing, please allocate and
> > > > populate it at runtime.
> > > >
> > > OK, I will use the radix tree for resets (is that OK)?
> >
> > You mean XArray? include/linux/radix-tree.h has:
> >
> >     /* Keep unconverted code working */
> >     #define radix_tree_root         xarray
> >     #define radix_tree_node         xa_node
> >
> Yes, I meant the above.
>
> > Given a single xa_node is already 576 bytes, just allocating the full
> > linear reset array at runtime is probably better.
> >
> Agreed, I will create a linear reset array and loop through the array
> based on reset index and reset bit to match with id whenever required.

With a full allocated linear reset array you do not need to loop,
but you can just index it by the reset ID??

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

