Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4A7EA38935
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Jun 2019 13:39:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727843AbfFGLjB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 7 Jun 2019 07:39:01 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:35916 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727762AbfFGLjB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Jun 2019 07:39:01 -0400
Received: from pendragon.ideasonboard.com (unknown [IPv6:2a02:a03f:44f0:8500:ca05:8177:199c:fed4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 70B48334;
        Fri,  7 Jun 2019 13:38:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1559907539;
        bh=sezsEJrIbh6vWjhAWih4gFzaNshMXzCSN0sha+5J27w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SDG3y5wlrY1Gw6kDfTHMs0rA3TrWiyXVBCr5JgDGAqnQEGK/VfdFxc2d75+DqUP/S
         4zp9lin5L5iyfYnSrouuUHGcjC91cRJLBIIq9cQZsCpm4pfW0NLBUkEE1Ab/8umrjR
         ukJcMLZVUZIphXj50xEbzyDz4j0G3YqZ89Hhp+YE=
Date:   Fri, 7 Jun 2019 14:38:45 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch, koji.matsuoka.xm@renesas.com, muroya@ksk.co.jp,
        VenkataRajesh.Kalakodima@in.bosch.com,
        Harsha.ManjulaMallikarjun@in.bosch.com,
        linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 15/20] drm: rcar-du: Claim CMM support for Gen3 SoCs
Message-ID: <20190607113845.GD7593@pendragon.ideasonboard.com>
References: <20190606142220.1392-1-jacopo+renesas@jmondi.org>
 <20190606142220.1392-16-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190606142220.1392-16-jacopo+renesas@jmondi.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Jacopo,

Thank you for the patch.

On Thu, Jun 06, 2019 at 04:22:15PM +0200, Jacopo Mondi wrote:
> Add CMM to the list of supported features for Gen3 SoCs that provide it:
> - R8A7795
> - R8A7796
> - R8A77965
> - R8A7799x
> 
> Leave R8A77970 out as V3M and V3H are the only Gen3 SoCs that do not
> support CMM.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Do we actually need this ? Could we just skip CMM handling if the cmms
property isn't set in DT ?

> ---
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 12 ++++++++----
>  drivers/gpu/drm/rcar-du/rcar_du_drv.h |  1 +
>  2 files changed, 9 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> index 75ab17af13a9..1e69cfa11798 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -247,7 +247,8 @@ static const struct rcar_du_device_info rcar_du_r8a7795_info = {
>  	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
>  		  | RCAR_DU_FEATURE_VSP1_SOURCE
>  		  | RCAR_DU_FEATURE_INTERLACED
> -		  | RCAR_DU_FEATURE_TVM_SYNC,
> +		  | RCAR_DU_FEATURE_TVM_SYNC
> +		  | RCAR_DU_FEATURE_CMM,
>  	.channels_mask = BIT(3) | BIT(2) | BIT(1) | BIT(0),
>  	.routes = {
>  		/*
> @@ -280,7 +281,8 @@ static const struct rcar_du_device_info rcar_du_r8a7796_info = {
>  	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
>  		  | RCAR_DU_FEATURE_VSP1_SOURCE
>  		  | RCAR_DU_FEATURE_INTERLACED
> -		  | RCAR_DU_FEATURE_TVM_SYNC,
> +		  | RCAR_DU_FEATURE_TVM_SYNC
> +		  | RCAR_DU_FEATURE_CMM,
>  	.channels_mask = BIT(2) | BIT(1) | BIT(0),
>  	.routes = {
>  		/*
> @@ -309,7 +311,8 @@ static const struct rcar_du_device_info rcar_du_r8a77965_info = {
>  	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
>  		  | RCAR_DU_FEATURE_VSP1_SOURCE
>  		  | RCAR_DU_FEATURE_INTERLACED
> -		  | RCAR_DU_FEATURE_TVM_SYNC,
> +		  | RCAR_DU_FEATURE_TVM_SYNC
> +		  | RCAR_DU_FEATURE_CMM,
>  	.channels_mask = BIT(3) | BIT(1) | BIT(0),
>  	.routes = {
>  		/*
> @@ -357,7 +360,8 @@ static const struct rcar_du_device_info rcar_du_r8a77970_info = {
>  static const struct rcar_du_device_info rcar_du_r8a7799x_info = {
>  	.gen = 3,
>  	.features = RCAR_DU_FEATURE_CRTC_IRQ_CLOCK
> -		  | RCAR_DU_FEATURE_VSP1_SOURCE,
> +		  | RCAR_DU_FEATURE_VSP1_SOURCE
> +		  | RCAR_DU_FEATURE_CMM,
>  	.channels_mask = BIT(1) | BIT(0),
>  	.routes = {
>  		/*
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> index 1327cd0df90a..a00dccc447aa 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> @@ -28,6 +28,7 @@ struct rcar_du_encoder;
>  #define RCAR_DU_FEATURE_VSP1_SOURCE	BIT(1)	/* Has inputs from VSP1 */
>  #define RCAR_DU_FEATURE_INTERLACED	BIT(2)	/* HW supports interlaced */
>  #define RCAR_DU_FEATURE_TVM_SYNC	BIT(3)	/* Has TV switch/sync modes */
> +#define RCAR_DU_FEATURE_CMM		BIT(4)	/* Has CMM */
>  
>  #define RCAR_DU_QUIRK_ALIGN_128B	BIT(0)	/* Align pitches to 128 bytes */
>  

-- 
Regards,

Laurent Pinchart
