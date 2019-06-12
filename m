Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0459B424FF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2019 14:07:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406140AbfFLMHY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jun 2019 08:07:24 -0400
Received: from verein.lst.de ([213.95.11.211]:59428 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405914AbfFLMHY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jun 2019 08:07:24 -0400
Received: by newverein.lst.de (Postfix, from userid 2407)
        id 4822868B02; Wed, 12 Jun 2019 14:06:54 +0200 (CEST)
Date:   Wed, 12 Jun 2019 14:06:53 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     Christoph Hellwig <hch@lst.de>,
        Alan Stern <stern@rowland.harvard.edu>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: How to resolve an issue in swiotlb environment?
Message-ID: <20190612120653.GA25285@lst.de>
References: <20190611064158.GA20601@lst.de> <Pine.LNX.4.44L0.1906110956510.1535-100000@iolanthe.rowland.org> <20190612073059.GA20086@lst.de> <1560339966.9728.18.camel@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1560339966.9728.18.camel@suse.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jun 12, 2019 at 01:46:06PM +0200, Oliver Neukum wrote:
> > Thay is someething the virt_boundary prevents.  But could still give
> > you something like:
> > 
> > 	1536 4096 4096 1024
> > 
> > or
> > 	1536 16384 8192 4096 16384 512
> 
> That would kill the driver, if maxpacket were 1024.
> 
> USB has really two kinds of requirements
> 
> 1. What comes from the protocol
> 2. What comes from the HCD
> 
> The protocol wants just multiples of maxpacket. XHCI can satisfy
> that in arbitrary scatter/gather. Other HCs cannot.

We have no real way to enforce that for the other HCs unfortunately.
I can't really think of any better way to handle their limitations
except for setting max_segments to 1 or bounce buffering.
