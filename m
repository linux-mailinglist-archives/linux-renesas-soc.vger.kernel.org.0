Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 973B22D9CA3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 14 Dec 2020 17:28:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440241AbgLNQ1O (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 14 Dec 2020 11:27:14 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:46878 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2440243AbgLNQ1F (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Dec 2020 11:27:05 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 10D8A96;
        Mon, 14 Dec 2020 17:26:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1607963182;
        bh=l//g6lCDlFXDkyMFWA4kpo+QyoqtjSaX2LA0bi6VBnM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gkNpYPHST7QxTATc2NOe8QfDAYaHGNcydH5A+kE4/omGq7EkLRhGmldFmHXJXONj/
         e2oRDt4ePXHv2PfBW0bXvLd48P4tPisGV9RJOXK3nx3QcnhwV99+TqfhNZ3YKu+nNg
         p61JON3eW0fz2IfFa+gn/D4+woQnGNZkTT80tU7g=
Date:   Mon, 14 Dec 2020 18:26:16 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: Re: [PATCH 4/9] drm: rcar-du: Use DRM-managed allocation for VSP
 planes
Message-ID: <X9eSKM7KXms/4hoU@pendragon.ideasonboard.com>
References: <20201204220139.15272-1-laurent.pinchart+renesas@ideasonboard.com>
 <20201204220139.15272-5-laurent.pinchart+renesas@ideasonboard.com>
 <d1113ad9-ff19-884d-90c4-0074c983f193@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d1113ad9-ff19-884d-90c4-0074c983f193@ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

On Mon, Dec 14, 2020 at 04:20:17PM +0000, Kieran Bingham wrote:
> On 04/12/2020 22:01, Laurent Pinchart wrote:
> > devm_kcalloc() is the wrong API to allocate planes, as the lifetime of
> > the planes is tied to the DRM device, not the device to driver
> > binding. drmm_kcalloc() isn't a good option either, as it would result
> > in the planes being freed before being unregistered during the managed
> > cleanup of the DRM objects. Use a plain kcalloc(), and cleanup the
> > planes and free the memory in the existing rcar_du_vsp_cleanup()
> > handler.
> 
> Managed memory always seems to hurt - which is a shame, because it
> should be better throughout.
> 
> It's like we need a way to arbitrarily specify the lifetimes of objects
> correctly against another object... without being tied to a dev ...

I've been saying for years that devm_kzalloc() is a major regression.
We've traded a memory leak for a use-after-free. The function has its
use cases, there are objects that need to match the lifetime of the
binding between a device and its driver, but that's a small minority.

> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >  drivers/gpu/drm/rcar-du/rcar_du_vsp.c | 22 +++++++++++++++++-----
> >  1 file changed, 17 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> > index 4dcb1bfbe201..78a886651d9f 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> > @@ -21,6 +21,7 @@
> >  #include <linux/dma-mapping.h>
> >  #include <linux/of_platform.h>
> >  #include <linux/scatterlist.h>
> > +#include <linux/slab.h>
> >  #include <linux/videodev2.h>
> >  
> >  #include <media/vsp1.h>
> > @@ -344,6 +345,15 @@ static const struct drm_plane_funcs rcar_du_vsp_plane_funcs = {
> >  static void rcar_du_vsp_cleanup(struct drm_device *dev, void *res)
> >  {
> >  	struct rcar_du_vsp *vsp = res;
> > +	unsigned int i;
> > +
> > +	for (i = 0; i < vsp->num_planes; ++i) {
> > +		struct rcar_du_vsp_plane *plane = &vsp->planes[i];
> > +
> > +		drm_plane_cleanup(&plane->plane);
> > +	}
> > +
> > +	kfree(vsp->planes);
> >  
> >  	put_device(vsp->vsp);
> >  }
> > @@ -354,6 +364,7 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
> >  	struct rcar_du_device *rcdu = vsp->dev;
> >  	struct platform_device *pdev;
> >  	unsigned int num_crtcs = hweight32(crtcs);
> > +	unsigned int num_planes;
> >  	unsigned int i;
> >  	int ret;
> >  
> > @@ -376,14 +387,13 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
> >  	  * The VSP2D (Gen3) has 5 RPFs, but the VSP1D (Gen2) is limited to
> >  	  * 4 RPFs.
> >  	  */
> > -	vsp->num_planes = rcdu->info->gen >= 3 ? 5 : 4;
> > +	num_planes = rcdu->info->gen >= 3 ? 5 : 4;
> >  
> > -	vsp->planes = devm_kcalloc(rcdu->dev, vsp->num_planes,
> > -				   sizeof(*vsp->planes), GFP_KERNEL);
> > +	vsp->planes = kcalloc(num_planes, sizeof(*vsp->planes), GFP_KERNEL);
> >  	if (!vsp->planes)
> >  		return -ENOMEM;
> >  
> > -	for (i = 0; i < vsp->num_planes; ++i) {
> > +	for (i = 0; i < num_planes; ++i) {
> >  		enum drm_plane_type type = i < num_crtcs
> >  					 ? DRM_PLANE_TYPE_PRIMARY
> >  					 : DRM_PLANE_TYPE_OVERLAY;
> > @@ -409,8 +419,10 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
> >  		} else {
> >  			drm_plane_create_alpha_property(&plane->plane);
> >  			drm_plane_create_zpos_property(&plane->plane, 1, 1,
> > -						       vsp->num_planes - 1);
> > +						       num_planes - 1);
> >  		}
> > +
> > +		vsp->num_planes++;>  	}
> >  
> >  	return 0;
> > 

-- 
Regards,

Laurent Pinchart
