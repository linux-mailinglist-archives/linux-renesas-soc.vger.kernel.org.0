Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A7145E665
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Jul 2019 16:19:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726574AbfGCOT5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 3 Jul 2019 10:19:57 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:48360 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1725830AbfGCOT5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Jul 2019 10:19:57 -0400
Received: (qmail 2823 invoked by uid 2102); 3 Jul 2019 10:19:56 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 3 Jul 2019 10:19:56 -0400
Date:   Wed, 3 Jul 2019 10:19:56 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
cc:     Greg KH <greg@kroah.com>, shuah <shuah@kernel.org>,
        Suwan Kim <suwan.kim027@gmail.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "usb-storage@lists.one-eyed-alien.net" 
        <usb-storage@lists.one-eyed-alien.net>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>, Christoph Hellwig <hch@lst.de>
Subject: RE: [PATCH v2] usb-storage: Add a limitation for blk_queue_max_hw_sectors()
In-Reply-To: <TYAPR01MB454441748DB5CBCDFCF207D3D8FB0@TYAPR01MB4544.jpnprd01.prod.outlook.com>
Message-ID: <Pine.LNX.4.44L0.1907031015140.1547-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, 3 Jul 2019, Yoshihiro Shimoda wrote:

> > I would really prefer to see a different solution.
> > 
> > The actual problem is that the usb_device and usb_interface structures
> > are supposed to inherit all of their DMA properties from the bus's host
> > controller.  But the existing code copies only the dma_mask and
> > dma_pfn_offset fields in the embedded device structures.  If we copied
> > all of the important DMA fields then this patch wouldn't be needed; the
> > max_sectors value for the request queue would be set up correctly to
> > begin with.
> 
> I'm sorry, but I cannot understand what are important DMA fields.

Probably all of them are important; I don't know.

> IIUC, usb-storage driver should take care of calling blk_queue_ APIs anyway because:
> 
>  - As Christoph mentioned before on the email [1], usb-storage has a special
>    max_sectors quirk for tape and SuperSpeed devices.
>  - Since blk_queue_* APIs don't take device structure pointer, the block layer
>    cannot call any DMA mapping APIs. So, even if any other DMA fields are copied,
>    the behavior is not changed.

Although the blk_queue_* APIs don't take device structure pointers, the
SCSI layer does know about devices.  And since it is the SCSI layer
which creates the request queue, changing the DMA fields should change
the behavior.

However, you are correct that usb-storage has to call the blk_queue_* 
APIs anyway.  So I guess your patch is the right thing to do after all.

Acked-by: Alan Stern <stern@rowland.harvard.edu>

I still think that copying the DMA fields would be a good idea, though.

Alan Stern

> [1]
> https://www.spinics.net/lists/linux-usb/msg181527.html
> 
> What do you think?
> 
> Best regards,
> Yoshihiro Shimoda
> 
> > So what I would like to see is a new subroutine -- perhaps in the
> > driver core -- that copies the DMA fields from one struct device to
> > another.  Then we could call this subroutine in usb_alloc_dev() and
> > usb_set_configuration() instead of copying the information manually.
> > 
> > Greg and Christoph, does that make sense?
> > 
> > Yoshihiro, would you like to write a patch that does this?
> > 
> > Alan Stern

