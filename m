Return-Path: <linux-renesas-soc+bounces-6210-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4112690879E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2024 11:36:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF3CC282296
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2024 09:36:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B77F186282;
	Fri, 14 Jun 2024 09:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AIWNyXo6"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01CD192B66
	for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Jun 2024 09:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718357797; cv=none; b=V0Acpsx4HbD5IipXfmadTWAhZYx1FbsZ3/9hO0oM1fy5b4QxQ7XD5XBcyW17VfnCoqrdCAyxNUah6oKdcwqR/MhBCVxF6Yes2BsRgM135hV2yM4GTHiPaJti23tk63dVZM+Vy4LI5tWQY6qGn66eMk3M5MZoB3MaGuDnXUM1E4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718357797; c=relaxed/simple;
	bh=3Xp4hft43r0s80HHbt2Bg6bC+vwJU8fQ6blHSl4LPdI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hAJdJe3Bx2BQmW+iRAyUi7OdzzEjCibAu3aT7v+F1QdBTEC5/6sNDbW5t7Cmw1IglAd+zKz00LzwCoiOtFIoCU9SAaE1cHriJ88Nh6vSaLHOYK3P/uivFrKiB+sS/KPKpcATEpdpKIbC+QANXtpIhe98XPzvMDHRZ0ifrrM+7Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AIWNyXo6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718357794;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KdfeWtRDAuWsZ8j9bLApAvsSD5oNrsJwjHXB/7FcSzc=;
	b=AIWNyXo6nge7cCB37dZMGV8wBU/vwDJl2RceE7/hcR80Jbhl/eSxG+xtuxJKNeWN5h1X5K
	Q7QOMySV4EuEMOC6rhn9a7s8ZIJPoLoxv6qjy7W1qGhwybfHDENKGc1Li20f3pVAPDptRn
	Z1NlokKVAz4xXSSHqgdPNGRgLHNhggU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-8gTbaXu0P2GiAuSlLh-fmg-1; Fri, 14 Jun 2024 05:36:29 -0400
X-MC-Unique: 8gTbaXu0P2GiAuSlLh-fmg-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4218447b900so10616315e9.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Jun 2024 02:36:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718357788; x=1718962588;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KdfeWtRDAuWsZ8j9bLApAvsSD5oNrsJwjHXB/7FcSzc=;
        b=k4/ozc7aQrlpR8VX7D5FGyw+Lno9LlXg+/C2+Xhg4KnBNmtxmFuBLvitP6foUwKZZU
         xQA6EIYMRiOGh2ReGwWkSFmpjRRu+wkNmEba9p38gMlrMp2ZJtXlJuI4B+lwoKggRfu/
         pvS7cdD7gzjknIYL531dofH+J9dlbhgFCQyweSKC9A9YZ623d4jEIjnwLxSqveuTfSFy
         Gb1bsWKs7WDV4ggqebJYpjDc2OY05WkQPAtSyAOePVqo4swR+6+/1+oyImgcot18ngoU
         UQDkpmgHH1dNNNa7teeOn7mJaNMqyg2hkGrueZ2+IHhASFdTcjp4whhtekYQn/ypJMoo
         onqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEdtutgD5XctPsVRe5Y++7Zz9/whI5wNogID9WPwu3zP7mXqhDeWuIwl/xLqtZtQf4yXstrfs3Yt1lMnDocjzlYbEb6mcMUDLDbcASVeKlbEU=
X-Gm-Message-State: AOJu0YzYKAQK42ZyM0J2ib8LKOa3shpX+gXE1CL31z3XExgr6oxo7g54
	pk75TGAcUJE+LMBbH/CyLber1c9AbBGcduS1sSFbUMT03x/XfcMdIueZFES1V6q9xyuahksMTPA
	d/XP3UidrvMPvWhK+NuRbY1t2BfGtcV3VYpJvFr8Ah7q0JaCo1hBTqQLTI06Ar6fIjmX7
X-Received: by 2002:a05:600c:4a9f:b0:422:eee2:572c with SMTP id 5b1f17b1804b1-422eee257d9mr40054965e9.8.1718357788197;
        Fri, 14 Jun 2024 02:36:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjxUAkrfgiqF4B9IILJq7eNGszyZUh3YENf1nv29/SYoE7i85RFm0GdV/Ed29jYVD8fE7b5g==
X-Received: by 2002:a05:600c:4a9f:b0:422:eee2:572c with SMTP id 5b1f17b1804b1-422eee257d9mr40054755e9.8.1718357787860;
        Fri, 14 Jun 2024 02:36:27 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e? ([2a01:e0a:c:37e0:38da:a7d9:7cc9:db3e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422f641a65bsm53388225e9.42.2024.06.14.02.36.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jun 2024 02:36:27 -0700 (PDT)
Message-ID: <a60c6382-2c41-49aa-8f79-ee9744f12b4b@redhat.com>
Date: Fri, 14 Jun 2024 11:36:26 +0200
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] drm/panic: Fix off-by-one logo size checks
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <cover.1718305355.git.geert+renesas@glider.be>
 <1c9d02463cef3eac22cfac3ac6d1adad369f367b.1718305355.git.geert+renesas@glider.be>
Content-Language: en-US, fr
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <1c9d02463cef3eac22cfac3ac6d1adad369f367b.1718305355.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 13/06/2024 21:18, Geert Uytterhoeven wrote:
> Logos that are either just as wide or just as high as the display work
> fine.

Sure, that looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Fixes: bf9fb17c6672868d ("drm/panic: Add a drm panic handler")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>    - Rebased.
> ---
>   drivers/gpu/drm/drm_panic.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index fc04ed4e0b399f55..814ef5c20c08ee42 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -472,7 +472,7 @@ static void draw_panic_static_user(struct drm_scanout_buffer *sb)
>   	drm_panic_fill(sb, &r_screen, bg_color);
>   
>   	if ((r_msg.x1 >= drm_rect_width(&r_logo) || r_msg.y1 >= drm_rect_height(&r_logo)) &&
> -	    drm_rect_width(&r_logo) < sb->width && drm_rect_height(&r_logo) < sb->height) {
> +	    drm_rect_width(&r_logo) <= sb->width && drm_rect_height(&r_logo) <= sb->height) {
>   		draw_txt_rectangle(sb, font, logo, logo_lines, false, &r_logo, fg_color);
>   	}
>   	draw_txt_rectangle(sb, font, panic_msg, msg_lines, true, &r_msg, fg_color);


