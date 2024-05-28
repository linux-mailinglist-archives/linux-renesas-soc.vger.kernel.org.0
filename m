Return-Path: <linux-renesas-soc+bounces-5541-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF428D1547
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 May 2024 09:23:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 474C3B22F34
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 May 2024 07:23:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C55D073164;
	Tue, 28 May 2024 07:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a6jNkMtg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196AB7316E
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 May 2024 07:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716881011; cv=none; b=FdlG2Z6cD42cC6UCNN2UtqEgDDIP+A98SuMSrMKbai2Jp46kIkGh9sNshFo73j/ybqZGoRbW1uXHfrq48rQOGtai+o3WRZX4n8pEv21Jz8f0NO72EpoyA2jdAkXxQ0EREr17rrbcHuHxHrL0ND/jjPmUWsRAyc+943T0t9lbA6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716881011; c=relaxed/simple;
	bh=ex7MGfodL/GBXVmhpmlHovCwgtkUXZvLvjdEPwjakHA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=thpdiTFTEuYDgSXZ33lBHLlDtCKmZNBtIAJuKDbAmvaCtYow1PW0o1oElZule7IVXKy6stqascw2/L+yBTXUoBUcwN27tRTbKz1qdAj3JmmPs+e+nzidJXeTAs9+nWBJPJnm9uR/ePEPJTBTusu4dDkx/z7r9hzYjkOHT4lfIMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a6jNkMtg; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716881009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VIKabPGyTRiuw7RJzrHvb3kyiYNdSlXoTWM2TmzKlL4=;
	b=a6jNkMtgK7NeLxvNr1xBOfr3MzdxYmyF3voBJ16jxSmAmsjS9+Fgo/nCtkqN2oVuzU5nJv
	f/F7ZEDeBzGOiJRWB7OvXfdz4DWjob0zQ4Zl1u+9O1MIxvhRylkA4DMgXdDTARy/ZDfraE
	l5gihXr3iELOgpE10w7w7Vg5S/jH7cE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-551-AFrScHPUNVuNz0GFPJSVxA-1; Tue, 28 May 2024 03:23:27 -0400
X-MC-Unique: AFrScHPUNVuNz0GFPJSVxA-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3564bb7b352so274665f8f.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 May 2024 00:23:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716881006; x=1717485806;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VIKabPGyTRiuw7RJzrHvb3kyiYNdSlXoTWM2TmzKlL4=;
        b=P+3SkpsruRQd48KWAUQzf+/O+A3dETMlG53x0XEnMggdzHUGJUeX8nTfvHaVvc2Iw8
         ftgiuOakHMLL7Du2YVQXS3kOlNUcsXJg//BaVYhKvYX7LYQb2b5S1WO+gCRBqDhX/cnE
         7Njrv+vQEm4z7yyfLTs5eNunF2c3SVz6UH2NgjX+jQb3Y5ZvrFwlEgraAdjhjET5RrBZ
         GfViwXWMGRlF2G784qoGj/N00JJzPsBscUZxBFzXKQGICJWV9I27XCaYLJmSgRI1gfeX
         blMvC7GpVIZIiGcY/Sq7XGP4XKZDOqdseXG23AreCF8y4fHdOFSSKKzWHpWrw8KkIwCW
         eXQw==
X-Forwarded-Encrypted: i=1; AJvYcCXTYR4yZtH3XbzpGBc3kZdvyq6eBt7SNkvnpHi4KMFhpWeGCJn2enwPcyk+LSXebYY4Bg+Wod05E73SNepv1KM7z5FTNorcTRsyoSPcNQhRaQI=
X-Gm-Message-State: AOJu0YyRzqbmlyqnSe503+Az0sAARcTsr1+7qF+HTE9CjNumKy+JrGHn
	iEIXu307HZjDwuaycPSPQMWmcMlBWmwsvdLiALlxwC4bui0bDH0mVdkZTu/EP0eJzTrJ34lclfR
	PUn4NoO4N2suLfEWel0WGNGB/QIto3tYpWNirfl4yrG/Jw+UaUk3Hbtb7eAkj3OsBSkJe
X-Received: by 2002:a5d:6aca:0:b0:354:fa6e:7ae2 with SMTP id ffacd0b85a97d-3552219cfa0mr6921537f8f.36.1716881006339;
        Tue, 28 May 2024 00:23:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPOdJrgdiOdMG05jUeF5M+1HEpNSRnZCKxZ19O3et6QfkQ3lRcWUM/ROnB5RsVv06HhEQfGg==
X-Received: by 2002:a5d:6aca:0:b0:354:fa6e:7ae2 with SMTP id ffacd0b85a97d-3552219cfa0mr6921516f8f.36.1716881005889;
        Tue, 28 May 2024 00:23:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:2ceb:e04a:af9c:bc9b? ([2a01:e0a:c:37e0:2ceb:e04a:af9c:bc9b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-359b3675c6csm3846786f8f.71.2024.05.28.00.23.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 May 2024 00:23:25 -0700 (PDT)
Message-ID: <ad904183-3070-4c24-b28a-53d477813785@redhat.com>
Date: Tue, 28 May 2024 09:23:24 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: renesas: rcar-du: Add drm_panic support for non-vsp
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
References: <b633568d2e3f405b21debdd60854fe39780254d6.1716816897.git.geert+renesas@glider.be>
Content-Language: en-US, fr
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <b633568d2e3f405b21debdd60854fe39780254d6.1716816897.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 27/05/2024 15:35, Geert Uytterhoeven wrote:
> Add support for the drm_panic module for DU variants not using the
> VSP-compositor, to display a message on the screen when a kernel panic
> occurs.

Thanks for your patch, I'm pleased that you find drm_panic useful.

That looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
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
>   
>   		drm_plane_create_alpha_property(&plane->plane);
>   


