Return-Path: <linux-renesas-soc+bounces-6211-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2B99087B0
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2024 11:40:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D47D282396
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2024 09:40:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E9661922FC;
	Fri, 14 Jun 2024 09:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VzEudlC7"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAD318413A
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Jun 2024 09:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718358022; cv=none; b=hurVuq5MdF/xCXl32qVrkExPwTpkpiOqOenzT/EinWPGPIzr7NvjwYNQzszMfvhNPsHl0r+7CsjFnsetZBAZjLQ5By9deG0xld+jzu1F1D0i8nPEnmwNQUoOmto9i5AwsrB/zKwZ0vjPCut1HbXD3SamuXrfUWTU/baNcgjKkoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718358022; c=relaxed/simple;
	bh=cUSGw7VhImpZ3HLan+pTkmExdx4glGEn4Q1EnM5Ip0Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fEo1GsQmmDUdIxzG3XhHoNFrJgebi4mYEtLz9KmKX9J0A5kQBQf7oxi89qVVxQszexP2cce2tGLPYOsE8ALeBnsRykpXJUjz0otg0TrOXpwh3gWbvh0sct9atmuffM6vHaFxhLn+oPBVLP8XSiMlJTp3G8TWB6OjOr09Dk2BQwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VzEudlC7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718358020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WQ6vmkLbNkSPu/I9Dwqivb7WpaSBecMeWv8oRqgyEK0=;
	b=VzEudlC7Sc6ffrMl3Ar+y4UQhx4XC/CiTG4N9B6KvlQLQdIb8o1rw3o+ZCNX0+XiWOZFAn
	dwCgvTqXEJxLy8IodNCpFYXf1jEhetC/S12jHF9EdGJe08bzEJeq5LMTSzD4wkwElPG8va
	lu3E24+7/b0vkwprPA9Bl8loSUQ8JBY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-225-Fo0jojdRN-aUpgRJAJOimg-1; Fri, 14 Jun 2024 05:40:19 -0400
X-MC-Unique: Fo0jojdRN-aUpgRJAJOimg-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-42196394b72so13650725e9.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Jun 2024 02:40:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718358018; x=1718962818;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WQ6vmkLbNkSPu/I9Dwqivb7WpaSBecMeWv8oRqgyEK0=;
        b=iE9IcMrL2+nB1COFmUyClb/5LDzULPrXairux62nKJY7AuE3iQ12heSs+4Uf1uBZ6h
         4DYGYabhaDa10cqEHbARtnAaBIEiMiAcYRYAZk+B8LlwX8cQVCyNNiyOd2/w1hvdCpBo
         /me6b5LfkQyFGvPYWAZ1dN6xJ75RtJ7ucjs/tJNOjgsMDe9I/QiG/tJNf91YBH+B1D0C
         hwXgYOxxeZ3PcnYRbCbBvD2ODhBGfpbFTqCq9YeZlWkxs4y+sgJ6oulOpFNRnZskyWVu
         3x/Zzt4baz34DxjmAaOfwF/KYR3riMga1WWeYpQ+WL9BduQYA1gKI+W/2EDi+uF+wMYH
         CzHw==
X-Forwarded-Encrypted: i=1; AJvYcCXA7b6uHNwwBgBs7/WMze6hnKKCJKAoFb4XcekiJPM6GxzOhRfzJ1gOEw9a1KHFCJL4bVJVSbVxUNvGsDGt9b6HKkLjCIB/uMUtaC4Gm54DJmo=
X-Gm-Message-State: AOJu0YxZNQeHtlRXzDkp++AOp0M5t2jgYjuHPRURc2t5chbtYKraHVxN
	x3hpbRVXrXMGlVtIIpRf7hi+19fdW97Pz7ThwL5zkLHF8j6IyeofvFlOWlrnF+/wz8azn2AZAT4
	dkc1c9jBqaYDeK++HKteJkTsS0QUShUx8avb28krauaGbxMV4WX+hSo3JShdi9rdtV53I
X-Received: by 2002:a05:600c:15ca:b0:421:5605:8c92 with SMTP id 5b1f17b1804b1-4230482bd1emr18547815e9.20.1718358017891;
        Fri, 14 Jun 2024 02:40:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFakVoq3MEUrERr87P+t+k5+jmQRc+ZytUh6W0nxxbHQtB6z8XVXp9wq7vZ5Y5GyQYgFyH93w==
X-Received: by 2002:a05:600c:15ca:b0:421:5605:8c92 with SMTP id 5b1f17b1804b1-4230482bd1emr18547655e9.20.1718358017557;
        Fri, 14 Jun 2024 02:40:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e? ([2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36075104a3dsm3876092f8f.112.2024.06.14.02.40.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jun 2024 02:40:17 -0700 (PDT)
Message-ID: <e705b00d-4a05-44b5-8fb2-d18e7389db7a@redhat.com>
Date: Fri, 14 Jun 2024 11:40:16 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] lib/fonts: Fix visiblity of SUN12x22 and TER16x32
 if DRM_PANIC
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <cover.1718305355.git.geert+renesas@glider.be>
 <ac474c6755800e61e18bd5af407c6acb449c5149.1718305355.git.geert+renesas@glider.be>
Content-Language: en-US, fr
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <ac474c6755800e61e18bd5af407c6acb449c5149.1718305355.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 13/06/2024 21:18, Geert Uytterhoeven wrote:
> When CONFIG_FONTS ("Select compiled-in fonts") is not enabled, the user
> should not be asked about any fonts.  However, when CONFIG_DRM_PANIC is
> enabled, the user is still asked about the Sparc console 12x22 and
> Terminus 16x32 fonts.
> 
> Fix this by moving the "|| DRM_PANIC" to where it belongs.
> Split the dependency in two rules to improve readability.

Sorry I think I misunderstood the SPARC && FONTS condition.
Your fix is much clearer, thanks.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Fixes: b94605a3889b9084 ("lib/fonts: Allow to select fonts for drm_panic")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>    - New.
> ---
>   lib/fonts/Kconfig | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/lib/fonts/Kconfig b/lib/fonts/Kconfig
> index befcb463f7381d1a..3ac26bdbc3ff01a3 100644
> --- a/lib/fonts/Kconfig
> +++ b/lib/fonts/Kconfig
> @@ -105,7 +105,8 @@ config FONT_SUN8x16
>   
>   config FONT_SUN12x22
>   	bool "Sparc console 12x22 font (not supported by all drivers)"
> -	depends on (FRAMEBUFFER_CONSOLE && (!SPARC && FONTS || SPARC)) || DRM_PANIC
> +	depends on FRAMEBUFFER_CONSOLE || DRM_PANIC
> +	depends on !SPARC && FONTS
>   	help
>   	  This is the high resolution console font for Sun machines with very
>   	  big letters (like the letters used in the SPARC PROM). If the
> @@ -113,7 +114,8 @@ config FONT_SUN12x22
>   
>   config FONT_TER16x32
>   	bool "Terminus 16x32 font (not supported by all drivers)"
> -	depends on (FRAMEBUFFER_CONSOLE && (!SPARC && FONTS || SPARC)) || DRM_PANIC
> +	depends on FRAMEBUFFER_CONSOLE || DRM_PANIC
> +	depends on !SPARC && FONTS || SPARC
>   	help
>   	  Terminus Font is a clean, fixed width bitmap font, designed
>   	  for long (8 and more hours per day) work with computers.


