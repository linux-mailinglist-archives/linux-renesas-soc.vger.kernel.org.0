Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5182D708566
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 May 2023 17:57:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231177AbjERP5B (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 May 2023 11:57:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230415AbjERP5B (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 May 2023 11:57:01 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4B216E3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 18 May 2023 08:56:59 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.99,285,1677510000"; 
   d="scan'208";a="159865406"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 19 May 2023 00:56:59 +0900
Received: from localhost.localdomain (unknown [10.226.92.79])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 60547400F7FC;
        Fri, 19 May 2023 00:56:57 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH RFC 2/3] reset: renesas: Add rzg2l_usbphy_ctrl_select_vbus_ctrl()
Date:   Thu, 18 May 2023 16:56:48 +0100
Message-Id: <20230518155649.516346-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230518155649.516346-1-biju.das.jz@bp.renesas.com>
References: <20230518155649.516346-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

As per RZ/G2L HW(Rev.1.30 May2023) manual, VBUSEN can be controlled by
the Port Power bit of the EHCI/OHCI operational register or by the VBOUT
bit of the VBUS Control Register. VBUSEN selection is determined by the
VBUSEN control (VBENCTL) register in USBPHY Control.

Add support for VBUSEN selection.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/reset/reset-rzg2l-usbphy-ctrl.c | 27 +++++++++++++++++++++++++
 include/linux/reset/rzg2l-usbphy-ctrl.h | 16 +++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 include/linux/reset/rzg2l-usbphy-ctrl.h

diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
index a8dde4606360..83de261bf460 100644
--- a/drivers/reset/reset-rzg2l-usbphy-ctrl.c
+++ b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
@@ -14,6 +14,7 @@
 #include <linux/reset-controller.h>
 
 #define RESET			0x000
+#define VBENCTL			0x03c
 
 #define RESET_SEL_PLLRESET	BIT(12)
 #define RESET_PLLRESET		BIT(8)
@@ -88,6 +89,32 @@ static int rzg2l_usbphy_ctrl_status(struct reset_controller_dev *rcdev,
 	return !!(readl(priv->base + RESET) & port_mask);
 }
 
+int rzg2l_usbphy_ctrl_select_vbus_ctrl(struct reset_control *rstc, bool vbctrl)
+{
+	struct reset_controller_dev *rcdev = reset_controller_get_dev(rstc);
+	struct rzg2l_usbphy_ctrl_priv *priv;
+	unsigned long flags;
+	u32 val;
+
+	if (!rstc)
+		return 0;
+
+	priv = rcdev_to_priv(rcdev);
+
+	spin_lock_irqsave(&priv->lock, flags);
+	val = readl(priv->base + VBENCTL);
+	if (vbctrl)
+		val |= BIT(0);
+	else
+		val &= ~BIT(0);
+
+	writel(val, priv->base + VBENCTL);
+	spin_unlock_irqrestore(&priv->lock, flags);
+
+	return 0;
+}
+EXPORT_SYMBOL(rzg2l_usbphy_ctrl_select_vbus_ctrl);
+
 static const struct of_device_id rzg2l_usbphy_ctrl_match_table[] = {
 	{ .compatible = "renesas,rzg2l-usbphy-ctrl" },
 	{ /* Sentinel */ }
diff --git a/include/linux/reset/rzg2l-usbphy-ctrl.h b/include/linux/reset/rzg2l-usbphy-ctrl.h
new file mode 100644
index 000000000000..c531bd4a6a63
--- /dev/null
+++ b/include/linux/reset/rzg2l-usbphy-ctrl.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_RESET_RZG2L_USBPHY_CTRL_H_
+#define _LINUX_RESET_RZG2L_USBPHY_CTRL_H_
+
+#if IS_ENABLED(CONFIG_RESET_RZG2L_USBPHY_CTRL)
+int rzg2l_usbphy_ctrl_select_vbus_ctrl(struct reset_control *rstc,
+				       bool vbctrl);
+#else
+static inline int
+rzg2l_usbphy_ctrl_select_vbus_ctrl(struct reset_control *rstc, bool vbctrl)
+{
+	return 0;
+}
+#endif
+
+#endif /* _LINUX_RESET_RZG2L_USBPHY_CTRL_H_ */
-- 
2.25.1

