Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C4FB944A84
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2019 20:18:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727116AbfFMSSV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 Jun 2019 14:18:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:53356 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725889AbfFMSSV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Jun 2019 14:18:21 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B49802084D;
        Thu, 13 Jun 2019 18:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560449900;
        bh=UUPjymC9kDajGrf6Y1o5QmQxqZkcGGFGOf881Oi2P7c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Mj/InHz/M4M+7YDI9phQ0DIG8VdygD8QUPunej5bSSU4rFGcDmE4jHNJeEViQxGYN
         xuMJIxmLqPsRFQ8EncILpIvVc/QqtRDjs6f+zfVszunY2mOIk0pY6/xm6RSUVM96XT
         4xYxcFPA1uvSN7C2Tyb1+yI/OVRvRoZl952RVFHc=
Date:   Thu, 13 Jun 2019 20:18:17 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Christoph Hellwig <hch@lst.de>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Oliver Neukum <oneukum@suse.com>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: How to resolve an issue in swiotlb environment?
Message-ID: <20190613181817.GA14548@kroah.com>
References: <20190613073900.GC12093@lst.de>
 <Pine.LNX.4.44L0.1906131306580.1307-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.1906131306580.1307-100000@iolanthe.rowland.org>
User-Agent: Mutt/1.12.0 (2019-05-25)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jun 13, 2019 at 01:16:32PM -0400, Alan Stern wrote:
> On Thu, 13 Jun 2019, Christoph Hellwig wrote:
> 
> > On Wed, Jun 12, 2019 at 10:43:11AM -0400, Alan Stern wrote:
> > > Would it be okay to rely on the assumption that USB block devices never 
> > > have block size < 512?  (We could even add code to the driver to 
> > > enforce this, although refusing to handle such devices at all might be 
> > > worse than getting an occasional error.)
> > 
> > sd.c only supports a few specific sector size, and none of them is
> > < 512 bytes:
> > 
> > 	if (sector_size != 512 &&
> > 	    sector_size != 1024 &&
> > 	    sector_size != 2048 &&
> > 	    sector_size != 4096) {
> > 	    	...
> > 		sdkp->capacity = 0;
> 
> Great!  So all we have to do is fix vhci-hcd.  Then we can remove all 
> the virt_boundary_mask stuff from usb-storage and uas entirely.
> 
> (I'm assuming wireless USB isn't a genuine issue.  As far as I know, it 
> is pretty much abandoned at this point.)

It is, I need to just move it to staging and delete the thing.  I don't
know of any hardware anymore.

thanks,

greg k-h
