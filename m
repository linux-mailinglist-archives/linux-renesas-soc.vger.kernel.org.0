Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6359178AC4
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Mar 2020 07:42:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728183AbgCDGmW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Mar 2020 01:42:22 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:51067 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726233AbgCDGmW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Mar 2020 01:42:22 -0500
X-IronPort-AV: E=Sophos;i="5.70,513,1574089200"; 
   d="scan'208";a="40932658"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 04 Mar 2020 15:42:18 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 7962441CBB61;
        Wed,  4 Mar 2020 15:42:18 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v4 3/4] clk: renesas: rcar-usb2-clock-sel: Add multiple clocks management
Date:   Wed,  4 Mar 2020 15:42:16 +0900
Message-Id: <1583304137-28482-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583304137-28482-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1583304137-28482-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This hardware needs to enable clocks of both host and peripheral.
So, this patch adds multiple clocks management.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/clk/renesas/rcar-usb2-clock-sel.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/renesas/rcar-usb2-clock-sel.c b/drivers/clk/renesas/rcar-usb2-clock-sel.c
index b97f5f9..d5f47ab 100644
--- a/drivers/clk/renesas/rcar-usb2-clock-sel.c
+++ b/drivers/clk/renesas/rcar-usb2-clock-sel.c
@@ -26,9 +26,15 @@
 #define CLKSET0_PRIVATE		BIT(0)
 #define CLKSET0_EXTAL_ONLY	(CLKSET0_INTCLK_EN | CLKSET0_PRIVATE)
 
+static const struct clk_bulk_data rcar_usb2_clocks[] = {
+	{ .id = "ehci_ohci", },
+	{ .id = "hs-usb-if", },
+};
+
 struct usb2_clock_sel_priv {
 	void __iomem *base;
 	struct clk_hw hw;
+	struct clk_bulk_data clks[ARRAY_SIZE(rcar_usb2_clocks)];
 	bool extal;
 	bool xtal;
 };
@@ -53,14 +59,25 @@ static void usb2_clock_sel_disable_extal_only(struct usb2_clock_sel_priv *priv)
 
 static int usb2_clock_sel_enable(struct clk_hw *hw)
 {
-	usb2_clock_sel_enable_extal_only(to_priv(hw));
+	struct usb2_clock_sel_priv *priv = to_priv(hw);
+	int ret;
+
+	ret = clk_bulk_prepare_enable(ARRAY_SIZE(priv->clks), priv->clks);
+	if (ret)
+		return ret;
+
+	usb2_clock_sel_enable_extal_only(priv);
 
 	return 0;
 }
 
 static void usb2_clock_sel_disable(struct clk_hw *hw)
 {
-	usb2_clock_sel_disable_extal_only(to_priv(hw));
+	struct usb2_clock_sel_priv *priv = to_priv(hw);
+
+	usb2_clock_sel_disable_extal_only(priv);
+
+	clk_bulk_disable_unprepare(ARRAY_SIZE(priv->clks), priv->clks);
 }
 
 /*
@@ -119,6 +136,7 @@ static int rcar_usb2_clock_sel_probe(struct platform_device *pdev)
 	struct usb2_clock_sel_priv *priv;
 	struct clk *clk;
 	struct clk_init_data init;
+	int ret;
 
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
@@ -128,6 +146,11 @@ static int rcar_usb2_clock_sel_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
 
+	memcpy(priv->clks, rcar_usb2_clocks, sizeof(priv->clks));
+	ret = devm_clk_bulk_get(dev, ARRAY_SIZE(priv->clks), priv->clks);
+	if (ret < 0)
+		return ret;
+
 	pm_runtime_enable(dev);
 	pm_runtime_get_sync(dev);
 
-- 
2.7.4

