Return-Path: <linux-renesas-soc+bounces-20715-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AD997B2C7AD
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 16:56:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E98CD5218A8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Aug 2025 14:54:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CABFA27E1AC;
	Tue, 19 Aug 2025 14:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IpOPUuCe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9FB727D780;
	Tue, 19 Aug 2025 14:54:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755615268; cv=none; b=G0zFYn9m6GpLXu5uscaB+MfAXtCMXwJBaguqHhe47gIFu76MxF8n6elFgEIFE0E4V/Nc/NgrXsKWaZjZxh7yJC8kHLJut0XApYRs/Ax+JjcvuAFXel4c8ACINxFpEQvx3+vAb+5P6W6+prNT2YEKvGp4ugXIge1EZ0vmNp8Gnv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755615268; c=relaxed/simple;
	bh=bS73IBP0XgIpvrcjYBqF+tR9I5LvIwqpJWovbWz/tmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bw+jNSwl0WDDEYoEYHQ1uAEytfeSmPoYH7dxftFkeieef+IZi1cL78b5odWgNIb0a7io/xvAOOX4fP+y5WP5IvbJEK9fJpVTKkXhsHV1Z6om7H3ztahbWa95Uj2hgrLL62RZxf6OkBu1UvG3I06YkC/FUhP2t3P4cCq2f383i9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IpOPUuCe; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id EC5EC2391;
	Tue, 19 Aug 2025 16:53:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755615206;
	bh=bS73IBP0XgIpvrcjYBqF+tR9I5LvIwqpJWovbWz/tmA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IpOPUuCetwEVA81ICn/utvxBQhlUR2gVMI9g/f2wvAMD3w42pyVdWKFY6N8yNZyb0
	 BJ4bXtW5O0j3L8KK41XKSllgBdJ1dvPohgGe6LHE/am2TNml44k1OfXlk6UXxmMl6Q
	 GwYz6dqIKHnkU7duJfsMjH6a9vqfFUe3wQmhfTBU=
Date: Tue, 19 Aug 2025 17:54:01 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Prabhakar <prabhakar.csengg@gmail.com>,
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
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v7 0/6] Add support for DU/DSI clocks and DSI driver
 support for the Renesas RZ/V2H(P) SoC
Message-ID: <20250819145401.GW5862@pendragon.ideasonboard.com>
References: <20250728201435.3505594-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdXSJO1MOoNS5M2M1Zs=iWmiBbmc8Xc9tMDsXd_kM6bj=Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdXSJO1MOoNS5M2M1Zs=iWmiBbmc8Xc9tMDsXd_kM6bj=Q@mail.gmail.com>

On Tue, Aug 19, 2025 at 03:48:08PM +0200, Geert Uytterhoeven wrote:
> On Mon, 28 Jul 2025 at 22:14, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > This patch series adds DU/DSI clocks and provides support for the
> > MIPI DSI interface on the RZ/V2H(P) SoC. It was originally part of
> > series [0], but has now been split into 6 patches due to dependencies
> > on the clock driver, making it easier to review and merge.
> 
> Thanks for your series!
> 
> > Lad Prabhakar (6):
> >   clk: renesas: rzv2h-cpg: Add instance field to struct pll
> >   clk: renesas: rzv2h-cpg: Add support for DSI clocks
> >   clk: renesas: r9a09g057: Add clock and reset entries for DSI and LCDC
> >   dt-bindings: display: bridge: renesas,dsi: Document RZ/V2H(P) and
> >     RZ/V2N
> >   drm: renesas: rz-du: mipi_dsi: Add support for LPCLK clock handling
> >   drm: renesas: rz-du: mipi_dsi: Add support for RZ/V2H(P) SoC
> 
> On the renesas-clk side, I am (almost) totally happy with this.
> Any feedback from the renesas-drm side?

Tomi told me he added the patches on this review list.

> The last patch depends on a header file introduced by the second patch,
> so I will need to provide an immutable branch containing the first
> two patches (probably/hopefully based on v8).

-- 
Regards,

Laurent Pinchart

