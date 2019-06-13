Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DF3D44989
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2019 19:21:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727771AbfFMRVs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 Jun 2019 13:21:48 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:60604 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726091AbfFMRVs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Jun 2019 13:21:48 -0400
Received: (qmail 4242 invoked by uid 2102); 13 Jun 2019 13:21:47 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 13 Jun 2019 13:21:47 -0400
Date:   Thu, 13 Jun 2019 13:21:47 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Christoph Hellwig <hch@lst.de>
cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        <gregkh@linuxfoundation.org>, <linux-usb@vger.kernel.org>,
        <usb-storage@lists.one-eyed-alien.net>,
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2] usb-storage: Add a limitation for blk_queue_max_hw_sectors()
In-Reply-To: <20190613171112.GA22155@lst.de>
Message-ID: <Pine.LNX.4.44L0.1906131317210.1307-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, 13 Jun 2019, Christoph Hellwig wrote:

> On Thu, Jun 13, 2019 at 01:06:40PM -0400, Alan Stern wrote:
> > Hmmm.  Would it be easier instead to copy the DMA mapping parameters
> > from us->pusb_dev->bus->sysdev into the SCSI host's parent before
> > calling scsi_add_host()?  That way the correct values would be
> > available from the beginning, so the existing DMA setup would
> > automatically use the correct sizes.
> 
> It would in theory.  But at usb-storage has a special max_sectors quirk
> for tape devices, and as the device type is a per-LU property we'd
> still have to override it in ->slave_configure.

Not just for tape devices.  But that's okay; those max_sectors
overrides have been present for a long time and we can keep them.  
Getting rid of the virt_boundary_mask stuff would still be a big
improvement.

Alan Stern

