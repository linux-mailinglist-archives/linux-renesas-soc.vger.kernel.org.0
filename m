Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A3BA675AC0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Jan 2023 18:05:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229980AbjATRFl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 20 Jan 2023 12:05:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbjATRFk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Jan 2023 12:05:40 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC61229157
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Jan 2023 09:05:39 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E4890514;
        Fri, 20 Jan 2023 18:05:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674234338;
        bh=b8VUFbYiJ3TngBo7JvJhQkGt5UVU26kqsS/qDkl+99Q=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CBOuSAOrP1NmBiCCPrbQeFSS64uxHCVONb6xX1Fh5/4ZJv7koigSWf/AnvIiW46VP
         DPkiaWo8qeHHd4xb6TE95YvSa5L9dqC4EuqT3qTsvHQxViNMlk/NMlXxLCNMHFAk2R
         eTnzpaJ5RD2FT6RzqfRw5DoCGxl7fSNhDyoCRMr0=
Date:   Fri, 20 Jan 2023 19:05:35 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 3/7] drm: rcar-du: lvsd: Add reset control
Message-ID: <Y8rJ32P/T4JFcz4O@pendragon.ideasonboard.com>
References: <20230120085009.604797-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20230120085009.604797-4-tomi.valkeinen+renesas@ideasonboard.com>
 <Y8q+vUks4HzLZA1U@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y8q+vUks4HzLZA1U@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jan 20, 2023 at 06:18:07PM +0200, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.

Another small comment: in the commit message, s/lvsd/lvds/

> On Fri, Jan 20, 2023 at 10:50:05AM +0200, Tomi Valkeinen wrote:
> > Reset LVDS using the reset control as CPG reset/release is required in
> > the hardware manual sequence.
> > 
> > Based on a BSP patch from Koji Matsuoka <koji.matsuoka.xm@renesas.com>.
> > 
> > Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> > ---
> >  drivers/gpu/drm/rcar-du/Kconfig     |  1 +
> >  drivers/gpu/drm/rcar-du/rcar_lvds.c | 19 ++++++++++++++++++-
> >  2 files changed, 19 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/rcar-du/Kconfig b/drivers/gpu/drm/rcar-du/Kconfig
> > index a8f862c68b4f..151e400b996d 100644
> > --- a/drivers/gpu/drm/rcar-du/Kconfig
> > +++ b/drivers/gpu/drm/rcar-du/Kconfig
> > @@ -43,6 +43,7 @@ config DRM_RCAR_LVDS
> >  	select DRM_PANEL
> >  	select OF_FLATTREE
> >  	select OF_OVERLAY
> > +	select RESET_CONTROLLER
> >  
> >  config DRM_RCAR_USE_MIPI_DSI
> >  	bool "R-Car DU MIPI DSI Encoder Support"
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> > index 8e1be51fbee6..668604616bfd 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> > @@ -17,6 +17,7 @@
> >  #include <linux/of_graph.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/pm_runtime.h>
> > +#include <linux/reset.h>
> >  #include <linux/slab.h>
> >  #include <linux/sys_soc.h>
> >  
> > @@ -61,6 +62,7 @@ struct rcar_lvds_device_info {
> >  struct rcar_lvds {
> >  	struct device *dev;
> >  	const struct rcar_lvds_device_info *info;
> > +	struct reset_control *rstc;
> >  
> >  	struct drm_bridge bridge;
> >  
> > @@ -845,6 +847,10 @@ static int rcar_lvds_probe(struct platform_device *pdev)
> >  	if (ret < 0)
> >  		return ret;
> >  
> > +	lvds->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
> > +	if (IS_ERR(lvds->rstc))
> > +		return dev_err_probe(&pdev->dev, PTR_ERR(lvds->rstc),
> > +				     "failed to get cpg reset\n");
> 
> Missing blank line.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> >  	pm_runtime_enable(&pdev->dev);
> >  
> >  	drm_bridge_add(&lvds->bridge);
> > @@ -924,6 +930,8 @@ static int rcar_lvds_runtime_suspend(struct device *dev)
> >  
> >  	clk_disable_unprepare(lvds->clocks.mod);
> >  
> > +	reset_control_assert(lvds->rstc);
> > +
> >  	return 0;
> >  }
> >  
> > @@ -932,11 +940,20 @@ static int rcar_lvds_runtime_resume(struct device *dev)
> >  	struct rcar_lvds *lvds = dev_get_drvdata(dev);
> >  	int ret;
> >  
> > +	ret = reset_control_deassert(lvds->rstc);
> > +	if (ret)
> > +		return ret;
> > +
> >  	ret = clk_prepare_enable(lvds->clocks.mod);
> >  	if (ret < 0)
> > -		return ret;
> > +		goto err_reset_assert;
> >  
> >  	return 0;
> > +
> > +err_reset_assert:
> > +	reset_control_assert(lvds->rstc);
> > +
> > +	return ret;
> >  }
> >  
> >  static const struct dev_pm_ops rcar_lvds_pm_ops = {
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Regards,

Laurent Pinchart
