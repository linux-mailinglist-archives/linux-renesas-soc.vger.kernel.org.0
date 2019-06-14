Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84F32455BB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2019 09:22:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725999AbfFNHW6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 14 Jun 2019 03:22:58 -0400
Received: from verein.lst.de ([213.95.11.211]:44754 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725837AbfFNHW6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Jun 2019 03:22:58 -0400
Received: by newverein.lst.de (Postfix, from userid 2407)
        id 2F2DD68B02; Fri, 14 Jun 2019 09:22:29 +0200 (CEST)
Date:   Fri, 14 Jun 2019 09:22:28 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     joro@8bytes.org, axboe@kernel.dk, ulf.hansson@linaro.org,
        wsa+renesas@sang-engineering.com, hch@lst.de,
        iommu@lists.linux-foundation.org, linux-block@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [RFC PATCH v6 3/5] block: add a helper function to merge the
 segments by an IOMMU
Message-ID: <20190614072228.GC8420@lst.de>
References: <1560421215-10750-1-git-send-email-yoshihiro.shimoda.uh@renesas.com> <1560421215-10750-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1560421215-10750-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

I'm a little worried about this directly calling into the iommu
API instead of going through the DMA mapping code.  We still have
plenty of iommus not using the iommu layer for DMA mapping.  But at
least this code is in the block layer and not the driver, so maybe
we can live with it.
