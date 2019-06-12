Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC9C8424A4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jun 2019 13:47:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726384AbfFLLqr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jun 2019 07:46:47 -0400
Received: from mx2.suse.de ([195.135.220.15]:40730 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726167AbfFLLqr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jun 2019 07:46:47 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 15D42AE5A;
        Wed, 12 Jun 2019 11:46:46 +0000 (UTC)
Message-ID: <1560339966.9728.18.camel@suse.com>
Subject: Re: How to resolve an issue in swiotlb environment?
From:   Oliver Neukum <oneukum@suse.com>
To:     Christoph Hellwig <hch@lst.de>,
        Alan Stern <stern@rowland.harvard.edu>
Cc:     "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Date:   Wed, 12 Jun 2019 13:46:06 +0200
In-Reply-To: <20190612073059.GA20086@lst.de>
References: <20190611064158.GA20601@lst.de>
         <Pine.LNX.4.44L0.1906110956510.1535-100000@iolanthe.rowland.org>
         <20190612073059.GA20086@lst.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Am Mittwoch, den 12.06.2019, 09:30 +0200 schrieb Christoph Hellwig:
> 
> So based on the above I'm a little confused about the actual requirement
> again.  Can you still split the SCSI command into multiple URBs?  And

Yes. The device sees only a number of packets over the wire. They can
come from an arbitrary number of URBs with the two restrictions that
- we cannot split a packet among URBs
- every packet but the last must be a multiple of maxpacket

> is the boundary for that split still the scatterlist entry as in the
> description above?  If so I don't really see how the virt_boundary
> helps you at all. as it only guarnatees that in a bio, each subsequent
> segment start as the advertised virt_boundary.  It says nothing about
> the size of each segment.

That is problematic.

> Thay is someething the virt_boundary prevents.  But could still give
> you something like:
> 
> 	1536 4096 4096 1024
> 
> or
> 	1536 16384 8192 4096 16384 512

That would kill the driver, if maxpacket were 1024.

USB has really two kinds of requirements

1. What comes from the protocol
2. What comes from the HCD

The protocol wants just multiples of maxpacket. XHCI can satisfy
that in arbitrary scatter/gather. Other HCs cannot.

	Regards
		Oliver

