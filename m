Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65EB03C468
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Jun 2019 08:43:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403883AbfFKGm1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Jun 2019 02:42:27 -0400
Received: from verein.lst.de ([213.95.11.211]:48527 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390485AbfFKGm1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Jun 2019 02:42:27 -0400
Received: by newverein.lst.de (Postfix, from userid 2407)
        id 25AC968B02; Tue, 11 Jun 2019 08:41:59 +0200 (CEST)
Date:   Tue, 11 Jun 2019 08:41:58 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Christoph Hellwig <hch@lst.de>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: How to resolve an issue in swiotlb environment?
Message-ID: <20190611064158.GA20601@lst.de>
References: <20190610123222.GA20985@lst.de> <Pine.LNX.4.44L0.1906101423200.1560-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.1906101423200.1560-100000@iolanthe.rowland.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Alan,

thanks for the explanation.  It seems like what usb wants is to:

 - set sg_tablesize to 1 for devices that can't handle scatterlist at all
 - set the virt boundary as-is for devices supporting "basic" scatterlist,
   although that still assumes they can rejiggle them because for example
   you could still get a smaller than expected first segment ala (assuming
   a 1024 byte packet size and thus 1023 virt_boundary_mask):

        | 0 .. 511 | 512 .. 1023 | 1024 .. 1535 |

   as the virt_bondary does not guarantee that the first segment is
   the same size as all the mid segments.
 - do not set any limit on xhci

But that just goes back to the original problem, and that is that with
swiotlb we are limited in the total dma mapping size, and recent block
layer changes in the way we handle the virt_boundary mean we now build
much larger requests by default.  For SCSI ULDs to take that into
account I need to call dma_max_mapping_size() and use that as the
upper bound for the request size.  My plan is to do that in scsi_lib.c,
but for that we need to expose the actual struct device that the dma
mapping is perfomed on to the scsi layer.  If that device is different
from the sysfs hierchary struct device, which it is for usb the ULDD
needs to scsi_add_host_with_dma and pass the dma device as well.  How
do I get at the dma device (aka the HCDs pci_dev or similar) from
usb-storage/uas?
