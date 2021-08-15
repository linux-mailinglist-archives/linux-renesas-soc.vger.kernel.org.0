Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21A213EC88E
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 15 Aug 2021 12:30:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237424AbhHOKa5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 15 Aug 2021 06:30:57 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:23514 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S237053AbhHOKa5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 15 Aug 2021 06:30:57 -0400
X-IronPort-AV: E=Sophos;i="5.84,322,1620658800"; 
   d="scan'208";a="90668557"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 15 Aug 2021 19:30:27 +0900
Received: from localhost.localdomain (unknown [10.226.92.6])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 02E804006CD0;
        Sun, 15 Aug 2021 19:30:24 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 3/4] clk: renesas: rzg2l: Add support to handle coupled clocks
Date:   Sun, 15 Aug 2021 11:30:13 +0100
Message-Id: <20210815103014.21208-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210815103014.21208-1-biju.das.jz@bp.renesas.com>
References: <20210815103014.21208-1-biju.das.jz@bp.renesas.com>
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
 drivers/clk/renesas/rzg2l-cpg.c | 62 +++++++++++++++++++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.h | 11 +++++-
 2 files changed, 72 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 597efc2504eb..ebcb57287bf6 100644
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
@@ -392,11 +396,35 @@ static int rzg2l_mod_clock_endisable(struct clk_hw *hw, bool enable)
 
 static int rzg2l_mod_clock_enable(struct clk_hw *hw)
 {
+	struct mstp_clock *clock = to_mod_clock(hw);
+	struct mstp_clock *siblings = clock->siblings;
+
+	if (siblings) {
+		if (siblings->enabled) {
+			clock->enabled = true;
+			return 0;
+		}
+
+		clock->enabled = true;
+	}
+
 	return rzg2l_mod_clock_endisable(hw, true);
 }
 
 static void rzg2l_mod_clock_disable(struct clk_hw *hw)
 {
+	struct mstp_clock *clock = to_mod_clock(hw);
+	struct mstp_clock *siblings = clock->siblings;
+
+	if (siblings) {
+		if (siblings->enabled) {
+			clock->enabled = false;
+			return;
+		}
+
+		clock->enabled = false;
+	}
+
 	rzg2l_mod_clock_endisable(hw, false);
 }
 
@@ -412,6 +440,9 @@ static int rzg2l_mod_clock_is_enabled(struct clk_hw *hw)
 		return 1;
 	}
 
+	if (clock->siblings)
+		return clock->enabled;
+
 	value = readl(priv->base + CLK_MON_R(clock->off));
 
 	return !(value & bitmask);
@@ -423,11 +454,33 @@ static const struct clk_ops rzg2l_mod_clock_ops = {
 	.is_enabled = rzg2l_mod_clock_is_enabled,
 };
 
+static struct mstp_clock
+*rzg2l_cpg_get_sibling_clk(struct mstp_clock *clock,
+			   struct rzg2l_cpg_priv *priv)
+{
+	struct mstp_clock *sibl_clk = NULL;
+	struct clk_hw *hw;
+	unsigned int i;
+
+	for (i = 0; i < priv->num_mod_clks; i++) {
+		if (priv->clks[priv->num_core_clks + i] == ERR_PTR(-ENOENT))
+			continue;
+
+		hw = __clk_get_hw(priv->clks[priv->num_core_clks + i]);
+		sibl_clk = to_mod_clock(hw);
+		if (clock->off == sibl_clk->off && clock->bit == sibl_clk->bit)
+			break;
+	}
+
+	return sibl_clk;
+}
+
 static void __init
 rzg2l_cpg_register_mod_clk(const struct rzg2l_mod_clk *mod,
 			   const struct rzg2l_cpg_info *info,
 			   struct rzg2l_cpg_priv *priv)
 {
+	struct mstp_clock *sibling_clock = NULL;
 	struct mstp_clock *clock = NULL;
 	struct device *dev = priv->dev;
 	unsigned int id = mod->id;
@@ -484,6 +537,15 @@ rzg2l_cpg_register_mod_clk(const struct rzg2l_mod_clk *mod,
 
 	dev_dbg(dev, "Module clock %pC at %lu Hz\n", clk, clk_get_rate(clk));
 	priv->clks[id] = clk;
+
+	if (mod->is_coupled) {
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

