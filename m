Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CBE291AC67
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 May 2019 15:35:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726442AbfELNfw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 12 May 2019 09:35:52 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:56936 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726415AbfELNfv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 12 May 2019 09:35:51 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 07B052B6;
        Sun, 12 May 2019 15:35:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1557668150;
        bh=zolNMCRQP9CsOD1EJ2sLNp4MGIGXNTFYv6ci/HE00hs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=s9JlnEryuJi2G2MXIA1M6Fcqpq37XXM12Z9vNKsPi41dss9TiBhoKmh6cupT3D6nX
         uaVndxhd0aMsr3v4q/ZCRa4kecKMUf06DP5txtRyHp+lV4nAL+Qchv8LT8Zknw3YMc
         hx2M+Dv+Ueuhl7KRGY3bKWiqam80Qg5XDMG/LpqE=
Date:   Sun, 12 May 2019 16:35:33 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        David Airlie <airlied@linux.ie>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/6] drm: rcar-du: Add pre/post commit CRTC helpers
Message-ID: <20190512133533.GD4960@pendragon.ideasonboard.com>
References: <20190315170110.23280-1-kieran.bingham+renesas@ideasonboard.com>
 <20190315170110.23280-4-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190315170110.23280-4-kieran.bingham+renesas@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

Thank you for the patch.

On Fri, Mar 15, 2019 at 05:01:07PM +0000, Kieran Bingham wrote:
> Provide helpers to allow CRTC configuration to be separated from the power
> state handling. rcar_du_crtc_atomic_post_commit() is a no-op, but maintained
> for API symmetry.

Do you think we will need to fill rcar_du_crtc_atomic_post_commit()
later ? If not I wouldn't add it, and I may even rename
rcar_du_crtc_atomic_pre_commit() to rcar_du_crtc_atomic_setup() to make
its purpose clearer.

> 

Missing SoB line ?

> ---
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 25 +++++++++++++++++++++++--
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.h |  5 +++++
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c  |  2 ++
>  3 files changed, 30 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> index 6109a97b0bb9..2606de788688 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> @@ -515,8 +515,6 @@ static int rcar_du_crtc_enable(struct rcar_du_crtc *rcrtc)
>  	if (ret < 0)
>  		goto error_group;
>  
> -	rcar_du_crtc_setup(rcrtc);
> -
>  	return 0;
>  
>  error_group:
> @@ -683,6 +681,29 @@ int rcar_du_crtc_atomic_enter_standby(struct drm_device *dev,
>  	return 0;
>  }
>  
> +int rcar_du_crtc_atomic_pre_commit(struct drm_device *dev,
> +				   struct drm_atomic_state *state)
> +{
> +	struct drm_crtc *crtc;
> +	struct drm_crtc_state *crtc_state;
> +	unsigned int i;
> +
> +	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
> +		struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
> +
> +		if (crtc_state->active_changed && crtc_state->active)
> +			rcar_du_crtc_setup(rcrtc);

I wondered why you didn't merge this with the existing
rcar_du_crtc_atomic_exit_standby() function, and saw in a later patch
that you have to introduce another operation in-between. I would explain
this in the commit message.

> +	}
> +
> +	return 0;

As this function and the next one are called in a context that can never
fail, and as the functions never return a failure, I would make them
void.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +}
> +
> +int rcar_du_crtc_atomic_post_commit(struct drm_device *dev,
> +				    struct drm_atomic_state *state)
> +{
> +	return 0;
> +}
> +
>  static void rcar_du_crtc_atomic_enable(struct drm_crtc *crtc,
>  				       struct drm_crtc_state *old_state)
>  {
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
> index d12d4a788e9f..0b60a6e0b753 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.h
> @@ -105,6 +105,11 @@ int rcar_du_crtc_atomic_exit_standby(struct drm_device *dev,
>  int rcar_du_crtc_atomic_enter_standby(struct drm_device *dev,
>  				      struct drm_atomic_state *state);
>  
> +int rcar_du_crtc_atomic_pre_commit(struct drm_device *dev,
> +				   struct drm_atomic_state *state);
> +int rcar_du_crtc_atomic_post_commit(struct drm_device *dev,
> +				    struct drm_atomic_state *state);
> +
>  void rcar_du_crtc_dsysr_clr_set(struct rcar_du_crtc *rcrtc, u32 clr, u32 set);
>  
>  #endif /* __RCAR_DU_CRTC_H__ */
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> index b8da4dfc79d2..e4befb1937f8 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> @@ -304,12 +304,14 @@ static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
>  
>  	/* Apply the atomic update. */
>  	rcar_du_crtc_atomic_exit_standby(dev, old_state);
> +	rcar_du_crtc_atomic_pre_commit(dev, old_state);
>  
>  	drm_atomic_helper_commit_modeset_disables(dev, old_state);
>  	drm_atomic_helper_commit_planes(dev, old_state,
>  					DRM_PLANE_COMMIT_ACTIVE_ONLY);
>  	drm_atomic_helper_commit_modeset_enables(dev, old_state);
>  
> +	rcar_du_crtc_atomic_post_commit(dev, old_state);
>  	rcar_du_crtc_atomic_enter_standby(dev, old_state);
>  
>  	drm_atomic_helper_commit_hw_done(old_state);

-- 
Regards,

Laurent Pinchart
