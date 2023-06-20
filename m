Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 49681737205
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Jun 2023 18:48:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229671AbjFTQsY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 20 Jun 2023 12:48:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230171AbjFTQsX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Jun 2023 12:48:23 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EA27D1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Jun 2023 09:48:22 -0700 (PDT)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 05F20B2A;
        Tue, 20 Jun 2023 18:47:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1687279666;
        bh=n6szjPbzctfFO2eL46Qs3m2ddroPrcA/e5XpeGrnJTM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oNOh5R2HHEl4+NNt0N0uTWOqgYKFTZbVThLpNE8jy7qIgadxEc/RTVyZCwbk8GOpq
         7cNGu8guZHypWWWvh2jAIO5tgzW1anOwWvlL/2K5wgPpToJITbIjcVhp6k2eqYQKnc
         y9dQDTGTIwX4W2XLXzqLvdtCVrMOILWnKyQE4FVI=
Date:   Tue, 20 Jun 2023 19:48:19 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>
Cc:     maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        airlied@gmail.com, daniel@ffwll.ch,
        kieran.bingham+renesas@ideasonboard.com, hjc@rock-chips.com,
        heiko@sntech.de, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 3/3] drm/gem-dma: Unexport drm_gem_dma_vm_ops
Message-ID: <20230620164819.GF26467@pendragon.ideasonboard.com>
References: <20230620121202.28263-1-tzimmermann@suse.de>
 <20230620121202.28263-4-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230620121202.28263-4-tzimmermann@suse.de>
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

On Tue, Jun 20, 2023 at 02:03:23PM +0200, Thomas Zimmermann wrote:
> There are no external users of drm_gem_dma_vm_ops. Unexport the symbol.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/drm_gem_dma_helper.c | 11 +++++------
>  include/drm/drm_gem_dma_helper.h     |  2 --
>  2 files changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c b/drivers/gpu/drm/drm_gem_dma_helper.c
> index e9aa3ac140654..d8a415c3d156c 100644
> --- a/drivers/gpu/drm/drm_gem_dma_helper.c
> +++ b/drivers/gpu/drm/drm_gem_dma_helper.c
> @@ -45,6 +45,11 @@
>   * drm_gem_dma_vmap()). These helpers perform the necessary type conversion.
>   */
>  
> +static const struct vm_operations_struct drm_gem_dma_vm_ops = {
> +	.open = drm_gem_vm_open,
> +	.close = drm_gem_vm_close,
> +};
> +
>  static const struct drm_gem_object_funcs drm_gem_dma_default_funcs = {
>  	.free = drm_gem_dma_object_free,
>  	.print_info = drm_gem_dma_object_print_info,
> @@ -315,12 +320,6 @@ int drm_gem_dma_dumb_create(struct drm_file *file_priv,
>  }
>  EXPORT_SYMBOL_GPL(drm_gem_dma_dumb_create);
>  
> -const struct vm_operations_struct drm_gem_dma_vm_ops = {
> -	.open = drm_gem_vm_open,
> -	.close = drm_gem_vm_close,
> -};
> -EXPORT_SYMBOL_GPL(drm_gem_dma_vm_ops);
> -
>  #ifndef CONFIG_MMU
>  /**
>   * drm_gem_dma_get_unmapped_area - propose address for mapping in noMMU cases
> diff --git a/include/drm/drm_gem_dma_helper.h b/include/drm/drm_gem_dma_helper.h
> index 3877cbf0e927c..88a810f954fce 100644
> --- a/include/drm/drm_gem_dma_helper.h
> +++ b/include/drm/drm_gem_dma_helper.h
> @@ -45,8 +45,6 @@ int drm_gem_dma_vmap(struct drm_gem_dma_object *dma_obj,
>  		     struct iosys_map *map);
>  int drm_gem_dma_mmap(struct drm_gem_dma_object *dma_obj, struct vm_area_struct *vma);
>  
> -extern const struct vm_operations_struct drm_gem_dma_vm_ops;
> -
>  /*
>   * GEM object functions
>   */

-- 
Regards,

Laurent Pinchart
