Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FEC73B7E24
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Jun 2021 09:31:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233058AbhF3Hds (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Jun 2021 03:33:48 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:31329 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S233035AbhF3Hdi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Jun 2021 03:33:38 -0400
X-IronPort-AV: E=Sophos;i="5.83,311,1616425200"; 
   d="scan'208";a="85884741"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 30 Jun 2021 16:31:09 +0900
Received: from localhost.localdomain (unknown [10.226.93.82])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id AF73F41DCD2E;
        Wed, 30 Jun 2021 16:31:06 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-phy@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 10/11] phy: renesas: phy-rcar-gen3-usb2: Add OTG support for RZ/G2L
Date:   Wed, 30 Jun 2021 08:30:12 +0100
Message-Id: <20210630073013.22415-11-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210630073013.22415-1-biju.das.jz@bp.renesas.com>
References: <20210630073013.22415-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds OTG support for RZ/G2L SoC.

We need to use a different compatible string due to some differences
with R-Car Gen3 USB2.0 PHY. It uses line ctrl register for OTG_ID
pin changes and different OTG-BC interrupt bit for device recognition.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 v3:
  * Made seperate compativle for RZ/G2L.
  * Extended rcar_gen3_phy_usb2_match_table[].data to support RZ/G2L.
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 97 ++++++++++++++++++------
 1 file changed, 73 insertions(+), 24 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index fbc55232120e..ce875188b8cf 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -64,6 +64,7 @@
 /* VBCTRL */
 #define USB2_VBCTRL_OCCLREN		BIT(16)
 #define USB2_VBCTRL_DRVVBUSSEL		BIT(8)
+#define USB2_VBCTRL_VBOUT		BIT(0)
 
 /* LINECTRL1 */
 #define USB2_LINECTRL1_DPRPD_EN		BIT(19)
@@ -78,6 +79,10 @@
 #define USB2_ADPCTRL_IDPULLUP		BIT(5)	/* 1 = ID sampling is enabled */
 #define USB2_ADPCTRL_DRVVBUS		BIT(4)
 
+/*  RZ/G2L specific */
+#define USB2_OBINT_IDCHG_EN		BIT(0)
+#define USB2_LINECTRL1_USB2_IDMON	BIT(0)
+
 #define NUM_OF_PHYS			4
 enum rcar_gen3_phy_index {
 	PHY_INDEX_BOTH_HC,
@@ -112,9 +117,16 @@ struct rcar_gen3_chan {
 	struct mutex lock;	/* protects rphys[...].powered */
 	enum usb_dr_mode dr_mode;
 	int irq;
+	u32 obint_enable_bits;
 	bool extcon_host;
 	bool is_otg_channel;
 	bool uses_otg_pins;
+	bool soc_no_adp_ctrl;
+};
+
+struct rcar_gen3_phy_drv_data {
+	const struct phy_ops *phy_usb2_ops;
+	bool no_adp_ctrl;
 };
 
 /*
@@ -172,14 +184,22 @@ static void rcar_gen3_set_linectrl(struct rcar_gen3_chan *ch, int dp, int dm)
 static void rcar_gen3_enable_vbus_ctrl(struct rcar_gen3_chan *ch, int vbus)
 {
 	void __iomem *usb2_base = ch->base;
-	u32 val = readl(usb2_base + USB2_ADPCTRL);
+	u32 vbus_ctrl_reg = USB2_ADPCTRL;
+	u32 vbus_ctrl_val = USB2_ADPCTRL_DRVVBUS;
+	u32 val;
 
 	dev_vdbg(ch->dev, "%s: %08x, %d\n", __func__, val, vbus);
+	if (ch->soc_no_adp_ctrl) {
+		vbus_ctrl_reg = USB2_VBCTRL;
+		vbus_ctrl_val = USB2_VBCTRL_VBOUT;
+	}
+
+	val = readl(usb2_base + vbus_ctrl_reg);
 	if (vbus)
-		val |= USB2_ADPCTRL_DRVVBUS;
+		val |= vbus_ctrl_val;
 	else
-		val &= ~USB2_ADPCTRL_DRVVBUS;
-	writel(val, usb2_base + USB2_ADPCTRL);
+		val &= ~vbus_ctrl_val;
+	writel(val, usb2_base + vbus_ctrl_reg);
 }
 
 static void rcar_gen3_control_otg_irq(struct rcar_gen3_chan *ch, int enable)
@@ -188,9 +208,9 @@ static void rcar_gen3_control_otg_irq(struct rcar_gen3_chan *ch, int enable)
 	u32 val = readl(usb2_base + USB2_OBINTEN);
 
 	if (ch->uses_otg_pins && enable)
-		val |= USB2_OBINT_BITS;
+		val |= ch->obint_enable_bits;
 	else
-		val &= ~USB2_OBINT_BITS;
+		val &= ~ch->obint_enable_bits;
 	writel(val, usb2_base + USB2_OBINTEN);
 }
 
@@ -252,6 +272,9 @@ static bool rcar_gen3_check_id(struct rcar_gen3_chan *ch)
 	if (!ch->uses_otg_pins)
 		return (ch->dr_mode == USB_DR_MODE_HOST) ? false : true;
 
+	if (ch->soc_no_adp_ctrl)
+		return !!(readl(ch->base + USB2_LINECTRL1) & USB2_LINECTRL1_USB2_IDMON);
+
 	return !!(readl(ch->base + USB2_ADPCTRL) & USB2_ADPCTRL_IDDIG);
 }
 
@@ -376,16 +399,17 @@ static void rcar_gen3_init_otg(struct rcar_gen3_chan *ch)
 	      USB2_LINECTRL1_DMRPD_EN | USB2_LINECTRL1_DM_RPD;
 	writel(val, usb2_base + USB2_LINECTRL1);
 
-	val = readl(usb2_base + USB2_VBCTRL);
-	val &= ~USB2_VBCTRL_OCCLREN;
-	writel(val | USB2_VBCTRL_DRVVBUSSEL, usb2_base + USB2_VBCTRL);
-	val = readl(usb2_base + USB2_ADPCTRL);
-	writel(val | USB2_ADPCTRL_IDPULLUP, usb2_base + USB2_ADPCTRL);
-
+	if (!ch->soc_no_adp_ctrl) {
+		val = readl(usb2_base + USB2_VBCTRL);
+		val &= ~USB2_VBCTRL_OCCLREN;
+		writel(val | USB2_VBCTRL_DRVVBUSSEL, usb2_base + USB2_VBCTRL);
+		val = readl(usb2_base + USB2_ADPCTRL);
+		writel(val | USB2_ADPCTRL_IDPULLUP, usb2_base + USB2_ADPCTRL);
+	}
 	msleep(20);
 
 	writel(0xffffffff, usb2_base + USB2_OBINTSTA);
-	writel(USB2_OBINT_BITS, usb2_base + USB2_OBINTEN);
+	writel(ch->obint_enable_bits, usb2_base + USB2_OBINTEN);
 
 	rcar_gen3_device_recognition(ch);
 }
@@ -397,9 +421,9 @@ static irqreturn_t rcar_gen3_phy_usb2_irq(int irq, void *_ch)
 	u32 status = readl(usb2_base + USB2_OBINTSTA);
 	irqreturn_t ret = IRQ_NONE;
 
-	if (status & USB2_OBINT_BITS) {
+	if (status & ch->obint_enable_bits) {
 		dev_vdbg(ch->dev, "%s: %08x\n", __func__, status);
-		writel(USB2_OBINT_BITS, usb2_base + USB2_OBINTSTA);
+		writel(ch->obint_enable_bits, usb2_base + USB2_OBINTSTA);
 		rcar_gen3_device_recognition(ch);
 		ret = IRQ_HANDLED;
 	}
@@ -535,26 +559,45 @@ static const struct phy_ops rz_g1c_phy_usb2_ops = {
 	.owner		= THIS_MODULE,
 };
 
+static const struct rcar_gen3_phy_drv_data rcar_gen3_phy_usb2_data = {
+	.phy_usb2_ops = &rcar_gen3_phy_usb2_ops,
+	.no_adp_ctrl = false,
+};
+
+static const struct rcar_gen3_phy_drv_data rz_g1c_phy_usb2_data = {
+	.phy_usb2_ops = &rz_g1c_phy_usb2_ops,
+	.no_adp_ctrl = false,
+};
+
+static const struct rcar_gen3_phy_drv_data rz_g2l_phy_usb2_data = {
+	.phy_usb2_ops = &rcar_gen3_phy_usb2_ops,
+	.no_adp_ctrl = true,
+};
+
 static const struct of_device_id rcar_gen3_phy_usb2_match_table[] = {
 	{
 		.compatible = "renesas,usb2-phy-r8a77470",
-		.data = &rz_g1c_phy_usb2_ops,
+		.data = &rz_g1c_phy_usb2_data,
 	},
 	{
 		.compatible = "renesas,usb2-phy-r8a7795",
-		.data = &rcar_gen3_phy_usb2_ops,
+		.data = &rcar_gen3_phy_usb2_data,
 	},
 	{
 		.compatible = "renesas,usb2-phy-r8a7796",
-		.data = &rcar_gen3_phy_usb2_ops,
+		.data = &rcar_gen3_phy_usb2_data,
 	},
 	{
 		.compatible = "renesas,usb2-phy-r8a77965",
-		.data = &rcar_gen3_phy_usb2_ops,
+		.data = &rcar_gen3_phy_usb2_data,
+	},
+	{
+		.compatible = "renesas,usb2-phy-r9a07g044",
+		.data = &rz_g2l_phy_usb2_data,
 	},
 	{
 		.compatible = "renesas,rcar-gen3-usb2-phy",
-		.data = &rcar_gen3_phy_usb2_ops,
+		.data = &rcar_gen3_phy_usb2_data,
 	},
 	{ /* sentinel */ },
 };
@@ -608,10 +651,10 @@ static enum usb_dr_mode rcar_gen3_get_dr_mode(struct device_node *np)
 
 static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 {
+	const struct rcar_gen3_phy_drv_data *phy_data;
 	struct device *dev = &pdev->dev;
 	struct rcar_gen3_chan *channel;
 	struct phy_provider *provider;
-	const struct phy_ops *phy_usb2_ops;
 	int ret = 0, i;
 
 	if (!dev->of_node) {
@@ -627,6 +670,7 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 	if (IS_ERR(channel->base))
 		return PTR_ERR(channel->base);
 
+	channel->obint_enable_bits = USB2_OBINT_BITS;
 	/* get irq number here and request_irq for OTG in phy_init */
 	channel->irq = platform_get_irq_optional(pdev, 0);
 	channel->dr_mode = rcar_gen3_get_dr_mode(dev->of_node);
@@ -653,16 +697,21 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 	 * And then, phy-core will manage runtime pm for this device.
 	 */
 	pm_runtime_enable(dev);
-	phy_usb2_ops = of_device_get_match_data(dev);
-	if (!phy_usb2_ops) {
+
+	phy_data = of_device_get_match_data(dev);
+	if (!phy_data) {
 		ret = -EINVAL;
 		goto error;
 	}
 
+	channel->soc_no_adp_ctrl = phy_data->no_adp_ctrl;
+	if (phy_data->no_adp_ctrl)
+		channel->obint_enable_bits = USB2_OBINT_IDCHG_EN;
+
 	mutex_init(&channel->lock);
 	for (i = 0; i < NUM_OF_PHYS; i++) {
 		channel->rphys[i].phy = devm_phy_create(dev, NULL,
-							phy_usb2_ops);
+							phy_data->phy_usb2_ops);
 		if (IS_ERR(channel->rphys[i].phy)) {
 			dev_err(dev, "Failed to create USB2 PHY\n");
 			ret = PTR_ERR(channel->rphys[i].phy);
-- 
2.17.1

