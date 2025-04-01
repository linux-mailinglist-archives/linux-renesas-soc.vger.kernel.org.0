Return-Path: <linux-renesas-soc+bounces-15243-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8FDA77CE0
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Apr 2025 15:54:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD1BE1883EC8
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Apr 2025 13:54:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC2DD1E47A9;
	Tue,  1 Apr 2025 13:53:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C914204597
	for <linux-renesas-soc@vger.kernel.org>; Tue,  1 Apr 2025 13:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743515632; cv=none; b=DSDjHk5q+o2pzqqEyVxKsIE+R4fOKbAJ8jaWlo1pkvdev91SwzTtMTDjWFo3ox6eWNGcv2sYmSh/ohpcyiQf3TRx7ysYL6D6WdfqQxLAv9ZBZLk7rLxl8DPe9s7tfgRO8yeaQjV+73KrGpS0MXAWk1qbI7voUphciM+XzWo4ZLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743515632; c=relaxed/simple;
	bh=AblednFMzMtI+TpOGDymf/ADFvU3J9iD7EBV/bY0aag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=imazA04kaBzYJShzJEuugPrK/PKdVr5K6j2hCcKmiptffvYksEUfEKFmPfh70ZU0iIXuDsGlt9lzldmisoqiHD5egNgB4N3FS8xkU1Uq2sRoQa40gvYqu3uh47yObQEzeLJSVQcCxL2cnM+nHCEoakbeJbHOn4AiimaLBpourAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C1F7C14BF;
	Tue,  1 Apr 2025 06:53:52 -0700 (PDT)
Received: from [10.57.67.199] (unknown [10.57.67.199])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 190D73F778;
	Tue,  1 Apr 2025 06:53:47 -0700 (PDT)
Message-ID: <f72bcfb2-e2a1-4dd4-bedf-241b75178958@arm.com>
Date: Tue, 1 Apr 2025 14:53:35 +0100
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
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <CAMuHMdUtCqwzeWY8G+yHiu4biovymDVb_UtjfYPEQYyYr+dP4Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-03-25 3:26 pm, Geert Uytterhoeven wrote:
> Hi Robin,
> 
> On Thu, 20 Mar 2025 at 15:41, Robin Murphy <robin.murphy@arm.com> wrote:
>> IPMMU registers almost-initialised instances, but misses assigning the
>> drvdata to make them fully functional, so initial calls back into
>> ipmmu_probe_device() are likely to fail unnecessarily. Reorder this to
>> work as it should, also pruning the long-out-of-date comment and adding
>> the missing sysfs cleanup on error for good measure.
>>
>> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
>> Fixes: bcb81ac6ae3c ("iommu: Get DT/ACPI parsing into the proper probe path")
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> 
> Thanks for your patch!
> 
> This fixes the
> 
>      sata_rcar ee300000.sata: late IOMMU probe at driver bind,
> something fishy here!
>      WARNING: CPU: 1 PID: 13 at drivers/iommu/iommu.c:571
> __iommu_probe_device+0x208/0x38c
> 
> I saw on Salvator-XS with R-Car M3-N.
> 
> It does not fix the second issue reported, so it is indeed too early for a
> "Closes: https://lore.kernel.org/CAMuHMdWPFnHTFeeWL2-BU8tKOL-E5K2ROOz=LLBLTJJLCK9NgA@mail.gmail.com"
> tag.

You mean .of_xlate being called multiple times? That's not an issue, 
it's normal and expected. Every time an IOMMU instance registers, it 
triggers a probe of all relevant devices which do not yet have an IOMMU 
- this has never been selective, so if a device is associated with a 
different already-registered IOMMU instance, but does not have a group 
because that instance's .probe_device rejected it, that probe also gets 
tried (and rejected) again.

The core code behaviour has been this way for a very long time, the only 
new thing is that the .of_xlate calls are now in sync with their 
corresponding .probe_device calls (and the latter are also now working 
properly again for fwspec-based ops).

Was it just that, or is there still something functionally amiss?

> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks!

Robin.

>> --- a/drivers/iommu/ipmmu-vmsa.c
>> +++ b/drivers/iommu/ipmmu-vmsa.c
>> @@ -1081,31 +1081,24 @@ static int ipmmu_probe(struct platform_device *pdev)
>>                  }
>>          }
>>
>> +       platform_set_drvdata(pdev, mmu);
> 
> Nit: perhaps insert a blank line here, before the comment below?
> 
>>          /*
>>           * Register the IPMMU to the IOMMU subsystem in the following cases:
>>           * - R-Car Gen2 IPMMU (all devices registered)
>>           * - R-Car Gen3 IPMMU (leaf devices only - skip root IPMMU-MM device)
>>           */
>> -       if (!mmu->features->has_cache_leaf_nodes || !ipmmu_is_root(mmu)) {
>> -               ret = iommu_device_sysfs_add(&mmu->iommu, &pdev->dev, NULL,
>> -                                            dev_name(&pdev->dev));
>> -               if (ret)
>> -                       return ret;
>> +       if (mmu->features->has_cache_leaf_nodes && ipmmu_is_root(mmu))
>> +               return 0;
>>
>> -               ret = iommu_device_register(&mmu->iommu, &ipmmu_ops, &pdev->dev);
>> -               if (ret)
>> -                       return ret;
>> -       }
>> +       ret = iommu_device_sysfs_add(&mmu->iommu, &pdev->dev, NULL, dev_name(&pdev->dev));
>> +       if (ret)
>> +               return ret;
>>
>> -       /*
>> -        * We can't create the ARM mapping here as it requires the bus to have
>> -        * an IOMMU, which only happens when bus_set_iommu() is called in
>> -        * ipmmu_init() after the probe function returns.
>> -        */
>> +       ret = iommu_device_register(&mmu->iommu, &ipmmu_ops, &pdev->dev);
>> +       if (ret)
>> +               iommu_device_sysfs_remove(&mmu->iommu);
>>
>> -       platform_set_drvdata(pdev, mmu);
>> -
>> -       return 0;
>> +       return ret;
>>   }
>>
>>   static void ipmmu_remove(struct platform_device *pdev)
> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 


