Return-Path: <linux-renesas-soc+bounces-5644-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4810A8D3594
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 13:31:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 786C91C228C3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 May 2024 11:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77CE714B958;
	Wed, 29 May 2024 11:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="UL8VNze/"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from out-173.mta0.migadu.com (out-173.mta0.migadu.com [91.218.175.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D0E13C83E
	for <linux-renesas-soc@vger.kernel.org>; Wed, 29 May 2024 11:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716982299; cv=none; b=Kg1WNDSN5yBUyL1P7msMW4KdYt5ng7xllZPHrQQB4yFUz3NoZrtPXTDH9ftt2h9rBbhX2S6KrgCT7oU8H3Jo7yERO8uiVUSJ97K3oQ+T7zjazS4Z5Ou54S4X4XyFIrzP8lz1p0t6Zzuj6bMfxnlX0IMZ25CJH2gTBmORyXAI55I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716982299; c=relaxed/simple;
	bh=JVVVMR4snFHjWPRLvblPACREerwGgBlscvZHGTBrjj8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KR4bv9u1QP+M608PX05Hv0sI55cv+MeY0DqbRWPvpkyRTZ+XeMHGuZeRMbirIi0flMjFObmiGpuyksehjbnPLgW1nKt1mC7lx5W+G8/tBU6d1yQ0YJjuWAUKs01EHRSp9Rn1Nyt/KiJvY0JyLtguOs8/WVgh7tfXbC1N/P9Lj4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=UL8VNze/; arc=none smtp.client-ip=91.218.175.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: geert+renesas@glider.be
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1716982294;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KJeHwvqH9km+i5GFd8knM6OnsoO9UAYq4NGcbpxAgrE=;
	b=UL8VNze/tRVY2ixRZTzfeXSo7zne+CkGCieK5FEFd+V53sXDAixlTFV0K4fgOoS8C1rlqB
	WDrhEEVYGDPTjkJ7hQt9OiHyNvrx8vaAWEbgDW6dW2OATYpZ0Wsvkj9TjxbcUsKZXMBcGB
	E1ztgscRQcSGNCBa3wHR+dbV+B0U4LM=
X-Envelope-To: laurent.pinchart@ideasonboard.com
X-Envelope-To: maarten.lankhorst@linux.intel.com
X-Envelope-To: mripard@kernel.org
X-Envelope-To: tzimmermann@suse.de
X-Envelope-To: airlied@gmail.com
X-Envelope-To: daniel@ffwll.ch
X-Envelope-To: jfalempe@redhat.com
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: linux-renesas-soc@vger.kernel.org
Message-ID: <9c6116fd-d32d-4150-b0dd-91b8e1a539f2@linux.dev>
Date: Wed, 29 May 2024 19:31:26 +0800
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: drm: renesas: shmobile: Add drm_panic support
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jocelyn Falempe <jfalempe@redhat.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
References: <292638fde9aef8b00e984245f43dc02a818cf322.1716816827.git.geert+renesas@glider.be>
Content-Language: en-US, en-AU
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <292638fde9aef8b00e984245f43dc02a818cf322.1716816827.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

Hi,


On 5/27/24 21:34, Geert Uytterhoeven wrote:
> Add support for the drm_panic module, which displays a message on
> the screen when a kernel panic occurs.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>


Acked-by: Sui Jingfeng <sui.jingfeng@linux.dev>

> ---
> Tested on Armadillo-800-EVA.
> ---
>   drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c | 14 +++++++++++++-
>   1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> index 07ad17d24294d5e6..9d166ab2af8bd231 100644
> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> @@ -273,6 +273,13 @@ static const struct drm_plane_helper_funcs shmob_drm_plane_helper_funcs = {
>   	.atomic_disable = shmob_drm_plane_atomic_disable,
>   };
>   
> +static const struct drm_plane_helper_funcs shmob_drm_primary_plane_helper_funcs = {
> +	.atomic_check = shmob_drm_plane_atomic_check,
> +	.atomic_update = shmob_drm_plane_atomic_update,
> +	.atomic_disable = shmob_drm_plane_atomic_disable,
> +	.get_scanout_buffer = drm_fb_dma_get_scanout_buffer,
> +};
> +
>   static const struct drm_plane_funcs shmob_drm_plane_funcs = {
>   	.update_plane = drm_atomic_helper_update_plane,
>   	.disable_plane = drm_atomic_helper_disable_plane,
> @@ -310,7 +317,12 @@ struct drm_plane *shmob_drm_plane_create(struct shmob_drm_device *sdev,


Maybe a shmob_drm_plane_create_primary_plane() plus a
shmob_drm_plane_create_overlay().

I remember Thomas told this way or something similiar, call untangle.


>   	splane->index = index;
>   
> -	drm_plane_helper_add(&splane->base, &shmob_drm_plane_helper_funcs);
> +	if (type == DRM_PLANE_TYPE_PRIMARY)
> +		drm_plane_helper_add(&splane->base,
> +				     &shmob_drm_primary_plane_helper_funcs);
> +	else
> +		drm_plane_helper_add(&splane->base,
> +				     &shmob_drm_plane_helper_funcs);
>   
>   	return &splane->base;
>   }


Anyway, it looks good to me.


Best regards
Sui

