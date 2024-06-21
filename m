Return-Path: <linux-renesas-soc+bounces-6596-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FD4911F81
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2024 10:55:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CFC4BB20A88
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Jun 2024 08:55:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F2CE15A49F;
	Fri, 21 Jun 2024 08:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LVXUvnDE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0C6167296
	for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Jun 2024 08:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718960141; cv=none; b=OCm2U0TL3yX4WMJoO0Fdyq+kLqfwwNSLf1KOPmp7fmEiqoTAyg+z+RYrLw2hQ/7dnPtnVMkjsHFUhvrEJ4mFk0Bh4YibioYsrUtEYAT6htPoYggXXOzbCqkoK/vfn29cIwwTBCjidypg6/7t41NJAFq00gbbxBCH/DbaUjHxRnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718960141; c=relaxed/simple;
	bh=Wi27qEs/5e4tSTUEdKvblPt1WEkhqGpsrhlA/n693m4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xiw43enMjLt0aVjReeKJoqQZ0USR6QmF0qm5iuWp9Qf/LIk5unIQ85o80A/M6vTBqJ/xXe8NCYFpLgVNmje9rMuwsLtZ98UOh3DzxhMjZIpNxVB/6Hm+iWNh8Uuk2DtP1r0dkcenKZCD287CoEQc1GrY1O2h/gAKkHGhX2pGE1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LVXUvnDE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718960138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HZxfbjVDFLZ8q4+IcR6ygghLj1wY/E9B1wkW/5ajlvI=;
	b=LVXUvnDECsrJU1ihoBlKcZ7aw+OLY6PxEP++R4y7b9cGvLeJSJY97xtV/x8AakhhSkKNdO
	jm7fMM0CscsxXsiBPQszCY+i+vhzWvGnmlIJEjVozvD7wQu7mssQnE7ThOubuzoVmt7In2
	xma/AVfFhV2sLALsm+BELP2wFGMPD4M=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-104-djtU7ZFJNiuBCV880pYbfA-1; Fri, 21 Jun 2024 04:55:35 -0400
X-MC-Unique: djtU7ZFJNiuBCV880pYbfA-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-421bb51d73cso9679565e9.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Jun 2024 01:55:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718960134; x=1719564934;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HZxfbjVDFLZ8q4+IcR6ygghLj1wY/E9B1wkW/5ajlvI=;
        b=UwUut8PS6iwGDDmWbMTd4Y0MmuAROnsOCHDCiF+UROOeYFAVCo+8/6WIrw05jXYXJm
         o+7q5mJpdJLjSiq/GogW+upSUnfygecQg6ApaqpJ0S8OVXKoX6/rNHs6EZkkRLrcr5Zj
         V5f6EqyWKVzP9VXReL1oNRaopDXhJ1rkRdlO/txUYTw2XI0IYOZNoRRI6X/dvQjOcAEx
         LLRZZAbZHfufHa7+yDWtot3lQ7bBZDr2jo4u5cReQor1ZZwIrZYZDhkLS0J5ZZ8cAgDT
         SsNC4rNMbPncusED/HEXXhSmhqWW8gjHbTn1zVBSgTO+5hEi4jm4AEGil+iO8u33xjB8
         mphg==
X-Forwarded-Encrypted: i=1; AJvYcCV/CiQYZvAiSjLRC18seIXEjwbAV1166zlNXcMUs2rATH7MTJ6oRp9i2EV3a7P8zOuVlbM4Ld6ulhJIQH98cJe3dZ7TjADoMpbyD8v98SIXrMM=
X-Gm-Message-State: AOJu0Yy13tsnoVy5unO2btlxJAxO9FQtExtOqN3dLdHw8sMG16MQr+As
	dL5MsQ2DOY54H4QlgucXEz3CUvxtN8VDXJ1syigq7T5747K29cs12K23WK2ck1EFTwtpcil5peN
	3t8rjFeyWdXezOrV1yWvv6IpMZt1rwGWvTRw0kte8WwtRpC4Zup3sIeVLH+iEj+Y5FV/v
X-Received: by 2002:a05:600c:3b96:b0:421:3b74:9c02 with SMTP id 5b1f17b1804b1-424752ac00fmr57877705e9.41.1718960133947;
        Fri, 21 Jun 2024 01:55:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkCronDs3rd4uDL011azLUJoQX0z7Z/tK6nKcBDkViAJOlmHlF1yWy1e0FG6LHPQxZY7mBOA==
X-Received: by 2002:a05:600c:3b96:b0:421:3b74:9c02 with SMTP id 5b1f17b1804b1-424752ac00fmr57877585e9.41.1718960133568;
        Fri, 21 Jun 2024 01:55:33 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e? ([2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d0b6402sm54371555e9.10.2024.06.21.01.55.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jun 2024 01:55:33 -0700 (PDT)
Message-ID: <b4caed34-bed4-4b72-9bb0-353ef63fe867@redhat.com>
Date: Fri, 21 Jun 2024 10:55:32 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] drm/panic: Fixes and graphical logo
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <cover.1718305355.git.geert+renesas@glider.be>
Content-Language: en-US, fr
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <cover.1718305355.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I want to push at least the first patch that is an important fix.
But if there are no objections, I can push the whole series except patch 
5 "drm/panic: Convert to drm_fb_clip_offset()" which causes some build 
issue.

Best regards,

-- 

Jocelyn

On 13/06/2024 21:17, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> If drm/panic is enabled, a user-friendly message is shown on screen when
> a kernel panic occurs, together with an ASCII art penguin logo.
> Of course we can do better ;-)
> Hence this patch series extends drm/panic to draw the monochrome
> graphical boot logo, when available, preceded by the customary fixes.
> 
> Changes compared to v1:
>    - Rebase against today's drm-misc-next, where drm_panic is broken on
>      all current drivers due to an uninitialized pointer dereference.
>      Presumably this was only tested with an out-of-tree driver change?
>    - New fixes [1/7], [3/7], and [4/7],
>    - New cleanup [5/7],
>    - Inline trivial draw_logo_mono().
> 
> This has been tested with rcar-du.
> 
> Thanks for your comments!
> 
> Geert Uytterhoeven (7):
>    drm/panic: Fix uninitialized drm_scanout_buffer.set_pixel() crash
>    drm/panic: Fix off-by-one logo size checks
>    lib/fonts: Fix visiblity of SUN12x22 and TER16x32 if DRM_PANIC
>    drm/panic: Spelling s/formater/formatter/
>    drm/panic: Convert to drm_fb_clip_offset()
>    drm/panic: Rename logo to logo_ascii
>    drm/panic: Add support for drawing a monochrome graphical logo
> 
>   drivers/gpu/drm/Kconfig     |  2 +-
>   drivers/gpu/drm/drm_panic.c | 74 +++++++++++++++++++++++++++++++------
>   drivers/video/logo/Kconfig  |  2 +
>   lib/fonts/Kconfig           |  6 ++-
>   4 files changed, 70 insertions(+), 14 deletions(-)
> 


