Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 176F443C83
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 13 Jun 2019 17:36:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732172AbfFMPgQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 13 Jun 2019 11:36:16 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:24190 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727375AbfFMKUj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Jun 2019 06:20:39 -0400
X-IronPort-AV: E=Sophos;i="5.62,369,1554735600"; 
   d="scan'208";a="18589667"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 13 Jun 2019 19:20:37 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 785384274AAF;
        Thu, 13 Jun 2019 19:20:37 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     joro@8bytes.org, axboe@kernel.dk, ulf.hansson@linaro.org,
        wsa+renesas@sang-engineering.com
Cc:     hch@lst.de, iommu@lists.linux-foundation.org,
        linux-block@vger.kernel.org, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [RFC PATCH v6 0/5] treewide: improve R-Car SDHI performance
Date:   Thu, 13 Jun 2019 19:20:10 +0900
Message-Id: <1560421215-10750-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series is based on iommu.git / next branch.

Since SDHI host internal DMAC of the R-Car Gen3 cannot handle two or
more segments, the performance rate (especially, eMMC HS400 reading)
is not good. However, if IOMMU is enabled on the DMAC, since IOMMU will
map multiple scatter gather buffers as one contignous iova, the DMAC can
handle the iova as well and then the performance rate is possible to
improve. In fact, I have measured the performance by using bonnie++,
"Sequential Input - block" rate was improved on r8a7795.

To achieve this, this patch series modifies IOMMU and Block subsystem
at first. Since I'd like to get any feedback from each subsystem whether
this way is acceptable for upstream, I submit it to treewide with RFC.

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
 - Check if all multiple segment buffers are aligned to PAGE_SIZE on patch 3.
 - Add Reviewed-by Wolfram-san on patch 1 and 2. Note that I also got his
   Reviewed-by on patch 3, but I changed it from v2. So, I didn't add
   his Reviewed-by at this time.
https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=120985

Changes from v2:
 - Add some conditions in the init_card().
 - Add a comment in the init_card().
 - Add definitions for some "MAX_SEGS".
https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=116729

Changes from v1:
 - Remove adding init_card ops into struct tmio_mmc_dma_ops and
   tmio_mmc_host and just set init_card on renesas_sdhi_core.c.
 - Revise typos on "mmc: tmio: No memory size limitation if runs on IOMMU".
 - Add Simon-san's Reviewed-by on a tmio patch.
https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=110485

Yoshihiro Shimoda (5):
  iommu: add an exported function to get minimum page size for a domain
  block: sort headers on blk-setting.c
  block: add a helper function to merge the segments by an IOMMU
  mmc: tmio: Use dma_max_mapping_size() instead of a workaround
  mmc: queue: Use bigger segments if IOMMU can merge the segments

 block/blk-settings.c             | 40 ++++++++++++++++++++++++++++++++++------
 drivers/iommu/iommu.c            | 18 +++++++++++++++---
 drivers/mmc/core/queue.c         | 33 +++++++++++++++++++++++++++++----
 drivers/mmc/host/tmio_mmc_core.c | 17 ++++-------------
 include/linux/blkdev.h           |  2 ++
 include/linux/iommu.h            |  1 +
 include/linux/mmc/host.h         |  1 +
 7 files changed, 86 insertions(+), 26 deletions(-)

-- 
2.7.4

