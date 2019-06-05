Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D05035CFE
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2019 14:38:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727727AbfFEMij (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Jun 2019 08:38:39 -0400
Received: from verein.lst.de ([213.95.11.211]:42694 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727273AbfFEMii (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Jun 2019 08:38:38 -0400
Received: by newverein.lst.de (Postfix, from userid 2407)
        id AF30A227A81; Wed,  5 Jun 2019 14:38:09 +0200 (CEST)
Date:   Wed, 5 Jun 2019 14:38:08 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        ulf.hansson@linaro.org, wsa+renesas@sang-engineering.com,
        hch@lst.de, m.szyprowski@samsung.com, joro@8bytes.org,
        linux-mmc@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC PATCH v5 3/8] iommu: add a new capable IOMMU_CAP_MERGING
Message-ID: <20190605123808.GA12529@lst.de>
References: <1559733114-4221-1-git-send-email-yoshihiro.shimoda.uh@renesas.com> <1559733114-4221-4-git-send-email-yoshihiro.shimoda.uh@renesas.com> <7dfeb7d8-b777-b4af-d892-2829cd05241b@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7dfeb7d8-b777-b4af-d892-2829cd05241b@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jun 05, 2019 at 01:21:59PM +0100, Robin Murphy wrote:
> And if the problem is really that you're not getting merging because of 
> exposing the wrong parameters to the DMA API and/or the block layer, or 
> that you just can't quite express your requirement to the block layer in 
> the first place, then that should really be tackled at the source rather 
> than worked around further down in the stack.

The problem is that we need a way to communicate to the block layer
that more than a single segment is ok IFF the DMA API instance supports
merging.  And of course the answer will depend on futher parameters
like the maximum merged segment size and alignment for the segement.

We'll need some way to communicate that, but I don't really think this
is series is the way to go.

We'd really need something hanging off the device (or through a query
API) how the dma map ops implementation exposes under what circumstances
it can merge.  The driver can then communicate that to the block layer
so that the block layer doesn't split requests up when reaching the
segement limit.
