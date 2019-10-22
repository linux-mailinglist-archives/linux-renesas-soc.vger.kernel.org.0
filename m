Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 51F37E02E7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Oct 2019 13:30:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388660AbfJVLaL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Oct 2019 07:30:11 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:49720 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388659AbfJVLaL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Oct 2019 07:30:11 -0400
Received: from pendragon.ideasonboard.com (143.121.2.93.rev.sfr.net [93.2.121.143])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E591856A;
        Tue, 22 Oct 2019 13:30:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1571743807;
        bh=MI35ApV2xT82M2rJQNP9+lMAN/oiA8CMZTmO6J+r5DQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=t3hYuFw4CMNvDfoRRJIZgQBBInFd3Hffl5ubnJS54sSLNcHRbOx98YFlLWrbHWcjg
         H7mLxmQ0In8uCVpylyXAWAo6Vrk5MYeAfkzgnOicGRDFIdRnolMZxVgPmFKsH6pHOW
         QY9PUvPSeNTaXgZyovhjsXaoEBw6rbqQ7ANYP8fo=
Date:   Tue, 22 Oct 2019 14:30:01 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Rob Herring <robh@kernel.org>
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Chen Feng <puck.chen@hisilicon.com>,
        Chen-Yu Tsai <wens@csie.org>, CK Hu <ck.hu@mediatek.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>,
        "James (Qian) Wang" <james.qian.wang@arm.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org,
        Liviu Dudau <liviu.dudau@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Noralf =?utf-8?Q?Tr=C3=B8nnes?= <noralf@tronnes.org>,
        Philippe Cornu <philippe.cornu@st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Rongrong Zou <zourongrong@gmail.com>,
        Sandy Huang <hjc@rock-chips.com>, Sean Paul <sean@poorly.run>,
        Vincent Abriou <vincent.abriou@st.com>,
        Xinliang Liu <z.liuxinliang@hisilicon.com>,
        Xinwei Kong <kong.kongxinwei@hisilicon.com>,
        Yannick Fertre <yannick.fertre@st.com>,
        Brian Starkey <brian.starkey@arm.com>,
        linux-amlogic@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 4/6] drm/cma-helper: Support DRM_MODE_DUMB_KERNEL_MAP flag
Message-ID: <20191022113001.GG4756@pendragon.ideasonboard.com>
References: <20191021214550.1461-1-robh@kernel.org>
 <20191021214550.1461-5-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191021214550.1461-5-robh@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Rob,

Thank you for the patch.

On Mon, Oct 21, 2019 at 04:45:48PM -0500, Rob Herring wrote:
> Add support in CMA helpers to handle callers specifying
> DRM_MODE_DUMB_KERNEL_MAP flag. Existing behavior is maintained with this
> change. drm_gem_cma_dumb_create() always creates a kernel mapping as
> before. drm_gem_cma_dumb_create_internal() lets the caller set the flags
> as desired. Therefore, update all the existing callers of
> drm_gem_cma_dumb_create_internal() to also set the
> DRM_MODE_DUMB_KERNEL_MAP flag.
> 
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: "James (Qian) Wang" <james.qian.wang@arm.com>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Brian Starkey <brian.starkey@arm.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Kevin Hilman <khilman@baylibre.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> Cc: Sandy Huang <hjc@rock-chips.com>
> Cc: "Heiko Stübner" <heiko@sntech.de>
> Cc: Yannick Fertre <yannick.fertre@st.com>
> Cc: Philippe Cornu <philippe.cornu@st.com>
> Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> Cc: Vincent Abriou <vincent.abriou@st.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: linux-amlogic@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-renesas-soc@vger.kernel.org
> Cc: linux-rockchip@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>  .../gpu/drm/arm/display/komeda/komeda_kms.c   |  1 +
>  drivers/gpu/drm/arm/malidp_drv.c              |  1 +
>  drivers/gpu/drm/drm_gem_cma_helper.c          | 48 +++++++++++--------
>  drivers/gpu/drm/meson/meson_drv.c             |  1 +
>  drivers/gpu/drm/rcar-du/rcar_du_kms.c         |  1 +
>  drivers/gpu/drm/rockchip/rockchip_drm_gem.c   |  1 +
>  drivers/gpu/drm/stm/drv.c                     |  1 +
>  drivers/gpu/drm/sun4i/sun4i_drv.c             |  1 +
>  8 files changed, 36 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
> index d49772de93e0..7cf0dc4cbfc1 100644
> --- a/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
> +++ b/drivers/gpu/drm/arm/display/komeda/komeda_kms.c
> @@ -31,6 +31,7 @@ static int komeda_gem_cma_dumb_create(struct drm_file *file,
>  	u32 pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
>  
>  	args->pitch = ALIGN(pitch, mdev->chip.bus_width);
> +	args->flags = DRM_MODE_DUMB_KERNEL_MAP;
>  
>  	return drm_gem_cma_dumb_create_internal(file, dev, args);
>  }
> diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
> index 8a76315aaa0f..aeb1a779ecc1 100644
> --- a/drivers/gpu/drm/arm/malidp_drv.c
> +++ b/drivers/gpu/drm/arm/malidp_drv.c
> @@ -465,6 +465,7 @@ static int malidp_dumb_create(struct drm_file *file_priv,
>  	u8 alignment = malidp_hw_get_pitch_align(malidp->dev, 1);
>  
>  	args->pitch = ALIGN(DIV_ROUND_UP(args->width * args->bpp, 8), alignment);
> +	args->flags = DRM_MODE_DUMB_KERNEL_MAP;
>  
>  	return drm_gem_cma_dumb_create_internal(file_priv, drm, args);
>  }
> diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
> index 4cebfe01e6ea..f91e9e8adeaf 100644
> --- a/drivers/gpu/drm/drm_gem_cma_helper.c
> +++ b/drivers/gpu/drm/drm_gem_cma_helper.c
> @@ -78,21 +78,8 @@ __drm_gem_cma_create(struct drm_device *drm, size_t size)
>  	return ERR_PTR(ret);
>  }
>  
> -/**
> - * drm_gem_cma_create - allocate an object with the given size
> - * @drm: DRM device
> - * @size: size of the object to allocate
> - *
> - * This function creates a CMA GEM object and allocates a contiguous chunk of
> - * memory as backing store. The backing memory has the writecombine attribute
> - * set.
> - *
> - * Returns:
> - * A struct drm_gem_cma_object * on success or an ERR_PTR()-encoded negative
> - * error code on failure.
> - */
> -struct drm_gem_cma_object *drm_gem_cma_create(struct drm_device *drm,
> -					      size_t size)
> +static struct drm_gem_cma_object *
> +drm_gem_cma_create_flags(struct drm_device *drm, size_t size, u32 flags)
>  {
>  	struct drm_gem_cma_object *cma_obj;
>  	int ret;
> @@ -103,6 +90,9 @@ struct drm_gem_cma_object *drm_gem_cma_create(struct drm_device *drm,
>  	if (IS_ERR(cma_obj))
>  		return cma_obj;
>  
> +	if (!(flags & DRM_MODE_DUMB_KERNEL_MAP))
> +		cma_obj->dma_attrs |= DMA_ATTR_NO_KERNEL_MAPPING;
> +
>  	cma_obj->vaddr = dma_alloc_attrs(drm->dev, size, &cma_obj->paddr,
>  					 GFP_KERNEL | __GFP_NOWARN,
>  					 cma_obj->dma_attrs);
> @@ -119,6 +109,25 @@ struct drm_gem_cma_object *drm_gem_cma_create(struct drm_device *drm,
>  	drm_gem_object_put_unlocked(&cma_obj->base);
>  	return ERR_PTR(ret);
>  }
> +
> +/**
> + * drm_gem_cma_create - allocate an object with the given size
> + * @drm: DRM device
> + * @size: size of the object to allocate
> + *
> + * This function creates a CMA GEM object and allocates a contiguous chunk of
> + * memory as backing store. The backing memory has the writecombine attribute
> + * set.
> + *

Shouldn't you mention here that the function always creates a kernel
mapping, and that callers that don't need the mapping should use
drm_gem_cma_dumb_create_internal() instead ?
drm_gem_cma_dumb_create_internal() operates at a different level though,
and drm_gem_cma_create() is only exported for a single driver. There's
no equivalent to drm_gem_cma_create() that can skip the kernel mapping.

Apart from this,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> + * Returns:
> + * A struct drm_gem_cma_object * on success or an ERR_PTR()-encoded negative
> + * error code on failure.
> + */
> +struct drm_gem_cma_object *drm_gem_cma_create(struct drm_device *drm,
> +					      size_t size)
> +{
> +	return drm_gem_cma_create_flags(drm, size, DRM_MODE_DUMB_KERNEL_MAP);
> +}
>  EXPORT_SYMBOL_GPL(drm_gem_cma_create);
>  
>  /**
> @@ -139,14 +148,14 @@ EXPORT_SYMBOL_GPL(drm_gem_cma_create);
>   */
>  static struct drm_gem_cma_object *
>  drm_gem_cma_create_with_handle(struct drm_file *file_priv,
> -			       struct drm_device *drm, size_t size,
> +			       struct drm_device *drm, size_t size, u32 flags,
>  			       uint32_t *handle)
>  {
>  	struct drm_gem_cma_object *cma_obj;
>  	struct drm_gem_object *gem_obj;
>  	int ret;
>  
> -	cma_obj = drm_gem_cma_create(drm, size);
> +	cma_obj = drm_gem_cma_create_flags(drm, size, flags);
>  	if (IS_ERR(cma_obj))
>  		return cma_obj;
>  
> @@ -225,7 +234,7 @@ int drm_gem_cma_dumb_create_internal(struct drm_file *file_priv,
>  		args->size = args->pitch * args->height;
>  
>  	cma_obj = drm_gem_cma_create_with_handle(file_priv, drm, args->size,
> -						 &args->handle);
> +						 args->flags, &args->handle);
>  	return PTR_ERR_OR_ZERO(cma_obj);
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_cma_dumb_create_internal);
> @@ -256,9 +265,10 @@ int drm_gem_cma_dumb_create(struct drm_file *file_priv,
>  
>  	args->pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
>  	args->size = args->pitch * args->height;
> +	args->flags = DRM_MODE_DUMB_KERNEL_MAP;
>  
>  	cma_obj = drm_gem_cma_create_with_handle(file_priv, drm, args->size,
> -						 &args->handle);
> +						 args->flags, &args->handle);
>  	return PTR_ERR_OR_ZERO(cma_obj);
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_cma_dumb_create);
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
> index 397c33182f4f..1593518dcbe4 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -81,6 +81,7 @@ static int meson_dumb_create(struct drm_file *file, struct drm_device *dev,
>  	 */
>  	args->pitch = ALIGN(DIV_ROUND_UP(args->width * args->bpp, 8), SZ_64);
>  	args->size = PAGE_ALIGN(args->pitch * args->height);
> +	args->flags = DRM_MODE_DUMB_KERNEL_MAP;
>  
>  	return drm_gem_cma_dumb_create_internal(file, dev, args);
>  }
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> index 2dc9caee8767..c9b1f298ce7e 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> @@ -299,6 +299,7 @@ int rcar_du_dumb_create(struct drm_file *file, struct drm_device *dev,
>  		align = 16 * args->bpp / 8;
>  
>  	args->pitch = roundup(min_pitch, align);
> +	args->flags = DRM_MODE_DUMB_KERNEL_MAP;
>  
>  	return drm_gem_cma_dumb_create_internal(file, dev, args);
>  }
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> index 7582d0e6a60a..f09b9a035376 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
> @@ -419,6 +419,7 @@ int rockchip_gem_dumb_create(struct drm_file *file_priv,
>  	 * align to 64 bytes since Mali requires it.
>  	 */
>  	args->pitch = ALIGN(min_pitch, 64);
> +	args->flags = DRM_MODE_DUMB_KERNEL_MAP;
>  	args->size = args->pitch * args->height;

My OCD gets triggered by flags appearing in the middle here while it is
at the end in other drivers :-)

>  
>  	rk_obj = rockchip_gem_create_with_handle(file_priv, dev, args->size,
> diff --git a/drivers/gpu/drm/stm/drv.c b/drivers/gpu/drm/stm/drv.c
> index 5a9f9aca8bc2..0f76a4ac95b3 100644
> --- a/drivers/gpu/drm/stm/drv.c
> +++ b/drivers/gpu/drm/stm/drv.c
> @@ -47,6 +47,7 @@ static int stm_gem_cma_dumb_create(struct drm_file *file,
>  	 */
>  	args->pitch = roundup(min_pitch, 128);
>  	args->height = roundup(args->height, 4);
> +	args->flags = DRM_MODE_DUMB_KERNEL_MAP;
>  
>  	return drm_gem_cma_dumb_create_internal(file, dev, args);
>  }
> diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
> index a5757b11b730..f653a5d1e2d6 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_drv.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
> @@ -34,6 +34,7 @@ static int drm_sun4i_gem_dumb_create(struct drm_file *file_priv,
>  {
>  	/* The hardware only allows even pitches for YUV buffers. */
>  	args->pitch = ALIGN(DIV_ROUND_UP(args->width * args->bpp, 8), 2);
> +	args->flags = DRM_MODE_DUMB_KERNEL_MAP;
>  
>  	return drm_gem_cma_dumb_create_internal(file_priv, drm, args);
>  }

-- 
Regards,

Laurent Pinchart
