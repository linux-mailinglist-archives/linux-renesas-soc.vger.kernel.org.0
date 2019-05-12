Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB6541AC59
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 May 2019 15:25:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726501AbfELNZL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 12 May 2019 09:25:11 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:56650 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726415AbfELNZL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 12 May 2019 09:25:11 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 14FF32B6;
        Sun, 12 May 2019 15:25:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1557667508;
        bh=M1CC/FiF8mT507niOl6nmrwUaL2ABTw+yt76uXs3UfY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=i13PeFR2SuS7edCRhXykSC3t640fwfDNFzGk9Zb7W0zAYC/AFoOU37WxMKgO/ethw
         sXmM72zhc5tan5zxegZSpTvkhrPG2CiWk9yD57JtziAVHzeYhFk5HHfdesVW2r7IDw
         +63q0h7EXbrYHxIxpARd3HE5Pmr88phLdExugsOU=
Date:   Sun, 12 May 2019 16:24:47 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        David Airlie <airlied@linux.ie>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/6] drm: rcar-du: Add CRTC standby helpers
Message-ID: <20190512132447.GC4960@pendragon.ideasonboard.com>
References: <20190315170110.23280-1-kieran.bingham+renesas@ideasonboard.com>
 <20190315170110.23280-3-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190315170110.23280-3-kieran.bingham+renesas@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

Thank you for the patch.

On Fri, Mar 15, 2019 at 05:01:06PM +0000, Kieran Bingham wrote:
> Provide helpers to manage the power state, and initial configuration of
> the CRTC.

I would add a sentence here to mention that these helpers operate from
the atomic commit tail handler, and respectively take out of standby all
CRTCs that need to be activated, and put in standby all the CRTCs that
have been deactivated.

> rcar_du_crtc_get() and rcar_du_crtc_get() are no longer used, and are
> removed, simplifying the implementation and removing the initialized
> flag which was needed to track the state of the CRTC.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> ---
> v2:
>  - Registers sequence confirmed unchanged
>  - re-ordered in the series to handle before groups.
>  - Do not merge rcar_du_crtc_setup(). (now handled by _crtc_pre_commit)
> 
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 69 +++++++++++++++-----------
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.h |  7 ++-
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c  |  4 ++
>  3 files changed, 49 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> index 471ce464654a..6109a97b0bb9 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> @@ -499,17 +499,10 @@ static void rcar_du_crtc_setup(struct rcar_du_crtc *rcrtc)
>  	drm_crtc_vblank_on(&rcrtc->crtc);
>  }
>  
> -static int rcar_du_crtc_get(struct rcar_du_crtc *rcrtc)
> +static int rcar_du_crtc_enable(struct rcar_du_crtc *rcrtc)
>  {
>  	int ret;
>  
> -	/*
> -	 * Guard against double-get, as the function is called from both the
> -	 * .atomic_enable() and .atomic_begin() handlers.
> -	 */
> -	if (rcrtc->initialized)
> -		return 0;
> -
>  	ret = clk_prepare_enable(rcrtc->clock);
>  	if (ret < 0)
>  		return ret;
> @@ -523,7 +516,6 @@ static int rcar_du_crtc_get(struct rcar_du_crtc *rcrtc)
>  		goto error_group;
>  
>  	rcar_du_crtc_setup(rcrtc);
> -	rcrtc->initialized = true;
>  
>  	return 0;
>  
> @@ -534,14 +526,12 @@ static int rcar_du_crtc_get(struct rcar_du_crtc *rcrtc)
>  	return ret;
>  }
>  
> -static void rcar_du_crtc_put(struct rcar_du_crtc *rcrtc)
> +static void rcar_du_crtc_disable(struct rcar_du_crtc *rcrtc)
>  {
>  	rcar_du_group_put(rcrtc->group);
>  
>  	clk_disable_unprepare(rcrtc->extclock);
>  	clk_disable_unprepare(rcrtc->clock);
> -
> -	rcrtc->initialized = false;
>  }
>  
>  static void rcar_du_crtc_start(struct rcar_du_crtc *rcrtc)
> @@ -655,6 +645,44 @@ static int rcar_du_crtc_atomic_check(struct drm_crtc *crtc,
>  	return 0;
>  }
>  

Similarly a comment above each function would be useful in my opinion.
Something along the lines of

/*
 * Take all CRTCs that are made active in this commit out of standby.
 * CRTCs that are deactivated by the commit are untouched and will be
 * put in standby by rcar_du_crtc_atomic_enter_standby().
 /

> +int rcar_du_crtc_atomic_exit_standby(struct drm_device *dev,
> +				     struct drm_atomic_state *state)
> +{
> +	struct drm_crtc *crtc;
> +	struct drm_crtc_state *crtc_state;
> +	unsigned int i;
> +
> +	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
> +		struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
> +
> +		if (crtc_state->active_changed && crtc_state->active) {
> +			int ret = rcar_du_crtc_enable(rcrtc);
> +
> +			if (ret)
> +				return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +

/*
 * Put all CRTCs that have been deactivated by this commit in standby.
 * This shall be called at the end of the commit tail handler as the
 * last operation that touches the CRTC hardware.
 /

> +int rcar_du_crtc_atomic_enter_standby(struct drm_device *dev,
> +				      struct drm_atomic_state *state)
> +{
> +	struct drm_crtc *crtc;
> +	struct drm_crtc_state *crtc_state;
> +	unsigned int i;
> +
> +	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
> +		struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
> +
> +		if (crtc_state->active_changed && !crtc_state->active)
> +			rcar_du_crtc_disable(rcrtc);
> +	}
> +
> +	return 0;
> +}
> +
>  static void rcar_du_crtc_atomic_enable(struct drm_crtc *crtc,
>  				       struct drm_crtc_state *old_state)
>  {
> @@ -662,8 +690,6 @@ static void rcar_du_crtc_atomic_enable(struct drm_crtc *crtc,
>  	struct rcar_du_crtc_state *rstate = to_rcar_crtc_state(crtc->state);
>  	struct rcar_du_device *rcdu = rcrtc->dev;
>  
> -	rcar_du_crtc_get(rcrtc);
> -
>  	/*
>  	 * On D3/E3 the dot clock is provided by the LVDS encoder attached to
>  	 * the DU channel. We need to enable its clock output explicitly if
> @@ -691,7 +717,6 @@ static void rcar_du_crtc_atomic_disable(struct drm_crtc *crtc,
>  	struct rcar_du_device *rcdu = rcrtc->dev;
>  
>  	rcar_du_crtc_stop(rcrtc);
> -	rcar_du_crtc_put(rcrtc);
>  
>  	if (rcdu->info->lvds_clk_mask & BIT(rcrtc->index) &&
>  	    rstate->outputs == BIT(RCAR_DU_OUTPUT_DPAD0)) {
> @@ -720,20 +745,6 @@ static void rcar_du_crtc_atomic_begin(struct drm_crtc *crtc,
>  
>  	WARN_ON(!crtc->state->enable);
>  
> -	/*
> -	 * If a mode set is in progress we can be called with the CRTC disabled.
> -	 * We thus need to first get and setup the CRTC in order to configure
> -	 * planes. We must *not* put the CRTC in .atomic_flush(), as it must be
> -	 * kept awake until the .atomic_enable() call that will follow. The get
> -	 * operation in .atomic_enable() will in that case be a no-op, and the
> -	 * CRTC will be put later in .atomic_disable().
> -	 *
> -	 * If a mode set is not in progress the CRTC is enabled, and the
> -	 * following get call will be a no-op. There is thus no need to balance
> -	 * it in .atomic_flush() either.
> -	 */
> -	rcar_du_crtc_get(rcrtc);
> -

I love how this hack is now gone.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	if (rcar_du_has(rcrtc->dev, RCAR_DU_FEATURE_VSP1_SOURCE))
>  		rcar_du_vsp_atomic_begin(rcrtc);
>  }
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
> index 11814eafef77..d12d4a788e9f 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
> @@ -29,7 +29,6 @@ struct rcar_du_vsp;
>   * @extclock: external pixel dot clock (optional)
>   * @mmio_offset: offset of the CRTC registers in the DU MMIO block
>   * @index: CRTC software and hardware index
> - * @initialized: whether the CRTC has been initialized and clocks enabled
>   * @dsysr: cached value of the DSYSR register
>   * @vblank_enable: whether vblank events are enabled on this CRTC
>   * @event: event to post when the pending page flip completes
> @@ -49,7 +48,6 @@ struct rcar_du_crtc {
>  	struct clk *extclock;
>  	unsigned int mmio_offset;
>  	unsigned int index;
> -	bool initialized;
>  
>  	u32 dsysr;
>  
> @@ -102,6 +100,11 @@ int rcar_du_crtc_create(struct rcar_du_group *rgrp, unsigned int swindex,
>  
>  void rcar_du_crtc_finish_page_flip(struct rcar_du_crtc *rcrtc);
>  
> +int rcar_du_crtc_atomic_exit_standby(struct drm_device *dev,
> +				     struct drm_atomic_state *state);
> +int rcar_du_crtc_atomic_enter_standby(struct drm_device *dev,
> +				      struct drm_atomic_state *state);
> +
>  void rcar_du_crtc_dsysr_clr_set(struct rcar_du_crtc *rcrtc, u32 clr, u32 set);
>  
>  #endif /* __RCAR_DU_CRTC_H__ */
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> index 3b7d50a8fb9b..b8da4dfc79d2 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> @@ -303,11 +303,15 @@ static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
>  	}
>  
>  	/* Apply the atomic update. */
> +	rcar_du_crtc_atomic_exit_standby(dev, old_state);
> +
>  	drm_atomic_helper_commit_modeset_disables(dev, old_state);
>  	drm_atomic_helper_commit_planes(dev, old_state,
>  					DRM_PLANE_COMMIT_ACTIVE_ONLY);
>  	drm_atomic_helper_commit_modeset_enables(dev, old_state);
>  
> +	rcar_du_crtc_atomic_enter_standby(dev, old_state);
> +
>  	drm_atomic_helper_commit_hw_done(old_state);
>  	drm_atomic_helper_wait_for_flip_done(dev, old_state);
>  

-- 
Regards,

Laurent Pinchart
