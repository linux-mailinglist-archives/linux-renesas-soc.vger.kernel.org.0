Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FDF419E709
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  4 Apr 2020 20:24:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726207AbgDDSYO (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 4 Apr 2020 14:24:14 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:37888 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726057AbgDDSYO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 4 Apr 2020 14:24:14 -0400
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5DDDC312;
        Sat,  4 Apr 2020 20:24:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586024652;
        bh=+1ZU8acYeetDVd5n9MvXzk6dPRfWYOGXyrBkucS4OrE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Mh/bVKdrO8IRWNb7xMTv9K4AxGyQ0Ew3S11+4+NEULkG72KFED2YwbmkN4hVDaJR6
         Iz2fuLfNQ6ZANmzPHIE4nqy9q0ZecwchFHaJw/S/+0I9+ceqZAWdmvEHzQR6PKeaqS
         S5+MInVRmg2ojIw+vVdbuDFEMPnun25JWS/hVtdI=
Date:   Sat, 4 Apr 2020 21:24:03 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomohito Esaki <etom@igel.co.jp>
Cc:     linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm: rcar-du: Set primary plane zpos immutably at
 initializing
Message-ID: <20200404182403.GB4875@pendragon.ideasonboard.com>
References: <20200401061100.7379-1-etom@igel.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200401061100.7379-1-etom@igel.co.jp>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Esaki-san,

Thank you for the patch.

On Wed, Apr 01, 2020 at 03:11:00PM +0900, Tomohito Esaki wrote:
> According to drm_plane_create_zpos_property() function documentation,
> all planes zpos range should be set if zpos property is supported.
> However, the rcar-du driver didn't set primary plane zpos range. Since
> the primary plane's zpos is fixed, set i immutably.
> 
> Signed-off-by: Tomohito Esaki <etom@igel.co.jp>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_plane.c | 5 ++++-
>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c   | 5 ++++-
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> index c6430027169f..9a499be45c45 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
> @@ -785,8 +785,11 @@ int rcar_du_planes_init(struct rcar_du_group *rgrp)
>  
>  		drm_plane_create_alpha_property(&plane->plane);
>  
> -		if (type == DRM_PLANE_TYPE_PRIMARY)
> +		if (type == DRM_PLANE_TYPE_PRIMARY) {
> +			drm_plane_create_zpos_immutable_property(&plane->plane,
> +								 0);
>  			continue;
> +		}

I would prefer an if ... else ... here and below instead of a continue,
to better handle future differences between primary and overlay planes.
Apart from that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I've taken the liberty to resend the patch with this change as a v2,
with the dri-devel mailing list in CC, and will include it in my next
pull request.

Would you mind CC'ing me for future patches to the R-Car DU driver ? You
can use the scripts/get_maintainer.pl script from the Linux kernel
sources to get a list of maintainers, reviewers and mailing lists for a
patch. There's no need to CC everybody on that list, but it can give you
at least the driver's maintainer and the corresponding mailing list.

>  
>  		drm_object_attach_property(&plane->plane.base,
>  					   rcdu->props.colorkey,
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> index 5e4faf258c31..382b720edc09 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> @@ -392,8 +392,11 @@ int rcar_du_vsp_init(struct rcar_du_vsp *vsp, struct device_node *np,
>  		drm_plane_helper_add(&plane->plane,
>  				     &rcar_du_vsp_plane_helper_funcs);
>  
> -		if (type == DRM_PLANE_TYPE_PRIMARY)
> +		if (type == DRM_PLANE_TYPE_PRIMARY) {
> +			drm_plane_create_zpos_immutable_property(&plane->plane,
> +								 0);
>  			continue;
> +		}
>  
>  		drm_plane_create_alpha_property(&plane->plane);
>  		drm_plane_create_zpos_property(&plane->plane, 1, 1,

-- 
Regards,

Laurent Pinchart
