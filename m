Return-Path: <linux-renesas-soc+bounces-23398-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1C1BF8228
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Oct 2025 20:45:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B44054EAE76
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 21 Oct 2025 18:45:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 173A734A3B7;
	Tue, 21 Oct 2025 18:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pbxPVS6j"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5187324A047;
	Tue, 21 Oct 2025 18:45:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761072321; cv=none; b=QKzsiUjp7LqINt2h8wdrd8SpoIgOXzbeof6uk2QC19GlnoWZmPaNwgMZPq1WhKNxaYiRdZdd+l6YMokknk5dfwTSW7jDQ2678Lfc4al16nFQ+Ad0nQWw0g0zVSaKKZZyJuFzgwMHS5pUc6+mELWUXTao78ImhIqiwrj7rQ+OHeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761072321; c=relaxed/simple;
	bh=aH/M0s0TmS9qF38cCeaZcFrAvocjovEuJFK7OoMK6O0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UUOS6NeHF8AWXHCGf0cdSNjTg43x5aqYclccXIhUiNGYs/SBuNZ1qYSMGAOvldZ4D4XbTq3LYQoddTjWrHKipWM/scCH6LUW3Nav9k2rmGPWa6nDumStz/5oL1p7QjdZaigC+hK5Otm34t9D42KStrnR423KchIUuMGgK+0Q9PE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pbxPVS6j; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (87-94-110-32.bb.dnainternet.fi [87.94.110.32])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id C4FF76F9;
	Tue, 21 Oct 2025 20:43:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761072211;
	bh=aH/M0s0TmS9qF38cCeaZcFrAvocjovEuJFK7OoMK6O0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pbxPVS6jQ0rfLjSiePkJXl7XPQyVFWALWQfImlL7BQCI1oQv5EOfFNx5wQHlexnML
	 BM2cLy2b5d5RAXqNOCSN3Q/hrJG1W25LjZl+iHY38y0Cv8GmmhOXSG4fQdk8y7XSZY
	 17gkCqffNUtPEskzn2WlQWCgJNBpSy2GBlsTsFqU=
Date: Tue, 21 Oct 2025 21:45:02 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v11 0/7] Add support for DU/DSI clocks and DSI driver
 support for the Renesas RZ/V2H(P) SoC
Message-ID: <20251021184502.GD19043@pendragon.ideasonboard.com>
References: <20251015192611.241920-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdW1B7Yk1hUU9MSJsiL8wSmjAUGN7Qd_wgBHv8Ct=-wi4Q@mail.gmail.com>
 <CA+V-a8uY11uWoQ_en5QC=W4HPHRwT6rKQQJ-knT8Gi-+czm05w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+V-a8uY11uWoQ_en5QC=W4HPHRwT6rKQQJ-knT8Gi-+czm05w@mail.gmail.com>

On Tue, Oct 21, 2025 at 07:26:49PM +0100, Lad, Prabhakar wrote:
> On Tue, Oct 21, 2025 at 11:26 AM Geert Uytterhoeven wrote:
> >
> > Hi Prabhakar et al,
> >
> > On Wed, 15 Oct 2025 at 21:26, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> > > This patch series adds DU/DSI clocks and provides support for the
> > > MIPI DSI interface on the RZ/V2H(P) SoC.
> > >
> > > v10->v11:
> > > - Split CPG_PLL_CLK1_K/M/PDIV macro change into separate patch
> > > - Updated rzv2h_cpg_plldsi_div_determine_rate()
> > >   while iterating over the divider table
> > > - Added Acked-by tag from Tomi for patch 2/7 and 3/7
> > > - Added Reviewed-by tag from Geert for patch 2/7 and 3/7
> >
> > I think this series is ready for merging.
> 
> \o/
> 
> > > Lad Prabhakar (7):
> > >   clk: renesas: rzv2h-cpg: Add instance field to struct pll
> > >   clk: renesas: rzv2h-cpg: Use GENMASK for PLL fields
> > >   clk: renesas: rzv2h-cpg: Add support for DSI clocks
> > >   clk: renesas: r9a09g057: Add clock and reset entries for DSI and LCDC
> > >   dt-bindings: display: bridge: renesas,dsi: Document RZ/V2H(P) and
> > >     RZ/V2N
> > >   drm: renesas: rz-du: mipi_dsi: Add LPCLK clock support
> > >   drm: renesas: rz-du: mipi_dsi: Add support for RZ/V2H(P) SoC
> >
> > As this touches both clk and drm, let's discuss the merge strategy.
> > My proposal:
> >   1. I queue patches 1-3 in an immutable branch with a signed tag,
> >      to be used as a base for the remaining patches,
> >   2. I queue patch 4 on top of 1 in renesas-clk for v6.19,
> >   3. The DRM people queue patches 5-7 on top of 1.
> >
> > Does that sound fine for you?
> Sounds good to me.
> 
> Biju/Tomi, are you OK with the above?

The plan seems good to me. Note that you won't be able to push this
yourself to drm-misc as committers are limited to pushing linear
branches. We need an ack from the drm-misc maintainers, and one of them
will need to merge the branch (either branch 1. as prepared by Geert, on
top of which you can them push patches 5-7 yourself, or a branch you'll
prepare on top of 1. with patches 5-7).

-- 
Regards,

Laurent Pinchart

