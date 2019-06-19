Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4ED454B285
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2019 09:00:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725946AbfFSHAl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Jun 2019 03:00:41 -0400
Received: from smtp.domeneshop.no ([194.63.252.55]:37158 "EHLO
        smtp.domeneshop.no" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725892AbfFSHAl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jun 2019 03:00:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org; s=ds201810;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:References:Cc:To:From:Subject; bh=mtBeijaH8+4MCsxKjbZSzCQR/V8w+xE28r8Jq8CJiAE=;
        b=L+Kv1Vzzry4/lykqXWJgy8cWre76BycjLOv2N3vlxPcdu0bX+HLcTox7kLdrR/S4l9uuUelQ+uenSevSdythcCvEm8lBd/jT/5ZdF9Xq9k0RDz7q+bVBk0Z/qimal4yM5s/4pDw5wGks7dqd/dtbmQfjnSrXg0V1tXZi5pHDMT168di2lPPz5zS/L+vW+U2m7gsDQYIaP7d1s/1NQMuzw0d84H0emhy0lAx2ddHcXYbSm8i7IWdtGql1GFVaTYp0q2LSYqvJEFF70ic3tugikvEnGynjjQ472+3BA22iD236svSVsikvs9CWueg+5CHxx/k6sdIld6IrsECADqDuuw==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:53281 helo=[192.168.10.173])
        by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.84_2)
        (envelope-from <noralf@tronnes.org>)
        id 1hdUaE-0002gq-VA; Wed, 19 Jun 2019 09:00:38 +0200
Subject: Re: [PATCH] drm: rcar-du: Replace drm_driver GEM ops with GEM object
 functions
From:   =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        dri-devel@lists.freedesktop.org
References: <20190618131329.30336-1-laurent.pinchart+renesas@ideasonboard.com>
 <6d60ba59-60a2-58b3-c78b-5bd85e3a660b@tronnes.org>
 <20190618163557.GF21105@pendragon.ideasonboard.com>
 <8f0713df-c312-4166-fa4c-1e2356d14441@tronnes.org>
Message-ID: <2792a7c4-1a95-643d-4763-0d62a5dad288@tronnes.org>
Date:   Wed, 19 Jun 2019 09:00:36 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <8f0713df-c312-4166-fa4c-1e2356d14441@tronnes.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org



Den 18.06.2019 19.23, skrev Noralf Trønnes:
> 
> Den 18.06.2019 18.35, skrev Laurent Pinchart:
>> Hi Noralf,
>>
>> On Tue, Jun 18, 2019 at 03:56:19PM +0200, Noralf Trønnes wrote:
>>> Den 18.06.2019 15.13, skrev Laurent Pinchart:
>>>> The recommended way to specify GEM object functions is to provide a
>>>> drm_gem_object_funcs structure instance and set the GEM object to point
>>>> to it. The drm_cma_gem_create_object_default_funcs() function provided
>>>> by the GEM CMA helper does so when creating the GEM object, simplifying
>>>> the driver implementation. Switch to it, and remove the then unneeded
>>>> GEM-related opertions from rcar_du_driver.
>>>
>>> s/opertions/operations/
>>
>> Oops, will fix.
>>
>>>> Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>>> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
>>>> ---
>>>>  drivers/gpu/drm/rcar-du/rcar_du_drv.c | 8 +-------
>>>>  1 file changed, 1 insertion(+), 7 deletions(-)
>>>>
>>>> Daniel, is this what you had in mind ?
>>>>
>>>> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
>>>> index 3e5e835ea2b6..4cbb82009931 100644
>>>> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
>>>> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
>>>> @@ -445,16 +445,10 @@ DEFINE_DRM_GEM_CMA_FOPS(rcar_du_fops);
>>>>  static struct drm_driver rcar_du_driver = {
>>>>  	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_PRIME
>>>>  				| DRIVER_ATOMIC,
>>>> -	.gem_free_object_unlocked = drm_gem_cma_free_object,
>>>> -	.gem_vm_ops		= &drm_gem_cma_vm_ops,
>>>> +	.gem_create_object      = drm_cma_gem_create_object_default_funcs,
>>>>  	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd,
>>>>  	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
>>>> -	.gem_prime_import	= drm_gem_prime_import,
>>>> -	.gem_prime_export	= drm_gem_prime_export,
>>>> -	.gem_prime_get_sg_table	= drm_gem_cma_prime_get_sg_table,
>>>>  	.gem_prime_import_sg_table = drm_gem_cma_prime_import_sg_table,
>>>> -	.gem_prime_vmap		= drm_gem_cma_prime_vmap,
>>>> -	.gem_prime_vunmap	= drm_gem_cma_prime_vunmap,
>>>>  	.gem_prime_mmap		= drm_gem_cma_prime_mmap,
>>>
>>> If you want to pick up yet another recommendation, you can use
>>> drm_gem_prime_mmap here.
>>
>> I compared the two call stacks and they appear similar, even if
>> drm_gem_prime_mmap() leads to a more convoluted code flow. For my
>> information, what's the advantage in using it ?
> 
> It's part of Daniels quest to remove the drm_driver gem callbacks. AFAIU
> drm_gem_prime_mmap() is a stop gap on the way to remove
> drm_driver.gem_prime_mmap. I saw it documented in his recent series:
> [03/59] drm/prime: Update docs
> https://patchwork.freedesktop.org/patch/310608/
> 
> +/**
> + * drm_gem_dmabuf_mmap - dma_buf mmap implementation for GEM
> + * @dma_buf: buffer to be mapped
> + * @vma: virtual address range
> + *
> + * Provides memory mapping for the buffer. This can be used as the
> + * &dma_buf_ops.mmap callback. It just forwards to
> &drm_driver.gem_prime_mmap,
> + * which should be set to drm_gem_prime_mmap().
> + *
> + * FIXME: There's really no point to this wrapper, drivers which need
> anything
> + * else but drm_gem_prime_mmap can roll their own &dma_buf_ops.mmap
> callback.

It hit me that maybe it would have been better to use
drm_gem_prime_mmap() as the default instead of having everyone switch to it:

 int drm_gem_dmabuf_mmap(struct dma_buf *dma_buf, struct vm_area_struct
*vma)
 {
 	struct drm_gem_object *obj = dma_buf->priv;
 	struct drm_device *dev = obj->dev;

 	if (!dev->driver->gem_prime_mmap)
- 		return -ENOSYS;
+ 		return drm_gem_prime_mmap(obj, vma);

 	return dev->driver->gem_prime_mmap(obj, vma);
 }

Noralf.

> + *
> + * Returns 0 on success or a negative error code on failure.
> + */
> 
> Noralf.
> 
>>
>>> Either way:
>>>
>>> Reviewed-by: Noralf Trønnes <noralf@tronnes.org>
>>>
>>>>  	.dumb_create		= rcar_du_dumb_create,
>>>>  	.fops			= &rcar_du_fops,
>>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
