Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1EF1B458F5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2019 11:41:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727064AbfFNJlL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 14 Jun 2019 05:41:11 -0400
Received: from foss.arm.com ([217.140.110.172]:58030 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727028AbfFNJlL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Jun 2019 05:41:11 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A2482B;
        Fri, 14 Jun 2019 02:41:10 -0700 (PDT)
Received: from [10.1.197.57] (e110467-lin.cambridge.arm.com [10.1.197.57])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A9ADC3F718;
        Fri, 14 Jun 2019 02:42:52 -0700 (PDT)
Subject: Re: [RFC PATCH v6 1/5] iommu: add an exported function to get minimum
 page size for a domain
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        joro@8bytes.org, axboe@kernel.dk, ulf.hansson@linaro.org,
        wsa+renesas@sang-engineering.com
Cc:     linux-renesas-soc@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-block@vger.kernel.org, iommu@lists.linux-foundation.org,
        hch@lst.de
References: <1560421215-10750-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1560421215-10750-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From:   Robin Murphy <robin.murphy@arm.com>
Message-ID: <5e295ec3-39c9-de8a-a649-0aeeb0078ae3@arm.com>
Date:   Fri, 14 Jun 2019 10:41:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1560421215-10750-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 13/06/2019 11:20, Yoshihiro Shimoda wrote:
> This patch adds an exported function to get minimum page size for
> a domain. This patch also modifies similar codes on the iommu.c.

Heh, seeing this gave me a genuine déjà vu moment...

...but it turns out I actually *have* reviewed this patch before :)

https://lore.kernel.org/lkml/05eca601-0264-8141-ceeb-7ef7ad5d5650@arm.com/

Robin.

> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>   drivers/iommu/iommu.c | 18 +++++++++++++++---
>   include/linux/iommu.h |  1 +
>   2 files changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 2a90638..7ed16af 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -280,6 +280,18 @@ iommu_insert_device_resv_regions(struct list_head *dev_resv_regions,
>   	return ret;
>   }
>   
> +/**
> + * iommu_get_minimum_page_size - get minimum page size for a domain
> + * @domain: the domain
> + *
> + * Allow iommu driver to get a minimum page size for a domain.
> + */
> +unsigned long iommu_get_minimum_page_size(struct iommu_domain *domain)
> +{
> +	return 1UL << __ffs(domain->pgsize_bitmap);
> +}
> +EXPORT_SYMBOL_GPL(iommu_get_minimum_page_size);
> +
>   int iommu_get_group_resv_regions(struct iommu_group *group,
>   				 struct list_head *head)
>   {
> @@ -558,7 +570,7 @@ static int iommu_group_create_direct_mappings(struct iommu_group *group,
>   
>   	BUG_ON(!domain->pgsize_bitmap);
>   
> -	pg_size = 1UL << __ffs(domain->pgsize_bitmap);
> +	pg_size = iommu_get_minimum_page_size(domain);
>   	INIT_LIST_HEAD(&mappings);
>   
>   	iommu_get_resv_regions(dev, &mappings);
> @@ -1595,7 +1607,7 @@ int iommu_map(struct iommu_domain *domain, unsigned long iova,
>   		return -EINVAL;
>   
>   	/* find out the minimum page size supported */
> -	min_pagesz = 1 << __ffs(domain->pgsize_bitmap);
> +	min_pagesz = iommu_get_minimum_page_size(domain);
>   
>   	/*
>   	 * both the virtual address and the physical one, as well as
> @@ -1655,7 +1667,7 @@ static size_t __iommu_unmap(struct iommu_domain *domain,
>   		return 0;
>   
>   	/* find out the minimum page size supported */
> -	min_pagesz = 1 << __ffs(domain->pgsize_bitmap);
> +	min_pagesz = iommu_get_minimum_page_size(domain);
>   
>   	/*
>   	 * The virtual address, as well as the size of the mapping, must be
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index 91af22a..7e53b43 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -366,6 +366,7 @@ extern int iommu_request_dma_domain_for_dev(struct device *dev);
>   extern struct iommu_resv_region *
>   iommu_alloc_resv_region(phys_addr_t start, size_t length, int prot,
>   			enum iommu_resv_type type);
> +extern unsigned long iommu_get_minimum_page_size(struct iommu_domain *domain);
>   extern int iommu_get_group_resv_regions(struct iommu_group *group,
>   					struct list_head *head);
>   
> 
