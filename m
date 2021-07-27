Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06E253D785C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jul 2021 16:18:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232362AbhG0OSD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Jul 2021 10:18:03 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:6079 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S236622AbhG0OSC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Jul 2021 10:18:02 -0400
X-IronPort-AV: E=Sophos;i="5.84,273,1620658800"; 
   d="scan'208";a="88924176"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 27 Jul 2021 23:18:02 +0900
Received: from localhost.localdomain (unknown [10.226.92.236])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 13C3B400F50B;
        Tue, 27 Jul 2021 23:17:59 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 3/4] drivers: clk: renesas: rzg2l-cpg: Add support to handle coupled clocks
Date:   Tue, 27 Jul 2021 15:17:48 +0100
Message-Id: <20210727141749.17783-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210727141749.17783-1-biju.das.jz@bp.renesas.com>
References: <20210727141749.17783-1-biju.das.jz@bp.renesas.com>
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
v2:-
 * New patch
---
 drivers/clk/renesas/rzg2l-cpg.c | 31 +++++++++++++++++++++++++++++++
 drivers/clk/renesas/rzg2l-cpg.h | 11 ++++++++++-
 2 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 597efc2504eb..4d2af113b54e 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -333,12 +333,16 @@ rzg2l_cpg_register_core_clk(const struct cpg_core_clk *core,
  * @hw: handle between common and hardware-specific interfaces
  * @off: register offset
  * @bit: ON/MON bit
+ * @is_coupled: flag to indicate coupled clock
+ * @on_cnt: ON count for coupled clocks
  * @priv: CPG/MSTP private data
  */
 struct mstp_clock {
 	struct clk_hw hw;
 	u16 off;
 	u8 bit;
+	bool is_coupled;
+	u8 on_cnt;
 	struct rzg2l_cpg_priv *priv;
 };
 
@@ -392,11 +396,37 @@ static int rzg2l_mod_clock_endisable(struct clk_hw *hw, bool enable)
 
 static int rzg2l_mod_clock_enable(struct clk_hw *hw)
 {
+	struct mstp_clock *clock = to_mod_clock(hw);
+	struct rzg2l_cpg_priv *priv = clock->priv;
+	unsigned long flags;
+
+	spin_lock_irqsave(&priv->rmw_lock, flags);
+	clock->on_cnt++;
+	if (clock->is_coupled && clock->on_cnt > 1) {
+		spin_unlock_irqrestore(&priv->rmw_lock, flags);
+		return 1;
+	}
+
+	spin_unlock_irqrestore(&priv->rmw_lock, flags);
+
 	return rzg2l_mod_clock_endisable(hw, true);
 }
 
 static void rzg2l_mod_clock_disable(struct clk_hw *hw)
 {
+	struct mstp_clock *clock = to_mod_clock(hw);
+	struct rzg2l_cpg_priv *priv = clock->priv;
+	unsigned long flags;
+
+	spin_lock_irqsave(&priv->rmw_lock, flags);
+	clock->on_cnt--;
+	if (clock->is_coupled && clock->on_cnt) {
+		spin_unlock_irqrestore(&priv->rmw_lock, flags);
+		return;
+	}
+
+	spin_unlock_irqrestore(&priv->rmw_lock, flags);
+
 	rzg2l_mod_clock_endisable(hw, false);
 }
 
@@ -475,6 +505,7 @@ rzg2l_cpg_register_mod_clk(const struct rzg2l_mod_clk *mod,
 
 	clock->off = mod->off;
 	clock->bit = mod->bit;
+	clock->is_coupled = mod->is_coupled;
 	clock->priv = priv;
 	clock->hw.init = &init;
 
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

