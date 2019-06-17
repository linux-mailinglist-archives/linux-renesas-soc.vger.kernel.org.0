Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BFEDF479F5
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2019 08:22:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725778AbfFQGWx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jun 2019 02:22:53 -0400
Received: from verein.lst.de ([213.95.11.211]:32787 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725372AbfFQGWw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jun 2019 02:22:52 -0400
Received: by newverein.lst.de (Postfix, from userid 2407)
        id 8159768AA6; Mon, 17 Jun 2019 08:22:22 +0200 (CEST)
Date:   Mon, 17 Jun 2019 08:22:22 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "usb-storage@lists.one-eyed-alien.net" 
        <usb-storage@lists.one-eyed-alien.net>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v2] usb-storage: Add a limitation for
 blk_queue_max_hw_sectors()
Message-ID: <20190617062222.GA5069@lst.de>
References: <20190613171112.GA22155@lst.de> <Pine.LNX.4.44L0.1906131317210.1307-100000@iolanthe.rowland.org> <OSBPR01MB359051D6F83101432E0F2549D8EB0@OSBPR01MB3590.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OSBPR01MB359051D6F83101432E0F2549D8EB0@OSBPR01MB3590.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jun 17, 2019 at 04:17:43AM +0000, Yoshihiro Shimoda wrote:
> Thank you for the comments. So, should I wait for getting rid of the
> virt_boundary_mask stuff? If I revise the commit log of this patch,
> is it acceptable for v5.2-stable as a workaround? In other words,
> I worry about this issue exists on v5.2-stable.

It does exist on 5.2-stable and we should fix it.  I'll plan to resend
my series to fix the virt_boundary issues for the other SCSI driver
soon, but we'll still need to sort out usb-storage.
