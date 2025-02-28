Return-Path: <linux-renesas-soc+bounces-13801-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D24EA499C3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Feb 2025 13:47:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02569173E1B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Feb 2025 12:47:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C65304C79;
	Fri, 28 Feb 2025 12:47:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE88126A1CB;
	Fri, 28 Feb 2025 12:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740746850; cv=none; b=iUxCjgV6Y1SELLGiO0q69JxQoP9pcphaE2yIEaynLjN4ugrgqFkYqwde42LqC3PWIkEx4bESOO3U/UKDbBs47pB0cAnH7oB9wrYWJI1hLrbJfBctaUSBVCM0MyCBdpDAQJI8rLi8oYQSgO6SCqD40Tkirg50Q5c/0diQSTiwJko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740746850; c=relaxed/simple;
	bh=X8iqi2sfhqWdb/UKGSvIKSahOI33+TeIbHG8+CR5lxY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CBuuYdETRT4xIKQuJMDaBZnauNRikII0SkUCgar8NNfpU//PyS2T9PQY08TNo+XBAUQmAqszA9jfXad6zJIi3SChgN7V+9cZQlPuxUG32c/LgrcuLUNFsx4MDK+8fv2MNZDxn8/ys2UZkzf6YLAbnPBiD2Ic3nVux5Xfwu/dSWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: F/MEJ5L/TpmBYq81EbFpdA==
X-CSE-MsgGUID: PlnzN3hFTGy12va2XPjj3Q==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 28 Feb 2025 21:47:26 +0900
Received: from localhost.localdomain (unknown [10.226.92.94])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 58397402A420;
	Fri, 28 Feb 2025 21:47:24 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-mmc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v4 2/2] mmc: renesas_sdhi: Add support for RZ/G3E SoC
Date: Fri, 28 Feb 2025 12:47:09 +0000
Message-ID: <20250228124713.153979-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250228124713.153979-1-biju.das.jz@bp.renesas.com>
References: <20250228124713.153979-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The SDHI/eMMC IPs in the RZ/G3E SoC are similar to those in R-Car Gen3.
However, the RZ/G3E SD0 channel has Voltage level control and PWEN pin
support via SD_STATUS register.

internal regulator support is added to control the voltage levels of
the SD pins via sd_iovs/sd_pwen bits in SD_STATUS register by populating
vqmmc-regulator child node.

SD1 and SD2 channels have gpio regulator support and internal regulator
support. Selection of the regulator is based on the regulator phandle.
Similar case for SD0 fixed voltage (eMMC) that uses fixed regulator and
SD0 non-fixed voltage (SD0) that uses internal regulator.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Added sd_ctrl_read32()
 * Replaced sd_ctrl_read32_rep()->sd_ctrl_read32().
 * Arranged variables of same types close to each other in probe().
v2->v3:
 * No change.
v1->v2:
 * Updated commit description for regulator used in SD0 fixed and
   non-fixed voltage case.
 * As the node enabling of internal regulator is controlled through status,
   added a check for device availability.
---
 drivers/mmc/host/renesas_sdhi.h      |   1 +
 drivers/mmc/host/renesas_sdhi_core.c | 134 +++++++++++++++++++++++++++
 drivers/mmc/host/tmio_mmc.h          |  10 ++
 3 files changed, 145 insertions(+)

diff --git a/drivers/mmc/host/renesas_sdhi.h b/drivers/mmc/host/renesas_sdhi.h
index f12a87442338..291ddb4ad9be 100644
--- a/drivers/mmc/host/renesas_sdhi.h
+++ b/drivers/mmc/host/renesas_sdhi.h
@@ -95,6 +95,7 @@ struct renesas_sdhi {
 
 	struct reset_control *rstc;
 	struct tmio_mmc_host *host;
+	struct regulator_dev *rdev;
 };
 
 #define host_to_priv(host) \
diff --git a/drivers/mmc/host/renesas_sdhi_core.c b/drivers/mmc/host/renesas_sdhi_core.c
index f73b84bae0c4..0a5619badc08 100644
--- a/drivers/mmc/host/renesas_sdhi_core.c
+++ b/drivers/mmc/host/renesas_sdhi_core.c
@@ -32,6 +32,8 @@
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
 #include <linux/regulator/consumer.h>
+#include <linux/regulator/driver.h>
+#include <linux/regulator/of_regulator.h>
 #include <linux/reset.h>
 #include <linux/sh_dma.h>
 #include <linux/slab.h>
@@ -581,12 +583,24 @@ static void renesas_sdhi_reset(struct tmio_mmc_host *host, bool preserve)
 
 	if (!preserve) {
 		if (priv->rstc) {
+			u32 sd_status;
+			/*
+			 * HW reset might have toggled the regulator state in
+			 * HW which regulator core might be unaware of so save
+			 * and restore the regulator state during HW reset.
+			 */
+			if (priv->rdev)
+				sd_status = sd_ctrl_read32(host, CTL_SD_STATUS);
+
 			reset_control_reset(priv->rstc);
 			/* Unknown why but without polling reset status, it will hang */
 			read_poll_timeout(reset_control_status, ret, ret == 0, 1, 100,
 					  false, priv->rstc);
 			/* At least SDHI_VER_GEN2_SDR50 needs manual release of reset */
 			sd_ctrl_write16(host, CTL_RESET_SD, 0x0001);
+			if (priv->rdev)
+				sd_ctrl_write32(host, CTL_SD_STATUS, sd_status);
+
 			priv->needs_adjust_hs400 = false;
 			renesas_sdhi_set_clock(host, host->clk_cache);
 
@@ -904,6 +918,101 @@ static void renesas_sdhi_enable_dma(struct tmio_mmc_host *host, bool enable)
 	renesas_sdhi_sdbuf_width(host, enable ? width : 16);
 }
 
+static const unsigned int renesas_sdhi_vqmmc_voltages[] = {
+	3300000, 1800000
+};
+
+static int renesas_sdhi_regulator_disable(struct regulator_dev *rdev)
+{
+	struct tmio_mmc_host *host = rdev_get_drvdata(rdev);
+	u32 sd_status;
+
+	sd_status = sd_ctrl_read32(host, CTL_SD_STATUS);
+	sd_status &= ~SD_STATUS_PWEN;
+	sd_ctrl_write32(host, CTL_SD_STATUS, sd_status);
+
+	return 0;
+}
+
+static int renesas_sdhi_regulator_enable(struct regulator_dev *rdev)
+{
+	struct tmio_mmc_host *host = rdev_get_drvdata(rdev);
+	u32 sd_status;
+
+	sd_status = sd_ctrl_read32(host, CTL_SD_STATUS);
+	sd_status |= SD_STATUS_PWEN;
+	sd_ctrl_write32(host, CTL_SD_STATUS, sd_status);
+
+	return 0;
+}
+
+static int renesas_sdhi_regulator_is_enabled(struct regulator_dev *rdev)
+{
+	struct tmio_mmc_host *host = rdev_get_drvdata(rdev);
+	u32 sd_status;
+
+	sd_status = sd_ctrl_read32(host, CTL_SD_STATUS);
+
+	return (sd_status & SD_STATUS_PWEN) ? 1 : 0;
+}
+
+static int renesas_sdhi_regulator_get_voltage(struct regulator_dev *rdev)
+{
+	struct tmio_mmc_host *host = rdev_get_drvdata(rdev);
+	u32 sd_status;
+
+	sd_status = sd_ctrl_read32(host, CTL_SD_STATUS);
+
+	return (sd_status & SD_STATUS_IOVS) ? 1800000 : 3300000;
+}
+
+static int renesas_sdhi_regulator_set_voltage(struct regulator_dev *rdev,
+					      int min_uV, int max_uV,
+					      unsigned int *selector)
+{
+	struct tmio_mmc_host *host = rdev_get_drvdata(rdev);
+	u32 sd_status;
+
+	sd_status = sd_ctrl_read32(host, CTL_SD_STATUS);
+	if (min_uV >= 1700000 && max_uV <= 1950000) {
+		sd_status |= SD_STATUS_IOVS;
+		*selector = 1;
+	} else {
+		sd_status &= ~SD_STATUS_IOVS;
+		*selector = 0;
+	}
+	sd_ctrl_write32(host, CTL_SD_STATUS, sd_status);
+
+	return 0;
+}
+
+static int renesas_sdhi_regulator_list_voltage(struct regulator_dev *rdev,
+					       unsigned int selector)
+{
+	if (selector >= ARRAY_SIZE(renesas_sdhi_vqmmc_voltages))
+		return -EINVAL;
+
+	return renesas_sdhi_vqmmc_voltages[selector];
+}
+
+static const struct regulator_ops renesas_sdhi_regulator_voltage_ops = {
+	.enable = renesas_sdhi_regulator_enable,
+	.disable = renesas_sdhi_regulator_disable,
+	.is_enabled = renesas_sdhi_regulator_is_enabled,
+	.list_voltage = renesas_sdhi_regulator_list_voltage,
+	.get_voltage = renesas_sdhi_regulator_get_voltage,
+	.set_voltage = renesas_sdhi_regulator_set_voltage,
+};
+
+static struct regulator_desc renesas_sdhi_vqmmc_regulator = {
+	.of_match	= of_match_ptr("vqmmc-regulator"),
+	.owner		= THIS_MODULE,
+	.type		= REGULATOR_VOLTAGE,
+	.ops		= &renesas_sdhi_regulator_voltage_ops,
+	.volt_table	= renesas_sdhi_vqmmc_voltages,
+	.n_voltages	= ARRAY_SIZE(renesas_sdhi_vqmmc_voltages),
+};
+
 int renesas_sdhi_probe(struct platform_device *pdev,
 		       const struct tmio_mmc_dma_ops *dma_ops,
 		       const struct renesas_sdhi_of_data *of_data,
@@ -911,7 +1020,10 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 {
 	struct tmio_mmc_data *mmd = pdev->dev.platform_data;
 	struct tmio_mmc_data *mmc_data;
+	struct regulator_config rcfg = { .dev = &pdev->dev, };
+	struct regulator_dev *rdev;
 	struct renesas_sdhi_dma *dma_priv;
+	struct device *dev = &pdev->dev;
 	struct tmio_mmc_host *host;
 	struct renesas_sdhi *priv;
 	int num_irqs, irq, ret, i;
@@ -1053,6 +1165,28 @@ int renesas_sdhi_probe(struct platform_device *pdev,
 	if (ret)
 		goto efree;
 
+	rcfg.of_node = of_get_child_by_name(dev->of_node, "vqmmc-regulator");
+	if (!of_device_is_available(rcfg.of_node)) {
+		of_node_put(rcfg.of_node);
+		rcfg.of_node = NULL;
+	}
+
+	if (rcfg.of_node) {
+		rcfg.driver_data = priv->host;
+
+		renesas_sdhi_vqmmc_regulator.name = "sdhi-vqmmc-regulator";
+		renesas_sdhi_vqmmc_regulator.of_match = of_match_ptr("vqmmc-regulator");
+		renesas_sdhi_vqmmc_regulator.type = REGULATOR_VOLTAGE;
+		renesas_sdhi_vqmmc_regulator.owner = THIS_MODULE;
+		rdev = devm_regulator_register(dev, &renesas_sdhi_vqmmc_regulator, &rcfg);
+		of_node_put(rcfg.of_node);
+		if (IS_ERR(rdev)) {
+			dev_err(dev, "regulator register failed err=%ld", PTR_ERR(rdev));
+			goto efree;
+		}
+		priv->rdev = rdev;
+	}
+
 	ver = sd_ctrl_read16(host, CTL_VERSION);
 	/* GEN2_SDR104 is first known SDHI to use 32bit block count */
 	if (ver < SDHI_VER_GEN2_SDR104 && mmc_data->max_blk_count > U16_MAX)
diff --git a/drivers/mmc/host/tmio_mmc.h b/drivers/mmc/host/tmio_mmc.h
index a75755f31d31..41787ea77a13 100644
--- a/drivers/mmc/host/tmio_mmc.h
+++ b/drivers/mmc/host/tmio_mmc.h
@@ -44,6 +44,7 @@
 #define CTL_RESET_SD 0xe0
 #define CTL_VERSION 0xe2
 #define CTL_SDIF_MODE 0xe6 /* only known on R-Car 2+ */
+#define CTL_SD_STATUS 0xf2 /* only known on RZ/{G2L,G3E,V2H} */
 
 /* Definitions for values the CTL_STOP_INTERNAL_ACTION register can take */
 #define TMIO_STOP_STP		BIT(0)
@@ -103,6 +104,10 @@
 /* Definitions for values the CTL_SDIF_MODE register can take */
 #define SDIF_MODE_HS400		BIT(0) /* only known on R-Car 2+ */
 
+/* Definitions for values the CTL_SD_STATUS register can take */
+#define SD_STATUS_PWEN		BIT(0) /* only known on RZ/{G3E,V2H} */
+#define SD_STATUS_IOVS		BIT(16) /* only known on RZ/{G3E,V2H} */
+
 /* Define some IRQ masks */
 /* This is the mask used at reset by the chip */
 #define TMIO_MASK_ALL           0x837f031d
@@ -226,6 +231,11 @@ static inline u32 sd_ctrl_read16_and_16_as_32(struct tmio_mmc_host *host,
 	       ioread16(host->ctl + ((addr + 2) << host->bus_shift)) << 16;
 }
 
+static inline u32 sd_ctrl_read32(struct tmio_mmc_host *host, int addr)
+{
+	return ioread32(host->ctl + (addr << host->bus_shift));
+}
+
 static inline void sd_ctrl_read32_rep(struct tmio_mmc_host *host, int addr,
 				      u32 *buf, int count)
 {
-- 
2.43.0


