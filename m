Return-Path: <linux-renesas-soc+bounces-5688-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 125928D46DA
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 May 2024 10:16:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3567B1C20C67
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 May 2024 08:16:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69AA81482F6;
	Thu, 30 May 2024 08:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aNwEijX0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B986717753
	for <linux-renesas-soc@vger.kernel.org>; Thu, 30 May 2024 08:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717056978; cv=none; b=nu1XeHq46eysii7FUzuTlsNBmvZxAuqC56UqmbeeGAfq3mP3gwiZA359SnbIC9cO/7aijUg2tNTYU0i7DaFY40X4zFf4KKM5MXSMZrfHFk18xCwWoGPB7+iYRoXTL+bIOen0YK8sOav2Qu572IN4HW3afEDH4EOfp8TBwiH1VIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717056978; c=relaxed/simple;
	bh=X8g0Q3CTaOMt21uNUeLBD3wVmMtGlOOS7LmIByWpwiE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TgLSwYE9a2/4UcG9XsbzAgm66rdawZzL8k9BWuv4pg5szZfJhkR+YNtw39C+GM0J5SxqNhUlupusSmPKKKfbcF9zGLvhqhbj+5tCpU7N1+J9Da4bC8BIGTSUYkwl7kvnD3uZDGy+v0aQgwhv2mEfXyFvWaeh1aJhsqKwpRuoY3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aNwEijX0; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717056975;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4vOO2zUgoUpebiF0jkqV2Z5E5GhV9cME85XnjwVlc5U=;
	b=aNwEijX0mDmDPGJtu6nnrqVO3YOPXZmx3w82pRYqg+NXqKFO0IGQ6jrM0ezfp/aRknGqfv
	gRRqP+0xga0w9MPyCT28St2LePUS2E9jlktVgJ+xpsVUIMviNbYaoKKOCktn4gCeUJl0Ak
	2Q8qDcs9evSeWJ4nfVqG0hrOXVhFkEQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-279-B1j6B-hOMvqZEC0uAc1hNg-1; Thu, 30 May 2024 04:16:12 -0400
X-MC-Unique: B1j6B-hOMvqZEC0uAc1hNg-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-42113d7adafso6290265e9.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 May 2024 01:16:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717056971; x=1717661771;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4vOO2zUgoUpebiF0jkqV2Z5E5GhV9cME85XnjwVlc5U=;
        b=WleuwQ5MloTtcWMXFd+YrY7BpQmZlTUW7i4OtXnObHHXa8kJjv0PD4x3usgkgiuWoY
         4aLYoLSU91pFsEnCxNiqk65FML0FtPcYPN+oWqgUC/Ev75tV32EaYXMtJAm3T+icJAAK
         3CaXFtXhIMqQ43qLo8BAsqnylh+AwYlt3bfnmS/hYwE3S+6atIntzm062xcIy58TnTNZ
         3zudmd5CdwAmvcONO0dFHepHGti3pLkufKgbtXZwWcrPvqRH3Qml5b+0AQq3fm4wSSD9
         sHKD3+l1qyhPlG0aeZGwlTRNnODYpBKWPrG7Fzf5u6TXQFllVbOHEJ9JzsxIAFNz9ZjW
         nkpw==
X-Forwarded-Encrypted: i=1; AJvYcCV6JVPsZjXVF5u0XS797TVPGPVK0jOntf1NVhNXNVrOUER4vtskGgTG0uh9Qekc3QfQ5IMJmpYMCFRC0DlDos2unR4yNzf57o2kLEfVkJm5dcM=
X-Gm-Message-State: AOJu0YyzjtRrqwPU3dc7opBqAbpHx3R68FSLiJNziS+0gJmnhiBjhkRY
	FHEQ24W3J50Lgbb503p1aeHgb48wJ8nkFkcvkuPvZ+eRFC39pPLAB2QkJxLuvT8RYeMnert++Hl
	4c+FDNfdL+6FhJYVNj6fkNk1EO3Skg9lQJXpyP8AfT9KKbExp6+2HwRncdh1BNq6lste+
X-Received: by 2002:a05:600c:3555:b0:41b:edf4:4071 with SMTP id 5b1f17b1804b1-42127928149mr17474255e9.35.1717056971196;
        Thu, 30 May 2024 01:16:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAr8v5wJMUdSt135qGEBduUrrTWYk6Wh2xc/V4SzrdIQg7Mb450fAmFs3OhYx7PxE9yWAuYg==
X-Received: by 2002:a05:600c:3555:b0:41b:edf4:4071 with SMTP id 5b1f17b1804b1-42127928149mr17474045e9.35.1717056970775;
        Thu, 30 May 2024 01:16:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:2ceb:e04a:af9c:bc9b? ([2a01:e0a:c:37e0:2ceb:e04a:af9c:bc9b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42127056cc2sm17697845e9.2.2024.05.30.01.16.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 01:16:10 -0700 (PDT)
Message-ID: <e1cc6c86-d042-400c-b995-a8b78f62dbdd@redhat.com>
Date: Thu, 30 May 2024 10:16:09 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: renesas: shmobile: Add drm_panic support
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
References: <292638fde9aef8b00e984245f43dc02a818cf322.1716816827.git.geert+renesas@glider.be>
 <20240529010320.GI1436@pendragon.ideasonboard.com>
 <u5aijnvotestpgjynawcx7oxsp2lncnsda5w4jfzeovvdlfcyt@5fxnyfbk4ocb>
 <20240529091018.GK1436@pendragon.ideasonboard.com>
 <zyd7e55dfonmacewfscac5sdrypx5rsjwvkt7umhbnjltd3rz4@wabvqnsrlatl>
 <20240529095506.GC19014@pendragon.ideasonboard.com>
 <ikryifdxh5hfbjl6c4yinyy52f2pr4pm4g4564jq4cob7ics2p@wa37stxn3sqm>
 <20240529133309.GO1436@pendragon.ideasonboard.com>
Content-Language: en-US, fr
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20240529133309.GO1436@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 29/05/2024 15:33, Laurent Pinchart wrote:
> On Wed, May 29, 2024 at 04:28:44PM +0300, Dmitry Baryshkov wrote:
>> On Wed, May 29, 2024 at 12:55:06PM +0300, Laurent Pinchart wrote:
>>> On Wed, May 29, 2024 at 12:25:56PM +0300, Dmitry Baryshkov wrote:
>>>> On Wed, May 29, 2024 at 12:10:18PM +0300, Laurent Pinchart wrote:
>>>>> Hi Dmitry,
>>>>>
>>>>> On Wed, May 29, 2024 at 11:27:02AM +0300, Dmitry Baryshkov wrote:
>>>>>> On Wed, May 29, 2024 at 04:03:20AM +0300, Laurent Pinchart wrote:
>>>>>>> On Mon, May 27, 2024 at 03:34:48PM +0200, Geert Uytterhoeven wrote:
>>>>>>>> Add support for the drm_panic module, which displays a message on
>>>>>>>> the screen when a kernel panic occurs.
>>>>>>>>
>>>>>>>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>>>>>>> ---
>>>>>>>> Tested on Armadillo-800-EVA.
>>>>>>>> ---
>>>>>>>>   drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c | 14 +++++++++++++-
>>>>>>>>   1 file changed, 13 insertions(+), 1 deletion(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
>>>>>>>> index 07ad17d24294d5e6..9d166ab2af8bd231 100644
>>>>>>>> --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
>>>>>>>> +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
>>>>>>>> @@ -273,6 +273,13 @@ static const struct drm_plane_helper_funcs shmob_drm_plane_helper_funcs = {
>>>>>>>>   	.atomic_disable = shmob_drm_plane_atomic_disable,
>>>>>>>>   };
>>>>>>>>   
>>>>>>>> +static const struct drm_plane_helper_funcs shmob_drm_primary_plane_helper_funcs = {
>>>>>>>> +	.atomic_check = shmob_drm_plane_atomic_check,
>>>>>>>> +	.atomic_update = shmob_drm_plane_atomic_update,
>>>>>>>> +	.atomic_disable = shmob_drm_plane_atomic_disable,
>>>>>>>> +	.get_scanout_buffer = drm_fb_dma_get_scanout_buffer,
>>>>>>>> +};
>>>>>>>> +
>>>>>>>>   static const struct drm_plane_funcs shmob_drm_plane_funcs = {
>>>>>>>>   	.update_plane = drm_atomic_helper_update_plane,
>>>>>>>>   	.disable_plane = drm_atomic_helper_disable_plane,
>>>>>>>> @@ -310,7 +317,12 @@ struct drm_plane *shmob_drm_plane_create(struct shmob_drm_device *sdev,
>>>>>>>>   
>>>>>>>>   	splane->index = index;
>>>>>>>>   
>>>>>>>> -	drm_plane_helper_add(&splane->base, &shmob_drm_plane_helper_funcs);
>>>>>>>> +	if (type == DRM_PLANE_TYPE_PRIMARY)
>>>>>>>> +		drm_plane_helper_add(&splane->base,
>>>>>>>> +				     &shmob_drm_primary_plane_helper_funcs);
>>>>>>>> +	else
>>>>>>>> +		drm_plane_helper_add(&splane->base,
>>>>>>>> +				     &shmob_drm_plane_helper_funcs);
>>>>>>>
>>>>>>> It's not very nice to have to provide different operations for the
>>>>>>> primary and overlay planes. The documentation of
>>>>>>> drm_fb_dma_get_scanout_buffer() states
>>>>>>>
>>>>>>>   * @plane: DRM primary plane
>>>>>>>
>>>>>>> If the intent is that only primary planes will be used to display the
>>>>>>> panic message, shouldn't drm_panic_register() skip overlay planes ? It
>>>>>>> would simplify drivers.
>>>>>>
>>>>>> What about the drivers where all the planes are actually universal?
>>>>>> In such a case the planes registered as primary can easily get replaced
>>>>>> by 'overlay' planes.
>>>>>
>>>>> Good point.
>>>>>
>>>>> Another option, if we wanted to avoid duplicating the drm_plane_funcs,
>>>>> would be to add a field to drm_plane to indicate whether the plane is
>>>>> suitable for drm_panic.
>>>>
>>>> ... or maybe let the driver decide. For the fully-universal-plane
>>>> devices we probably want to select the planes which cover the largest
>>>> part of the CRTC.
>>>
>>> Are there devices where certain planes can only cover a subset of the
>>> CRTC (apart from planes meant for cursors) ?
>>
>> On contemporary MSM devices any plane can cover any part of the screen,
>> including not having a plane that covers the full screen at all.
> 
> Ah, you meant picking the plane that is currently covering most of the
> screen. I thought you were talking about devices where some planes were
> restricted by the hardware to a subset of the CRTC.
> 
> I agree it would make sense to take both plane position and z-pos, as
> well as visibility and other related parameters, to pick the plane that
> is the most visible. Ideally this should be handled in drm_panic, not
> duplicated in drivers.

I'm not sure that drm_panic can figure out reliably on which plane it 
needs to draw. I think the driver has more information to take the right 
decision.
Also if you prefer, you can add the get_scanout_buffer() callback for 
all planes (to use the same helper fops), and then filter out in the 
callback for planes that are not suitable. I just find it cleaner to not 
register planes that the driver knows they will never be suitable (like 
cursor planes).

static void shmob_atomic_helper_get_scanout_buffer(struct drm_plane 
*plane, struct drm_scanout_buffer *sb))
{
	if (plane->type == DRM_PLANE_TYPE_PRIMARY)
		return drm_fb_dma_get_scanout_buffer(plane, sb);
	return -EOPNOTSUPP;
}

.get_scanout_buffer = shmob_atomic_helper_get_scanout_buffer,


-- 

Jocelyn

> 
>>> I think that what would matter the most in the end is selecting the
>>> plane that is on top of the stack, and that doesn't seem to be addressed
>>> by the drm_panic infrastructure. This is getting out of scope for this
>>> patch though :-)
>>>
>>>>> I don't think this patch should be blocked just for this reason, but I'm
>>>>> a bit bothered by duplicating the ops structure to indicate drm_panic
>>>>> support.
>>>>>
>>>>>>>>   
>>>>>>>>   	return &splane->base;
>>>>>>>>   }
> 


