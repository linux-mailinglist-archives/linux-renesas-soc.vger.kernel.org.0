Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9F6A262EFE
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Sep 2020 15:15:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729988AbgIINP2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Sep 2020 09:15:28 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:49169 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726415AbgIINOT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Sep 2020 09:14:19 -0400
X-IronPort-AV: E=Sophos;i="5.76,409,1592838000"; 
   d="scan'208";a="56620015"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 09 Sep 2020 22:13:42 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 8D16449DB583;
        Wed,  9 Sep 2020 22:13:42 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 3/4] clk: renesas: cpg-mssr: add register pointers into struct cpg_mssr_priv
Date:   Wed,  9 Sep 2020 22:13:30 +0900
Message-Id: <1599657211-17504-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1599657211-17504-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1599657211-17504-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

To support other register layout in the future, add register pointers
of control_regs and status_regs into struct cpg_mssr_priv. After that,
we can remove unused macros like MSTPSR(). No behavior changes.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/clk/renesas/renesas-cpg-mssr.c | 56 ++++++++++++++++++----------------
 1 file changed, 30 insertions(+), 26 deletions(-)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index 1b289c8..b3a84cd 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -57,9 +57,6 @@ static const u16 mstpsr[] = {
 	0x9A0, 0x9A4, 0x9A8, 0x9AC,
 };
 
-#define	MSTPSR(i)	mstpsr[i]
-
-
 /*
  * System Module Stop Control Register offsets
  */
@@ -69,8 +66,6 @@ static const u16 smstpcr[] = {
 	0x990, 0x994, 0x998, 0x99C,
 };
 
-#define	SMSTPCR(i)	smstpcr[i]
-
 /*
  * Standby Control Register offsets (RZ/A)
  * Base address is FRQCR register
@@ -81,8 +76,6 @@ static const u16 stbcr[] = {
 	0x424, 0x428, 0x42C,
 };
 
-#define	STBCR(i)	stbcr[i]
-
 /*
  * Software Reset Register offsets
  */
@@ -137,6 +130,8 @@ struct cpg_mssr_priv {
 	unsigned int last_dt_core_clk;
 
 	struct raw_notifier_head notifiers;
+	const u16 *status_regs;
+	const u16 *control_regs;
 	struct {
 		u32 mask;
 		u32 val;
@@ -178,23 +173,23 @@ static int cpg_mstp_clock_endisable(struct clk_hw *hw, bool enable)
 	spin_lock_irqsave(&priv->rmw_lock, flags);
 
 	if (priv->reg_layout == CLK_REG_LAYOUT_RZ_A) {
-		value = readb(priv->base + STBCR(reg));
+		value = readb(priv->base + priv->control_regs[reg]);
 		if (enable)
 			value &= ~bitmask;
 		else
 			value |= bitmask;
-		writeb(value, priv->base + STBCR(reg));
+		writeb(value, priv->base + priv->control_regs[reg]);
 
 		/* dummy read to ensure write has completed */
-		readb(priv->base + STBCR(reg));
-		barrier_data(priv->base + STBCR(reg));
+		readb(priv->base + priv->control_regs[reg]);
+		barrier_data(priv->base + priv->control_regs[reg]);
 	} else {
-		value = readl(priv->base + SMSTPCR(reg));
+		value = readl(priv->base + priv->control_regs[reg]);
 		if (enable)
 			value &= ~bitmask;
 		else
 			value |= bitmask;
-		writel(value, priv->base + SMSTPCR(reg));
+		writel(value, priv->base + priv->control_regs[reg]);
 	}
 
 	spin_unlock_irqrestore(&priv->rmw_lock, flags);
@@ -203,14 +198,14 @@ static int cpg_mstp_clock_endisable(struct clk_hw *hw, bool enable)
 		return 0;
 
 	for (i = 1000; i > 0; --i) {
-		if (!(readl(priv->base + MSTPSR(reg)) & bitmask))
+		if (!(readl(priv->base + priv->status_regs[reg]) & bitmask))
 			break;
 		cpu_relax();
 	}
 
 	if (!i) {
 		dev_err(dev, "Failed to enable SMSTP %p[%d]\n",
-			priv->base + SMSTPCR(reg), bit);
+			priv->base + priv->control_regs[reg], bit);
 		return -ETIMEDOUT;
 	}
 
@@ -234,9 +229,9 @@ static int cpg_mstp_clock_is_enabled(struct clk_hw *hw)
 	u32 value;
 
 	if (priv->reg_layout == CLK_REG_LAYOUT_RZ_A)
-		value = readb(priv->base + STBCR(clock->index / 32));
+		value = readb(priv->base + priv->control_regs[clock->index / 32]);
 	else
-		value = readl(priv->base + MSTPSR(clock->index / 32));
+		value = readl(priv->base + priv->status_regs[clock->index / 32]);
 
 	return !(value & BIT(clock->index % 32));
 }
@@ -827,8 +822,8 @@ static int cpg_mssr_suspend_noirq(struct device *dev)
 		if (priv->smstpcr_saved[reg].mask)
 			priv->smstpcr_saved[reg].val =
 				priv->reg_layout == CLK_REG_LAYOUT_RZ_A ?
-				readb(priv->base + STBCR(reg)) :
-				readl(priv->base + SMSTPCR(reg));
+				readb(priv->base + priv->control_regs[reg]) :
+				readl(priv->base + priv->control_regs[reg]);
 	}
 
 	/* Save core clocks */
@@ -857,22 +852,22 @@ static int cpg_mssr_resume_noirq(struct device *dev)
 			continue;
 
 		if (priv->reg_layout == CLK_REG_LAYOUT_RZ_A)
-			oldval = readb(priv->base + STBCR(reg));
+			oldval = readb(priv->base + priv->control_regs[reg]);
 		else
-			oldval = readl(priv->base + SMSTPCR(reg));
+			oldval = readl(priv->base + priv->control_regs[reg]);
 		newval = oldval & ~mask;
 		newval |= priv->smstpcr_saved[reg].val & mask;
 		if (newval == oldval)
 			continue;
 
 		if (priv->reg_layout == CLK_REG_LAYOUT_RZ_A) {
-			writeb(newval, priv->base + STBCR(reg));
+			writeb(newval, priv->base + priv->control_regs[reg]);
 			/* dummy read to ensure write has completed */
-			readb(priv->base + STBCR(reg));
-			barrier_data(priv->base + STBCR(reg));
+			readb(priv->base + priv->control_regs[reg]);
+			barrier_data(priv->base + priv->control_regs[reg]);
 			continue;
 		} else
-			writel(newval, priv->base + SMSTPCR(reg));
+			writel(newval, priv->base + priv->control_regs[reg]);
 
 		/* Wait until enabled clocks are really enabled */
 		mask &= ~priv->smstpcr_saved[reg].val;
@@ -880,7 +875,7 @@ static int cpg_mssr_resume_noirq(struct device *dev)
 			continue;
 
 		for (i = 1000; i > 0; --i) {
-			oldval = readl(priv->base + MSTPSR(reg));
+			oldval = readl(priv->base + priv->status_regs[reg]);
 			if (!(oldval & mask))
 				break;
 			cpu_relax();
@@ -939,6 +934,15 @@ static int __init cpg_mssr_common_init(struct device *dev,
 	priv->last_dt_core_clk = info->last_dt_core_clk;
 	RAW_INIT_NOTIFIER_HEAD(&priv->notifiers);
 	priv->reg_layout = info->reg_layout;
+	if (priv->reg_layout == CLK_REG_LAYOUT_RCAR_GEN2_AND_GEN3) {
+		priv->status_regs = mstpsr;
+		priv->control_regs = smstpcr;
+	} else if (priv->reg_layout == CLK_REG_LAYOUT_RZ_A) {
+		priv->control_regs = stbcr;
+	} else {
+		error = -EINVAL;
+		goto out_err;
+	}
 
 	for (i = 0; i < nclks; i++)
 		priv->clks[i] = ERR_PTR(-ENOENT);
-- 
2.7.4

