Return-Path: <linux-renesas-soc+bounces-23471-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 083D7BFFDE7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 10:22:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 11E89189A0FA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 08:22:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 045BD2FCBE1;
	Thu, 23 Oct 2025 08:20:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8472FB619
	for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 08:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761207658; cv=none; b=hxSFvw0aarpz4HX2XvQoL9KLVxYlLeshd9X+g6WrOHMQs8pJvBlG3i9U4NZrTj69b2kwsecYVGu93Y/E8oEkuczzxa87Mt431na8EUXC/GEeEwzPonL+FCElwlLdklg/+243CqE3gaIlQNSxw6xioG0okMQ9w9xJeO0+UFTsLdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761207658; c=relaxed/simple;
	bh=riOWBoniluYmZkJSNiPD51TALJtz2J5b6wiQtNSND7U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o5ahb9X4hqnbDGmh0easHVPhx7Nk8/yqYmbfKzI6Z11HaM4dXIwuLKfKaOGyl2w6KSFy8OGnbeqK59Ug/dJZD3P8n3cY6YbbCj2BPuC2hx6jeUJBUjvvIAOCh7JkGoiiCPkC3EO2rp4Q+lbF1OqHeER9hrGJMxNjiNTRJdeWoDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-54a86cc950dso61127e0c.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 01:20:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761207654; x=1761812454;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ECYIxuT82Q/NafhPkuUWEytQEjZXJcXQfJX7HoJHHBY=;
        b=qjB1/2hgMJs86s66NZPPC/huqQvEmoA2DsrQOvXK1qF7DgDAnmXIx/GJTmM71VSS79
         RkQy3E4AdKGO63wy1/JDfFEgNM4mgxzZDpSwsrSB2pouk2HyDLuVKepuxlomsSq7pehS
         8n6bvuslgr1gkFXU4zlZjUzNXprSluEqdObuLi4M0sMiZa0Lohb7vsmFfsiuKyUOcgLs
         5Zxj3dddl4RgkOYObBBa6q4CseMNfvkvbS8O82uQGrsRD+8Ukdz/XDAVuSV/XG/iWkLN
         PiDwoW44XZlr3nAuzOJTjsK0LScBYA6q0ydA+y6/MtS6MBxJGLZz3LkBnvEjT7OBtay5
         2nkA==
X-Forwarded-Encrypted: i=1; AJvYcCUurtqR6KC9zO3U1SbdXlgw/3kuU0/GWPKJPltH5TM/Xn0wF7v2AkfUQdlo+9+9EZw9S8dhcfBbzyNvgDm0irlRrg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg08eFJXrMCyY7BKlVagBOvui51FeGwAJbh6iLAOSJdI1pCFmG
	AoS/HeXSQRfiiq6OIcQ9ybQk26GiXfgmO60uVn9DzFIWIyKaEnY9xLsI+jeyuOI0
X-Gm-Gg: ASbGncv6kAQ/Q1ofHd7tJLiEu2ArIdu0tyoSr+vXIaLCZcz/fQzNdw6H8PUhAZWf6VA
	vDvZWyYDTPUCynYegvXJFnDvBt3gjmckSYdb3SJnnBd0jYybtxz055ycp2xeGO6a4kB/Svex+r3
	9lvlIJgQyTy6BdUp1k8HkR7hiodijXn/gHNRYH//CTJB+o2rIU07TTAFeffc55N3NKmywpub4W6
	nJuc5lwsZWh5dN0nf4MSTfOpGjno4+Y46771QrJrdud9jY8LqiAHpC8OsdD6st1gkEbp66SYSwp
	o3eKMeIZKbmRw+vPv0MukV94BXxJYk2cceZ3YRrBOPhupN9QZh+g7e0gbg2+QUb7bEP8j34FEqA
	fD+V1n7k+IN9y7d7XZIRC9E9XbRQf4p1qsBPhOcsL0Egh+R1RvKnllR6J74BrUy0zo0BaE581yq
	RIXQ+FMN9L7LrjyyOoOs4mPEyTWsUYkRiCZjO5pA==
X-Google-Smtp-Source: AGHT+IGVC7dlAVyZn+soLZ+epRsFU6BJFokP8zEnsPztqznn1deVNtm0dgfIa+F4A4s1DzusfMUYRg==
X-Received: by 2002:a05:6122:e1d9:b0:556:95a1:1a44 with SMTP id 71dfb90a1353d-55695a11cc7mr1547585e0c.13.1761207653547;
        Thu, 23 Oct 2025 01:20:53 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-557bd8e11a3sm547953e0c.10.2025.10.23.01.20.52
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Oct 2025 01:20:52 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5db2d2030bbso220184137.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Oct 2025 01:20:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWmMh5MRqwm633yyScJ+ClFk0DiELpTKvRK40n1iW1G3MiUyMYFbEkTHH8y+n/9xMe0tPBAF/fBzmWXyKzaW91iyA==@vger.kernel.org
X-Received: by 2002:a05:6102:5110:b0:5db:27e9:933e with SMTP id
 ada2fe7eead31-5db27e9988cmr1196188137.38.1761207652096; Thu, 23 Oct 2025
 01:20:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015192611.241920-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdW1B7Yk1hUU9MSJsiL8wSmjAUGN7Qd_wgBHv8Ct=-wi4Q@mail.gmail.com>
 <CA+V-a8uY11uWoQ_en5QC=W4HPHRwT6rKQQJ-knT8Gi-+czm05w@mail.gmail.com> <20251021184502.GD19043@pendragon.ideasonboard.com>
In-Reply-To: <20251021184502.GD19043@pendragon.ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Oct 2025 10:20:41 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUU-2ugmA-VcRuYOsriUKtAEQXmWEwJSwuCsSTa3ySTZg@mail.gmail.com>
X-Gm-Features: AS18NWACo5Ab6gaObSrlb5u0ift86EnuHySc5nm6Ey8p5bDoFaPy9DC0cq8vSBg
Message-ID: <CAMuHMdUU-2ugmA-VcRuYOsriUKtAEQXmWEwJSwuCsSTa3ySTZg@mail.gmail.com>
Subject: Re: [PATCH v11 0/7] Add support for DU/DSI clocks and DSI driver
 support for the Renesas RZ/V2H(P) SoC
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Laurent,

On Tue, 21 Oct 2025 at 20:45, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
> On Tue, Oct 21, 2025 at 07:26:49PM +0100, Lad, Prabhakar wrote:
> > On Tue, Oct 21, 2025 at 11:26=E2=80=AFAM Geert Uytterhoeven wrote:
> > > On Wed, 15 Oct 2025 at 21:26, Prabhakar <prabhakar.csengg@gmail.com> =
wrote:
> > > > This patch series adds DU/DSI clocks and provides support for the
> > > > MIPI DSI interface on the RZ/V2H(P) SoC.
> > > >
> > > > v10->v11:
> > > > - Split CPG_PLL_CLK1_K/M/PDIV macro change into separate patch
> > > > - Updated rzv2h_cpg_plldsi_div_determine_rate()
> > > >   while iterating over the divider table
> > > > - Added Acked-by tag from Tomi for patch 2/7 and 3/7
> > > > - Added Reviewed-by tag from Geert for patch 2/7 and 3/7
> > >
> > > I think this series is ready for merging.
> >
> > \o/
> >
> > > > Lad Prabhakar (7):
> > > >   clk: renesas: rzv2h-cpg: Add instance field to struct pll
> > > >   clk: renesas: rzv2h-cpg: Use GENMASK for PLL fields
> > > >   clk: renesas: rzv2h-cpg: Add support for DSI clocks
> > > >   clk: renesas: r9a09g057: Add clock and reset entries for DSI and =
LCDC
> > > >   dt-bindings: display: bridge: renesas,dsi: Document RZ/V2H(P) and
> > > >     RZ/V2N
> > > >   drm: renesas: rz-du: mipi_dsi: Add LPCLK clock support
> > > >   drm: renesas: rz-du: mipi_dsi: Add support for RZ/V2H(P) SoC
> > >
> > > As this touches both clk and drm, let's discuss the merge strategy.
> > > My proposal:
> > >   1. I queue patches 1-3 in an immutable branch with a signed tag,
> > >      to be used as a base for the remaining patches,
> > >   2. I queue patch 4 on top of 1 in renesas-clk for v6.19,
> > >   3. The DRM people queue patches 5-7 on top of 1.
> > >
> > > Does that sound fine for you?
> > Sounds good to me.
> >
> > Biju/Tomi, are you OK with the above?
>
> The plan seems good to me. Note that you won't be able to push this
> yourself to drm-misc as committers are limited to pushing linear
> branches. We need an ack from the drm-misc maintainers, and one of them

Do you mean new commits must be in a single branch, or drm-misc
itself must be linear? In case of the former, 5-7 can be applied on top of
my immutable branch, without involving a merge?

> will need to merge the branch (either branch 1. as prepared by Geert, on
> top of which you can them push patches 5-7 yourself, or a branch you'll
> prepare on top of 1. with patches 5-7).

Note that another change to include/linux/clk/renesas.h,
and thus a dependency of drm on clk, is coming in
"[PATCH v3 0/2] Remove hard coded values for MIPI-DSI"
https://lore.kernel.org/20251022235903.1091453-1-chris.brandt@renesas.com

Would it be worthwhile to wait on/speed up review of the latter?
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

