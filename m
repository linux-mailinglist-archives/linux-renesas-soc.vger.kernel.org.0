Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3896344458
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2019 18:37:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728541AbfFMQg1 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 Jun 2019 12:36:27 -0400
Received: from verein.lst.de ([213.95.11.211]:36365 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730689AbfFMHeR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Jun 2019 03:34:17 -0400
Received: by newverein.lst.de (Postfix, from userid 2407)
        id 21C4E68B02; Thu, 13 Jun 2019 09:33:47 +0200 (CEST)
Date:   Thu, 13 Jun 2019 09:33:46 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     stern@rowland.harvard.edu, gregkh@linuxfoundation.org, hch@lst.de,
        linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] usb-storage: Add a limitation for
 blk_queue_max_hw_sectors()
Message-ID: <20190613073346.GB12093@lst.de>
References: <1560400504-26884-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1560400504-26884-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

> +	if (max_sectors > 0) {
> +		struct device *dev = us->pusb_dev->bus->sysdev;
> +		size_t max_dma_sectors = dma_max_mapping_size(dev) >>
> +					 SECTOR_SHIFT;
> +
> +		max_sectors = min_t(size_t, max_sectors, max_dma_sectors);
> +		blk_queue_max_hw_sectors(sdev->request_queue, max_sectors);

I think we need to do this unconditionally for the rare (or maybe even
theoretical case) of a dma max mapping size smaller than the default
max_sectos.

So something like this:

	blk_queue_max_hw_sectors(sdev->request_queue,
		min_t(unsigned long,
			queue_max_hw_sectors(sdev->request_queue),
			dma_max_mapping_size(dev) >> SECTOR_SHIFT));

