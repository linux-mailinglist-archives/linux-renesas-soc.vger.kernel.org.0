Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91CF03F5F6C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 24 Aug 2021 15:46:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237558AbhHXNq4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 24 Aug 2021 09:46:56 -0400
Received: from foss.arm.com ([217.140.110.172]:35908 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237683AbhHXNqz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Aug 2021 09:46:55 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 008941042;
        Tue, 24 Aug 2021 06:46:10 -0700 (PDT)
Received: from [10.57.15.112] (unknown [10.57.15.112])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0F18B3F5A1;
        Tue, 24 Aug 2021 06:46:07 -0700 (PDT)
Subject: Re: [PATCH v4 15/24] iommu/io-pgtable: Remove non-strict quirk
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        suravee.suthikulpanit@amd.com, baolu.lu@linux.intel.com,
        John Garry <john.garry@huawei.com>,
        Doug Anderson <dianders@chromium.org>, rajatja@google.com,
        chenxiang <chenxiang66@hisilicon.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
References: <cover.1628682048.git.robin.murphy@arm.com>
 <155b5c621cd8936472e273a8b07a182f62c6c20d.1628682049.git.robin.murphy@arm.com>
 <CAMuHMdX+VSr0TJabMBNqob0MkD2o0RBNp8E5QYNx0jFucW1Aew@mail.gmail.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <1f7de684-c646-cda9-b246-3712f046f2b0@arm.com>
Date:   Tue, 24 Aug 2021 14:46:02 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdX+VSr0TJabMBNqob0MkD2o0RBNp8E5QYNx0jFucW1Aew@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

On 2021-08-24 14:25, Geert Uytterhoeven wrote:
> Hi Robin,
> 
> On Wed, Aug 11, 2021 at 2:24 PM Robin Murphy <robin.murphy@arm.com> wrote:
>> IO_PGTABLE_QUIRK_NON_STRICT was never a very comfortable fit, since it's
>> not a quirk of the pagetable format itself. Now that we have a more
>> appropriate way to convey non-strict unmaps, though, this last of the
>> non-quirk quirks can also go, and with the flush queue code also now
>> enforcing its own ordering we can have a lovely cleanup all round.
>>
>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> 
> Thanks for your patch, which is now commit a8e5f04458c4e496
> ("iommu/io-pgtable: Remove non-strict quirk") in iommu/next.
> 
>> --- a/drivers/iommu/io-pgtable-arm-v7s.c
>> +++ b/drivers/iommu/io-pgtable-arm-v7s.c
>> @@ -700,14 +700,7 @@ static size_t __arm_v7s_unmap(struct arm_v7s_io_pgtable *data,
>>                                                  ARM_V7S_BLOCK_SIZE(lvl + 1));
>>                                  ptep = iopte_deref(pte[i], lvl, data);
>>                                  __arm_v7s_free_table(ptep, lvl + 1, data);
>> -                       } else if (iop->cfg.quirks & IO_PGTABLE_QUIRK_NON_STRICT) {
>> -                               /*
>> -                                * Order the PTE update against queueing the IOVA, to
>> -                                * guarantee that a flush callback from a different CPU
>> -                                * has observed it before the TLBIALL can be issued.
>> -                                */
>> -                               smp_wmb();
>> -                       } else {
>> +                       } else if (!gather->queued) {
> 
> If CONFIG_IOMMU_API=n:
> 
> error: ‘struct iommu_iotlb_gather’ has no member named ‘queued’
> 
> This can be reproduced using e.g. shmobile_defconfig with
>      CONFIG_IOMMU_SUPPORT=y
>      CONFIG_IOMMU_IO_PGTABLE_ARMV7S=y
> 
> 
>>                                  io_pgtable_tlb_add_page(iop, gather, iova, blk_size);
>>                          }
>>                          iova += blk_size;
> 
>> --- a/drivers/iommu/io-pgtable-arm.c
>> +++ b/drivers/iommu/io-pgtable-arm.c
>> @@ -638,14 +638,7 @@ static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
>>                                  io_pgtable_tlb_flush_walk(iop, iova + i * size, size,
>>                                                            ARM_LPAE_GRANULE(data));
>>                                  __arm_lpae_free_pgtable(data, lvl + 1, iopte_deref(pte, data));
>> -                       } else if (iop->cfg.quirks & IO_PGTABLE_QUIRK_NON_STRICT) {
>> -                               /*
>> -                                * Order the PTE update against queueing the IOVA, to
>> -                                * guarantee that a flush callback from a different CPU
>> -                                * has observed it before the TLBIALL can be issued.
>> -                                */
>> -                               smp_wmb();
>> -                       } else {
>> +                       } else if (!gather->queued) {
> 
> If CONFIG_IOMMU_API=n:
> 
> error: ‘struct iommu_iotlb_gather’ has no member named ‘queued’
> 
> This can be reproduced using e.g. shmobile_defconfig with
>      CONFIG_IOMMU_SUPPORT=y
>      CONFIG_IOMMU_IO_PGTABLE_LPAE=y
> 
>>                                  io_pgtable_tlb_add_page(iop, gather, iova + i * size, size);
>>                          }
>>
> 
> Perhaps "select IOMMU_API" should be added (moved from individual
> drivers) to both IOMMU_IO_PGTABLE_ARMV7S and IOMMU_IO_PGTABLE_LPAE?
> Or iommu_iotlb_gather.queued should not be accessed here, or the
> access wrapped into a static inline helper function with a dummy for
> the CONFIG_IOMMU_API=n case?

Those (and worse) should be fixed by this patch:

https://lore.kernel.org/linux-iommu/83672ee76f6405c82845a55c148fa836f56fbbc1.1629465282.git.robin.murphy@arm.com/

which apparently hasn't made it to -next yet.

Thanks,
Robin.

> 
> Gr{oetje,eeting}s,
> 
>                          Geert
> 
