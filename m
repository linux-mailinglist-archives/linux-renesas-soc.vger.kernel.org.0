Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AB137CA74E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Oct 2023 13:58:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229848AbjJPL6z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Oct 2023 07:58:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232633AbjJPL6w (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Oct 2023 07:58:52 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 30A38F2;
        Mon, 16 Oct 2023 04:58:51 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 616F01FB;
        Mon, 16 Oct 2023 04:59:31 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 698A83F5A1;
        Mon, 16 Oct 2023 04:58:48 -0700 (PDT)
Message-ID: <fffcf35b-0da5-4df5-9224-5ac4e28b5f3a@arm.com>
Date:   Mon, 16 Oct 2023 12:58:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/12] dma-direct: simplify the use atomic pool logic in
 dma_direct_alloc
Content-Language: en-GB
To:     Christoph Hellwig <hch@lst.de>, Greg Ungerer <gerg@linux-m68k.org>,
        iommu@lists.linux.dev
Cc:     Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Conor Dooley <conor@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Wei Fang <wei.fang@nxp.com>,
        Shenwei Wang <shenwei.wang@nxp.com>,
        Clark Wang <xiaoning.wang@nxp.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-m68k@lists.linux-m68k.org, netdev@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
        Jim Quinlan <james.quinlan@broadcom.com>
References: <20231016054755.915155-1-hch@lst.de>
 <20231016054755.915155-8-hch@lst.de>
From:   Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <20231016054755.915155-8-hch@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 16/10/2023 6:47 am, Christoph Hellwig wrote:
> The logic in dma_direct_alloc when to use the atomic pool vs remapping
> grew a bit unreadable.  Consolidate it into a single check, and clean
> up the set_uncached vs remap logic a bit as well.

Reviewed-by: Robin Murphy <robin.murphy@arm.com>

> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>   kernel/dma/direct.c | 25 ++++++++++---------------
>   1 file changed, 10 insertions(+), 15 deletions(-)
> 
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index ec410af1d8a14e..1327d04fa32a25 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -234,27 +234,22 @@ void *dma_direct_alloc(struct device *dev, size_t size,
>   					dma_handle);
>   
>   		/*
> -		 * Otherwise remap if the architecture is asking for it.  But
> -		 * given that remapping memory is a blocking operation we'll
> -		 * instead have to dip into the atomic pools.
> +		 * Otherwise we require the architecture to either be able to
> +		 * mark arbitrary parts of the kernel direct mapping uncached,
> +		 * or remapped it uncached.
>   		 */
> +		set_uncached = IS_ENABLED(CONFIG_ARCH_HAS_DMA_SET_UNCACHED);
>   		remap = IS_ENABLED(CONFIG_DMA_DIRECT_REMAP);
> -		if (remap) {
> -			if (dma_direct_use_pool(dev, gfp))
> -				return dma_direct_alloc_from_pool(dev, size,
> -						dma_handle, gfp);
> -		} else {
> -			if (!IS_ENABLED(CONFIG_ARCH_HAS_DMA_SET_UNCACHED))
> -				return NULL;
> -			set_uncached = true;
> -		}
> +		if (!set_uncached && !remap)
> +			return NULL;
>   	}
>   
>   	/*
> -	 * Decrypting memory may block, so allocate the memory from the atomic
> -	 * pools if we can't block.
> +	 * Remapping or decrypting memory may block, allocate the memory from
> +	 * the atomic pools instead if we aren't allowed block.
>   	 */
> -	if (force_dma_unencrypted(dev) && dma_direct_use_pool(dev, gfp))
> +	if ((remap || force_dma_unencrypted(dev)) &&
> +	    dma_direct_use_pool(dev, gfp))
>   		return dma_direct_alloc_from_pool(dev, size, dma_handle, gfp);
>   
>   	/* we always manually zero the memory once we are done */
