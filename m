Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 021269DA45
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Aug 2019 02:05:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726543AbfH0AF1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Aug 2019 20:05:27 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:58086 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726278AbfH0AF1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Aug 2019 20:05:27 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2532931B;
        Tue, 27 Aug 2019 02:05:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1566864324;
        bh=Jkzf9ucXI/EfCdTUo0LbDuJ5qhZF+9L/kEIa24X2Tv8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=t+vusSJPglqdjBfFrg/feSwydVrUj5uKYIA85z7FIg6xXNVT2amlpCXKJJGH0DECj
         PBogkAmD4v8eD01HfOrBI8p5pOZ7pIOt5dNTblMbHrYwUV/QUymYYOz2Go0VXiO477
         pq1FqAXVM1yc9Glvm/LhUDaVmSRR2WLTNorjvj2Q=
Date:   Tue, 27 Aug 2019 03:05:17 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     kieran.bingham+renesas@ideasonboard.com, geert@linux-m68k.org,
        horms@verge.net.au, uli@fpond.eu, airlied@linux.ie,
        daniel@ffwll.ch, koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 14/14] drm: rcar-du: Force CMM enablement when resuming
Message-ID: <20190827000517.GC5274@pendragon.ideasonboard.com>
References: <20190825135154.11488-1-jacopo+renesas@jmondi.org>
 <20190825135154.11488-15-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190825135154.11488-15-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

(Question for Daniel below)

Thank you for the patch.

On Sun, Aug 25, 2019 at 03:51:54PM +0200, Jacopo Mondi wrote:
> When resuming from system suspend, the DU driver is responsible for
> reprogramming and enabling the CMM unit if it was in use at the time
> the system entered the suspend state.
> 
> Force the color_mgmt_changed flag to true if any of the DRM color
> transformation properties was set in the CRTC state duplicated at
> suspend time, as the CMM gets reprogrammed only if said flag is active in
> the rcar_du_atomic_commit_update_cmm() method.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> index 018480a8f35c..6e38495fb78f 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -17,6 +17,7 @@
>  #include <linux/slab.h>
>  #include <linux/wait.h>
>  
> +#include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_fb_cma_helper.h>
>  #include <drm/drm_fb_helper.h>
> @@ -482,6 +483,26 @@ static int rcar_du_pm_suspend(struct device *dev)
>  static int rcar_du_pm_resume(struct device *dev)
>  {
>  	struct rcar_du_device *rcdu = dev_get_drvdata(dev);
> +	struct drm_atomic_state *state = rcdu->ddev->mode_config.suspend_state;
> +	unsigned int i;
> +
> +	for (i = 0; i < rcdu->num_crtcs; ++i) {
> +		struct drm_crtc *crtc = &rcdu->crtcs[i].crtc;
> +		struct drm_crtc_state *crtc_state;
> +
> +		crtc_state = drm_atomic_get_existing_crtc_state(state, crtc);
> +		if (!crtc_state)
> +			continue;

Shouldn't you get the new state here ?

> +
> +		/*
> +		 * Force re-enablement of CMM after system resume if any
> +		 * of the DRM color transformation properties was set in
> +		 * the state saved at system suspend time.
> +		 */
> +		if (crtc_state->gamma_lut || crtc_state->degamma_lut ||
> +		    crtc_state->ctm)

We don't support degamma_lut or crm, so I would drop those.

With these small issues addressed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Shouldn't we however squash this with the previous patch to avoid
bisection issues ?

> +			crtc_state->color_mgmt_changed = true;

Daniel, is this something that would make sense in the KMS core (or
helpers) ?

> +	}
>  
>  	return drm_mode_config_helper_resume(rcdu->ddev);
>  }

-- 
Regards,

Laurent Pinchart
