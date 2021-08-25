Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 93FD23F7952
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 25 Aug 2021 17:44:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240904AbhHYPom (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 25 Aug 2021 11:44:42 -0400
Received: from 8bytes.org ([81.169.241.247]:41740 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240461AbhHYPol (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 25 Aug 2021 11:44:41 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id 6C1D3922; Wed, 25 Aug 2021 17:43:54 +0200 (CEST)
Date:   Wed, 25 Aug 2021 17:43:51 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Will Deacon <will@kernel.org>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        kernel test robot <lkp@intel.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] iommu/io-pgtable: Abstract iommu_iotlb_gather access
Message-ID: <YSZlN6vnv77cJPFJ@8bytes.org>
References: <83672ee76f6405c82845a55c148fa836f56fbbc1.1629465282.git.robin.murphy@arm.com>
 <CAMuHMdXL7ZtY8kBx=RHsRy1JECsGPDe+E3SM=--w7bUHMYHFBQ@mail.gmail.com>
 <ad5ae140-6398-a2d2-ed90-2d59cab01f0f@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad5ae140-6398-a2d2-ed90-2d59cab01f0f@arm.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, Aug 24, 2021 at 04:33:16PM +0100, Robin Murphy wrote:
> > Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Thanks for confirming!

Sorry for the delay, the new tree containing this fix has been pushed
out now.
