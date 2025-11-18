Return-Path: <linux-renesas-soc+bounces-24708-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id F0F4FC690AC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 12:21:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DE11B34D400
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Nov 2025 11:21:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1850E34FF68;
	Tue, 18 Nov 2025 11:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fzJQNUOv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85EC34F259
	for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Nov 2025 11:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763464903; cv=none; b=e9x2ZxWHLmo6phX20lwvnfI8LARnUmHgwgK/KP3YR6BG/mtnZLxtVnR7SV4HiW/ZXJmMALFB/dQzzO4Ddtru2Ihpkt14SGHZihY6HLzmFWXq/8k885zkxkr3G01I93sGmEzFBxeLXIm6Pww/EVELdLidV732J38H6mB5zti0pDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763464903; c=relaxed/simple;
	bh=EuhxRA+knsyPVuJt7F4wqQw9y3Vk4rK+C1Og9Af4F84=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e9BWOGgDLXkvbFPWcoGT/iRVxxyLLF63gJL1zc9ieh+y2JY7Er7Y1LiQtSweLpeqFcCheskzD0s56eVfZozAEzQ4D3mvtXxtjmxD+gYOmvGYUfDQeEsUfmCkOvfxalpNOFvsIEhh0C42uYC1QSG5Y66BxmcRVh/7Fzt1cqc0dpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fzJQNUOv; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42b3c965cc4so2754064f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Nov 2025 03:21:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763464899; x=1764069699; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N4adjp1n4HMnqOgVZgrtwuRwqjyLZVjTGk78K7r+qec=;
        b=fzJQNUOvtv8CHTbpiVWXmtPbyklUgz4em8fHHyqSiz7WAmqKujoNQw/5/YBw3697KQ
         kciYsGTzEjX++uwNmHD2YRmbu7PQwYIY4FanjrP79h25cNnfjU9dWqSVUJDFIgFOQgJC
         pAzOGT6P46nMrUuuTkWM9sKqsJnGC7oDW/dnaWcr5Udw0I3Cv6qSXLy34qZRBfjxg568
         maXwrLq3bxSvpM9sjgm/u08016Q2wOPyTsReB8kpZE8lKDgA1yhn1wcibLXzxxXGQuw2
         L6htTbciGjI4Ijox1YZccQn+1PnwOIAeigDQI8GT0I5Xnrqh5PUCKDb75AxY2Bm20SFS
         QPgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763464899; x=1764069699;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N4adjp1n4HMnqOgVZgrtwuRwqjyLZVjTGk78K7r+qec=;
        b=t0W3NS3KNrOthpD2cy1Th2bNhDOMxt71QsJnTzltLhwrwKhHveuoVRpIHW4ba7CiDe
         ivB3OTo/PiYSdVspio5ywliUC6UhfOg3K0qyJClQ6sfZOn0sDIvsw63In0P/ANqDe7qy
         PqwIgN72M7Zf25crW9UULAxr5KyMayMdWzIhL7ZGK1IbARUcpI5VN8Q6YbETAwQIlz87
         LgkjpyOrt2C2KZUau3LTMIQsTD58cl2gCwiKP4nuUt4I0kRcReQbQtXxSK7r6875IZJW
         nmgA+HxGAqN9bWAEEOGv/67mERIR2YaHfILMJvOxvWP1Ch7eul5h6wAh7rdRNhoxryx6
         R41g==
X-Forwarded-Encrypted: i=1; AJvYcCVOWT52Nzifl6tuMZFwILi3IouzG9oTW9/FyGwdiP1iKDoKNi6jA+h6DI9SuCaRDrJKVXjlHpyPO0Z4SxqXrLLW4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyCwJxpzGlyWEPFxQZFMcKF88YkgiPWcEujf5N+NyWKL2dDIsm
	hcOsFhQj5S/npnWh9wuXAI+b8QlfWeiCEWNyVTWYzlYFULmHAp/TaX3IYt2WyE0lIUmIqcovWZb
	r2+KbU8Y2ywsyIPyL2l3iiqkZFPPPkgY=
X-Gm-Gg: ASbGncsXDDhsMN54BNGq1n4h9PJByJpxsy5NPeM3mrj7h0Pp+6R0NfE9fjGk+6P+j5s
	LVj4NFB2uYJY8OK7SmZf+pmFTfx9O08Rtdxxs10TnoNUb/L3GPaHmnsUFUfdeIgVDt39+4Q4QLt
	J8/k1KbXgvsNER3zih6RWSWMFMR/DqK40yNhVVrQNNMdrSZb32ZH2wup4WUetzliPL8p2ZhGuaO
	ybBxBP6GgqarNR71V9gpuBMjnuy2t/5ifzoGH8T+hRimUsr7mVVFZ6mnRuKPgfPYfKJWz9iO2yw
	6LfJIAFeBVKR+vxmP8b/RqJNAI9T
X-Google-Smtp-Source: AGHT+IGANyPdqzYmfFEaFVGhyAXfuxeoDjl23RYIriV6FF/16VMTynZc4LvP1liBFBcOfFF1lFTyu84kN1+K1m6YB6o=
X-Received: by 2002:a05:6000:178f:b0:429:cc35:7032 with SMTP id
 ffacd0b85a97d-42ca8bd18c7mr2818838f8f.23.1763464898795; Tue, 18 Nov 2025
 03:21:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015192611.241920-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdW1B7Yk1hUU9MSJsiL8wSmjAUGN7Qd_wgBHv8Ct=-wi4Q@mail.gmail.com>
 <CA+V-a8uY11uWoQ_en5QC=W4HPHRwT6rKQQJ-knT8Gi-+czm05w@mail.gmail.com>
 <20251021184502.GD19043@pendragon.ideasonboard.com> <CAMuHMdVrfVP1XZbQVNwEEP8L69mVzNN2yLSjNyHO7o2zqBuY0w@mail.gmail.com>
In-Reply-To: <CAMuHMdVrfVP1XZbQVNwEEP8L69mVzNN2yLSjNyHO7o2zqBuY0w@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 18 Nov 2025 11:21:12 +0000
X-Gm-Features: AWmQ_bl1DwIS-3Ab86i8VXMJ8kC7jPBYyZty6PEvVtZX5ppN0ByYyuYIgaFMugg
Message-ID: <CA+V-a8vLXg-whqwpE3pLF5JP3kK9on9Hu3iyLXEvrWbR9XmF5w@mail.gmail.com>
Subject: Re: [PATCH v11 0/7] Add support for DU/DSI clocks and DSI driver
 support for the Renesas RZ/V2H(P) SoC
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
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

Hi Laurent/Tomi,

On Mon, Oct 27, 2025 at 11:23=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> On Tue, 21 Oct 2025 at 20:45, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> > On Tue, Oct 21, 2025 at 07:26:49PM +0100, Lad, Prabhakar wrote:
> > > On Tue, Oct 21, 2025 at 11:26=E2=80=AFAM Geert Uytterhoeven wrote:
> > > > On Wed, 15 Oct 2025 at 21:26, Prabhakar <prabhakar.csengg@gmail.com=
> wrote:
> > > > > This patch series adds DU/DSI clocks and provides support for the
> > > > > MIPI DSI interface on the RZ/V2H(P) SoC.
> > > > >
> > > > > v10->v11:
> > > > > - Split CPG_PLL_CLK1_K/M/PDIV macro change into separate patch
> > > > > - Updated rzv2h_cpg_plldsi_div_determine_rate()
> > > > >   while iterating over the divider table
> > > > > - Added Acked-by tag from Tomi for patch 2/7 and 3/7
> > > > > - Added Reviewed-by tag from Geert for patch 2/7 and 3/7
> > > >
> > > > I think this series is ready for merging.
> > >
> > > \o/
> > >
> > > > > Lad Prabhakar (7):
> > > > >   clk: renesas: rzv2h-cpg: Add instance field to struct pll
> > > > >   clk: renesas: rzv2h-cpg: Use GENMASK for PLL fields
> > > > >   clk: renesas: rzv2h-cpg: Add support for DSI clocks
> > > > >   clk: renesas: r9a09g057: Add clock and reset entries for DSI an=
d LCDC
> > > > >   dt-bindings: display: bridge: renesas,dsi: Document RZ/V2H(P) a=
nd
> > > > >     RZ/V2N
> > > > >   drm: renesas: rz-du: mipi_dsi: Add LPCLK clock support
> > > > >   drm: renesas: rz-du: mipi_dsi: Add support for RZ/V2H(P) SoC
> > > >
> > > > As this touches both clk and drm, let's discuss the merge strategy.
> > > > My proposal:
> > > >   1. I queue patches 1-3 in an immutable branch with a signed tag,
> > > >      to be used as a base for the remaining patches,
>
> Done:
>
> The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df567=
87:
>
>   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git
> tags/clk-renesas-rzv2h-plldsi-tag
>
> for you to fetch changes up to f864e4b721e386be132cc973eadefe5d52cdfd94:
>
>   clk: renesas: rzv2h: Add support for DSI clocks (2025-10-27 11:58:03 +0=
100)
>
> ----------------------------------------------------------------
> clk: renesas: rzv2h: Add support for DSI clocks
>
> RZ/V2H Clock Pulse Generator PLLDSI API, shared by clock and MIPI DSI
> driver source files.
>
> ----------------------------------------------------------------
> Lad Prabhakar (3):
>       clk: renesas: rzv2h: Add instance field to struct pll
>       clk: renesas: rzv2h: Use GENMASK for PLL fields
>       clk: renesas: rzv2h: Add support for DSI clocks
>
>  drivers/clk/renesas/rzv2h-cpg.c | 512 ++++++++++++++++++++++++++++++++++=
+++++-
>  drivers/clk/renesas/rzv2h-cpg.h |  26 +-
>  include/linux/clk/renesas.h     | 145 ++++++++++++
>  3 files changed, 672 insertions(+), 11 deletions(-)
>
> > > >   2. I queue patch 4 on top of 1 in renesas-clk for v6.19,
>
> Done.
>
Can you please pick up the DSI patches.

Cheers,
Prabhakar

