Return-Path: <linux-renesas-soc+bounces-17260-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBA7ABDD11
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 May 2025 16:32:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0DBC8C1DCC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 May 2025 14:26:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B07AD244695;
	Tue, 20 May 2025 14:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="iMnFyB8K"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED7F022D787;
	Tue, 20 May 2025 14:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747751054; cv=none; b=GQ5zQioE+yL9dcykPgEd2HBoOie2u3nXa4FvLjt/TB9ksYTtDB+Vws2tn4XNLhOx5RzbfXgjY3TZ4old4SSCGA7E1Qk2wEJTyYaVwfF3IfLIjh1N2pDOqoWnX1yufCcilj4DSZYpSFTw/8aPvg/I4cNcv/Xhiix8D8XGlynxFUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747751054; c=relaxed/simple;
	bh=QTLMqr2zIE+uYbBUUKKtEg0SYp8ygrhoH+/kgbyNgeo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WfyeAeJOFt7lWxVcbVP58sRnGDOk95ANfEnqfjCw33+1sAbwoxOzXsCW6Hzq7u1haYQYzl2KxmfnYkasNzkfhZE9QmUuR+bdC8dntw5aW+LBJvZuPUXbgf72kF/lIS2TTzw9LQVtp1j6B7zmdrcjpQd4V4wwQnDUWGCNorHIqsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=iMnFyB8K; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (179.218-130-109.adsl-dyn.isp.belgacom.be [109.130.218.179])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 01D8B2EC;
	Tue, 20 May 2025 16:23:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747751031;
	bh=QTLMqr2zIE+uYbBUUKKtEg0SYp8ygrhoH+/kgbyNgeo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iMnFyB8K85swvPdyZroStTnuTT7U4Q71ieqt9tdGvY2q6gZKDOqHrldCf5weMh3wP
	 4vi4me9No4YB84u+8XZ/gpIvofpAgdGCHoXSzETCFpR8MAU6rygk/lFP+2XPIxAk/T
	 YcA/w4oR5A5uQzDp8NJA/PF4QjlM927R5QSrs73o=
Date: Tue, 20 May 2025 16:24:05 +0200
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
Subject: Re: [PATCH v5 08/12] drm: renesas: rz-du: mipi_dsi: Use mHz for
 D-PHY frequency calculations
Message-ID: <20250520142405.GG13321@pendragon.ideasonboard.com>
References: <20250512182330.238259-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250512182330.238259-9-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250512182330.238259-9-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

Thank you for the patch.

On Mon, May 12, 2025 at 07:23:26PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Pass the HSFREQ in milli-Hz to the `dphy_init()` callback to improve
> precision, especially for the RZ/V2H(P) SoC, where PLL dividers require
> high accuracy.

I have a hard time imagining the need for milliHz accuracy. Could you
please explain why that is needed on V2H ?

> These changes prepare the driver for upcoming RZ/V2H(P) SoC support.
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
> - Used MILLI instead of KILO
> - Made use of mul_u32_u32() for multiplication
> 
> v2->v3:
> - Replaced `unsigned long long` with `u64`
> - Replaced *_mhz with *_millihz` in functions
> 
> v1->v2:
> - No changes
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> index 5fc607be0c46..f93519613662 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -31,7 +31,7 @@
>  struct rzg2l_mipi_dsi;
>  
>  struct rzg2l_mipi_dsi_hw_info {
> -	int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, unsigned long hsfreq);
> +	int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, u64 hsfreq_millihz);
>  	void (*dphy_exit)(struct rzg2l_mipi_dsi *dsi);
>  	u32 phy_reg_offset;
>  	u32 link_reg_offset;
> @@ -200,8 +200,9 @@ static u32 rzg2l_mipi_dsi_link_read(struct rzg2l_mipi_dsi *dsi, u32 reg)
>   */
>  
>  static int rzg2l_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
> -				    unsigned long hsfreq)
> +				    u64 hsfreq_millihz)
>  {
> +	unsigned long hsfreq = DIV_ROUND_CLOSEST_ULL(hsfreq_millihz, MILLI);
>  	const struct rzg2l_mipi_dsi_timings *dphy_timings;
>  	unsigned int i;
>  	u32 dphyctrl0;
> @@ -274,6 +275,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
>  				  const struct drm_display_mode *mode)
>  {
>  	unsigned long hsfreq, vclk_rate;
> +	u64 hsfreq_millihz;
>  	unsigned int bpp;
>  	u32 txsetr;
>  	u32 clstptsetr;
> @@ -305,9 +307,9 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
>  	if (vclk_rate != mode->clock * MILLI)
>  		dev_info(dsi->dev, "Requested vclk rate %lu, actual %lu mismatch\n",
>  			 mode->clock * MILLI, vclk_rate);
> -	hsfreq = DIV_ROUND_CLOSEST_ULL(vclk_rate * bpp, dsi->lanes);
> +	hsfreq_millihz = DIV_ROUND_CLOSEST_ULL(mul_u32_u32(vclk_rate, bpp * MILLI), dsi->lanes);
>  
> -	ret = dsi->info->dphy_init(dsi, hsfreq);
> +	ret = dsi->info->dphy_init(dsi, hsfreq_millihz);
>  	if (ret < 0)
>  		goto err_phy;
>  
> @@ -315,6 +317,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
>  	txsetr = TXSETR_DLEN | TXSETR_NUMLANEUSE(dsi->lanes - 1) | TXSETR_CLEN;
>  	rzg2l_mipi_dsi_link_write(dsi, TXSETR, txsetr);
>  
> +	hsfreq = DIV_ROUND_CLOSEST_ULL(hsfreq_millihz, MILLI);
>  	/*
>  	 * Global timings characteristic depends on high speed Clock Frequency
>  	 * Currently MIPI DSI-IF just supports maximum FHD@60 with:
> @@ -776,7 +779,7 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
>  	 * mode->clock and format are not available. So initialize DPHY with
>  	 * timing parameters for 80Mbps.
>  	 */
> -	ret = dsi->info->dphy_init(dsi, 80000000);
> +	ret = dsi->info->dphy_init(dsi, 80000000ULL * MILLI);
>  	if (ret < 0)
>  		goto err_phy;
>  

-- 
Regards,

Laurent Pinchart

