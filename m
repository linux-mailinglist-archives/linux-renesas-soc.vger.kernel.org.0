Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D2714558F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 Jun 2019 09:18:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726028AbfFNHSa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 14 Jun 2019 03:18:30 -0400
Received: from verein.lst.de ([213.95.11.211]:44711 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725837AbfFNHSa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Jun 2019 03:18:30 -0400
Received: by newverein.lst.de (Postfix, from userid 2407)
        id 7983A68B05; Fri, 14 Jun 2019 09:18:00 +0200 (CEST)
Date:   Fri, 14 Jun 2019 09:18:00 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Joerg Roedel <joro@8bytes.org>, Jens Axboe <axboe@kernel.dk>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Christoph Hellwig <hch@lst.de>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        linux-block@vger.kernel.org,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [RFC PATCH v6 4/5] mmc: tmio: Use dma_max_mapping_size()
 instead of a workaround
Message-ID: <20190614071800.GB8420@lst.de>
References: <1560421215-10750-1-git-send-email-yoshihiro.shimoda.uh@renesas.com> <1560421215-10750-5-git-send-email-yoshihiro.shimoda.uh@renesas.com> <CAMuHMdXYqgPRX1WfUTRsKHhnSok5vfnr4AY36=vXoUvAxcNyWQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXYqgPRX1WfUTRsKHhnSok5vfnr4AY36=vXoUvAxcNyWQ@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jun 13, 2019 at 10:35:44PM +0200, Geert Uytterhoeven wrote:
> I'm always triggered by the use of min_t() and other casts:
> mmc->max_blk_size and mmc->max_blk_count are both unsigned int.
> dma_max_mapping_size() returns size_t, which can be 64-bit.
> 
>  1) Can the multiplication overflow?
>     Probably not, as per commit 2a55c1eac7882232 ("mmc: renesas_sdhi:
>     prevent overflow for max_req_size"), but I thought I'd better ask.
>  2) In theory, dma_max_mapping_size() can return a number that doesn't
>     fit in 32-bit, and will be truncated (to e.g. 0), leading to max_req_size
>     is zero?

This really should use a min_t on size_t.  Otherwise the patch looks
fine:

Reviewed-by: Christoph Hellwig <hch@lst.de>
