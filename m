Return-Path: <linux-renesas-soc+bounces-23625-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC89C0D242
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 12:24:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 491B118938AE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Oct 2025 11:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FEF82E613B;
	Mon, 27 Oct 2025 11:23:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B56323ABA9
	for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Oct 2025 11:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761564197; cv=none; b=Dh6lIwSvvPMyh5/DonvBHF54O5pwtHhYCxv5DpMWxXBJaXp628lDmcoVd3/8R70/KacEK0t1/mzD3CNKf+CLLTRm75ebD9yRkB6welhcwGSwS4Y/1fiBvQ9gPMUSRefKezAER9a1ySfSbefXSDN7ZYoXU3f3RB1ojglAZnZS5Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761564197; c=relaxed/simple;
	bh=LCFinbYaaa5T1vbOy/YjHc9/jV/eLUmsdTmf3uq5Qlk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jO4ukzNkFujAMjywNpFGqb4uxx0dJdSuGXYRg6QOkkIM4NnH7ZxSxEiczLPB16jJTQ+H7Uiu0ELTYuzgr8UgutSfJsyM/zxGsW3uL3hUqeqoI0Qc2mnkBuxvcApCFNatM1Cj9gE2Wf+XD+xJmul13VB62BbrfCdodU1PGOIHO3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-932cf836259so1853921241.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Oct 2025 04:23:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761564194; x=1762168994;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HgNtIcnn6eENaUFz3K0ARDS/soEXQSArUyONWZnfjlQ=;
        b=tkF5g0pgQfqvORGiDeGGtZdspsOb5YwKSsHAEreos5otpuDE70n2IJQUB2c8IqPZUB
         0D/FWjh1MDZnTjD4N4eBuaVG9DsMVUp1J73/fnzWJs+OOkRHWYkmYKiJDONuhi1f6lzL
         +/Jpoj+Jje39YQduM0/crcfmDMGOZBtuivn4CCzWNldcE253CkuE7BXL0E0zwmWMKaqH
         8Hxq0LHz2cCDLC5tJUCg+Oh7XycpYRzGFww5M8mnMuocQF3isrmcoxAbzrJXpKeRfjek
         sDbLCSRxp/3+ypZZpPEfrIEfGXX9g/2YUEPRNJnHdOGdhP3d9e5b5aFFDDVwxRmcWEAO
         SC7A==
X-Forwarded-Encrypted: i=1; AJvYcCWMZXYALBgreqgwsSw/cRuSsXyP+KfGL5Ac16rmOsZTz4jIxSK8GjKFNFqpJQmxHCB7kIwwlKwvjs6fI6nBIga+VA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxD0dG9znq9JXObQ9XURAE0leTgTJOT8yGTvchaZ5BXuNSJd7sB
	UALIgHITIQ4ibZgKSIfkFu2RUhJhiBi+amJIIHNVEnmZeGuocKj5C7rH0WR1c5bH
X-Gm-Gg: ASbGncs6FFOXto3LJQqigd+bx5LzS4eG5udKlcEyQr5mBhV3cKVt30sjarekHHWgDzA
	ozeJu4A7n4eI0TFqn4drA9qYDQwqeRjXVechkG9lKpXcVjXFQzr4BZZP5BoDy5yY/pahGtqi9jz
	57JZpmM6Dyi9rskhlDv1mkVK18gs2JzFw+o6PG8q8FvsLPNZfrTsUwAFI+Xwf+5RzH/8RMsYev0
	wFXKRdpS/TryI3G2tYzN7X8MPSZU5BWA7+llUWw7FPiww8yls/tdxSGdfh5iySc5d8xi+DF8+Ub
	G5GzUzZGgJviFKlJIrcFnftlD+SwQRQT3jBCBsokiSaa7ApYyb1GZxG++maRunmm+jQaJdtFXj6
	qhT9XOZ9B0yVuaa6Uq08OqZOGVDgX62Nhow3XgNpsGspQzMr51ku1lGAnJOggXUBNkw0F0sq/6M
	6VRWjqQh7VPlVDEoPsrgqGkYPBejV9T6MWS02r0L32ZfBaDS66oEqbX08feBU=
X-Google-Smtp-Source: AGHT+IEQATpKeH7x+T99R7PyZxn3lgDhU6FzJY7Q/6n+/x7uCqcwVys+17IA4WOa+a/POtCr5SvjLQ==
X-Received: by 2002:a05:6122:1793:b0:54a:a178:3c9f with SMTP id 71dfb90a1353d-557bf23fd06mr4249817e0c.15.1761564193968;
        Mon, 27 Oct 2025 04:23:13 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-557ddb2f98asm2732366e0c.10.2025.10.27.04.23.13
        for <linux-renesas-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 04:23:13 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-9231a251c01so2392176241.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Oct 2025 04:23:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWKRJ+gGS35zrjk1osJBoQWRaiZXJ9a21Lj3c7oADIhzLdej6bVjYt5/ovH/CdctGdZg5Ty/1O7HQvdtyGRt8QVhg==@vger.kernel.org
X-Received: by 2002:a05:6102:2921:b0:59d:458d:b629 with SMTP id
 ada2fe7eead31-5db2e58fe50mr3946640137.30.1761564193435; Mon, 27 Oct 2025
 04:23:13 -0700 (PDT)
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
Date: Mon, 27 Oct 2025 12:23:01 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVrfVP1XZbQVNwEEP8L69mVzNN2yLSjNyHO7o2zqBuY0w@mail.gmail.com>
X-Gm-Features: AWmQ_blPQXHDdcv3HEZmR70Xe3WDxqjStucPirJolGtaGc9WMslN79O8Z1NYVMM
Message-ID: <CAMuHMdVrfVP1XZbQVNwEEP8L69mVzNN2yLSjNyHO7o2zqBuY0w@mail.gmail.com>
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

Done:

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787=
:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git
tags/clk-renesas-rzv2h-plldsi-tag

for you to fetch changes up to f864e4b721e386be132cc973eadefe5d52cdfd94:

  clk: renesas: rzv2h: Add support for DSI clocks (2025-10-27 11:58:03 +010=
0)

----------------------------------------------------------------
clk: renesas: rzv2h: Add support for DSI clocks

RZ/V2H Clock Pulse Generator PLLDSI API, shared by clock and MIPI DSI
driver source files.

----------------------------------------------------------------
Lad Prabhakar (3):
      clk: renesas: rzv2h: Add instance field to struct pll
      clk: renesas: rzv2h: Use GENMASK for PLL fields
      clk: renesas: rzv2h: Add support for DSI clocks

 drivers/clk/renesas/rzv2h-cpg.c | 512 ++++++++++++++++++++++++++++++++++++=
+++-
 drivers/clk/renesas/rzv2h-cpg.h |  26 +-
 include/linux/clk/renesas.h     | 145 ++++++++++++
 3 files changed, 672 insertions(+), 11 deletions(-)

> > >   2. I queue patch 4 on top of 1 in renesas-clk for v6.19,

Done.

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
> will need to merge the branch (either branch 1. as prepared by Geert, on
> top of which you can them push patches 5-7 yourself, or a branch you'll
> prepare on top of 1. with patches 5-7).

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

