Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A91DE3D4C8
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Jun 2019 19:59:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406765AbfFKR67 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Jun 2019 13:58:59 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:36152 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406781AbfFKR66 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Jun 2019 13:58:58 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 239C52AF;
        Tue, 11 Jun 2019 19:58:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1560275934;
        bh=WtxSik8PAaWmlbu4GE0tPoWMimf+2O0OVR5zI8m98tM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Tco63pv3D33V8ylpDzbyon8wyFpgQBHM3WL6LwORq7/xRS3K8URiBJDeTLvBAdXJt
         7YRMyQr+rvyzZxjiv478RY1fOmq5KTEZWyx3C6Ejn0kUV/D/zP01/wCs/JTvmhh8Mw
         hjbkz/d1Egjqow0t55V7u3Y0cq8I2a1htOUPqUaA=
Date:   Tue, 11 Jun 2019 20:58:39 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Sean Paul <sean@poorly.run>
Cc:     dri-devel@lists.freedesktop.org, Sean Paul <seanpaul@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Ben Skeggs <bskeggs@redhat.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Eric Anholt <eric@anholt.net>,
        Heiko Stuebner <heiko@sntech.de>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        David Airlie <airlied@linux.ie>,
        intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v5 04/11] drm: Convert
 connector_helper_funcs->atomic_check to accept drm_atomic_state
Message-ID: <20190611175839.GR5016@pendragon.ideasonboard.com>
References: <20190611160844.257498-1-sean@poorly.run>
 <20190611160844.257498-5-sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190611160844.257498-5-sean@poorly.run>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Sean,

Thank you for the patch.

On Tue, Jun 11, 2019 at 12:08:18PM -0400, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> Everyone who implements connector_helper_funcs->atomic_check reaches
> into the connector state to get the atomic state. Instead of continuing
> this pattern, change the callback signature to just give atomic state
> and let the driver determine what it does and does not need from it.
> 
> Eventually all atomic functions should do this, but that's just too much
> busy work for me.
> 
> Changes in v3:
> - Added to the set
> Changes in v4:
> - None
> Changes in v5:
> - intel_digital_connector_atomic_check declaration moved to i915_atomic.h
> 
> Link to v3: https://patchwork.freedesktop.org/patch/msgid/20190502194956.218441-5-sean@poorly.run
> Link to v4: https://patchwork.freedesktop.org/patch/msgid/20190508160920.144739-5-sean@poorly.run
> 
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: Eric Anholt <eric@anholt.net>
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> Acked-by: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c      |  4 ++--
>  drivers/gpu/drm/i915/intel_atomic.c      |  8 +++++---
>  drivers/gpu/drm/i915/intel_atomic.h      |  2 +-
>  drivers/gpu/drm/i915/intel_dp_mst.c      |  7 ++++---
>  drivers/gpu/drm/i915/intel_sdvo.c        |  9 +++++----
>  drivers/gpu/drm/i915/intel_tv.c          |  8 +++++---
>  drivers/gpu/drm/nouveau/dispnv50/disp.c  |  5 +++--
>  drivers/gpu/drm/rcar-du/rcar_lvds.c      | 12 +++++++-----

For the R-Car LVDS driver,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  drivers/gpu/drm/vc4/vc4_txp.c            |  7 ++++---
>  include/drm/drm_modeset_helper_vtables.h |  2 +-
>  10 files changed, 37 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 2133f62539176..e58be69960692 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -686,7 +686,7 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
>  		}
>  
>  		if (funcs->atomic_check)
> -			ret = funcs->atomic_check(connector, new_connector_state);
> +			ret = funcs->atomic_check(connector, state);
>  		if (ret)
>  			return ret;
>  
> @@ -728,7 +728,7 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
>  			continue;
>  
>  		if (funcs->atomic_check)
> -			ret = funcs->atomic_check(connector, new_connector_state);
> +			ret = funcs->atomic_check(connector, state);
>  		if (ret)
>  			return ret;
>  	}
> diff --git a/drivers/gpu/drm/i915/intel_atomic.c b/drivers/gpu/drm/i915/intel_atomic.c
> index 58b8049649a0f..ab40448a19d56 100644
> --- a/drivers/gpu/drm/i915/intel_atomic.c
> +++ b/drivers/gpu/drm/i915/intel_atomic.c
> @@ -106,12 +106,14 @@ int intel_digital_connector_atomic_set_property(struct drm_connector *connector,
>  }
>  
>  int intel_digital_connector_atomic_check(struct drm_connector *conn,
> -					 struct drm_connector_state *new_state)
> +					 struct drm_atomic_state *state)
>  {
> +	struct drm_connector_state *new_state =
> +		drm_atomic_get_new_connector_state(state, conn);
>  	struct intel_digital_connector_state *new_conn_state =
>  		to_intel_digital_connector_state(new_state);
>  	struct drm_connector_state *old_state =
> -		drm_atomic_get_old_connector_state(new_state->state, conn);
> +		drm_atomic_get_old_connector_state(state, conn);
>  	struct intel_digital_connector_state *old_conn_state =
>  		to_intel_digital_connector_state(old_state);
>  	struct drm_crtc_state *crtc_state;
> @@ -121,7 +123,7 @@ int intel_digital_connector_atomic_check(struct drm_connector *conn,
>  	if (!new_state->crtc)
>  		return 0;
>  
> -	crtc_state = drm_atomic_get_new_crtc_state(new_state->state, new_state->crtc);
> +	crtc_state = drm_atomic_get_new_crtc_state(state, new_state->crtc);
>  
>  	/*
>  	 * These properties are handled by fastset, and might not end
> diff --git a/drivers/gpu/drm/i915/intel_atomic.h b/drivers/gpu/drm/i915/intel_atomic.h
> index 1c8507da1a690..58065d3161a34 100644
> --- a/drivers/gpu/drm/i915/intel_atomic.h
> +++ b/drivers/gpu/drm/i915/intel_atomic.h
> @@ -28,7 +28,7 @@ int intel_digital_connector_atomic_set_property(struct drm_connector *connector,
>  						struct drm_property *property,
>  						u64 val);
>  int intel_digital_connector_atomic_check(struct drm_connector *conn,
> -					 struct drm_connector_state *new_state);
> +					 struct drm_atomic_state *state);
>  struct drm_connector_state *
>  intel_digital_connector_duplicate_state(struct drm_connector *connector);
>  
> diff --git a/drivers/gpu/drm/i915/intel_dp_mst.c b/drivers/gpu/drm/i915/intel_dp_mst.c
> index 0caf645fbbb84..60652ebbdf610 100644
> --- a/drivers/gpu/drm/i915/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/intel_dp_mst.c
> @@ -151,9 +151,10 @@ static int intel_dp_mst_compute_config(struct intel_encoder *encoder,
>  
>  static int
>  intel_dp_mst_atomic_check(struct drm_connector *connector,
> -			  struct drm_connector_state *new_conn_state)
> +			  struct drm_atomic_state *state)
>  {
> -	struct drm_atomic_state *state = new_conn_state->state;
> +	struct drm_connector_state *new_conn_state =
> +		drm_atomic_get_new_connector_state(state, connector);
>  	struct drm_connector_state *old_conn_state =
>  		drm_atomic_get_old_connector_state(state, connector);
>  	struct intel_connector *intel_connector =
> @@ -163,7 +164,7 @@ intel_dp_mst_atomic_check(struct drm_connector *connector,
>  	struct drm_dp_mst_topology_mgr *mgr;
>  	int ret;
>  
> -	ret = intel_digital_connector_atomic_check(connector, new_conn_state);
> +	ret = intel_digital_connector_atomic_check(connector, state);
>  	if (ret)
>  		return ret;
>  
> diff --git a/drivers/gpu/drm/i915/intel_sdvo.c b/drivers/gpu/drm/i915/intel_sdvo.c
> index 6c98b35790db5..368b99f6f7fbd 100644
> --- a/drivers/gpu/drm/i915/intel_sdvo.c
> +++ b/drivers/gpu/drm/i915/intel_sdvo.c
> @@ -2353,9 +2353,10 @@ static const struct drm_connector_funcs intel_sdvo_connector_funcs = {
>  };
>  
>  static int intel_sdvo_atomic_check(struct drm_connector *conn,
> -				   struct drm_connector_state *new_conn_state)
> +				   struct drm_atomic_state *state)
>  {
> -	struct drm_atomic_state *state = new_conn_state->state;
> +	struct drm_connector_state *new_conn_state =
> +		drm_atomic_get_new_connector_state(state, conn);
>  	struct drm_connector_state *old_conn_state =
>  		drm_atomic_get_old_connector_state(state, conn);
>  	struct intel_sdvo_connector_state *old_state =
> @@ -2367,13 +2368,13 @@ static int intel_sdvo_atomic_check(struct drm_connector *conn,
>  	    (memcmp(&old_state->tv, &new_state->tv, sizeof(old_state->tv)) ||
>  	     memcmp(&old_conn_state->tv, &new_conn_state->tv, sizeof(old_conn_state->tv)))) {
>  		struct drm_crtc_state *crtc_state =
> -			drm_atomic_get_new_crtc_state(new_conn_state->state,
> +			drm_atomic_get_new_crtc_state(state,
>  						      new_conn_state->crtc);
>  
>  		crtc_state->connectors_changed = true;
>  	}
>  
> -	return intel_digital_connector_atomic_check(conn, new_conn_state);
> +	return intel_digital_connector_atomic_check(conn, state);
>  }
>  
>  static const struct drm_connector_helper_funcs intel_sdvo_connector_helper_funcs = {
> diff --git a/drivers/gpu/drm/i915/intel_tv.c b/drivers/gpu/drm/i915/intel_tv.c
> index 5dc594eafaf2f..0a95df6c6a57f 100644
> --- a/drivers/gpu/drm/i915/intel_tv.c
> +++ b/drivers/gpu/drm/i915/intel_tv.c
> @@ -1821,16 +1821,18 @@ static const struct drm_connector_funcs intel_tv_connector_funcs = {
>  };
>  
>  static int intel_tv_atomic_check(struct drm_connector *connector,
> -				 struct drm_connector_state *new_state)
> +				 struct drm_atomic_state *state)
>  {
> +	struct drm_connector_state *new_state;
>  	struct drm_crtc_state *new_crtc_state;
>  	struct drm_connector_state *old_state;
>  
> +	new_state = drm_atomic_get_new_connector_state(state, connector);
>  	if (!new_state->crtc)
>  		return 0;
>  
> -	old_state = drm_atomic_get_old_connector_state(new_state->state, connector);
> -	new_crtc_state = drm_atomic_get_new_crtc_state(new_state->state, new_state->crtc);
> +	old_state = drm_atomic_get_old_connector_state(state, connector);
> +	new_crtc_state = drm_atomic_get_new_crtc_state(state, new_state->crtc);
>  
>  	if (old_state->tv.mode != new_state->tv.mode ||
>  	    old_state->tv.margins.left != new_state->tv.margins.left ||
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> index 4b1650f51955d..7ba373f493b29 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -948,11 +948,12 @@ nv50_mstc_get_modes(struct drm_connector *connector)
>  
>  static int
>  nv50_mstc_atomic_check(struct drm_connector *connector,
> -		       struct drm_connector_state *new_conn_state)
> +		       struct drm_atomic_state *state)
>  {
> -	struct drm_atomic_state *state = new_conn_state->state;
>  	struct nv50_mstc *mstc = nv50_mstc(connector);
>  	struct drm_dp_mst_topology_mgr *mgr = &mstc->mstm->mgr;
> +	struct drm_connector_state *new_conn_state =
> +		drm_atomic_get_new_connector_state(state, connector);
>  	struct drm_connector_state *old_conn_state =
>  		drm_atomic_get_old_connector_state(state, connector);
>  	struct drm_crtc_state *crtc_state;
> diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> index 620b51aab291f..5b81ba2a7f272 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
> @@ -92,13 +92,15 @@ static int rcar_lvds_connector_get_modes(struct drm_connector *connector)
>  }
>  
>  static int rcar_lvds_connector_atomic_check(struct drm_connector *connector,
> -					    struct drm_connector_state *state)
> +					    struct drm_atomic_state *state)
>  {
>  	struct rcar_lvds *lvds = connector_to_rcar_lvds(connector);
>  	const struct drm_display_mode *panel_mode;
> +	struct drm_connector_state *conn_state;
>  	struct drm_crtc_state *crtc_state;
>  
> -	if (!state->crtc)
> +	conn_state = drm_atomic_get_new_connector_state(state, connector);
> +	if (!conn_state->crtc)
>  		return 0;
>  
>  	if (list_empty(&connector->modes)) {
> @@ -110,9 +112,9 @@ static int rcar_lvds_connector_atomic_check(struct drm_connector *connector,
>  				      struct drm_display_mode, head);
>  
>  	/* We're not allowed to modify the resolution. */
> -	crtc_state = drm_atomic_get_crtc_state(state->state, state->crtc);
> -	if (IS_ERR(crtc_state))
> -		return PTR_ERR(crtc_state);
> +	crtc_state = drm_atomic_get_crtc_state(state, conn_state->crtc);
> +	if (!crtc_state)
> +		return -EINVAL;
>  
>  	if (crtc_state->mode.hdisplay != panel_mode->hdisplay ||
>  	    crtc_state->mode.vdisplay != panel_mode->vdisplay)
> diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
> index c8b89a78f9f4f..96f91c1b4b6e6 100644
> --- a/drivers/gpu/drm/vc4/vc4_txp.c
> +++ b/drivers/gpu/drm/vc4/vc4_txp.c
> @@ -221,17 +221,18 @@ static const u32 txp_fmts[] = {
>  };
>  
>  static int vc4_txp_connector_atomic_check(struct drm_connector *conn,
> -					struct drm_connector_state *conn_state)
> +					  struct drm_atomic_state *state)
>  {
> +	struct drm_connector_state *conn_state;
>  	struct drm_crtc_state *crtc_state;
>  	struct drm_framebuffer *fb;
>  	int i;
>  
> +	conn_state = drm_atomic_get_new_connector_state(state, conn);
>  	if (!conn_state->writeback_job || !conn_state->writeback_job->fb)
>  		return 0;
>  
> -	crtc_state = drm_atomic_get_new_crtc_state(conn_state->state,
> -						   conn_state->crtc);
> +	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
>  
>  	fb = conn_state->writeback_job->fb;
>  	if (fb->width != crtc_state->mode.hdisplay ||
> diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
> index 0701b3a3108e5..0899f53180e59 100644
> --- a/include/drm/drm_modeset_helper_vtables.h
> +++ b/include/drm/drm_modeset_helper_vtables.h
> @@ -1027,7 +1027,7 @@ struct drm_connector_helper_funcs {
>  	 * deadlock.
>  	 */
>  	int (*atomic_check)(struct drm_connector *connector,
> -			    struct drm_connector_state *state);
> +			    struct drm_atomic_state *state);
>  
>  	/**
>  	 * @atomic_commit:

-- 
Regards,

Laurent Pinchart
