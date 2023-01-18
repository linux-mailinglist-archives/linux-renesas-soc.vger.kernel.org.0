Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9D9E06729ED
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Jan 2023 22:06:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230153AbjARVGR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 Jan 2023 16:06:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230119AbjARVGQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Jan 2023 16:06:16 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67969568B2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 18 Jan 2023 13:06:15 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 078691056;
        Wed, 18 Jan 2023 22:06:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674075973;
        bh=U5qbAJJq9CLWKTVtYAeUYCio/vHQLPdayFarJkPX4Pg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=b1u5CL4Z/1gS/xMbZNAKRncorBXW7KV0Jjrsf6mCuPloiwXHZsdIplS7i1i3+cQs9
         j0s6O7dqTbLeqVYOi8mH0DrK0DF5ow5fyrEl82eJPO7ZQ27/MFqjlYxHr8B6jyxYDC
         Qt82oiNQ1aM9DRPbP5glD426SN9GGGzk94mf7dfI=
Date:   Wed, 18 Jan 2023 23:06:11 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        LUU HOAI <hoai.luu.ub@renesas.com>
Subject: Re: [PATCH 2/6] drm: rcar-du: lvds: Add reset control
Message-ID: <Y8hfQy9zp9WKluq/@pendragon.ideasonboard.com>
References: <20230117135154.387208-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20230117135154.387208-3-tomi.valkeinen+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230117135154.387208-3-tomi.valkeinen+renesas@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Tue, Jan 17, 2023 at 03:51:50PM +0200, Tomi Valkeinen wrote:
> From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> 
> Reset LVDS using the reset control as CPG reset/release is required in
> H/W manual sequence.

s@H/W@the hardware@

> Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
> [tomi.valkeinen: Rewrite the patch description]
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/rcar-du/Kconfig     |  1 +
>  drivers/gpu/drm/rcar-du/rcar_lvds.c | 15 +++++++++++++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
> index a8f862c68b4f..151e400b996d 100644
> --- a/drivers/gpu/drm/rcar-du/Kconfig
> +++ b/drivers/gpu/drm/rcar-du/Kconfig
> @@ -43,6 +43,7 @@ config DRM_RCAR_LVDS
>  	select DRM_PANEL
>  	select OF_FLATTREE
>  	select OF_OVERLAY
> +	select RESET_CONTROLLER
>  
>  config DRM_RCAR_USE_MIPI_DSI
>  	bool "R-Car DU MIPI DSI Encoder Support"
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> index 81a060c2fe3f..674b727cdaa2 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -16,6 +16,7 @@
>  #include <linux/of_device.h>
>  #include <linux/of_graph.h>
>  #include <linux/platform_device.h>
> +#include <linux/reset.h>
>  #include <linux/slab.h>
>  #include <linux/sys_soc.h>
>  
> @@ -60,6 +61,7 @@ struct rcar_lvds_device_info {
>  struct rcar_lvds {
>  	struct device *dev;
>  	const struct rcar_lvds_device_info *info;
> +	struct reset_control *rstc;
>  
>  	struct drm_bridge bridge;
>  
> @@ -316,6 +318,8 @@ int rcar_lvds_pclk_enable(struct drm_bridge *bridge, unsigned long freq)
>  
>  	dev_dbg(lvds->dev, "enabling LVDS PLL, freq=%luHz\n", freq);
>  
> +	reset_control_deassert(lvds->rstc);

Can this fail ? Same in __rcar_lvds_atomic_enable().

> +
>  	ret = clk_prepare_enable(lvds->clocks.mod);

It would be nice to switch this driver to runtime PM and move reset and
clock handling to the suspend/resume handlers. A candidate for a future
patch.

>  	if (ret < 0)

Missing reset_control_assert(). Same in other error paths if applicable,
here and in __rcar_lvds_atomic_enable().

>  		return ret;
> @@ -338,6 +342,8 @@ void rcar_lvds_pclk_disable(struct drm_bridge *bridge)
>  	rcar_lvds_write(lvds, LVDPLLCR, 0);
>  
>  	clk_disable_unprepare(lvds->clocks.mod);
> +
> +	reset_control_assert(lvds->rstc);
>  }
>  EXPORT_SYMBOL_GPL(rcar_lvds_pclk_disable);
>  
> @@ -396,6 +402,8 @@ static void __rcar_lvds_atomic_enable(struct drm_bridge *bridge,
>  	u32 lvdcr0;
>  	int ret;
>  
> +	reset_control_deassert(lvds->rstc);
> +
>  	ret = clk_prepare_enable(lvds->clocks.mod);
>  	if (ret < 0)
>  		return;
> @@ -552,6 +560,7 @@ static void rcar_lvds_atomic_disable(struct drm_bridge *bridge,
>  						       old_bridge_state);
>  
>  	clk_disable_unprepare(lvds->clocks.mod);
> +	reset_control_assert(lvds->rstc);
>  }
>  
>  static bool rcar_lvds_mode_fixup(struct drm_bridge *bridge,
> @@ -844,6 +853,12 @@ static int rcar_lvds_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		return ret;
>  
> +	lvds->rstc = devm_reset_control_get(&pdev->dev, NULL);
> +	if (IS_ERR(lvds->rstc)) {
> +		dev_err(&pdev->dev, "failed to get cpg reset\n");
> +		return PTR_ERR(lvds->rstc);
> +	}
> +
>  	drm_bridge_add(&lvds->bridge);
>  
>  	return 0;

-- 
Regards,

Laurent Pinchart
