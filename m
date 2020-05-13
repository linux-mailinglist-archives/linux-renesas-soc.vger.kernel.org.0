Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13AE71D177C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 May 2020 16:23:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388894AbgEMOXL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 May 2020 10:23:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388788AbgEMOXL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 May 2020 10:23:11 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E307C061A0C;
        Wed, 13 May 2020 07:23:11 -0700 (PDT)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6D87851F;
        Wed, 13 May 2020 16:23:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1589379788;
        bh=5O0na2DMiyEwLbl3btgk9akjCBMQkQ7SFKipuPV1wEA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pH1mj81La2wuE/YKdMXdaFC6dPVPCdpdSi0cuzqw8PjTHID3iK73wYjzUCAE4HvrR
         zN4hlCqtr1aD6xyomzlUiZrk1MQX1W3Bf9lN5A5B5od6IilQufrh8/enV5IVqdJkjO
         bB3T1akcTlxGSYFdE9fzoJ30Xmff9mcari/gTrDc=
Date:   Wed, 13 May 2020 17:23:02 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
        Christoph Hellwig <hch@lst.de>,
        Robin Murphy <robin.murphy@arm.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH v5 29/38] drm: rcar-du: fix common struct sg_table
 related issues
Message-ID: <20200513142302.GK5945@pendragon.ideasonboard.com>
References: <20200513132114.6046-1-m.szyprowski@samsung.com>
 <20200513133245.6408-1-m.szyprowski@samsung.com>
 <CGME20200513133317eucas1p27aead4025db2da13e5b7c3e14a7cd79d@eucas1p2.samsung.com>
 <20200513133245.6408-29-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200513133245.6408-29-m.szyprowski@samsung.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Marek,

Thank you for the patch.

On Wed, May 13, 2020 at 03:32:36PM +0200, Marek Szyprowski wrote:
> The Documentation/DMA-API-HOWTO.txt states that the dma_map_sg() function
> returns the number of the created entries in the DMA address space.
> However the subsequent calls to the dma_sync_sg_for_{device,cpu}() and
> dma_unmap_sg must be called with the original number of the entries
> passed to the dma_map_sg().
> 
> struct sg_table is a common structure used for describing a non-contiguous
> memory buffer, used commonly in the DRM and graphics subsystems. It
> consists of a scatterlist with memory pages and DMA addresses (sgl entry),
> as well as the number of scatterlist entries: CPU pages (orig_nents entry)
> and DMA mapped pages (nents entry).
> 
> It turned out that it was a common mistake to misuse nents and orig_nents
> entries, calling DMA-mapping functions with a wrong number of entries or
> ignoring the number of mapped entries returned by the dma_map_sg()
> function.
> 
> To avoid such issues, lets use a common dma-mapping wrappers operating
> directly on the struct sg_table objects and use scatterlist page
> iterators where possible. This, almost always, hides references to the
> nents and orig_nents entries, making the code robust, easier to follow
> and copy/paste safe.
> 
> dma_map_sgtable() function returns zero or an error code, so adjust the
> return value check for the vsp1_du_map_sg() function.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

This is a very nice simplification, I've always foudn the dma_map_sg API
cumbersome to use.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I assume you will get the whole series merged in one go. If I need to
pick the patch up at any point, please let me know. Otherwise I'll wait
until I see it upstream, no reply needed :-)

> ---
> For more information, see '[PATCH v5 00/38] DRM: fix struct sg_table nents
> vs. orig_nents misuse' thread:
> https://lore.kernel.org/linux-iommu/20200513132114.6046-1-m.szyprowski@samsung.com/T/
> ---
>  drivers/gpu/drm/rcar-du/rcar_du_vsp.c  | 3 +--
>  drivers/media/platform/vsp1/vsp1_drm.c | 8 ++++----
>  2 files changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> index 5e4faf2..2fc1816 100644
> --- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> +++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
> @@ -197,9 +197,8 @@ int rcar_du_vsp_map_fb(struct rcar_du_vsp *vsp, struct drm_framebuffer *fb,
>  			goto fail;
>  
>  		ret = vsp1_du_map_sg(vsp->vsp, sgt);
> -		if (!ret) {
> +		if (ret) {
>  			sg_free_table(sgt);
> -			ret = -ENOMEM;
>  			goto fail;
>  		}
>  	}
> diff --git a/drivers/media/platform/vsp1/vsp1_drm.c b/drivers/media/platform/vsp1/vsp1_drm.c
> index a4a45d6..86d5e3f 100644
> --- a/drivers/media/platform/vsp1/vsp1_drm.c
> +++ b/drivers/media/platform/vsp1/vsp1_drm.c
> @@ -912,8 +912,8 @@ int vsp1_du_map_sg(struct device *dev, struct sg_table *sgt)
>  	 * skip cache sync. This will need to be revisited when support for
>  	 * non-coherent buffers will be added to the DU driver.
>  	 */
> -	return dma_map_sg_attrs(vsp1->bus_master, sgt->sgl, sgt->nents,
> -				DMA_TO_DEVICE, DMA_ATTR_SKIP_CPU_SYNC);
> +	return dma_map_sgtable(vsp1->bus_master, sgt, DMA_TO_DEVICE,
> +			       DMA_ATTR_SKIP_CPU_SYNC);
>  }
>  EXPORT_SYMBOL_GPL(vsp1_du_map_sg);
>  
> @@ -921,8 +921,8 @@ void vsp1_du_unmap_sg(struct device *dev, struct sg_table *sgt)
>  {
>  	struct vsp1_device *vsp1 = dev_get_drvdata(dev);
>  
> -	dma_unmap_sg_attrs(vsp1->bus_master, sgt->sgl, sgt->nents,
> -			   DMA_TO_DEVICE, DMA_ATTR_SKIP_CPU_SYNC);
> +	dma_unmap_sgtable(vsp1->bus_master, sgt, DMA_TO_DEVICE,
> +			  DMA_ATTR_SKIP_CPU_SYNC);
>  }
>  EXPORT_SYMBOL_GPL(vsp1_du_unmap_sg);
>  

-- 
Regards,

Laurent Pinchart
