Return-Path: <linux-renesas-soc+bounces-5540-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8EA8D153D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 May 2024 09:21:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA0F61F23014
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 May 2024 07:21:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B69D71742;
	Tue, 28 May 2024 07:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OTXHHnHY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BD64F201
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 May 2024 07:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716880870; cv=none; b=agMqq8m6qTlAcgUQKTpQ0hE1gMz4DPWxBUTRsVrHfG7UHZhHYndigH6J3IPuWvK/S38X5pV2Ow/at3HTV32iCfwS3AnQDx6+eqieA7eiA9y+D6aMwSnIaGjBwhW0cfhjGc8jUtooNOF1P7PKxpDQ76Z+JnxG/kEzKKgQRBQ5aj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716880870; c=relaxed/simple;
	bh=xpTiGzpL/s3/GL2Ko5iYWbO8kgb/4HRwMe2CBSuXU2o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s3301rfLrl9gMLULZzo65ZXSQf/aaURIkoIQTQCRBeMCBq/fDKuZzDX9hgsSCCS6zB+ycvZaamwLUDlnBBMeGEqpz1swqA1PGY5somxd3r5ZzkhBSK4mvyxdNMGWcWBG097incPUr8gfkONj9f0SdVaNFkyJ2tOsM+6f06ZDYdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OTXHHnHY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716880867;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f6Fk/w+D1tGkwzU6hq3XlU1/wNjVdws7JU17k3ts/bw=;
	b=OTXHHnHYqek42STouq19QZ5mnHJoeUgYussLOPrx0MfJg9812WHOM2/W78FYkdBDDx1pon
	DhjPUG0Ba9vzZvOGGS3/ybFiJMtz7hw/OnZxjCt+EWNO3XeD7sYZf2DEEIl0uVdFPcDmlt
	OY8mfnfj5Zp+ob/h0DWxp/wMnNfdVzQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-169-N42oWuScNoyPVU5pVviLew-1; Tue, 28 May 2024 03:21:05 -0400
X-MC-Unique: N42oWuScNoyPVU5pVviLew-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-354f28306dfso401502f8f.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 May 2024 00:21:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716880862; x=1717485662;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f6Fk/w+D1tGkwzU6hq3XlU1/wNjVdws7JU17k3ts/bw=;
        b=C5rXVIZrMBIkBXf0lZJa4vfFf6LxVE8Yta+ivaiL3Up7ws8V6IlmJOpkz/Cb6t1xa7
         LbGfDLssSjBQw5htA3TDTx2IGp5BArZBxOyeKikLIT1dyivMbq7YhpQMGPJoT6XOq/ot
         3k8b/TYExeeY/z7UKgBuICqgrdKXiUZhjVLUwOdVR49461bIz2GgZHLuvhKaZ8likbD0
         E4007C1PifiiQEgeBt5fHNqkgSepgGmKWMc6cmoP8UQ1bsvAQLwiYF3icPNPegS+OY6v
         RSYqdtgsdKTYd4YXNyyb1rQUpqqPTJnQaodc/fAxozl9HHvKyEW3EoMW2r1EBaIU2VCt
         ASxg==
X-Forwarded-Encrypted: i=1; AJvYcCVNcmK3asNbH1xTn27EKNuUmbuTAGeZImOKr64qYQzTMoNox6k8LGGZQuOKMRao+7i8UMI7qAI6xqPbuuo6PQbarigWzie969jB3a+YJAobNwQ=
X-Gm-Message-State: AOJu0YypUinY9uplYkk8/fCACbLNt+0rvXNqcY4uuAeUQgp1nFwVd/th
	KjMiWLpI5BA8Ypf7/hSoQpoRoZnrGpN9uAVq4TrRl5myhiFrKF9JQIRH3high+0US43kWv49xjY
	MVYKcG1nOWGRfDSIuGzPbdXIO/aJUYpJ9ZMp8Akk/KPU+T1N4fZUmTXfF8WIqL0R+NDml
X-Received: by 2002:a5d:6686:0:b0:354:e72f:d5d7 with SMTP id ffacd0b85a97d-35526c39ef7mr7616970f8f.24.1716880862118;
        Tue, 28 May 2024 00:21:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAcFtbj8Pi786V1gkPPqQhO4i/h4C8C1moc48ObgIFjeKzqSqXk5xrqkQRh1KWGrYjtJ+C3A==
X-Received: by 2002:a5d:6686:0:b0:354:e72f:d5d7 with SMTP id ffacd0b85a97d-35526c39ef7mr7616953f8f.24.1716880861737;
        Tue, 28 May 2024 00:21:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:2ceb:e04a:af9c:bc9b? ([2a01:e0a:c:37e0:2ceb:e04a:af9c:bc9b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3557a1c931csm10850874f8f.79.2024.05.28.00.21.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 May 2024 00:21:01 -0700 (PDT)
Message-ID: <ead7f060-b6c3-40e7-b00a-b347669d7551@redhat.com>
Date: Tue, 28 May 2024 09:21:00 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: renesas: shmobile: Add drm_panic support
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
References: <292638fde9aef8b00e984245f43dc02a818cf322.1716816827.git.geert+renesas@glider.be>
Content-Language: en-US, fr
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <292638fde9aef8b00e984245f43dc02a818cf322.1716816827.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 27/05/2024 15:34, Geert Uytterhoeven wrote:
> Add support for the drm_panic module, which displays a message on
> the screen when a kernel panic occurs.

Thanks for your patch, I'm pleased that you find drm_panic useful.

That looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
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
>   
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


