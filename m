Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A9C37111F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 23 Jul 2019 07:27:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728868AbfGWF1z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 23 Jul 2019 01:27:55 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:19018 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727467AbfGWF1z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Jul 2019 01:27:55 -0400
X-IronPort-AV: E=Sophos;i="5.64,297,1559487600"; 
   d="scan'208";a="22145533"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 23 Jul 2019 14:27:52 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 03EDD41E3CDE;
        Tue, 23 Jul 2019 14:27:52 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     ulf.hansson@linaro.org, hch@lst.de, m.szyprowski@samsung.com,
        robin.murphy@arm.com, joro@8bytes.org, axboe@kernel.dk
Cc:     wsa+renesas@sang-engineering.com, linux-mmc@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-block@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v8 0/5] treewide: improve R-Car SDHI performance
Date:   Tue, 23 Jul 2019 14:26:43 +0900
Message-Id: <1563859608-19456-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series is based on linux-next.git / next-20190722 tag.

Since SDHI host internal DMAC of the R-Car Gen3 cannot handle two or
more segments, the performance rate (especially, eMMC HS400 reading)
is not good. However, if IOMMU is enabled on the DMAC, since IOMMU will
map multiple scatter gather buffers as one contignous iova, the DMAC can
handle the iova as well and then the performance rate is possible to
improve. In fact, I have measured the performance by using bonnie++,
"Sequential Input - block" rate was improved on r8a7795.

To achieve this, this patch series modifies IOMMU and Block subsystem
at first. This patch series is strictly depended on each subsystem
modification, so that I submit it as treewide.

Changes from v7:
 - Rebase on next-20190722 (v5.3-rc1 + next branches of subsystems)
 - Add some Reviewed-by.
https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=135391

Changes from v6:
 - [1/5 for DMA MAP] A new patch.
 - [2/5 for IOMMU] A new patch.
 - [3/5 for BLOCK] Add Reviewed-by.
 - [4/5 for BLOCK] Use a new DMA MAP API instead of device_iommu_mapped().
 - [5/5 for MMC] Likewise, and some minor fix.
 - Remove patch 4/5 of v6 from this v7 patch series.
https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=131769

Changes from v5:
 - Almost all patches are new code.
 - [4/5 for MMC] This is a refactor patch so that I don't add any
   {Tested,Reviewed}-by tags.
 - [5/5 for MMC] Modify MMC subsystem to use bigger segments instead of
   the renesas_sdhi driver.
 - [5/5 for MMC] Use BLK_MAX_SEGMENTS (128) instead of local value
   SDHI_MAX_SEGS_IN_IOMMU (512). Even if we use BLK_MAX_SEGMENTS,
   the performance is still good.
https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=127511

Changes from v4:
 - [DMA MAPPING] Add a new device_dma_parameters for iova contiguous.
 - [IOMMU] Add a new capable for "merging" segments.
 - [IOMMU] Add a capable ops into the ipmmu-vmsa driver.
 - [MMC] Sort headers in renesas_sdhi_core.c.
 - [MMC] Remove the following codes that made on v3 that can be achieved by
	 DMA MAPPING and IOMMU subsystem:
 -- Check if R-Car Gen3 IPMMU is used or not on patch 3.
 -- Check if all multiple segment buffers are aligned to PAGE_SIZE on patch 3.
https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=125593

Changes from v3:
 - Use a helper function device_iommu_mapped on patch 1 and 3.
 - Check if R-Car Gen3 IPMMU is used or not on patch 3.

Yoshihiro Shimoda (5):
  dma: Introduce dma_get_merge_boundary()
  iommu/dma: Add a new dma_map_ops of get_merge_boundary()
  block: sort headers on blk-setting.c
  block: add a helper function to merge the segments
  mmc: queue: Use bigger segments if DMA MAP layer can merge the
    segments

 Documentation/DMA-API.txt   |  8 ++++++++
 block/blk-settings.c        | 34 ++++++++++++++++++++++++++++------
 drivers/iommu/dma-iommu.c   | 11 +++++++++++
 drivers/mmc/core/queue.c    | 35 ++++++++++++++++++++++++++++++++---
 include/linux/blkdev.h      |  2 ++
 include/linux/dma-mapping.h |  6 ++++++
 include/linux/mmc/host.h    |  1 +
 kernel/dma/mapping.c        | 11 +++++++++++
 8 files changed, 99 insertions(+), 9 deletions(-)

-- 
2.7.4

