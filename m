Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B73D4A2E7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jun 2019 15:57:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727584AbfFRN51 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Jun 2019 09:57:27 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:34514 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726689AbfFRN51 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 09:57:27 -0400
Received: by mail-ed1-f65.google.com with SMTP id s49so21950776edb.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Jun 2019 06:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=o/y3CZ/9JeNO2iCsdOOt0XY4J6Mjvbtp9LFupuckhZ4=;
        b=P96GNkQCn7GBJ+kRdR5lB0O45vwUeN4ZT0q+taflYGX56ag8mf+dK17GYNUmzm+nyy
         5f5dLCHZNc+qwZERUNQS9wsUzcb1SzVipnrEX8zgnzEjgXMTBf6IZVN3GoX1NCXQmTuX
         gwsfOSPtNKEiAV9lGkUn/wfTaBmtfPoXxIG8I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=o/y3CZ/9JeNO2iCsdOOt0XY4J6Mjvbtp9LFupuckhZ4=;
        b=tT+S18jGh64Xucs80sZKuhlTFCTqlpQZGth3Rhdg4GQ+U8WKx9Eb5jOTPOVFSMoBej
         TmdpVDcWLDqrfiAT4jwTvPHuNgWDcY6IxLh/m9eas0ik8M+VUOOsajS5N3hEIgGm6ftC
         r9nb+rX7vgFajBv0eBGZlAt/qQMneYHnFVN9Nub589ue4UCdhhLLTZ/XHmAR2ZcqcgrP
         zhUg6Pwa9MWBZi4EBmssTIGZF68PSFvUlvtKvZ8XYncDhMZBWH/L3aaT42JJc2RzeIW+
         BhoQm6FWPlseuh5lk4dgJggEAypqG3Ch+6S3UCdeq46CuLBFaolYt7ZkKPL+UVJnh5go
         M4sw==
X-Gm-Message-State: APjAAAWce7BqEM+5Cwn7mc/4qRdHNqHKqQrvCooo6rSIBcxZOiUxeY4v
        Vy/6XIUDKNfjBQJRIpdl8jfPjA==
X-Google-Smtp-Source: APXvYqwtJ81ko/j4uiBwlzOpNyHL5Pdn8++Gh9/D0d6Oq/qtmt+5KEY1nwEbI0h67zViB4yBbxE2zQ==
X-Received: by 2002:a17:906:1813:: with SMTP id v19mr86316985eje.109.1560866245783;
        Tue, 18 Jun 2019 06:57:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
        by smtp.gmail.com with ESMTPSA id k51sm4833240edb.7.2019.06.18.06.57.24
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 18 Jun 2019 06:57:24 -0700 (PDT)
Date:   Tue, 18 Jun 2019 15:57:22 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Daniel Vetter <daniel.vetter@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:DRM DRIVERS FOR RENESAS" 
        <linux-renesas-soc@vger.kernel.org>,
        Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH] drm: rcar-du: Replace drm_driver GEM ops with GEM object
 functions
Message-ID: <20190618135722.GY12905@phenom.ffwll.local>
References: <20190618131329.30336-1-laurent.pinchart+renesas@ideasonboard.com>
 <CAKMK7uEDmTfyEft4v0vpZsmYTC-jA2pCMMTt=T9r5Dis7gKEmQ@mail.gmail.com>
 <20190618132651.GC21105@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190618132651.GC21105@pendragon.ideasonboard.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jun 18, 2019 at 04:26:51PM +0300, Laurent Pinchart wrote:
> Hi Daniel,
> 
> On Tue, Jun 18, 2019 at 03:21:55PM +0200, Daniel Vetter wrote:
> > On Tue, Jun 18, 2019 at 3:13 PM Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com> wrote:
> > >
> > > The recommended way to specify GEM object functions is to provide a
> > > drm_gem_object_funcs structure instance and set the GEM object to point
> > > to it. The drm_cma_gem_create_object_default_funcs() function provided
> > > by the GEM CMA helper does so when creating the GEM object, simplifying
> > > the driver implementation. Switch to it, and remove the then unneeded
> > > GEM-related opertions from rcar_du_driver.
> > >
> > > Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > > ---
> > >  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 8 +-------
> > >  1 file changed, 1 insertion(+), 7 deletions(-)
> > >
> > > Daniel, is this what you had in mind ?
> > 
> > Yup, I think that's it. Noralf commented that we might want to have
> > DRM_GEM_CMA_DRIVER_OPS macro for the remaining few drm_driver hooks, like
> > DRM_GEM_CMA_VMAP_DRIVER_OPS but without the forced vmap on import. But
> > that's ok to do in some follow-up cleanup too. On this:
> 
> Note that the rcar-du driver requires a custom .dumb_create() operation,
> which is another reason why I can't use DRM_GEM_CMA_VMAP_DRIVER_OPS.

Hm I was blind. Not sure you still want my r-b :-) But yeah good reason
not to use an ops macro for this.
-Daniel

> 
> > Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > 
> > > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > > index 3e5e835ea2b6..4cbb82009931 100644
> > > --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > > +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > > @@ -445,16 +445,10 @@ DEFINE_DRM_GEM_CMA_FOPS(rcar_du_fops);
> > >  static struct drm_driver rcar_du_driver = {
> > >         .driver_features        = DRIVER_GEM | DRIVER_MODESET | DRIVER_PRIME
> > >                                 | DRIVER_ATOMIC,
> > > -       .gem_free_object_unlocked = drm_gem_cma_free_object,
> > > -       .gem_vm_ops             = &drm_gem_cma_vm_ops,
> > > +       .gem_create_object      = drm_cma_gem_create_object_default_funcs,
> > >         .prime_handle_to_fd     = drm_gem_prime_handle_to_fd,
> > >         .prime_fd_to_handle     = drm_gem_prime_fd_to_handle,
> > > -       .gem_prime_import       = drm_gem_prime_import,
> > > -       .gem_prime_export       = drm_gem_prime_export,
> > > -       .gem_prime_get_sg_table = drm_gem_cma_prime_get_sg_table,
> > >         .gem_prime_import_sg_table = drm_gem_cma_prime_import_sg_table,
> > > -       .gem_prime_vmap         = drm_gem_cma_prime_vmap,
> > > -       .gem_prime_vunmap       = drm_gem_cma_prime_vunmap,
> > >         .gem_prime_mmap         = drm_gem_cma_prime_mmap,
> > >         .dumb_create            = rcar_du_dumb_create,
> > >         .fops                   = &rcar_du_fops,
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
