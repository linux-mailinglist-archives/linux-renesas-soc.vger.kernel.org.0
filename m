Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC4BE351AC2
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Apr 2021 20:07:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236864AbhDASDH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 1 Apr 2021 14:03:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236145AbhDAR5g (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Apr 2021 13:57:36 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BA95C05BD25
        for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Apr 2021 06:01:43 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:7c3c:adbc:7a1a:b85f])
        by baptiste.telenet-ops.be with bizsmtp
        id nR1g2400K4A7w6i01R1ga2; Thu, 01 Apr 2021 15:01:40 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lRwxA-00CBkE-5P; Thu, 01 Apr 2021 15:01:40 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lRwx9-003mtF-KP; Thu, 01 Apr 2021 15:01:39 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/5] clk: renesas: div6: Simplify src mask handling
Date:   Thu,  1 Apr 2021 15:01:35 +0200
Message-Id: <5f05a5110d222ce5a113e683fe2aa726f4100b73.1617281699.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1617281699.git.geert+renesas@glider.be>
References: <cover.1617281699.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Simplify the handling of the register bits to select the parent clock,
by storing a bitmask instead of separate shift and width values.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/clk-div6.c | 31 +++++++++++--------------------
 1 file changed, 11 insertions(+), 20 deletions(-)

diff --git a/drivers/clk/renesas/clk-div6.c b/drivers/clk/renesas/clk-div6.c
index a3c4fbeb7b0d2ec0..2920bec49bce0eb8 100644
--- a/drivers/clk/renesas/clk-div6.c
+++ b/drivers/clk/renesas/clk-div6.c
@@ -28,8 +28,7 @@
  * @hw: handle between common and hardware-specific interfaces
  * @reg: IO-remapped register
  * @div: divisor value (1-64)
- * @src_shift: Shift to access the register bits to select the parent clock
- * @src_width: Number of register bits to select the parent clock (may be 0)
+ * @src_mask: Bitmask covering the register bits to select the parent clock
  * @nb: Notifier block to save/restore clock state for system resume
  * @parents: Array to map from valid parent clocks indices to hardware indices
  */
@@ -37,8 +36,7 @@ struct div6_clock {
 	struct clk_hw hw;
 	void __iomem *reg;
 	unsigned int div;
-	u32 src_shift;
-	u32 src_width;
+	u32 src_mask;
 	struct notifier_block nb;
 	u8 parents[];
 };
@@ -133,11 +131,11 @@ static u8 cpg_div6_clock_get_parent(struct clk_hw *hw)
 	unsigned int i;
 	u8 hw_index;
 
-	if (clock->src_width == 0)
+	if (clock->src_mask == 0)
 		return 0;
 
-	hw_index = (readl(clock->reg) >> clock->src_shift) &
-		   (BIT(clock->src_width) - 1);
+	hw_index = (readl(clock->reg) & clock->src_mask) >>
+		   __ffs(clock->src_mask);
 	for (i = 0; i < clk_hw_get_num_parents(hw); i++) {
 		if (clock->parents[i] == hw_index)
 			return i;
@@ -151,18 +149,13 @@ static u8 cpg_div6_clock_get_parent(struct clk_hw *hw)
 static int cpg_div6_clock_set_parent(struct clk_hw *hw, u8 index)
 {
 	struct div6_clock *clock = to_div6_clock(hw);
-	u8 hw_index;
-	u32 mask;
+	u32 src;
 
 	if (index >= clk_hw_get_num_parents(hw))
 		return -EINVAL;
 
-	mask = ~((BIT(clock->src_width) - 1) << clock->src_shift);
-	hw_index = clock->parents[index];
-
-	writel((readl(clock->reg) & mask) | (hw_index << clock->src_shift),
-	       clock->reg);
-
+	src = clock->parents[index] << __ffs(clock->src_mask);
+	writel((readl(clock->reg) & ~clock->src_mask) | src, clock->reg);
 	return 0;
 }
 
@@ -236,17 +229,15 @@ struct clk * __init cpg_div6_register(const char *name,
 	switch (num_parents) {
 	case 1:
 		/* fixed parent clock */
-		clock->src_shift = clock->src_width = 0;
+		clock->src_mask = 0;
 		break;
 	case 4:
 		/* clock with EXSRC bits 6-7 */
-		clock->src_shift = 6;
-		clock->src_width = 2;
+		clock->src_mask = GENMASK(7, 6);
 		break;
 	case 8:
 		/* VCLK with EXSRC bits 12-14 */
-		clock->src_shift = 12;
-		clock->src_width = 3;
+		clock->src_mask = GENMASK(14, 12);
 		break;
 	default:
 		pr_err("%s: invalid number of parents for DIV6 clock %s\n",
-- 
2.25.1

