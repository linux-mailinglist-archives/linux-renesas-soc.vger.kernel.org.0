Return-Path: <linux-renesas-soc+bounces-11132-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 617589EA152
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Dec 2024 22:41:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB6DC163780
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Dec 2024 21:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE1F019CD13;
	Mon,  9 Dec 2024 21:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZMcQewpj"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F73846B8;
	Mon,  9 Dec 2024 21:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733780455; cv=none; b=JkH2/tGWqhAU9N7341uPbDsw0ZR0OjIyZtWaP6x0vsA+J3nuCyNxOtfffaJBVwCwYHkRI3ghb+qfr4jqdI5H1cYXhqCGbmTVXcvAYoTOF7UDdBvCtXOGGNx/+fLZaDMbsG7u8qTBBKXvOkuFwDkMCnDeJK62YJ2Z/ardl3E/KWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733780455; c=relaxed/simple;
	bh=I7z53oMSPeKw57tcADR/kJ8mn9kitYJg4MblUErnws0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f5wsQD72acdykCsoXvTDMSWTCTvyDmJfSJW+p1fEdkWhx6+A15QRoFxdQqYGC1Kb1Hi/ncIW9YGxi/bswm0MnCb6hHwzMU9bYkQHJbor7ukFY2jFU+IlxY9B6T2+Y3VPZ3CIZ/xW/ocnPzog85mnQz7pudgGW9YEHEjRsxd+2aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZMcQewpj; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4C47C502;
	Mon,  9 Dec 2024 22:40:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733780418;
	bh=I7z53oMSPeKw57tcADR/kJ8mn9kitYJg4MblUErnws0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZMcQewpjew4EGWseaDIabpzeFj3eQ8ky1BYh35ijVN8a9ywaYOzOLW5aJ8B4+zDRM
	 CsKSUr7uDb5euSsYbjhqp/7Rj4h/tyLzoHrsMuf+tctX+WWcqSOxIMPAA1WbS1D+N/
	 NOkXtCxPoJGby5mN8LSjJ3IQ8Mh0uJFrLIZO6qNE=
Date: Mon, 9 Dec 2024 23:40:35 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, LUU HOAI <hoai.luu.ub@renesas.com>,
	Jagan Teki <jagan@amarulasolutions.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: Re: [PATCH v3 05/10] clk: renesas: r8a779h0: Add display clocks
Message-ID: <20241209214035.GB26531@pendragon.ideasonboard.com>
References: <20241206-rcar-gh-dsi-v3-0-d74c2166fa15@ideasonboard.com>
 <20241206-rcar-gh-dsi-v3-5-d74c2166fa15@ideasonboard.com>
 <CAMuHMdU+PPeCNb5y75A1YTf1EvvCQEgD1t-=6C_YyK0gDK3R8A@mail.gmail.com>
 <b0fffc87-a72e-4041-b3f6-7f2a4987916e@ideasonboard.com>
 <CAMuHMdUmAbnbJ-UouN+dnodVg7+Lw47to-O4rTAcDanQ=NCGpg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdUmAbnbJ-UouN+dnodVg7+Lw47to-O4rTAcDanQ=NCGpg@mail.gmail.com>

On Mon, Dec 09, 2024 at 08:49:18AM +0100, Geert Uytterhoeven wrote:
> On Mon, Dec 9, 2024 at 6:26 AM Tomi Valkeinen wrote:
> > On 06/12/2024 15:43, Geert Uytterhoeven wrote:
> > > On Fri, Dec 6, 2024 at 10:33 AM Tomi Valkeinen wrote:
> > >> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> > >>
> > >> Add display related clocks for DU, DSI, FCPVD, and VSPD.
> > >>
> > >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> > >> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > >> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > >
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > i.e. will queue in renesas-clk for v6.14.
> > >
> > >> --- a/drivers/clk/renesas/r8a779h0-cpg-mssr.c
> > >> +++ b/drivers/clk/renesas/r8a779h0-cpg-mssr.c
> > >> @@ -179,6 +179,9 @@ static const struct mssr_mod_clk r8a779h0_mod_clks[] __initconst = {
> > >>          DEF_MOD("canfd0",       328,    R8A779H0_CLK_SASYNCPERD2),
> > >>          DEF_MOD("csi40",        331,    R8A779H0_CLK_CSI),
> > >>          DEF_MOD("csi41",        400,    R8A779H0_CLK_CSI),
> > >> +       DEF_MOD("dis0",         411,    R8A779H0_CLK_S0D3),
> > >> +       DEF_MOD("dsitxlink0",   415,    R8A779H0_CLK_DSIREF),
> > >> +       DEF_MOD("fcpvd0",       508,    R8A779H0_CLK_S0D3),
> > >>          DEF_MOD("hscif0",       514,    R8A779H0_CLK_SASYNCPERD1),
> > >>          DEF_MOD("hscif1",       515,    R8A779H0_CLK_SASYNCPERD1),
> > >>          DEF_MOD("hscif2",       516,    R8A779H0_CLK_SASYNCPERD1),
> > >> @@ -227,6 +230,7 @@ static const struct mssr_mod_clk r8a779h0_mod_clks[] __initconst = {
> > >>          DEF_MOD("vin15",        811,    R8A779H0_CLK_S0D4_VIO),
> > >>          DEF_MOD("vin16",        812,    R8A779H0_CLK_S0D4_VIO),
> > >>          DEF_MOD("vin17",        813,    R8A779H0_CLK_S0D4_VIO),
> > >> +       DEF_MOD("vspd0",        830,    R8A779H0_CLK_S0D1_VIO),
> > >>          DEF_MOD("wdt1:wdt0",    907,    R8A779H0_CLK_R),
> > >>          DEF_MOD("cmt0",         910,    R8A779H0_CLK_R),
> > >>          DEF_MOD("cmt1",         911,    R8A779H0_CLK_R),
> > >
> > > As mentioned by Laurent during his review on v1, all clock parents
> > > should probably be some form of R8A779H0_CLK_S0Dx_VIO.
> > > So I'm inclined to replace all of them by R8A779H0_CLK_VIOBUSD2 while
> > > applying, which would match R-Car V4H.
> >
> > What do you mean with the above? First you say the clock parents should
> > be some form of S0Dx_VIO, but then you say you'll use VIOBUSD2. Aren't
> > those unrelated clocks, from different PLLs?
> 
> Oops, copy-'n-paste went wrong. I did mean R8A779H0_VIOBUSD*.
> 
> > > Are you OK with that?
> >
> > I'm fine with that. I can't really get much out of the docs wrt.
> > clocking, and the clocks I used were from the BSP. Afaics, it looks
> > similar to V4H, so it's probably best have the same clocks, as you suggest.
> 
> Agreed.

Works for me too.

-- 
Regards,

Laurent Pinchart

