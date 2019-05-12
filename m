Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA2A81AD12
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 May 2019 18:41:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726529AbfELQlV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 12 May 2019 12:41:21 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:39126 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726478AbfELQlU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 12 May 2019 12:41:20 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 167CC2B6;
        Sun, 12 May 2019 18:41:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1557679277;
        bh=PrwIXJxT2dZCPmvZZ2l3MenWdQbURw9kGvyuKg22btc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=d1pxzR9sIM+nbTgYlb0fqNy0vISFD9GYPMXXBOaMbj1Y9uvOzyIa2DvUAFzI/vbs8
         4b+SSTMKEn4N78qcAhVkuEGjKn1CswFKK9qDRp5FCUqjKVyM72nkb0ftmt/TgLehIg
         1wKjeSO4q+9UNSNraX2BWA1/Qo5MV8oAbcH72bnU=
Date:   Sun, 12 May 2019 19:41:00 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        David Airlie <airlied@linux.ie>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 6/6] drm: rcar-du: Add group hooks for atomic-commit
Message-ID: <20190512164100.GG4960@pendragon.ideasonboard.com>
References: <20190315170110.23280-1-kieran.bingham+renesas@ideasonboard.com>
 <20190315170110.23280-7-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190315170110.23280-7-kieran.bingham+renesas@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

Thank you for the patch.

On Fri, Mar 15, 2019 at 05:01:10PM +0000, Kieran Bingham wrote:
> The group can now be handled independently from the CRTC tracking its
> own state.
> 
> Introduce an rcar_du_group_atomic_check() call which will iterate the
> CRTCs to determine the per-state use-count of the group.
> 
> This use count then allows us to determine if the group should be
> configured or disabled in our commit tail through the introduction of
> two new calls rcar_du_group_atomic_{pre,post}_commit().
> 
> The existing rcar_du_group_{get,put}() functions are now redundant and
> removed along with their interactions in the CRTC get/put calls.
> 
> The groups share clocking with the CRTCs within the group, and so are
> accessible only when one of its CRTCs has been powered through
> rcar_du_crtc_atomic_exit_standby().
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> ---
> v2:
>  - All register sequences now maintained.
>  - Clock management is no longer handled by the group
>    (_crtc_{exit,enter}_standby handles this for us)
> 
> 
> 
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c  |   8 --
>  drivers/gpu/drm/rcar-du/rcar_du_group.c | 101 ++++++++++++++++--------
>  drivers/gpu/drm/rcar-du/rcar_du_group.h |  14 +++-
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c   |   6 ++
>  4 files changed, 85 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> index 2606de788688..fce8bd1d9d25 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> @@ -511,14 +511,8 @@ static int rcar_du_crtc_enable(struct rcar_du_crtc *rcrtc)
>  	if (ret < 0)
>  		goto error_clock;
>  
> -	ret = rcar_du_group_get(rcrtc->group);
> -	if (ret < 0)
> -		goto error_group;
> -
>  	return 0;
>  
> -error_group:
> -	clk_disable_unprepare(rcrtc->extclock);
>  error_clock:
>  	clk_disable_unprepare(rcrtc->clock);
>  	return ret;

You can simplify this function further by inlining the
clk_disable_unprepare() in the single error path and removing the
error_clock label.

> @@ -526,8 +520,6 @@ static int rcar_du_crtc_enable(struct rcar_du_crtc *rcrtc)
>  
>  static void rcar_du_crtc_disable(struct rcar_du_crtc *rcrtc)
>  {
> -	rcar_du_group_put(rcrtc->group);
> -
>  	clk_disable_unprepare(rcrtc->extclock);
>  	clk_disable_unprepare(rcrtc->clock);
>  }
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c b/drivers/gpu/drm/rcar-du/rcar_du_group.c
> index 9c82d666f170..1f9504bca0f3 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
> @@ -24,6 +24,7 @@
>   */
>  
>  #include <linux/clk.h>
> +#include <linux/err.h>
>  #include <linux/io.h>
>  
>  #include <drm/drm_atomic.h>
> @@ -172,38 +173,6 @@ static void rcar_du_group_setup(struct rcar_du_group *rgrp)
>  	mutex_unlock(&rgrp->lock);
>  }
>  
> -/*
> - * rcar_du_group_get - Acquire a reference to the DU channels group
> - *
> - * Acquiring the first reference setups core registers. A reference must be held
> - * before accessing any hardware registers.
> - *
> - * This function must be called with the DRM mode_config lock held.
> - *
> - * Return 0 in case of success or a negative error code otherwise.
> - */
> -int rcar_du_group_get(struct rcar_du_group *rgrp)
> -{
> -	if (rgrp->use_count)
> -		goto done;
> -
> -	rcar_du_group_setup(rgrp);
> -
> -done:
> -	rgrp->use_count++;
> -	return 0;
> -}
> -
> -/*
> - * rcar_du_group_put - Release a reference to the DU
> - *
> - * This function must be called with the DRM mode_config lock held.
> - */
> -void rcar_du_group_put(struct rcar_du_group *rgrp)
> -{
> -	--rgrp->use_count;
> -}
> -
>  static void __rcar_du_group_start_stop(struct rcar_du_group *rgrp, bool start)
>  {
>  	struct rcar_du_device *rcdu = rgrp->dev;
> @@ -384,6 +353,74 @@ static const struct drm_private_state_funcs rcar_du_group_state_funcs = {
>  	.atomic_destroy_state = rcar_du_group_atomic_destroy_state,
>  };
>  
> +#define for_each_oldnew_group_in_state(__state, __obj, __old_state, __new_state, __i) \
> +	for_each_oldnew_private_obj_in_state((__state), (__obj), (__old_state), (__new_state), (__i)) \
> +		for_each_if((__obj)->funcs == &rcar_du_group_state_funcs)
> +
> +static struct rcar_du_group_state *
> +rcar_du_get_group_state(struct drm_atomic_state *state,
> +			struct rcar_du_group *rgrp)
> +{
> +	struct drm_private_state *pstate;
> +
> +	pstate = drm_atomic_get_private_obj_state(state, &rgrp->private);
> +	if (IS_ERR(pstate))
> +		return ERR_CAST(pstate);
> +
> +	return to_rcar_group_state(pstate);
> +}
> +
> +int rcar_du_group_atomic_check(struct drm_device *dev,
> +			       struct drm_atomic_state *state)
> +{
> +	struct drm_crtc *crtc;
> +	struct drm_crtc_state *crtc_state;
> +	unsigned int i;
> +
> +	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
> +		struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
> +		struct rcar_du_group_state *rstate;
> +
> +		if (crtc_state->active_changed || crtc_state->mode_changed) {
> +			rstate = rcar_du_get_group_state(state, rcrtc->group);
> +			if (IS_ERR(rstate))
> +				return PTR_ERR(rstate);
> +
> +			if (crtc_state->active)
> +				rstate->use_count++;

This doesn't seem right to me. A commit with just a page flip will have
neither active_changed not mode_changed set. The group use count will
thus be 0. If the next commit enables the second CRTC in the group, then
you will call rcar_du_group_setup() again in
rcar_du_group_atomic_pre_commit().

I think you should increment use_count when crtc_state->active
regardless of active_changed and mode_changed.

> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +int rcar_du_group_atomic_pre_commit(struct drm_device *dev,
> +				    struct drm_atomic_state *state)
> +{
> +	struct drm_private_state *old_pstate, *new_pstate;
> +	struct drm_private_obj *obj;
> +	unsigned int i;
> +
> +	for_each_oldnew_group_in_state(state, obj, old_pstate, new_pstate, i) {
> +		struct rcar_du_group *rgrp = to_rcar_group(obj);
> +		struct rcar_du_group_state *old_state, *new_state;
> +
> +		old_state = to_rcar_group_state(old_pstate);
> +		new_state = to_rcar_group_state(new_pstate);
> +
> +		if (!old_state->use_count && new_state->use_count)
> +			rcar_du_group_setup(rgrp);
> +	}
> +
> +	return 0;
> +}
> +
> +int rcar_du_group_atomic_post_commit(struct drm_device *dev,
> +				     struct drm_atomic_state *state)
> +{
> +	return 0;
> +}

As for the similar CRTC patch, I think you can drop
rcar_du_group_atomic_post_commit(), turn
rcar_du_group_atomic_pre_commit() into a void function, and rename it to
rcar_du_group_atomic_setup().

The rest looks good to me, so with this fixed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
>  /*
>   * rcar_du_group_init - Initialise and reset a group object
>   *
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.h b/drivers/gpu/drm/rcar-du/rcar_du_group.h
> index 4b812e167987..288c09a6d7d0 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_group.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_group.h
> @@ -26,7 +26,6 @@ struct rcar_du_device;
>   * @index: group index
>   * @channels_mask: bitmask of populated DU channels in this group
>   * @num_crtcs: number of CRTCs in this group (1 or 2)
> - * @use_count: number of users of the group (rcar_du_group_(get|put))
>   * @used_crtcs: number of CRTCs currently in use
>   * @lock: protects the dptsr_planes field and the DPTSR register
>   * @dptsr_planes: bitmask of planes driven by dot-clock and timing generator 1
> @@ -43,7 +42,6 @@ struct rcar_du_group {
>  
>  	unsigned int channels_mask;
>  	unsigned int num_crtcs;
> -	unsigned int use_count;
>  	unsigned int used_crtcs;
>  
>  	struct mutex lock;
> @@ -59,9 +57,12 @@ struct rcar_du_group {
>  /**
>   * struct rcar_du_group_state - Driver-specific group state
>   * @state: base DRM private state
> + * @use_count: number of users of the group
>   */
>  struct rcar_du_group_state {
>  	struct drm_private_state state;
> +
> +	unsigned int use_count;
>  };
>  
>  #define to_rcar_group_state(s) \
> @@ -70,14 +71,19 @@ struct rcar_du_group_state {
>  u32 rcar_du_group_read(struct rcar_du_group *rgrp, u32 reg);
>  void rcar_du_group_write(struct rcar_du_group *rgrp, u32 reg, u32 data);
>  
> -int rcar_du_group_get(struct rcar_du_group *rgrp);
> -void rcar_du_group_put(struct rcar_du_group *rgrp);
>  void rcar_du_group_start_stop(struct rcar_du_group *rgrp, bool start);
>  void rcar_du_group_restart(struct rcar_du_group *rgrp);
>  int rcar_du_group_set_routing(struct rcar_du_group *rgrp);
>  
>  int rcar_du_set_dpad0_vsp1_routing(struct rcar_du_device *rcdu);
>  
> +int rcar_du_group_atomic_check(struct drm_device *dev,
> +			       struct drm_atomic_state *state);
> +int rcar_du_group_atomic_pre_commit(struct drm_device *dev,
> +				    struct drm_atomic_state *state);
> +int rcar_du_group_atomic_post_commit(struct drm_device *dev,
> +				     struct drm_atomic_state *state);
> +
>  int rcar_du_group_init(struct rcar_du_device *rcdu, struct rcar_du_group *rgrp,
>  		       unsigned int index);
>  void rcar_du_group_cleanup(struct rcar_du_group *rgrp);
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> index eb01bea1ab83..77f0ff38298b 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> @@ -271,6 +271,10 @@ static int rcar_du_atomic_check(struct drm_device *dev,
>  	if (ret)
>  		return ret;
>  
> +	ret = rcar_du_group_atomic_check(dev, state);
> +	if (ret)
> +		return ret;
> +
>  	if (rcar_du_has(rcdu, RCAR_DU_FEATURE_VSP1_SOURCE))
>  		return 0;
>  
> @@ -305,6 +309,7 @@ static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
>  
>  	/* Apply the atomic update. */
>  	rcar_du_crtc_atomic_exit_standby(dev, old_state);
> +	rcar_du_group_atomic_pre_commit(dev, old_state);
>  	rcar_du_crtc_atomic_pre_commit(dev, old_state);
>  
>  	drm_atomic_helper_commit_modeset_disables(dev, old_state);
> @@ -313,6 +318,7 @@ static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
>  	drm_atomic_helper_commit_modeset_enables(dev, old_state);
>  
>  	rcar_du_crtc_atomic_post_commit(dev, old_state);
> +	rcar_du_group_atomic_post_commit(dev, old_state);
>  	rcar_du_crtc_atomic_enter_standby(dev, old_state);
>  
>  	drm_atomic_helper_commit_hw_done(old_state);

-- 
Regards,

Laurent Pinchart
