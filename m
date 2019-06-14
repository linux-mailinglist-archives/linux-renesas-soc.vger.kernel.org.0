Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49DCD459A8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2019 11:55:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727620AbfFNJyl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 14 Jun 2019 05:54:41 -0400
Received: from foss.arm.com ([217.140.110.172]:58352 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727191AbfFNJyl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Jun 2019 05:54:41 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5A9CA2B;
        Fri, 14 Jun 2019 02:54:40 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB3343F718;
        Fri, 14 Jun 2019 02:56:22 -0700 (PDT)
Subject: Re: [RFC PATCH v6 3/5] block: add a helper function to merge the
 segments by an IOMMU
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        joro@8bytes.org, axboe@kernel.dk, ulf.hansson@linaro.org,
        wsa+renesas@sang-engineering.com
Cc:     linux-renesas-soc@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-block@vger.kernel.org, iommu@lists.linux-foundation.org,
        hch@lst.de
References: <1560421215-10750-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1560421215-10750-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <039d7388-ed24-c7e7-dd6a-656c719a5ed9@arm.com>
Date:   Fri, 14 Jun 2019 10:54:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1560421215-10750-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 13/06/2019 11:20, Yoshihiro Shimoda wrote:
> This patch adds a helper function whether a queue can merge
> the segments by an IOMMU.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>   block/blk-settings.c   | 28 ++++++++++++++++++++++++++++
>   include/linux/blkdev.h |  2 ++
>   2 files changed, 30 insertions(+)
> 
> diff --git a/block/blk-settings.c b/block/blk-settings.c
> index 45f2c52..4e4e13e 100644
> --- a/block/blk-settings.c
> +++ b/block/blk-settings.c
> @@ -4,9 +4,11 @@
>    */
>   #include <linux/bio.h>
>   #include <linux/blkdev.h>
> +#include <linux/device.h>
>   #include <linux/gcd.h>
>   #include <linux/gfp.h>
>   #include <linux/init.h>
> +#include <linux/iommu.h>
>   #include <linux/jiffies.h>
>   #include <linux/kernel.h>
>   #include <linux/lcm.h>
> @@ -831,6 +833,32 @@ void blk_queue_write_cache(struct request_queue *q, bool wc, bool fua)
>   }
>   EXPORT_SYMBOL_GPL(blk_queue_write_cache);
>   
> +/**
> + * blk_queue_can_use_iommu_merging - configure queue for merging segments.
> + * @q:		the request queue for the device
> + * @dev:	the device pointer for dma
> + *
> + * Tell the block layer about the iommu merging of @q.
> + */
> +bool blk_queue_can_use_iommu_merging(struct request_queue *q,
> +				     struct device *dev)
> +{
> +	struct iommu_domain *domain;
> +
> +	/*
> +	 * If the device DMA is translated by an IOMMU, we can assume
> +	 * the device can merge the segments.
> +	 */
> +	if (!device_iommu_mapped(dev))

Careful here - I think this validates the comment I made when this 
function was introduced, in that that name doesn't necesarily mean what 
it sounds like it might mean - "iommu_mapped" was as close as we managed 
to get to a convenient shorthand for "performs DMA through an 
IOMMU-API-enabled IOMMU". Specifically, it does not imply that 
translation is *currently* active; if you boot with "iommu=pt" or 
equivalent this will still return true even though the device will be 
using direct/SWIOTLB DMA ops without any IOMMU translation.

Robin.

> +		return false;
> +
> +	domain = iommu_get_domain_for_dev(dev);
> +	/* No need to update max_segment_size. see blk_queue_virt_boundary() */
> +	blk_queue_virt_boundary(q, iommu_get_minimum_page_size(domain) - 1);
> +
> +	return true;
> +}
> +
>   static int __init blk_settings_init(void)
>   {
>   	blk_max_low_pfn = max_low_pfn - 1;
> diff --git a/include/linux/blkdev.h b/include/linux/blkdev.h
> index 592669b..4d1f7dc 100644
> --- a/include/linux/blkdev.h
> +++ b/include/linux/blkdev.h
> @@ -1091,6 +1091,8 @@ extern void blk_queue_dma_alignment(struct request_queue *, int);
>   extern void blk_queue_update_dma_alignment(struct request_queue *, int);
>   extern void blk_queue_rq_timeout(struct request_queue *, unsigned int);
>   extern void blk_queue_write_cache(struct request_queue *q, bool enabled, bool fua);
> +extern bool blk_queue_can_use_iommu_merging(struct request_queue *q,
> +					    struct device *dev);
>   
>   /*
>    * Number of physical segments as sent to the device.
> 
