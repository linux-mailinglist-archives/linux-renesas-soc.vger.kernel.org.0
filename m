Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 676BD3BBF8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2019 20:46:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388287AbfFJSq0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Jun 2019 14:46:26 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:35456 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S2387643AbfFJSq0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Jun 2019 14:46:26 -0400
Received: (qmail 7256 invoked by uid 2102); 10 Jun 2019 14:46:25 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 10 Jun 2019 14:46:25 -0400
Date:   Mon, 10 Jun 2019 14:46:25 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Christoph Hellwig <hch@lst.de>
cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: How to resolve an issue in swiotlb environment?
In-Reply-To: <20190610123222.GA20985@lst.de>
Message-ID: <Pine.LNX.4.44L0.1906101423200.1560-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, 10 Jun 2019, Christoph Hellwig wrote:

> Hi Yoshihiro,
> 
> sorry for not taking care of this earlier, today is a public holiday
> here and thus I'm not working much over the long weekend.
> 
> On Mon, Jun 10, 2019 at 11:13:07AM +0000, Yoshihiro Shimoda wrote:
> > I have another way to avoid the issue. But it doesn't seem that a good way though...
> > According to the commit that adding blk_queue_virt_boundary() [3],
> > this is needed for vhci_hcd as a workaround so that if we avoid to call it
> > on xhci-hcd driver, the issue disappeared. What do you think?
> > JFYI, I pasted a tentative patch in the end of email [4].
> 
> Oh, I hadn't even look at why USB uses blk_queue_virt_boundary, and it
> seems like the usage is wrong, as it doesn't follow the same rules as
> all the others.  I think your patch goes in the right direction,
> but instead of comparing a hcd name it needs to be keyed of a flag
> set by the driver (I suspect there is one indicating native SG support,
> but I can't quickly find it), and we need an alternative solution
> for drivers that don't see like vhci.  I suspect just limiting the
> entire transfer size to something that works for a single packet
> for them would be fine.

Christoph:

In most of the different kinds of USB host controllers, the hardware is
not capable of assembling a packet out of multiple buffers at arbitrary
addresses.  As a matter of fact, xHCI is the only kind that _can_ do 
this.

In some cases, the hardware can assemble packets provided each buffer
other than the last ends at a page boundary and each buffer other than
the first starts at a page boundary (Intel would say the buffers are
"virtually contiguous"), but this is a rather complex rule and we don't
want to rely on it.  Plus, in other cases the hardware _can't_ do this.

Instead, we want the SG buffers to be set up so that each one (except 
the last) is an exact multiple of the maximum packet size.  That way, 
each packet can be assembled from the contents of a single buffer and 
there's no problem.

The maximum packet size depends on the type of USB connection.  
Typical values are 1024, 512, or 64.  It's always a power of two and
it's smaller than 4096.  Therefore we simplify the problem even further
by requiring that each SG buffer in a scatterlist (except the last one)
be a multiple of the page size.  (It doesn't need to be aligned on a 
page boundary, as far as I remember.)

That's why the blk_queue_virt_boundary usage was added to the USB code.  
Perhaps it's not the right way of doing this; I'm not an expert on the
inner workings of the block layer.  If you can suggest a better way to
express our requirement, that would be great.

Alan Stern

PS: There _is_ a flag saying whether an HCD supports SG.  But what it
means is that the driver can handle an SG list that meets the
requirement above; it doesn't mean that the driver can reassemble the
data from an SG list into a series of bounce buffers in order to meet
the requirement.  We very much want not to do that, especially since
the block layer should already be capable of doing it for us.

