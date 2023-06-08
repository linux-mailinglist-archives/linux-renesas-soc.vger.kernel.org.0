Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64953727567
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  8 Jun 2023 05:03:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233925AbjFHDDh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 7 Jun 2023 23:03:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233906AbjFHDDg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Jun 2023 23:03:36 -0400
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C58A62119;
        Wed,  7 Jun 2023 20:03:33 -0700 (PDT)
Received: from loongson.cn (unknown [10.20.42.43])
        by gateway (Coremail) with SMTP id _____8BxL_ADRYFklFsAAA--.1442S3;
        Thu, 08 Jun 2023 11:03:31 +0800 (CST)
Received: from [10.20.42.43] (unknown [10.20.42.43])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8CxReQBRYFkSFgGAA--.21016S3;
        Thu, 08 Jun 2023 11:03:30 +0800 (CST)
Message-ID: <abc64700-385d-1219-16d1-207abd55fcf2@loongson.cn>
Date:   Thu, 8 Jun 2023 11:03:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm: gem: add an option for supporting the dma-coherent
 hardware.
To:     Maxime Ripard <mripard@kernel.org>
Cc:     Paul Cercueil <paul@crapouillou.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        loongson-kernel@lists.loongnix.cn
References: <20230607053053.345101-1-suijingfeng@loongson.cn>
 <d4378aad1cf179d308068ef6072c5c7ff2bf2502.camel@crapouillou.net>
 <6db23d14-652e-4b13-24cb-bfb92fa3faed@loongson.cn>
 <l343rk4s6mrppjl3vxxvnwc52wlovg6bojduiy3qf5zup5ifzx@7qu7jilrsgn5>
Content-Language: en-US
From:   Sui Jingfeng <suijingfeng@loongson.cn>
Organization: Loongson
In-Reply-To: <l343rk4s6mrppjl3vxxvnwc52wlovg6bojduiy3qf5zup5ifzx@7qu7jilrsgn5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxReQBRYFkSFgGAA--.21016S3
X-CM-SenderInfo: xvxlyxpqjiv03j6o00pqjv00gofq/
X-Coremail-Antispam: 1Uk129KBj93XoW3JFWUKr47uF47Kr4DWr18Xrc_yoWxWF1rpF
        WYgFWjkFWDXr1Fyrn2vw4rZFyYy3yrX398Grn8J34xu3s8Zr92gr47tr1Y9FyDAr1IgF4Y
        v3yq9Fy8WF1DAagCm3ZEXasCq-sJn29KB7ZKAUJUUUUD529EdanIXcx71UUUUU7KY7ZEXa
        sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
        0xBIdaVrnRJUUUPqb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
        IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
        e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
        0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E
        14v26r4UJVWxJr1ln4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6x
        kI12xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v2
        6r1q6rW5McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64
        vIr41lc7I2V7IY0VAS07AlzVAYIcxG8wCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0E
        wIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F4
        0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFyl
        IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxV
        AFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j
        6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jr9N
        sUUUUU=
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On 2023/6/7 20:19, Maxime Ripard wrote:
> On Wed, Jun 07, 2023 at 06:30:01PM +0800, Sui Jingfeng wrote:
>> On 2023/6/7 17:36, Paul Cercueil wrote:
>>> Hi Sui,
>>>
>>> Le mercredi 07 juin 2023 à 13:30 +0800, Sui Jingfeng a écrit :
>>>> The single map_noncoherent member of struct drm_gem_dma_object may
>>>> not
>>>> sufficient for describing the backing memory of the GEM buffer
>>>> object.
>>>>
>>>> Especially on dma-coherent systems, the backing memory is both cached
>>>> coherent for multi-core CPUs and dma-coherent for peripheral device.
>>>> Say architectures like X86-64, LoongArch64, Loongson Mips64, etc.
>>>>
>>>> Whether a peripheral device is dma-coherent or not can be
>>>> implementation-dependent. The single map_noncoherent option is not
>>>> enough
>>>> to reflect real hardware anymore. For example, the Loongson LS3A4000
>>>> CPU
>>>> and LS2K2000/LS2K1000 SoC, peripheral device of such hardware
>>>> platform
>>>> allways snoop CPU's cache. Doing the allocation with
>>>> dma_alloc_coherent
>>>> function is preferred. The return buffer is cached, it should not
>>>> using
>>>> the default write-combine mapping. While with the current implement,
>>>> there
>>>> no way to tell the drm core to reflect this.
>>>>
>>>> This patch adds cached and coherent members to struct
>>>> drm_gem_dma_object.
>>>> which allow driver implements to inform the core. Introducing new
>>>> mappings
>>>> while keeping the original default behavior unchanged.
>>> Did you try to simply set the "dma-coherent" property to the device's
>>> node?
>> But this approach can only be applied for the device driver with DT support.
>>
>> X86-64, Loongson ls3a4000 mips64, Loongson ls3a5000 CPU typically do not
>> have DT support.
>>
>> They using ACPI to pass parameter from the firmware to Linux kernel.
>>
>> You approach will lost the effectiveness on such a case.
> Not really, no. All DT support is doing is setting some generic device
> parameter based on that property, but the infrastructure is very much
> generic and can be used on systems without a DT.
>
>>>   From what I understand if you add that property then Linux will use DMA
>>> coherent memory even though you use dma_alloc_noncoherent() and the
>>> sync_single_for_cpu() / sync_single_for_device() are then NOPs.
>   >
>> Please do not mitigate the problems with confusing method.
> It's not a confusing method, it's one of the two main API to deal with
> DMA buffers. And you might disagree with Paul but there's no need to be
> rude about it.
>
>> This approach not only tend to generate confusion but also
>> implement-dependent and arch-dependent. It's definitely problematic.
>>
>>
>> How does the dma_alloc_coherent/dma_alloc_noncoherent is a ARCH specific
>> thing.
>>
>> Dependent on how does the arch_dma_ops is implemented.
>>
>>
>> The definition of the coherent on different ARCH has different meanings.
>>
>> The definition of the wirte-combine on different ARCH has different
>> meanings.
>>
>>
>> The wirte-combine(uncache acceleration) on mips is non dma-coherent.
> Then MIPS breaks the DMA allocation semantics. A buffer allocated with
> dma_alloc_wc is supposed to be coherent.
>
>> But on arm, It seem that wirte-combine is coherent. (guaranteed by arch
>> implement).
>>
>>
>> I also heard using dma_alloc_coherent  to allocation the buffer for the
>> non-coherent doesn't hurt, but the reverse is not true.
>>
>>
>> But please do not create confusion.
>>
>> software composite is faster because better cacheusing rate and
>>
>> cache is faster to read.
>>
>> It is faster because it is cached, not because it is non-coherent.
>>
>> non-coherent is arch thing and/or driver-side thing,
>>
>> it is a side effect of  using the cached mapping.
> Honestly, it's not clear to me what your point or issue is.
>
> Going back to the description in your commit log, you mention that you
> want to support multiple hardware that might or might not be DMA
> coherent, and thus you want to allocate a buffer with different
> attributes depending on that?
>
> Like, you say that the LS3A4000 has a coherency unit and thus doing the
> allocation with dma_alloc_coherent is preferred. Preferred to what? A WC
> buffer? Why?
>
> A WC buffer is a coherent buffer that is allowed to cache writes.
>
> It doesn't have to, and worst case scenario you're inexactly the same
> case than a dma_alloc_coherent buffer.
>
>> It should left to driver to handle such a side effect. The device
>> driver know their device, so its the device driver's responsibility to
>> maintain the coherency.
> Not really, no. Some driver are used across multiple SoCs and multiple
> arch. It doesn't make any sense to encode this in the driver... which is
> why it's in the DT in the first place, and abstracted away by the DMA
> API. Like, do you really expect the amdgpu driver to know the DMA
> attributes it needs to allocate a buffer from when running from a
> RaspberryPi?
>
>> On loongson platform, we don't need to call
>> drm_fb_dma_sync_non_coherent() function, Its already guaranteed by
>> hardware.
> And mostly guaranteed by dma_alloc_coherent. And if you wanted to call
> it anyway, it would be a nop if the device is declared as coherent
> already.
>
> I think you're thinking about this backward. A buffer has mapping
> attributes, and a device has hardware properties.
>
> The driver (ie, software) will allocate a buffer with some mapping
> attributes, and will assume that they are met in the rest of its code.
> How they are met is an implementation detail of the hardware, and for
> all the driver cares, it doesn't have to match.
>
> You can allocate a WC buffer to use on a non-coherent device and that's
> fine. You can allocate a non-coherent buffer on a coherent device and
> that's fine too. The DMA API will make everything work when it needs to,
> and if the hardware already provides stronger guarantees, then it will
> just skip whatever is redundant.
>
> So you need to write your driver using buffer is the most convenient for
> you, and it's really all that matters at the driver level. But for that
> to work, you need to flag the coherence-ness of your devices properly,
> like Paul suggested.

I seems that you are right, at least at ARM world.

Thanks for you tell me this, I might be wrong, this patch may have small 
problems.

I think I should take more time to investigate this problem.

But I need to do more test before I can reply , thank Paul also.

> Maxime

-- 
Jingfeng

