Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DA68414DB0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Sep 2021 18:04:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236486AbhIVQFd (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Sep 2021 12:05:33 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:47972 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S232357AbhIVQFd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Sep 2021 12:05:33 -0400
X-IronPort-AV: E=Sophos;i="5.85,314,1624287600"; 
   d="scan'208";a="94720434"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 23 Sep 2021 01:04:02 +0900
Received: from localhost.localdomain (unknown [10.226.92.203])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0A37C4003EB6;
        Thu, 23 Sep 2021 01:03:59 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 3/4] clk: renesas: rzg2l: Add support to handle coupled clocks
Date:   Wed, 22 Sep 2021 16:51:44 +0100
Message-Id: <20210922155145.28156-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210922155145.28156-1-biju.das.jz@bp.renesas.com>
References: <20210922155145.28156-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The AXI and CHI clocks use the same register bit for controlling clock
output. Add a new clock type for coupled clocks, which sets the
CPG_CLKON_ETH.CLK[01]_ON bit when at least one clock is enabled, and
clears the bit only when both clocks are disabled.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4:
 * Added locking, in case both clocks are changed concurrently
 * initialized mstp_clock.enabled to match the current hardware state.
v2->v3:
 * Reworked as per Geert's suggestion
 * Added enabled flag to track the status of clock, if it is coupled
   with another clock
 * Introduced siblings pointer which points to the other coupled
   clock
 * coupled clock linking is done during module clk register.
 * rzg2l_mod_clock_is_enabled function returns soft state of the
   module clocks, if it is coupled with another clock
 * Updated the commit header
v2:-
 * New patch
---
 drivers/clk/renesas/rzg2l-cpg.c | 73 +++++++++++++++++++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.h | 11 ++++-
 2 files changed, 83 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 69eba5a66490..270c530e8017 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -333,13 +333,17 @@ rzg2l_cpg_register_core_clk(const struct cpg_core_clk *core,
  * @hw: handle between common and hardware-specific interfaces
  * @off: register offset
  * @bit: ON/MON bit
+ * @enabled: soft state of the clock, if it is coupled with another clock
  * @priv: CPG/MSTP private data
+ * @siblings: pointer to the other coupled clock
  */
 struct mstp_clock {
 	struct clk_hw hw;
 	u16 off;
 	u8 bit;
+	bool enabled;
 	struct rzg2l_cpg_priv *priv;
+	struct mstp_clock *siblings;
 };
 
 #define to_mod_clock(_hw) container_of(_hw, struct mstp_clock, hw)
@@ -392,11 +396,43 @@ static int rzg2l_mod_clock_endisable(struct clk_hw *hw, bool enable)
 
 static int rzg2l_mod_clock_enable(struct clk_hw *hw)
 {
+	struct mstp_clock *clock = to_mod_clock(hw);
+
+	if (clock->siblings) {
+		struct mstp_clock *siblings = clock->siblings;
+		struct rzg2l_cpg_priv *priv = clock->priv;
+		unsigned long flags;
+		bool enabled;
+
+		spin_lock_irqsave(&priv->rmw_lock, flags);
+		enabled = siblings->enabled;
+		clock->enabled = true;
+		spin_unlock_irqrestore(&priv->rmw_lock, flags);
+		if (enabled)
+			return 0;
+	}
+
 	return rzg2l_mod_clock_endisable(hw, true);
 }
 
 static void rzg2l_mod_clock_disable(struct clk_hw *hw)
 {
+	struct mstp_clock *clock = to_mod_clock(hw);
+
+	if (clock->siblings) {
+		struct mstp_clock *siblings = clock->siblings;
+		struct rzg2l_cpg_priv *priv = clock->priv;
+		unsigned long flags;
+		bool enabled;
+
+		spin_lock_irqsave(&priv->rmw_lock, flags);
+		enabled = siblings->enabled;
+		clock->enabled = false;
+		spin_unlock_irqrestore(&priv->rmw_lock, flags);
+		if (enabled)
+			return;
+	}
+
 	rzg2l_mod_clock_endisable(hw, false);
 }
 
@@ -412,6 +448,9 @@ static int rzg2l_mod_clock_is_enabled(struct clk_hw *hw)
 		return 1;
 	}
 
+	if (clock->siblings)
+		return clock->enabled;
+
 	value = readl(priv->base + CLK_MON_R(clock->off));
 
 	return value & bitmask;
@@ -423,6 +462,28 @@ static const struct clk_ops rzg2l_mod_clock_ops = {
 	.is_enabled = rzg2l_mod_clock_is_enabled,
 };
 
+static struct mstp_clock
+*rzg2l_cpg_get_sibling_clk(struct mstp_clock *clock,
+			   struct rzg2l_cpg_priv *priv)
+{
+	struct clk_hw *hw;
+	unsigned int i;
+
+	for (i = 0; i < priv->num_mod_clks; i++) {
+		struct mstp_clock *clk;
+
+		if (priv->clks[priv->num_core_clks + i] == ERR_PTR(-ENOENT))
+			continue;
+
+		hw = __clk_get_hw(priv->clks[priv->num_core_clks + i]);
+		clk = to_mod_clock(hw);
+		if (clock->off == clk->off && clock->bit == clk->bit)
+			return clk;
+	}
+
+	return NULL;
+}
+
 static void __init
 rzg2l_cpg_register_mod_clk(const struct rzg2l_mod_clk *mod,
 			   const struct rzg2l_cpg_info *info,
@@ -484,6 +545,18 @@ rzg2l_cpg_register_mod_clk(const struct rzg2l_mod_clk *mod,
 
 	dev_dbg(dev, "Module clock %pC at %lu Hz\n", clk, clk_get_rate(clk));
 	priv->clks[id] = clk;
+
+	if (mod->is_coupled) {
+		struct mstp_clock *sibling_clock;
+
+		clock->enabled = rzg2l_mod_clock_is_enabled(&clock->hw);
+		sibling_clock = rzg2l_cpg_get_sibling_clk(clock, priv);
+		if (sibling_clock) {
+			clock->siblings = sibling_clock;
+			sibling_clock->siblings = clock;
+		}
+	}
+
 	return;
 
 fail:
diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
index 5202c0512483..191c403aa52f 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -93,6 +93,7 @@ enum clk_types {
  * @parent: id of parent clock
  * @off: register offset
  * @bit: ON/MON bit
+ * @is_coupled: flag to indicate coupled clock
  */
 struct rzg2l_mod_clk {
 	const char *name;
@@ -100,17 +101,25 @@ struct rzg2l_mod_clk {
 	unsigned int parent;
 	u16 off;
 	u8 bit;
+	bool is_coupled;
 };
 
-#define DEF_MOD(_name, _id, _parent, _off, _bit)	\
+#define DEF_MOD_BASE(_name, _id, _parent, _off, _bit, _is_coupled)	\
 	{ \
 		.name = _name, \
 		.id = MOD_CLK_BASE + (_id), \
 		.parent = (_parent), \
 		.off = (_off), \
 		.bit = (_bit), \
+		.is_coupled = (_is_coupled), \
 	}
 
+#define DEF_MOD(_name, _id, _parent, _off, _bit)	\
+	DEF_MOD_BASE(_name, _id, _parent, _off, _bit, false)
+
+#define DEF_COUPLED(_name, _id, _parent, _off, _bit)	\
+	DEF_MOD_BASE(_name, _id, _parent, _off, _bit, true)
+
 /**
  * struct rzg2l_reset - Reset definitions
  *
-- 
2.17.1

