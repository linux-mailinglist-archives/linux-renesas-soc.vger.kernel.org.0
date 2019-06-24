Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 36FC15022E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2019 08:24:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727177AbfFXGYp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Jun 2019 02:24:45 -0400
Received: from verein.lst.de ([213.95.11.211]:52695 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727649AbfFXGYp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Jun 2019 02:24:45 -0400
Received: by newverein.lst.de (Postfix, from userid 2407)
        id 19E9568AFE; Mon, 24 Jun 2019 08:24:15 +0200 (CEST)
Date:   Mon, 24 Jun 2019 08:24:14 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     ulf.hansson@linaro.org, hch@lst.de, m.szyprowski@samsung.com,
        robin.murphy@arm.com, joro@8bytes.org, axboe@kernel.dk,
        wsa+renesas@sang-engineering.com, linux-mmc@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-block@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC PATCH v7 5/5] mmc: queue: Use bigger segments if DMA MAP
 layer can merge the segments
Message-ID: <20190624062414.GD2989@lst.de>
References: <1561020610-953-1-git-send-email-yoshihiro.shimoda.uh@renesas.com> <1561020610-953-6-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1561020610-953-6-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jun 20, 2019 at 05:50:10PM +0900, Yoshihiro Shimoda wrote:
> When the max_segs of a mmc host is smaller than 512, the mmc
> subsystem tries to use 512 segments if DMA MAP layer can merge
> the segments, and then the mmc subsystem exposes such information
> to the block layer by using blk_queue_can_use_dma_map_merging().
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
>  drivers/mmc/core/queue.c | 35 ++++++++++++++++++++++++++++++++---
>  include/linux/mmc/host.h |  1 +
>  2 files changed, 33 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/mmc/core/queue.c b/drivers/mmc/core/queue.c
> index 92900a0..ab0ecc6 100644
> --- a/drivers/mmc/core/queue.c
> +++ b/drivers/mmc/core/queue.c
> @@ -24,6 +24,8 @@
>  #include "card.h"
>  #include "host.h"
>  
> +#define MMC_DMA_MAP_MERGE_SEGMENTS	512
> +
>  static inline bool mmc_cqe_dcmd_busy(struct mmc_queue *mq)
>  {
>  	/* Allow only 1 DCMD at a time */
> @@ -196,6 +198,12 @@ static void mmc_queue_setup_discard(struct request_queue *q,
>  		blk_queue_flag_set(QUEUE_FLAG_SECERASE, q);
>  }
>  
> +static unsigned int mmc_get_max_segments(struct mmc_host *host)
> +{
> +	return host->can_dma_map_merge ? MMC_DMA_MAP_MERGE_SEGMENTS :
> +					 host->max_segs;

I personally don't like superflous use of ? : if an if would be more
obvious:

	if (host->can_dma_map_merge)
		return MMC_DMA_MAP_MERGE_SEGMENTS;
	return host->max_segs;

but that is really just a nitpick and for the mmc maintainer to decide.

Otherwise looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
