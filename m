Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A8DC265AAA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Sep 2020 09:44:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725535AbgIKHoI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Sep 2020 03:44:08 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:35243 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725747AbgIKHoF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Sep 2020 03:44:05 -0400
X-IronPort-AV: E=Sophos;i="5.76,414,1592838000"; 
   d="scan'208";a="56799465"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 11 Sep 2020 16:44:03 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 8908041DEF06;
        Fri, 11 Sep 2020 16:44:03 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v3 1/4] clk: renesas: cpg-mssr: Use enum clk_reg_layout instead of a boolean flag
Date:   Fri, 11 Sep 2020 16:43:49 +0900
Message-Id: <1599810232-29035-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599810232-29035-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1599810232-29035-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Geert suggested defining multiple registers layout variants using
an enum [1] to support further devices like R-Car V3U. So, use enum
clk_reg_layout instead of a boolean .stbyctrl flag. No behavior change.

[1]
https://lore.kernel.org/linux-renesas-soc/CAMuHMdVAgN69p9FFnQdO4iHk2CHkeNaVui2Q-FOY6_BFVjQ-Nw@mail.gmail.com/

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/r7s9210-cpg-mssr.c |  2 +-
 drivers/clk/renesas/renesas-cpg-mssr.c | 27 ++++++++++++++-------------
 drivers/clk/renesas/renesas-cpg-mssr.h | 12 +++++++-----
 3 files changed, 22 insertions(+), 19 deletions(-)

diff --git a/drivers/clk/renesas/r7s9210-cpg-mssr.c b/drivers/clk/renesas/r7s9210-cpg-mssr.c
index 443bff0..a85227c 100644
--- a/drivers/clk/renesas/r7s9210-cpg-mssr.c
+++ b/drivers/clk/renesas/r7s9210-cpg-mssr.c
@@ -214,7 +214,7 @@ const struct cpg_mssr_info r7s9210_cpg_mssr_info __initconst = {
 	.cpg_clk_register = rza2_cpg_clk_register,
 
 	/* RZ/A2 has Standby Control Registers */
-	.stbyctrl = true,
+	.reg_layout = CLK_REG_LAYOUT_RZ_A,
 };
 
 static void __init r7s9210_cpg_mssr_early_init(struct device_node *np)
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index 5a306d2..1b289c8 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -111,12 +111,12 @@ static const u16 srcr[] = {
  * @rcdev: Optional reset controller entity
  * @dev: CPG/MSSR device
  * @base: CPG/MSSR register block base address
+ * @reg_layout: CPG/MSSR register layout
  * @rmw_lock: protects RMW register accesses
  * @np: Device node in DT for this CPG/MSSR module
  * @num_core_clks: Number of Core Clocks in clks[]
  * @num_mod_clks: Number of Module Clocks in clks[]
  * @last_dt_core_clk: ID of the last Core Clock exported to DT
- * @stbyctrl: This device has Standby Control Registers
  * @notifiers: Notifier chain to save/restore clock state for system resume
  * @smstpcr_saved[].mask: Mask of SMSTPCR[] bits under our control
  * @smstpcr_saved[].val: Saved values of SMSTPCR[]
@@ -128,13 +128,13 @@ struct cpg_mssr_priv {
 #endif
 	struct device *dev;
 	void __iomem *base;
+	enum clk_reg_layout reg_layout;
 	spinlock_t rmw_lock;
 	struct device_node *np;
 
 	unsigned int num_core_clks;
 	unsigned int num_mod_clks;
 	unsigned int last_dt_core_clk;
-	bool stbyctrl;
 
 	struct raw_notifier_head notifiers;
 	struct {
@@ -177,7 +177,7 @@ static int cpg_mstp_clock_endisable(struct clk_hw *hw, bool enable)
 		enable ? "ON" : "OFF");
 	spin_lock_irqsave(&priv->rmw_lock, flags);
 
-	if (priv->stbyctrl) {
+	if (priv->reg_layout == CLK_REG_LAYOUT_RZ_A) {
 		value = readb(priv->base + STBCR(reg));
 		if (enable)
 			value &= ~bitmask;
@@ -199,7 +199,7 @@ static int cpg_mstp_clock_endisable(struct clk_hw *hw, bool enable)
 
 	spin_unlock_irqrestore(&priv->rmw_lock, flags);
 
-	if (!enable || priv->stbyctrl)
+	if (!enable || priv->reg_layout == CLK_REG_LAYOUT_RZ_A)
 		return 0;
 
 	for (i = 1000; i > 0; --i) {
@@ -233,7 +233,7 @@ static int cpg_mstp_clock_is_enabled(struct clk_hw *hw)
 	struct cpg_mssr_priv *priv = clock->priv;
 	u32 value;
 
-	if (priv->stbyctrl)
+	if (priv->reg_layout == CLK_REG_LAYOUT_RZ_A)
 		value = readb(priv->base + STBCR(clock->index / 32));
 	else
 		value = readl(priv->base + MSTPSR(clock->index / 32));
@@ -272,7 +272,7 @@ struct clk *cpg_mssr_clk_src_twocell_get(struct of_phandle_args *clkspec,
 
 	case CPG_MOD:
 		type = "module";
-		if (priv->stbyctrl) {
+		if (priv->reg_layout == CLK_REG_LAYOUT_RZ_A) {
 			idx = MOD_CLK_PACK_10(clkidx);
 			range_check = 7 - (clkidx % 10);
 		} else {
@@ -825,7 +825,8 @@ static int cpg_mssr_suspend_noirq(struct device *dev)
 	/* Save module registers with bits under our control */
 	for (reg = 0; reg < ARRAY_SIZE(priv->smstpcr_saved); reg++) {
 		if (priv->smstpcr_saved[reg].mask)
-			priv->smstpcr_saved[reg].val = priv->stbyctrl ?
+			priv->smstpcr_saved[reg].val =
+				priv->reg_layout == CLK_REG_LAYOUT_RZ_A ?
 				readb(priv->base + STBCR(reg)) :
 				readl(priv->base + SMSTPCR(reg));
 	}
@@ -855,7 +856,7 @@ static int cpg_mssr_resume_noirq(struct device *dev)
 		if (!mask)
 			continue;
 
-		if (priv->stbyctrl)
+		if (priv->reg_layout == CLK_REG_LAYOUT_RZ_A)
 			oldval = readb(priv->base + STBCR(reg));
 		else
 			oldval = readl(priv->base + SMSTPCR(reg));
@@ -864,7 +865,7 @@ static int cpg_mssr_resume_noirq(struct device *dev)
 		if (newval == oldval)
 			continue;
 
-		if (priv->stbyctrl) {
+		if (priv->reg_layout == CLK_REG_LAYOUT_RZ_A) {
 			writeb(newval, priv->base + STBCR(reg));
 			/* dummy read to ensure write has completed */
 			readb(priv->base + STBCR(reg));
@@ -887,8 +888,8 @@ static int cpg_mssr_resume_noirq(struct device *dev)
 
 		if (!i)
 			dev_warn(dev, "Failed to enable %s%u[0x%x]\n",
-				 priv->stbyctrl ? "STB" : "SMSTP", reg,
-				 oldval & mask);
+				 priv->reg_layout == CLK_REG_LAYOUT_RZ_A ?
+				 "STB" : "SMSTP", reg, oldval & mask);
 	}
 
 	return 0;
@@ -937,7 +938,7 @@ static int __init cpg_mssr_common_init(struct device *dev,
 	priv->num_mod_clks = info->num_hw_mod_clks;
 	priv->last_dt_core_clk = info->last_dt_core_clk;
 	RAW_INIT_NOTIFIER_HEAD(&priv->notifiers);
-	priv->stbyctrl = info->stbyctrl;
+	priv->reg_layout = info->reg_layout;
 
 	for (i = 0; i < nclks; i++)
 		priv->clks[i] = ERR_PTR(-ENOENT);
@@ -1015,7 +1016,7 @@ static int __init cpg_mssr_probe(struct platform_device *pdev)
 		return error;
 
 	/* Reset Controller not supported for Standby Control SoCs */
-	if (info->stbyctrl)
+	if (priv->reg_layout == CLK_REG_LAYOUT_RZ_A)
 		return 0;
 
 	error = cpg_mssr_reset_controller_register(priv);
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.h b/drivers/clk/renesas/renesas-cpg-mssr.h
index 1cc5694..f369b06 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.h
+++ b/drivers/clk/renesas/renesas-cpg-mssr.h
@@ -85,6 +85,11 @@ struct mssr_mod_clk {
 
 struct device_node;
 
+enum clk_reg_layout {
+	CLK_REG_LAYOUT_RCAR_GEN2_AND_GEN3 = 0,
+	CLK_REG_LAYOUT_RZ_A,
+};
+
     /**
      * SoC-specific CPG/MSSR Description
      *
@@ -105,6 +110,7 @@ struct device_node;
      * @crit_mod_clks: Array with Module Clock IDs of critical clocks that
      *                 should not be disabled without a knowledgeable driver
      * @num_crit_mod_clks: Number of entries in crit_mod_clks[]
+     * @reg_layout: CPG/MSSR register layout from enum clk_reg_layout
      *
      * @core_pm_clks: Array with IDs of Core Clocks that are suitable for Power
      *                Management, in addition to Module Clocks
@@ -112,10 +118,6 @@ struct device_node;
      *
      * @init: Optional callback to perform SoC-specific initialization
      * @cpg_clk_register: Optional callback to handle special Core Clock types
-     *
-     * @stbyctrl: This device has Standby Control Registers which are 8-bits
-     *            wide, no status registers (MSTPSR) and have different address
-     *            offsets.
      */
 
 struct cpg_mssr_info {
@@ -130,7 +132,7 @@ struct cpg_mssr_info {
 	unsigned int num_core_clks;
 	unsigned int last_dt_core_clk;
 	unsigned int num_total_core_clks;
-	bool stbyctrl;
+	enum clk_reg_layout reg_layout;
 
 	/* Module Clocks */
 	const struct mssr_mod_clk *mod_clks;
-- 
2.7.4

