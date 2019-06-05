Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F70735AFB
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2019 13:16:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727367AbfFELQy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Jun 2019 07:16:54 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:16217 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727198AbfFELQy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Jun 2019 07:16:54 -0400
X-IronPort-AV: E=Sophos;i="5.60,550,1549897200"; 
   d="scan'208";a="17680347"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 05 Jun 2019 20:16:52 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 8CC7741BD761;
        Wed,  5 Jun 2019 20:16:52 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     ulf.hansson@linaro.org, wsa+renesas@sang-engineering.com,
        hch@lst.de, m.szyprowski@samsung.com, robin.murphy@arm.com,
        joro@8bytes.org
Cc:     linux-mmc@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [RFC PATCH v5 0/8] treewide: improve R-Car SDHI performance
Date:   Wed,  5 Jun 2019 20:11:46 +0900
Message-Id: <1559733114-4221-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
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

To achieve this, this patch series modifies DMA MAPPING and IOMMU
subsystem at first. Since I'd like to get any feedback from each
subsystem whether this way is acceptable for upstream, I submit it
to treewide with RFC.

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

*** BLURB HERE ***

Yoshihiro Shimoda (8):
  dma-mapping: add a device driver helper for iova contiguous
  iommu/dma: move iommu_dma_unmap_sg() place
  iommu: add a new capable IOMMU_CAP_MERGING
  iommu/ipmmu-vmsa: add capable ops
  mmc: tmio: No memory size limitation if runs on IOMMU
  mmc: tmio: Add a definition for default max_segs
  mmc: renesas_sdhi: sort headers
  mmc: renesas_sdhi: use multiple segments if possible

 drivers/iommu/dma-iommu.c                     | 74 +++++++++++++++++----------
 drivers/iommu/ipmmu-vmsa.c                    | 13 +++++
 drivers/mmc/host/renesas_sdhi_core.c          | 43 +++++++++++++---
 drivers/mmc/host/renesas_sdhi_internal_dmac.c |  4 ++
 drivers/mmc/host/tmio_mmc.h                   |  1 +
 drivers/mmc/host/tmio_mmc_core.c              |  7 +--
 include/linux/device.h                        |  1 +
 include/linux/dma-mapping.h                   | 16 ++++++
 include/linux/iommu.h                         |  1 +
 9 files changed, 123 insertions(+), 37 deletions(-)

-- 
2.7.4

