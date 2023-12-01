Return-Path: <linux-renesas-soc+bounces-489-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0735800610
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Dec 2023 09:42:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9840A281679
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Dec 2023 08:42:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1361A125DE;
	Fri,  1 Dec 2023 08:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TGLupnSe"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BD1E131
	for <linux-renesas-soc@vger.kernel.org>; Fri,  1 Dec 2023 00:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701420155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=r0SUTWfnIuMyMvbVNiUleFZUEEojlqZ62paYlpowE08=;
	b=TGLupnSenHIBx+rHKQkGidbT5mkUWsVj6g4FAfEY1kEUEJxmrQmYPBJDOKRUwYUjXn75qV
	nGWTKAidgKjy5szl0Iftd1g8z9ajtTD/3l1fKPWcXQYnbayDCaq/xArqb9j1sKMw9XmeAu
	BPtbEACiynQ5mBM5aUvzcSt7UrVwhS4=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-252-OnA1oJhoNV-8f1ussr_rsw-1; Fri, 01 Dec 2023 03:42:34 -0500
X-MC-Unique: OnA1oJhoNV-8f1ussr_rsw-1
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-50bda8bf0b4so395048e87.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 01 Dec 2023 00:42:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701420153; x=1702024953;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r0SUTWfnIuMyMvbVNiUleFZUEEojlqZ62paYlpowE08=;
        b=KsHbJRQl370tRXtsPObX5sWaCu37lfxT4bD/QjJE05d6p382/xnJo14JLkUloKVQL6
         8xubQaZ2z/2wiMCAXdh/JFgvTOtoM0PLJUWyRTMi98U/5iMCgk+BFzLf63oOoiI2QACb
         kvrRL17bj0gkVa00ki9YApna8Ei+p3HBu5L9TKtZyUinQe7jfzOuYzQbmdlGJl+xA5V0
         Ys/ibNTnQHr3Lkkt6g6TJb56T/a6SwhHANXvtdeaoPPabM+qij6YFj8bYQx0ex4tsO0u
         dClFJb2ZetigrybJXX5yUCpKuR6Mf8lefTfsRcvtkzsnad/Y4KqUxe7lQyFf4x5u2h0C
         Aofg==
X-Gm-Message-State: AOJu0YyXbeXPkvz7JgbRaK0lVXtACfQ2JnzYgkK+G9BDjXmu3DTc/kna
	sJdyXXls0j7K/5nuk0a36TAF4SfWThltU+24Fnhjo5GyElUceyqY5K66ndi22rmkjRVFAMbwLjn
	4ge/jnWNGd+efLDkVvMXeZy8O1M3pNr8=
X-Received: by 2002:a05:6512:2203:b0:50b:c34f:581e with SMTP id h3-20020a056512220300b0050bc34f581emr616131lfu.62.1701420153231;
        Fri, 01 Dec 2023 00:42:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IENDHPjLiQN61B6qKN5xDZ9Ku0d8jCKVggUUor5+9ZzH4L3f9+qxhGVMI7KzSvI9vjTuqAjlA==
X-Received: by 2002:a05:6512:2203:b0:50b:c34f:581e with SMTP id h3-20020a056512220300b0050bc34f581emr616117lfu.62.1701420152928;
        Fri, 01 Dec 2023 00:42:32 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id b19-20020a05600c4e1300b0040648217f4fsm8339573wmq.39.2023.12.01.00.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 00:42:32 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, daniel@ffwll.ch, airlied@gmail.com,
 suijingfeng@loongson.cn
Cc: laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Thomas Zimmermann
 <tzimmermann@suse.de>
Subject: Re: [PATCH 5/8] drm/solomon: Do not include <drm/drm_plane_helper.h>
In-Reply-To: <20231128104723.20622-6-tzimmermann@suse.de>
References: <20231128104723.20622-1-tzimmermann@suse.de>
 <20231128104723.20622-6-tzimmermann@suse.de>
Date: Fri, 01 Dec 2023 09:42:31 +0100
Message-ID: <871qc6mhzc.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Remove unnecessary include statements for <drm/drm_plane_helper.h>.
> The file contains helpers for non-atomic code and should not be
> required by most drivers. No functional changes.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/solomon/ssd130x.h | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/solomon/ssd130x.h b/drivers/gpu/drm/solomon/ssd130x.h
> index acf7cedf0c1ab..075c5c3ee75ac 100644
> --- a/drivers/gpu/drm/solomon/ssd130x.h
> +++ b/drivers/gpu/drm/solomon/ssd130x.h
> @@ -17,7 +17,6 @@
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_drv.h>
>  #include <drm/drm_encoder.h>
> -#include <drm/drm_plane_helper.h>
>  
>  #include <linux/regmap.h>
>  
> -- 
> 2.43.0
>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


