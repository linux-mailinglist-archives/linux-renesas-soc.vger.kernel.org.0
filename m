Return-Path: <linux-renesas-soc+bounces-6213-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8989087E2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2024 11:46:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A3DD8B20F1A
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2024 09:46:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C239F192B91;
	Fri, 14 Jun 2024 09:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="f11ELEnm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4524919309D
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Jun 2024 09:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718358289; cv=none; b=RJFmHAdJWqD1g69Fh7En1CdTQK877oJFG9g8cTEB6O8n6o3PYZO/GAIXjvtbtJPxlMt8puCSeW8jXUyydRuwyxM5bFwXYpcT1Lc7pyDlXstPyb9mJkMO2G7tr/oUE1AkinYoiUa6Paj8CgRKa3Ce4Uq0cZhzyBHLbU3a9KWbBsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718358289; c=relaxed/simple;
	bh=g/f72YAwlJRl5+TqCMfPxZhhoWQoVckQUyPxOW4TmSw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YoepN+sIfHp40trjuJtu5Z9iKkiJRTnj9G5wwOofGAe0iyYK1L55qdOBuYg9JidAlNyp2viCupF1OfW7Luk0SvWT6lDjX1uuaiRQqJriecub90apkDQV+6cSdQyA9R8rgEuvpKsiz7Rv+yt5q/XTCpIQg6u+jg+ZOEdOG0kp5Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=f11ELEnm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718358287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CshieQQIH4mKg/EiA3AsDpWQdSbrKh64nojN+WE88yY=;
	b=f11ELEnmzV95AFZU+57NvnkIOT2uJXNgKQUo9vfErlZ2Pk7HBcdVMEuE+BbrZwoaxF6rjk
	wpuDXSAHVbclx35CDTOSitq2x4RDkFskDsUX1FWCBtswhnFL8q25CqnsOgfRHWouhqzsZo
	9mv3DEmEaCoKwgI4OsoMSXbrD4qEGpo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-690-TWZfZ_e6MWK_y7_q5B4cBA-1; Fri, 14 Jun 2024 05:44:43 -0400
X-MC-Unique: TWZfZ_e6MWK_y7_q5B4cBA-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-42135f60020so15502415e9.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Jun 2024 02:44:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718358282; x=1718963082;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CshieQQIH4mKg/EiA3AsDpWQdSbrKh64nojN+WE88yY=;
        b=WoldPf+eBvfDF/Sl1+EuNoM4X1G7JuoAodHIRfXDjvokmxbL8Xsm/+Xn/WHCE9OsLE
         dA+v4nMxXwB5hcZ6GixVqemE1jMV2/KjhGpGrXhNLv/FdDmRjPoALdU6SoInOj0VhQsg
         oURsdh0He3YXJFewJUis5H8gQeIicYuWeGMtSeGOI7xPLfn3e1aSC6JsEzgE3z1pBavN
         qFIOCOtFgcAMrTpGRtbM1AtwuqBumxj3OVGccozgT9vhSgC9ZYnlBS//699CQqtn0GYi
         DnEu4sV9drHsxNgPDk5MrUyib504rWlPkFEN+eqjOJDUsj88KCf4vXO/mJdYO8SojQGB
         83gA==
X-Forwarded-Encrypted: i=1; AJvYcCVgDgzonhz9MjDm0eJ/xMQlWhWNL5iluXdeHyJ9Iauh+iIDdgDoaJE2WpOOrACbbNoFIc726GFKJ64tDcD+caTR9lpO32tH7M3djj3SvI/uH+o=
X-Gm-Message-State: AOJu0Yyhqxyapxsmn9Y/Dbfg/ji9pmPd/4o+WpormSAHr3jmE80rylNO
	/s7VfkRb4Oajb8gStw6I6uN1ESelEA///NfpLY9okUxlv9+v+sFX+xNljS5CyircNaCyAiR0Bcq
	AUH1LeJe8n8WBGbjZvWYbShl8+tpQr5vnqjugLICt7q4JxyG691S39c0bLSbOHPqXRV5X
X-Received: by 2002:a05:600c:4e52:b0:421:7296:ba3f with SMTP id 5b1f17b1804b1-423048309d5mr22183365e9.22.1718358282301;
        Fri, 14 Jun 2024 02:44:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHol7Fxpqc45AcQb9iiSor1fKX+OLVhNrRP3nOxOGjpSELqoTURxJjSrSWvYixqw/xO488Sfw==
X-Received: by 2002:a05:600c:4e52:b0:421:7296:ba3f with SMTP id 5b1f17b1804b1-423048309d5mr22183125e9.22.1718358281948;
        Fri, 14 Jun 2024 02:44:41 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e? ([2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422f602e802sm53742615e9.11.2024.06.14.02.44.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jun 2024 02:44:41 -0700 (PDT)
Message-ID: <16ded77c-a506-4672-ab74-ca1a7aaf21aa@redhat.com>
Date: Fri, 14 Jun 2024 11:44:40 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] drm/panic: Convert to drm_fb_clip_offset()
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <cover.1718305355.git.geert+renesas@glider.be>
 <3121082eb4beb461773ebb6f656ed9b4286967ee.1718305355.git.geert+renesas@glider.be>
Content-Language: en-US, fr
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <3121082eb4beb461773ebb6f656ed9b4286967ee.1718305355.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 13/06/2024 21:18, Geert Uytterhoeven wrote:
> Use the drm_fb_clip_offset() helper instead of open-coding the same
> operation.

Thanks, it's a nice cleanup.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> DRM_PANIC already selects DRM_KMS_HELPER.
> 
> v2:
>    - New.
> ---
>   drivers/gpu/drm/drm_panic.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index 814ef5c20c08ee42..5b0acf8c86e402a8 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -285,7 +285,7 @@ static void drm_panic_blit(struct drm_scanout_buffer *sb, struct drm_rect *clip,
>   		return drm_panic_blit_pixel(sb, clip, sbuf8, spitch, fg_color);
>   
>   	map = sb->map[0];
> -	iosys_map_incr(&map, clip->y1 * sb->pitch[0] + clip->x1 * sb->format->cpp[0]);
> +	iosys_map_incr(&map, drm_fb_clip_offset(sb->pitch[0], sb->format, clip));
>   
>   	switch (sb->format->cpp[0]) {
>   	case 2:
> @@ -373,7 +373,7 @@ static void drm_panic_fill(struct drm_scanout_buffer *sb, struct drm_rect *clip,
>   		return drm_panic_fill_pixel(sb, clip, color);
>   
>   	map = sb->map[0];
> -	iosys_map_incr(&map, clip->y1 * sb->pitch[0] + clip->x1 * sb->format->cpp[0]);
> +	iosys_map_incr(&map, drm_fb_clip_offset(sb->pitch[0], sb->format, clip));
>   
>   	switch (sb->format->cpp[0]) {
>   	case 2:


