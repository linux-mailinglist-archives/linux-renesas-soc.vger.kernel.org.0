Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 48E594B337
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2019 09:42:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731178AbfFSHmx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Jun 2019 03:42:53 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:46718 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725946AbfFSHmw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jun 2019 03:42:52 -0400
Received: by mail-oi1-f193.google.com with SMTP id 65so9772418oid.13
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Jun 2019 00:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Wjvo3GiK5zJLFaXSUjp6r+0+L3S6zTLinFH4bzOCtdA=;
        b=CKjqMY4fKRoO0Czf6R5gFkDjwKL6rUdG7sMNKQj3AoH2wF3j0+3ow4tT4FlGTYehoW
         T2yKHiJjsS6Y/71Edi39hW2NBoyzmj6bt1CZpa/yLEQTKiE/J54pXpy9fo+pPiHg7DUQ
         fBxW3YGgLieIVOU6SBN2QHax1vldW24ijzjVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Wjvo3GiK5zJLFaXSUjp6r+0+L3S6zTLinFH4bzOCtdA=;
        b=UDZ837AuQ/2EqUyP0zW3/kKe+5WrXYPMJy5R7VeTgXXdzhdsMLPotQzOX+K7gjqKz/
         RyImPCKVA3bUvQ4LKTlDLyKw5kzcFhufbsGhpmaeruDEfUOPoUg/aNj8Mu2j9qah7nJx
         PAlnfQFezbti0EYdcXDZxteBrqG8XlQFDSnUbe420t95OEUuLJZjaXRpd6cZC3cmQY3f
         84eQRY8pAKw3NIT4yki9AiIdUyEZb6k6OAoSz33D4EJbehasrE6aQu6ZLCmdtJnLcQ0S
         PCSZNJPI+lbr3jVTfYTunDwXPipXPEt4gUFXLBSptun8MwDXu71q/CsEgrJ9I8Cd6fJx
         pQDg==
X-Gm-Message-State: APjAAAVW43eoaVmKwBShv4BkZvmzQxB/IAEtEAHo+lKVKDyln+UxvkK6
        aseD6C02ER141V15/dexD41jX5igoV9VA9ObUWdBWQ==
X-Google-Smtp-Source: APXvYqw62FyhSQTWdIvRNCn8A1aS22XbOCaMpoet/Aplr4pOCykv8vchn4nZMJy3/Im47Pn9Ce1f+YnowjbeJOg5E0A=
X-Received: by 2002:aca:b104:: with SMTP id a4mr1636143oif.14.1560930171716;
 Wed, 19 Jun 2019 00:42:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190618131329.30336-1-laurent.pinchart+renesas@ideasonboard.com>
 <6d60ba59-60a2-58b3-c78b-5bd85e3a660b@tronnes.org> <20190618163557.GF21105@pendragon.ideasonboard.com>
 <8f0713df-c312-4166-fa4c-1e2356d14441@tronnes.org> <2792a7c4-1a95-643d-4763-0d62a5dad288@tronnes.org>
In-Reply-To: <2792a7c4-1a95-643d-4763-0d62a5dad288@tronnes.org>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Wed, 19 Jun 2019 09:42:38 +0200
Message-ID: <CAKMK7uFYn_jDeHHQnnH0+B7APxLGADqry6PRosEWi+8XcSX+Xg@mail.gmail.com>
Subject: Re: [PATCH] drm: rcar-du: Replace drm_driver GEM ops with GEM object functions
To:     =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "open list:DRM DRIVERS FOR RENESAS" 
        <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jun 19, 2019 at 9:00 AM Noralf Tr=C3=B8nnes <noralf@tronnes.org> wr=
ote:
>
>
>
> Den 18.06.2019 19.23, skrev Noralf Tr=C3=B8nnes:
> >
> > Den 18.06.2019 18.35, skrev Laurent Pinchart:
> >> Hi Noralf,
> >>
> >> On Tue, Jun 18, 2019 at 03:56:19PM +0200, Noralf Tr=C3=B8nnes wrote:
> >>> Den 18.06.2019 15.13, skrev Laurent Pinchart:
> >>>> The recommended way to specify GEM object functions is to provide a
> >>>> drm_gem_object_funcs structure instance and set the GEM object to po=
int
> >>>> to it. The drm_cma_gem_create_object_default_funcs() function provid=
ed
> >>>> by the GEM CMA helper does so when creating the GEM object, simplify=
ing
> >>>> the driver implementation. Switch to it, and remove the then unneede=
d
> >>>> GEM-related opertions from rcar_du_driver.
> >>>
> >>> s/opertions/operations/
> >>
> >> Oops, will fix.
> >>
> >>>> Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> >>>> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboa=
rd.com>
> >>>> ---
> >>>>  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 8 +-------
> >>>>  1 file changed, 1 insertion(+), 7 deletions(-)
> >>>>
> >>>> Daniel, is this what you had in mind ?
> >>>>
> >>>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm=
/rcar-du/rcar_du_drv.c
> >>>> index 3e5e835ea2b6..4cbb82009931 100644
> >>>> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> >>>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> >>>> @@ -445,16 +445,10 @@ DEFINE_DRM_GEM_CMA_FOPS(rcar_du_fops);
> >>>>  static struct drm_driver rcar_du_driver =3D {
> >>>>    .driver_features        =3D DRIVER_GEM | DRIVER_MODESET | DRIVER_=
PRIME
> >>>>                            | DRIVER_ATOMIC,
> >>>> -  .gem_free_object_unlocked =3D drm_gem_cma_free_object,
> >>>> -  .gem_vm_ops             =3D &drm_gem_cma_vm_ops,
> >>>> +  .gem_create_object      =3D drm_cma_gem_create_object_default_fun=
cs,
> >>>>    .prime_handle_to_fd     =3D drm_gem_prime_handle_to_fd,
> >>>>    .prime_fd_to_handle     =3D drm_gem_prime_fd_to_handle,
> >>>> -  .gem_prime_import       =3D drm_gem_prime_import,
> >>>> -  .gem_prime_export       =3D drm_gem_prime_export,
> >>>> -  .gem_prime_get_sg_table =3D drm_gem_cma_prime_get_sg_table,
> >>>>    .gem_prime_import_sg_table =3D drm_gem_cma_prime_import_sg_table,
> >>>> -  .gem_prime_vmap         =3D drm_gem_cma_prime_vmap,
> >>>> -  .gem_prime_vunmap       =3D drm_gem_cma_prime_vunmap,
> >>>>    .gem_prime_mmap         =3D drm_gem_cma_prime_mmap,
> >>>
> >>> If you want to pick up yet another recommendation, you can use
> >>> drm_gem_prime_mmap here.
> >>
> >> I compared the two call stacks and they appear similar, even if
> >> drm_gem_prime_mmap() leads to a more convoluted code flow. For my
> >> information, what's the advantage in using it ?
> >
> > It's part of Daniels quest to remove the drm_driver gem callbacks. AFAI=
U
> > drm_gem_prime_mmap() is a stop gap on the way to remove
> > drm_driver.gem_prime_mmap. I saw it documented in his recent series:
> > [03/59] drm/prime: Update docs
> > https://patchwork.freedesktop.org/patch/310608/
> >
> > +/**
> > + * drm_gem_dmabuf_mmap - dma_buf mmap implementation for GEM
> > + * @dma_buf: buffer to be mapped
> > + * @vma: virtual address range
> > + *
> > + * Provides memory mapping for the buffer. This can be used as the
> > + * &dma_buf_ops.mmap callback. It just forwards to
> > &drm_driver.gem_prime_mmap,
> > + * which should be set to drm_gem_prime_mmap().
> > + *
> > + * FIXME: There's really no point to this wrapper, drivers which need
> > anything
> > + * else but drm_gem_prime_mmap can roll their own &dma_buf_ops.mmap
> > callback.
>
> It hit me that maybe it would have been better to use
> drm_gem_prime_mmap() as the default instead of having everyone switch to =
it:
>
>  int drm_gem_dmabuf_mmap(struct dma_buf *dma_buf, struct vm_area_struct
> *vma)
>  {
>         struct drm_gem_object *obj =3D dma_buf->priv;
>         struct drm_device *dev =3D obj->dev;
>
>         if (!dev->driver->gem_prime_mmap)
> -               return -ENOSYS;
> +               return drm_gem_prime_mmap(obj, vma);
>
>         return dev->driver->gem_prime_mmap(obj, vma);
>  }

Crossed my mind to just do that, but it's not that easy. Right now the
presence of gem_prime_mmap indicates whether mmap on the dma-buf is
supported. Even for a gem driver this might not be the case, because
only dump gem mmappings are supposed to be coherent. Others might need
explicit cash flushing operations, which we don't set up by default
(we can't). For those cases you need to implement
dma_buf_ops->begin/end_cpu_access.

We need to audit all the drivers, and for those which really don't
implement mmap yet, provide a no_mmap dma_buf_ops->mmap implentation
that just does a return -ENOSYS. Once we have that, plus also switched
over everyone else, we can change drm_gem_dmabuf_mmap to
unconditionally call drm_gem_prime_mmap and drop the hook. But without
the full audit we can't do that, we might enable dma-buf mmap
somewhere where it doesn't work.
-Daniel

>
> Noralf.
>
> > + *
> > + * Returns 0 on success or a negative error code on failure.
> > + */
> >
> > Noralf.
> >
> >>
> >>> Either way:
> >>>
> >>> Reviewed-by: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
> >>>
> >>>>    .dumb_create            =3D rcar_du_dumb_create,
> >>>>    .fops                   =3D &rcar_du_fops,
> >>
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> >



--=20
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
