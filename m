Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 101973DA117
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Jul 2021 12:32:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235755AbhG2Kcu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 29 Jul 2021 06:32:50 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:30386 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S235796AbhG2Kcu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Jul 2021 06:32:50 -0400
X-IronPort-AV: E=Sophos;i="5.84,278,1620658800"; 
   d="scan'208";a="89151822"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 29 Jul 2021 19:32:45 +0900
Received: from localhost.localdomain (unknown [10.166.14.185])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id BBC914016D63;
        Thu, 29 Jul 2021 19:32:45 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     ulf.hansson@linaro.org, wsa+renesas@sang-engineering.com
Cc:     linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v4] mmc: host: renesas_sdhi: Refactor renesas_sdhi_probe()
Date:   Thu, 29 Jul 2021 19:32:34 +0900
Message-Id: <20210729103234.480743-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Refactor renesas_sdhi_probe() to avoid increasing numbers of
sdhi_quirks_match[] entry when we add other stable SoCs like
r8a779m*.

Note that the sdhi_quirks_match[] is only needed on
renesas_sdhi_internal_dmac.c so that of_data of
renesas_sdhi_sys_dmac.c keeps as-is.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Changes from v3:
 - Add Reviewed-by tag (Geert-san, thanks!)
 - Remove Reported-by tag.
 - Modify renesas_sdhi_internal_dmac_probe() for readability.
 https://lore.kernel.org/linux-mmc/20210702112956.1065875-1-yoshihiro.shimoda.uh@renesas.com/

 Changes from RFC v2:
 - Remove "RFC" mark from the subject.
 - Add a comment to the Reported-by tag.
 - Move all quirks to internal_dmac.c so that expands the renesas_sdhi_probe()
   arguments. So, update the commit subject and description.
 - Don't modify the renesas_sdhi_sys_dmac.c's of_data.
 - Replace tabs with a space in of_data_with_quirks variables.
 https://lore.kernel.org/linux-renesas-soc/20210629102033.847369-1-yoshihiro.shimoda.uh@renesas.com/

 Changes from RFC v1:
 - Fix build error in sys_dmac.c, reported by kernel test robot, so that
   add Reported-by tag.
 - Always set quirks, not using else statement.
 - Fix a NULL dereference if of_device_get_match_data() returns NULL.
 https://lore.kernel.org/linux-renesas-soc/20210625075508.664674-1-yoshihiro.shimoda.uh@renesas.com/

 drivers/mmc/host/renesas_sdhi.h               |   9 +-
 drivers/mmc/host/renesas_sdhi_core.c          |  90 +-----------
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 135 +++++++++++++++++-
 drivers/mmc/host/renesas_sdhi_sys_dmac.c      |   3 +-
 4 files changed, 141 insertions(+), 96 deletions(-)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index 53eded81a53e..0c45e82ff0de 100644
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
@@ -78,6 +83,8 @@ struct renesas_sdhi {
 	container_of((host)->pdata, struct renesas_sdhi, mmc_data)
 
 int renesas_sdhi_probe(struct platform_device *pdev,
-		       const struct tmio_mmc_dma_ops *dma_ops);
+		       const struct tmio_mmc_dma_ops *dma_ops,
+		       const struct renesas_sdhi_of_data *of_data,
+		       const struct renesas_sdhi_quirks *quirks);
 int renesas_sdhi_remove(struct platform_device *pdev);
 #endif
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index e49ca0f7fe9a..6fc4cf3c9dce 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -305,27 +305,6 @@ static int renesas_sdhi_start_signal_voltage_switch(struct mmc_host *mmc,
 #define SH_MOBILE_SDHI_SCC_TMPPORT_CALIB_CODE_MASK	0x1f
 #define SH_MOBILE_SDHI_SCC_TMPPORT_MANUAL_MODE		BIT(7)
 
-static const u8 r8a7796_es13_calib_table[2][SDHI_CALIB_TABLE_MAX] = {
-	{ 3,  3,  3,  3,  3,  3,  3,  4,  4,  5,  6,  7,  8,  9, 10, 15,
-	 16, 16, 16, 16, 16, 16, 17, 18, 18, 19, 20, 21, 22, 23, 24, 25 },
-	{ 5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  6,  7,  8, 11,
-	 12, 17, 18, 18, 18, 18, 18, 18, 18, 19, 20, 21, 22, 23, 25, 25 }
-};
-
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
@@ -895,69 +874,12 @@ static void renesas_sdhi_enable_dma(struct tmio_mmc_host *host, bool enable)
 	renesas_sdhi_sdbuf_width(host, enable ? width : 16);
 }
 
-static const struct renesas_sdhi_quirks sdhi_quirks_4tap_nohs400 = {
-	.hs400_disabled = true,
-	.hs400_4taps = true,
-};
-
-static const struct renesas_sdhi_quirks sdhi_quirks_4tap = {
-	.hs400_4taps = true,
-	.hs400_bad_taps = BIT(2) | BIT(3) | BIT(6) | BIT(7),
-};
-
-static const struct renesas_sdhi_quirks sdhi_quirks_nohs400 = {
-	.hs400_disabled = true,
-};
-
-static const struct renesas_sdhi_quirks sdhi_quirks_bad_taps1357 = {
-	.hs400_bad_taps = BIT(1) | BIT(3) | BIT(5) | BIT(7),
-};
-
-static const struct renesas_sdhi_quirks sdhi_quirks_bad_taps2367 = {
-	.hs400_bad_taps = BIT(2) | BIT(3) | BIT(6) | BIT(7),
-};
-
-static const struct renesas_sdhi_quirks sdhi_quirks_r8a7796_es13 = {
-	.hs400_4taps = true,
-	.hs400_bad_taps = BIT(2) | BIT(3) | BIT(6) | BIT(7),
-	.hs400_calib_table = r8a7796_es13_calib_table,
-};
-
-static const struct renesas_sdhi_quirks sdhi_quirks_r8a77965 = {
-	.hs400_bad_taps = BIT(2) | BIT(3) | BIT(6) | BIT(7),
-	.hs400_calib_table = r8a77965_calib_table,
-};
-
-static const struct renesas_sdhi_quirks sdhi_quirks_r8a77990 = {
-	.hs400_calib_table = r8a77990_calib_table,
-};
-
-/*
- * Note for r8a7796 / r8a774a1: we can't distinguish ES1.1 and 1.2 as of now.
- * So, we want to treat them equally and only have a match for ES1.2 to enforce
- * this if there ever will be a way to distinguish ES1.2.
- */
-static const struct soc_device_attribute sdhi_quirks_match[]  = {
-	{ .soc_id = "r8a774a1", .revision = "ES1.[012]", .data = &sdhi_quirks_4tap_nohs400 },
-	{ .soc_id = "r8a7795", .revision = "ES1.*", .data = &sdhi_quirks_4tap_nohs400 },
-	{ .soc_id = "r8a7795", .revision = "ES2.0", .data = &sdhi_quirks_4tap },
-	{ .soc_id = "r8a7795", .revision = "ES3.*", .data = &sdhi_quirks_bad_taps2367 },
-	{ .soc_id = "r8a7796", .revision = "ES1.[012]", .data = &sdhi_quirks_4tap_nohs400 },
-	{ .soc_id = "r8a7796", .revision = "ES1.*", .data = &sdhi_quirks_r8a7796_es13 },
-	{ .soc_id = "r8a77961", .data = &sdhi_quirks_bad_taps1357 },
-	{ .soc_id = "r8a77965", .data = &sdhi_quirks_r8a77965 },
-	{ .soc_id = "r8a77980", .data = &sdhi_quirks_nohs400 },
-	{ .soc_id = "r8a77990", .data = &sdhi_quirks_r8a77990 },
-	{ /* Sentinel. */ },
-};
-
 int renesas_sdhi_probe(struct platform_device *pdev,
-		       const struct tmio_mmc_dma_ops *dma_ops)
+		       const struct tmio_mmc_dma_ops *dma_ops,
+		       const struct renesas_sdhi_of_data *of_data,
+		       const struct renesas_sdhi_quirks *quirks)
 {
 	struct tmio_mmc_data *mmd = pdev->dev.platform_data;
-	const struct renesas_sdhi_quirks *quirks = NULL;
-	const struct renesas_sdhi_of_data *of_data;
-	const struct soc_device_attribute *attr;
 	struct tmio_mmc_data *mmc_data;
 	struct tmio_mmc_dma *dma_priv;
 	struct tmio_mmc_host *host;
@@ -966,12 +888,6 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 	struct resource *res;
 	u16 ver;
 
-	of_data = of_device_get_match_data(&pdev->dev);
-
-	attr = soc_device_match(sdhi_quirks_match);
-	if (attr)
-		quirks = attr->data;
-
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res)
 		return -EINVAL;
diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
index e8f4863d8f1a..7660f7ea74dd 100644
--- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
@@ -15,6 +15,7 @@
 #include <linux/mmc/host.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
+#include <linux/of_device.h>
 #include <linux/pagemap.h>
 #include <linux/scatterlist.h>
 #include <linux/sys_soc.h>
@@ -92,7 +93,7 @@ static struct renesas_sdhi_scc rcar_gen3_scc_taps[] = {
 	},
 };
 
-static const struct renesas_sdhi_of_data of_rza2_compatible = {
+static const struct renesas_sdhi_of_data of_data_rza2 = {
 	.tmio_flags	= TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL |
 			  TMIO_MMC_HAVE_CBSY,
 	.tmio_ocr_mask	= MMC_VDD_32_33,
@@ -107,7 +108,11 @@ static const struct renesas_sdhi_of_data of_rza2_compatible = {
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
@@ -122,11 +127,116 @@ static const struct renesas_sdhi_of_data of_rcar_gen3_compatible = {
 	.max_segs	= 1,
 };
 
+static const u8 r8a7796_es13_calib_table[2][SDHI_CALIB_TABLE_MAX] = {
+	{ 3,  3,  3,  3,  3,  3,  3,  4,  4,  5,  6,  7,  8,  9, 10, 15,
+	 16, 16, 16, 16, 16, 16, 17, 18, 18, 19, 20, 21, 22, 23, 24, 25 },
+	{ 5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5,  6,  7,  8, 11,
+	 12, 17, 18, 18, 18, 18, 18, 18, 18, 19, 20, 21, 22, 23, 25, 25 }
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
+static const struct renesas_sdhi_quirks sdhi_quirks_4tap_nohs400 = {
+	.hs400_disabled = true,
+	.hs400_4taps = true,
+};
+
+static const struct renesas_sdhi_quirks sdhi_quirks_4tap = {
+	.hs400_4taps = true,
+	.hs400_bad_taps = BIT(2) | BIT(3) | BIT(6) | BIT(7),
+};
+
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
+static const struct renesas_sdhi_quirks sdhi_quirks_r8a7796_es13 = {
+	.hs400_4taps = true,
+	.hs400_bad_taps = BIT(2) | BIT(3) | BIT(6) | BIT(7),
+	.hs400_calib_table = r8a7796_es13_calib_table,
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
+/*
+ * Note for r8a7796 / r8a774a1: we can't distinguish ES1.1 and 1.2 as of now.
+ * So, we want to treat them equally and only have a match for ES1.2 to enforce
+ * this if there ever will be a way to distinguish ES1.2.
+ */
+static const struct soc_device_attribute sdhi_quirks_match[]  = {
+	{ .soc_id = "r8a774a1", .revision = "ES1.[012]", .data = &sdhi_quirks_4tap_nohs400 },
+	{ .soc_id = "r8a7795", .revision = "ES1.*", .data = &sdhi_quirks_4tap_nohs400 },
+	{ .soc_id = "r8a7795", .revision = "ES2.0", .data = &sdhi_quirks_4tap },
+	{ .soc_id = "r8a7796", .revision = "ES1.[012]", .data = &sdhi_quirks_4tap_nohs400 },
+	{ .soc_id = "r8a7796", .revision = "ES1.*", .data = &sdhi_quirks_r8a7796_es13 },
+	{ /* Sentinel. */ },
+};
+
+static const struct renesas_sdhi_of_data_with_quirks of_r8a7795_compatible = {
+	.of_data = &of_data_rcar_gen3,
+	.quirks = &sdhi_quirks_bad_taps2367,
+};
+
+static const struct renesas_sdhi_of_data_with_quirks of_r8a77961_compatible = {
+	.of_data = &of_data_rcar_gen3,
+	.quirks = &sdhi_quirks_bad_taps1357,
+};
+
+static const struct renesas_sdhi_of_data_with_quirks of_r8a77965_compatible = {
+	.of_data = &of_data_rcar_gen3,
+	.quirks = &sdhi_quirks_r8a77965,
+};
+
+static const struct renesas_sdhi_of_data_with_quirks of_r8a77980_compatible = {
+	.of_data = &of_data_rcar_gen3,
+	.quirks = &sdhi_quirks_nohs400,
+};
+
+static const struct renesas_sdhi_of_data_with_quirks of_r8a77990_compatible = {
+	.of_data = &of_data_rcar_gen3,
+	.quirks = &sdhi_quirks_r8a77990,
+};
+
+static const struct renesas_sdhi_of_data_with_quirks of_rcar_gen3_compatible = {
+	.of_data = &of_data_rcar_gen3,
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
@@ -405,16 +515,27 @@ static const struct soc_device_attribute soc_dma_quirks[] = {
 
 static int renesas_sdhi_internal_dmac_probe(struct platform_device *pdev)
 {
-	const struct soc_device_attribute *soc = soc_device_match(soc_dma_quirks);
+	const struct soc_device_attribute *attr;
+	const struct renesas_sdhi_of_data_with_quirks *of_data_quirks;
+	const struct renesas_sdhi_quirks *quirks;
 	struct device *dev = &pdev->dev;
 
-	if (soc)
-		global_flags |= (unsigned long)soc->data;
+	of_data_quirks = of_device_get_match_data(&pdev->dev);
+	quirks = of_data_quirks->quirks;
+
+	attr = soc_device_match(soc_dma_quirks);
+	if (attr)
+		global_flags |= (unsigned long)attr->data;
+
+	attr = soc_device_match(sdhi_quirks_match);
+	if (attr)
+		quirks = attr->data;
 
 	/* value is max of SD_SECCNT. Confirmed by HW engineers */
 	dma_set_max_seg_size(dev, 0xffffffff);
 
-	return renesas_sdhi_probe(pdev, &renesas_sdhi_internal_dmac_dma_ops);
+	return renesas_sdhi_probe(pdev, &renesas_sdhi_internal_dmac_dma_ops,
+				  of_data_quirks->of_data, quirks);
 }
 
 static const struct dev_pm_ops renesas_sdhi_internal_dmac_dev_pm_ops = {
diff --git a/drivers/mmc/host/renesas_sdhi_sys_dmac.c b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
index 6956b83469c8..99e3426df702 100644
--- a/drivers/mmc/host/renesas_sdhi_sys_dmac.c
+++ b/drivers/mmc/host/renesas_sdhi_sys_dmac.c
@@ -451,7 +451,8 @@ static const struct tmio_mmc_dma_ops renesas_sdhi_sys_dmac_dma_ops = {
 
 static int renesas_sdhi_sys_dmac_probe(struct platform_device *pdev)
 {
-	return renesas_sdhi_probe(pdev, &renesas_sdhi_sys_dmac_dma_ops);
+	return renesas_sdhi_probe(pdev, &renesas_sdhi_sys_dmac_dma_ops,
+				  of_device_get_match_data(&pdev->dev), NULL);
 }
 
 static const struct dev_pm_ops renesas_sdhi_sys_dmac_dev_pm_ops = {
-- 
2.25.1

