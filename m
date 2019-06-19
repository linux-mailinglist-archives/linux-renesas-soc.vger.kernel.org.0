Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9F4174C2B1
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jun 2019 23:05:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726479AbfFSVFu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Jun 2019 17:05:50 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:55446 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726321AbfFSVFu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jun 2019 17:05:50 -0400
Received: (qmail 10848 invoked by uid 2102); 19 Jun 2019 17:05:49 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 19 Jun 2019 17:05:49 -0400
Date:   Wed, 19 Jun 2019 17:05:49 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     shuah <shuah@kernel.org>
cc:     Christoph Hellwig <hch@lst.de>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Oliver Neukum <oneukum@suse.com>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: How to resolve an issue in swiotlb environment?
In-Reply-To: <7a6450cd-7b68-778d-0124-3c21d4616069@kernel.org>
Message-ID: <Pine.LNX.4.44L0.1906191649350.1596-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 19 Jun 2019, shuah wrote:

> I missed a lot of the thread info. and went looking for it and found the
> following summary of the problem:
> 
> ==================
> The issue which prompted the commit this thread is about arose in a
> situation where the block layer set up a scatterlist containing buffer
> sizes something like:
> 
> 	4096 4096 1536 1024
> 
> and the maximum packet size was 1024.  The situation was a little
> unusual, because it involved vhci-hcd (a virtual HCD).  This doesn't
> matter much in normal practice because:
> 
> 	Block devices normally have a block size of 512 bytes or more.
> 	Smaller values are very uncommon.  So scatterlist element sizes
> 	are always divisible by 512.
> 
> 	xHCI is the only USB host controller type with a maximum packet
> 	size larger than 512, and xHCI hardware can do full
> 	scatter-gather so it doesn't care what the buffer sizes are.
> 
> So another approach would be to fix vhci-hcd and then trust that the
> problem won't arise again, for the reasons above.  We would be okay so
> long as nobody tried to use a USB-SCSI device with a block size of 256
> bytes or less.
> ===================
> 
> Out of the summary, the following gives me pause:
> 
> "xHCI hardware can do full scatter-gather so it doesn't care what the
> buffer sizes are."
> 
> vhci-hcd won't be able to count on hardware being able to do full
> scatter-gather. It has to deal with a variety of hardware with
> varying speeds.

Sure.  But you can test whether the server's HCD is able to handle 
scatter-gather transfers, and if it is then you can say that the 
client-side vhci-hcd is able to handle them as well.  Then all you 
would have to do is preserve the scatterlist information describing the 
transfer when you go between the client and the server.

The point is to make sure that the client-side vhci-hcd doesn't claim
to be _less_ capable than the server-side actual HCD.  That's what
leads to the problem described above.

> "We would be okay so long as nobody tried to use a USB-SCSI device with
> a block size of 256 bytes or less."
> 
> At least a USB Storage device, I test with says 512 block size. Can we
> count on not seeing a device with block size <= 256 bytes?

Yes, we can.  In fact, the SCSI core doesn't handle devices with block 
size < 512.

> In any case, I am looking into adding SG support vhci-hci at the moment.
> 
> Looks like the following is the repo, I should be working with?
> 
> git://git.infradead.org/users/hch/misc.git

It doesn't matter.  Your work should end up being independent of 
Christoph's, so you can base it on any repo.

Alan Stern

