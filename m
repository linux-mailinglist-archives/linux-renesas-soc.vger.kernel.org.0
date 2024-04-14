Return-Path: <linux-renesas-soc+bounces-4377-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EF389B53F
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Apr 2024 03:25:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 929FC1F214BB
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  8 Apr 2024 01:25:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C86141C3D;
	Mon,  8 Apr 2024 01:25:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DCB54404;
	Mon,  8 Apr 2024 01:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712539514; cv=none; b=XsYOsp1aXYXWHnJFSBsMMR4VKp8mNq+RsMtMB1xPlZpnO5X9oQb4VCqJOnxhGCFLheL0iqxUBxXsKAO+GQ/TNs6uiQ9xa22F3U0dwv4xXtKudjun+jx9D6TckTumGHq732BuAQbi7+TdnaG5ZJngUUanh7NSCvt9jw91uagh8IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712539514; c=relaxed/simple;
	bh=FLsDFCgSfqYTWOggIiWBh8cBEnuiwQFtUf03KsTwVbc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XHznwgq2sBmOSLSBWNsmjdwcjc4ABEf3XA/OtSVROcUFE1eobkofOiqqsbbEXzIdWCbH2wkMZRXPEcbrDb+dRSULMU2eZbjgKCgo0AYZH1ho/d1ko/TZ9hQH/tqkjV8sky1E2SZwoyHeQ8Ti1djTrOi63Bc6uLwhkI+PyW/rKgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-IronPort-AV: E=Sophos;i="6.07,186,1708354800"; 
   d="scan'208";a="200660428"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 08 Apr 2024 10:25:00 +0900
Received: from localhost.localdomain (unknown [10.166.13.99])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 99B26402C339;
	Mon,  8 Apr 2024 10:25:00 +0900 (JST)
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: lpieralisi@kernel.org,
	kw@linux.com,
	robh@kernel.org,
	bhelgaas@google.com,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	jingoohan1@gmail.com,
	mani@kernel.org
Cc: marek.vasut+renesas@gmail.com,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v5 6/7] PCI: dwc: rcar-gen4: Add support for r8a779g0
Date: Mon,  8 Apr 2024 10:24:57 +0900
Message-Id: <20240408012458.3717977-7-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240408012458.3717977-1-yoshihiro.shimoda.uh@renesas.com>
References: <20240408012458.3717977-1-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This driver previously supported r8a779f0 (R-Car S4-8). Add support
for r8a779g0 (R-Car V4H).

To support r8a779g0, it requires specific firmware.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/pci/controller/dwc/pcie-rcar-gen4.c | 201 +++++++++++++++++++-
 1 file changed, 200 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
index 47ec394885f5..a62804674f4e 100644
--- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
+++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
@@ -5,8 +5,10 @@
  */
 
 #include <linux/delay.h>
+#include <linux/firmware.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/pci.h>
@@ -20,9 +22,10 @@
 /* Renesas-specific */
 /* PCIe Mode Setting Register 0 */
 #define PCIEMSR0		0x0000
-#define BIFUR_MOD_SET_ON	BIT(0)
+#define APP_SRIS_MODE		BIT(6)
 #define DEVICE_TYPE_EP		0
 #define DEVICE_TYPE_RC		BIT(4)
+#define BIFUR_MOD_SET_ON	BIT(0)
 
 /* PCIe Interrupt Status 0 */
 #define PCIEINTSTS0		0x0084
@@ -37,19 +40,47 @@
 #define PCIEDMAINTSTSEN		0x0314
 #define PCIEDMAINTSTSEN_INIT	GENMASK(15, 0)
 
+/* Port Logic Registers 89 */
+#define PRTLGC89		0x0b70
+
+/* Port Logic Registers 90 */
+#define PRTLGC90		0x0b74
+
 /* PCIe Reset Control Register 1 */
 #define PCIERSTCTRL1		0x0014
 #define APP_HOLD_PHY_RST	BIT(16)
 #define APP_LTSSM_ENABLE	BIT(0)
 
+/* PCIe Power Management Control */
+#define PCIEPWRMNGCTRL		0x0070
+#define APP_CLK_REQ_N		BIT(11)
+#define APP_CLK_PM_EN		BIT(10)
+
+/*
+ * The R-Car Gen4 documents don't describe the PHY registers' name.
+ * But, the initialization procedure describes these offsets. So,
+ * this driver makes up own #defines for the offsets.
+ */
+#define RCAR_GEN4_PCIE_PHY_0f8	0x0f8
+#define RCAR_GEN4_PCIE_PHY_148	0x148
+#define RCAR_GEN4_PCIE_PHY_1d4	0x1d4
+#define RCAR_GEN4_PCIE_PHY_514	0x514
+#define RCAR_GEN4_PCIE_PHY_700	0x700
+
 #define RCAR_NUM_SPEED_CHANGE_RETRIES	10
 #define RCAR_MAX_LINK_SPEED		4
 
 #define RCAR_GEN4_PCIE_EP_FUNC_DBI_OFFSET	0x1000
 #define RCAR_GEN4_PCIE_EP_FUNC_DBI2_OFFSET	0x800
 
+#define RCAR_GEN4_PCIE_FIRMWARE_NAME		"rcar_gen4_pcie.bin"
+#define RCAR_GEN4_PCIE_FIRMWARE_BASE_ADDR	0xc000
+
+MODULE_FIRMWARE(RCAR_GEN4_PCIE_FIRMWARE_NAME);
+
 struct rcar_gen4_pcie;
 struct rcar_gen4_pcie_platdata {
+	void (*additional_common_init)(struct rcar_gen4_pcie *rcar);
 	int (*ltssm_enable)(struct rcar_gen4_pcie *rcar);
 	enum dw_pcie_device_mode mode;
 };
@@ -57,12 +88,144 @@ struct rcar_gen4_pcie_platdata {
 struct rcar_gen4_pcie {
 	struct dw_pcie dw;
 	void __iomem *base;
+	void __iomem *phy_base;
 	struct platform_device *pdev;
 	const struct rcar_gen4_pcie_platdata *platdata;
 };
 #define to_rcar_gen4_pcie(_dw)	container_of(_dw, struct rcar_gen4_pcie, dw)
 
 /* Common */
+static void rcar_gen4_pcie_phy_reg_update_bits(struct rcar_gen4_pcie *rcar,
+					       u32 offset, u32 mask, u32 val)
+{
+	u32 tmp;
+
+	tmp = readl(rcar->phy_base + offset);
+	tmp &= ~mask;
+	tmp |= val;
+	writel(tmp, rcar->phy_base + offset);
+}
+
+static int rcar_gen4_pcie_reg_check_bit(struct rcar_gen4_pcie *rcar,
+					u32 offset, u32 mask)
+{
+	struct dw_pcie *dw = &rcar->dw;
+
+	if (dw_pcie_readl_dbi(dw, offset) & mask)
+		return -EAGAIN;
+
+	return 0;
+}
+
+static int rcar_gen4_pcie_update_phy_firmware(struct rcar_gen4_pcie *rcar)
+{
+	const u32 check_addr[] = { 0x00101018, 0x00101118, 0x00101021, 0x00101121};
+	struct dw_pcie *dw = &rcar->dw;
+	const struct firmware *fw;
+	unsigned int i, timeout;
+	u32 data;
+	int ret;
+
+	ret = request_firmware(&fw, RCAR_GEN4_PCIE_FIRMWARE_NAME, dw->dev);
+	if (ret) {
+		dev_err(dw->dev, "%s: Requesting firmware failed\n", __func__);
+		return ret;
+	}
+
+	for (i = 0; i < (fw->size / 2); i++) {
+		data = fw->data[i * 2] | fw->data[(i * 2) + 1] << 8;
+		timeout = 100;
+		do {
+			dw_pcie_writel_dbi(dw, PRTLGC89, RCAR_GEN4_PCIE_FIRMWARE_BASE_ADDR + i);
+			dw_pcie_writel_dbi(dw, PRTLGC90, data);
+			if (rcar_gen4_pcie_reg_check_bit(rcar, PRTLGC89, BIT(30)) >= 0)
+				break;
+			if (!(--timeout)) {
+				ret = -ETIMEDOUT;
+				goto exit;
+			}
+			usleep_range(100, 200);
+		} while (1);
+	}
+
+	rcar_gen4_pcie_phy_reg_update_bits(rcar, RCAR_GEN4_PCIE_PHY_0f8, BIT(17), BIT(17));
+
+	for (i = 0; i < ARRAY_SIZE(check_addr); i++) {
+		timeout = 100;
+		do {
+			dw_pcie_writel_dbi(dw, PRTLGC89, check_addr[i]);
+			ret = rcar_gen4_pcie_reg_check_bit(rcar, PRTLGC89, BIT(30));
+			ret |= rcar_gen4_pcie_reg_check_bit(rcar, PRTLGC90, BIT(0));
+			if (ret >= 0)
+				break;
+			if (!(--timeout)) {
+				ret = -ETIMEDOUT;
+				goto exit;
+			}
+			usleep_range(100, 200);
+		} while (1);
+	}
+
+	ret = 0;
+exit:
+	release_firmware(fw);
+
+	return ret;
+}
+
+static int rcar_gen4_pcie_enable_phy(struct rcar_gen4_pcie *rcar)
+{
+	struct dw_pcie *dw = &rcar->dw;
+	u32 val;
+	int ret;
+
+	val = dw_pcie_readl_dbi(dw, PCIE_PORT_FORCE);
+	val |= PORT_FORCE_DO_DESKEW_FOR_SRIS;
+	dw_pcie_writel_dbi(dw, PCIE_PORT_FORCE, val);
+
+	val = readl(rcar->base + PCIEMSR0);
+	val |= APP_SRIS_MODE;
+	writel(val, rcar->base + PCIEMSR0);
+
+	rcar_gen4_pcie_phy_reg_update_bits(rcar, RCAR_GEN4_PCIE_PHY_700, BIT(28), 0);
+	rcar_gen4_pcie_phy_reg_update_bits(rcar, RCAR_GEN4_PCIE_PHY_700, BIT(20), 0);
+	rcar_gen4_pcie_phy_reg_update_bits(rcar, RCAR_GEN4_PCIE_PHY_700, BIT(12), 0);
+	rcar_gen4_pcie_phy_reg_update_bits(rcar, RCAR_GEN4_PCIE_PHY_700, BIT(4), 0);
+
+	rcar_gen4_pcie_phy_reg_update_bits(rcar, RCAR_GEN4_PCIE_PHY_148,
+					   GENMASK(23, 22), BIT(22));
+	rcar_gen4_pcie_phy_reg_update_bits(rcar, RCAR_GEN4_PCIE_PHY_148,
+					   GENMASK(18, 16), GENMASK(17, 16));
+	rcar_gen4_pcie_phy_reg_update_bits(rcar, RCAR_GEN4_PCIE_PHY_148,
+					   GENMASK(7, 6), BIT(6));
+	rcar_gen4_pcie_phy_reg_update_bits(rcar, RCAR_GEN4_PCIE_PHY_148,
+					   GENMASK(2, 0), GENMASK(11, 0));
+	rcar_gen4_pcie_phy_reg_update_bits(rcar, RCAR_GEN4_PCIE_PHY_1d4,
+					   GENMASK(16, 15), GENMASK(16, 15));
+	rcar_gen4_pcie_phy_reg_update_bits(rcar, RCAR_GEN4_PCIE_PHY_514, BIT(26), BIT(26));
+	rcar_gen4_pcie_phy_reg_update_bits(rcar, RCAR_GEN4_PCIE_PHY_0f8, BIT(16), 0);
+	rcar_gen4_pcie_phy_reg_update_bits(rcar, RCAR_GEN4_PCIE_PHY_0f8, BIT(19), BIT(19));
+
+	val = readl(rcar->base + PCIERSTCTRL1);
+	val &= ~APP_HOLD_PHY_RST;
+	writel(val, rcar->base + PCIERSTCTRL1);
+
+	ret = readl_poll_timeout(rcar->phy_base + RCAR_GEN4_PCIE_PHY_0f8, val,
+				 !(val & BIT(18)), 100, 10000);
+	if (ret < 0)
+		return ret;
+
+	ret = rcar_gen4_pcie_update_phy_firmware(rcar);
+	if (ret)
+		return ret;
+
+	val = readl(rcar->base + PCIERSTCTRL1);
+	val |= APP_LTSSM_ENABLE;
+	writel(val, rcar->base + PCIERSTCTRL1);
+
+	return 0;
+}
+
 static void rcar_gen4_pcie_ltssm_control(struct rcar_gen4_pcie *rcar,
 					 bool enable)
 {
@@ -200,6 +363,9 @@ static int rcar_gen4_pcie_common_init(struct rcar_gen4_pcie *rcar)
 	if (ret)
 		goto err_unprepare;
 
+	if (rcar->platdata->additional_common_init)
+		rcar->platdata->additional_common_init(rcar);
+
 	return 0;
 
 err_unprepare:
@@ -241,6 +407,10 @@ static void rcar_gen4_pcie_unprepare(struct rcar_gen4_pcie *rcar)
 
 static int rcar_gen4_pcie_get_resources(struct rcar_gen4_pcie *rcar)
 {
+	rcar->phy_base = devm_platform_ioremap_resource_byname(rcar->pdev, "phy");
+	if (IS_ERR(rcar->phy_base))
+		return PTR_ERR(rcar->base);
+
 	/* Renesas-specific registers */
 	rcar->base = devm_platform_ioremap_resource_byname(rcar->pdev, "app");
 
@@ -517,6 +687,31 @@ static int r8a779f0_pcie_ltssm_enable(struct rcar_gen4_pcie *rcar)
 	return 0;
 }
 
+static void rcar_gen4_pcie_additional_common_init(struct rcar_gen4_pcie *rcar)
+{
+	struct dw_pcie *dw = &rcar->dw;
+	u32 val;
+
+	/*
+	 * The SoC manual said the register setting is required. Otherwise,
+	 * linkup failed.
+	 */
+	val = dw_pcie_readl_dbi(dw, PCIE_PORT_LANE_SKEW);
+	val &= ~PORT_LANE_SKEW_INSERT_MASK;
+	if (dw->num_lanes < 4)
+		val |= BIT(6);
+	dw_pcie_writel_dbi(dw, PCIE_PORT_LANE_SKEW, val);
+
+	val = readl(rcar->base + PCIEPWRMNGCTRL);
+	val |= APP_CLK_REQ_N | APP_CLK_PM_EN;
+	writel(val, rcar->base + PCIEPWRMNGCTRL);
+}
+
+static int rcar_gen4_pcie_ltssm_enable(struct rcar_gen4_pcie *rcar)
+{
+	return rcar_gen4_pcie_enable_phy(rcar);
+}
+
 static struct rcar_gen4_pcie_platdata platdata_r8a779f0_pcie = {
 	.ltssm_enable = r8a779f0_pcie_ltssm_enable,
 	.mode = DW_PCIE_RC_TYPE,
@@ -528,10 +723,14 @@ static struct rcar_gen4_pcie_platdata platdata_r8a779f0_pcie_ep = {
 };
 
 static struct rcar_gen4_pcie_platdata platdata_rcar_gen4_pcie = {
+	.additional_common_init = rcar_gen4_pcie_additional_common_init,
+	.ltssm_enable = rcar_gen4_pcie_ltssm_enable,
 	.mode = DW_PCIE_RC_TYPE,
 };
 
 static struct rcar_gen4_pcie_platdata platdata_rcar_gen4_pcie_ep = {
+	.additional_common_init = rcar_gen4_pcie_additional_common_init,
+	.ltssm_enable = rcar_gen4_pcie_ltssm_enable,
 	.mode = DW_PCIE_EP_TYPE,
 };
 
-- 
2.25.1


