Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42E614A202
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jun 2019 15:22:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726023AbfFRNV7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Jun 2019 09:21:59 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:34314 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725919AbfFRNV7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 09:21:59 -0400
Received: by mail-ed1-f65.google.com with SMTP id s49so21781154edb.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Jun 2019 06:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=gPxHPlcPBpNmsxraB6zwaHf7lilECwsy9olDlPYn2GE=;
        b=MwgFvwzeufOEXf7Klj4gLJ53sRFaqfMEtTpeEbB5Hy+dz4nuD2yZzsxZlUDtfWFfn1
         b2SpwK0KF6L9P2FujH4IsHZSzel04d8nCObWVlQl1nYkOBXeEXAcloC8iNiOxDoVpse9
         gkum8aCvbOQAWnw9m+GNHV549io7hFn5+XFnU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=gPxHPlcPBpNmsxraB6zwaHf7lilECwsy9olDlPYn2GE=;
        b=h+ZhprPHpdfVUwvR+JcrsWeUwRftHXtL70Lxu0CUULIhp8Eu2eTRxZSnyNkGD4eGDF
         +ExdIKO2QGC2BBH8HI4LfHnrJAIhkoLcoz3m20Eb7tyQU6yySHTeVK6MweYpgCqWtWl+
         LXUQUUx9a8cIT9gRMzZFOKstziXeH4n15mlg5mhphajlyb1GBTDxrS7kZmpyHn5YDxMr
         0EjCLoRyVkTix+aA6UUfH+DA1qaTLGQQruHlv8hWvfYIUdTwJWNznIGAcBMgLrIfFfgk
         aAF2yFkojwIa2ugU/AGOv6k1mlk3kHZUx9BXRbDBgwit3M3N27TDYEu4qtqkOZC9C9Nd
         TX/Q==
X-Gm-Message-State: APjAAAX3VcHlSZ/XNiC3lNBwDIsIf00VG3aza65k5rm8jUxtKbWTcymy
        OCik1DqDFAsYhIyl7hXHmaRgwbzwOBA=
X-Google-Smtp-Source: APXvYqz5xh0Ks+/le9Qy+t4yCWlWexol0YmMW1dbV2XBjweGTWy3hGYi07Gf0FlO9P3UPMtZksFFiA==
X-Received: by 2002:a50:b617:: with SMTP id b23mr56523354ede.135.1560864117949;
        Tue, 18 Jun 2019 06:21:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
        by smtp.gmail.com with ESMTPSA id q56sm4702093eda.28.2019.06.18.06.21.56
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 18 Jun 2019 06:21:57 -0700 (PDT)
Date:   Tue, 18 Jun 2019 15:21:55 +0200
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:DRM DRIVERS FOR RENESAS" 
        <linux-renesas-soc@vger.kernel.org>,
        Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH] drm: rcar-du: Replace drm_driver GEM ops with GEM object
 functions
Message-ID: <CAKMK7uEDmTfyEft4v0vpZsmYTC-jA2pCMMTt=T9r5Dis7gKEmQ@mail.gmail.com>
References: <20190618131329.30336-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190618131329.30336-1-laurent.pinchart+renesas@ideasonboard.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jun 18, 2019 at 3:13 PM Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com> wrote:
>
> The recommended way to specify GEM object functions is to provide a
> drm_gem_object_funcs structure instance and set the GEM object to point
> to it. The drm_cma_gem_create_object_default_funcs() function provided
> by the GEM CMA helper does so when creating the GEM object, simplifying
> the driver implementation. Switch to it, and remove the then unneeded
> GEM-related opertions from rcar_du_driver.
>
> Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
>
> Daniel, is this what you had in mind ?

Yup, I think that's it. Noralf commented that we might want to have
DRM_GEM_CMA_DRIVER_OPS macro for the remaining few drm_driver hooks, like
DRM_GEM_CMA_VMAP_DRIVER_OPS but without the forced vmap on import. But
that's ok to do in some follow-up cleanup too. On this:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>


>
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> index 3e5e835ea2b6..4cbb82009931 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> @@ -445,16 +445,10 @@ DEFINE_DRM_GEM_CMA_FOPS(rcar_du_fops);
>  static struct drm_driver rcar_du_driver = {
>         .driver_features        = DRIVER_GEM | DRIVER_MODESET | DRIVER_PRIME
>                                 | DRIVER_ATOMIC,
> -       .gem_free_object_unlocked = drm_gem_cma_free_object,
> -       .gem_vm_ops             = &drm_gem_cma_vm_ops,
> +       .gem_create_object      = drm_cma_gem_create_object_default_funcs,
>         .prime_handle_to_fd     = drm_gem_prime_handle_to_fd,
>         .prime_fd_to_handle     = drm_gem_prime_fd_to_handle,
> -       .gem_prime_import       = drm_gem_prime_import,
> -       .gem_prime_export       = drm_gem_prime_export,
> -       .gem_prime_get_sg_table = drm_gem_cma_prime_get_sg_table,
>         .gem_prime_import_sg_table = drm_gem_cma_prime_import_sg_table,
> -       .gem_prime_vmap         = drm_gem_cma_prime_vmap,
> -       .gem_prime_vunmap       = drm_gem_cma_prime_vunmap,
>         .gem_prime_mmap         = drm_gem_cma_prime_mmap,
>         .dumb_create            = rcar_du_dumb_create,
>         .fops                   = &rcar_du_fops,
> --
> Regards,
>
> Laurent Pinchart
>


--
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
