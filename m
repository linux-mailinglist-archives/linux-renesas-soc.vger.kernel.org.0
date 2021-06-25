Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4409E3B3E11
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Jun 2021 09:55:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229890AbhFYH5x (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Jun 2021 03:57:53 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:12810 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229454AbhFYH5w (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Jun 2021 03:57:52 -0400
X-IronPort-AV: E=Sophos;i="5.83,298,1616425200"; 
   d="scan'208";a="85506020"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 25 Jun 2021 16:55:31 +0900
Received: from localhost.localdomain (unknown [10.166.14.185])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 23B3A40184AC;
        Fri, 25 Jun 2021 16:55:31 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     ulf.hansson@linaro.org, wsa+renesas@sang-engineering.com
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH/RFC] mmc: host: renesas_sdhi: Refactor of_device_id.data
Date:   Fri, 25 Jun 2021 16:55:08 +0900
Message-Id: <20210625075508.664674-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Refactor of_device_id.data to avoid increasing numbers of
sdhi_quirks_match[] entry when we add other stable SoCs like
r8a779m*.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 - We discussed/reviewed sdhi support for r8a779m* [1] before.
 - I marked RFC on this patch because:
 -- should I make step-by-step patches to ease review?
 -- should I rename the current renesas_sdhi_of_data (e.g. renesas_sdhi_param)?
    (renesas_sdhi_of_data and renesas_sdhi_of_data_with_quirks seem strange
     a little?)
 - I tested this patch on r8a77951 (ES3.0), r8a77960 (ES1.0)
   and r8a77965.

 [1]
 https://lore.kernel.org/linux-renesas-soc/TY2PR01MB36927B0CCE7C557A3115E481D8079@TY2PR01MB3692.jpnprd01.prod.outlook.com/

 drivers/mmc/host/renesas_sdhi.h               |  5 ++
 drivers/mmc/host/renesas_sdhi_core.c          | 42 ++--------
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 78 ++++++++++++++++++-
 drivers/mmc/host/renesas_sdhi_sys_dmac.c      | 24 +++++-
 4 files changed, 105 insertions(+), 44 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index 53eded81a53e..7ef480d56211 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -42,6 +42,11 @@ struct renesas_sdhi_quirks {
 	const u8 (*hs400_calib_table)[SDHI_CALIB_TABLE_MAX];
 };
 
+struct renesas_sdhi_of_data_with_quirks {
+	const struct renesas_sdhi_of_data *of_data;
+	const struct renesas_sdhi_quirks *quirks;
+};
+
 struct tmio_mmc_dma {
 	enum dma_slave_buswidth dma_buswidth;
 	bool (*filter)(struct dma_chan *chan, void *arg);
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index e49ca0f7fe9a..fbb506be6229 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -312,20 +312,6 @@ static const u8 r8a7796_es13_calib_table[2][SDHI_CALIB_TABLE_MAX] = {
 	 12, 17, 18, 18, 18, 18, 18, 18, 18, 19, 20, 21, 22, 23, 25, 25 }
 };
 
-static const u8 r8a77965_calib_table[2][SDHI_CALIB_TABLE_MAX] = {
-	{ 1,  2,  6,  6,  7,  8,  9, 10, 11, 12, 13, 14, 15, 15, 15, 16,
-	 17, 18, 19, 20, 21, 22, 23, 24, 25, 25, 26, 27, 28, 29, 30, 31 },
-	{ 2,  3,  4,  4,  5,  6,  7,  9, 10, 11, 12, 13, 14, 15, 16, 17,
-	 17, 17, 20, 21, 22, 23, 24, 25, 27, 28, 29, 30, 31, 31, 31, 31 }
-};
-
-static const u8 r8a77990_calib_table[2][SDHI_CALIB_TABLE_MAX] = {
-	{ 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
-	  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 },
-	{ 0,  0,  0,  1,  2,  3,  3,  4,  4,  4,  5,  5,  6,  8,  9, 10,
-	 11, 12, 13, 15, 16, 17, 17, 18, 18, 19, 20, 22, 24, 25, 26, 26 }
-};
-
 static inline u32 sd_scc_read32(struct tmio_mmc_host *host,
 				struct renesas_sdhi *priv, int addr)
 {
@@ -909,29 +895,12 @@ static const struct renesas_sdhi_quirks sdhi_quirks_nohs400 = {
 	.hs400_disabled = true,
 };
 
-static const struct renesas_sdhi_quirks sdhi_quirks_bad_taps1357 = {
-	.hs400_bad_taps = BIT(1) | BIT(3) | BIT(5) | BIT(7),
-};
-
-static const struct renesas_sdhi_quirks sdhi_quirks_bad_taps2367 = {
-	.hs400_bad_taps = BIT(2) | BIT(3) | BIT(6) | BIT(7),
-};
-
 static const struct renesas_sdhi_quirks sdhi_quirks_r8a7796_es13 = {
 	.hs400_4taps = true,
 	.hs400_bad_taps = BIT(2) | BIT(3) | BIT(6) | BIT(7),
 	.hs400_calib_table = r8a7796_es13_calib_table,
 };
 
-static const struct renesas_sdhi_quirks sdhi_quirks_r8a77965 = {
-	.hs400_bad_taps = BIT(2) | BIT(3) | BIT(6) | BIT(7),
-	.hs400_calib_table = r8a77965_calib_table,
-};
-
-static const struct renesas_sdhi_quirks sdhi_quirks_r8a77990 = {
-	.hs400_calib_table = r8a77990_calib_table,
-};
-
 /*
  * Note for r8a7796 / r8a774a1: we can't distinguish ES1.1 and 1.2 as of now.
  * So, we want to treat them equally and only have a match for ES1.2 to enforce
@@ -941,13 +910,8 @@ static const struct soc_device_attribute sdhi_quirks_match[]  = {
 	{ .soc_id = "r8a774a1", .revision = "ES1.[012]", .data = &sdhi_quirks_4tap_nohs400 },
 	{ .soc_id = "r8a7795", .revision = "ES1.*", .data = &sdhi_quirks_4tap_nohs400 },
 	{ .soc_id = "r8a7795", .revision = "ES2.0", .data = &sdhi_quirks_4tap },
-	{ .soc_id = "r8a7795", .revision = "ES3.*", .data = &sdhi_quirks_bad_taps2367 },
 	{ .soc_id = "r8a7796", .revision = "ES1.[012]", .data = &sdhi_quirks_4tap_nohs400 },
 	{ .soc_id = "r8a7796", .revision = "ES1.*", .data = &sdhi_quirks_r8a7796_es13 },
-	{ .soc_id = "r8a77961", .data = &sdhi_quirks_bad_taps1357 },
-	{ .soc_id = "r8a77965", .data = &sdhi_quirks_r8a77965 },
-	{ .soc_id = "r8a77980", .data = &sdhi_quirks_nohs400 },
-	{ .soc_id = "r8a77990", .data = &sdhi_quirks_r8a77990 },
 	{ /* Sentinel. */ },
 };
 
@@ -957,6 +921,7 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 	struct tmio_mmc_data *mmd = pdev->dev.platform_data;
 	const struct renesas_sdhi_quirks *quirks = NULL;
 	const struct renesas_sdhi_of_data *of_data;
+	const struct renesas_sdhi_of_data_with_quirks *of_data_quirks;
 	const struct soc_device_attribute *attr;
 	struct tmio_mmc_data *mmc_data;
 	struct tmio_mmc_dma *dma_priv;
@@ -966,11 +931,14 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 	struct resource *res;
 	u16 ver;
 
-	of_data = of_device_get_match_data(&pdev->dev);
+	of_data_quirks = of_device_get_match_data(&pdev->dev);
+	of_data = of_data_quirks->of_data;
 
 	attr = soc_device_match(sdhi_quirks_match);
 	if (attr)
 		quirks = attr->data;
+	else
+		quirks = of_data_quirks->quirks;
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res)
diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index e8f4863d8f1a..c4bd602dd8cf 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -92,7 +92,7 @@ static struct renesas_sdhi_scc rcar_gen3_scc_taps[] = {
 	},
 };
 
-static const struct renesas_sdhi_of_data of_rza2_compatible = {
+static const struct renesas_sdhi_of_data of_data_rza2 = {
 	.tmio_flags	= TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL |
 			  TMIO_MMC_HAVE_CBSY,
 	.tmio_ocr_mask	= MMC_VDD_32_33,
@@ -107,7 +107,11 @@ static const struct renesas_sdhi_of_data of_rza2_compatible = {
 	.max_segs	= 1,
 };
 
-static const struct renesas_sdhi_of_data of_rcar_gen3_compatible = {
+static const struct renesas_sdhi_of_data_with_quirks of_rza2_compatible = {
+	.of_data	= &of_data_rza2,
+};
+
+static const struct renesas_sdhi_of_data of_data_rcar_gen3 = {
 	.tmio_flags	= TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL |
 			  TMIO_MMC_HAVE_CBSY | TMIO_MMC_MIN_RCAR2,
 	.capabilities	= MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
@@ -122,11 +126,79 @@ static const struct renesas_sdhi_of_data of_rcar_gen3_compatible = {
 	.max_segs	= 1,
 };
 
+static const struct renesas_sdhi_quirks sdhi_quirks_nohs400 = {
+	.hs400_disabled = true,
+};
+
+static const struct renesas_sdhi_quirks sdhi_quirks_bad_taps1357 = {
+	.hs400_bad_taps = BIT(1) | BIT(3) | BIT(5) | BIT(7),
+};
+
+static const struct renesas_sdhi_quirks sdhi_quirks_bad_taps2367 = {
+	.hs400_bad_taps = BIT(2) | BIT(3) | BIT(6) | BIT(7),
+};
+
+static const u8 r8a77965_calib_table[2][SDHI_CALIB_TABLE_MAX] = {
+	{ 1,  2,  6,  6,  7,  8,  9, 10, 11, 12, 13, 14, 15, 15, 15, 16,
+	 17, 18, 19, 20, 21, 22, 23, 24, 25, 25, 26, 27, 28, 29, 30, 31 },
+	{ 2,  3,  4,  4,  5,  6,  7,  9, 10, 11, 12, 13, 14, 15, 16, 17,
+	 17, 17, 20, 21, 22, 23, 24, 25, 27, 28, 29, 30, 31, 31, 31, 31 }
+};
+
+static const u8 r8a77990_calib_table[2][SDHI_CALIB_TABLE_MAX] = {
+	{ 0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,
+	  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0 },
+	{ 0,  0,  0,  1,  2,  3,  3,  4,  4,  4,  5,  5,  6,  8,  9, 10,
+	 11, 12, 13, 15, 16, 17, 17, 18, 18, 19, 20, 22, 24, 25, 26, 26 }
+};
+
+static const struct renesas_sdhi_quirks sdhi_quirks_r8a77965 = {
+	.hs400_bad_taps = BIT(2) | BIT(3) | BIT(6) | BIT(7),
+	.hs400_calib_table = r8a77965_calib_table,
+};
+
+static const struct renesas_sdhi_quirks sdhi_quirks_r8a77990 = {
+	.hs400_calib_table = r8a77990_calib_table,
+};
+
+static const struct renesas_sdhi_of_data_with_quirks of_r8a7795_compatible = {
+	.of_data	= &of_data_rcar_gen3,
+	.quirks		= &sdhi_quirks_bad_taps2367,
+};
+
+static const struct renesas_sdhi_of_data_with_quirks of_r8a77961_compatible = {
+	.of_data	= &of_data_rcar_gen3,
+	.quirks		= &sdhi_quirks_bad_taps1357,
+};
+
+static const struct renesas_sdhi_of_data_with_quirks of_r8a77965_compatible = {
+	.of_data	= &of_data_rcar_gen3,
+	.quirks		= &sdhi_quirks_r8a77965,
+};
+
+static const struct renesas_sdhi_of_data_with_quirks of_r8a77980_compatible = {
+	.of_data	= &of_data_rcar_gen3,
+	.quirks		= &sdhi_quirks_nohs400,
+};
+
+static const struct renesas_sdhi_of_data_with_quirks of_r8a77990_compatible = {
+	.of_data	= &of_data_rcar_gen3,
+	.quirks		= &sdhi_quirks_r8a77990,
+};
+
+static const struct renesas_sdhi_of_data_with_quirks of_rcar_gen3_compatible = {
+	.of_data	= &of_data_rcar_gen3,
+};
+
 static const struct of_device_id renesas_sdhi_internal_dmac_of_match[] = {
 	{ .compatible = "renesas,sdhi-r7s9210", .data = &of_rza2_compatible, },
 	{ .compatible = "renesas,sdhi-mmc-r8a77470", .data = &of_rcar_gen3_compatible, },
-	{ .compatible = "renesas,sdhi-r8a7795", .data = &of_rcar_gen3_compatible, },
+	{ .compatible = "renesas,sdhi-r8a7795", .data = &of_r8a7795_compatible, },
 	{ .compatible = "renesas,sdhi-r8a7796", .data = &of_rcar_gen3_compatible, },
+	{ .compatible = "renesas,sdhi-r8a77961", .data = &of_r8a77961_compatible, },
+	{ .compatible = "renesas,sdhi-r8a77965", .data = &of_r8a77965_compatible, },
+	{ .compatible = "renesas,sdhi-r8a77980", .data = &of_r8a77980_compatible, },
+	{ .compatible = "renesas,sdhi-r8a77990", .data = &of_r8a77990_compatible, },
 	{ .compatible = "renesas,rcar-gen3-sdhi", .data = &of_rcar_gen3_compatible, },
 	{},
 };
diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
index ffa64211f4de..9255e93e6248 100644
--- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
@@ -25,11 +25,15 @@
 
 #define TMIO_MMC_MIN_DMA_LEN 8
 
-static const struct renesas_sdhi_of_data of_default_cfg = {
+static const struct renesas_sdhi_of_data of_data_default_cfg = {
 	.tmio_flags = TMIO_MMC_HAS_IDLE_WAIT,
 };
 
-static const struct renesas_sdhi_of_data of_rz_compatible = {
+static const struct renesas_sdhi_of_data_with_quirks of_default_cfg = {
+	.of_data	= &of_data_default_cfg,
+};
+
+static const struct renesas_sdhi_of_data of_data_rz = {
 	.tmio_flags	= TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_32BIT_DATA_PORT |
 			  TMIO_MMC_HAVE_CBSY,
 	.tmio_ocr_mask	= MMC_VDD_32_33,
@@ -37,13 +41,21 @@ static const struct renesas_sdhi_of_data of_rz_compatible = {
 			  MMC_CAP_WAIT_WHILE_BUSY,
 };
 
-static const struct renesas_sdhi_of_data of_rcar_gen1_compatible = {
+static const struct renesas_sdhi_of_data_with_quirks of_rz_compatible = {
+	.of_data	= &of_data_rz,
+};
+
+static const struct renesas_sdhi_of_data of_data_rcar_gen1 = {
 	.tmio_flags	= TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL,
 	.capabilities	= MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
 			  MMC_CAP_WAIT_WHILE_BUSY,
 	.capabilities2	= MMC_CAP2_NO_WRITE_PROTECT,
 };
 
+static const struct renesas_sdhi_of_data_with_quirks of_rcar_gen1_compatible = {
+	.of_data	= &of_data_rcar_gen1,
+};
+
 /* Definitions for sampling clocks */
 static struct renesas_sdhi_scc rcar_gen2_scc_taps[] = {
 	{
@@ -56,7 +68,7 @@ static struct renesas_sdhi_scc rcar_gen2_scc_taps[] = {
 	},
 };
 
-static const struct renesas_sdhi_of_data of_rcar_gen2_compatible = {
+static const struct renesas_sdhi_of_data of_data_rcar_gen2 = {
 	.tmio_flags	= TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL |
 			  TMIO_MMC_HAVE_CBSY | TMIO_MMC_MIN_RCAR2,
 	.capabilities	= MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
@@ -70,6 +82,10 @@ static const struct renesas_sdhi_of_data of_rcar_gen2_compatible = {
 	.max_blk_count	= UINT_MAX / TMIO_MAX_BLK_SIZE,
 };
 
+static const struct renesas_sdhi_of_data_with_quriks of_rcar_gen2_compatible = {
+	.of_data	= &of_data_rcar_gen2,
+};
+
 static const struct of_device_id renesas_sdhi_sys_dmac_of_match[] = {
 	{ .compatible = "renesas,sdhi-sh73a0", .data = &of_default_cfg, },
 	{ .compatible = "renesas,sdhi-r8a73a4", .data = &of_default_cfg, },
-- 
2.25.1

