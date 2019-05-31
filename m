Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68CB430D3F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 31 May 2019 13:21:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727111AbfEaLVG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 31 May 2019 07:21:06 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:16076 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726158AbfEaLVG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 31 May 2019 07:21:06 -0400
X-IronPort-AV: E=Sophos;i="5.60,534,1549897200"; 
   d="scan'208";a="17484179"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 31 May 2019 20:21:03 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id D544C4249D39;
        Fri, 31 May 2019 20:21:03 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     ulf.hansson@linaro.org, wsa+renesas@sang-engineering.com
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v4 0/3] mmc: renesas_sdhi: improve performance by changing max_segs
Date:   Fri, 31 May 2019 20:16:08 +0900
Message-Id: <1559301371-21200-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch series is based on iommu.git / next branch.

Since SDHI host internal DMAC of the R-Car Gen3 cannot handle two or more
segments, the performance rate (especially, eMMC HS400 reading) is not good.
However, if IOMMU is enabled on the DMAC, since IOMMU will map multiple
scatter gather buffers as one contignous iova, the DMAC can handle the iova
as well and then the performance rate is possible to improve. In fact,
I have measured the performance by using bonnie++, "Sequential Input - block"
rate was improved on r8a7795.

However, in case of a sdio card (especiialy some WiFi cards/drivers),
scatter gather buffers are possible to be not contiguous iova because
each scatter gather buffer has only about 1500 bytes, the DMAC cannot
handle it. So, this patch set adds init_card() ops to detect the card
type, and then the driver changes the max_segs if the DMAC is under
IOMMU environment and an sd card/mmc is detected.

Changes from v3 [1]:
 - Use a helper function device_iommu_mapped on patch 1 and 3.
 - Check if R-Car Gen3 IPMMU is used or not on patch 3.
 - Check if all multiple segment buffers are aligned to PAGE_SIZE on patch 3.
 - Add Reviewed-by Wolfram-san on patch 1 and 2. Note that I also got his
   Reviewed-by on patch 3, but I changed it from v2. So, I didn't add
   his Reviewed-by at this time.

Changes from v2 [2]:
 - Add some conditions in the init_card().
 - Add a comment in the init_card().
 - Add definitions for some "MAX_SEGS".

Changes from v1 [3]:
 - Remove adding init_card ops into struct tmio_mmc_dma_ops and
   tmio_mmc_host and just set init_card on renesas_sdhi_core.c.
 - Revise typos on "mmc: tmio: No memory size limitation if runs on IOMMU".
 - Add Simon-san's Reviewed-by on a tmio patch.

[1]
https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=120985

[2]
https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=116729

[3]
https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=110485


Yoshihiro Shimoda (3):
  mmc: tmio: No memory size limitation if runs on IOMMU
  mmc: tmio: Add a definition for default max_segs
  mmc: renesas_sdhi: use multiple segments if possible

 drivers/mmc/host/renesas_sdhi.h               |  1 +
 drivers/mmc/host/renesas_sdhi_core.c          | 60 +++++++++++++++++++++++++++
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 19 +++++++++
 drivers/mmc/host/tmio_mmc.h                   |  1 +
 drivers/mmc/host/tmio_mmc_core.c              |  7 ++--
 5 files changed, 85 insertions(+), 3 deletions(-)

-- 
2.7.4

