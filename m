Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93EF838962
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Jun 2019 13:51:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728576AbfFGLvc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 7 Jun 2019 07:51:32 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:36058 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727386AbfFGLvc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Jun 2019 07:51:32 -0400
Received: from pendragon.ideasonboard.com (unknown [IPv6:2a02:a03f:44f0:8500:ca05:8177:199c:fed4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BA11FB91;
        Fri,  7 Jun 2019 13:51:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1559908290;
        bh=DIOoy9wgvhZ1Td5HDm9OqAdDcaAPB6MLeqCIuaVKhwM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MNBs+tJzO6AkMubhk7oEyQE+Z9PTbVDop+9d30BoJLaX3r8M9w7vX6v+J377uGttH
         4nJ71FPWWKPnB7Ob3tZgRmlmVcNmSsaBe+FRblLYo+6GNzjHAVJT2/ctPxJO5ms6OL
         YC/wo2X2yB7H5zJVC6JJCeAvDRLFudGAG0flMYFs=
Date:   Fri, 7 Jun 2019 14:51:16 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch, koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 17/20] drm: rcar-du: crtc: Enable and disable CMMs
Message-ID: <20190607115116.GF7593@pendragon.ideasonboard.com>
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
 <20190606142220.1392-18-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190606142220.1392-18-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Thu, Jun 06, 2019 at 04:22:17PM +0200, Jacopo Mondi wrote:
> Enable/disable the CMM associated with a CRTC at
> atomic_enable()/atomic_disable() time.

I would squash this patch with the next 3. It's hard to review them
independently.

> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> index 9f270a54b164..e6d3df37c827 100644
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
> @@ -523,6 +524,7 @@ static int rcar_du_crtc_get(struct rcar_du_crtc *rcrtc)
>  		goto error_group;
>  
>  	rcar_du_crtc_setup(rcrtc);
> +

Unrelated change ?

>  	rcrtc->initialized = true;
>  
>  	return 0;
> @@ -619,6 +621,9 @@ static void rcar_du_crtc_stop(struct rcar_du_crtc *rcrtc)
>  	if (rcar_du_has(rcrtc->dev, RCAR_DU_FEATURE_VSP1_SOURCE))
>  		rcar_du_vsp_disable(rcrtc);
>  
> +	if (rcar_du_has(rcrtc->dev, RCAR_DU_FEATURE_CMM) && rcrtc->cmm)

You can just test rcrtc->cmm. Same below.

> +		rcar_cmm_disable(rcrtc->cmm);
> +
>  	/*
>  	 * Select switch sync mode. This stops display operation and configures
>  	 * the HSYNC and VSYNC signals as inputs.
> @@ -686,6 +691,9 @@ static void rcar_du_crtc_atomic_enable(struct drm_crtc *crtc,
>  	}
>  
>  	rcar_du_crtc_start(rcrtc);
> +
> +	if (rcar_du_has(rcrtc->dev, RCAR_DU_FEATURE_CMM) && rcrtc->cmm)
> +		rcar_cmm_enable(rcrtc->cmm);
>  }
>  
>  static void rcar_du_crtc_atomic_disable(struct drm_crtc *crtc,

-- 
Regards,

Laurent Pinchart
