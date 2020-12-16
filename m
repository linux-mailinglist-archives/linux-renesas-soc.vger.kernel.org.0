Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB8592DC19E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Dec 2020 14:52:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726305AbgLPNwH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Dec 2020 08:52:07 -0500
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:53341 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726137AbgLPNwG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Dec 2020 08:52:06 -0500
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 2E0FCC0010;
        Wed, 16 Dec 2020 13:51:23 +0000 (UTC)
Date:   Wed, 16 Dec 2020 14:51:34 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH] drm: rcar-du: Fix leak of CMM platform device reference
Message-ID: <20201216135134.hshdaf5mub2h6lgk@uno.localdomain>
References: <20201216012218.9205-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201216012218.9205-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Laurent,

I wonder if 'leaked' is correct in subject. It probably is,
un-balanced ref-counting will prevent the device from being released.
It should however happen only at system tear-down, doesn't it ?

On Wed, Dec 16, 2020 at 03:22:18AM +0200, Laurent Pinchart wrote:
> The device references acquired by of_find_device_by_node() are not
> released by the driver. Fix this by registering a cleanup action.
>
> Fixes: 8de707aeb452 ("drm: rcar-du: kms: Initialize CMM instances")
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> index 92dfa3d4c011..7070f3c9b529 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> @@ -14,6 +14,7 @@
>  #include <drm/drm_fb_cma_helper.h>
>  #include <drm/drm_gem_cma_helper.h>
>  #include <drm/drm_gem_framebuffer_helper.h>
> +#include <drm/drm_managed.h>
>  #include <drm/drm_probe_helper.h>
>  #include <drm/drm_vblank.h>
>
> @@ -721,6 +722,8 @@ static int rcar_du_cmm_init(struct rcar_du_device *rcdu)
>
>  		of_node_put(cmm);
>
> +		rcdu->cmms[i] = pdev;
> +

In the unfortunate event that the cmm intialization fails here below,
rcdu->cmms[i] will stay assigned, causing the rcar_du_crtc_create()
function which is called just after rcar_du_cmm_init() to access a
non-valid cmm instance.

I would either reset the rcdu->cmms[i] field to NULL in the below error
paths, or maintain the cmms[i] = pdev assignement at the end of the
function and put_device(pdev->dev) in the error paths.

Thanks
  j

>  		/*
>  		 * -ENODEV is used to report that the CMM config option is
>  		 * disabled: return 0 and let the DU continue probing.
> @@ -739,13 +742,22 @@ static int rcar_du_cmm_init(struct rcar_du_device *rcdu)
>  				"Failed to create device link to CMM%u\n", i);
>  			return -EINVAL;
>  		}
> -
> -		rcdu->cmms[i] = pdev;
>  	}
>
>  	return 0;
>  }
>
> +static void rcar_du_modeset_cleanup(struct drm_device *dev, void *res)
> +{
> +	struct rcar_du_device *rcdu = to_rcar_du_device(dev);
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(rcdu->cmms); ++i) {
> +		if (rcdu->cmms[i])
> +			put_device(&rcdu->cmms[i]->dev);
> +	}
> +}
> +
>  int rcar_du_modeset_init(struct rcar_du_device *rcdu)
>  {
>  	static const unsigned int mmio_offsets[] = {
> @@ -766,6 +778,10 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
>  	if (ret)
>  		return ret;
>
> +	ret = drmm_add_action(&rcdu->ddev, rcar_du_modeset_cleanup, NULL);
> +	if (ret)
> +		return ret;
> +
>  	dev->mode_config.min_width = 0;
>  	dev->mode_config.min_height = 0;
>  	dev->mode_config.normalize_zpos = true;
> --
> Regards,
>
> Laurent Pinchart
>
