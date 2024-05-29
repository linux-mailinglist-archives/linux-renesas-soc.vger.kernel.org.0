Return-Path: <linux-renesas-soc+bounces-5645-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E67F8D35BE
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 13:46:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41B7E2825BF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 11:46:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AECF1BC57;
	Wed, 29 May 2024 11:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="YIJgZ2K0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1AFE17993
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 May 2024 11:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716983159; cv=none; b=ttDuw5M8gGfiyFhaNQI8ARxvSXJjjX82TmUHInAm9HsLnwNfFGvPgzZIttjoBCpRqwOe8y9cXSlAn8CKUKNPK3G04ui2rfOHtdCFuE7ys4OumopPnGfmCRw27wXatX0Ru5mdXGMRVSOz5AZfFs7WEDwGWfPOgUjcIevcSfg0RNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716983159; c=relaxed/simple;
	bh=4wmXw7VQdsVMamcrCKzFKvEZuK+vTsx8YdS2w42QRHM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U2iQoHdNzsDMYkZ46BWpXKxavhNomEj7UCAL2JGsCKl1TZvsVcgOKB5SrHuiHGbuiXqPwV3bkNwoqiyhFFUFH6kQB5mMRL5uI4gmjz7NCgrE66AyRaEnkDwv6oxiavMJY/uSYrqNEjnEWLFRrqiNmn5aiKNbsTq9CxZ35fd/Qqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=YIJgZ2K0; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: geert+renesas@glider.be
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1716983155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=69NDQ0vBpwNw2iv9td+lvBVPzBboKDYczx8upcdamkg=;
	b=YIJgZ2K0/w0rwVyPyHCV7/zWP9j400R6BbWF8jrwTMpMW1h2ERQVP4tMBQQnVi2ZikNhld
	eGuD6BRxI5KH/f0iJylu1CvwAdBe8KAVsjW3lpVhRGsCiA4Nyqn37XYurzOr/d1+S7PGqp
	I0U/3TysZDWJMUe8t2sqGOfy4Fjm258=
X-Envelope-To: laurent.pinchart@ideasonboard.com
X-Envelope-To: kieran.bingham+renesas@ideasonboard.com
X-Envelope-To: airlied@gmail.com
X-Envelope-To: daniel@ffwll.ch
X-Envelope-To: jfalempe@redhat.com
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: linux-renesas-soc@vger.kernel.org
Message-ID: <206f2a01-a8a0-4066-bec8-1cf7a9f8b7a9@linux.dev>
Date: Wed, 29 May 2024 19:45:47 +0800
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: drm: renesas: rcar-du: Add drm_panic support for non-vsp
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jocelyn Falempe <jfalempe@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
References: <b633568d2e3f405b21debdd60854fe39780254d6.1716816897.git.geert+renesas@glider.be>
Content-Language: en-US, en-AU
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <b633568d2e3f405b21debdd60854fe39780254d6.1716816897.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Hi,


On 5/27/24 21:35, Geert Uytterhoeven wrote:
> Add support for the drm_panic module for DU variants not using the
> VSP-compositor, to display a message on the screen when a kernel panic
> occurs.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

After all concerns resolved:


Acked-by: Sui Jingfeng <sui.jingfeng@linux.dev>

> ---
> Tested on Koelsch (R-Car M2-W).
> 
> Support for DU variants using the VSP-compositor is more convoluted,
> and left to the DU experts.
> ---
>   drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.c | 14 ++++++++++++--
>   1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.c
> index e445fac8e0b46c21..c546ab0805d656f6 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.c
> @@ -680,6 +680,12 @@ static const struct drm_plane_helper_funcs rcar_du_plane_helper_funcs = {
>   	.atomic_update = rcar_du_plane_atomic_update,
>   };
>   
> +static const struct drm_plane_helper_funcs rcar_du_primary_plane_helper_funcs = {
> +	.atomic_check = rcar_du_plane_atomic_check,
> +	.atomic_update = rcar_du_plane_atomic_update,
> +	.get_scanout_buffer = drm_fb_dma_get_scanout_buffer,
> +};
> +
>   static struct drm_plane_state *
>   rcar_du_plane_atomic_duplicate_state(struct drm_plane *plane)
>   {
> @@ -812,8 +818,12 @@ int rcar_du_planes_init(struct rcar_du_group *rgrp)
>   		if (ret < 0)
>   			return ret;
>   
> -		drm_plane_helper_add(&plane->plane,
> -				     &rcar_du_plane_helper_funcs);
> +		if (type == DRM_PLANE_TYPE_PRIMARY)
> +			drm_plane_helper_add(&plane->plane,
> +					     &rcar_du_primary_plane_helper_funcs);
> +		else
> +			drm_plane_helper_add(&plane->plane,
> +					     &rcar_du_plane_helper_funcs);


Maybe we could do some untangle, but this is not a strong requirement.
Thanks.

Best regards
Sui

>   		drm_plane_create_alpha_property(&plane->plane);
>   



