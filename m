Return-Path: <linux-renesas-soc+bounces-17258-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0F8ABDC4D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 May 2025 16:23:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD0581BA2DA7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 May 2025 14:22:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6473827815B;
	Tue, 20 May 2025 14:16:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XiSHIfOB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D85726B2CC;
	Tue, 20 May 2025 14:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747750614; cv=none; b=LV3yBZYl8F+kGuwoxrfYVGjMNZRpMZtDm8P8Qa/oM9LJRlg+WBBsIelcsFAzr3NEGoJaHWWo4i8ZDqY7OCWmUGoh8ZfbsxHu8HCk1UKunWIgwilwzhDPQRsi4bO32Tt4R1ebvjNlk6m2ugHAYH9rYfay9c3jNKlsEU5bXolCmXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747750614; c=relaxed/simple;
	bh=gkT4V1A9YIzLoquF17ziKdUbQs45WRMfVuzK5FJTRPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i2Ko3RaIJmE5JU4ojY69IODnb6jv5PxtE7w6deefx+sj7lXpxxYqZxRDegG3N3YBphU0QNgiyLPE/8KPoM4cKmV57sEfIrxTRINlvbBNZtRk1bdQQ2vdsgwmPGSDb39ZndpP0ppuJp0CMT+PSd/YgDpzi8pvy9cmzWd0UEDsO2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XiSHIfOB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (179.218-130-109.adsl-dyn.isp.belgacom.be [109.130.218.179])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 270AF2EC;
	Tue, 20 May 2025 16:16:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747750590;
	bh=gkT4V1A9YIzLoquF17ziKdUbQs45WRMfVuzK5FJTRPQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XiSHIfOBd0ZZ7snWo+U0XvacrEZtosU6cHhiXHV+0l4j2Hx1G+IWahP4Qf6Qbt0My
	 H8uXsO7Rzya0Z7HQCu6TRnNmB9oy7RbIuoXQKbXhXPkUeRMecW/LgrSuOP6bbx2KH6
	 hY75ZMWkXf+6FQhx2Rjch9li0k+z1JGYmzhJMUw8=
Date: Tue, 20 May 2025 16:16:45 +0200
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
Subject: Re: [PATCH v5 05/12] drm: renesas: rz-du: mipi_dsi: Use VCLK for
 HSFREQ calculation
Message-ID: <20250520141645.GE13321@pendragon.ideasonboard.com>
References: <20250512182330.238259-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250512182330.238259-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250512182330.238259-6-prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi Prabhakar,

On Mon, May 12, 2025 at 07:23:23PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Update the RZ/G2L MIPI DSI driver to calculate HSFREQ using the actual
> VCLK rate instead of the mode clock. The relationship between HSCLK and
> VCLK is:
> 
>     vclk * bpp <= hsclk * 8 * lanes
> 
> Retrieve the VCLK rate using `clk_get_rate(dsi->vclk)`, ensuring that
> HSFREQ accurately reflects the clock rate set in hardware, leading to
> better precision in data transmission.
> 
> Additionally, use `DIV_ROUND_CLOSEST_ULL` for a more precise division
> when computing `hsfreq`. Also, update unit conversions to use correct
> scaling factors for better clarity and correctness.
> 
> Since `clk_get_rate()` returns the clock rate in Hz, update the HSFREQ
> threshold comparisons to use Hz instead of kHz to ensure correct behavior.
> 
> Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v4->v5:
> - Added dev_info() to print the VCLK rate if it doesn't match the
>   requested rate.
> - Added Reviewed-by tag from Biju
> 
> v3->v4:
> - Used MILLI instead of KILO
> 
> v2->v3:
> - No changes
> 
> v1->v2:
> - No changes
> ---
>  .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 30 +++++++++++--------
>  1 file changed, 18 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> index c5f698cd74f1..3f6988303e63 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> @@ -8,6 +8,7 @@
>  #include <linux/delay.h>
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
> +#include <linux/math.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_graph.h>
> @@ -15,6 +16,7 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/reset.h>
>  #include <linux/slab.h>
> +#include <linux/units.h>
>  
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
> @@ -199,7 +201,7 @@ static int rzg2l_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
>  	/* All DSI global operation timings are set with recommended setting */
>  	for (i = 0; i < ARRAY_SIZE(rzg2l_mipi_dsi_global_timings); ++i) {
>  		dphy_timings = &rzg2l_mipi_dsi_global_timings[i];
> -		if (hsfreq <= dphy_timings->hsfreq_max)
> +		if (hsfreq <= (dphy_timings->hsfreq_max * MILLI))

No need for the inner parentheses.

>  			break;
>  	}
>  
> @@ -258,7 +260,7 @@ static void rzg2l_mipi_dsi_dphy_exit(struct rzg2l_mipi_dsi *dsi)
>  static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
>  				  const struct drm_display_mode *mode)
>  {
> -	unsigned long hsfreq;
> +	unsigned long hsfreq, vclk_rate;
>  	unsigned int bpp;
>  	u32 txsetr;
>  	u32 clstptsetr;
> @@ -269,6 +271,12 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
>  	u32 golpbkt;
>  	int ret;
>  
> +	ret = pm_runtime_resume_and_get(dsi->dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	clk_set_rate(dsi->vclk, mode->clock * MILLI);
> +
>  	/*
>  	 * Relationship between hsclk and vclk must follow
>  	 * vclk * bpp = hsclk * 8 * lanes
> @@ -280,13 +288,11 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
>  	 * hsclk(bit) = hsclk(byte) * 8 = hsfreq
>  	 */
>  	bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
> -	hsfreq = (mode->clock * bpp) / dsi->lanes;
> -
> -	ret = pm_runtime_resume_and_get(dsi->dev);
> -	if (ret < 0)
> -		return ret;
> -
> -	clk_set_rate(dsi->vclk, mode->clock * 1000);
> +	vclk_rate = clk_get_rate(dsi->vclk);
> +	if (vclk_rate != mode->clock * MILLI)
> +		dev_info(dsi->dev, "Requested vclk rate %lu, actual %lu mismatch\n",
> +			 mode->clock * MILLI, vclk_rate);

There's a high risk that the requested rate won't be achieved exactly.
Do we really want to print a non-debug message to the kernel log every
time ?

> +	hsfreq = DIV_ROUND_CLOSEST_ULL(vclk_rate * bpp, dsi->lanes);

I doubt DIV_ROUND_CLOSEST_ULL() will make any difference in practice
given that you can't have more than 4 lanes, but that's fine.

>  
>  	ret = rzg2l_mipi_dsi_dphy_init(dsi, hsfreq);
>  	if (ret < 0)
> @@ -304,12 +310,12 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
>  	 * - data lanes: maximum 4 lanes
>  	 * Therefore maximum hsclk will be 891 Mbps.
>  	 */
> -	if (hsfreq > 445500) {
> +	if (hsfreq > 445500000) {
>  		clkkpt = 12;
>  		clkbfht = 15;
>  		clkstpt = 48;
>  		golpbkt = 75;
> -	} else if (hsfreq > 250000) {
> +	} else if (hsfreq > 250000000) {
>  		clkkpt = 7;
>  		clkbfht = 8;
>  		clkstpt = 27;
> @@ -753,7 +759,7 @@ static int rzg2l_mipi_dsi_probe(struct platform_device *pdev)
>  	 * mode->clock and format are not available. So initialize DPHY with
>  	 * timing parameters for 80Mbps.
>  	 */
> -	ret = rzg2l_mipi_dsi_dphy_init(dsi, 80000);
> +	ret = rzg2l_mipi_dsi_dphy_init(dsi, 80000000);
>  	if (ret < 0)
>  		goto err_phy;
>  

-- 
Regards,

Laurent Pinchart

