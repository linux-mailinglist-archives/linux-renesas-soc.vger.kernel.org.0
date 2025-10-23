Return-Path: <linux-renesas-soc+bounces-23477-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2C1C001B6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 11:08:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C204D3A829C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Oct 2025 09:08:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E07D2FE57C;
	Thu, 23 Oct 2025 09:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HJuEu9io"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A52952FE04F;
	Thu, 23 Oct 2025 09:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761210409; cv=none; b=hztcON4S2MxQ08Nd1gwgpUPM3mZLnb/C5tfxJM7gCbKzOI8T77Zi4Ck2rsSiQDRI7Na7hSlYO/wUh14nDoiJZ5t6aTw+hQZvaan/ItekZ4LDEc3mlVOlmlGdUqIkOGMmHOusOkVYMlesYadxQfiNc0oIn2I2E2nSt75aZUpXt+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761210409; c=relaxed/simple;
	bh=xKFWE3FP8zQxD/fKvD/Su/ZNtr3Ujowi8h/zfAe1GQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WvqskD099BMPWhDWN/NeON00SVs5sLdHZc78cqS4azyUBylYzOvCtJfALHOkaiYEOhcY83DMxUV6EF6ajVOQhp4msIqFrfJi0JrB+KP4RaBjlWiOdlZbT69Ik12fKr45vUaKxBhFZMX0UAWtLVP0WzzFysh4oWvn7eBLayFttuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=HJuEu9io; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-161-16.bb.dnainternet.fi [82.203.161.16])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 494FC4C7;
	Thu, 23 Oct 2025 11:04:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761210297;
	bh=xKFWE3FP8zQxD/fKvD/Su/ZNtr3Ujowi8h/zfAe1GQg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HJuEu9ioEFGCzueDKZ6jv6koSl/y7Hot56lpH2Up1vH0lU3Oq7SDd5ek3180SdnU6
	 tmFiLdIK58Z8yRjqO3zeMpRDXfxPETJEuy3Y0ZOiIS86jDQwSLC6ZwVv+YhuYn49QN
	 WXZ/t/dPj7RGbaBPLNYNoEfquKXZF6cdc6bl+1WI=
Date: Thu, 23 Oct 2025 12:06:28 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
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
Message-ID: <20251023090628.GF727@pendragon.ideasonboard.com>
References: <20251015192611.241920-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdW1B7Yk1hUU9MSJsiL8wSmjAUGN7Qd_wgBHv8Ct=-wi4Q@mail.gmail.com>
 <CA+V-a8uY11uWoQ_en5QC=W4HPHRwT6rKQQJ-knT8Gi-+czm05w@mail.gmail.com>
 <20251021184502.GD19043@pendragon.ideasonboard.com>
 <CAMuHMdUU-2ugmA-VcRuYOsriUKtAEQXmWEwJSwuCsSTa3ySTZg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdUU-2ugmA-VcRuYOsriUKtAEQXmWEwJSwuCsSTa3ySTZg@mail.gmail.com>

On Thu, Oct 23, 2025 at 10:20:41AM +0200, Geert Uytterhoeven wrote:
> Hi Laurent,
> 
> On Tue, 21 Oct 2025 at 20:45, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> > On Tue, Oct 21, 2025 at 07:26:49PM +0100, Lad, Prabhakar wrote:
> > > On Tue, Oct 21, 2025 at 11:26 AM Geert Uytterhoeven wrote:
> > > > On Wed, 15 Oct 2025 at 21:26, Prabhakar <prabhakar.csengg@gmail.com> wrote:
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
> > > > >   clk: renesas: r9a09g057: Add clock and reset entries for DSI and LCDC
> > > > >   dt-bindings: display: bridge: renesas,dsi: Document RZ/V2H(P) and
> > > > >     RZ/V2N
> > > > >   drm: renesas: rz-du: mipi_dsi: Add LPCLK clock support
> > > > >   drm: renesas: rz-du: mipi_dsi: Add support for RZ/V2H(P) SoC
> > > >
> > > > As this touches both clk and drm, let's discuss the merge strategy.
> > > > My proposal:
> > > >   1. I queue patches 1-3 in an immutable branch with a signed tag,
> > > >      to be used as a base for the remaining patches,
> > > >   2. I queue patch 4 on top of 1 in renesas-clk for v6.19,
> > > >   3. The DRM people queue patches 5-7 on top of 1.
> > > >
> > > > Does that sound fine for you?
> > > Sounds good to me.
> > >
> > > Biju/Tomi, are you OK with the above?
> >
> > The plan seems good to me. Note that you won't be able to push this
> > yourself to drm-misc as committers are limited to pushing linear
> > branches. We need an ack from the drm-misc maintainers, and one of them
> 
> Do you mean new commits must be in a single branch, or drm-misc
> itself must be linear? In case of the former, 5-7 can be applied on top of
> my immutable branch, without involving a merge?

drm-misc must be linear, committers must rebase patches on the
drm-misc-next branch before pushing.

> > will need to merge the branch (either branch 1. as prepared by Geert, on
> > top of which you can them push patches 5-7 yourself, or a branch you'll
> > prepare on top of 1. with patches 5-7).
> 
> Note that another change to include/linux/clk/renesas.h,
> and thus a dependency of drm on clk, is coming in
> "[PATCH v3 0/2] Remove hard coded values for MIPI-DSI"
> https://lore.kernel.org/20251022235903.1091453-1-chris.brandt@renesas.com
> 
> Would it be worthwhile to wait on/speed up review of the latter?

Nobody will complain about reviews being sped up :-)

-- 
Regards,

Laurent Pinchart

