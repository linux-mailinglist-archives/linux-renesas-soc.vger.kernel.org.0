Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F41CD92E2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Oct 2019 15:49:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405472AbfJPNtZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Oct 2019 09:49:25 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:38616 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726689AbfJPNtZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Oct 2019 09:49:25 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A41B39F4;
        Wed, 16 Oct 2019 15:49:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1571233762;
        bh=m7N8TtJXfjC42gO466PT2HSc5Zs3uaZEy9xf0T8y9V8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jQCbkyQviloXjO0M2K2SRrxUXfHpBT/gXpajaCfWa6vLM59P9Vtz+aSkvQtzUFnS7
         6Cknzy5Izisv4nytRvGP/iP3DX3R+ig9hfI5ICmzTN8vA68PCfsBRRa77//qlUTPZC
         wzydgIaydspn95DMP626xOOagoiC9BFUh/wjPF24=
Date:   Wed, 16 Oct 2019 16:49:20 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     kieran.bingham+renesas@ideasonboard.com, geert@linux-m68k.org,
        horms@verge.net.au, uli+renesas@fpond.eu, airlied@linux.ie,
        daniel@ffwll.ch, linux-renesas-soc@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 5/8] drm: rcar-du: crtc: Control CMM operations
Message-ID: <20191016134920.GE5175@pendragon.ideasonboard.com>
References: <20191016085548.105703-1-jacopo+renesas@jmondi.org>
 <20191016085548.105703-6-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191016085548.105703-6-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Wed, Oct 16, 2019 at 10:55:45AM +0200, Jacopo Mondi wrote:
> Implement CMM handling in the crtc begin and enable atomic callbacks,
> and enable CMM unit through the Display Extensional Functions
> register at group setup time.
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c  | 55 +++++++++++++++++++++++++
>  drivers/gpu/drm/rcar-du/rcar_du_group.c | 10 +++++
>  drivers/gpu/drm/rcar-du/rcar_du_regs.h  |  5 +++
>  3 files changed, 70 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> index 23f1d6cc1719..d7ad491577f3 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> @@ -21,6 +21,7 @@
>  #include <drm/drm_plane_helper.h>
>  #include <drm/drm_vblank.h>
>  
> +#include "rcar_cmm.h"
>  #include "rcar_du_crtc.h"
>  #include "rcar_du_drv.h"
>  #include "rcar_du_encoder.h"
> @@ -474,6 +475,45 @@ static void rcar_du_crtc_wait_page_flip(struct rcar_du_crtc *rcrtc)
>  	rcar_du_crtc_finish_page_flip(rcrtc);
>  }
>  
> +/* -----------------------------------------------------------------------------
> + * Color Management Module (CMM)
> + */
> +
> +static int rcar_du_cmm_check(struct drm_crtc *crtc,
> +			     struct drm_crtc_state *state)
> +{
> +	struct drm_property_blob *drm_lut = state->gamma_lut;
> +	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
> +	struct device *dev = rcrtc->dev->dev;
> +
> +	if (!rcrtc->cmm || !drm_lut)

As the gamma LUT property is only created when CMM is present, can't you
drop the first part of this condition ?

> +		return 0;
> +
> +	/* We only accept fully populated LUT tables. */
> +	if (drm_color_lut_size(drm_lut) != CM2_LUT_SIZE) {
> +		dev_err(dev, "invalid gamma lut size: %lu bytes\n",
> +			drm_lut->length);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static void rcar_du_cmm_setup(struct drm_crtc *crtc)
> +{
> +	struct drm_property_blob *drm_lut = crtc->state->gamma_lut;
> +	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
> +	struct rcar_cmm_config cmm_config = {};
> +
> +	if (!rcrtc->cmm)
> +		return;
> +
> +	if (drm_lut)
> +		cmm_config.lut.table = (struct drm_color_lut *)drm_lut->data;
> +
> +	rcar_cmm_setup(rcrtc->cmm, &cmm_config);
> +}
> +
>  /* -----------------------------------------------------------------------------
>   * Start/Stop and Suspend/Resume
>   */
> @@ -619,6 +659,9 @@ static void rcar_du_crtc_stop(struct rcar_du_crtc *rcrtc)
>  	if (rcar_du_has(rcrtc->dev, RCAR_DU_FEATURE_VSP1_SOURCE))
>  		rcar_du_vsp_disable(rcrtc);
>  
> +	if (rcrtc->cmm)
> +		rcar_cmm_disable(rcrtc->cmm);
> +
>  	/*
>  	 * Select switch sync mode. This stops display operation and configures
>  	 * the HSYNC and VSYNC signals as inputs.
> @@ -642,6 +685,11 @@ static int rcar_du_crtc_atomic_check(struct drm_crtc *crtc,
>  {
>  	struct rcar_du_crtc_state *rstate = to_rcar_crtc_state(state);
>  	struct drm_encoder *encoder;
> +	int ret;
> +
> +	ret = rcar_du_cmm_check(crtc, state);
> +	if (ret)
> +		return ret;
>  
>  	/* Store the routes from the CRTC output to the DU outputs. */
>  	rstate->outputs = 0;
> @@ -667,6 +715,8 @@ static void rcar_du_crtc_atomic_enable(struct drm_crtc *crtc,
>  	struct rcar_du_crtc_state *rstate = to_rcar_crtc_state(crtc->state);
>  	struct rcar_du_device *rcdu = rcrtc->dev;
>  
> +	if (rcrtc->cmm)
> +		rcar_cmm_enable(rcrtc->cmm);
>  	rcar_du_crtc_get(rcrtc);
>  
>  	/*
> @@ -686,6 +736,7 @@ static void rcar_du_crtc_atomic_enable(struct drm_crtc *crtc,
>  	}
>  
>  	rcar_du_crtc_start(rcrtc);
> +	rcar_du_cmm_setup(crtc);

Let's add a TODO here to figure out why we can't setup CMM before
starting the CRTC.

With these two small issues fixed,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  }
>  
>  static void rcar_du_crtc_atomic_disable(struct drm_crtc *crtc,
> @@ -739,6 +790,10 @@ static void rcar_du_crtc_atomic_begin(struct drm_crtc *crtc,
>  	 */
>  	rcar_du_crtc_get(rcrtc);
>  
> +	/* If the active state changed, we let .atomic_enable handle CMM. */
> +	if (crtc->state->color_mgmt_changed && !crtc->state->active_changed)
> +		rcar_du_cmm_setup(crtc);
> +
>  	if (rcar_du_has(rcrtc->dev, RCAR_DU_FEATURE_VSP1_SOURCE))
>  		rcar_du_vsp_atomic_begin(rcrtc);
>  }
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c b/drivers/gpu/drm/rcar-du/rcar_du_group.c
> index 9eee47969e77..88a783ceb3e9 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
> @@ -135,6 +135,7 @@ static void rcar_du_group_setup_didsr(struct rcar_du_group *rgrp)
>  static void rcar_du_group_setup(struct rcar_du_group *rgrp)
>  {
>  	struct rcar_du_device *rcdu = rgrp->dev;
> +	u32 defr7 = DEFR7_CODE;
>  
>  	/* Enable extended features */
>  	rcar_du_group_write(rgrp, DEFR, DEFR_CODE | DEFR_DEFE);
> @@ -147,6 +148,15 @@ static void rcar_du_group_setup(struct rcar_du_group *rgrp)
>  
>  	rcar_du_group_setup_pins(rgrp);
>  
> +	/*
> +	 * TODO: Handle routing of the DU output to CMM dynamically, as we
> +	 * should bypass CMM completely when no color management feature is
> +	 * used.
> +	 */
> +	defr7 |= (rgrp->cmms_mask & BIT(1) ? DEFR7_CMME1 : 0) |
> +		 (rgrp->cmms_mask & BIT(0) ? DEFR7_CMME0 : 0);
> +	rcar_du_group_write(rgrp, DEFR7, defr7);
> +
>  	if (rcdu->info->gen >= 2) {
>  		rcar_du_group_setup_defr8(rgrp);
>  		rcar_du_group_setup_didsr(rgrp);
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_regs.h b/drivers/gpu/drm/rcar-du/rcar_du_regs.h
> index bc87f080b170..fb9964949368 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_regs.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_regs.h
> @@ -197,6 +197,11 @@
>  #define DEFR6_MLOS1		(1 << 2)
>  #define DEFR6_DEFAULT		(DEFR6_CODE | DEFR6_TCNE1)
>  
> +#define DEFR7			0x000ec
> +#define DEFR7_CODE		(0x7779 << 16)
> +#define DEFR7_CMME1		BIT(6)
> +#define DEFR7_CMME0		BIT(4)
> +
>  /* -----------------------------------------------------------------------------
>   * R8A7790-only Control Registers
>   */

-- 
Regards,

Laurent Pinchart
