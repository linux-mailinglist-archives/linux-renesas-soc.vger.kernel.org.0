Return-Path: <linux-renesas-soc+bounces-5574-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7688D29C2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 03:05:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 25A72B219F6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 01:05:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9162318B04;
	Wed, 29 May 2024 01:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="s6Rw8Q3W"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2E6D2FE
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 May 2024 01:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716944710; cv=none; b=D78nAaFmEFmV9sofOBdE+gwEHV6OYE9z/xNd/DqpT7DCkP8YoeA9k2IW0eC4cDcoVGDC5fOffioTG19QIkgFvVmWv/zAUziPFy+HJOBDt/zC3FaVJwz+VomwBsv3WVyCLHasUKBDtpeEdOi+lLFW3pU8jr/MG/ub1m3/DM0LRXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716944710; c=relaxed/simple;
	bh=Q9aB7qo7rgKWWPIPpkQIb96SuDN1Zyzh/uBzNV+HxKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VcmecVsWxuBJclCGiuQsTxaykaoVCiUh2KNbehQ07DPS7nUcA+wdyquYSrhg+7DYqzmb+aQOKz1feyC5TbVJH2e8mmaYMCoYlvoYixMBWadhnaWrf0qD21in8XDqL5cnEAO8qv4nbiacJDjwPjywB1i3u/fTa2YqiT0K3TjLPuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=s6Rw8Q3W; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 62809397;
	Wed, 29 May 2024 03:05:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1716944704;
	bh=Q9aB7qo7rgKWWPIPpkQIb96SuDN1Zyzh/uBzNV+HxKY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s6Rw8Q3WyUS5nr4MzugnyERBEfElkkK1E66ETmnGSsw7n4evpJs1wJR51AOj6nlr6
	 v4O4/XdUIXI/q+ya2E0F0rJmuzSH8oQbI7fH2Enpxf4G3+sNH4WUlMwt8veiCtf9fg
	 Phr7XslmxyCqc6aMFTpUtd32RrltRHUoKQh6o7Bw=
Date: Wed, 29 May 2024 04:04:55 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Jocelyn Falempe <jfalempe@redhat.com>,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm: renesas: rcar-du: Add drm_panic support for non-vsp
Message-ID: <20240529010455.GJ1436@pendragon.ideasonboard.com>
References: <b633568d2e3f405b21debdd60854fe39780254d6.1716816897.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b633568d2e3f405b21debdd60854fe39780254d6.1716816897.git.geert+renesas@glider.be>

Hi Geert,

Thank you for the patch.

On Mon, May 27, 2024 at 03:35:49PM +0200, Geert Uytterhoeven wrote:
> Add support for the drm_panic module for DU variants not using the
> VSP-compositor, to display a message on the screen when a kernel panic
> occurs.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Tested on Koelsch (R-Car M2-W).
> 
> Support for DU variants using the VSP-compositor is more convoluted,
> and left to the DU experts.

That's not high on my priority list, so if anyone wants to play, be my
guest :-)

> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.c
> index e445fac8e0b46c21..c546ab0805d656f6 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.c
> @@ -680,6 +680,12 @@ static const struct drm_plane_helper_funcs rcar_du_plane_helper_funcs = {
>  	.atomic_update = rcar_du_plane_atomic_update,
>  };
>  
> +static const struct drm_plane_helper_funcs rcar_du_primary_plane_helper_funcs = {
> +	.atomic_check = rcar_du_plane_atomic_check,
> +	.atomic_update = rcar_du_plane_atomic_update,
> +	.get_scanout_buffer = drm_fb_dma_get_scanout_buffer,
> +};
> +
>  static struct drm_plane_state *
>  rcar_du_plane_atomic_duplicate_state(struct drm_plane *plane)
>  {
> @@ -812,8 +818,12 @@ int rcar_du_planes_init(struct rcar_du_group *rgrp)
>  		if (ret < 0)
>  			return ret;
>  
> -		drm_plane_helper_add(&plane->plane,
> -				     &rcar_du_plane_helper_funcs);
> +		if (type == DRM_PLANE_TYPE_PRIMARY)
> +			drm_plane_helper_add(&plane->plane,
> +					     &rcar_du_primary_plane_helper_funcs);
> +		else
> +			drm_plane_helper_add(&plane->plane,
> +					     &rcar_du_plane_helper_funcs);

Same comment as for the shmobile-drm patch. Let's discuss it there.

>  
>  		drm_plane_create_alpha_property(&plane->plane);
>  

-- 
Regards,

Laurent Pinchart

