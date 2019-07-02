Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 847D45D1B9
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  2 Jul 2019 16:28:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727055AbfGBO2E (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 2 Jul 2019 10:28:04 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:48422 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727049AbfGBO2E (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 Jul 2019 10:28:04 -0400
Received: (qmail 2902 invoked by uid 2102); 2 Jul 2019 10:28:03 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 2 Jul 2019 10:28:03 -0400
Date:   Tue, 2 Jul 2019 10:28:03 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Greg KH <greg@kroah.com>
cc:     shuah <shuah@kernel.org>, Suwan Kim <suwan.kim027@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "usb-storage@lists.one-eyed-alien.net" 
        <usb-storage@lists.one-eyed-alien.net>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>, Christoph Hellwig <hch@lst.de>
Subject: RE: [PATCH v2] usb-storage: Add a limitation for blk_queue_max_hw_sectors()
In-Reply-To: <TYAPR01MB454412603157D6DDCB512092D8F80@TYAPR01MB4544.jpnprd01.prod.outlook.com>
Message-ID: <Pine.LNX.4.44L0.1907021018220.1647-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 2 Jul 2019, Yoshihiro Shimoda wrote:

> Hi Alan, shuah, Suwan,
> 
> > From: Christoph Hellwig, Sent: Monday, June 17, 2019 3:22 PM
> > 
> > On Mon, Jun 17, 2019 at 04:17:43AM +0000, Yoshihiro Shimoda wrote:
> > > Thank you for the comments. So, should I wait for getting rid of the
> > > virt_boundary_mask stuff? If I revise the commit log of this patch,
> > > is it acceptable for v5.2-stable as a workaround? In other words,
> > > I worry about this issue exists on v5.2-stable.
> > 
> > It does exist on 5.2-stable and we should fix it.  I'll plan to resend
> > my series to fix the virt_boundary issues for the other SCSI driver
> > soon, but we'll still need to sort out usb-storage.
> 
> I guess that getting rid of the virt_boundary_mask stuff [1] needs more time.
> So, for v5.2-stable, would you accept my patch as a workaround?
> JFYI, v5.2-rc7 still has this "swiotlb buffer is full" issue.
> 
> [1]
> https://marc.info/?l=linux-kernel&m=156114524808042&w=2

I would really prefer to see a different solution.

The actual problem is that the usb_device and usb_interface structures
are supposed to inherit all of their DMA properties from the bus's host
controller.  But the existing code copies only the dma_mask and
dma_pfn_offset fields in the embedded device structures.  If we copied
all of the important DMA fields then this patch wouldn't be needed; the
max_sectors value for the request queue would be set up correctly to
begin with.

So what I would like to see is a new subroutine -- perhaps in the
driver core -- that copies the DMA fields from one struct device to
another.  Then we could call this subroutine in usb_alloc_dev() and
usb_set_configuration() instead of copying the information manually.

Greg and Christoph, does that make sense?

Yoshihiro, would you like to write a patch that does this?

Alan Stern

