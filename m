Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 27835383DB
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Jun 2019 07:50:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726671AbfFGFuC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 7 Jun 2019 01:50:02 -0400
Received: from verein.lst.de ([213.95.11.211]:53894 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725772AbfFGFuC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Jun 2019 01:50:02 -0400
Received: by newverein.lst.de (Postfix, from userid 2407)
        id 78FD368C4E; Fri,  7 Jun 2019 07:49:33 +0200 (CEST)
Date:   Fri, 7 Jun 2019 07:49:33 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Christoph Hellwig <hch@lst.de>,
        Robin Murphy <robin.murphy@arm.com>,
        "ulf.hansson@linaro.org" <ulf.hansson@linaro.org>,
        "wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
        "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
        "joro@8bytes.org" <joro@8bytes.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [RFC PATCH v5 3/8] iommu: add a new capable IOMMU_CAP_MERGING
Message-ID: <20190607054933.GA8267@lst.de>
References: <1559733114-4221-1-git-send-email-yoshihiro.shimoda.uh@renesas.com> <1559733114-4221-4-git-send-email-yoshihiro.shimoda.uh@renesas.com> <7dfeb7d8-b777-b4af-d892-2829cd05241b@arm.com> <20190605123808.GA12529@lst.de> <OSAPR01MB3089448A3D44BE61B127AA73D8170@OSAPR01MB3089.jpnprd01.prod.outlook.com> <20190606070059.GI27033@lst.de> <OSAPR01MB3089E3E79B0BDF24610FBEC2D8100@OSAPR01MB3089.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSAPR01MB3089E3E79B0BDF24610FBEC2D8100@OSAPR01MB3089.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jun 07, 2019 at 05:41:56AM +0000, Yoshihiro Shimoda wrote:
> > bool blk_can_use_iommu_merging(struct request_queue *q, struct device *dev)
> > {
> > 	if (!IOMMU_CAN_MERGE_SEGMENTS(dev))
> > 		return false;
> 
> As Robin mentioned, all IOMMUs can merge segments so that we don't need
> this condition, IIUC. However, this should check whether the device is mapped
> on iommu by using device_iommu_mapped().

There are plenty of dma_map_ops based drivers that can't merge segments.
Examples:

 - arch/ia64/sn/pci/pci_dma.c
 - arch/mips/jazz/jazzdma.c
 - arch/sparc/mm/io-unit.c
 - arch/sparc/mm/iommu.c
 - arch/x86/kernel/pci-calgary_64.c

Nevermind the diret mapping, swiotlb and other weirdos.

> 
> > 	blk_queue_virt_boundary(q, IOMMU_PAGE_SIZE(dev));
> > 	blk_queue_max_segment_size(q, IOMMU_MAX_SEGMENT_SIZE(dev));
> 
> By the way, I reported an issue [1] and I'm thinking dima_is_direct() environment
> (especially for swiotlb) is also needed such max_segment_size changes somehow.
> What do you think?
> 
> [1]
> https://marc.info/?l=linux-block&m=155954415603356&w=2

That doesn't seem to be related to the segment merging.  I'll take
a look, but next time please Cc the author of a suspect commit if
you already bisect things.
