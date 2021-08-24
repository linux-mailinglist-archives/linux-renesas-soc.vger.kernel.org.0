Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 999053F61B9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Aug 2021 17:33:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238260AbhHXPeI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 24 Aug 2021 11:34:08 -0400
Received: from foss.arm.com ([217.140.110.172]:37364 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238284AbhHXPeH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Aug 2021 11:34:07 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2E9C431B;
        Tue, 24 Aug 2021 08:33:23 -0700 (PDT)
Received: from [10.57.15.112] (unknown [10.57.15.112])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1C6F63F766;
        Tue, 24 Aug 2021 08:33:21 -0700 (PDT)
Subject: Re: [PATCH] iommu/io-pgtable: Abstract iommu_iotlb_gather access
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        kernel test robot <lkp@intel.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <83672ee76f6405c82845a55c148fa836f56fbbc1.1629465282.git.robin.murphy@arm.com>
 <CAMuHMdXL7ZtY8kBx=RHsRy1JECsGPDe+E3SM=--w7bUHMYHFBQ@mail.gmail.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <ad5ae140-6398-a2d2-ed90-2d59cab01f0f@arm.com>
Date:   Tue, 24 Aug 2021 16:33:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXL7ZtY8kBx=RHsRy1JECsGPDe+E3SM=--w7bUHMYHFBQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 2021-08-24 14:55, Geert Uytterhoeven wrote:
> Hi Robin,
> 
> On Fri, Aug 20, 2021 at 3:22 PM Robin Murphy <robin.murphy@arm.com> wrote:
>> Previously io-pgtable merely passed the iommu_iotlb_gather pointer
>> through to helpers, but now it has grown its own direct dereference.
>> This turns out to break the build for !IOMMU_API configs where the
>> structure only has a dummy definition. It will probably also crash
>> drivers who don't use the gather mechanism and simply pass in NULL.
>>
>> Wrap this dereference in a suitable helper which can both be stubbed
>> out for !IOMMU_API and encapsulate a NULL check otherwise.
>>
>> Fixes: 7a7c5badf858 ("iommu: Indicate queued flushes via gather data")
> 
> Is this the right Fixes tag?

Conceptually, yes - that's where the new member was introduced, so 
that's where its accessor should have been introduced as well, had I not 
managed to overlook the structure being conditionally defined and assume 
it didn't need anything special doing. Of course it's not going to make 
much difference in practice since they are immediately adjacent commits 
anyway, but it felt right to point at where I made the fundamental 
mistake rather than where the symptom appeared :)

> The build issue was introduced by:
> Fixes: a8e5f04458c4e496 ("iommu/io-pgtable: Remove non-strict quirk")
> 
>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> 
> Thanks, this fixes the build issues I was seeing.
> 
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks for confirming!

Robin.

> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 
