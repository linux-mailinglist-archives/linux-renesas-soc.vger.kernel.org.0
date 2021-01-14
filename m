Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA94F2F676A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Jan 2021 18:23:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727319AbhANRUm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 Jan 2021 12:20:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727278AbhANRUm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Jan 2021 12:20:42 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CA69C061757
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Jan 2021 09:20:01 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id q18so6619980wrn.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Jan 2021 09:20:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DJbxjVn7var5tn3VpXRQHFW70e7JzlJvTaQ/6D9kM2w=;
        b=UgLBzu91mErnuDHKJs9FPr89uRRZTzo+V1QmaGFwSnw3UnK2K9B1jbVrp0WxpBi0Iz
         L3B+/m2bqkqhjb+Y6d9NpgSKoXddFhktBLfKhTwRj8KIq4kBEnMetF9QL0QHVr6JiXFn
         mDdr8j331VBXi0UitN1w37vXjDVtSdhZWlugs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DJbxjVn7var5tn3VpXRQHFW70e7JzlJvTaQ/6D9kM2w=;
        b=VniO5w8Tz8Hp/c57fno7udp96o8aw9W+CG6Ic4X2xoo9KnCLSyAxTQujxj8hYoHJhW
         jpILFaKcEZmMV0ANIsDIXdKjl2mV8QdyUqCsHOWTDdxT79IZiO86I7Wrr6FglvaXpjhV
         Wvy5+JZk+HXsCmQqCIT83QERg2gFg2oCFP6t7ofFpOFg4BlQg/ieImXdqgiICJkoiG1c
         Z2UChve8IN1UL9ZPQtTrDR4ZpmiHqPqay+R6aS9Ag80Dm4wqmfHkAfVntNkYX5D6r+4G
         M7QlF37eVC2/jJMwaYkGm2Yc0eRSYVExMgB017AdXUDKHKy2AXuyJ+MLOBzgmlf1o5Dw
         nSpg==
X-Gm-Message-State: AOAM530g5DDGdXqJS0KDlc5YNp72wvJXGAAJzOjuGvkeqGrrs4Jpff0a
        Hs6yFtmgBbZfCwWuUcphSbHQqw==
X-Google-Smtp-Source: ABdhPJxdULearBSGSGAvpATDOI4FDwr905+i5cFffKJphb+lGHN0mNDV5HrUNJuCrG9xygDc76r9Pw==
X-Received: by 2002:adf:d1cb:: with SMTP id b11mr3297365wrd.118.1610644800457;
        Thu, 14 Jan 2021 09:20:00 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id w189sm9796925wmg.31.2021.01.14.09.19.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 09:19:59 -0800 (PST)
Date:   Thu, 14 Jan 2021 18:19:57 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     kieran.bingham+renesas@ideasonboard.com,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        airlied@linux.ie, daniel@ffwll.ch, eric@anholt.net,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm/cma-helper: Implement mmap as GEM CMA object
 functions
Message-ID: <YAB9PRxbDMfvd2dB@phenom.ffwll.local>
References: <20201123115646.11004-1-tzimmermann@suse.de>
 <20201123115646.11004-3-tzimmermann@suse.de>
 <e297b08d-a7ac-a3c8-abdf-bb89bc6810ce@ideasonboard.com>
 <d6b5376d-05c9-bb43-3071-820d675d921e@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d6b5376d-05c9-bb43-3071-820d675d921e@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jan 14, 2021 at 02:26:41PM +0100, Thomas Zimmermann wrote:
> From d0583fe22cd0cd29749ff679e46e13b58de325cb Mon Sep 17 00:00:00 2001
> From: Thomas Zimmermann <tzimmermann@suse.de>
> Date: Thu, 14 Jan 2021 14:21:51 +0100
> Subject: [PATCH] drm/cma: Set vma ops in mmap function
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/drm_gem_cma_helper.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
> index 7942cf05cd93..0bd192736169 100644
> --- a/drivers/gpu/drm/drm_gem_cma_helper.c
> +++ b/drivers/gpu/drm/drm_gem_cma_helper.c
> @@ -489,6 +489,8 @@ int drm_gem_cma_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
>  	struct drm_gem_cma_object *cma_obj;
>  	int ret;
>  
> +	vma->vm_ops = obj->funcs->vm_ops;

I think this should be done in core, otherwise we have tons of refcount
leaks. I think this was an oversight when we've done that refactoring.

Also drivers can easily overwrite this one if they really have to, but not
assigned this is a clear bug.
-Daniel

> +
>  	/*
>  	 * Clear the VM_PFNMAP flag that was set by drm_gem_mmap(), and set the
>  	 * vm_pgoff (used as a fake buffer offset by DRM) to 0 as we want to map
> -- 
> 2.29.2
> 


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
