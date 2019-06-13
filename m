Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 92B7D448E2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2019 19:12:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404693AbfFMRLq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 Jun 2019 13:11:46 -0400
Received: from verein.lst.de ([213.95.11.211]:39770 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404663AbfFMRLq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Jun 2019 13:11:46 -0400
Received: by newverein.lst.de (Postfix, from userid 2407)
        id EB4AB68BFE; Thu, 13 Jun 2019 19:11:13 +0200 (CEST)
Date:   Thu, 13 Jun 2019 19:11:12 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        gregkh@linuxfoundation.org, hch@lst.de, linux-usb@vger.kernel.org,
        usb-storage@lists.one-eyed-alien.net,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] usb-storage: Add a limitation for
 blk_queue_max_hw_sectors()
Message-ID: <20190613171112.GA22155@lst.de>
References: <1560418611-10239-1-git-send-email-yoshihiro.shimoda.uh@renesas.com> <Pine.LNX.4.44L0.1906131258310.1307-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.1906131258310.1307-100000@iolanthe.rowland.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jun 13, 2019 at 01:06:40PM -0400, Alan Stern wrote:
> Hmmm.  Would it be easier instead to copy the DMA mapping parameters
> from us->pusb_dev->bus->sysdev into the SCSI host's parent before
> calling scsi_add_host()?  That way the correct values would be
> available from the beginning, so the existing DMA setup would
> automatically use the correct sizes.

It would in theory.  But at usb-storage has a special max_sectors quirk
for tape devices, and as the device type is a per-LU property we'd
still have to override it in ->slave_configure.
