Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 329D54A210
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jun 2019 15:27:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725919AbfFRN1K (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Jun 2019 09:27:10 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:54524 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726088AbfFRN1K (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 09:27:10 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 02AE4D5;
        Tue, 18 Jun 2019 15:27:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1560864428;
        bh=g1gc1LLd8Mp15d1D66G8ERdo0dSJYekaFm/CxW4JmzI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AWEBtcWA0uOyfZ0eCXvRMDEX3LtbCxmwVwwSmrvXHjfs5H8poiEI6g2f1hI75mRbk
         6VI1s4cMl+jBdYaExjzsOCVqfEA5pB3QUHpLpy94h1t+Kv54lemgxE9Af7o/NxQCli
         n1K0YZCEQxgmpPJL6DU/wu6fwr75WOsR7VruSNok=
Date:   Tue, 18 Jun 2019 16:26:51 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "open list:DRM DRIVERS FOR RENESAS" 
        <linux-renesas-soc@vger.kernel.org>,
        Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH] drm: rcar-du: Replace drm_driver GEM ops with GEM object
 functions
Message-ID: <20190618132651.GC21105@pendragon.ideasonboard.com>
References: <20190618131329.30336-1-laurent.pinchart+renesas@ideasonboard.com>
 <CAKMK7uEDmTfyEft4v0vpZsmYTC-jA2pCMMTt=T9r5Dis7gKEmQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAKMK7uEDmTfyEft4v0vpZsmYTC-jA2pCMMTt=T9r5Dis7gKEmQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Daniel,

On Tue, Jun 18, 2019 at 03:21:55PM +0200, Daniel Vetter wrote:
> On Tue, Jun 18, 2019 at 3:13 PM Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com> wrote:
> >
> > The recommended way to specify GEM object functions is to provide a
> > drm_gem_object_funcs structure instance and set the GEM object to point
> > to it. The drm_cma_gem_create_object_default_funcs() function provided
> > by the GEM CMA helper does so when creating the GEM object, simplifying
> > the driver implementation. Switch to it, and remove the then unneeded
> > GEM-related opertions from rcar_du_driver.
> >
> > Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 8 +-------
> >  1 file changed, 1 insertion(+), 7 deletions(-)
> >
> > Daniel, is this what you had in mind ?
> 
> Yup, I think that's it. Noralf commented that we might want to have
> DRM_GEM_CMA_DRIVER_OPS macro for the remaining few drm_driver hooks, like
> DRM_GEM_CMA_VMAP_DRIVER_OPS but without the forced vmap on import. But
> that's ok to do in some follow-up cleanup too. On this:

Note that the rcar-du driver requires a custom .dumb_create() operation,
which is another reason why I can't use DRM_GEM_CMA_VMAP_DRIVER_OPS.

> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > index 3e5e835ea2b6..4cbb82009931 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > @@ -445,16 +445,10 @@ DEFINE_DRM_GEM_CMA_FOPS(rcar_du_fops);
> >  static struct drm_driver rcar_du_driver = {
> >         .driver_features        = DRIVER_GEM | DRIVER_MODESET | DRIVER_PRIME
> >                                 | DRIVER_ATOMIC,
> > -       .gem_free_object_unlocked = drm_gem_cma_free_object,
> > -       .gem_vm_ops             = &drm_gem_cma_vm_ops,
> > +       .gem_create_object      = drm_cma_gem_create_object_default_funcs,
> >         .prime_handle_to_fd     = drm_gem_prime_handle_to_fd,
> >         .prime_fd_to_handle     = drm_gem_prime_fd_to_handle,
> > -       .gem_prime_import       = drm_gem_prime_import,
> > -       .gem_prime_export       = drm_gem_prime_export,
> > -       .gem_prime_get_sg_table = drm_gem_cma_prime_get_sg_table,
> >         .gem_prime_import_sg_table = drm_gem_cma_prime_import_sg_table,
> > -       .gem_prime_vmap         = drm_gem_cma_prime_vmap,
> > -       .gem_prime_vunmap       = drm_gem_cma_prime_vunmap,
> >         .gem_prime_mmap         = drm_gem_cma_prime_mmap,
> >         .dumb_create            = rcar_du_dumb_create,
> >         .fops                   = &rcar_du_fops,

-- 
Regards,

Laurent Pinchart
