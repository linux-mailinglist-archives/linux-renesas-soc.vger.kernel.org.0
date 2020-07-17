Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04DB6223ABB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jul 2020 13:45:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726256AbgGQLpC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Jul 2020 07:45:02 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:35903 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726013AbgGQLpC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Jul 2020 07:45:02 -0400
X-IronPort-AV: E=Sophos;i="5.75,362,1589209200"; 
   d="scan'208";a="52194509"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 17 Jul 2020 20:45:01 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 368044267DB8;
        Fri, 17 Jul 2020 20:45:01 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     kishon@ti.com, vkoul@kernel.org
Cc:     wsa+renesas@sang-engineering.com, geert+renesas@glider.be,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v3 1/2] phy: renesas: rcar-gen3-usb2: move irq registration to init
Date:   Fri, 17 Jul 2020 20:44:56 +0900
Message-Id: <1594986297-12434-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594986297-12434-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1594986297-12434-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

If CONFIG_DEBUG_SHIRQ was enabled, r8a77951-salvator-xs could boot
correctly. If we appended "earlycon keep_bootcon" to the kernel
command like, we could get kernel log like below.

    SError Interrupt on CPU0, code 0xbf000002 -- SError
    CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.8.0-rc3-salvator-x-00505-g6c843129e6faaf01 #785
    Hardware name: Renesas Salvator-X 2nd version board based on r8a77951 (DT)
    pstate: 60400085 (nZCv daIf +PAN -UAO BTYPE=--)
    pc : rcar_gen3_phy_usb2_irq+0x14/0x54
    lr : free_irq+0xf4/0x27c

This means free_irq() calls the interrupt handler while PM runtime
is not getting if DEBUG_SHIRQ is enabled and rcar_gen3_phy_usb2_probe()
failed. To fix the issue, move the irq registration place to
rcar_gen3_phy_usb2_init() which is ready to handle the interrupts.

Note that after the commit 549b6b55b005 ("phy: renesas: rcar-gen3-usb2:
enable/disable independent irqs") which is merged into v5.2, since this
driver creates multiple phy instances, needs to check whether one of
phy instances is initialized. However, if we backport this patch to v5.1
or less, we don't need to check it because such kernel have single
phy instance.

Reported-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
Fixes: 9f391c574efc ("phy: rcar-gen3-usb2: add runtime ID/VBUS pin detection")
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/phy/renesas/phy-rcar-gen3-usb2.c | 61 +++++++++++++++++---------------
 1 file changed, 33 insertions(+), 28 deletions(-)

diff --git a/drivers/phy/renesas/phy-rcar-gen3-usb2.c b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
index bfb22f8..5087b7c 100644
--- a/drivers/phy/renesas/phy-rcar-gen3-usb2.c
+++ b/drivers/phy/renesas/phy-rcar-gen3-usb2.c
@@ -111,6 +111,7 @@ struct rcar_gen3_chan {
 	struct work_struct work;
 	struct mutex lock;	/* protects rphys[...].powered */
 	enum usb_dr_mode dr_mode;
+	int irq;
 	bool extcon_host;
 	bool is_otg_channel;
 	bool uses_otg_pins;
@@ -389,12 +390,38 @@ static void rcar_gen3_init_otg(struct rcar_gen3_chan *ch)
 	rcar_gen3_device_recognition(ch);
 }
 
+static irqreturn_t rcar_gen3_phy_usb2_irq(int irq, void *_ch)
+{
+	struct rcar_gen3_chan *ch = _ch;
+	void __iomem *usb2_base = ch->base;
+	u32 status = readl(usb2_base + USB2_OBINTSTA);
+	irqreturn_t ret = IRQ_NONE;
+
+	if (status & USB2_OBINT_BITS) {
+		dev_vdbg(ch->dev, "%s: %08x\n", __func__, status);
+		writel(USB2_OBINT_BITS, usb2_base + USB2_OBINTSTA);
+		rcar_gen3_device_recognition(ch);
+		ret = IRQ_HANDLED;
+	}
+
+	return ret;
+}
+
 static int rcar_gen3_phy_usb2_init(struct phy *p)
 {
 	struct rcar_gen3_phy *rphy = phy_get_drvdata(p);
 	struct rcar_gen3_chan *channel = rphy->ch;
 	void __iomem *usb2_base = channel->base;
 	u32 val;
+	int ret;
+
+	if (!rcar_gen3_is_any_rphy_initialized(channel) && channel->irq >= 0) {
+		INIT_WORK(&channel->work, rcar_gen3_phy_usb2_work);
+		ret = request_irq(channel->irq, rcar_gen3_phy_usb2_irq,
+				  IRQF_SHARED, dev_name(channel->dev), channel);
+		if (ret < 0)
+			dev_err(channel->dev, "No irq handler (%d)\n", channel->irq);
+	}
 
 	/* Initialize USB2 part */
 	val = readl(usb2_base + USB2_INT_ENABLE);
@@ -433,6 +460,9 @@ static int rcar_gen3_phy_usb2_exit(struct phy *p)
 		val &= ~USB2_INT_ENABLE_UCOM_INTEN;
 	writel(val, usb2_base + USB2_INT_ENABLE);
 
+	if (channel->irq >= 0 && !rcar_gen3_is_any_rphy_initialized(channel))
+		free_irq(channel->irq, channel);
+
 	return 0;
 }
 
@@ -503,23 +533,6 @@ static const struct phy_ops rz_g1c_phy_usb2_ops = {
 	.owner		= THIS_MODULE,
 };
 
-static irqreturn_t rcar_gen3_phy_usb2_irq(int irq, void *_ch)
-{
-	struct rcar_gen3_chan *ch = _ch;
-	void __iomem *usb2_base = ch->base;
-	u32 status = readl(usb2_base + USB2_OBINTSTA);
-	irqreturn_t ret = IRQ_NONE;
-
-	if (status & USB2_OBINT_BITS) {
-		dev_vdbg(ch->dev, "%s: %08x\n", __func__, status);
-		writel(USB2_OBINT_BITS, usb2_base + USB2_OBINTSTA);
-		rcar_gen3_device_recognition(ch);
-		ret = IRQ_HANDLED;
-	}
-
-	return ret;
-}
-
 static const struct of_device_id rcar_gen3_phy_usb2_match_table[] = {
 	{
 		.compatible = "renesas,usb2-phy-r8a77470",
@@ -598,7 +611,7 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 	struct phy_provider *provider;
 	struct resource *res;
 	const struct phy_ops *phy_usb2_ops;
-	int irq, ret = 0, i;
+	int ret = 0, i;
 
 	if (!dev->of_node) {
 		dev_err(dev, "This driver needs device tree\n");
@@ -614,16 +627,8 @@ static int rcar_gen3_phy_usb2_probe(struct platform_device *pdev)
 	if (IS_ERR(channel->base))
 		return PTR_ERR(channel->base);
 
-	/* call request_irq for OTG */
-	irq = platform_get_irq_optional(pdev, 0);
-	if (irq >= 0) {
-		INIT_WORK(&channel->work, rcar_gen3_phy_usb2_work);
-		irq = devm_request_irq(dev, irq, rcar_gen3_phy_usb2_irq,
-				       IRQF_SHARED, dev_name(dev), channel);
-		if (irq < 0)
-			dev_err(dev, "No irq handler (%d)\n", irq);
-	}
-
+	/* get irq number here and request_irq for OTG in phy_init */
+	channel->irq = platform_get_irq_optional(pdev, 0);
 	channel->dr_mode = rcar_gen3_get_dr_mode(dev->of_node);
 	if (channel->dr_mode != USB_DR_MODE_UNKNOWN) {
 		int ret;
-- 
2.7.4

