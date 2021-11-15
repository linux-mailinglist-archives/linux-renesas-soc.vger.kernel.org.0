Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A93B94505C2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 15 Nov 2021 14:43:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231764AbhKONpu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 15 Nov 2021 08:45:50 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:43226 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236427AbhKONnV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Nov 2021 08:43:21 -0500
Received: from pendragon.ideasonboard.com (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 47C5A93;
        Mon, 15 Nov 2021 14:40:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1636983625;
        bh=hJqaKcHD1tvfKC6NFjnSHYUW3wehP5+Dmgbtxqf+8zQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AxiKFOk5iTvVxI/yEVENpB1U2CTNCAovSME4Jb+3anmDsLWMLUTkiUoxJ+CoWJjb5
         HTSKDKNcQOSFRQ1pbaAK9iEiqbZmflasoexeJRxm/pPExeotlFm62Q4P68cUtGxlrp
         RfgJ5lEZRxjFYWCnhC+A9uz+fM4Hx3QBnlm1W3Bw=
Date:   Mon, 15 Nov 2021 15:40:03 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
        maarten.lankhorst@linux.intel.com,
        kieran.bingham+renesas@ideasonboard.com, emma@anholt.net,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/3] drm/cma-helper: Move driver and file ops to the end
 of header
Message-ID: <YZJjMwKpiedhcjyg@pendragon.ideasonboard.com>
References: <20211115120148.21766-1-tzimmermann@suse.de>
 <20211115120148.21766-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20211115120148.21766-2-tzimmermann@suse.de>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Thomas,

Thank you for the patch.

On Mon, Nov 15, 2021 at 01:01:46PM +0100, Thomas Zimmermann wrote:
> Restructure the header file for CMA helpers by moving declarations
> for driver and file operations to the end of the file. No functional
> changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

I'm not sure to see what we gain from this, but I don't mind.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  include/drm/drm_gem_cma_helper.h | 114 ++++++++++++++++---------------
>  1 file changed, 60 insertions(+), 54 deletions(-)
> 
> diff --git a/include/drm/drm_gem_cma_helper.h b/include/drm/drm_gem_cma_helper.h
> index cd13508acbc1..e0fb7a0cf03f 100644
> --- a/include/drm/drm_gem_cma_helper.h
> +++ b/include/drm/drm_gem_cma_helper.h
> @@ -32,77 +32,40 @@ struct drm_gem_cma_object {
>  #define to_drm_gem_cma_obj(gem_obj) \
>  	container_of(gem_obj, struct drm_gem_cma_object, base)
>  
> -#ifndef CONFIG_MMU
> -#define DRM_GEM_CMA_UNMAPPED_AREA_FOPS \
> -	.get_unmapped_area	= drm_gem_cma_get_unmapped_area,
> -#else
> -#define DRM_GEM_CMA_UNMAPPED_AREA_FOPS
> -#endif
> -
> -/**
> - * DEFINE_DRM_GEM_CMA_FOPS() - macro to generate file operations for CMA drivers
> - * @name: name for the generated structure
> - *
> - * This macro autogenerates a suitable &struct file_operations for CMA based
> - * drivers, which can be assigned to &drm_driver.fops. Note that this structure
> - * cannot be shared between drivers, because it contains a reference to the
> - * current module using THIS_MODULE.
> - *
> - * Note that the declaration is already marked as static - if you need a
> - * non-static version of this you're probably doing it wrong and will break the
> - * THIS_MODULE reference by accident.
> - */
> -#define DEFINE_DRM_GEM_CMA_FOPS(name) \
> -	static const struct file_operations name = {\
> -		.owner		= THIS_MODULE,\
> -		.open		= drm_open,\
> -		.release	= drm_release,\
> -		.unlocked_ioctl	= drm_ioctl,\
> -		.compat_ioctl	= drm_compat_ioctl,\
> -		.poll		= drm_poll,\
> -		.read		= drm_read,\
> -		.llseek		= noop_llseek,\
> -		.mmap		= drm_gem_mmap,\
> -		DRM_GEM_CMA_UNMAPPED_AREA_FOPS \
> -	}
> -
>  /* free GEM object */
>  void drm_gem_cma_free_object(struct drm_gem_object *gem_obj);
>  
> -/* create memory region for DRM framebuffer */
> -int drm_gem_cma_dumb_create_internal(struct drm_file *file_priv,
> -				     struct drm_device *drm,
> -				     struct drm_mode_create_dumb *args);
> -
> -/* create memory region for DRM framebuffer */
> -int drm_gem_cma_dumb_create(struct drm_file *file_priv,
> -			    struct drm_device *drm,
> -			    struct drm_mode_create_dumb *args);
> -
>  /* allocate physical memory */
>  struct drm_gem_cma_object *drm_gem_cma_create(struct drm_device *drm,
>  					      size_t size);
>  
>  extern const struct vm_operations_struct drm_gem_cma_vm_ops;
>  
> -#ifndef CONFIG_MMU
> -unsigned long drm_gem_cma_get_unmapped_area(struct file *filp,
> -					    unsigned long addr,
> -					    unsigned long len,
> -					    unsigned long pgoff,
> -					    unsigned long flags);
> -#endif
> -
>  void drm_gem_cma_print_info(struct drm_printer *p, unsigned int indent,
>  			    const struct drm_gem_object *obj);
>  
>  struct sg_table *drm_gem_cma_get_sg_table(struct drm_gem_object *obj);
> +int drm_gem_cma_vmap(struct drm_gem_object *obj, struct dma_buf_map *map);
> +int drm_gem_cma_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
> +
> +/*
> + * Driver ops
> + */
> +
> +/* create memory region for DRM framebuffer */
> +int drm_gem_cma_dumb_create_internal(struct drm_file *file_priv,
> +				     struct drm_device *drm,
> +				     struct drm_mode_create_dumb *args);
> +
> +/* create memory region for DRM framebuffer */
> +int drm_gem_cma_dumb_create(struct drm_file *file_priv,
> +			    struct drm_device *drm,
> +			    struct drm_mode_create_dumb *args);
> +
>  struct drm_gem_object *
>  drm_gem_cma_prime_import_sg_table(struct drm_device *dev,
>  				  struct dma_buf_attachment *attach,
>  				  struct sg_table *sgt);
> -int drm_gem_cma_vmap(struct drm_gem_object *obj, struct dma_buf_map *map);
> -int drm_gem_cma_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
>  
>  /**
>   * DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE - CMA GEM driver operations
> @@ -185,4 +148,47 @@ drm_gem_cma_prime_import_sg_table_vmap(struct drm_device *drm,
>  				       struct dma_buf_attachment *attach,
>  				       struct sg_table *sgt);
>  
> +/*
> + * File ops
> + */
> +
> +#ifndef CONFIG_MMU
> +unsigned long drm_gem_cma_get_unmapped_area(struct file *filp,
> +					    unsigned long addr,
> +					    unsigned long len,
> +					    unsigned long pgoff,
> +					    unsigned long flags);
> +#define DRM_GEM_CMA_UNMAPPED_AREA_FOPS \
> +	.get_unmapped_area	= drm_gem_cma_get_unmapped_area,
> +#else
> +#define DRM_GEM_CMA_UNMAPPED_AREA_FOPS
> +#endif
> +
> +/**
> + * DEFINE_DRM_GEM_CMA_FOPS() - macro to generate file operations for CMA drivers
> + * @name: name for the generated structure
> + *
> + * This macro autogenerates a suitable &struct file_operations for CMA based
> + * drivers, which can be assigned to &drm_driver.fops. Note that this structure
> + * cannot be shared between drivers, because it contains a reference to the
> + * current module using THIS_MODULE.
> + *
> + * Note that the declaration is already marked as static - if you need a
> + * non-static version of this you're probably doing it wrong and will break the
> + * THIS_MODULE reference by accident.
> + */
> +#define DEFINE_DRM_GEM_CMA_FOPS(name) \
> +	static const struct file_operations name = {\
> +		.owner		= THIS_MODULE,\
> +		.open		= drm_open,\
> +		.release	= drm_release,\
> +		.unlocked_ioctl	= drm_ioctl,\
> +		.compat_ioctl	= drm_compat_ioctl,\
> +		.poll		= drm_poll,\
> +		.read		= drm_read,\
> +		.llseek		= noop_llseek,\
> +		.mmap		= drm_gem_mmap,\
> +		DRM_GEM_CMA_UNMAPPED_AREA_FOPS \
> +	}
> +
>  #endif /* __DRM_GEM_CMA_HELPER_H__ */

-- 
Regards,

Laurent Pinchart
