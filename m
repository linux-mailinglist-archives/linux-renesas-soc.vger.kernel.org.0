Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 621A64A712
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Jun 2019 18:36:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729491AbfFRQgR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Jun 2019 12:36:17 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:55576 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729319AbfFRQgR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Jun 2019 12:36:17 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BF91FD5;
        Tue, 18 Jun 2019 18:36:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1560875774;
        bh=F2+CknpW90Qtzn/iua1VMeTWHYGplrCGzDZKCZLVgGU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=a9D0AvIJDHI9BnraSYmctjuFvOlsGasv/2Pv1f5oqSJjGukbV97NTH11Wxfz5Vge8
         1kSS9rA1UnPh/HtBPDHok9Oo0PLF2ITP4mtxwfK2wcvgZOPWz4jOumvr3In1mdvXNa
         FfHtQvKP1iXr9uiUqdfY7iCNVGcYZSTbar3UCBJw=
Date:   Tue, 18 Jun 2019 19:35:57 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>
Cc:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm: rcar-du: Replace drm_driver GEM ops with GEM object
 functions
Message-ID: <20190618163557.GF21105@pendragon.ideasonboard.com>
References: <20190618131329.30336-1-laurent.pinchart+renesas@ideasonboard.com>
 <6d60ba59-60a2-58b3-c78b-5bd85e3a660b@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6d60ba59-60a2-58b3-c78b-5bd85e3a660b@tronnes.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Noralf,

On Tue, Jun 18, 2019 at 03:56:19PM +0200, Noralf Trønnes wrote:
> Den 18.06.2019 15.13, skrev Laurent Pinchart:
> > The recommended way to specify GEM object functions is to provide a
> > drm_gem_object_funcs structure instance and set the GEM object to point
> > to it. The drm_cma_gem_create_object_default_funcs() function provided
> > by the GEM CMA helper does so when creating the GEM object, simplifying
> > the driver implementation. Switch to it, and remove the then unneeded
> > GEM-related opertions from rcar_du_driver.
> 
> s/opertions/operations/

Oops, will fix.

> > Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 8 +-------
> >  1 file changed, 1 insertion(+), 7 deletions(-)
> > 
> > Daniel, is this what you had in mind ?
> > 
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > index 3e5e835ea2b6..4cbb82009931 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > @@ -445,16 +445,10 @@ DEFINE_DRM_GEM_CMA_FOPS(rcar_du_fops);
> >  static struct drm_driver rcar_du_driver = {
> >  	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_PRIME
> >  				| DRIVER_ATOMIC,
> > -	.gem_free_object_unlocked = drm_gem_cma_free_object,
> > -	.gem_vm_ops		= &drm_gem_cma_vm_ops,
> > +	.gem_create_object      = drm_cma_gem_create_object_default_funcs,
> >  	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd,
> >  	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
> > -	.gem_prime_import	= drm_gem_prime_import,
> > -	.gem_prime_export	= drm_gem_prime_export,
> > -	.gem_prime_get_sg_table	= drm_gem_cma_prime_get_sg_table,
> >  	.gem_prime_import_sg_table = drm_gem_cma_prime_import_sg_table,
> > -	.gem_prime_vmap		= drm_gem_cma_prime_vmap,
> > -	.gem_prime_vunmap	= drm_gem_cma_prime_vunmap,
> >  	.gem_prime_mmap		= drm_gem_cma_prime_mmap,
> 
> If you want to pick up yet another recommendation, you can use
> drm_gem_prime_mmap here.

I compared the two call stacks and they appear similar, even if
drm_gem_prime_mmap() leads to a more convoluted code flow. For my
information, what's the advantage in using it ?

> Either way:
> 
> Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
> 
> >  	.dumb_create		= rcar_du_dumb_create,
> >  	.fops			= &rcar_du_fops,

-- 
Regards,

Laurent Pinchart
