Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 291BA3AE648
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Jun 2021 11:40:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230450AbhFUJmi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Jun 2021 05:42:38 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:12185 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230449AbhFUJme (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jun 2021 05:42:34 -0400
X-IronPort-AV: E=Sophos;i="5.83,289,1616425200"; 
   d="scan'208";a="84924731"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 21 Jun 2021 18:40:19 +0900
Received: from localhost.localdomain (unknown [10.226.92.241])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 6D783400C4C6;
        Mon, 21 Jun 2021 18:40:17 +0900 (JST)
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
Subject: [PATCH v2 10/11] phy: renesas: phy-rcar-gen3-usb2: Add OTG support for RZ/G2L
Date:   Mon, 21 Jun 2021 10:39:42 +0100
Message-Id: <20210621093943.12143-11-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210621093943.12143-1-biju.das.jz@bp.renesas.com>
References: <20210621093943.12143-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds OTG support for RZ/G2L SoC.

RZ/G2L USB2.0 phy is compatible with rcar gen3, but it uses
line ctrl register for OTG_ID pin changes. Apart from this
it uses a different OTG-BC interrupt bit for device recognition.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 63 ++++++++++++++++++------
 1 file changed, 48 insertions(+), 15 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index fbc55232120e..aff0749be65d 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -22,6 +22,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <linux/string.h>
+#include <linux/sys_soc.h>
 #include <linux/usb/of.h>
 #include <linux/workqueue.h>
 
@@ -64,6 +65,7 @@
 /* VBCTRL */
 #define USB2_VBCTRL_OCCLREN		BIT(16)
 #define USB2_VBCTRL_DRVVBUSSEL		BIT(8)
+#define USB2_VBCTRL_VBOUT		BIT(0)
 
 /* LINECTRL1 */
 #define USB2_LINECTRL1_DPRPD_EN		BIT(19)
@@ -78,6 +80,10 @@
 #define USB2_ADPCTRL_IDPULLUP		BIT(5)	/* 1 = ID sampling is enabled */
 #define USB2_ADPCTRL_DRVVBUS		BIT(4)
 
+/*  RZ/G2L specific */
+#define USB2_OBINT_IDCHG_EN		BIT(0)
+#define USB2_LINECTRL1_USB2_IDMON	BIT(0)
+
 #define NUM_OF_PHYS			4
 enum rcar_gen3_phy_index {
 	PHY_INDEX_BOTH_HC,
@@ -112,9 +118,11 @@ struct rcar_gen3_chan {
 	struct mutex lock;	/* protects rphys[...].powered */
 	enum usb_dr_mode dr_mode;
 	int irq;
+	u32 obint_enable_bits;
 	bool extcon_host;
 	bool is_otg_channel;
 	bool uses_otg_pins;
+	bool soc_no_adp_ctrl;
 };
 
 /*
@@ -172,14 +180,22 @@ static void rcar_gen3_set_linectrl(struct rcar_gen3_chan *ch, int dp, int dm)
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
@@ -188,9 +204,9 @@ static void rcar_gen3_control_otg_irq(struct rcar_gen3_chan *ch, int enable)
 	u32 val = readl(usb2_base + USB2_OBINTEN);
 
 	if (ch->uses_otg_pins && enable)
-		val |= USB2_OBINT_BITS;
+		val |= ch->obint_enable_bits;
 	else
-		val &= ~USB2_OBINT_BITS;
+		val &= ~ch->obint_enable_bits;
 	writel(val, usb2_base + USB2_OBINTEN);
 }
 
@@ -252,6 +268,9 @@ static bool rcar_gen3_check_id(struct rcar_gen3_chan *ch)
 	if (!ch->uses_otg_pins)
 		return (ch->dr_mode == USB_DR_MODE_HOST) ? false : true;
 
+	if (ch->soc_no_adp_ctrl)
+		return !!(readl(ch->base + USB2_LINECTRL1) & USB2_LINECTRL1_USB2_IDMON);
+
 	return !!(readl(ch->base + USB2_ADPCTRL) & USB2_ADPCTRL_IDDIG);
 }
 
@@ -376,16 +395,17 @@ static void rcar_gen3_init_otg(struct rcar_gen3_chan *ch)
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
@@ -397,9 +417,9 @@ static irqreturn_t rcar_gen3_phy_usb2_irq(int irq, void *_ch)
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
@@ -535,6 +555,11 @@ static const struct phy_ops rz_g1c_phy_usb2_ops = {
 	.owner		= THIS_MODULE,
 };
 
+static const struct soc_device_attribute soc_no_adp_ctrl[] = {
+	{ .soc_id = "r9a07g044", .data = (void *)true },
+	{ /* Sentinel */ }
+};
+
 static const struct of_device_id rcar_gen3_phy_usb2_match_table[] = {
 	{
 		.compatible = "renesas,usb2-phy-r8a77470",
@@ -613,6 +638,7 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 	struct phy_provider *provider;
 	const struct phy_ops *phy_usb2_ops;
 	int ret = 0, i;
+	const struct soc_device_attribute *attr;
 
 	if (!dev->of_node) {
 		dev_err(dev, "This driver needs device tree\n");
@@ -627,6 +653,7 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 	if (IS_ERR(channel->base))
 		return PTR_ERR(channel->base);
 
+	channel->obint_enable_bits = USB2_OBINT_SESSVLDCHG | USB2_OBINT_IDDIGCHG;
 	/* get irq number here and request_irq for OTG in phy_init */
 	channel->irq = platform_get_irq_optional(pdev, 0);
 	channel->dr_mode = rcar_gen3_get_dr_mode(dev->of_node);
@@ -634,6 +661,12 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 		int ret;
 
 		channel->is_otg_channel = true;
+		attr = soc_device_match(soc_no_adp_ctrl);
+		if (attr) {
+			channel->soc_no_adp_ctrl = attr->data;
+			channel->obint_enable_bits = USB2_OBINT_IDCHG_EN;
+		}
+
 		channel->uses_otg_pins = !of_property_read_bool(dev->of_node,
 							"renesas,no-otg-pins");
 		channel->extcon = devm_extcon_dev_allocate(dev,
-- 
2.17.1

