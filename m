Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9B2496827
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Aug 2019 19:58:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730142AbfHTR57 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 20 Aug 2019 13:57:59 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:42474 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730006AbfHTR57 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Aug 2019 13:57:59 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4DF0A33D;
        Tue, 20 Aug 2019 19:57:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1566323877;
        bh=miwUknVhgQ902Gs6x9av3rDFGsRLFeuwfvd/ATk1ig4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IIuxCgp6pjKozIyoaL1KdTmIfqLNZ3uX5U1uM+/Koth6YaneTR5c26mTi5JQ6a7VF
         b57ZzT3tL7ouufOM4z80S30st774FPGYBBE33YSnl1f/fE2Qmf6J/gZBS7xbT5Z+RJ
         O/ROFuTT9YPvYG8uNIZREDbIlDGzVgAdKGBTTlW8=
Date:   Tue, 20 Aug 2019 20:57:51 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch, koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 17/19] drm: rcar-du: crtc: Enable and disable CMMs
Message-ID: <20190820175751.GK10820@pendragon.ideasonboard.com>
References: <20190706140746.29132-1-jacopo+renesas@jmondi.org>
 <20190706140746.29132-18-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190706140746.29132-18-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Sat, Jul 06, 2019 at 04:07:44PM +0200, Jacopo Mondi wrote:
> Enable/disable the CMM associated with a CRTC at crtc start and stop

s/crtc/CRTC/

> time and enable the CMM unit through the Display Extensional Functions
> register at group setup time.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c  | 7 +++++++
>  drivers/gpu/drm/rcar-du/rcar_du_group.c | 8 ++++++++
>  drivers/gpu/drm/rcar-du/rcar_du_regs.h  | 5 +++++
>  3 files changed, 20 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> index 23f1d6cc1719..3dac605c3a67 100644
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
> @@ -619,6 +620,9 @@ static void rcar_du_crtc_stop(struct rcar_du_crtc *rcrtc)
>  	if (rcar_du_has(rcrtc->dev, RCAR_DU_FEATURE_VSP1_SOURCE))
>  		rcar_du_vsp_disable(rcrtc);
>  
> +	if (rcrtc->cmm)
> +		rcar_cmm_disable(rcrtc->cmm);
> +
>  	/*
>  	 * Select switch sync mode. This stops display operation and configures
>  	 * the HSYNC and VSYNC signals as inputs.
> @@ -686,6 +690,9 @@ static void rcar_du_crtc_atomic_enable(struct drm_crtc *crtc,
>  	}
>  
>  	rcar_du_crtc_start(rcrtc);
> +
> +	if (rcrtc->cmm)
> +		rcar_cmm_enable(rcrtc->cmm);
>  }
>  
>  static void rcar_du_crtc_atomic_disable(struct drm_crtc *crtc,
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c b/drivers/gpu/drm/rcar-du/rcar_du_group.c
> index 9eee47969e77..d252c9bb9809 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
> @@ -147,6 +147,14 @@ static void rcar_du_group_setup(struct rcar_du_group *rgrp)
>  
>  	rcar_du_group_setup_pins(rgrp);
>  
> +	if (rcar_du_has(rcdu, RCAR_DU_FEATURE_CMM)) {
> +		u32 defr7 = DEFR7_CODE |
> +			    (rgrp->cmms_mask & BIT(1) ? DEFR7_CMME1 : 0) |
> +			    (rgrp->cmms_mask & BIT(0) ? DEFR7_CMME0 : 0);

Nitpicking, the DU driver usually puts the | at the beginning of the
next line for such assignments.

		u32 defr7 = DEFR7_CODE
			  | (rgrp->cmms_mask & BIT(1) ? DEFR7_CMME1 : 0)
			  | (rgrp->cmms_mask & BIT(0) ? DEFR7_CMME0 : 0);

Apart from that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
> +		rcar_du_group_write(rgrp, DEFR7, defr7);
> +	}
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
