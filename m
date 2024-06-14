Return-Path: <linux-renesas-soc+bounces-6209-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B630908794
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2024 11:35:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 537E92862B9
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2024 09:35:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD9931922DD;
	Fri, 14 Jun 2024 09:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UORgpWgv"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3825146D60
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Jun 2024 09:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718357728; cv=none; b=tjk/KRCUivl6WmANdo3vd3G7xnwvlOBuvef+n0Vz5f4jD2zQbT69Nd1q8re6aumFcXbaLj5/03gl+O22DBTnh8H0wy8ImOeoAgLKXXuc002P2d8CAfiDg3K+8eB9PrZm60TgIYeHObnnFCLiWdjtjs3J3rO0QnToSsBX7+0otFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718357728; c=relaxed/simple;
	bh=Xd8AfhR+JUvJQlHghzmVxCjQeM7PevGLqZZUpot3QwM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LfVy4b7hZ4FLeAZCvNDVeiJHPPyitvk1i0aWmvsJyvJgvllMc6R6CitxS511gP0ioybPdWTaMcQLqb11W5DNW58x1HfOFOUcTdrtMT6tjZrq0Ms5TSf5uhIsG0ijIiKDMJXyGOriR6uqxIrBLGT9gfFi3fpdCJaPTh+j7Li7lw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UORgpWgv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718357726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xdJt7+cVLZ5M2lQzrTC0sFKbIvCszz8E/fHGwHxyvpM=;
	b=UORgpWgv79/RFTjVNEYNVqEeXVLDNEwPikUVBfn1ab7ff5fnhdB2tAamYazo+0eB835TQH
	UejUsC7BVQ78dxsf9Nf8zhRQpZVk/6jgKxS4rmXwlgvL14dalBHV8YvSCs6YjJM6eVZTxX
	boix1vCc4r0zD/2UxJspebYnq6luLso=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-458-1OkOkDlfPcCR8Es96hskpQ-1; Fri, 14 Jun 2024 05:35:24 -0400
X-MC-Unique: 1OkOkDlfPcCR8Es96hskpQ-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-421292df2adso12701845e9.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Jun 2024 02:35:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718357723; x=1718962523;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xdJt7+cVLZ5M2lQzrTC0sFKbIvCszz8E/fHGwHxyvpM=;
        b=YwDfGHbyaxPmz3Q5TaLGWGI+Bgp6p5/bzvk13gKKaZArgvmFUYLUcyx08hB9iQMxaa
         hM2ZcOCKNG70w91ISUchmzgQte+nPxGcvwdf4gEgYiiKESQV91Vcl50v2cnIavHkg3Is
         9XWahrE58hGMboRIJHQRKZtLPHc0F/Y2HZAg5YVrl1f8SVjxpJperHbPubkTOoTgrF0A
         Oc/wCz84dQyJ21lkOD5pJhpx0w63HpQ1rrvMWoTXDZH5sh6ZFPRbev6APUz+so4bOLVL
         NumFmDZQO1Nt0lbtJYzDheira92KBhPpDCPY98pZEGCt+0jImQfxPot9ypVwRPqKIY9J
         0itQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrHOiPpqusJF6hDAs2gJb10q1M/VPXefM44jy9tosRlRNWfBeKHzWC3vYj5AAsccvAMMCfY60tJ5kII9nlQhpSUH+CgExLpyO/B+R8vRUhOiY=
X-Gm-Message-State: AOJu0YwUEjuEJaxW6UzRjMb47VuhppXtbae5mvilPNbSY95B9+rrTo+l
	4BfReBntpcfXFJJFDxp59/ZRxuGgbqwyi0jVd5Ark9HVCAbdsjEYKBivXmzBFdTL/kBFDYzSJGt
	SUilKHwZyaMTsmsM9qbrAJJbJ04KGNTVxRh8fyn4gyfMpaLGlHGIu/8oY6UcRKbYet8Z0
X-Received: by 2002:a7b:c41a:0:b0:421:7b9d:5b9b with SMTP id 5b1f17b1804b1-42304821171mr19059105e9.15.1718357723214;
        Fri, 14 Jun 2024 02:35:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGe9EHRho8FXo61eGrPv34AQ567+feP7sbnnVAIN5Dw0SEYP9TPPcNB5desjjcRmD8PIdslsg==
X-Received: by 2002:a7b:c41a:0:b0:421:7b9d:5b9b with SMTP id 5b1f17b1804b1-42304821171mr19058885e9.15.1718357722864;
        Fri, 14 Jun 2024 02:35:22 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e? ([2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36075104c17sm3813405f8f.106.2024.06.14.02.35.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jun 2024 02:35:22 -0700 (PDT)
Message-ID: <d2f7f2c2-242e-4521-a205-8b19999a565b@redhat.com>
Date: Fri, 14 Jun 2024 11:35:21 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] drm/panic: Fix uninitialized
 drm_scanout_buffer.set_pixel() crash
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <cover.1718305355.git.geert+renesas@glider.be>
 <4c250d21880ca0b97e41da7b6a101bdf07e9d015.1718305355.git.geert+renesas@glider.be>
Content-Language: en-US, fr
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <4c250d21880ca0b97e41da7b6a101bdf07e9d015.1718305355.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 13/06/2024 21:17, Geert Uytterhoeven wrote:
> No implementations of drm_plane_helper_funcs.get_scanout_buffer() fill
> in the optional drm_scanout_buffer.set_pixel() member.  Hence the member
> may contain non-zero garbage, causing a crash when deferencing it during
> drm panic.
> 
> Fix this by pre-initializing the drm_scanout_buffer object before
> calling drm_plane_helper_funcs.get_scanout_buffer().

Good catch, I don't know how I didn't hit this bug before.
Thanks for the fix.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Fixes: 24d07f114e4ec760 ("drm/panic: Add a set_pixel() callback to drm_scanout_buffer")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>    - New.
> ---
>   drivers/gpu/drm/drm_panic.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index 293d4dcbc80da7ba..fc04ed4e0b399f55 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -582,7 +582,7 @@ static void draw_panic_dispatch(struct drm_scanout_buffer *sb)
>   
>   static void draw_panic_plane(struct drm_plane *plane)
>   {
> -	struct drm_scanout_buffer sb;
> +	struct drm_scanout_buffer sb = { };
>   	int ret;
>   	unsigned long flags;
>   


