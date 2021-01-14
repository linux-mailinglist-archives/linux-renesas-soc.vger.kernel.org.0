Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 378EB2F65F0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Jan 2021 17:29:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726891AbhANQ3W (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 Jan 2021 11:29:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726395AbhANQ3V (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Jan 2021 11:29:21 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65617C061574
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Jan 2021 08:28:41 -0800 (PST)
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5DE8A2B3;
        Thu, 14 Jan 2021 17:28:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1610641719;
        bh=nKghQ/mH92OH+mKhVZWSEjmXxLX1Hyb82OzDXoSCnuU=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=ro8JmhLeWvi1lznZHo77cDrsbt6sCf5msmS7+XRoKOvz7zFKRDAQ6an9ARusofR/A
         E1tMMLJpBe/GdWtgSdjDs79wSzBNLPBvljrg/5hRGocQoWP46eQvf7qb6I8M+4xmxT
         ogwC6XxsB2Mn06GZ8lsJYtST5xv8hiXQAIpax2nc=
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
 <d67ce6c5-71f1-ec1e-ca89-db0997f96b61@ideasonboard.com>
 <6afaad84-505a-87e7-a7ce-9f45c9cc79bd@suse.de>
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <fe8c3a4f-24cc-8a78-1162-addadcd0f79e@ideasonboard.com>
Date:   Thu, 14 Jan 2021 16:28:36 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6afaad84-505a-87e7-a7ce-9f45c9cc79bd@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Thomas,

On 14/01/2021 15:15, Thomas Zimmermann wrote:
>>>> On 23/11/2020 11:56, Thomas Zimmermann wrote:
>>>>> The new GEM object function drm_gem_cma_mmap() sets the VMA flags
>>>>> and offset as in the old implementation and immediately maps in the
>>>>> buffer's memory pages.
>>>>>
>>>>> Changing CMA helpers to use the GEM object function allows for the
>>>>> removal of the special implementations for mmap and gem_prime_mmap
>>>>> callbacks. The regular functions drm_gem_mmap() and
>>>>> drm_gem_prime_mmap()
>>>>> are now used.
>>>>
>>>> I've encountered a memory leak regression in our Renesas R-Car DU
>>>> tests,
>>>> and git bisection has led me to this patch (as commit f5ca8eb6f9).
>>>>
>>>> Running the tests sequentially, while grepping /proc/meminfo for
>>>> Cma, it
>>>> is evident that CMA memory is not released, until exhausted and the
>>>> allocations fail (seen in [0]) shown by the error report:
>>>>
>>>>>       self.fbs.append(pykms.DumbFramebuffer(self.card, mode.hdisplay,
>>>>> mode.vdisplay, "XR24"))
>>>>> ValueError: DRM_IOCTL_MODE_CREATE_DUMB failed: Cannot allocate memory
>>>>
>>>>
>>>> Failing tests at f5ca8eb6f9 can be seen at [0], while the tests pass
>>>> successfully [1] on the commit previous to that (bc2532ab7c2):
>>>>
>>>> Reverting f5ca8eb6f9 also produces a successful pass [2]
>>>>
>>>>    [0] https://paste.ubuntu.com/p/VjPGPgswxR/ # Failed at f5ca8eb6f9
>>>>    [1] https://paste.ubuntu.com/p/78RRp2WpNR/ # Success at bc2532ab7c2
>>>>    [2] https://paste.ubuntu.com/p/qJKjZZN2pt/ # Success with revert
>>>>
>>>>
>>>> I don't believe we handle mmap specially in the RCar-DU driver, so I
>>>> wonder if this issue has hit anyone else as well?
>>>>
>>>> Any ideas of a repair without a revert ? Or do we just need to submit a
>>>> revert?
>>>
>>> I think we might not be setting the VMA ops and therefore not finalize
>>> the BO correctly. Could you please apply the attched (quick-and-dirty)
>>> patch and try again?
>>
>> Thanks for the quick response.
>>
>> I can confirm the quick-and-dirty patch resolves the issue:
>>    https://paste.ubuntu.com/p/sKDp3dNvwV/
>>
>> You can add a
>> Tested-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> Great! If you don't mind, I'd also add you in the Reported-by tag.

Certainly!

>>
>> if it stays like that, but I suspect there might be a better place to
>> initialise the ops rather than in the mmap call itself.
> 
> I think that's the fix, basically. We could put such a line as a
> fall-back somewhere into the DRM core code. But I don't know if this
> really works with all drivers. Maybe there's one that requires vm_ops to
> be NULL.

Ok, that's reaching beyond code I've explored, so I'll leave it to you.


> Thanks for reporting this issue and testing quickly.

Thanks for fixing so quickly :-)

Regards

Kieran
