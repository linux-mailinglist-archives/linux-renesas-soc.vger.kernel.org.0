Return-Path: <linux-renesas-soc+bounces-6238-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DFF99088D2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2024 11:59:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE9D91C218D6
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2024 09:59:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 156E919149D;
	Fri, 14 Jun 2024 09:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HpBcfFvm"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B046190477
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Jun 2024 09:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718358931; cv=none; b=icvm/5SfNIIL1bW1HUkHruiV58sIKOwgg7RBgwjdeyniz7xfMRZxPbkQmIjA1avRmPBK5BIcGL/uJ3n1VuHj+3rRApqRRb4WBp8DgFr/X/+eMDz/ZfM2gNN2g50etUXJPVNQ3JYUa4rSlSCJ0VNKZodhH7S/AKunzBn7cvPx1O4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718358931; c=relaxed/simple;
	bh=Y76m1yA+rfSm//lWp1WJLp2T9w3wfhXAmzvmAR2QxZM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vAQNMjO0YaJrPyI9eR7o8Q5l/ro2DucMACHjT4k/DdogTB7S+h55X+hlRWBy0aTz9zX4NSNHey67XkDbDuYsahU9X31ou2WwvZ48Qv5ie19nCLmCElxXUaHT5Qlgqga4o0zwjm/gSN47ePT6YLY3nhp/ExKyclS+dQBXhldQ34k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HpBcfFvm; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718358928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Vc9vnEGEoOkbYVmoCf71UsJOzFBKHRz5WSa94wukYEo=;
	b=HpBcfFvm2Ws2Cc8cpi7GZK0cyz5PghnDDYYhIidHEjKF70WllrXgCxGvyGz6us9rph+q3n
	rz/mtw8Gx8MSNVPNQvQPvmAQPcsyL6MR76fdpuRDrLee7mPxPadoOshXljBZ+53WxEfsrs
	Zzc9nc2Bo1GkoKpkGOtNELRK2fFL3q8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-255-4H8PrRN0OlSl4Yvyh3gfIQ-1; Fri, 14 Jun 2024 05:55:24 -0400
X-MC-Unique: 4H8PrRN0OlSl4Yvyh3gfIQ-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4215b0b1c11so15306705e9.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Jun 2024 02:55:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718358923; x=1718963723;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vc9vnEGEoOkbYVmoCf71UsJOzFBKHRz5WSa94wukYEo=;
        b=YQ1LE8t5FH0Z+gL4PfYnLrZfxImn7G6O5KTBexdptNrdizwAtfeiAQUapeAXs87wmc
         kHpKIBw+r7iPY+Bk5ViG8kpSQHykC0US/yGvbIFj9lyFnki+aaw6fue03ChCfceBvbsO
         zlOsre7smKi9xMD75lvmYNYqltdGu4FYqMAk8tXN6GjbuXjP4Yb9/kk8woSmqwsYxRK3
         jQp2U+PVPkFJlJYrcfXjUmim25SJ5WWqu/UN3bnRWI1kfD+S9e0FCGTwsx2D0Na+7SsO
         SWY9Cbz9bPPc4mtQa3j7bVqGP3+9xaI2q6n7ePNranLhY5pzSyHdRoKXuY1HnEpKTLNo
         nuwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOYdaT8V7l1pIrNTAWIEczClWpPy/H0GcZO4QgWNcUOO9rTN8xUdA+6cIXmCTJjClH022jCZP3+NC2+hYQ5z/7eRwmlUMMPfvPY24scMaKzIw=
X-Gm-Message-State: AOJu0Yx5j4N0d+uzSA+lIw64QErCoMTWr6jUAvcuw4fDBWJDHjzta/05
	v6l7LwkzdVQmQxjlTT/FgRc2IMHLCk+ODWc9rCBs+JjHEf3Be2eJ4wk7QUJSV52807rx59FSo5P
	MR848Yo+TruIWrmB8ym4W0TdG4QV2teKnxjW7VxQzvzW8/rx4D9r2coSSMlkms0bWhVG+
X-Received: by 2002:a05:600c:1818:b0:421:4786:eb0c with SMTP id 5b1f17b1804b1-4230485a6acmr21184265e9.33.1718358922923;
        Fri, 14 Jun 2024 02:55:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHP6kV89/gqZPZg3CTIVIOinlEGl8b8uKTyRlBpWHUEfiwgtPulLVmxijVX5LkwDB+k6n+phQ==
X-Received: by 2002:a05:600c:1818:b0:421:4786:eb0c with SMTP id 5b1f17b1804b1-4230485a6acmr21184045e9.33.1718358922546;
        Fri, 14 Jun 2024 02:55:22 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e? ([2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422d0be1424sm59326775e9.12.2024.06.14.02.55.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jun 2024 02:55:22 -0700 (PDT)
Message-ID: <f2c00c97-4d2d-4cb8-aa9b-e9c458ca9e65@redhat.com>
Date: Fri, 14 Jun 2024 11:55:21 +0200
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

Would it be possible to have the logo not in the __init section if 
DRM_PANIC is set ?

The patch looks good to me anyway.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

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
> +
>   /*
>    * Color conversion
>    */
> @@ -452,15 +492,22 @@ static void draw_panic_static_user(struct drm_scanout_buffer *sb)
>   	u32 bg_color = convert_from_xrgb8888(CONFIG_DRM_PANIC_BACKGROUND_COLOR, sb->format->format);
>   	const struct font_desc *font = get_default_font(sb->width, sb->height, NULL, NULL);
>   	struct drm_rect r_screen, r_logo, r_msg;
> +	unsigned int logo_width, logo_height;
>   
>   	if (!font)
>   		return;
>   
>   	r_screen = DRM_RECT_INIT(0, 0, sb->width, sb->height);
>   
> -	r_logo = DRM_RECT_INIT(0, 0,
> -			       get_max_line_len(logo_ascii, logo_ascii_lines) * font->width,
> -			       logo_ascii_lines * font->height);
> +	if (logo_mono) {
> +		logo_width = logo_mono->width;
> +		logo_height = logo_mono->height;
> +	} else {
> +		logo_width = get_max_line_len(logo_ascii, logo_ascii_lines) * font->width;
> +		logo_height = logo_ascii_lines * font->height;
> +	}
> +
> +	r_logo = DRM_RECT_INIT(0, 0, logo_width, logo_height);
>   	r_msg = DRM_RECT_INIT(0, 0,
>   			      min(get_max_line_len(panic_msg, msg_lines) * font->width, sb->width),
>   			      min(msg_lines * font->height, sb->height));
> @@ -471,10 +518,14 @@ static void draw_panic_static_user(struct drm_scanout_buffer *sb)
>   	/* Fill with the background color, and draw text on top */
>   	drm_panic_fill(sb, &r_screen, bg_color);
>   
> -	if ((r_msg.x1 >= drm_rect_width(&r_logo) || r_msg.y1 >= drm_rect_height(&r_logo)) &&
> -	    drm_rect_width(&r_logo) <= sb->width && drm_rect_height(&r_logo) <= sb->height) {
> -		draw_txt_rectangle(sb, font, logo_ascii, logo_ascii_lines, false, &r_logo,
> -				   fg_color);
> +	if ((r_msg.x1 >= logo_width || r_msg.y1 >= logo_height) &&
> +	    logo_width <= sb->width && logo_height <= sb->height) {
> +		if (logo_mono)
> +			drm_panic_blit(sb, &r_logo, logo_mono->data, DIV_ROUND_UP(logo_width, 8),
> +				       fg_color);
> +		else
> +			draw_txt_rectangle(sb, font, logo_ascii, logo_ascii_lines, false, &r_logo,
> +					   fg_color);
>   	}
>   	draw_txt_rectangle(sb, font, panic_msg, msg_lines, true, &r_msg, fg_color);
>   }
> diff --git a/drivers/video/logo/Kconfig b/drivers/video/logo/Kconfig
> index b7d94d1dd1585a84..ce6bb753522d215d 100644
> --- a/drivers/video/logo/Kconfig
> +++ b/drivers/video/logo/Kconfig
> @@ -8,6 +8,8 @@ menuconfig LOGO
>   	depends on FB_CORE || SGI_NEWPORT_CONSOLE
>   	help
>   	  Enable and select frame buffer bootup logos.
> +	  Monochrome logos will also be used by the DRM panic handler, if
> +	  enabled.
>   
>   if LOGO
>   


