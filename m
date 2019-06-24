Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D80050224
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Jun 2019 08:22:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727398AbfFXGWa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Jun 2019 02:22:30 -0400
Received: from verein.lst.de ([213.95.11.211]:52673 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726351AbfFXGWa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Jun 2019 02:22:30 -0400
Received: by newverein.lst.de (Postfix, from userid 2407)
        id 9127868AFE; Mon, 24 Jun 2019 08:21:57 +0200 (CEST)
Date:   Mon, 24 Jun 2019 08:21:57 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        ulf.hansson@linaro.org, hch@lst.de, robin.murphy@arm.com,
        joro@8bytes.org, axboe@kernel.dk, wsa+renesas@sang-engineering.com,
        linux-mmc@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-block@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC PATCH v7 2/5] iommu/dma: Add a new dma_map_ops of
 get_merge_boundary()
Message-ID: <20190624062157.GB2989@lst.de>
References: <1561020610-953-1-git-send-email-yoshihiro.shimoda.uh@renesas.com> <CGME20190620085043epcas2p1f17aa71e547cf3d2b74dfc0c0dcc5ccb@epcas2p1.samsung.com> <1561020610-953-3-git-send-email-yoshihiro.shimoda.uh@renesas.com> <8bce95ea-93ac-e783-af7c-ec5bfb8e82f6@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8bce95ea-93ac-e783-af7c-ec5bfb8e82f6@samsung.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jun 21, 2019 at 09:59:21AM +0200, Marek Szyprowski wrote:
> Hi,
> 
> On 2019-06-20 10:50, Yoshihiro Shimoda wrote:
> > This patch adds a new dma_map_ops of get_merge_boundary() to
> > expose the DMA merge boundary if the domain type is IOMMU_DOMAIN_DMA.
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> > ---
> >   drivers/iommu/dma-iommu.c | 11 +++++++++++
> >   1 file changed, 11 insertions(+)
> >
> > diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> > index 205d694..9950cb5 100644
> > --- a/drivers/iommu/dma-iommu.c
> > +++ b/drivers/iommu/dma-iommu.c
> > @@ -1091,6 +1091,16 @@ static int iommu_dma_get_sgtable(struct device *dev, struct sg_table *sgt,
> >   	return ret;
> >   }
> >   
> > +static unsigned long iommu_dma_get_merge_boundary(struct device *dev)
> > +{
> > +	struct iommu_domain *domain = iommu_get_dma_domain(dev);
> > +
> > +	if (domain->type != IOMMU_DOMAIN_DMA)
> > +		return 0;	/* can't merge */
> > +
> > +	return (1 << __ffs(domain->pgsize_bitmap)) - 1;
> > +}
> 
> I really wonder if there is any IOMMU, which doesn't support 4KiB pages. 
> Cannot you simply assume that the merge boundary is 4KiB and avoid 
> adding this new API?

No idea if we have one, but I would not be surprised if one shows
up on a system only built to run with 64k pages for example.

Either way the abstraction seems light and self-explanatory, so I see
now reason not to have it even if we assume it would always return
4k, especially as we'd also still need a flag at the dma_map_ops level
to indicate if segement merging is supported at all.
