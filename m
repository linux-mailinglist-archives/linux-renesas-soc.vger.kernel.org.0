Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 006D3E301B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Oct 2019 13:17:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408088AbfJXLRE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Oct 2019 07:17:04 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:29481 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2408056AbfJXLRE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Oct 2019 07:17:04 -0400
X-IronPort-AV: E=Sophos;i="5.68,224,1569250800"; 
   d="scan'208";a="29695330"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 24 Oct 2019 20:17:01 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id DC6254209FBF;
        Thu, 24 Oct 2019 20:17:01 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, geert+renesas@glider.be
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 3/3] clk: renesas: rcar-usb2-clock-sel: Add reset_control
Date:   Thu, 24 Oct 2019 20:17:01 +0900
Message-Id: <1571915821-1620-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1571915821-1620-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1571915821-1620-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This hardware needs to deassert resets of both host and peripheral.
So, this patch adds reset control.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/clk/renesas/rcar-usb2-clock-sel.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/clk/renesas/rcar-usb2-clock-sel.c b/drivers/clk/renesas/rcar-usb2-clock-sel.c
index 570fbd0..dfe5510 100644
--- a/drivers/clk/renesas/rcar-usb2-clock-sel.c
+++ b/drivers/clk/renesas/rcar-usb2-clock-sel.c
@@ -19,6 +19,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
+#include <linux/reset.h>
 #include <linux/slab.h>
 
 #define USB20_CLKSET0		0x00
@@ -36,6 +37,7 @@ struct usb2_clock_sel_priv {
 	void __iomem *base;
 	struct clk_hw hw;
 	struct clk *clks[CLK_NUM];
+	struct reset_control *rsts;
 	bool extal;
 	bool xtal;
 };
@@ -63,11 +65,16 @@ static int usb2_clock_sel_enable(struct clk_hw *hw)
 	struct usb2_clock_sel_priv *priv = to_priv(hw);
 	int i, ret;
 
+	ret = reset_control_deassert(priv->rsts);
+	if (ret)
+		return ret;
+
 	for (i = 0; i < CLK_NUM; i++) {
 		ret = clk_prepare_enable(priv->clks[i]);
 		if (ret) {
 			while (--i >= 0)
 				clk_disable_unprepare(priv->clks[i]);
+			reset_control_assert(priv->rsts);
 			return ret;
 		}
 	}
@@ -86,6 +93,7 @@ static void usb2_clock_sel_disable(struct clk_hw *hw)
 
 	for (i = 0; i < CLK_NUM; i++)
 		clk_disable_unprepare(priv->clks[i]);
+	reset_control_assert(priv->rsts);
 }
 
 /*
@@ -164,6 +172,10 @@ static int rcar_usb2_clock_sel_probe(struct platform_device *pdev)
 	if (IS_ERR(priv->clks[CLK_INDEX_HS_USB]))
 		return PTR_ERR(priv->clks[CLK_INDEX_HS_USB]);
 
+	priv->rsts = devm_reset_control_array_get_optional_shared(&pdev->dev);
+	if (IS_ERR(priv->rsts))
+		return PTR_ERR(priv->rsts);
+
 	clk = devm_clk_get(dev, "usb_extal");
 	if (!IS_ERR(clk) && !clk_prepare_enable(clk)) {
 		priv->extal = !!clk_get_rate(clk);
-- 
2.7.4

