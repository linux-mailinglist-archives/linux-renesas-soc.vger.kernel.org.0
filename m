Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82C5926B4C6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Sep 2020 01:31:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727406AbgIOXbi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Sep 2020 19:31:38 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:42862 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727384AbgIOXag (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Sep 2020 19:30:36 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EA529FD8;
        Wed, 16 Sep 2020 01:30:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1600212634;
        bh=zIzDuf1sKDcdjxVaHFr72m3U6IU/kzjy98ujrCuNe7U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=b7CmHkzjWKj408c2UdMQbTaLVvuS79BYfLqrvLwNuYCVUHZqyvwLEpbE4+k2KJjDt
         85IoaKvkbNXPZn5Fo2fj3aC98878mMGPd0H6Uj1R496lar6TB2PLjJR0xQ6a4KAtdN
         wwQj3z+JNadelAFPbOgMzZSI83h8HyJVA159mHv4=
Date:   Wed, 16 Sep 2020 02:30:04 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Yu Kuai <yukuai3@huawei.com>
Cc:     kieran.bingham+renesas@ideasonboard.com, airlied@linux.ie,
        daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        yi.zhang@huawei.com
Subject: Re: [PATCH] drm: rcar-du: add missing put_device() call in
 rcar_du_vsp_init()
Message-ID: <20200915233004.GD14954@pendragon.ideasonboard.com>
References: <20200910132354.692397-1-yukuai3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200910132354.692397-1-yukuai3@huawei.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Yu,

Thank you for the patch.

On Thu, Sep 10, 2020 at 09:23:54PM +0800, Yu Kuai wrote:
> if of_find_device_by_node() succeed, rcar_du_vsp_init() doesn't have
> a corresponding put_device(). Thus add a jump target to fix the exception
> handling for this function implementation.
> 
> Fixes: 6d62ef3ac30b ("drm: rcar-du: Expose the VSP1 compositor through KMS planes")
> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> index f1a81c9b184d..172ee3f3b21c 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> @@ -352,14 +352,16 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
>  
>  	/* Find the VSP device and initialize it. */
>  	pdev = of_find_device_by_node(np);
> -	if (!pdev)
> -		return -ENXIO;
> +	if (!pdev) {
> +		ret = -ENXIO;
> +		goto put_device;
> +	}

This change isn't needed, and will actually cause a crash, as pdev is
NULL.

>  
>  	vsp->vsp = &pdev->dev;
>  
>  	ret = vsp1_du_init(vsp->vsp);
>  	if (ret < 0)
> -		return ret;
> +		goto put_device;
>  
>  	 /*
>  	  * The VSP2D (Gen3) has 5 RPFs, but the VSP1D (Gen2) is limited to
> @@ -369,8 +371,10 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
>  
>  	vsp->planes = devm_kcalloc(rcdu->dev, vsp->num_planes,
>  				   sizeof(*vsp->planes), GFP_KERNEL);
> -	if (!vsp->planes)
> -		return -ENOMEM;
> +	if (!vsp->planes) {
> +		ret = -ENOMEM;
> +		goto put_device;
> +	}
>  
>  	for (i = 0; i < vsp->num_planes; ++i) {
>  		enum drm_plane_type type = i < num_crtcs
> @@ -387,7 +391,7 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
>  					       ARRAY_SIZE(rcar_du_vsp_formats),
>  					       NULL, type, NULL);
>  		if (ret < 0)
> -			return ret;
> +			goto put_device;
>  
>  		drm_plane_helper_add(&plane->plane,
>  				     &rcar_du_vsp_plane_helper_funcs);
> @@ -403,4 +407,7 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
>  	}
>  
>  	return 0;

I would add a blank line here.

> +put_device:

And maybe name the label "error" ?

> +	put_device(&pdev->dev);
> +	return ret;
>  }

We need more than this, we also need to call put_device() when the
driver is unloaded. The way to handle cleanup in DRM is through
drmm_add_action() nowadays, and I think we could thus simply replace the
change above with a cleanup action that is run both in the error path
and at driver remove.

I'll post a proposal in a reply to this e-mail.

-- 
Regards,

Laurent Pinchart
