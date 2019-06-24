Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8830C50227
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2019 08:23:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727552AbfFXGXZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Jun 2019 02:23:25 -0400
Received: from verein.lst.de ([213.95.11.211]:52684 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727528AbfFXGXZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Jun 2019 02:23:25 -0400
Received: by newverein.lst.de (Postfix, from userid 2407)
        id 84C0868AFE; Mon, 24 Jun 2019 08:22:53 +0200 (CEST)
Date:   Mon, 24 Jun 2019 08:22:53 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     ulf.hansson@linaro.org, hch@lst.de, m.szyprowski@samsung.com,
        robin.murphy@arm.com, joro@8bytes.org, axboe@kernel.dk,
        wsa+renesas@sang-engineering.com, linux-mmc@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-block@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC PATCH v7 4/5] block: add a helper function to merge the
 segments
Message-ID: <20190624062253.GC2989@lst.de>
References: <1561020610-953-1-git-send-email-yoshihiro.shimoda.uh@renesas.com> <1561020610-953-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1561020610-953-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

> +bool blk_queue_can_use_dma_map_merging(struct request_queue *q,
> +				       struct device *dev)
> +{
> +	unsigned long boundary = dma_get_merge_boundary(dev);
> +
> +	if (!boundary)
> +		return false;
> +
> +	/* No need to update max_segment_size. see blk_queue_virt_boundary() */
> +	blk_queue_virt_boundary(q, boundary);
> +
> +	return true;

I'd skip that empty line here, but that is way into nitpick territory.

Otherwise looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
