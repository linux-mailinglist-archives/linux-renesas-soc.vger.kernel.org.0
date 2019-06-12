Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45A5042402
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2019 13:32:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406555AbfFLLbb (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jun 2019 07:31:31 -0400
Received: from verein.lst.de ([213.95.11.211]:59152 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727352AbfFLLbb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jun 2019 07:31:31 -0400
Received: by newverein.lst.de (Postfix, from userid 2407)
        id D62C068B02; Wed, 12 Jun 2019 13:31:02 +0200 (CEST)
Date:   Wed, 12 Jun 2019 13:31:02 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Christoph Hellwig <hch@lst.de>,
        Alan Stern <stern@rowland.harvard.edu>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: How to resolve an issue in swiotlb environment?
Message-ID: <20190612113102.GA24742@lst.de>
References: <20190611064158.GA20601@lst.de> <Pine.LNX.4.44L0.1906110956510.1535-100000@iolanthe.rowland.org> <20190612073059.GA20086@lst.de> <OSAPR01MB3089D154C6DF0237003CE80CD8EC0@OSAPR01MB3089.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSAPR01MB3089D154C6DF0237003CE80CD8EC0@OSAPR01MB3089.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jun 12, 2019 at 08:52:21AM +0000, Yoshihiro Shimoda wrote:
> Hi Christoph,
> 
> > From: Christoph Hellwig, Sent: Wednesday, June 12, 2019 4:31 PM
> > 
> > First things first:
> > 
> > Yoshihiro, can you try this git branch?  The new bits are just the three
> > patches at the end, but they sit on top of a few patches already sent
> > out to the list, so a branch is probably either:
> > 
> >    git://git.infradead.org/users/hch/misc.git scsi-virt-boundary-fixes
> 
> Thank you for the patches!
> Unfortunately, the three patches could not resolve this issue.
> However, it's a hint to me, and then I found the root cause:
>  - slave_configure() in drivers/usb/storage/scsiglue.c calls
>    blk_queue_max_hw_sectors() with 2048 sectors (1 MiB) when USB_SPEED_SUPER or more.
>  -- So that, even if your patches (also I fixed it a little [1]) could not resolve
>     the issue because the max_sectors is overwritten by above code.
> 
> So, I think we should fix the slave_configure() by using dma_max_mapping_size().
> What do you think? If so, I can make such a patch.

Yes, please do.
