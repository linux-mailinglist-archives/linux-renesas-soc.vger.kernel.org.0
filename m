Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5B1935B00
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  5 Jun 2019 13:16:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727366AbfFELQ4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 5 Jun 2019 07:16:56 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:16217 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727406AbfFELQz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Jun 2019 07:16:55 -0400
X-IronPort-AV: E=Sophos;i="5.60,550,1549897200"; 
   d="scan'208";a="17680356"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 05 Jun 2019 20:16:53 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 301CE41BD761;
        Wed,  5 Jun 2019 20:16:53 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     ulf.hansson@linaro.org, wsa+renesas@sang-engineering.com,
        hch@lst.de, m.szyprowski@samsung.com, robin.murphy@arm.com,
        joro@8bytes.org
Cc:     linux-mmc@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [RFC PATCH v5 5/8] mmc: tmio: No memory size limitation if runs on IOMMU
Date:   Wed,  5 Jun 2019 20:11:51 +0900
Message-Id: <1559733114-4221-6-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559733114-4221-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1559733114-4221-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds a condition to avoid a memory size limitation of
swiotlb if the driver runs on IOMMU.

Tested-by: Takeshi Saito <takeshi.saito.xv@renesas.com>
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/mmc/host/tmio_mmc_core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mmc/host/tmio_mmc_core.c b/drivers/mmc/host/tmio_mmc_core.c
index 130b91c..c9f6a59 100644
--- a/drivers/mmc/host/tmio_mmc_core.c
+++ b/drivers/mmc/host/tmio_mmc_core.c
@@ -1194,9 +1194,10 @@ int tmio_mmc_host_probe(struct tmio_mmc_host *_host)
 	 * Since swiotlb has memory size limitation, this will calculate
 	 * the maximum size locally (because we don't have any APIs for it now)
 	 * and check the current max_req_size. And then, this will update
-	 * the max_req_size if needed as a workaround.
+	 * the max_req_size if needed as a workaround. However, if the driver
+	 * runs on IOMMU, this workaround isn't needed.
 	 */
-	if (swiotlb_max_segment()) {
+	if (swiotlb_max_segment() && !device_iommu_mapped(&pdev->dev)) {
 		unsigned int max_size = (1 << IO_TLB_SHIFT) * IO_TLB_SEGSIZE;
 
 		if (mmc->max_req_size > max_size)
-- 
2.7.4

