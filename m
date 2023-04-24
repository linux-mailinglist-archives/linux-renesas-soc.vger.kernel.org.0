Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 852886E619F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Apr 2023 14:26:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231195AbjDRM0J (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Apr 2023 08:26:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231493AbjDRMZz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Apr 2023 08:25:55 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9EB439023;
        Tue, 18 Apr 2023 05:25:34 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.99,207,1677510000"; 
   d="scan'208";a="159867461"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 18 Apr 2023 21:24:15 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 74E38423C45C;
        Tue, 18 Apr 2023 21:24:15 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     jingoohan1@gmail.com, mani@kernel.org,
        gustavo.pimentel@synopsys.com, fancer.lancer@gmail.com,
        lpieralisi@kernel.org, robh+dt@kernel.org, kw@linux.com,
        bhelgaas@google.com, kishon@kernel.org
Cc:     marek.vasut+renesas@gmail.com, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v13 19/22] PCI: rcar-gen4: Add R-Car Gen4 PCIe Host support
Date:   Tue, 18 Apr 2023 21:24:00 +0900
Message-Id: <20230418122403.3178462-20-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230418122403.3178462-1-yoshihiro.shimoda.uh@renesas.com>
References: <20230418122403.3178462-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add R-Car Gen4 PCIe Host support. This controller is based on
Synopsys DesignWare PCIe.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/pci/controller/dwc/Kconfig            |   9 +
 drivers/pci/controller/dwc/Makefile           |   2 +
 .../pci/controller/dwc/pcie-rcar-gen4-host.c  | 134 +++++++++++++
 drivers/pci/controller/dwc/pcie-rcar-gen4.c   | 187 ++++++++++++++++++
 drivers/pci/controller/dwc/pcie-rcar-gen4.h   |  49 +++++
 5 files changed, 381 insertions(+)
 create mode 100644 drivers/pci/controller/dwc/pcie-rcar-gen4-host.c
 create mode 100644 drivers/pci/controller/dwc/pcie-rcar-gen4.c
 create mode 100644 drivers/pci/controller/dwc/pcie-rcar-gen4.h

diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
index d29551261e80..eb90e2116e59 100644
--- a/drivers/pci/controller/dwc/Kconfig
+++ b/drivers/pci/controller/dwc/Kconfig
@@ -415,4 +415,13 @@ config PCIE_FU740
 	  Say Y here if you want PCIe controller support for the SiFive
 	  FU740.
 
+config PCIE_RCAR_GEN4
+	tristate "Renesas R-Car Gen4 PCIe Host controller"
+	depends on ARCH_RENESAS || COMPILE_TEST
+	depends on PCI_MSI
+	select PCIE_DW_HOST
+	help
+	  Say Y here if you want PCIe host controller support on R-Car Gen4 SoCs.
+	  This uses the DesignWare core.
+
 endmenu
diff --git a/drivers/pci/controller/dwc/Makefile b/drivers/pci/controller/dwc/Makefile
index bf5c311875a1..486cf706b53d 100644
--- a/drivers/pci/controller/dwc/Makefile
+++ b/drivers/pci/controller/dwc/Makefile
@@ -26,6 +26,8 @@ obj-$(CONFIG_PCIE_TEGRA194) += pcie-tegra194.o
 obj-$(CONFIG_PCIE_UNIPHIER) += pcie-uniphier.o
 obj-$(CONFIG_PCIE_UNIPHIER_EP) += pcie-uniphier-ep.o
 obj-$(CONFIG_PCIE_VISCONTI_HOST) += pcie-visconti.o
+pcie-rcar-gen4-host-drv-objs := pcie-rcar-gen4.o pcie-rcar-gen4-host.o
+obj-$(CONFIG_PCIE_RCAR_GEN4) += pcie-rcar-gen4-host-drv.o
 
 # The following drivers are for devices that use the generic ACPI
 # pci_root.c driver but don't support standard ECAM config access.
diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4-host.c b/drivers/pci/controller/dwc/pcie-rcar-gen4-host.c
new file mode 100644
index 000000000000..067fbd2a8d50
--- /dev/null
+++ b/drivers/pci/controller/dwc/pcie-rcar-gen4-host.c
@@ -0,0 +1,134 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * PCIe host controller driver for Renesas R-Car Gen4 Series SoCs
+ * Copyright (C) 2022-2023 Renesas Electronics Corporation
+ */
+
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/of_device.h>
+#include <linux/pci.h>
+#include <linux/platform_device.h>
+
+#include "pcie-rcar-gen4.h"
+#include "pcie-designware.h"
+
+static int rcar_gen4_pcie_host_init(struct dw_pcie_rp *pp)
+{
+	struct dw_pcie *dw = to_dw_pcie_from_pp(pp);
+	struct rcar_gen4_pcie *rcar = to_rcar_gen4_pcie(dw);
+	int ret;
+	u32 val;
+
+	ret = rcar_gen4_pcie_set_device_type(rcar, true, dw->num_lanes);
+	if (ret < 0)
+		return ret;
+
+	dw_pcie_dbi_ro_wr_en(dw);
+
+	/*
+	 * According to the databook, we should disable two BARs to avoid
+	 * unnecessary memory assignment during device enumeration.
+	 */
+	rcar_gen4_pcie_disable_bar(dw, PCI_BASE_ADDRESS_0);
+	rcar_gen4_pcie_disable_bar(dw, PCI_BASE_ADDRESS_1);
+
+	dw_pcie_dbi_ro_wr_dis(dw);
+
+	if (IS_ENABLED(CONFIG_PCI_MSI)) {
+		/* Enable MSI interrupt signal */
+		val = readl(rcar->base + PCIEINTSTS0EN);
+		val |= MSI_CTRL_INT;
+		writel(val, rcar->base + PCIEINTSTS0EN);
+	}
+
+	gpiod_set_value_cansleep(dw->pe_rst, 0);
+
+	return 0;
+}
+
+static const struct dw_pcie_host_ops rcar_gen4_pcie_host_ops = {
+	.host_init = rcar_gen4_pcie_host_init,
+};
+
+static int rcar_gen4_add_dw_pcie_rp(struct rcar_gen4_pcie *rcar,
+				   struct platform_device *pdev)
+{
+	struct dw_pcie *dw = &rcar->dw;
+	struct dw_pcie_rp *pp = &dw->pp;
+
+	pp->num_vectors = MAX_MSI_IRQS;
+	pp->ops = &rcar_gen4_pcie_host_ops;
+	dw_pcie_cap_set(dw, REQ_RES);
+
+	return dw_pcie_host_init(pp);
+}
+
+static void rcar_gen4_remove_dw_pcie_rp(struct rcar_gen4_pcie *rcar)
+{
+	dw_pcie_host_deinit(&rcar->dw.pp);
+	gpiod_set_value_cansleep(rcar->dw.pe_rst, 1);
+}
+
+static int rcar_gen4_pcie_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct rcar_gen4_pcie *rcar;
+	int err;
+
+	rcar = rcar_gen4_pcie_devm_alloc(dev);
+	if (!rcar)
+		return -ENOMEM;
+
+	err = rcar_gen4_pcie_get_resources(rcar, pdev);
+	if (err < 0) {
+		dev_err(dev, "Failed to request resource: %d\n", err);
+		return err;
+	}
+
+	platform_set_drvdata(pdev, rcar);
+
+	err = rcar_gen4_pcie_prepare(rcar);
+	if (err < 0)
+		return err;
+
+	rcar->needs_retrain = true;
+	err = rcar_gen4_add_dw_pcie_rp(rcar, pdev);
+	if (err < 0)
+		goto err_add;
+
+	return 0;
+
+err_add:
+	rcar_gen4_pcie_unprepare(rcar);
+
+	return err;
+}
+
+static int rcar_gen4_pcie_remove(struct platform_device *pdev)
+{
+	struct rcar_gen4_pcie *rcar = platform_get_drvdata(pdev);
+
+	rcar_gen4_remove_dw_pcie_rp(rcar);
+	rcar_gen4_pcie_unprepare(rcar);
+
+	return 0;
+}
+
+static const struct of_device_id rcar_gen4_pcie_of_match[] = {
+	{ .compatible = "renesas,rcar-gen4-pcie", },
+	{},
+};
+
+static struct platform_driver rcar_gen4_pcie_driver = {
+	.driver = {
+		.name = "pcie-rcar-gen4",
+		.of_match_table = rcar_gen4_pcie_of_match,
+	},
+	.probe = rcar_gen4_pcie_probe,
+	.remove = rcar_gen4_pcie_remove,
+};
+module_platform_driver(rcar_gen4_pcie_driver);
+
+MODULE_DESCRIPTION("Renesas R-Car Gen4 PCIe host controller driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
new file mode 100644
index 000000000000..89cec76a41ab
--- /dev/null
+++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
@@ -0,0 +1,187 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * PCIe host/endpoint controller driver for Renesas R-Car Gen4 Series SoCs
+ * Copyright (C) 2022-2023 Renesas Electronics Corporation
+ */
+
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/of_device.h>
+#include <linux/pci.h>
+#include <linux/pm_runtime.h>
+#include <linux/reset.h>
+
+#include "pcie-rcar-gen4.h"
+#include "pcie-designware.h"
+
+/* Renesas-specific */
+#define PCIERSTCTRL1		0x0014
+#define  APP_HOLD_PHY_RST	BIT(16)
+#define  APP_LTSSM_ENABLE	BIT(0)
+
+#define RETRAIN_MAX_RETRY	10
+
+static void rcar_gen4_pcie_ltssm_enable(struct rcar_gen4_pcie *rcar,
+					bool enable)
+{
+	u32 val;
+
+	val = readl(rcar->base + PCIERSTCTRL1);
+	if (enable) {
+		val |= APP_LTSSM_ENABLE;
+		val &= ~APP_HOLD_PHY_RST;
+	} else {
+		val &= ~APP_LTSSM_ENABLE;
+		val |= APP_HOLD_PHY_RST;
+	}
+	writel(val, rcar->base + PCIERSTCTRL1);
+}
+
+static bool rcar_gen4_pcie_check_retrain_link(struct dw_pcie *dw)
+{
+	u8 offset = dw_pcie_find_capability(dw, PCI_CAP_ID_EXP);
+	u32 lnkcap = dw_pcie_readl_dbi(dw, offset + PCI_EXP_LNKCAP);
+	u32 lnkctl = dw_pcie_readl_dbi(dw, offset + PCI_EXP_LNKCTL);
+	u16 lnksta = dw_pcie_readw_dbi(dw, offset + PCI_EXP_LNKSTA);
+	int i;
+
+	if ((lnksta & PCI_EXP_LNKSTA_CLS) == (lnkcap & PCI_EXP_LNKCAP_SLS))
+		return true;
+
+	lnkctl |= PCI_EXP_LNKCTL_RL;
+	dw_pcie_writel_dbi(dw, offset + PCI_EXP_LNKCTL, lnkctl);
+
+	for (i = 0; i < RETRAIN_MAX_RETRY; i++) {
+		lnksta = dw_pcie_readw_dbi(dw, offset + PCI_EXP_LNKSTA);
+		if (lnksta & PCI_EXP_LNKSTA_LT)
+			return true;
+		usleep_range(1000, 1100);
+	}
+
+	return false;
+}
+
+static int rcar_gen4_pcie_link_up(struct dw_pcie *dw)
+{
+	struct rcar_gen4_pcie *rcar = to_rcar_gen4_pcie(dw);
+	u32 val, mask;
+
+	/* Require retraining here. Otherwise RDLH_LINK_UP may not be set */
+	if (rcar->needs_retrain && !rcar_gen4_pcie_check_retrain_link(dw))
+		return 0;
+
+	val = readl(rcar->base + PCIEINTSTS0);
+	mask = RDLH_LINK_UP | SMLH_LINK_UP;
+
+	return (val & mask) == mask;
+}
+
+static int rcar_gen4_pcie_start_link(struct dw_pcie *dw)
+{
+	struct rcar_gen4_pcie *rcar = to_rcar_gen4_pcie(dw);
+
+	rcar_gen4_pcie_ltssm_enable(rcar, true);
+
+	return 0;
+}
+
+static void rcar_gen4_pcie_stop_link(struct dw_pcie *dw)
+{
+	struct rcar_gen4_pcie *rcar = to_rcar_gen4_pcie(dw);
+
+	rcar_gen4_pcie_ltssm_enable(rcar, false);
+}
+
+int rcar_gen4_pcie_set_device_type(struct rcar_gen4_pcie *rcar, bool rc,
+				   int num_lanes)
+{
+	u32 val;
+
+	/* Note: Assume the reset is asserted here */
+	val = readl(rcar->base + PCIEMSR0);
+	if (rc)
+		val |= DEVICE_TYPE_RC;
+	else
+		val |= DEVICE_TYPE_EP;
+	if (num_lanes < 4)
+		val |= BIFUR_MOD_SET_ON;
+	writel(val, rcar->base + PCIEMSR0);
+
+	return reset_control_deassert(rcar->rst);
+}
+
+void rcar_gen4_pcie_disable_bar(struct dw_pcie *dw, u32 bar_mask_reg)
+{
+	dw_pcie_writel_dbi2(dw, bar_mask_reg, 0x0);
+}
+
+int rcar_gen4_pcie_prepare(struct rcar_gen4_pcie *rcar)
+{
+	struct device *dev = rcar->dw.dev;
+	int err;
+
+	pm_runtime_enable(dev);
+	err = pm_runtime_resume_and_get(dev);
+	if (err < 0) {
+		dev_err(dev, "Failed to resume/get Runtime PM\n");
+		pm_runtime_disable(dev);
+	}
+
+	return err;
+}
+
+void rcar_gen4_pcie_unprepare(struct rcar_gen4_pcie *rcar)
+{
+	struct device *dev = rcar->dw.dev;
+
+	if (!reset_control_status(rcar->rst))
+		reset_control_assert(rcar->rst);
+	pm_runtime_put(dev);
+	pm_runtime_disable(dev);
+}
+
+static int rcar_gen4_pcie_devm_reset_get(struct rcar_gen4_pcie *rcar,
+				  struct device *dev)
+{
+	rcar->rst = devm_reset_control_get(dev, NULL);
+	if (IS_ERR(rcar->rst)) {
+		dev_err(dev, "Failed to get Cold-reset\n");
+		return PTR_ERR(rcar->rst);
+	}
+
+	return 0;
+}
+
+int rcar_gen4_pcie_get_resources(struct rcar_gen4_pcie *rcar,
+				 struct platform_device *pdev)
+{
+	struct dw_pcie *dw = &rcar->dw;
+
+	/* Renesas-specific registers */
+	rcar->base = devm_platform_ioremap_resource_byname(pdev, "app");
+	if (IS_ERR(rcar->base))
+		return PTR_ERR(rcar->base);
+
+	return rcar_gen4_pcie_devm_reset_get(rcar, dw->dev);
+}
+
+static const struct dw_pcie_ops dw_pcie_ops = {
+	.start_link = rcar_gen4_pcie_start_link,
+	.stop_link = rcar_gen4_pcie_stop_link,
+	.link_up = rcar_gen4_pcie_link_up,
+};
+
+struct rcar_gen4_pcie *rcar_gen4_pcie_devm_alloc(struct device *dev)
+{
+	struct rcar_gen4_pcie *rcar;
+
+	rcar = devm_kzalloc(dev, sizeof(*rcar), GFP_KERNEL);
+	if (!rcar)
+		return NULL;
+
+	rcar->dw.dev = dev;
+	rcar->dw.ops = &dw_pcie_ops;
+	dw_pcie_cap_set(&rcar->dw, EDMA_UNROLL);
+
+	return rcar;
+}
diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.h b/drivers/pci/controller/dwc/pcie-rcar-gen4.h
new file mode 100644
index 000000000000..d9cb9c783f16
--- /dev/null
+++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * PCIe host/endpoint controller driver for Renesas R-Car Gen4 Series SoCs
+ * Copyright (C) 2022-2023 Renesas Electronics Corporation
+ */
+
+#ifndef _PCIE_RCAR_GEN4_H_
+#define _PCIE_RCAR_GEN4_H_
+
+#include <linux/io.h>
+#include <linux/pci.h>
+#include <linux/reset.h>
+
+#include "pcie-designware.h"
+
+/* Renesas-specific */
+#define PCIEMSR0		0x0000
+#define  BIFUR_MOD_SET_ON	BIT(0)
+#define  DEVICE_TYPE_EP		0
+#define  DEVICE_TYPE_RC		BIT(4)
+
+#define PCIEINTSTS0		0x0084
+#define PCIEINTSTS0EN		0x0310
+#define  MSI_CTRL_INT		BIT(26)
+#define  SMLH_LINK_UP		BIT(7)
+#define  RDLH_LINK_UP		BIT(6)
+#define PCIEDMAINTSTSEN		0x0314
+#define  PCIEDMAINTSTSEN_INIT	GENMASK(15, 0)
+
+struct rcar_gen4_pcie {
+	struct dw_pcie		dw;
+	void __iomem		*base;
+	struct reset_control	*rst;
+	bool			needs_retrain;
+};
+#define to_rcar_gen4_pcie(x)	dev_get_drvdata((x)->dev)
+
+u32 rcar_gen4_pcie_readl(struct rcar_gen4_pcie *pcie, u32 reg);
+void rcar_gen4_pcie_writel(struct rcar_gen4_pcie *pcie, u32 reg, u32 val);
+int rcar_gen4_pcie_set_device_type(struct rcar_gen4_pcie *rcar, bool rc,
+				   int num_lanes);
+void rcar_gen4_pcie_disable_bar(struct dw_pcie *dw, u32 bar_mask_reg);
+int rcar_gen4_pcie_prepare(struct rcar_gen4_pcie *pcie);
+void rcar_gen4_pcie_unprepare(struct rcar_gen4_pcie *pcie);
+int rcar_gen4_pcie_get_resources(struct rcar_gen4_pcie *rcar,
+				 struct platform_device *pdev);
+struct rcar_gen4_pcie *rcar_gen4_pcie_devm_alloc(struct device *dev);
+
+#endif /* _PCIE_RCAR_GEN4_H_ */
-- 
2.25.1

