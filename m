Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 78D6F7472E
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jul 2019 08:32:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727422AbfGYGcV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 25 Jul 2019 02:32:21 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:54550 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726001AbfGYGcV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 25 Jul 2019 02:32:21 -0400
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 1F8F025AD7E;
        Thu, 25 Jul 2019 16:32:19 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 0C222E2209B; Thu, 25 Jul 2019 08:32:17 +0200 (CEST)
Date:   Thu, 25 Jul 2019 08:32:17 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     ulf.hansson@linaro.org, hch@lst.de, m.szyprowski@samsung.com,
        robin.murphy@arm.com, joro@8bytes.org, axboe@kernel.dk,
        wsa+renesas@sang-engineering.com, linux-mmc@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-block@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v8 1/5] dma: Introduce dma_get_merge_boundary()
Message-ID: <20190725063216.z26gvdtjwwkmrs3e@verge.net.au>
References: <1563859608-19456-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1563859608-19456-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1563859608-19456-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Jul 23, 2019 at 02:26:44PM +0900, Yoshihiro Shimoda wrote:
> This patch adds a new DMA API "dma_get_merge_boundary". This function
> returns the DMA merge boundary if the DMA layer can merge the segments.
> This patch also adds the implementation for a new dma_map_ops pointer.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

