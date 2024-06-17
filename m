Return-Path: <linux-renesas-soc+bounces-6333-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 392E490AA7E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2024 12:00:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D48B71F214B0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2024 10:00:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD8A219409A;
	Mon, 17 Jun 2024 09:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gGuXV7tB"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B351940BD
	for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Jun 2024 09:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718618363; cv=none; b=dvA4N0V69ZcCkUH/BetbfkBmEIf8l9Uh+m+8HWuQTLwroNCSdwOJAXYCwcYUgDPQJRbLnppnFaIMUXGwRNBg7PO9p2VWGjLxETpgM2VVvxQcPqyQ/qkFpFE8wAKVRY4hn+LG8MzDKTZNMBfG9vSdLUJtdim6UHy70d3MOS3irD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718618363; c=relaxed/simple;
	bh=VbIPYKS/CCy6yvF5lSG0TqyqnC+E9a0+CKE7OiAcarU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NX/01qHG+kpBsXBqKCyJtTX70N9ly0BbZCosyhJrB+4C3U1tQ1y0ya0D4PnWkhlL97ec5SE9jSXGJvNx6b+83RGYfVxPsmAouSRnAjDxOW/9ifF7CVnMGof03JojGUnbZ1dBF1Sg5bekOzNjAZFrydTF1OCUiS8hhStYA1sAm34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gGuXV7tB; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718618360;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yX4JNpyaAlSNU1cDHop6jeWw0HsLzaAZ7n+6EtzlcEA=;
	b=gGuXV7tBGqrRypnA64UcOaApiV8+rju2BkuuIfpp5O9sPGiN9qRR2P6xhMdiUEmGYkoS8p
	1Cubcn4ld3+h+jKnMxkz2KQtAZm4G+t20Tcdq3A9cG3ZxS6TeXUthOhjhOUhQhSKKuoVML
	DyrLaYOn9gQXFUDmqNwn5f5VlYf2pB8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-47-e6Xk-USmNxWR1gDO6pQ7LQ-1; Mon, 17 Jun 2024 05:59:17 -0400
X-MC-Unique: e6Xk-USmNxWR1gDO6pQ7LQ-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-42135f60020so30195615e9.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 17 Jun 2024 02:59:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718618356; x=1719223156;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yX4JNpyaAlSNU1cDHop6jeWw0HsLzaAZ7n+6EtzlcEA=;
        b=hxSnFda1USlYDciTWiHffRZIe7AF5oeCt2o/9QzGPB/42XToZEaBVoYRM84xRFh+mu
         dXgoL+4t04u8ig2I3Elvh6thZh2hCnpd4Ov0ufnkO6WNOYrld3ouVf7Uev+fqiCPkTGD
         1ImyfU+7FNzwlbmjTsP97/7tf3hZvlGmiy5MggFFEUr1ePbDvwmt12ToXr0XP8o+SwRf
         o5Z9iXbfCkZwXjZaNACwe8MeKEyzOnnV5KvJW7kGdnZm7YJlFFeSztmU7zj599iC03/O
         FTNiT0Z8Dx4VEo7/NIWoIHrXY1LGaJC3zg0rUuZTx9tFu+o23/Wtx9yLqT/V064QYl0L
         8Prw==
X-Forwarded-Encrypted: i=1; AJvYcCUEh57Yv+b5r9GO+YLetkFFgsSdLq8yiBfDCy6nV3GvjkPODjnzzc92zTbSDMb2Mi1a+dPZopIR2mZdBZrE5DVcCVOx/wVo9/DwSS/iYZRdoeA=
X-Gm-Message-State: AOJu0Yz7D98lvtLkAAPnJnYtsr8E/CPTRE+d+t9S3NOQHpAOVhesohD0
	48aDsmKnerIwKPYlDs620J14Tj2KjfqMpHs7jYweurEKcnrCcCSzGxGrFWEmE6AF1WixIGltTKb
	oxqyX8AQGYQkdQgq/3R0NV495B8HGs9ErZ40Lz7uOykJlwWrGW20hJrTEOoZCxCorJuoy
X-Received: by 2002:a5d:5584:0:b0:35f:bb0:729b with SMTP id ffacd0b85a97d-3607a764b67mr5819029f8f.20.1718618356636;
        Mon, 17 Jun 2024 02:59:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGX8uivUHHzMj/MMH0quEEJTduLUPviDY2uBYUm72DV6XXOEOcxZX6Co2ST1EzG16GL2v4EYw==
X-Received: by 2002:a5d:5584:0:b0:35f:bb0:729b with SMTP id ffacd0b85a97d-3607a764b67mr5819011f8f.20.1718618356293;
        Mon, 17 Jun 2024 02:59:16 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e? ([2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-360750f241fsm11601490f8f.88.2024.06.17.02.59.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 02:59:15 -0700 (PDT)
Message-ID: <b20e8ee8-8cdb-464a-aa19-2fe1d39a7440@redhat.com>
Date: Mon, 17 Jun 2024 11:59:15 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] drm/panic: Add support for drawing a monochrome
 graphical logo
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <cover.1718305355.git.geert+renesas@glider.be>
 <3f1a5f56213f3e4584773eb2813e212b2dff6d14.1718305355.git.geert+renesas@glider.be>
Content-Language: en-US, fr
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <3f1a5f56213f3e4584773eb2813e212b2dff6d14.1718305355.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 13/06/2024 21:18, Geert Uytterhoeven wrote:
> Re-use the existing support for boot-up logos to draw a monochrome
> graphical logo in the DRM panic handler.  When no suitable graphical
> logo is available, the code falls back to the ASCII art penguin logo.
> 
> Note that all graphical boot-up logos are freed during late kernel
> initialization, hence a copy must be made for later use.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>    - Rebased,
>    - Inline trivial draw_logo_mono().
> ---
>   drivers/gpu/drm/drm_panic.c | 65 +++++++++++++++++++++++++++++++++----
>   drivers/video/logo/Kconfig  |  2 ++
>   2 files changed, 60 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index f7e22b69bb25d3be..af30f243b2802ad7 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -7,11 +7,15 @@
>    */
>   
>   #include <linux/font.h>
> +#include <linux/init.h>
>   #include <linux/iosys-map.h>
>   #include <linux/kdebug.h>
>   #include <linux/kmsg_dump.h>
> +#include <linux/linux_logo.h>
>   #include <linux/list.h>
> +#include <linux/math.h>
>   #include <linux/module.h>
> +#include <linux/overflow.h>
>   #include <linux/printk.h>
>   #include <linux/types.h>
>   
> @@ -88,6 +92,42 @@ static const struct drm_panic_line logo_ascii[] = {
>   	PANIC_LINE(" \\___)=(___/"),
>   };
>   
> +#ifdef CONFIG_LOGO
> +static const struct linux_logo *logo_mono;
> +
> +static int drm_panic_setup_logo(void)
> +{
> +	const struct linux_logo *logo = fb_find_logo(1);
> +	const unsigned char *logo_data;
> +	struct linux_logo *logo_dup;
> +
> +	if (!logo || logo->type != LINUX_LOGO_MONO)
> +		return 0;
> +
> +	/* The logo is __init, so we must make a copy for later use */
> +	logo_data = kmemdup(logo->data,
> +			    size_mul(DIV_ROUND_UP(logo->width, BITS_PER_BYTE), logo->height),
> +			    GFP_KERNEL);
> +	if (!logo_data)
> +		return -ENOMEM;
> +
> +	logo_dup = kmemdup(logo, sizeof(*logo), GFP_KERNEL);
> +	if (!logo_dup) {
> +		kfree(logo_data);
> +		return -ENOMEM;
> +	}
> +
> +	logo_dup->data = logo_data;
> +	logo_mono = logo_dup;
> +
> +	return 0;
> +}
> +
> +device_initcall(drm_panic_setup_logo);
> +#else
> +#define logo_mono	((const struct linux_logo *)NULL)
> +#endif

I didn't notice that the first time, but the core drm can be built as a 
module.
That means this will leak memory each time the module is removed.

But to solve the circular dependency between drm_kms_helper and 
drm_panic, one solution is to depends on drm core to be built-in.
In this case there won't be a leak.
So depending on how we solve the circular dependency, it can be acceptable.

-- 

Jocelyn


