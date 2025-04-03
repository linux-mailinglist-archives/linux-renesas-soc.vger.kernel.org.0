Return-Path: <linux-renesas-soc+bounces-15342-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D1D0AA7A811
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Apr 2025 18:37:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 57165188A257
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Apr 2025 16:38:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0A8B23F403;
	Thu,  3 Apr 2025 16:37:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A851E1514F6
	for <linux-renesas-soc@vger.kernel.org>; Thu,  3 Apr 2025 16:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743698272; cv=none; b=T++m5coxNBkAGcgROZXbaRWrm+90ioHfMwy3AgqULGQ1IlpBdGwkyUwzBx/240zz0TyzhAVEHzbAzr1RjKCEQRvimtYd/JPl9lr3ln4zkiRI9e6pmK75rTEfSLU4j7uImG5tIsLApnTAukjuv9DiWNc2qYatDA925ZGW55Szv3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743698272; c=relaxed/simple;
	bh=b5hmLMqhQf/USzetL3WM3B7b9tLiPHJwGUG3zmeWSO8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sGxjSRyA+DsIiDUXB/BrghcpSIerMFAfSdp+DZyKxcGw3576jdE472rEF2iE2WTFr00pNkgUT52tC2MLeff1f5yQoYefzOnlzKAJAv/TYZuhCYu8KH6YX9tWkxuMFZ5LrjdrRNxmOPJ8Z3w+zM+ssGh/ytCRd2yH82FuImRvxFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 41DC4106F;
	Thu,  3 Apr 2025 09:37:51 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E462B3F59E;
	Thu,  3 Apr 2025 09:37:47 -0700 (PDT)
Message-ID: <9944524c-0ec9-450d-9fcc-63b021252182@arm.com>
Date: Thu, 3 Apr 2025 17:37:46 +0100
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/ipmmu-vmsa: Register in a sensible order
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: joro@8bytes.org, will@kernel.org, iommu@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org
References: <53be6667544de65a15415b699e38a9a965692e45.1742481687.git.robin.murphy@arm.com>
 <CAMuHMdUtCqwzeWY8G+yHiu4biovymDVb_UtjfYPEQYyYr+dP4Q@mail.gmail.com>
 <f72bcfb2-e2a1-4dd4-bedf-241b75178958@arm.com>
 <CAMuHMdXYDLUZGxFf6fnsKXg=EA2YkoNwMe8Uv0+Bo3w+4h-dhA@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <CAMuHMdXYDLUZGxFf6fnsKXg=EA2YkoNwMe8Uv0+Bo3w+4h-dhA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/04/2025 3:11 pm, Geert Uytterhoeven wrote:
> Hi Robin,
> 
> On Tue, 1 Apr 2025 at 15:53, Robin Murphy <robin.murphy@arm.com> wrote:
>> On 2025-03-25 3:26 pm, Geert Uytterhoeven wrote:
>>> On Thu, 20 Mar 2025 at 15:41, Robin Murphy <robin.murphy@arm.com> wrote:
>>>> IPMMU registers almost-initialised instances, but misses assigning the
>>>> drvdata to make them fully functional, so initial calls back into
>>>> ipmmu_probe_device() are likely to fail unnecessarily. Reorder this to
>>>> work as it should, also pruning the long-out-of-date comment and adding
>>>> the missing sysfs cleanup on error for good measure.
>>>>
>>>> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
>>>> Fixes: bcb81ac6ae3c ("iommu: Get DT/ACPI parsing into the proper probe path")
>>>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>>>
>>> Thanks for your patch!
>>>
>>> This fixes the
>>>
>>>       sata_rcar ee300000.sata: late IOMMU probe at driver bind,
>>> something fishy here!
>>>       WARNING: CPU: 1 PID: 13 at drivers/iommu/iommu.c:571
>>> __iommu_probe_device+0x208/0x38c
>>>
>>> I saw on Salvator-XS with R-Car M3-N.
>>>
>>> It does not fix the second issue reported, so it is indeed too early for a
>>> "Closes: https://lore.kernel.org/CAMuHMdWPFnHTFeeWL2-BU8tKOL-E5K2ROOz=LLBLTJJLCK9NgA@mail.gmail.com"
>>> tag.
>>
>> You mean .of_xlate being called multiple times? That's not an issue,
>> it's normal and expected. Every time an IOMMU instance registers, it
>> triggers a probe of all relevant devices which do not yet have an IOMMU
>> - this has never been selective, so if a device is associated with a
>> different already-registered IOMMU instance, but does not have a group
>> because that instance's .probe_device rejected it, that probe also gets
>> tried (and rejected) again.
>>
>> The core code behaviour has been this way for a very long time, the only
>> new thing is that the .of_xlate calls are now in sync with their
>> corresponding .probe_device calls (and the latter are also now working
>> properly again for fwspec-based ops).
> 
> Hmm, I started seeing the extra calls only after bcb81ac6ae3c,
> i.e. not since a very long time?

OK, maybe not "very" - there are a lot of pieces in this puzzle that 
have all moved underfoot over time, but the point I was getting at is 
that although fwspec-based drivers *are* only now seeing those extra 
.probe_device calls, the design of the core code has been *trying* to 
make them since at least 3-ish years ago when the last of 
bus_set_iommu() went away.

Conversely though, you should also now *not* be seeing extra calls where 
you weren't looking for them. I bet if you were to build the DMA driver 
as a module and load/unload it a bunch of times, you would have seen 
more repeated calls to .of_xlate/.probe_device, whereas now you 
(correctly) won't.

>> Was it just that, or is there still something functionally amiss?
> 
> That's all for now ;-)

Great!

Thanks,
Robin.

