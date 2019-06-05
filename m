Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 892B535C8B
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2019 14:22:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727735AbfFEMWH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Jun 2019 08:22:07 -0400
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:58976 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727337AbfFEMWG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Jun 2019 08:22:06 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7AD2815A2;
        Wed,  5 Jun 2019 05:22:06 -0700 (PDT)
Received: from [10.1.196.75] (e110467-lin.cambridge.arm.com [10.1.196.75])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DC6753F246;
        Wed,  5 Jun 2019 05:22:04 -0700 (PDT)
Subject: Re: [RFC PATCH v5 3/8] iommu: add a new capable IOMMU_CAP_MERGING
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        ulf.hansson@linaro.org, wsa+renesas@sang-engineering.com,
        hch@lst.de, m.szyprowski@samsung.com, joro@8bytes.org
Cc:     linux-mmc@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-renesas-soc@vger.kernel.org
References: <1559733114-4221-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1559733114-4221-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <7dfeb7d8-b777-b4af-d892-2829cd05241b@arm.com>
Date:   Wed, 5 Jun 2019 13:21:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1559733114-4221-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 05/06/2019 12:11, Yoshihiro Shimoda wrote:
> This patch adds a new capable IOMMU_CAP_MERGING to check whether
> the IOVA would be contiguous strictly if a device requires and
> the IOMMU driver has the capable.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>   drivers/iommu/dma-iommu.c | 26 ++++++++++++++++++++++++--
>   include/linux/iommu.h     |  1 +
>   2 files changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index 034caae..ecf1a04 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -847,11 +847,16 @@ static int iommu_dma_map_sg(struct device *dev, struct scatterlist *sg,
>   	dma_addr_t iova;
>   	size_t iova_len = 0;
>   	unsigned long mask = dma_get_seg_boundary(dev);
> -	int i;
> +	int i, ret;
> +	bool iova_contiguous = false;
>   
>   	if (!(attrs & DMA_ATTR_SKIP_CPU_SYNC))
>   		iommu_dma_sync_sg_for_device(dev, sg, nents, dir);
>   
> +	if (dma_get_iova_contiguous(dev) &&
> +	    iommu_capable(dev->bus, IOMMU_CAP_MERGING))
> +		iova_contiguous = true;
> +
>   	/*
>   	 * Work out how much IOVA space we need, and align the segments to
>   	 * IOVA granules for the IOMMU driver to handle. With some clever
> @@ -867,6 +872,13 @@ static int iommu_dma_map_sg(struct device *dev, struct scatterlist *sg,
>   		sg_dma_len(s) = s_length;
>   		s->offset -= s_iova_off;
>   		s_length = iova_align(iovad, s_length + s_iova_off);
> +		/*
> +		 * Check whether the IOVA would be contiguous strictly if
> +		 * a device requires and the IOMMU driver has the capable.
> +		 */
> +		if (iova_contiguous && i > 0 &&
> +		    (s_iova_off || s->length != s_length))
> +			return 0;
>   		s->length = s_length;
>   
>   		/*
> @@ -902,8 +914,18 @@ static int iommu_dma_map_sg(struct device *dev, struct scatterlist *sg,
>   	if (iommu_map_sg(domain, iova, sg, nents, prot) < iova_len)
>   		goto out_free_iova;
>   
> -	return __finalise_sg(dev, sg, nents, iova);
> +	ret = __finalise_sg(dev, sg, nents, iova);
> +	/*
> +	 * Check whether the sg entry is single if a device requires and
> +	 * the IOMMU driver has the capable.
> +	 */
> +	if (iova_contiguous && ret != 1)
> +		goto out_unmap_sg;

I don't see that just failing really gives this option any value. 
Clearly the MMC driver has to do *something* to handle the failure (plus 
presumably the case of not having IOMMU DMA ops at all), which begs the 
question of why it couldn't just do whatever that is anyway, without all 
this infrastructure. For starters, it would be a far simpler and less 
invasive patch:

	if (dma_map_sg(...) > 1) {
		dma_unmap_sg(...);
		/* split into multiple requests and try again */
	}

But then it would make even more sense to just have the driver be 
proactive about its special requirement in the first place, and simply 
validate the list before it even tries to map it:

	for_each_sg(sgl, sg, n, i)
		if ((i > 0 && sg->offset % PAGE_SIZE) ||
		    (i < n - 1 && sg->length % PAGE_SIZE))
			/* segment will not be mergeable */

For reference, I think v4l2 and possibly some areas of DRM already do 
something vaguely similar to judge whether they get contiguous buffers 
or not.

> +
> +	return ret;
>   
> +out_unmap_sg:
> +	iommu_dma_unmap_sg(dev, sg, nents, dir, attrs);
>   out_free_iova:
>   	iommu_dma_free_iova(cookie, iova, iova_len);
>   out_restore_sg:
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index 91af22a..f971dd3 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -104,6 +104,7 @@ enum iommu_cap {
>   					   transactions */
>   	IOMMU_CAP_INTR_REMAP,		/* IOMMU supports interrupt isolation */
>   	IOMMU_CAP_NOEXEC,		/* IOMMU_NOEXEC flag */
> +	IOMMU_CAP_MERGING,		/* IOMMU supports segments merging */

This isn't a 'capability' of the IOMMU - "segment merging" equates to 
just remapping pages, and there's already a fundamental assumption that 
IOMMUs are capable of that. Plus it's very much a DMA API concept, so 
hardly belongs in the IOMMU API anyway.

All in all, I'm struggling to see the point of this. Although it's not a 
DMA API guarantee, iommu-dma already merges scatterlists as aggressively 
as it is allowed to, and will continue to do so for the foreseeable 
future (since it avoids considerable complication in the IOVA 
allocation), so if you want to make sure iommu_dma_map_sg() merges an 
entire list, just don't give it a non-mergeable list. And if you still 
really really want dma_map_sg() to have a behaviour of "merge to a 
single segment or fail", then that should at least be a DMA API 
attribute, which could in principle be honoured by bounce-buffering 
implementations as well.

And if the problem is really that you're not getting merging because of 
exposing the wrong parameters to the DMA API and/or the block layer, or 
that you just can't quite express your requirement to the block layer in 
the first place, then that should really be tackled at the source rather 
than worked around further down in the stack.

Robin.
