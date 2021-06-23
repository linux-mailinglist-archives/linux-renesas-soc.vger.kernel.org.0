Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21C2D3B1AD8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 15:12:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230411AbhFWNOo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 23 Jun 2021 09:14:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230354AbhFWNOn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 23 Jun 2021 09:14:43 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4F3DC061574
        for <linux-renesas-soc@vger.kernel.org>; Wed, 23 Jun 2021 06:12:25 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 55B329AA;
        Wed, 23 Jun 2021 15:12:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624453944;
        bh=EafNmw9SFZaSzMDy3I0iwr7yQF2YfErKOGedHk1eRoM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KFlm0n6cpAXPOOrATsFdVuV1yUMw18ZfPQHO9s2LNkLQEzPoL/QiU7Bp+Bh+ogHFB
         ox2bJbwi/3inh0JI7VYwhANj/A8ETUAHA2U/6jPUQwhRU/R2J6ftmCH3tBCBNLQ4Qr
         TOmwjO7PSjePyO9X6NIiK0rRn81wBORQR/udo5kc=
Date:   Wed, 23 Jun 2021 16:11:54 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        LUU HOAI <hoai.luu.ub@renesas.com>
Subject: Re: [RFC PATCH 16/15] rcar-du: dsi: Unexport clock functions
Message-ID: <YNMzGlD4lXBntAVg@pendragon.ideasonboard.com>
References: <20210623034656.10316-1-laurent.pinchart+renesas@ideasonboard.com>
 <20210623110059.3408353-1-kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210623110059.3408353-1-kieran.bingham@ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

Thank you for the patch.

On Wed, Jun 23, 2021 at 12:00:59PM +0100, Kieran Bingham wrote:
> The rcar_mipi_dsi_clk_enable and rcar_mipi_dsi_clk_disable functions
> are exported so that they can be operated directly from the DU CRTC.
> 
> This is not required, and can be handled directly through the bridge.
> 
> The functionality is split while moving, as the rcar_mipi_dsi_startup()
> and rcar_mipi_dsi_shutdown() are not handling the clocks and so
> shouldn't be left in the clock specific functions.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
> 
> This patch extends Laurent's series, and would ultimately be squashed
> into the DSI driver.
> 
> 
> 
>  drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c | 98 ++++++++++++++-----------
>  drivers/gpu/drm/rcar-du/rcar_mipi_dsi.h | 26 -------
>  2 files changed, 54 insertions(+), 70 deletions(-)
>  delete mode 100644 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.h
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> index 026026bbb367..4c5ef4de0ea7 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> @@ -5,8 +5,6 @@
>   * Copyright (C) 2020 Renesas Electronics Corporation
>   */
>  
> -#include "rcar_mipi_dsi.h"
> -
>  #include <linux/clk.h>
>  #include <linux/delay.h>
>  #include <linux/io.h>
> @@ -451,6 +449,33 @@ static void rcar_mipi_dsi_shutdown(struct rcar_mipi_dsi *dsi)
>  	dev_dbg(dsi->dev, "DSI device is shutdown\n");
>  }
>  
> +static int rcar_mipi_dsi_clk_enable(struct rcar_mipi_dsi *dsi)
> +{
> +	int ret;
> +
> +	reset_control_deassert(dsi->rstc);
> +
> +	ret = clk_prepare_enable(dsi->clocks.mod);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = clk_prepare_enable(dsi->clocks.dsi);
> +	if (ret < 0) {
> +		clk_disable_unprepare(dsi->clocks.mod);
> +		return ret;
> +	}

I'll add a reset_control_assert() in the error paths.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
> +	return 0;
> +}
> +
> +static void rcar_mipi_dsi_clk_disable(struct rcar_mipi_dsi *dsi)
> +{
> +	clk_disable_unprepare(dsi->clocks.dsi);
> +	clk_disable_unprepare(dsi->clocks.mod);
> +
> +	reset_control_assert(dsi->rstc);
> +}
> +
>  static int rcar_mipi_dsi_start_hs_clock(struct rcar_mipi_dsi *dsi)
>  {
>  	/*
> @@ -542,13 +567,38 @@ static void rcar_mipi_dsi_enable(struct drm_bridge *bridge)
>  	struct rcar_mipi_dsi *dsi = bridge_to_rcar_mipi_dsi(bridge);
>  	int ret;
>  
> +	ret = rcar_mipi_dsi_clk_enable(dsi);
> +	if (ret < 0) {
> +		dev_err(dsi->dev, "failed to enable DSI clocks\n");
> +		return;
> +	}
> +
> +	ret = rcar_mipi_dsi_startup(dsi);
> +	if (ret < 0)
> +		goto err_dsi_startup;
> +
>  	rcar_mipi_dsi_set_display_timing(dsi);
>  
>  	ret = rcar_mipi_dsi_start_hs_clock(dsi);
>  	if (ret < 0)
> -		return;
> +		goto err_dsi_start_hs;
>  
>  	rcar_mipi_dsi_start_video(dsi);
> +
> +	return;
> +
> +err_dsi_start_hs:
> +	rcar_mipi_dsi_shutdown(dsi);
> +err_dsi_startup:
> +	rcar_mipi_dsi_clk_disable(dsi);
> +}
> +
> +static void rcar_mipi_dsi_disable(struct drm_bridge *bridge)
> +{
> +	struct rcar_mipi_dsi *dsi = bridge_to_rcar_mipi_dsi(bridge);
> +
> +	rcar_mipi_dsi_shutdown(dsi);
> +	rcar_mipi_dsi_clk_disable(dsi);
>  }
>  
>  static enum drm_mode_status
> @@ -566,6 +616,7 @@ static const struct drm_bridge_funcs rcar_mipi_dsi_bridge_ops = {
>  	.attach = rcar_mipi_dsi_attach,
>  	.mode_set = rcar_mipi_dsi_mode_set,
>  	.enable = rcar_mipi_dsi_enable,
> +	.disable = rcar_mipi_dsi_disable,
>  	.mode_valid = rcar_mipi_dsi_bridge_mode_valid,
>  };
>  
> @@ -573,47 +624,6 @@ static const struct drm_bridge_funcs rcar_mipi_dsi_bridge_ops = {
>   * Clock Setting
>   */
>  
> -int rcar_mipi_dsi_clk_enable(struct drm_bridge *bridge)
> -{
> -	struct rcar_mipi_dsi *dsi = bridge_to_rcar_mipi_dsi(bridge);
> -	int ret;
> -
> -	reset_control_deassert(dsi->rstc);
> -
> -	ret = clk_prepare_enable(dsi->clocks.mod);
> -	if (ret < 0)
> -		return ret;
> -
> -	ret = clk_prepare_enable(dsi->clocks.dsi);
> -	if (ret < 0)
> -		goto err_clock_mod;
> -
> -	ret = rcar_mipi_dsi_startup(dsi);
> -	if (ret < 0)
> -		goto err_clock_dsi;
> -
> -	return 0;
> -
> -err_clock_dsi:
> -	clk_disable_unprepare(dsi->clocks.dsi);
> -err_clock_mod:
> -	clk_disable_unprepare(dsi->clocks.mod);
> -	return ret;
> -}
> -EXPORT_SYMBOL_GPL(rcar_mipi_dsi_clk_enable);
> -
> -void rcar_mipi_dsi_clk_disable(struct drm_bridge *bridge)
> -{
> -	struct rcar_mipi_dsi *dsi = bridge_to_rcar_mipi_dsi(bridge);
> -
> -	rcar_mipi_dsi_shutdown(dsi);
> -
> -	clk_disable_unprepare(dsi->clocks.dsi);
> -	clk_disable_unprepare(dsi->clocks.mod);
> -
> -	reset_control_assert(dsi->rstc);
> -}
> -EXPORT_SYMBOL_GPL(rcar_mipi_dsi_clk_disable);
>  
>  /* -----------------------------------------------------------------------------
>   * Host setting
> diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.h b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.h
> deleted file mode 100644
> index a937ab7ddcd4..000000000000
> --- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.h
> +++ /dev/null
> @@ -1,26 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -/*
> - * rcar_mipi_dsi.h  --  R-Car MIPI_DSI Encoder
> - *
> - * Copyright (C) 2020 Renesas Electronics Corporation
> - */
> -
> -#ifndef __RCAR_MIPI_DSI_H__
> -#define __RCAR_MIPI_DSI_H__
> -
> -struct drm_bridge;
> -
> -#if IS_ENABLED(CONFIG_DRM_RCAR_MIPI_DSI)
> -int rcar_mipi_dsi_clk_enable(struct drm_bridge *bridge);
> -void rcar_mipi_dsi_clk_disable(struct drm_bridge *bridge);
> -
> -#else
> -static inline int rcar_mipi_dsi_clk_enable(struct drm_bridge *bridge)
> -{
> -	return -ENOSYS;
> -}
> -static inline void rcar_mipi_dsi_clk_disable(struct drm_bridge *bridge) { }
> -
> -#endif /* CONFIG_DRM_RCAR_MIPI_DSI */
> -
> -#endif /* __RCAR_MIPI_DSI_H__ */

-- 
Regards,

Laurent Pinchart
