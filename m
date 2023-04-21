Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 812126EAC17
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Apr 2023 15:53:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229712AbjDUNxm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 21 Apr 2023 09:53:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229612AbjDUNxl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Apr 2023 09:53:41 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7B73E5251
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Apr 2023 06:53:39 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CE2071480;
        Fri, 21 Apr 2023 06:54:22 -0700 (PDT)
Received: from [10.57.23.51] (unknown [10.57.23.51])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 266323F587;
        Fri, 21 Apr 2023 06:53:38 -0700 (PDT)
Message-ID: <c972e852-7630-5843-fabe-59664361df87@arm.com>
Date:   Fri, 21 Apr 2023 14:53:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] iommu/ipmmu-vmsa: Allow PCIe devices
Content-Language: en-GB
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        joro@8bytes.org, will@kernel.org
Cc:     iommu@lists.linux.dev, linux-renesas-soc@vger.kernel.org
References: <20230421122538.3389336-1-yoshihiro.shimoda.uh@renesas.com>
From:   Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20230421122538.3389336-1-yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 2023-04-21 13:25, Yoshihiro Shimoda wrote:
> Add PCIe devices of R-Car Gen3/4 into devices_allowlist. For a PCI
> device, ipmmu_attach_device() has to avoid enabling uTLB because
> the uTLB has already been enabled by the parent device. Otherwise,
> enable a wrong uTLB ID. Also ipmmu_device_is_allowed() has to
> check whether the parent device is the PCIe host controller or not,
> to use the IOMMU's dma_ops from a PCI device.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>   drivers/iommu/ipmmu-vmsa.c | 21 ++++++++++++++++++++-
>   1 file changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/ipmmu-vmsa.c b/drivers/iommu/ipmmu-vmsa.c
> index 9f64c5c9f5b9..c635c9b192f4 100644
> --- a/drivers/iommu/ipmmu-vmsa.c
> +++ b/drivers/iommu/ipmmu-vmsa.c
> @@ -19,6 +19,7 @@
>   #include <linux/of.h>
>   #include <linux/of_device.h>
>   #include <linux/of_platform.h>
> +#include <linux/pci.h>
>   #include <linux/platform_device.h>
>   #include <linux/sizes.h>
>   #include <linux/slab.h>
> @@ -624,6 +625,10 @@ static int ipmmu_attach_device(struct iommu_domain *io_domain,
>   	if (ret < 0)
>   		return ret;
>   
> +	/* Avoid to enable utlb if this is a PCI device */
> +	if (dev_is_pci(dev))
> +		return 0;

Addressing that "TODO: Reference-count the microTLB..." comment instead 
would be even nicer :)

> +
>   	for (i = 0; i < fwspec->num_ids; ++i)
>   		ipmmu_utlb_enable(domain, fwspec->ids[i]);
>   
> @@ -702,10 +707,14 @@ static const struct soc_device_attribute soc_denylist[] = {
>   };
>   
>   static const char * const devices_allowlist[] = {
> +	"e65d0000.pcie",	/* R-Car Gen4 */
> +	"e65d8000.pcie",	/* R-Car Gen4 */
>   	"ee100000.mmc",
>   	"ee120000.mmc",
>   	"ee140000.mmc",
> -	"ee160000.mmc"
> +	"ee160000.mmc",
> +	"ee800000.pcie",	/* R-Car Gen3 */
> +	"fe000000.pcie",	/* R-Car Gen3 */

This would seem to imply that you have not only an "iommu-map" property 
representing the PCI devices, but also an "iommus" property representing 
that the SoC side of the root complex has its own DMA path to an IOMMU, 
distinct from the traffic coming over the PCI bridge. That can 
occasionally be true (e.g. if the root complex IP includes a standalone 
DMA engine), but more often it's just a mistake.

>   };
>   
>   static bool ipmmu_device_is_allowed(struct device *dev)
> @@ -723,12 +732,22 @@ static bool ipmmu_device_is_allowed(struct device *dev)
>   	if (soc_device_match(soc_denylist))
>   		return false;
>   
> +retry:
>   	/* Check whether this device can work with the IPMMU */
>   	for (i = 0; i < ARRAY_SIZE(devices_allowlist); i++) {
>   		if (!strcmp(dev_name(dev), devices_allowlist[i]))
>   			return true;
>   	}
>   
> +	/*
> +	 * Check whether this device has the parent device like a PCI device
> +	 * except "soc".
> +	 */
> +	if (dev->parent && strcmp(dev_name(dev->parent), "soc")) {
> +		dev = dev->parent;
> +		goto retry;
> +	}

This is the place where a simple dev_is_pci() check would seem ideal.

Thanks,
Robin.

> +
>   	/* Otherwise, do not allow use of IPMMU */
>   	return false;
>   }
