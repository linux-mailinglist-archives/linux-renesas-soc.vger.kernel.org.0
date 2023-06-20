Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F4B6737201
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jun 2023 18:47:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229699AbjFTQr5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 20 Jun 2023 12:47:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229558AbjFTQr4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Jun 2023 12:47:56 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40DAE18C
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jun 2023 09:47:54 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1DE032B3;
        Tue, 20 Jun 2023 18:47:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1687279637;
        bh=jYgE5le27xQma1/Mqs7mA7Z8eqDAn9yhZZQX0YvVRis=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GLyUiw/9qVwUqcWFa0iAR0S9IXTNPtpUTJ7z/Z1b6/jConkuiqFBkc3lHTbKs8Yad
         eWE18Tp8b6iIWZ7LqWO+JkzNs/GJSHaMw6FWCOQw7F1FtYtxVpIlswgrfN+YBdDK+d
         0OyAMEUnRLHjj1y1tB164ODnRT/QimKG0V8x3AWo=
Date:   Tue, 20 Jun 2023 19:47:50 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        airlied@gmail.com, daniel@ffwll.ch,
        kieran.bingham+renesas@ideasonboard.com, hjc@rock-chips.com,
        heiko@sntech.de, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 1/3] drm/rcar-du: Import buffers with GEM DMA's helpers
Message-ID: <20230620164750.GE26467@pendragon.ideasonboard.com>
References: <20230620121202.28263-1-tzimmermann@suse.de>
 <20230620121202.28263-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230620121202.28263-2-tzimmermann@suse.de>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Thomas,

Thank you for the patch.


On Tue, Jun 20, 2023 at 02:03:21PM +0200, Thomas Zimmermann wrote:
> Call __drm_gem_dma_create() to create an object for imported buffers,
> instead of reimplementing the function within the driver. Reduces
> code duplication and will later allow to un-export a number of symbols
> from the GEM DMA helpers.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Nice simplification.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I assume you'll merge the whole series through drm-misc, please let me
know if that's not correct.

> ---
>  drivers/gpu/drm/drm_gem_dma_helper.c          |  5 +--
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c | 33 +++----------------
>  include/drm/drm_gem_dma_helper.h              |  3 ++
>  3 files changed, 10 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c b/drivers/gpu/drm/drm_gem_dma_helper.c
> index 870b90b78bc4e..e9aa3ac140654 100644
> --- a/drivers/gpu/drm/drm_gem_dma_helper.c
> +++ b/drivers/gpu/drm/drm_gem_dma_helper.c
> @@ -67,8 +67,8 @@ static const struct drm_gem_object_funcs drm_gem_dma_default_funcs = {
>   * A struct drm_gem_dma_object * on success or an ERR_PTR()-encoded negative
>   * error code on failure.
>   */
> -static struct drm_gem_dma_object *
> -__drm_gem_dma_create(struct drm_device *drm, size_t size, bool private)
> +struct drm_gem_dma_object *__drm_gem_dma_create(struct drm_device *drm,
> +						size_t size, bool private)
>  {
>  	struct drm_gem_dma_object *dma_obj;
>  	struct drm_gem_object *gem_obj;
> @@ -112,6 +112,7 @@ __drm_gem_dma_create(struct drm_device *drm, size_t size, bool private)
>  	kfree(dma_obj);
>  	return ERR_PTR(ret);
>  }
> +EXPORT_SYMBOL_GPL(__drm_gem_dma_create);
>  
>  /**
>   * drm_gem_dma_create - allocate an object with the given size
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> index adfb36b0e8154..ea7487e270f13 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c
> @@ -356,49 +356,24 @@ const struct rcar_du_format_info *rcar_du_format_info(u32 fourcc)
>   * Frame buffer
>   */
>  
> -static const struct drm_gem_object_funcs rcar_du_gem_funcs = {
> -	.free = drm_gem_dma_object_free,
> -	.print_info = drm_gem_dma_object_print_info,
> -	.get_sg_table = drm_gem_dma_object_get_sg_table,
> -	.vmap = drm_gem_dma_object_vmap,
> -	.mmap = drm_gem_dma_object_mmap,
> -	.vm_ops = &drm_gem_dma_vm_ops,
> -};
> -
>  struct drm_gem_object *rcar_du_gem_prime_import_sg_table(struct drm_device *dev,
>  				struct dma_buf_attachment *attach,
>  				struct sg_table *sgt)
>  {
>  	struct rcar_du_device *rcdu = to_rcar_du_device(dev);
>  	struct drm_gem_dma_object *dma_obj;
> -	struct drm_gem_object *gem_obj;
> -	int ret;
>  
>  	if (!rcar_du_has(rcdu, RCAR_DU_FEATURE_VSP1_SOURCE))
>  		return drm_gem_dma_prime_import_sg_table(dev, attach, sgt);
>  
> -	/* Create a DMA GEM buffer. */
> -	dma_obj = kzalloc(sizeof(*dma_obj), GFP_KERNEL);
> -	if (!dma_obj)
> -		return ERR_PTR(-ENOMEM);
> -
> -	gem_obj = &dma_obj->base;
> -	gem_obj->funcs = &rcar_du_gem_funcs;
> -
> -	drm_gem_private_object_init(dev, gem_obj, attach->dmabuf->size);
> -	dma_obj->map_noncoherent = false;
> -
> -	ret = drm_gem_create_mmap_offset(gem_obj);
> -	if (ret) {
> -		drm_gem_object_release(gem_obj);
> -		kfree(dma_obj);
> -		return ERR_PTR(ret);
> -	}
> +	dma_obj = __drm_gem_dma_create(dev, attach->dmabuf->size, true);
> +	if (IS_ERR(dma_obj))
> +		return ERR_CAST(dma_obj);
>  
>  	dma_obj->dma_addr = 0;
>  	dma_obj->sgt = sgt;
>  
> -	return gem_obj;
> +	return &dma_obj->base;
>  }
>  
>  int rcar_du_dumb_create(struct drm_file *file, struct drm_device *dev,
> diff --git a/include/drm/drm_gem_dma_helper.h b/include/drm/drm_gem_dma_helper.h
> index 61da596780b64..3877cbf0e927c 100644
> --- a/include/drm/drm_gem_dma_helper.h
> +++ b/include/drm/drm_gem_dma_helper.h
> @@ -32,6 +32,9 @@ struct drm_gem_dma_object {
>  #define to_drm_gem_dma_obj(gem_obj) \
>  	container_of(gem_obj, struct drm_gem_dma_object, base)
>  
> +struct drm_gem_dma_object *__drm_gem_dma_create(struct drm_device *drm,
> +						size_t size, bool private);
> +
>  struct drm_gem_dma_object *drm_gem_dma_create(struct drm_device *drm,
>  					      size_t size);
>  void drm_gem_dma_free(struct drm_gem_dma_object *dma_obj);

-- 
Regards,

Laurent Pinchart
