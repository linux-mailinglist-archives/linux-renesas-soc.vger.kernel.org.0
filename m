Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2CEE389C1
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Jun 2019 14:06:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727790AbfFGMGu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 7 Jun 2019 08:06:50 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:36708 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727386AbfFGMGu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Jun 2019 08:06:50 -0400
Received: from pendragon.ideasonboard.com (unknown [IPv6:2a02:a03f:44f0:8500:ca05:8177:199c:fed4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B1429B91;
        Fri,  7 Jun 2019 14:06:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1559909207;
        bh=7KMF50FCXnE1VfqOhGM4a6Brkr5UqWdiDJUCbvlknhs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=O3FzoHhX4EmsWLZI9iJGKgDVJ5Q2trwoHYfFlvS+GYL3GBY/JhNHHoe86hBS0m+oD
         iXNNThz9sBmtZMLunQuhWkz0BOtKYwCy5tVtJWCrGtTOwk5n0lLupVANLLyOJ/Kems
         mh4Vq4jOYWxo/+F8eDKIu+JGHMwgPB1MFE7dbrSo=
Date:   Fri, 7 Jun 2019 15:06:33 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch, koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 20/20] drm: rcar-du: kms: Update CMM in atomic commit tail
Message-ID: <20190607120633.GI7593@pendragon.ideasonboard.com>
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
 <20190606142220.1392-21-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190606142220.1392-21-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Thu, Jun 06, 2019 at 04:22:20PM +0200, Jacopo Mondi wrote:
> Update CMM settings at in the atomic commit tail helper method.
> 
> The CMM is updated with new gamma values provided to the driver
> in the GAMMA_LUT blob property.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c | 36 +++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> index 5a910a04e1d9..29a2020a46b5 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> @@ -21,6 +21,7 @@
>  #include <linux/of_platform.h>
>  #include <linux/wait.h>
>  
> +#include "rcar_cmm.h"
>  #include "rcar_du_crtc.h"
>  #include "rcar_du_drv.h"
>  #include "rcar_du_encoder.h"
> @@ -367,6 +368,38 @@ rcar_du_fb_create(struct drm_device *dev, struct drm_file *file_priv,
>   * Atomic Check and Update
>   */
>  
> +static void rcar_du_atomic_commit_update_cmm(struct drm_crtc *crtc,
> +					     struct drm_crtc_state *old_state)
> +{
> +	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
> +	struct rcar_cmm_config cmm_config = {};
> +
> +	if (!rcrtc->cmm || !crtc->state->color_mgmt_changed)
> +		return;
> +
> +	if (!crtc->state->gamma_lut) {
> +		cmm_config.lut.enable = false;
> +		rcar_cmm_setup(rcrtc->cmm, &cmm_config);
> +
> +		return;
> +	}
> +
> +	cmm_config.lut.enable = true;
> +	cmm_config.lut.table = (struct drm_color_lut *)
> +			       crtc->state->gamma_lut->data;
> +
> +	/* Set LUT table size to 0 if entries should not be updated. */
> +	if (!old_state->gamma_lut ||
> +	    (old_state->gamma_lut->base.id !=
> +	    crtc->state->gamma_lut->base.id))
> +		cmm_config.lut.size = crtc->state->gamma_lut->length
> +				    / sizeof(cmm_config.lut.table[0]);

Do you need to call rcar_cmm_setup() at all in this case ?

> +	else
> +		cmm_config.lut.size = 0;
> +
> +	rcar_cmm_setup(rcrtc->cmm, &cmm_config);
> +}
> +
>  static int rcar_du_atomic_check(struct drm_device *dev,
>  				struct drm_atomic_state *state)
>  {
> @@ -409,6 +442,9 @@ static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
>  			rcdu->dpad1_source = rcrtc->index;
>  	}
>  
> +	for_each_old_crtc_in_state(old_state, crtc, crtc_state, i)
> +		rcar_du_atomic_commit_update_cmm(crtc, crtc_state);
> +
>  	/* Apply the atomic update. */
>  	drm_atomic_helper_commit_modeset_disables(dev, old_state);
>  	drm_atomic_helper_commit_planes(dev, old_state,

-- 
Regards,

Laurent Pinchart
