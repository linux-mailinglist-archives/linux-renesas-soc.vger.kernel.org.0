Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23B1C415336
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 Sep 2021 00:12:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238207AbhIVWN4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Sep 2021 18:13:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232149AbhIVWNx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Sep 2021 18:13:53 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D08EC061574
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Sep 2021 15:12:22 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D18D3E52;
        Thu, 23 Sep 2021 00:12:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1632348741;
        bh=ypbSOzhU+ITqNjqwgp9IfNJh+Ewn8yCEEW7kuIW8hU0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YILkhImo62wKlyYPJMB1wuTqRWundCv9kFYqcIgvhK7Ft5Q7pSOAuMBq/v/LGuwlV
         nNaAGvDYI7d9rnI3zpfdU9BDZY4nG75nV74ee1Uvc5++MdFBPOVKklPlMCBAtwblmk
         ok9+3UHCD1CdzeMJJV5mkD29HuVZ+0TlkX2ca/Hs=
Date:   Thu, 23 Sep 2021 01:12:19 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Daniel Vetter <daniel@ffwll.ch>,
        Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH v2] drm: rcar-du: Allow importing non-contiguous dma-buf
 with VSP
Message-ID: <YUuqQ9KzaFpMrrUu@pendragon.ideasonboard.com>
References: <20210730020545.2697-1-laurent.pinchart+renesas@ideasonboard.com>
 <1f80dbf7-94eb-d9ac-fd09-4ab972c113fb@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1f80dbf7-94eb-d9ac-fd09-4ab972c113fb@ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

On Wed, Sep 22, 2021 at 10:37:29PM +0100, Kieran Bingham wrote:
> On 30/07/2021 03:05, Laurent Pinchart wrote:
> > On R-Car Gen3, the DU uses a separate IP core named VSP to perform DMA
> > from memory and composition of planes. The DU hardware then only handles
> > the video timings and the interface with the encoders. This differs from
> > Gen2, where the DU included a composer with DMA engines.
> > 
> > When sourcing from the VSP, the DU hardware performs no memory access,
> > and thus has no requirements on imported dma-buf memory types. The GEM
> > CMA helpers however still create a DMA mapping to the DU device, which
> > isn't used. The mapping to the VSP is done when processing the atomic
> > commits, in the plane .prepare_fb() handler.
> > 
> > When the system uses an IOMMU, the VSP device is attached to it, which
> > enables the VSP to use non physically contiguous memory. The DU, as it
> > performs no memory access, isn't connected to the IOMMU. The GEM CMA
> > drm_gem_cma_prime_import_sg_table() helper will in that case fail to map
> > non-contiguous imported dma-bufs, as the DMA mapping to the DU device
> > will have multiple entries in its sgtable. The prevents using non
> > physically contiguous memory for display.
> > 
> > The DRM PRIME and GEM CMA helpers are designed to create the sgtable
> > when the dma-buf is imported. By default, the device referenced by the
> > drm_device is used to create the dma-buf attachment. Drivers can use a
> > different device by using the drm_gem_prime_import_dev() function. While
> > the DU has access to the VSP device, this won't help here, as different
> > CRTCs use different VSP instances, connected to different IOMMU
> > channels. The driver doesn't know at import time which CRTC a GEM object
> > will be used, and thus can't select the right VSP device to pass to
> > drm_gem_prime_import_dev().
> > 
> > To support non-contiguous memory, implement a custom
> > .gem_prime_import_sg_table() operation that accepts all imported dma-buf
> > regardless of the number of scatterlist entries. The sgtable will be
> > mapped to the VSP at .prepare_fb() time, which will reject the
> > framebuffer if the VSP isn't connected to an IOMMU.
> 
> Wow - quite a lot to digest there.

I tried to make it clear, but there's lots to explain :-S

> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> > 
> > This can arguably be considered as a bit of a hack, as the GEM PRIME
> > import still maps the dma-buf attachment to the DU, which isn't
> > necessary. This is however not a big issue, as the DU isn't connected to
> > any IOMMU, the DMA mapping thus doesn't waste any resource such as I/O
> > memory space. Avoiding the mapping creation would require replacing the
> > helpers completely, resulting in lots of code duplication. If this type
> > of hardware setup was common we could create another set of helpers, but
> > I don't think it would be worth it to support a single device.
> > 
> > I have tested this patch with the cam application from libcamera, on a
> > R-Car H3 ES2.x Salvator-XS board, importing buffers from the vimc
> > driver:
> > 
> > cam -c 'platform/vimc.0 Sensor B' \
> > 	-s pixelformat=BGR888,width=1440,height=900 \
> > 	-C -D HDMI-A-1
> 
> Are VIMC buffers always physically non-contiguous to validate this test?

They're not, but with
https://lore.kernel.org/linux-media/20210730001939.30769-1-laurent.pinchart+renesas@ideasonboard.com/
they can be made to be, with a module parameter.

> > A set of patches to add DRM/KMS output support to cam has been posted.
> > Until it gets merged (hopefully soon), it can be found at [1].
> > 
> > As cam doesn't support DRM/KMS scaling and overlay planes yet, the
> > camera resolution needs to match the display resolution. Due to a
> > peculiarity of the vimc driver, the resolution has to be divisible by 3,
> > which may require changes to the resolution above depending on your
> > monitor.
> > 
> > A test patch is also needed for the kernel, to enable IOMMU support for
> > the VSP, which isn't done by default (yet ?) in mainline. I have pushed
> > a branch to [2] if anyone is interested.
> > 
> > [1] https://lists.libcamera.org/pipermail/libcamera-devel/2021-July/022815.html
> > [2] git://linuxtv.org/pinchartl/media.git drm/du/devel/gem/contig
> > 
> > ---
> > Changes since v1:
> > 
> > - Rewrote commit message to explain issue in more details
> > - Duplicate the imported scatter gather table in
> >   rcar_du_vsp_plane_prepare_fb()
> > - Use separate loop counter j to avoid overwritting i
> > - Update to latest drm_gem_cma API
> > ---
> >  drivers/gpu/drm/rcar-du/rcar_du_drv.c |  6 +++-
> >  drivers/gpu/drm/rcar-du/rcar_du_kms.c | 49 +++++++++++++++++++++++++++
> >  drivers/gpu/drm/rcar-du/rcar_du_kms.h |  7 ++++
> >  drivers/gpu/drm/rcar-du/rcar_du_vsp.c | 36 +++++++++++++++++---
> >  4 files changed, 92 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > index cb34b1e477bc..d1f8d51a10fe 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> > @@ -511,7 +511,11 @@ DEFINE_DRM_GEM_CMA_FOPS(rcar_du_fops);
> >  
> >  static const struct drm_driver rcar_du_driver = {
> >  	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
> > -	DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE(rcar_du_dumb_create),
> > +	.dumb_create		= rcar_du_dumb_create,
> > +	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd,
> > +	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
> > +	.gem_prime_import_sg_table = rcar_du_gem_prime_import_sg_table,
> > +	.gem_prime_mmap		= drm_gem_prime_mmap,
> >  	.fops			= &rcar_du_fops,
> >  	.name			= "rcar-du",
> >  	.desc			= "Renesas R-Car Display Unit",
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> > index fdb8a0d127ad..7077af0886cf 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> > @@ -19,6 +19,7 @@
> >  #include <drm/drm_vblank.h>
> >  
> >  #include <linux/device.h>
> > +#include <linux/dma-buf.h>
> >  #include <linux/of_graph.h>
> >  #include <linux/of_platform.h>
> >  #include <linux/wait.h>
> > @@ -325,6 +326,54 @@ const struct rcar_du_format_info *rcar_du_format_info(u32 fourcc)
> >   * Frame buffer
> >   */
> >  
> > +static const struct drm_gem_object_funcs rcar_du_gem_funcs = {
> > +	.free = drm_gem_cma_free_object,
> > +	.print_info = drm_gem_cma_print_info,
> > +	.get_sg_table = drm_gem_cma_get_sg_table,
> > +	.vmap = drm_gem_cma_vmap,
> > +	.mmap = drm_gem_cma_mmap,
> > +	.vm_ops = &drm_gem_cma_vm_ops,
> > +};
> > +
> > +struct drm_gem_object *rcar_du_gem_prime_import_sg_table(struct drm_device *dev,
> > +				struct dma_buf_attachment *attach,
> > +				struct sg_table *sgt)
> > +{
> > +	struct rcar_du_device *rcdu = to_rcar_du_device(dev);
> > +	struct drm_gem_cma_object *cma_obj;
> > +	struct drm_gem_object *gem_obj;
> > +	int ret;
> > +
> > +	if (!rcar_du_has(rcdu, RCAR_DU_FEATURE_VSP1_SOURCE))
> > +		return drm_gem_cma_prime_import_sg_table(dev, attach, sgt);
> > +
> > +	/* Create a CMA GEM buffer. */
> > +	cma_obj = kzalloc(sizeof(*cma_obj), GFP_KERNEL);
> > +	if (!cma_obj)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	gem_obj = &cma_obj->base;
> > +	gem_obj->funcs = &rcar_du_gem_funcs;
> > +
> > +	drm_gem_private_object_init(dev, gem_obj, attach->dmabuf->size);
> > +	cma_obj->map_noncoherent = false;
> > +
> > +	ret = drm_gem_create_mmap_offset(gem_obj);
> > +	if (ret) {
> > +		drm_gem_object_release(gem_obj);
> > +		goto error;
> > +	}
> > +
> > +	cma_obj->paddr = 0;
> > +	cma_obj->sgt = sgt;
> > +
> > +	return gem_obj;
> > +
> > +error:
> > +	kfree(cma_obj);
> > +	return ERR_PTR(ret);
> 
> Almost seems overkill to handle this here, rather than inline in the
> failure of drm_gem_create_mmap_offset() which would use 2 less lines in
> the function ..
> 
> But perhaps you're planning for it to be extended?
> 
> However then wouldn't drm_gem_object_release() need to be handled in
> error: as well?
> 
> Personally I'd just inline the kfree in place of the goto error here.

You're right, I'll do so.

> But as that's the worst I can find in here so far:
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> > +}
> > +
> >  int rcar_du_dumb_create(struct drm_file *file, struct drm_device *dev,
> >  			struct drm_mode_create_dumb *args)
> >  {
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.h b/drivers/gpu/drm/rcar-du/rcar_du_kms.h
> > index 8f5fff176754..789154e19535 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.h
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.h
> > @@ -12,10 +12,13 @@
> >  
> >  #include <linux/types.h>
> >  
> > +struct dma_buf_attachment;
> >  struct drm_file;
> >  struct drm_device;
> > +struct drm_gem_object;
> >  struct drm_mode_create_dumb;
> >  struct rcar_du_device;
> > +struct sg_table;
> >  
> >  struct rcar_du_format_info {
> >  	u32 fourcc;
> > @@ -34,4 +37,8 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu);
> >  int rcar_du_dumb_create(struct drm_file *file, struct drm_device *dev,
> >  			struct drm_mode_create_dumb *args);
> >  
> > +struct drm_gem_object *rcar_du_gem_prime_import_sg_table(struct drm_device *dev,
> > +				struct dma_buf_attachment *attach,
> > +				struct sg_table *sgt);
> > +
> >  #endif /* __RCAR_DU_KMS_H__ */
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> > index 23e41c83c875..b7fc5b069cbc 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> > @@ -187,17 +187,43 @@ int rcar_du_vsp_map_fb(struct rcar_du_vsp *vsp, struct drm_framebuffer *fb,
> >  		       struct sg_table sg_tables[3])
> >  {
> >  	struct rcar_du_device *rcdu = vsp->dev;
> > -	unsigned int i;
> > +	unsigned int i, j;
> >  	int ret;
> >  
> >  	for (i = 0; i < fb->format->num_planes; ++i) {
> >  		struct drm_gem_cma_object *gem = drm_fb_cma_get_gem_obj(fb, i);
> >  		struct sg_table *sgt = &sg_tables[i];
> >  
> > -		ret = dma_get_sgtable(rcdu->dev, sgt, gem->vaddr, gem->paddr,
> > -				      gem->base.size);
> > -		if (ret)
> > -			goto fail;
> > +		if (gem->sgt) {
> > +			struct scatterlist *src;
> > +			struct scatterlist *dst;
> > +
> > +			/*
> > +			 * If the GEM buffer has a scatter gather table, it has
> > +			 * been imported from a dma-buf and has no physical
> > +			 * address as it might not be physically contiguous.
> > +			 * Copy the original scatter gather table to map it to
> > +			 * the VSP.
> > +			 */
> > +			ret = sg_alloc_table(sgt, gem->sgt->orig_nents,
> > +					     GFP_KERNEL);
> > +			if (ret)
> > +				goto fail;
> > +
> > +			src = gem->sgt->sgl;
> > +			dst = sgt->sgl;
> > +			for (j = 0; j < gem->sgt->orig_nents; ++j) {
> > +				sg_set_page(dst, sg_page(src), src->length,
> > +					    src->offset);
> > +				src = sg_next(src);
> > +				dst = sg_next(dst);
> > +			}
> > +		} else {
> > +			ret = dma_get_sgtable(rcdu->dev, sgt, gem->vaddr,
> > +					      gem->paddr, gem->base.size);
> > +			if (ret)
> > +				goto fail;
> > +		}
> >  
> >  		ret = vsp1_du_map_sg(vsp->vsp, sgt);
> >  		if (ret) {

-- 
Regards,

Laurent Pinchart
