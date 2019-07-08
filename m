Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97FA262622
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Jul 2019 18:22:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727648AbfGHQWc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 8 Jul 2019 12:22:32 -0400
Received: from verein.lst.de ([213.95.11.211]:34854 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726512AbfGHQWc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Jul 2019 12:22:32 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 292AE227A81; Mon,  8 Jul 2019 18:22:30 +0200 (CEST)
Date:   Mon, 8 Jul 2019 18:22:30 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Ulf Hansson <ulf.hansson@linaro.org>
Cc:     Christoph Hellwig <hch@lst.de>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <joro@8bytes.org>,
        Jens Axboe <axboe@kernel.dk>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        linux-block <linux-block@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>
Subject: Re: [RFC PATCH v7 0/5] treewide: improve R-Car SDHI performance
Message-ID: <20190708162229.GA10311@lst.de>
References: <1561020610-953-1-git-send-email-yoshihiro.shimoda.uh@renesas.com> <20190701083253.GA22719@lst.de> <CAPDyKFpg6zMRtnD89juuXR8Epas7qJOo8GgdTR=Q1kbZ0=69LA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFpg6zMRtnD89juuXR8Epas7qJOo8GgdTR=Q1kbZ0=69LA@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jul 08, 2019 at 01:45:55PM +0200, Ulf Hansson wrote:
> On Mon, 1 Jul 2019 at 10:32, Christoph Hellwig <hch@lst.de> wrote:
> >
> > Any comments from the block, iommu and mmc maintainers?  I'd be happy
> > to queue this up in the dma-mapping tree, but I'll need some ACKs
> > for that fast.  Alternatively I can just queue up the DMA API bits,
> > leaving the rest for the next merge window, but would drag things
> > out far too long IMHO.
> 
> Apologize for the delay, the mmc parts looks good to me. If not too
> late, feel free to pick it up.
> 
> Otherwise, let's do it for the next cycle.

I was out the last couple days, so it has to be next cycle.  But it
would still make sense to get everything into a single tree.
