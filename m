Return-Path: <linux-renesas-soc+bounces-17263-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF592ABDCEF
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 May 2025 16:31:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 454C31898413
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 May 2025 14:29:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52720248865;
	Tue, 20 May 2025 14:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="AcGVRCBQ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B066B248864;
	Tue, 20 May 2025 14:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747751304; cv=none; b=XpPiOnrtPTTcMD0kfSQbNwWP82Rul7XVMigDRILQs3ivGbn1vvWO501nB67etB3xvzGxn7cwAZLCJ3CqY9Qd4ODJ+CuUGhanwMOdg+/RYGMNghN585EI+ZI5mHnTL6zNDAQnaNWbMYwYnTttsqHSDy7MuIOzw1Ti9t6RvKG4s8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747751304; c=relaxed/simple;
	bh=To839h9GABdkq17dtAEeZRfQrFBVJpTujeZieRb2WRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RQVZrYQISfSq8SI5H0WK3c/1Vjc/DyLDm/h4H52k0XY1W4vIdTT1fA9mY4xJkgUfSCiOi08DHkbaWzrC9lb4JehEPZ+1I+sCIDWgoNa1JI3krB3BcgCEV4FofiAKOL+LtoeM7mcx/C52vNi+cCLR/ypRtMoxkDzpf10yTn07TjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=AcGVRCBQ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (179.218-130-109.adsl-dyn.isp.belgacom.be [109.130.218.179])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A63262EC;
	Tue, 20 May 2025 16:28:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747751280;
	bh=To839h9GABdkq17dtAEeZRfQrFBVJpTujeZieRb2WRg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AcGVRCBQonYOMCs2KAdyYSnTFxRMRUVFDFkB1jgtRngy9MWqnGeCZdFrq3u/RnCcp
	 cPeE04kwyXV8/dWZOJwVkXJ+lGKA3usJOrgICgLMYVd8DucNXE3u6he7AzQ2mumyiB
	 sOuL9ntg/2TAMbDdaqFi/oE4TouHzdl+h7KOGhAY=
Date: Tue, 20 May 2025 16:28:15 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v5 10/12] drm: renesas: rz-du: mipi_dsi: Add
 dphy_late_init() callback for RZ/V2H(P)
Message-ID: <20250520142815.GJ13321@pendragon.ideasonboard.com>
References: <20250512182330.238259-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250512182330.238259-11-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250512182330.238259-11-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

Thank you for the patch.

On Mon, May 12, 2025 at 07:23:28PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Introduce the `dphy_late_init` callback in `rzg2l_mipi_dsi_hw_info` to
> allow additional D-PHY register configurations after enabling data and
> clock lanes. This is required for the RZ/V2H(P) SoC but not for the
> RZ/G2L SoC.
> 
> Modify `rzg2l_mipi_dsi_startup()` to invoke `dphy_late_init` if defined,
> ensuring SoC-specific initialization is performed only when necessary.
> 
> This change prepares for RZ/V2H(P) SoC support while maintaining
> compatibility with existing platforms.
> 
> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v4->v5:
> - Added Reviewed tag from Biju
> 
> v3->v4:
> - No changes
> 
> v2->v3:
> - No changes
> 
> v1->v2:
> - No changes
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> index 55a1c1b043c8..e1ce21a9ddb3 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -34,6 +34,7 @@ struct rzg2l_mipi_dsi;
>  
>  struct rzg2l_mipi_dsi_hw_info {
>  	int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, u64 hsfreq_millihz);
> +	void (*dphy_late_init)(struct rzg2l_mipi_dsi *dsi);

As this is called at startup time I would have called it dphy_startup.
Up to you.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>  	void (*dphy_exit)(struct rzg2l_mipi_dsi *dsi);
>  	u32 phy_reg_offset;
>  	u32 link_reg_offset;
> @@ -320,6 +321,9 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
>  	txsetr = TXSETR_DLEN | TXSETR_NUMLANEUSE(dsi->lanes - 1) | TXSETR_CLEN;
>  	rzg2l_mipi_dsi_link_write(dsi, TXSETR, txsetr);
>  
> +	if (dsi->info->dphy_late_init)
> +		dsi->info->dphy_late_init(dsi);
> +
>  	hsfreq = DIV_ROUND_CLOSEST_ULL(hsfreq_millihz, MILLI);
>  	/*
>  	 * Global timings characteristic depends on high speed Clock Frequency

-- 
Regards,

Laurent Pinchart

