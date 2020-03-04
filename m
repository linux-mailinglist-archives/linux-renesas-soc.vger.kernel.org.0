Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68ADA178ABA
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Mar 2020 07:42:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727734AbgCDGmV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Mar 2020 01:42:21 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:37535 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725773AbgCDGmU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Mar 2020 01:42:20 -0500
X-IronPort-AV: E=Sophos;i="5.70,513,1574089200"; 
   d="scan'208";a="40717179"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 04 Mar 2020 15:42:18 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 8B0B541CBB7A;
        Wed,  4 Mar 2020 15:42:18 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v4 4/4] clk: renesas: rcar-usb2-clock-sel: Add reset_control
Date:   Wed,  4 Mar 2020 15:42:17 +0900
Message-Id: <1583304137-28482-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1583304137-28482-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1583304137-28482-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This hardware needs to deassert resets of both host and peripheral.
So, this patch adds reset control.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/Kconfig               |  1 +
 drivers/clk/renesas/rcar-usb2-clock-sel.c | 15 ++++++++++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
index 879d96e..ac2dd92 100644
--- a/drivers/clk/renesas/Kconfig
+++ b/drivers/clk/renesas/Kconfig
@@ -161,6 +161,7 @@ config CLK_RCAR_GEN3_CPG
 config CLK_RCAR_USB2_CLOCK_SEL
 	bool "Renesas R-Car USB2 clock selector support"
 	depends on ARCH_RENESAS || COMPILE_TEST
+	select RESET_CONTROLLER
 	help
 	  This is a driver for R-Car USB2 clock selector
 
diff --git a/drivers/clk/renesas/rcar-usb2-clock-sel.c b/drivers/clk/renesas/rcar-usb2-clock-sel.c
index d5f47ab..d4c0298 100644
--- a/drivers/clk/renesas/rcar-usb2-clock-sel.c
+++ b/drivers/clk/renesas/rcar-usb2-clock-sel.c
@@ -19,6 +19,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
+#include <linux/reset.h>
 #include <linux/slab.h>
 
 #define USB20_CLKSET0		0x00
@@ -35,6 +36,7 @@ struct usb2_clock_sel_priv {
 	void __iomem *base;
 	struct clk_hw hw;
 	struct clk_bulk_data clks[ARRAY_SIZE(rcar_usb2_clocks)];
+	struct reset_control *rsts;
 	bool extal;
 	bool xtal;
 };
@@ -62,10 +64,16 @@ static int usb2_clock_sel_enable(struct clk_hw *hw)
 	struct usb2_clock_sel_priv *priv = to_priv(hw);
 	int ret;
 
-	ret = clk_bulk_prepare_enable(ARRAY_SIZE(priv->clks), priv->clks);
+	ret = reset_control_deassert(priv->rsts);
 	if (ret)
 		return ret;
 
+	ret = clk_bulk_prepare_enable(ARRAY_SIZE(priv->clks), priv->clks);
+	if (ret) {
+		reset_control_assert(priv->rsts);
+		return ret;
+	}
+
 	usb2_clock_sel_enable_extal_only(priv);
 
 	return 0;
@@ -78,6 +86,7 @@ static void usb2_clock_sel_disable(struct clk_hw *hw)
 	usb2_clock_sel_disable_extal_only(priv);
 
 	clk_bulk_disable_unprepare(ARRAY_SIZE(priv->clks), priv->clks);
+	reset_control_assert(priv->rsts);
 }
 
 /*
@@ -151,6 +160,10 @@ static int rcar_usb2_clock_sel_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
+	priv->rsts = devm_reset_control_array_get(dev, true, false);
+	if (IS_ERR(priv->rsts))
+		return PTR_ERR(priv->rsts);
+
 	pm_runtime_enable(dev);
 	pm_runtime_get_sync(dev);
 
-- 
2.7.4

