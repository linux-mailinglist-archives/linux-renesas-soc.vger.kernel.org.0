Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5CC02F56FF
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Jan 2021 02:59:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728829AbhANB5O (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Jan 2021 20:57:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729410AbhAMXpH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Jan 2021 18:45:07 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B641C06179F
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Jan 2021 14:47:52 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 008622B3;
        Wed, 13 Jan 2021 23:46:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1610577967;
        bh=hs0JyPQJU1SNls7LgmN2tZNy0LrYCuZULzh4sWih/vc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Vhvvq18OBFnG1TV2a6SfeZW0unri8ta75SgKFfyfIvoKqpek6qftVHQ09mmGziRnh
         B2ZtsOojM6WquUNYg5q78xA0ALra2AvTNVFLlRwpPbshdm4hzpl1UXNpraVAcjMRZE
         3hZhd0Gp7vZ1/2zzTFbYdxRzwo5jeIzsl9Pav8f8=
Date:   Thu, 14 Jan 2021 00:45:49 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH] drm: rcar-du: Use drmm_encoder_alloc() to manage encoder
Message-ID: <X/94HaYff+rNR2YD@pendragon.ideasonboard.com>
References: <20210113170253.443820-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210113170253.443820-1-kieran.bingham+renesas@ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

Thank you for the patch.

On Wed, Jan 13, 2021 at 05:02:53PM +0000, Kieran Bingham wrote:
> The encoder allocation was converted to a DRM managed resource at the
> same time as the addition of a new helper drmm_encoder_alloc() which
> simplifies the same process.
> 
> Convert the custom drm managed resource allocation of the encoder
> with the helper to simplify the implementation, and prevent hitting a
> WARN_ON() due to the handling the drm_encoder_init() call directly
> without registering a .destroy() function op.
> 
> Fixes: f5f16725edbc ("drm: rcar-du: Use DRM-managed allocation for encoders")

We could equally point to the patch that has added drmm_encoder_alloc(),
but I'm fine taking the blame :-)

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_encoder.c | 31 +++++------------------
>  1 file changed, 6 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> index ba8c6038cd63..ca3761772211 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_encoder.c
> @@ -48,21 +48,12 @@ static unsigned int rcar_du_encoder_count_ports(struct device_node *node)
>  static const struct drm_encoder_funcs rcar_du_encoder_funcs = {
>  };
>  
> -static void rcar_du_encoder_release(struct drm_device *dev, void *res)
> -{
> -	struct rcar_du_encoder *renc = res;
> -
> -	drm_encoder_cleanup(&renc->base);
> -	kfree(renc);
> -}
> -
>  int rcar_du_encoder_init(struct rcar_du_device *rcdu,
>  			 enum rcar_du_output output,
>  			 struct device_node *enc_node)
>  {
>  	struct rcar_du_encoder *renc;
>  	struct drm_bridge *bridge;
> -	int ret;
>  
>  	/*
>  	 * Locate the DRM bridge from the DT node. For the DPAD outputs, if the
> @@ -101,26 +92,16 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
>  			return -ENOLINK;
>  	}
>  
> -	renc = kzalloc(sizeof(*renc), GFP_KERNEL);
> -	if (renc == NULL)
> -		return -ENOMEM;
> -
> -	renc->output = output;
> -
>  	dev_dbg(rcdu->dev, "initializing encoder %pOF for output %u\n",
>  		enc_node, output);
>  
> -	ret = drm_encoder_init(&rcdu->ddev, &renc->base, &rcar_du_encoder_funcs,
> -			       DRM_MODE_ENCODER_NONE, NULL);
> -	if (ret < 0) {
> -		kfree(renc);
> -		return ret;
> -	}
> +	renc = drmm_encoder_alloc(&rcdu->ddev, struct rcar_du_encoder, base,
> +				  &rcar_du_encoder_funcs, DRM_MODE_ENCODER_NONE,
> +				  NULL);
> +	if (!renc)
> +		return -ENOMEM;
>  
> -	ret = drmm_add_action_or_reset(&rcdu->ddev, rcar_du_encoder_release,
> -				       renc);
> -	if (ret)
> -		return ret;
> +	renc->output = output;
>  
>  	/*
>  	 * Attach the bridge to the encoder. The bridge will create the

-- 
Regards,

Laurent Pinchart
