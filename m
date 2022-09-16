Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AB7B5BAC35
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Sep 2022 13:20:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230514AbiIPLUy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 16 Sep 2022 07:20:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230470AbiIPLUx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Sep 2022 07:20:53 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8611451A07
        for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Sep 2022 04:20:52 -0700 (PDT)
Received: from pendragon.ideasonboard.com (unknown [89.101.193.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B4ED347C;
        Fri, 16 Sep 2022 13:20:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1663327250;
        bh=2bBPYXQKqkqV3YMm/hqktXNm0FFG8cQdhQqtXYH72r4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GGsyf2/i7va9mwWXnFAcJKyEbiQNaaod1LYrAN7+GR2kz8pmoppZu5AhD5ikYnfsv
         eriM8n1GedVgKPamlPLSkvsYHxuGC27VCxx4BpdxF0DgRAoKZHO0a3rP8Kmm3NZRPV
         C+IyWx1U37B277KfMyErvS3L2XhLqLlvJ8ZNLhXs=
Date:   Fri, 16 Sep 2022 14:20:35 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        airlied@linux.ie, daniel@ffwll.ch, bskeggs@redhat.com,
        kherbst@redhat.com, lyude@redhat.com,
        kieran.bingham+renesas@ideasonboard.com, jyri.sarha@iki.fi,
        tomba@kernel.org, sam@ravnborg.org,
        dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/4] drm/plane-helper: Warn if atomic drivers call
 non-atomic helpers
Message-ID: <YyRcA/aqx44NvfwT@pendragon.ideasonboard.com>
References: <20220909105947.6487-1-tzimmermann@suse.de>
 <20220909105947.6487-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220909105947.6487-4-tzimmermann@suse.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Thomas,

Thank you for the patch.

On Fri, Sep 09, 2022 at 12:59:46PM +0200, Thomas Zimmermann wrote:
> The plane update and disable helpers are only useful for non-atomic
> drivers. Print a warning if an atomic driver calls them.
> 
> Suggested-by: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/drm_plane_helper.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_plane_helper.c b/drivers/gpu/drm/drm_plane_helper.c
> index c7785967f5bf..1c904fc26a58 100644
> --- a/drivers/gpu/drm/drm_plane_helper.c
> +++ b/drivers/gpu/drm/drm_plane_helper.c
> @@ -30,8 +30,10 @@
>  #include <drm/drm_atomic_uapi.h>
>  #include <drm/drm_crtc_helper.h>
>  #include <drm/drm_device.h>
> +#include <drm/drm_drv.h>
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_plane_helper.h>
> +#include <drm/drm_print.h>
>  #include <drm/drm_rect.h>
>  
>  #define SUBPIXEL_MASK 0xffff
> @@ -195,10 +197,14 @@ int drm_plane_helper_update_primary(struct drm_plane *plane, struct drm_crtc *cr
>  		.x2 = crtc_x + crtc_w,
>  		.y2 = crtc_y + crtc_h,
>  	};
> +	struct drm_device *dev = plane->dev;
>  	struct drm_connector **connector_list;
>  	int num_connectors, ret;
>  	bool visible;
>  
> +	if (drm_WARN_ON_ONCE(dev, drm_drv_uses_atomic_modeset(dev)))
> +		return -EINVAL;
> +
>  	ret = drm_plane_helper_check_update(plane, crtc, fb,
>  					    &src, &dest,
>  					    DRM_MODE_ROTATE_0,
> @@ -260,6 +266,10 @@ EXPORT_SYMBOL(drm_plane_helper_update_primary);
>  int drm_plane_helper_disable_primary(struct drm_plane *plane,
>  				     struct drm_modeset_acquire_ctx *ctx)
>  {
> +	struct drm_device *dev = plane->dev;
> +
> +	drm_WARN_ON_ONCE(dev, drm_drv_uses_atomic_modeset(dev));
> +
>  	return -EINVAL;
>  }
>  EXPORT_SYMBOL(drm_plane_helper_disable_primary);

-- 
Regards,

Laurent Pinchart
