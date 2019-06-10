Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D6D323B514
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 10 Jun 2019 14:32:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389231AbfFJMcu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 10 Jun 2019 08:32:50 -0400
Received: from verein.lst.de ([213.95.11.211]:43628 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389048AbfFJMcu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Jun 2019 08:32:50 -0400
Received: by newverein.lst.de (Postfix, from userid 2407)
        id 4360268B02; Mon, 10 Jun 2019 14:32:22 +0200 (CEST)
Date:   Mon, 10 Jun 2019 14:32:22 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Christoph Hellwig <hch@lst.de>,
        Alan Stern <stern@rowland.harvard.edu>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: How to resolve an issue in swiotlb environment?
Message-ID: <20190610123222.GA20985@lst.de>
References: <OSAPR01MB3089B381AF2F687526E63EEAD8140@OSAPR01MB3089.jpnprd01.prod.outlook.com> <OSAPR01MB3089D50DBDAA6C7D427E72EED8100@OSAPR01MB3089.jpnprd01.prod.outlook.com> <OSAPR01MB3089BCA7CF78D6E4D9C83E1BD8130@OSAPR01MB3089.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSAPR01MB3089BCA7CF78D6E4D9C83E1BD8130@OSAPR01MB3089.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Yoshihiro,

sorry for not taking care of this earlier, today is a public holiday
here and thus I'm not working much over the long weekend.

On Mon, Jun 10, 2019 at 11:13:07AM +0000, Yoshihiro Shimoda wrote:
> I have another way to avoid the issue. But it doesn't seem that a good way though...
> According to the commit that adding blk_queue_virt_boundary() [3],
> this is needed for vhci_hcd as a workaround so that if we avoid to call it
> on xhci-hcd driver, the issue disappeared. What do you think?
> JFYI, I pasted a tentative patch in the end of email [4].

Oh, I hadn't even look at why USB uses blk_queue_virt_boundary, and it
seems like the usage is wrong, as it doesn't follow the same rules as
all the others.  I think your patch goes in the right direction,
but instead of comparing a hcd name it needs to be keyed of a flag
set by the driver (I suspect there is one indicating native SG support,
but I can't quickly find it), and we need an alternative solution
for drivers that don't see like vhci.  I suspect just limiting the
entire transfer size to something that works for a single packet
for them would be fine.
