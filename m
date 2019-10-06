Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C129ACD8B8
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  6 Oct 2019 20:45:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727121AbfJFSpt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 6 Oct 2019 14:45:49 -0400
Received: from verein.lst.de ([213.95.11.211]:59612 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727113AbfJFSps (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 6 Oct 2019 14:45:48 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 11C41227A8B; Sun,  6 Oct 2019 20:45:42 +0200 (CEST)
Date:   Sun, 6 Oct 2019 20:45:41 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Christoph Hellwig <hch@lst.de>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        linux-xtensa@linux-xtensa.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Linux MM <linux-mm@kvack.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 3/4] dma-mapping: introduce a dma_common_find_pages
 helper
Message-ID: <20191006184541.GA4110@lst.de>
References: <20190830062924.21714-1-hch@lst.de> <20190830062924.21714-4-hch@lst.de> <CAMuHMdXxWp2=9n2LQA9KVH_ArOUnY78ZoiQ7ZsDMbTOGsEz4hw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXxWp2=9n2LQA9KVH_ArOUnY78ZoiQ7ZsDMbTOGsEz4hw@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Geert,

please try Linus' current tree.  It has a fix from Andrey Smirnov
for what looks the same problem that you reported.
