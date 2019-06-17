Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 060FB47A3B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2019 08:54:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726031AbfFQGyC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jun 2019 02:54:02 -0400
Received: from verein.lst.de ([213.95.11.211]:32921 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725778AbfFQGyC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jun 2019 02:54:02 -0400
Received: by newverein.lst.de (Postfix, from userid 2407)
        id F35F768AA6; Mon, 17 Jun 2019 08:53:31 +0200 (CEST)
Date:   Mon, 17 Jun 2019 08:53:31 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Christoph Hellwig <hch@lst.de>,
        "joro@8bytes.org" <joro@8bytes.org>,
        "axboe@kernel.dk" <axboe@kernel.dk>,
        "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [RFC PATCH v6 5/5] mmc: queue: Use bigger segments if IOMMU
 can merge the segments
Message-ID: <20190617065331.GA5456@lst.de>
References: <1560421215-10750-1-git-send-email-yoshihiro.shimoda.uh@renesas.com> <1560421215-10750-6-git-send-email-yoshihiro.shimoda.uh@renesas.com> <20190614072459.GD8420@lst.de> <OSBPR01MB3590FA5DB10D9EF34F551335D8EB0@OSBPR01MB3590.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSBPR01MB3590FA5DB10D9EF34F551335D8EB0@OSBPR01MB3590.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jun 17, 2019 at 06:46:33AM +0000, Yoshihiro Shimoda wrote:
> > can_merge seems a little too generic a name to me.  Maybe can_iommu_merge?
> 
> I'll fix the name. Also, only the device_iommu_mapped() condition wiil cause
> a problem on iommu=pt [1]. So, I'll add another condition here.

Instead of adding another condition here I think we need to properly
abstract it out in the DMA layer.  E.g. have a

unsigned long dma_get_merge_boundary(struct device *dev)
{
	const struct dma_map_ops *ops = get_dma_ops(dev);

	if (!ops || !ops->get_merge_boundary)
		return 0; /* can't merge */
	return ops->get_merge_boundary(dev);
}

and then implement the method in dma-iommu.c.

blk_queue_can_use_iommu_merging then comes:

bool blk_queue_enable_iommu_merging(struct request_queue *q,
		struct device *dev)
{
	unsigned long boundary = dma_get_merge_boundary(dev);

	if (!boundary)
		return false;
	blk_queue_virt_boundary(q, boundary);
	return true;
}
