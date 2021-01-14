Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E10BC2F633E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Jan 2021 15:38:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729181AbhANOe4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 Jan 2021 09:34:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726175AbhANOe4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Jan 2021 09:34:56 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4915C061575
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Jan 2021 06:34:15 -0800 (PST)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5CB492B3;
        Thu, 14 Jan 2021 15:34:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1610634852;
        bh=83Ph2rjlgF/e3miikWIqHXd4tEO5toklPl+3r1sDHEc=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=sNP0lSbqDCtn6+7LPUs+L8FDrL40yobi0WX7qeUxP4sNzq8Xm8hH1zeEr0wv1TWKn
         8RgXWELDK7kzGZu3lYDSmwTImiBeI2FOIY78ptYqpu3fIjXOWCg8xhgj/3sastrNC3
         rmnmrFIZ/igGa0d8aJ6dUS9BKHxjz+NBJtAS8a5Q=
Reply-To: kieran.bingham+renesas@ideasonboard.com
Subject: Re: [PATCH 2/2] drm/cma-helper: Implement mmap as GEM CMA object
 functions
To:     Thomas Zimmermann <tzimmermann@suse.de>,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        airlied@linux.ie, daniel@ffwll.ch, eric@anholt.net,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     dri-devel@lists.freedesktop.org
References: <20201123115646.11004-1-tzimmermann@suse.de>
 <20201123115646.11004-3-tzimmermann@suse.de>
 <e297b08d-a7ac-a3c8-abdf-bb89bc6810ce@ideasonboard.com>
 <d6b5376d-05c9-bb43-3071-820d675d921e@suse.de>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <d67ce6c5-71f1-ec1e-ca89-db0997f96b61@ideasonboard.com>
Date:   Thu, 14 Jan 2021 14:34:09 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d6b5376d-05c9-bb43-3071-820d675d921e@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Thomas,

On 14/01/2021 13:26, Thomas Zimmermann wrote:
> Hi Kieran
> 
> Am 14.01.21 um 13:51 schrieb Kieran Bingham:
>> Hi Thomas,
>>
>> On 23/11/2020 11:56, Thomas Zimmermann wrote:
>>> The new GEM object function drm_gem_cma_mmap() sets the VMA flags
>>> and offset as in the old implementation and immediately maps in the
>>> buffer's memory pages.
>>>
>>> Changing CMA helpers to use the GEM object function allows for the
>>> removal of the special implementations for mmap and gem_prime_mmap
>>> callbacks. The regular functions drm_gem_mmap() and drm_gem_prime_mmap()
>>> are now used.
>>
>> I've encountered a memory leak regression in our Renesas R-Car DU tests,
>> and git bisection has led me to this patch (as commit f5ca8eb6f9).
>>
>> Running the tests sequentially, while grepping /proc/meminfo for Cma, it
>> is evident that CMA memory is not released, until exhausted and the
>> allocations fail (seen in [0]) shown by the error report:
>>
>>>      self.fbs.append(pykms.DumbFramebuffer(self.card, mode.hdisplay,
>>> mode.vdisplay, "XR24"))
>>> ValueError: DRM_IOCTL_MODE_CREATE_DUMB failed: Cannot allocate memory
>>
>>
>> Failing tests at f5ca8eb6f9 can be seen at [0], while the tests pass
>> successfully [1] on the commit previous to that (bc2532ab7c2):
>>
>> Reverting f5ca8eb6f9 also produces a successful pass [2]
>>
>>   [0] https://paste.ubuntu.com/p/VjPGPgswxR/ # Failed at f5ca8eb6f9
>>   [1] https://paste.ubuntu.com/p/78RRp2WpNR/ # Success at bc2532ab7c2
>>   [2] https://paste.ubuntu.com/p/qJKjZZN2pt/ # Success with revert
>>
>>
>> I don't believe we handle mmap specially in the RCar-DU driver, so I
>> wonder if this issue has hit anyone else as well?
>>
>> Any ideas of a repair without a revert ? Or do we just need to submit a
>> revert?
> 
> I think we might not be setting the VMA ops and therefore not finalize
> the BO correctly. Could you please apply the attched (quick-and-dirty)
> patch and try again?

Thanks for the quick response.

I can confirm the quick-and-dirty patch resolves the issue:
  https://paste.ubuntu.com/p/sKDp3dNvwV/

You can add a
Tested-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

if it stays like that, but I suspect there might be a better place to
initialise the ops rather than in the mmap call itself.

Happy to do further testing as required.

--
Regards

Kieran


> Best regards
> Thomas
> 
>>
>> I've yet to fully understand the implications of the patch below.
>>
>> Thanks
>> -- 
>> Regards
>>
>> Kieran
>>
>>
>>
>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> ---
>>>   drivers/gpu/drm/drm_file.c           |   3 +-
>>>   drivers/gpu/drm/drm_gem_cma_helper.c | 121 +++++++++------------------
>>>   drivers/gpu/drm/pl111/pl111_drv.c    |   2 +-
>>>   drivers/gpu/drm/vc4/vc4_bo.c         |   2 +-
>>>   include/drm/drm_gem_cma_helper.h     |  10 +--
>>>   5 files changed, 44 insertions(+), 94 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
>>> index b50380fa80ce..80886d50d0f1 100644
>>> --- a/drivers/gpu/drm/drm_file.c
>>> +++ b/drivers/gpu/drm/drm_file.c
>>> @@ -113,8 +113,7 @@ bool drm_dev_needs_global_mutex(struct drm_device
>>> *dev)
>>>    * The memory mapping implementation will vary depending on how the
>>> driver
>>>    * manages memory. Legacy drivers will use the deprecated
>>> drm_legacy_mmap()
>>>    * function, modern drivers should use one of the provided
>>> memory-manager
>>> - * specific implementations. For GEM-based drivers this is
>>> drm_gem_mmap(), and
>>> - * for drivers which use the CMA GEM helpers it's drm_gem_cma_mmap().
>>> + * specific implementations. For GEM-based drivers this is
>>> drm_gem_mmap().
>>>    *
>>>    * No other file operations are supported by the DRM userspace API.
>>> Overall the
>>>    * following is an example &file_operations structure::
>>> diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c
>>> b/drivers/gpu/drm/drm_gem_cma_helper.c
>>> index 6a4ef335ebc9..7942cf05cd93 100644
>>> --- a/drivers/gpu/drm/drm_gem_cma_helper.c
>>> +++ b/drivers/gpu/drm/drm_gem_cma_helper.c
>>> @@ -38,6 +38,7 @@ static const struct drm_gem_object_funcs
>>> drm_gem_cma_default_funcs = {
>>>       .print_info = drm_gem_cma_print_info,
>>>       .get_sg_table = drm_gem_cma_get_sg_table,
>>>       .vmap = drm_gem_cma_vmap,
>>> +    .mmap = drm_gem_cma_mmap,
>>>       .vm_ops = &drm_gem_cma_vm_ops,
>>>   };
>>>   @@ -277,62 +278,6 @@ const struct vm_operations_struct
>>> drm_gem_cma_vm_ops = {
>>>   };
>>>   EXPORT_SYMBOL_GPL(drm_gem_cma_vm_ops);
>>>   -static int drm_gem_cma_mmap_obj(struct drm_gem_cma_object *cma_obj,
>>> -                struct vm_area_struct *vma)
>>> -{
>>> -    int ret;
>>> -
>>> -    /*
>>> -     * Clear the VM_PFNMAP flag that was set by drm_gem_mmap(), and
>>> set the
>>> -     * vm_pgoff (used as a fake buffer offset by DRM) to 0 as we
>>> want to map
>>> -     * the whole buffer.
>>> -     */
>>> -    vma->vm_flags &= ~VM_PFNMAP;
>>> -    vma->vm_pgoff = 0;
>>> -
>>> -    ret = dma_mmap_wc(cma_obj->base.dev->dev, vma, cma_obj->vaddr,
>>> -              cma_obj->paddr, vma->vm_end - vma->vm_start);
>>> -    if (ret)
>>> -        drm_gem_vm_close(vma);
>>> -
>>> -    return ret;
>>> -}
>>> -
>>> -/**
>>> - * drm_gem_cma_mmap - memory-map a CMA GEM object
>>> - * @filp: file object
>>> - * @vma: VMA for the area to be mapped
>>> - *
>>> - * This function implements an augmented version of the GEM DRM file
>>> mmap
>>> - * operation for CMA objects: In addition to the usual GEM VMA setup it
>>> - * immediately faults in the entire object instead of using on-demaind
>>> - * faulting. Drivers which employ the CMA helpers should use this
>>> function
>>> - * as their ->mmap() handler in the DRM device file's file_operations
>>> - * structure.
>>> - *
>>> - * Instead of directly referencing this function, drivers should use
>>> the
>>> - * DEFINE_DRM_GEM_CMA_FOPS().macro.
>>> - *
>>> - * Returns:
>>> - * 0 on success or a negative error code on failure.
>>> - */
>>> -int drm_gem_cma_mmap(struct file *filp, struct vm_area_struct *vma)
>>> -{
>>> -    struct drm_gem_cma_object *cma_obj;
>>> -    struct drm_gem_object *gem_obj;
>>> -    int ret;
>>> -
>>> -    ret = drm_gem_mmap(filp, vma);
>>> -    if (ret)
>>> -        return ret;
>>> -
>>> -    gem_obj = vma->vm_private_data;
>>> -    cma_obj = to_drm_gem_cma_obj(gem_obj);
>>> -
>>> -    return drm_gem_cma_mmap_obj(cma_obj, vma);
>>> -}
>>> -EXPORT_SYMBOL_GPL(drm_gem_cma_mmap);
>>> -
>>>   #ifndef CONFIG_MMU
>>>   /**
>>>    * drm_gem_cma_get_unmapped_area - propose address for mapping in
>>> noMMU cases
>>> @@ -500,33 +445,6 @@ drm_gem_cma_prime_import_sg_table(struct
>>> drm_device *dev,
>>>   }
>>>   EXPORT_SYMBOL_GPL(drm_gem_cma_prime_import_sg_table);
>>>   -/**
>>> - * drm_gem_cma_prime_mmap - memory-map an exported CMA GEM object
>>> - * @obj: GEM object
>>> - * @vma: VMA for the area to be mapped
>>> - *
>>> - * This function maps a buffer imported via DRM PRIME into a userspace
>>> - * process's address space. Drivers that use the CMA helpers should
>>> set this
>>> - * as their &drm_driver.gem_prime_mmap callback.
>>> - *
>>> - * Returns:
>>> - * 0 on success or a negative error code on failure.
>>> - */
>>> -int drm_gem_cma_prime_mmap(struct drm_gem_object *obj,
>>> -               struct vm_area_struct *vma)
>>> -{
>>> -    struct drm_gem_cma_object *cma_obj;
>>> -    int ret;
>>> -
>>> -    ret = drm_gem_mmap_obj(obj, obj->size, vma);
>>> -    if (ret < 0)
>>> -        return ret;
>>> -
>>> -    cma_obj = to_drm_gem_cma_obj(obj);
>>> -    return drm_gem_cma_mmap_obj(cma_obj, vma);
>>> -}
>>> -EXPORT_SYMBOL_GPL(drm_gem_cma_prime_mmap);
>>> -
>>>   /**
>>>    * drm_gem_cma_vmap - map a CMA GEM object into the kernel's virtual
>>>    *     address space
>>> @@ -553,6 +471,43 @@ int drm_gem_cma_vmap(struct drm_gem_object *obj,
>>> struct dma_buf_map *map)
>>>   }
>>>   EXPORT_SYMBOL_GPL(drm_gem_cma_vmap);
>>>   +/**
>>> + * drm_gem_cma_mmap - memory-map an exported CMA GEM object
>>> + * @obj: GEM object
>>> + * @vma: VMA for the area to be mapped
>>> + *
>>> + * This function maps a buffer into a userspace process's address
>>> space.
>>> + * In addition to the usual GEM VMA setup it immediately faults in
>>> the entire
>>> + * object instead of using on-demand faulting. Drivers that use the CMA
>>> + * helpers should set this as their &drm_gem_object_funcs.mmap
>>> callback.
>>> + *
>>> + * Returns:
>>> + * 0 on success or a negative error code on failure.
>>> + */
>>> +int drm_gem_cma_mmap(struct drm_gem_object *obj, struct
>>> vm_area_struct *vma)
>>> +{
>>> +    struct drm_gem_cma_object *cma_obj;
>>> +    int ret;
>>> +
>>> +    /*
>>> +     * Clear the VM_PFNMAP flag that was set by drm_gem_mmap(), and
>>> set the
>>> +     * vm_pgoff (used as a fake buffer offset by DRM) to 0 as we
>>> want to map
>>> +     * the whole buffer.
>>> +     */
>>> +    vma->vm_pgoff -= drm_vma_node_start(&obj->vma_node);
>>> +    vma->vm_flags &= ~VM_PFNMAP;
>>> +
>>> +    cma_obj = to_drm_gem_cma_obj(obj);
>>> +
>>> +    ret = dma_mmap_wc(cma_obj->base.dev->dev, vma, cma_obj->vaddr,
>>> +              cma_obj->paddr, vma->vm_end - vma->vm_start);
>>> +    if (ret)
>>> +        drm_gem_vm_close(vma);
>>> +
>>> +    return ret;
>>> +}
>>> +EXPORT_SYMBOL_GPL(drm_gem_cma_mmap);
>>> +
>>>   /**
>>>    * drm_gem_cma_prime_import_sg_table_vmap - PRIME import another
>>> driver's
>>>    *    scatter/gather table and get the virtual address of the buffer
>>> diff --git a/drivers/gpu/drm/pl111/pl111_drv.c
>>> b/drivers/gpu/drm/pl111/pl111_drv.c
>>> index 40e6708fbbe2..e4dcaef6c143 100644
>>> --- a/drivers/gpu/drm/pl111/pl111_drv.c
>>> +++ b/drivers/gpu/drm/pl111/pl111_drv.c
>>> @@ -228,7 +228,7 @@ static const struct drm_driver pl111_drm_driver = {
>>>       .prime_handle_to_fd = drm_gem_prime_handle_to_fd,
>>>       .prime_fd_to_handle = drm_gem_prime_fd_to_handle,
>>>       .gem_prime_import_sg_table = pl111_gem_import_sg_table,
>>> -    .gem_prime_mmap = drm_gem_cma_prime_mmap,
>>> +    .gem_prime_mmap = drm_gem_prime_mmap,
>>>     #if defined(CONFIG_DEBUG_FS)
>>>       .debugfs_init = pl111_debugfs_init,
>>> diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
>>> index 813e6cb3f9af..dc316cb79e00 100644
>>> --- a/drivers/gpu/drm/vc4/vc4_bo.c
>>> +++ b/drivers/gpu/drm/vc4/vc4_bo.c
>>> @@ -782,7 +782,7 @@ int vc4_prime_mmap(struct drm_gem_object *obj,
>>> struct vm_area_struct *vma)
>>>           return -EINVAL;
>>>       }
>>>   -    return drm_gem_cma_prime_mmap(obj, vma);
>>> +    return drm_gem_prime_mmap(obj, vma);
>>>   }
>>>     int vc4_prime_vmap(struct drm_gem_object *obj, struct dma_buf_map
>>> *map)
>>> diff --git a/include/drm/drm_gem_cma_helper.h
>>> b/include/drm/drm_gem_cma_helper.h
>>> index 4680275ab339..0a9711caa3e8 100644
>>> --- a/include/drm/drm_gem_cma_helper.h
>>> +++ b/include/drm/drm_gem_cma_helper.h
>>> @@ -59,7 +59,7 @@ struct drm_gem_cma_object {
>>>           .poll        = drm_poll,\
>>>           .read        = drm_read,\
>>>           .llseek        = noop_llseek,\
>>> -        .mmap        = drm_gem_cma_mmap,\
>>> +        .mmap        = drm_gem_mmap,\
>>>           DRM_GEM_CMA_UNMAPPED_AREA_FOPS \
>>>       }
>>>   @@ -76,9 +76,6 @@ int drm_gem_cma_dumb_create(struct drm_file
>>> *file_priv,
>>>                   struct drm_device *drm,
>>>                   struct drm_mode_create_dumb *args);
>>>   -/* set vm_flags and we can change the VM attribute to other one at
>>> here */
>>> -int drm_gem_cma_mmap(struct file *filp, struct vm_area_struct *vma);
>>> -
>>>   /* allocate physical memory */
>>>   struct drm_gem_cma_object *drm_gem_cma_create(struct drm_device *drm,
>>>                             size_t size);
>>> @@ -101,9 +98,8 @@ struct drm_gem_object *
>>>   drm_gem_cma_prime_import_sg_table(struct drm_device *dev,
>>>                     struct dma_buf_attachment *attach,
>>>                     struct sg_table *sgt);
>>> -int drm_gem_cma_prime_mmap(struct drm_gem_object *obj,
>>> -               struct vm_area_struct *vma);
>>>   int drm_gem_cma_vmap(struct drm_gem_object *obj, struct dma_buf_map
>>> *map);
>>> +int drm_gem_cma_mmap(struct drm_gem_object *obj, struct
>>> vm_area_struct *vma);
>>>     /**
>>>    * DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE - CMA GEM driver operations
>>> @@ -123,7 +119,7 @@ int drm_gem_cma_vmap(struct drm_gem_object *obj,
>>> struct dma_buf_map *map);
>>>       .prime_handle_to_fd    = drm_gem_prime_handle_to_fd, \
>>>       .prime_fd_to_handle    = drm_gem_prime_fd_to_handle, \
>>>       .gem_prime_import_sg_table = drm_gem_cma_prime_import_sg_table, \
>>> -    .gem_prime_mmap        = drm_gem_cma_prime_mmap
>>> +    .gem_prime_mmap        = drm_gem_prime_mmap
>>>     /**
>>>    * DRM_GEM_CMA_DRIVER_OPS - CMA GEM driver operations
>>>
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>
> 

