Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D877E3011
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Oct 2019 13:17:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408075AbfJXLRD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Oct 2019 07:17:03 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:61682 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2408056AbfJXLRD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Oct 2019 07:17:03 -0400
X-IronPort-AV: E=Sophos;i="5.68,224,1569250800"; 
   d="scan'208";a="29911298"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 24 Oct 2019 20:17:01 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id C98974209FC1;
        Thu, 24 Oct 2019 20:17:01 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, geert+renesas@glider.be
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 2/3] clk: renesas: rcar-usb2-clock-sel: Add multiple clocks management
Date:   Thu, 24 Oct 2019 20:17:00 +0900
Message-Id: <1571915821-1620-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1571915821-1620-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1571915821-1620-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This hardware needs to enable clocks of both host and peripheral.
So, this patch adds multiple clocks management.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/clk/renesas/rcar-usb2-clock-sel.c | 37 +++++++++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/rcar-usb2-clock-sel.c b/drivers/clk/renesas/rcar-usb2-clock-sel.c
index b97f5f9..570fbd0 100644
--- a/drivers/clk/renesas/rcar-usb2-clock-sel.c
+++ b/drivers/clk/renesas/rcar-usb2-clock-sel.c
@@ -26,9 +26,16 @@
 #define CLKSET0_PRIVATE		BIT(0)
 #define CLKSET0_EXTAL_ONLY	(CLKSET0_INTCLK_EN | CLKSET0_PRIVATE)
 
+enum {
+	CLK_INDEX_EHCI_OHCI,
+	CLK_INDEX_HS_USB,
+	CLK_NUM
+};
+
 struct usb2_clock_sel_priv {
 	void __iomem *base;
 	struct clk_hw hw;
+	struct clk *clks[CLK_NUM];
 	bool extal;
 	bool xtal;
 };
@@ -53,14 +60,32 @@ static void usb2_clock_sel_disable_extal_only(struct usb2_clock_sel_priv *priv)
 
 static int usb2_clock_sel_enable(struct clk_hw *hw)
 {
-	usb2_clock_sel_enable_extal_only(to_priv(hw));
+	struct usb2_clock_sel_priv *priv = to_priv(hw);
+	int i, ret;
+
+	for (i = 0; i < CLK_NUM; i++) {
+		ret = clk_prepare_enable(priv->clks[i]);
+		if (ret) {
+			while (--i >= 0)
+				clk_disable_unprepare(priv->clks[i]);
+			return ret;
+		}
+	}
+
+	usb2_clock_sel_enable_extal_only(priv);
 
 	return 0;
 }
 
 static void usb2_clock_sel_disable(struct clk_hw *hw)
 {
-	usb2_clock_sel_disable_extal_only(to_priv(hw));
+	struct usb2_clock_sel_priv *priv = to_priv(hw);
+	int i;
+
+	usb2_clock_sel_disable_extal_only(priv);
+
+	for (i = 0; i < CLK_NUM; i++)
+		clk_disable_unprepare(priv->clks[i]);
 }
 
 /*
@@ -131,6 +156,14 @@ static int rcar_usb2_clock_sel_probe(struct platform_device *pdev)
 	pm_runtime_enable(dev);
 	pm_runtime_get_sync(dev);
 
+	priv->clks[CLK_INDEX_EHCI_OHCI] = devm_clk_get(dev, "ehci_ohci");
+	if (IS_ERR(priv->clks[CLK_INDEX_EHCI_OHCI]))
+		return PTR_ERR(priv->clks[CLK_INDEX_EHCI_OHCI]);
+
+	priv->clks[CLK_INDEX_HS_USB] = devm_clk_get(dev, "hs-usb-if");
+	if (IS_ERR(priv->clks[CLK_INDEX_HS_USB]))
+		return PTR_ERR(priv->clks[CLK_INDEX_HS_USB]);
+
 	clk = devm_clk_get(dev, "usb_extal");
 	if (!IS_ERR(clk) && !clk_prepare_enable(clk)) {
 		priv->extal = !!clk_get_rate(clk);
-- 
2.7.4

