Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3B34795A14
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 20 Aug 2019 10:44:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729341AbfHTIor (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 20 Aug 2019 04:44:47 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:48636 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729333AbfHTIor (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 20 Aug 2019 04:44:47 -0400
X-IronPort-AV: E=Sophos;i="5.64,408,1559487600"; 
   d="scan'208";a="24232614"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 20 Aug 2019 17:44:44 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 10123400753C;
        Tue, 20 Aug 2019 17:44:44 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     ulf.hansson@linaro.org, wsa+renesas@sang-engineering.com
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] mmc: host: renesas_sdhi_sys_dmac: Remove all R-Car Gen3 SoCs
Date:   Tue, 20 Aug 2019 17:43:10 +0900
Message-Id: <1566290590-2841-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

All R-Car Gen3 SoCs with any ES version cannot use this DMAC actually.
So, this patch removes the compatibles of R-Car Gen3 SoCs from
renesas_sdhi_sys_dmac_of_match. Since the previous code has
an empty whitelist to prevent probing of R-Car Gen3 SoCs,
no behavior changes.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/mmc/host/renesas_sdhi_sys_dmac.c | 36 --------------------------------
 1 file changed, 36 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
index 1d29b82..13ff023 100644
--- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
@@ -68,26 +68,6 @@ static const struct renesas_sdhi_of_data of_rcar_gen2_compatible = {
 	.max_blk_count	= UINT_MAX / TMIO_MAX_BLK_SIZE,
 };
 
-/* Definitions for sampling clocks */
-static struct renesas_sdhi_scc rcar_gen3_scc_taps[] = {
-	{
-		.clk_rate = 0,
-		.tap = 0x00000300,
-	},
-};
-
-static const struct renesas_sdhi_of_data of_rcar_gen3_compatible = {
-	.tmio_flags	= TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL |
-			  TMIO_MMC_HAVE_CBSY | TMIO_MMC_MIN_RCAR2,
-	.capabilities	= MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
-			  MMC_CAP_CMD23,
-	.capabilities2	= MMC_CAP2_NO_WRITE_PROTECT,
-	.bus_shift	= 2,
-	.scc_offset	= 0x1000,
-	.taps		= rcar_gen3_scc_taps,
-	.taps_num	= ARRAY_SIZE(rcar_gen3_scc_taps),
-};
-
 static const struct of_device_id renesas_sdhi_sys_dmac_of_match[] = {
 	{ .compatible = "renesas,sdhi-sh73a0", .data = &of_default_cfg, },
 	{ .compatible = "renesas,sdhi-r8a73a4", .data = &of_default_cfg, },
@@ -102,11 +82,8 @@ static const struct of_device_id renesas_sdhi_sys_dmac_of_match[] = {
 	{ .compatible = "renesas,sdhi-r8a7792", .data = &of_rcar_gen2_compatible, },
 	{ .compatible = "renesas,sdhi-r8a7793", .data = &of_rcar_gen2_compatible, },
 	{ .compatible = "renesas,sdhi-r8a7794", .data = &of_rcar_gen2_compatible, },
-	{ .compatible = "renesas,sdhi-r8a7795", .data = &of_rcar_gen3_compatible, },
-	{ .compatible = "renesas,sdhi-r8a7796", .data = &of_rcar_gen3_compatible, },
 	{ .compatible = "renesas,rcar-gen1-sdhi", .data = &of_rcar_gen1_compatible, },
 	{ .compatible = "renesas,rcar-gen2-sdhi", .data = &of_rcar_gen2_compatible, },
-	{ .compatible = "renesas,rcar-gen3-sdhi", .data = &of_rcar_gen3_compatible, },
 	{ .compatible = "renesas,sdhi-shmobile" },
 	{},
 };
@@ -470,21 +447,8 @@ static const struct tmio_mmc_dma_ops renesas_sdhi_sys_dmac_dma_ops = {
 	.dataend = renesas_sdhi_sys_dmac_dataend_dma,
 };
 
-/*
- * Whitelist of specific R-Car Gen3 SoC ES versions to use this DMAC
- * implementation. Currently empty as all supported ES versions use
- * the internal DMAC.
- */
-static const struct soc_device_attribute gen3_soc_whitelist[] = {
-        { /* sentinel */ }
-};
-
 static int renesas_sdhi_sys_dmac_probe(struct platform_device *pdev)
 {
-	if (of_device_get_match_data(&pdev->dev) == &of_rcar_gen3_compatible &&
-	    !soc_device_match(gen3_soc_whitelist))
-		return -ENODEV;
-
 	return renesas_sdhi_probe(pdev, &renesas_sdhi_sys_dmac_dma_ops);
 }
 
-- 
2.7.4

