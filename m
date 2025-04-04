Return-Path: <linux-renesas-soc+bounces-15415-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5289CA7C534
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Apr 2025 22:57:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3B66189FD7A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Apr 2025 20:57:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B130F634;
	Fri,  4 Apr 2025 20:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SLxE48oR"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D468719F101
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Apr 2025 20:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743800241; cv=none; b=UVTEuPPNbAHaKRpS+E1kRT8M2kaK4GpwBNGAkZw+kb5ByzlsZGjFxTNoKnjiX/OkMe90epWO6s24l67ardMgODO9ekRx4CBU5RKXjWxbAPghyUx7dxIqkycPcCMG7hSHel/oYHjE7A0hR0miyXMFsdyGIGQAy5fMRD4RGMfLTq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743800241; c=relaxed/simple;
	bh=lfBNSrzdcxYPFhDVAgarg3j1GZbxKyb7ggiykvGJVQc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DEGaWHmEr9pmEoCztcdYM5qY3brE5qnc1RVf2s6gD9pC+35tDpWmAy4YdrWERXLXNBjUKF9+0rU9cdcWk5MeJBAEZXSuE9NlP2rREC5fwa6RDp+panvkgKef6ehLWReszBM0AyBqgDZDhM5q+P8S98kuhZgYhCN3Uay0EB0UjEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SLxE48oR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6C652316;
	Fri,  4 Apr 2025 22:55:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743800116;
	bh=lfBNSrzdcxYPFhDVAgarg3j1GZbxKyb7ggiykvGJVQc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SLxE48oRyOWTL01g7k7qW72paTy1FpzjsNKm92B5mEiQWGPPP4yfMCIOyxWKVgQFT
	 pG/FdnsyOufcUBi3T2s2CoGBCdCjX4nGucEFPQi95ZBYc2PMbRsKiY3bnXIzKnClii
	 A3YVXj6OQVms8bBgDQpFOGW7CV29Zgfw+QHK3mfU=
Date: Fri, 4 Apr 2025 23:56:45 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: Re: [PATCH] drm: renesas: Add zpos, alpha and blend properties to
 RZ/G2L DU
Message-ID: <20250404205645.GO4845@pendragon.ideasonboard.com>
References: <20250404133047.172080-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250404133047.172080-1-biju.das.jz@bp.renesas.com>

Hi Biju,

Thank you for the patch.

On Fri, Apr 04, 2025 at 02:30:45PM +0100, Biju Das wrote:
> Add support for zpos, alpha and blend properties to RZ/G2L DU
> driver as the IP supports all these properties.
> 
> It is tested by the below modetest commands:
> 
> modetest -M rzg2l-du -s 44@42:1920x1080@AR24 -d -P \
> 37@42:512x300+200+200@XR15
> 
> modetest -M rzg2l-du -w {32,37}:alpha:{0,65535}
> modetest -M rzg2l-du -w {32,37}:zpos:{0,1}
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
> index 8643ff2eec46..040d4e4aff00 100644
> --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
> +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c
> @@ -340,6 +340,15 @@ int rzg2l_du_vsp_init(struct rzg2l_du_vsp *vsp, struct device_node *np,
>  
>  		drm_plane_helper_add(&plane->plane,
>  				     &rzg2l_du_vsp_plane_helper_funcs);
> +
> +		drm_plane_create_alpha_property(&plane->plane);
> +		drm_plane_create_zpos_property(&plane->plane, i, 0,
> +					       num_planes - 1);
> +
> +		drm_plane_create_blend_mode_property(&plane->plane,
> +					BIT(DRM_MODE_BLEND_PIXEL_NONE) |
> +					BIT(DRM_MODE_BLEND_PREMULTI) |
> +					BIT(DRM_MODE_BLEND_COVERAGE));

It's interesting that the driver already handles the alpha, zpos and
blend mode properties set in the state, but doesn't expose those
properties to userspace.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>  	}
>  
>  	return 0;

-- 
Regards,

Laurent Pinchart

