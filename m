Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3A5511AC8A
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 May 2019 15:56:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726540AbfELN4B (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 12 May 2019 09:56:01 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:57122 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726423AbfELN4B (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 12 May 2019 09:56:01 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 616B52B6;
        Sun, 12 May 2019 15:55:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1557669358;
        bh=S+hZYXtoJjYSMo9K9sr81T/Awk02j+RyY6TH9RtOq2s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JRbbdvA0NkoO8nVWjccGDNpWycHJ6aS/S04QKO6dKBDw1lhDcIdK1e2/iVAEAalze
         pDUDh+QIL++/ffjHW/uGi88OJIgPm+bXYqOc4CYJfEy2VAt/DweHBrEgNpZikbIHIJ
         mqkh1JpHkFVUCLI4U307Qw/BMGV0VeU25eKPtRT8=
Date:   Sun, 12 May 2019 16:55:42 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        David Airlie <airlied@linux.ie>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 5/6] drm: rcar-du: Create a group state object
Message-ID: <20190512135542.GF4960@pendragon.ideasonboard.com>
References: <20190315170110.23280-1-kieran.bingham+renesas@ideasonboard.com>
 <20190315170110.23280-6-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190315170110.23280-6-kieran.bingham+renesas@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

Thank you for the patch.

On Fri, Mar 15, 2019 at 05:01:09PM +0000, Kieran Bingham wrote:
> Create a new private state object for the DU groups, and move the
> initialisation of a group object to a new function rcar_du_group_init().
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
> v2:
>  - No change
> 
>  drivers/gpu/drm/rcar-du/rcar_du_group.c | 81 +++++++++++++++++++++++++
>  drivers/gpu/drm/rcar-du/rcar_du_group.h | 22 +++++++
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c   | 27 ++-------
>  3 files changed, 107 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c b/drivers/gpu/drm/rcar-du/rcar_du_group.c
> index 9eee47969e77..9c82d666f170 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
> @@ -26,6 +26,10 @@
>  #include <linux/clk.h>
>  #include <linux/io.h>

Please include <linux/slab.h> for kzalloc() and kfree().

>  
> +#include <drm/drm_atomic.h>
> +#include <drm/drm_atomic_state_helper.h>
> +#include <drm/drm_device.h>
> +
>  #include "rcar_du_drv.h"
>  #include "rcar_du_group.h"
>  #include "rcar_du_regs.h"
> @@ -351,3 +355,80 @@ int rcar_du_group_set_routing(struct rcar_du_group *rgrp)
>  
>  	return rcar_du_set_dpad0_vsp1_routing(rgrp->dev);
>  }
> +
> +static struct drm_private_state *
> +rcar_du_group_atomic_duplicate_state(struct drm_private_obj *obj)
> +{
> +	struct rcar_du_group_state *state;
> +
> +	if (WARN_ON(!obj->state))
> +		return NULL;
> +
> +	state = kzalloc(sizeof(*state), GFP_KERNEL);
> +	if (state == NULL)
> +		return NULL;
> +
> +	__drm_atomic_helper_private_obj_duplicate_state(obj, &state->state);
> +
> +	return &state->state;
> +}
> +
> +static void rcar_du_group_atomic_destroy_state(struct drm_private_obj *obj,
> +					       struct drm_private_state *state)
> +{
> +	kfree(to_rcar_group_state(state));
> +}
> +
> +static const struct drm_private_state_funcs rcar_du_group_state_funcs = {
> +	.atomic_duplicate_state = rcar_du_group_atomic_duplicate_state,
> +	.atomic_destroy_state = rcar_du_group_atomic_destroy_state,
> +};
> +
> +/*
> + * rcar_du_group_init - Initialise and reset a group object
> + *
> + * Return 0 in case of success or a negative error code otherwise.
> + */
> +int rcar_du_group_init(struct rcar_du_device *rcdu, struct rcar_du_group *rgrp,
> +		       unsigned int index)
> +{
> +	static const unsigned int mmio_offsets[] = {
> +		DU0_REG_OFFSET, DU2_REG_OFFSET
> +	};
> +
> +	struct rcar_du_group_state *state;
> +
> +	state = kzalloc(sizeof(*state), GFP_KERNEL);
> +	if (!state)
> +		return -ENOMEM;
> +
> +	drm_atomic_private_obj_init(rcdu->ddev, &rgrp->private, &state->state,
> +				    &rcar_du_group_state_funcs);
> +
> +	mutex_init(&rgrp->lock);
> +
> +	rgrp->dev = rcdu;
> +	rgrp->mmio_offset = mmio_offsets[index];
> +	rgrp->index = index;
> +	/* Extract the channel mask for this group only. */
> +	rgrp->channels_mask = (rcdu->info->channels_mask >> (2 * index))
> +			    & GENMASK(1, 0);
> +	rgrp->num_crtcs = hweight8(rgrp->channels_mask);
> +
> +	/*
> +	 * If we have more than one CRTC in this group pre-associate
> +	 * the low-order planes with CRTC 0 and the high-order planes
> +	 * with CRTC 1 to minimize flicker occurring when the
> +	 * association is changed.
> +	 */
> +	rgrp->dptsr_planes = rgrp->num_crtcs > 1
> +			   ? (rcdu->info->gen >= 3 ? 0x04 : 0xf0)
> +			   : 0;
> +
> +	return 0;
> +}
> +
> +void rcar_du_group_cleanup(struct rcar_du_group *rgrp)
> +{

I would add a mutex_cleanup(&rgrp->lock) here. Apart from that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +	drm_atomic_private_obj_fini(&rgrp->private);
> +}
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.h b/drivers/gpu/drm/rcar-du/rcar_du_group.h
> index 87950c1f6a52..4b812e167987 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_group.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_group.h
> @@ -12,12 +12,15 @@
>  
>  #include <linux/mutex.h>
>  
> +#include <drm/drm_atomic.h>
> +
>  #include "rcar_du_plane.h"
>  
>  struct rcar_du_device;
>  
>  /*
>   * struct rcar_du_group - CRTCs and planes group
> + * @private: The base drm private object
>   * @dev: the DU device
>   * @mmio_offset: registers offset in the device memory map
>   * @index: group index
> @@ -32,6 +35,8 @@ struct rcar_du_device;
>   * @need_restart: the group needs to be restarted due to a configuration change
>   */
>  struct rcar_du_group {
> +	struct drm_private_obj private;
> +
>  	struct rcar_du_device *dev;
>  	unsigned int mmio_offset;
>  	unsigned int index;
> @@ -49,6 +54,19 @@ struct rcar_du_group {
>  	bool need_restart;
>  };
>  
> +#define to_rcar_group(s) container_of(s, struct rcar_du_group, private)
> +
> +/**
> + * struct rcar_du_group_state - Driver-specific group state
> + * @state: base DRM private state
> + */
> +struct rcar_du_group_state {
> +	struct drm_private_state state;
> +};
> +
> +#define to_rcar_group_state(s) \
> +	container_of(s, struct rcar_du_group_state, state)
> +
>  u32 rcar_du_group_read(struct rcar_du_group *rgrp, u32 reg);
>  void rcar_du_group_write(struct rcar_du_group *rgrp, u32 reg, u32 data);
>  
> @@ -60,4 +78,8 @@ int rcar_du_group_set_routing(struct rcar_du_group *rgrp);
>  
>  int rcar_du_set_dpad0_vsp1_routing(struct rcar_du_device *rcdu);
>  
> +int rcar_du_group_init(struct rcar_du_device *rcdu, struct rcar_du_group *rgrp,
> +		       unsigned int index);
> +void rcar_du_group_cleanup(struct rcar_du_group *rgrp);
> +
>  #endif /* __RCAR_DU_GROUP_H__ */
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> index ece92cff2137..eb01bea1ab83 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> @@ -23,6 +23,7 @@
>  #include "rcar_du_crtc.h"
>  #include "rcar_du_drv.h"
>  #include "rcar_du_encoder.h"
> +#include "rcar_du_group.h"
>  #include "rcar_du_kms.h"
>  #include "rcar_du_regs.h"
>  #include "rcar_du_vsp.h"
> @@ -516,10 +517,6 @@ static int rcar_du_vsps_init(struct rcar_du_device *rcdu)
>  
>  int rcar_du_modeset_init(struct rcar_du_device *rcdu)
>  {
> -	static const unsigned int mmio_offsets[] = {
> -		DU0_REG_OFFSET, DU2_REG_OFFSET
> -	};
> -
>  	struct drm_device *dev = rcdu->ddev;
>  	struct drm_encoder *encoder;
>  	struct rcar_du_group *rgrp;
> @@ -566,25 +563,9 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
>  
>  	/* Initialize the groups. */
>  	for_each_rcdu_group(rcdu, rgrp, i) {
> -		mutex_init(&rgrp->lock);
> -
> -		rgrp->dev = rcdu;
> -		rgrp->mmio_offset = mmio_offsets[i];
> -		rgrp->index = i;
> -		/* Extract the channel mask for this group only. */
> -		rgrp->channels_mask = (rcdu->info->channels_mask >> (2 * i))
> -				   & GENMASK(1, 0);
> -		rgrp->num_crtcs = hweight8(rgrp->channels_mask);
> -
> -		/*
> -		 * If we have more than one CRTCs in this group pre-associate
> -		 * the low-order planes with CRTC 0 and the high-order planes
> -		 * with CRTC 1 to minimize flicker occurring when the
> -		 * association is changed.
> -		 */
> -		rgrp->dptsr_planes = rgrp->num_crtcs > 1
> -				   ? (rcdu->info->gen >= 3 ? 0x04 : 0xf0)
> -				   : 0;
> +		ret = rcar_du_group_init(rcdu, rgrp, i);
> +		if (ret < 0)
> +			return ret;
>  
>  		if (!rcar_du_has(rcdu, RCAR_DU_FEATURE_VSP1_SOURCE)) {
>  			ret = rcar_du_planes_init(rgrp);

-- 
Regards,

Laurent Pinchart
