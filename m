Return-Path: <linux-renesas-soc+bounces-17774-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88619ACAB9A
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Jun 2025 11:43:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6AE1C3A6344
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Jun 2025 09:42:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA0991E1E06;
	Mon,  2 Jun 2025 09:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lPP4f5MO"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FBC1DE4C2;
	Mon,  2 Jun 2025 09:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748857375; cv=none; b=qJCqHys6r7PfzhP9CLcqWNx7Zo3eKTttpi+lEK1h8dh2N08boe4krI5Mjo54vBfTjEYLfoDROZVgr/gs7RZkTpm68umwC+t7XJtvP/QrKU+5Iq2gPqoceBcmBF9FCMkVNXTbfhoPsqIxB3vpBCU6iF7hPrwQ3GT6huSUZD/UPSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748857375; c=relaxed/simple;
	bh=Qk7HCEn2kQwMoo97ED70//dpd1Rs3Ea5nSCYTLe93Mg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R3Ch9KvHLZU5uejem6q2cwRLcfyhBHavZSeUaUk9aLoLdKxV5Xk+uTTX3L++FkIyQP12LTGHOZBxc/bbrzlr1A7Q/rldp6m6NoIq1mRDgBRyfhbl5Df9fl2dEFvFlstjpq628o+lmBFZUDHyMena9hgUqigcmGW3bwOHEhv6qHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lPP4f5MO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E943CC80;
	Mon,  2 Jun 2025 11:42:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1748857371;
	bh=Qk7HCEn2kQwMoo97ED70//dpd1Rs3Ea5nSCYTLe93Mg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lPP4f5MOgoHvSdVknol94ZvnANY6nalCH5fpHGb/ofu4jgPwkWugIwIP2V7nubX5m
	 JIVM9zT0UbjD35BZbWJEPVl6CSRLKRjjZMn01ymQYutm5Elf5Jai7CBFc/zRjYCsZ5
	 PG2bUWOH7lGIYzI/8aXqe8Bwyo1dNl7qwhnQL8Cc=
Date: Mon, 2 Jun 2025 12:42:43 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
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
Subject: Re: [PATCH v6 12/12] drm: renesas: rz-du: mipi_dsi: Add support for
 LPCLK clock handling
Message-ID: <20250602094243.GB3645@pendragon.ideasonboard.com>
References: <20250530165906.411144-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250530165906.411144-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250530165906.411144-13-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

Thank you for the patch.

On Fri, May 30, 2025 at 05:59:06PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Add LPCLK clock support in the RZ/G2L MIPI DSI driver via the optional
> clock API. This clock is required by some SoCs like RZ/V2H(P) for proper
> DPHY configuration, whereas it is absent on others like RZ/G2L.
> 
> Introduce a new `lpclk` field in the `rzg2l_mipi_dsi` structure and
> conditionally acquire the "lpclk" clock using `devm_clk_get_optional()`
> during probe. This allows LPCLK-aware SoCs to pass the clock via device
> tree without impacting existing platforms.
> 
> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v5->v6:
> - No changes
> 
> v4->v5:
> - Made use of devm_clk_get_optional() for lpclk
> - Added Reviewed tag from Biju
> 
> v3->v4
> - No changes
> 
> v2->v3:
> - No changes
> 
> v1->v2:
> - Added LPCLK as feature flag
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> index f9f2d883c40d..a31f9b6aa920 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -62,6 +62,7 @@ struct rzg2l_mipi_dsi {
>  	struct drm_bridge *next_bridge;
>  
>  	struct clk *vclk;
> +	struct clk *lpclk;
>  
>  	enum mipi_dsi_pixel_format format;
>  	unsigned int num_data_lanes;
> @@ -791,6 +792,10 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
>  	if (IS_ERR(dsi->vclk))
>  		return PTR_ERR(dsi->vclk);
>  
> +	dsi->lpclk = devm_clk_get_optional(dsi->dev, "lpclk");
> +	if (IS_ERR(dsi->lpclk))
> +		return PTR_ERR(dsi->lpclk);
> +

This clock isn't used in this series, it will only be used when you will
submit the next version of "[PATCH v4 15/15] drm: renesas: rz-du:
mipi_dsi: Add support for RZ/V2H(P) SoC". As this patch doesn't bring
any used feature, I'm tempted to say it could be bundled with the
RZ/V2H(P) support patch.

>  	dsi->rstc = devm_reset_control_get_optional_exclusive(dsi->dev, "rst");
>  	if (IS_ERR(dsi->rstc))
>  		return dev_err_probe(dsi->dev, PTR_ERR(dsi->rstc),

-- 
Regards,

Laurent Pinchart

