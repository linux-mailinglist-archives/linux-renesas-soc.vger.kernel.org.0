Return-Path: <linux-renesas-soc+bounces-17259-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DFEABDDB4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 May 2025 16:48:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7334A500723
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 May 2025 14:26:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1A81248F7D;
	Tue, 20 May 2025 14:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="F8LH1+de"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999A8248F63;
	Tue, 20 May 2025 14:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747750970; cv=none; b=VJ8eT7/Xqf5bjwS44o1OgqkHLNwntysGs0V1/1alOpifont0lxKci7CwYmqgE5LXsV8J6k0aGrOfbVpfvY4CgR0pJ4oAVuw5p9WEP2/9hDs1np+tql1QrA3mYRZJAHCuTlOUYUhkpTo9tyIGynHaU1zH11bFrpthNBLt1D0mlOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747750970; c=relaxed/simple;
	bh=O4/Qz//x5SNkBt3F+0GC+9Gq6U70ROuBxVnFGG4z+Hg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ab3S0nT/j6Qq2c1gVLLM/uWcI7ck8Oxemt0ThqCUNQr9xRHV2EnHSY4ulJ5IjjyRpjCyA4GNON4NrFQy/sbvTkCQkyqakiKJ1NSayPX9s59XeQgKUR3KlmjX90ArsDBG9nkBi9s/ePqkCqx7sOCHuhi3lx98hzqByryfuDJLk0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=F8LH1+de; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (179.218-130-109.adsl-dyn.isp.belgacom.be [109.130.218.179])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7A5D42EC;
	Tue, 20 May 2025 16:22:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747750945;
	bh=O4/Qz//x5SNkBt3F+0GC+9Gq6U70ROuBxVnFGG4z+Hg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=F8LH1+deH9/T7V3LcZkLtalwoQgpgodz84VPaCqgnwg2JvIbXRnEcv62adwyKfbBB
	 OS7Llac0oe1MnfpCAxnEnBDH00XLrBlli9lJwNMlaPW+iWcU/u3RADG9NDDttv00Ld
	 rn6/b95dydSwG80duxxV0c9+jcxafAcu1tN3QkbQ=
Date: Tue, 20 May 2025 16:22:40 +0200
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
Subject: Re: [PATCH v5 06/12] drm: renesas: rz-du: mipi_dsi: Add OF data
 support
Message-ID: <20250520142240.GF13321@pendragon.ideasonboard.com>
References: <20250512182330.238259-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250512182330.238259-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250512182330.238259-7-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

Thank you for the patch.

On Mon, May 12, 2025 at 07:23:24PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> In preparation for adding support for the Renesas RZ/V2H(P) SoC, this patch
> introduces a mechanism to pass SoC-specific information via OF data in the
> DSI driver. This enables the driver to adapt dynamically to various
> SoC-specific requirements without hardcoding configurations.
> 
> The MIPI DSI interface on the RZ/V2H(P) SoC is nearly identical to the one
> on the RZ/G2L SoC. While the LINK registers are shared between the two
> SoCs, the D-PHY registers differ. Also the VCLK range differs on both these
> SoCs. To accommodate these differences `struct rzg2l_mipi_dsi_hw_info` is
> introduced and as now passed as OF data.
> 
> These changes lay the groundwork for the upcoming RZ/V2H(P) SoC support by
> allowing SoC-specific data to be passed through OF.
> 
> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v4->v5:
> - Dropped RZ_MIPI_DSI_FEATURE_DPHY_RST feature flag
> - Added Reviewed tag from Biju
> 
> v3->v4:
> - No changes
> 
> v2->v3:
> - Dropped !dsi->info check in rzg2l_mipi_dsi_probe() as it is not needed.
> 
> v1->v2:
> - Added DPHY_RST as feature flag
> ---
>  .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 51 ++++++++++++++-----
>  .../drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h   |  2 -
>  2 files changed, 38 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> index 3f6988303e63..00c2bc6e9d6c 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -28,10 +28,23 @@
>  
>  #include "rzg2l_mipi_dsi_regs.h"
>  
> +struct rzg2l_mipi_dsi;
> +
> +struct rzg2l_mipi_dsi_hw_info {
> +	int (*dphy_init)(struct rzg2l_mipi_dsi *dsi, unsigned long hsfreq);
> +	void (*dphy_exit)(struct rzg2l_mipi_dsi *dsi);
> +	u32 phy_reg_offset;
> +	u32 link_reg_offset;
> +	unsigned long max_dclk;
> +	unsigned long min_dclk;

I'd put min before max.

> +};
> +
>  struct rzg2l_mipi_dsi {
>  	struct device *dev;
>  	void __iomem *mmio;
>  
> +	const struct rzg2l_mipi_dsi_hw_info *info;
> +
>  	struct reset_control *rstc;
>  	struct reset_control *arstc;
>  	struct reset_control *prstc;
> @@ -164,22 +177,22 @@ static const struct rzg2l_mipi_dsi_timings rzg2l_mipi_dsi_global_timings[] = {
>  
>  static void rzg2l_mipi_dsi_phy_write(struct rzg2l_mipi_dsi *dsi, u32 reg, u32 data)
>  {
> -	iowrite32(data, dsi->mmio + reg);
> +	iowrite32(data, dsi->mmio + dsi->info->phy_reg_offset + reg);
>  }
>  
>  static void rzg2l_mipi_dsi_link_write(struct rzg2l_mipi_dsi *dsi, u32 reg, u32 data)
>  {
> -	iowrite32(data, dsi->mmio + LINK_REG_OFFSET + reg);
> +	iowrite32(data, dsi->mmio + dsi->info->link_reg_offset + reg);
>  }
>  
>  static u32 rzg2l_mipi_dsi_phy_read(struct rzg2l_mipi_dsi *dsi, u32 reg)
>  {
> -	return ioread32(dsi->mmio + reg);
> +	return ioread32(dsi->mmio + dsi->info->phy_reg_offset + reg);
>  }
>  
>  static u32 rzg2l_mipi_dsi_link_read(struct rzg2l_mipi_dsi *dsi, u32 reg)
>  {
> -	return ioread32(dsi->mmio + LINK_REG_OFFSET + reg);
> +	return ioread32(dsi->mmio + dsi->info->link_reg_offset + reg);
>  }
>  
>  /* -----------------------------------------------------------------------------
> @@ -294,7 +307,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
>  			 mode->clock * MILLI, vclk_rate);
>  	hsfreq = DIV_ROUND_CLOSEST_ULL(vclk_rate * bpp, dsi->lanes);
>  
> -	ret = rzg2l_mipi_dsi_dphy_init(dsi, hsfreq);
> +	ret = dsi->info->dphy_init(dsi, hsfreq);
>  	if (ret < 0)
>  		goto err_phy;
>  
> @@ -337,7 +350,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
>  	return 0;
>  
>  err_phy:
> -	rzg2l_mipi_dsi_dphy_exit(dsi);
> +	dsi->info->dphy_exit(dsi);
>  	pm_runtime_put(dsi->dev);
>  
>  	return ret;
> @@ -345,7 +358,7 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
>  
>  static void rzg2l_mipi_dsi_stop(struct rzg2l_mipi_dsi *dsi)
>  {
> -	rzg2l_mipi_dsi_dphy_exit(dsi);
> +	dsi->info->dphy_exit(dsi);
>  	pm_runtime_put(dsi->dev);
>  }
>  
> @@ -587,10 +600,12 @@ rzg2l_mipi_dsi_bridge_mode_valid(struct drm_bridge *bridge,
>  				 const struct drm_display_info *info,
>  				 const struct drm_display_mode *mode)
>  {
> -	if (mode->clock > 148500)
> +	struct rzg2l_mipi_dsi *dsi = bridge_to_rzg2l_mipi_dsi(bridge);
> +
> +	if (mode->clock > dsi->info->max_dclk)
>  		return MODE_CLOCK_HIGH;
>  
> -	if (mode->clock < 5803)
> +	if (mode->clock < dsi->info->min_dclk)
>  		return MODE_CLOCK_LOW;
>  
>  	return MODE_OK;
> @@ -716,6 +731,8 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
>  	platform_set_drvdata(pdev, dsi);
>  	dsi->dev = &pdev->dev;
>  
> +	dsi->info = of_device_get_match_data(&pdev->dev);
> +
>  	ret = drm_of_get_data_lanes_count_ep(dsi->dev->of_node, 1, 0, 1, 4);
>  	if (ret < 0)
>  		return dev_err_probe(dsi->dev, ret,
> @@ -759,13 +776,13 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
>  	 * mode->clock and format are not available. So initialize DPHY with
>  	 * timing parameters for 80Mbps.
>  	 */
> -	ret = rzg2l_mipi_dsi_dphy_init(dsi, 80000000);
> +	ret = dsi->info->dphy_init(dsi, 80000000);
>  	if (ret < 0)
>  		goto err_phy;
>  
>  	txsetr = rzg2l_mipi_dsi_link_read(dsi, TXSETR);
>  	dsi->num_data_lanes = min(((txsetr >> 16) & 3) + 1, num_data_lanes);
> -	rzg2l_mipi_dsi_dphy_exit(dsi);
> +	dsi->info->dphy_exit(dsi);
>  	pm_runtime_put(dsi->dev);
>  
>  	/* Initialize the DRM bridge. */
> @@ -782,7 +799,7 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
>  	return 0;
>  
>  err_phy:
> -	rzg2l_mipi_dsi_dphy_exit(dsi);
> +	dsi->info->dphy_exit(dsi);
>  	pm_runtime_put(dsi->dev);
>  err_pm_disable:
>  	pm_runtime_disable(dsi->dev);
> @@ -797,8 +814,16 @@ static void rzg2l_mipi_dsi_remove(struct platform_device *pdev)
>  	pm_runtime_disable(&pdev->dev);
>  }
>  
> +static const struct rzg2l_mipi_dsi_hw_info rzg2l_mipi_dsi_info = {
> +	.dphy_init = rzg2l_mipi_dsi_dphy_init,
> +	.dphy_exit = rzg2l_mipi_dsi_dphy_exit,
> +	.link_reg_offset = 0x10000,
> +	.max_dclk = 148500,
> +	.min_dclk = 5803,

Here too.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> +};
> +
>  static const struct of_device_id rzg2l_mipi_dsi_of_table[] = {
> -	{ .compatible = "renesas,rzg2l-mipi-dsi" },
> +	{ .compatible = "renesas,rzg2l-mipi-dsi", .data = &rzg2l_mipi_dsi_info, },
>  	{ /* sentinel */ }
>  };
>  
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
> index 1dbc16ec64a4..16efe4dc59f4 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi_regs.h
> @@ -41,8 +41,6 @@
>  #define DSIDPHYTIM3_THS_ZERO(x)		((x) << 0)
>  
>  /* --------------------------------------------------------*/
> -/* Link Registers */
> -#define LINK_REG_OFFSET			0x10000
>  
>  /* Link Status Register */
>  #define LINKSR				0x10

-- 
Regards,

Laurent Pinchart

