Return-Path: <linux-renesas-soc+bounces-12244-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 536E8A166DB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Jan 2025 08:05:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D46981887F3B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Jan 2025 07:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE12B188A3B;
	Mon, 20 Jan 2025 07:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="H42Z2l+U"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0561632F3
	for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Jan 2025 07:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737356722; cv=none; b=NhBxne/KLlL+oxijAuHvYH+0f4fDJGd7vRxKmEpf4JLsqxnh2jDEFhjGHrn5SZ1/9tTK97sfhqPQVbcy1KvM2GZSgcv3U+AdpbHWjhIPdEFCyomKaXxn7yR73EGYceawPDzJtL26vxiOLobfJJnItNpxkOLxGIK9flqF6tS5X5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737356722; c=relaxed/simple;
	bh=YHwhOhlln+ZBW4bsRMLXZlhX9KD0bxvWtNvYlkSCv3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tejnwKuTUhiD4jCJg9XijUa10m8TpoNwFX3QIK7rMPmFYDrxknwo8CJCkcOobf2UybOMtLtHgKjxblSlo0SSJpImICHYCLte2cJne2pWLriTTfxfKqgufoDOfV3YbwzWftdRCc6WpphCcWWb8p2ylyD1KULOXHkrOjk8Ii426hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=H42Z2l+U; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Message-ID: <84adda72-24c1-428d-9c55-8bb9ec189584@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737356708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s4k8B9SqdOW/b4nXIri28MHaonby69L1MPYqhyNKUX0=;
	b=H42Z2l+UXNpZWYWEmHERkXyThqLsthOt2Tl1gQlgH7BXsUNxeI/rr3PfiugdYdU7zHqpvq
	dLqd9siDrRP2RNM9ARbxgV6zGEqcH+5CdCKOZz1TBdC0GDysb1JYpX1OOzaYOnjlwgwB22
	siLOW8pFM6wtm6a+laFnQN1GQRPRQXE=
Date: Mon, 20 Jan 2025 15:04:56 +0800
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 25/25] drm/xlnx: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 nouveau@lists.freedesktop.org, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
 intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 Andy Yan <andyshrk@163.com>, Daniel Stone <daniel@fooishbar.org>
References: <e327ad84-b5c9-4480-b873-dc3aca605538@ideasonboard.com>
 <a2bbeb47-2569-4ee0-9265-92bab139bdc6@suse.de>
 <f3833771-fcd7-45dc-9019-1525fef34429@ideasonboard.com>
 <CAMuHMdXxYa+Na3XxpLTy=-eUL_zQ9kAiUKYu-E04u3KWApusSA@mail.gmail.com>
 <xz5ncq67bgmdase2jg3cfvyaxpiwhol2eqpfzow6dqpauvslo5@2w3rw27lhnxo>
 <b97fcd2f-516a-4172-aef3-631418564cfa@linux.dev>
 <ef52dab0-058f-408f-a298-c4b2453a3d2f@ideasonboard.com>
 <f4562dbf-b132-4cfd-8f7e-43cd69f2673f@linux.dev>
 <cf34be39-ce92-4ea5-b548-03008c163d31@ideasonboard.com>
 <8234927e-0d12-4655-813d-8ec94179b737@linux.dev>
 <20250119201443.GB2467@pendragon.ideasonboard.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20250119201443.GB2467@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Hi,

On 2025/1/20 04:14, Laurent Pinchart wrote:
> On Mon, Jan 20, 2025 at 12:26:30AM +0800, Sui Jingfeng wrote:
>> On 2025/1/19 23:22, Tomi Valkeinen wrote:
>>> On 19/01/2025 16:59, Sui Jingfeng wrote:
>>>
>>>>>>> But userspace must be able to continue allocating YUV buffers through
>>>>>>> CREATE_DUMB.
>>>>>> I think, allocating YUV buffers through CREATE_DUMB interface is just
>>>>>> an *abuse* and *misuse* of this API for now.
>>>>>>
>>>>>> Take the NV12 format as an example, NV12 is YUV420 planar format, have
>>>>>> two planar: the Y-planar and the UV-planar. The Y-planar appear first
>>>>>> in memory as an array of unsigned char values. The Y-planar is followed
>>>>>> immediately by the UV-planar, which is also an array of unsigned char
>>>>>> values that contains packed U (Cb) and V (Cr) samples.
>>>>>>
>>>>>> But the 'drm_mode_create_dumb' structure is only intend to provide
>>>>>> descriptions for *one* planar.
>>>>>>
>>>>>> struct drm_mode_create_dumb {
>>>>>>       __u32 height;
>>>>>>       __u32 width;
>>>>>>       __u32 bpp;
>>>>>>       __u32 flags;
>>>>>>       __u32 handle;
>>>>>>       __u32 pitch;
>>>>>>       __u64 size;
>>>>>> };
>>>>>>
>>>>>> An width x height NV12 image takes up width*height*(1 + 1/4 + 1/4)
>>>>>> bytes.
>>>>>>
>>>>>> So we can allocate an *equivalent* sized buffer to store the NV12
>>>>>> raw data.
>>>>>>
>>>>>> Either 'width * (height * 3/2)' where each pixel take up 8 bits,
>>>>>> or just 'with * height' where each pixels take up 12 bits.
>>>>>>
>>>>>> However, all those math are just equivalents description to the original
>>>>>> NV12 format, neither are concrete correct physical description.
>>>>> I don't see the problem. Allocating dumb buffers, if we don't have
>>>>> any heuristics related to RGB behind it, is essentially just
>>>>> allocating a specific amount of memory, defined by width, height and
>>>>> bitsperpixel.
>>>>>
>>>> I think, the problem will be that the 'width', 'height' and 'bpp'
>>>> are originally used to describe one plane. Those three parameters
>>>> has perfectly defined physical semantics.
>>>>
>>>> But with multi planar formats, take NV12 image as an example,
>>>> for a 2×2 square of pixels, there are 4 Y samples but only 1 U
>>>> sample and 1 V sample. This format requires 4x8+1x8+1x8=48 bits
>>>> to store the 2x2 square.
>>>>
>>>> So its depth is 12 bits per pixel (48 / (2 * 2)).
>>>>
>>>> so my problem is that the mentioned 12bpp in this example only
>>>> make sense in mathematics, it doesn't has a good physical
>>>> interpret. Do you agree with me on this technique point?
>>>>
>>>>> If I want to create an NV12 framebuffer, I allocate two dumb
>>>>> buffers, one for Y and one for UV planes, and size them accordingly.
>>>>> And then create the DRM framebuffer with those.
>>>>>
>>>> Then how you fill the value of the 'width', 'height' and 'bpp' of
>>>> each dumb buffers?
>>> For 640x480-NV12:
>>> plane 0: width = 640, height = 480, bpp = 8
>>> plane 1: width = 640 / 2, height = 480 / 2, bpp = 16
>> But i think this should be hardware dependent. The hardware I'm using
>> load NV12  raw data as a whole. I only need to feed gpuva of the backing
>> memory to the hardware register once.
>>
>> Not familiar with your hardware, so I can't talk more on this software
>> design. Perhaps someone know more could have a comment on this.
> Layout of planes in memory is just one hardware constraint, the same way
> we have constraints on alignment and strides. Some devices require the
> planes to be contiguous (likely with some alignment constraints), some
> can work with planes being in discontiguous pieces of memory, and even
> require them to be discontiguous and located in separate DRAM banks.

Right.


>>>> Why not allocate storage for the whole on one shoot?
>>> You can, if you adjust the parameters accordingly. However, if the
>>> strides of the planes are not equal, I guess it might cause problems
>>> on some platforms.
>>>
>>> But I think it's usually simpler to allocate one buffer per plane, and
>>> perhaps even better as it doesn't require as large contiguous memory
>>> area.
>>>
>>>> The modetest in libdrm can be an good example, send it[1] to you as
>>>> an reference.
>>> Right, so modetest already does it successfully. So... What is the issue?
>> But then, the problem will become that it override the 'height' parameter.
>> What's the physical interpretation of the 'height' parameter when creating
>> an NV12 image with the dump API then?
> I wouldn't be too concerned about physical interpretations. Yes, the
> height, width and bpp parameters were likely designed with RGB formats
> in mind. Yes, using DUMB_CREATE for YUV formats is probably something
> that the original authors didn't envision. And yes, from that point of
> view, it could be seen by the original authors as an abuse of the API.
> But I don't think that's a problem as such.

Sometimes there may have 2D GPU or Image Process Unit get involved.
Setting the dimension, the clip window and pitch etc parameters to the
hardware are needed.

The value of bpp affects pitch, bigger pitch may cause the hardware load
more bytes than it should on one line. While the 'height' may affect the
size of the clip window, depend on the calculation method.

But I have no strong opinion toward with this and agree with you in overall.

> An API is just an API. True, it would be nicer if the usage of the ioctl
> parameters was more intuitive for YUV formats, but I believe we could
> still standardize how the existing parameters map to linear scanout YUV
> formats without causing the world to end. As has been said before, lots
> of drivers are using DUMB_CREATE for this purpose, and we can't change
> that.
>
> This doesn't mean we shouldn't work on improving memory allocation, but
> I see that as a separate issue.
>
>> I guess, solving complex problems with simple APIs may see the limitation,
>> sooner or later. But I not very sure and might be wrong. So other peoples
>> can override me words.
>>
>>> Everyone agrees that CREATE_DUMB is not the best ioctl to allocate
>>> buffers, and one can't consider it to work identically across the
>>> platforms. But it's what we have and what has been used for ages.
>> Yeah, your request are not unreasonable. It can be seen as a kind of rigid demand.
>> Since GEM DMA helpers doesn't export an more advanced interface to userspace so far.
>> As a result, drivers that employing GEM DMA has no other choice, but to abuse the
>> dumb buffer API to do allocation for the more complex format buffers.
>>
>> The dumb buffer API doesn't support to specify buffer format, tile status and
>> placement etc. The more advance drivers has been exposed the xxx_create_gem()
>> to user-space. It seems that a few more experienced programmers hint us to
>> create an new ioctl at above thread, so that we can keep employing simple API
>> to do simple things and to suit complex needs with the more advanced APIs.
> I'd really like to explore adding new ioctls to exposure memory
> allocation constraints, and allocating the memory itself from DMA heaps.
>
-- 
Best regards,
Sui


