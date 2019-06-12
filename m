Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BDFC6429A8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2019 16:44:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729279AbfFLOoK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jun 2019 10:44:10 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:55692 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S2439873AbfFLOnM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jun 2019 10:43:12 -0400
Received: (qmail 3203 invoked by uid 2102); 12 Jun 2019 10:43:11 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 12 Jun 2019 10:43:11 -0400
Date:   Wed, 12 Jun 2019 10:43:11 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Christoph Hellwig <hch@lst.de>
cc:     Oliver Neukum <oneukum@suse.com>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: How to resolve an issue in swiotlb environment?
In-Reply-To: <20190612120653.GA25285@lst.de>
Message-ID: <Pine.LNX.4.44L0.1906121038210.1557-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 12 Jun 2019, Christoph Hellwig wrote:

> On Wed, Jun 12, 2019 at 01:46:06PM +0200, Oliver Neukum wrote:
> > > Thay is someething the virt_boundary prevents.  But could still give
> > > you something like:
> > > 
> > > 	1536 4096 4096 1024
> > > 
> > > or
> > > 	1536 16384 8192 4096 16384 512
> > 
> > That would kill the driver, if maxpacket were 1024.
> > 
> > USB has really two kinds of requirements
> > 
> > 1. What comes from the protocol
> > 2. What comes from the HCD
> > 
> > The protocol wants just multiples of maxpacket. XHCI can satisfy
> > that in arbitrary scatter/gather. Other HCs cannot.
> 
> We have no real way to enforce that for the other HCs unfortunately.
> I can't really think of any better way to handle their limitations
> except for setting max_segments to 1 or bounce buffering.

Would it be okay to rely on the assumption that USB block devices never 
have block size < 512?  (We could even add code to the driver to 
enforce this, although refusing to handle such devices at all might be 
worse than getting an occasional error.)

As I mentioned before, the only HCD that sometimes ends up with
maxpacket = 1024 but is unable to do full SG is vhci-hcd, and that one
shouldn't be too hard to fix.

Alan Stern

