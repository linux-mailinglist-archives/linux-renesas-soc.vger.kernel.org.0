Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF0A141DCA
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2019 09:31:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725962AbfFLHb2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jun 2019 03:31:28 -0400
Received: from verein.lst.de ([213.95.11.211]:57550 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725959AbfFLHb2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jun 2019 03:31:28 -0400
Received: by newverein.lst.de (Postfix, from userid 2407)
        id BC64968AFE; Wed, 12 Jun 2019 09:30:59 +0200 (CEST)
Date:   Wed, 12 Jun 2019 09:30:59 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Christoph Hellwig <hch@lst.de>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: How to resolve an issue in swiotlb environment?
Message-ID: <20190612073059.GA20086@lst.de>
References: <20190611064158.GA20601@lst.de> <Pine.LNX.4.44L0.1906110956510.1535-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.1906110956510.1535-100000@iolanthe.rowland.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

First things first:

Yoshihiro, can you try this git branch?  The new bits are just the three
patches at the end, but they sit on top of a few patches already sent
out to the list, so a branch is probably either:

   git://git.infradead.org/users/hch/misc.git scsi-virt-boundary-fixes

Gitweb:

   http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/scsi-virt-boundary-fixes

And now on to the rest:

> We would like to avoid the extra I/O overhead for host controllers that
> can't handle SG.  In fact, switching to sg_tablesize = 1 would probably
> be considered a regression.

Ok, makes sense.

> >  - set the virt boundary as-is for devices supporting "basic" scatterlist,
> >    although that still assumes they can rejiggle them because for example
> >    you could still get a smaller than expected first segment ala (assuming
> >    a 1024 byte packet size and thus 1023 virt_boundary_mask):
> > 
> >         | 0 .. 511 | 512 .. 1023 | 1024 .. 1535 |
> > 
> >    as the virt_bondary does not guarantee that the first segment is
> >    the same size as all the mid segments.
> 
> But that is exactly the problem we need to solve.

So based on the above I'm a little confused about the actual requirement
again.  Can you still split the SCSI command into multiple URBs?  And
is the boundary for that split still the scatterlist entry as in the
description above?  If so I don't really see how the virt_boundary
helps you at all. as it only guarnatees that in a bio, each subsequent
segment start as the advertised virt_boundary.  It says nothing about
the size of each segment.

> The issue which prompted the commit this thread is about arose in a
> situation where the block layer set up a scatterlist containing buffer
> sizes something like:
> 
> 	4096 4096 1536 1024
> 
> and the maximum packet size was 1024.  The situation was a little 
> unusual, because it involved vhci-hcd (a virtual HCD).  This doesn't 
> matter much in normal practice because:

Thay is someething the virt_boundary prevents.  But could still give
you something like:

	1536 4096 4096 1024

or
	1536 16384 8192 4096 16384 512

> The ->sysdev field points to the device used for DMA mapping.  It is
> often the same as ->controller, but sometimes it is
> ->controller->parent because of the peculiarities of some platforms.

Thanks, taken into account in the above patches!
