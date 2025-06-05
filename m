Return-Path: <linux-renesas-soc+bounces-17872-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 103DCACED95
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Jun 2025 12:28:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D70818980A0
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Jun 2025 10:28:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93D1420B1E8;
	Thu,  5 Jun 2025 10:28:09 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74FF8214A64;
	Thu,  5 Jun 2025 10:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749119289; cv=none; b=Nrc4dI8sgL4kgjhrM5si9U2MO/OU8EZyX2t3egvTi8C+JFMA5MTmGyJGyMau1IFkA1zdlyC7QVq7BKtJagZr9JjrI5ewdx7AUJyATnf4bQouqAVSE2PLts9qlAymT8HAjTwfxLxElHxSkhZypcM28LvtiIi/GHpnW4lXoq9V83o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749119289; c=relaxed/simple;
	bh=Met+OCiNMiixcwUdPaRVS5KVNCqG1EL00IeaP1gGCsM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eSVwmB9iK8wbGC0GfRCdR+767XfpQ1lhL7mZfnr2O6mbZIt5tZU86CqtfGYddy5gVBCJW3mxfFhp4DEj5SkLkeKLv0mCLsrGpHMVGK+T8NWOpmDPhW7X6s9bI+ql7cuGqpqA9b5eumHKVenp6EYipQ6TnSQEBSXcJ/kzLlTi4FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D1A6C4CEE7;
	Thu,  5 Jun 2025 10:28:07 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] clk: renesas: rzg2l: Rename mstp_clock to mod_clock
Date: Thu,  5 Jun 2025 12:28:03 +0200
Message-ID: <53b3a730a784650762cdb27fdbde7a45b0c20db8.1749119264.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The mstp_clock structure really represents a module clock (cfr. the
various rzg2l_mod_clock_*() functions and the to_mod_clock() helper),
and is not directly related to the "Module stop state".
Rename it to "mod_clock", and replace "mstp_clock" by "mod_clock".
to avoid confusion with the mstop registers.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-clk for v6.17.

This is v2 of "[PATCH] clk: renesas: rzg2l: Rename to_mod_clock() to
to_mstp_clock()".

v2:
  - Replace mstp_clock by mod_clock instead of renaming to_mod_clock()
    to to_mstp_clock().
---
 drivers/clk/renesas/rzg2l-cpg.c | 44 ++++++++++++++++-----------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 40b6122390cb2c7e..187233302818a66a 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1202,7 +1202,7 @@ struct mstop {
 };
 
 /**
- * struct mstp_clock - MSTP gating clock
+ * struct mod_clock - Module clock
  *
  * @hw: handle between common and hardware-specific interfaces
  * @priv: CPG/MSTP private data
@@ -1214,19 +1214,19 @@ struct mstop {
  * @num_shared_mstop_clks: number of the clocks sharing MSTOP with this clock
  * @enabled: soft state of the clock, if it is coupled with another clock
  */
-struct mstp_clock {
+struct mod_clock {
 	struct clk_hw hw;
 	struct rzg2l_cpg_priv *priv;
-	struct mstp_clock *sibling;
+	struct mod_clock *sibling;
 	struct mstop *mstop;
-	struct mstp_clock **shared_mstop_clks;
+	struct mod_clock **shared_mstop_clks;
 	u16 off;
 	u8 bit;
 	u8 num_shared_mstop_clks;
 	bool enabled;
 };
 
-#define to_mod_clock(_hw) container_of(_hw, struct mstp_clock, hw)
+#define to_mod_clock(_hw) container_of(_hw, struct mod_clock, hw)
 
 #define for_each_mod_clock(mod_clock, hw, priv) \
 	for (unsigned int i = 0; (priv) && i < (priv)->num_mod_clks; i++) \
@@ -1236,7 +1236,7 @@ struct mstp_clock {
 			 ((mod_clock) = to_mod_clock(hw)))
 
 /* Need to be called with a lock held to avoid concurrent access to mstop->usecnt. */
-static void rzg2l_mod_clock_module_set_state(struct mstp_clock *clock,
+static void rzg2l_mod_clock_module_set_state(struct mod_clock *clock,
 					     bool standby)
 {
 	struct rzg2l_cpg_priv *priv = clock->priv;
@@ -1253,7 +1253,7 @@ static void rzg2l_mod_clock_module_set_state(struct mstp_clock *clock,
 		unsigned int criticals = 0;
 
 		for (unsigned int i = 0; i < clock->num_shared_mstop_clks; i++) {
-			struct mstp_clock *clk = clock->shared_mstop_clks[i];
+			struct mod_clock *clk = clock->shared_mstop_clks[i];
 
 			if (clk_hw_get_flags(&clk->hw) & CLK_IS_CRITICAL)
 				criticals++;
@@ -1295,7 +1295,7 @@ static void rzg2l_mod_clock_module_set_state(struct mstp_clock *clock,
 static int rzg2l_mod_clock_mstop_show(struct seq_file *s, void *what)
 {
 	struct rzg2l_cpg_priv *priv = s->private;
-	struct mstp_clock *clk;
+	struct mod_clock *clk;
 	struct clk_hw *hw;
 
 	seq_printf(s, "%-20s %-5s %-10s\n", "", "", "MSTOP");
@@ -1330,7 +1330,7 @@ DEFINE_SHOW_ATTRIBUTE(rzg2l_mod_clock_mstop);
 
 static int rzg2l_mod_clock_endisable(struct clk_hw *hw, bool enable)
 {
-	struct mstp_clock *clock = to_mod_clock(hw);
+	struct mod_clock *clock = to_mod_clock(hw);
 	struct rzg2l_cpg_priv *priv = clock->priv;
 	unsigned int reg = clock->off;
 	struct device *dev = priv->dev;
@@ -1377,7 +1377,7 @@ static int rzg2l_mod_clock_endisable(struct clk_hw *hw, bool enable)
 
 static int rzg2l_mod_clock_enable(struct clk_hw *hw)
 {
-	struct mstp_clock *clock = to_mod_clock(hw);
+	struct mod_clock *clock = to_mod_clock(hw);
 
 	if (clock->sibling) {
 		struct rzg2l_cpg_priv *priv = clock->priv;
@@ -1397,7 +1397,7 @@ static int rzg2l_mod_clock_enable(struct clk_hw *hw)
 
 static void rzg2l_mod_clock_disable(struct clk_hw *hw)
 {
-	struct mstp_clock *clock = to_mod_clock(hw);
+	struct mod_clock *clock = to_mod_clock(hw);
 
 	if (clock->sibling) {
 		struct rzg2l_cpg_priv *priv = clock->priv;
@@ -1417,7 +1417,7 @@ static void rzg2l_mod_clock_disable(struct clk_hw *hw)
 
 static int rzg2l_mod_clock_is_enabled(struct clk_hw *hw)
 {
-	struct mstp_clock *clock = to_mod_clock(hw);
+	struct mod_clock *clock = to_mod_clock(hw);
 	struct rzg2l_cpg_priv *priv = clock->priv;
 	u32 bitmask = BIT(clock->bit);
 	u32 value;
@@ -1444,11 +1444,11 @@ static const struct clk_ops rzg2l_mod_clock_ops = {
 	.is_enabled = rzg2l_mod_clock_is_enabled,
 };
 
-static struct mstp_clock
-*rzg2l_mod_clock_get_sibling(struct mstp_clock *clock,
+static struct mod_clock
+*rzg2l_mod_clock_get_sibling(struct mod_clock *clock,
 			     struct rzg2l_cpg_priv *priv)
 {
-	struct mstp_clock *clk;
+	struct mod_clock *clk;
 	struct clk_hw *hw;
 
 	for_each_mod_clock(clk, hw, priv) {
@@ -1461,7 +1461,7 @@ static struct mstp_clock
 
 static struct mstop *rzg2l_mod_clock_get_mstop(struct rzg2l_cpg_priv *priv, u32 conf)
 {
-	struct mstp_clock *clk;
+	struct mod_clock *clk;
 	struct clk_hw *hw;
 
 	for_each_mod_clock(clk, hw, priv) {
@@ -1477,7 +1477,7 @@ static struct mstop *rzg2l_mod_clock_get_mstop(struct rzg2l_cpg_priv *priv, u32
 
 static void rzg2l_mod_clock_init_mstop(struct rzg2l_cpg_priv *priv)
 {
-	struct mstp_clock *clk;
+	struct mod_clock *clk;
 	struct clk_hw *hw;
 
 	for_each_mod_clock(clk, hw, priv) {
@@ -1497,9 +1497,9 @@ static void rzg2l_mod_clock_init_mstop(struct rzg2l_cpg_priv *priv)
 }
 
 static int rzg2l_mod_clock_update_shared_mstop_clks(struct rzg2l_cpg_priv *priv,
-						    struct mstp_clock *clock)
+						    struct mod_clock *clock)
 {
-	struct mstp_clock *clk;
+	struct mod_clock *clk;
 	struct clk_hw *hw;
 
 	if (!clock->mstop)
@@ -1507,7 +1507,7 @@ static int rzg2l_mod_clock_update_shared_mstop_clks(struct rzg2l_cpg_priv *priv,
 
 	for_each_mod_clock(clk, hw, priv) {
 		int num_shared_mstop_clks, incr = 1;
-		struct mstp_clock **new_clks;
+		struct mod_clock **new_clks;
 
 		if (clk->mstop != clock->mstop)
 			continue;
@@ -1541,7 +1541,7 @@ rzg2l_cpg_register_mod_clk(const struct rzg2l_mod_clk *mod,
 			   const struct rzg2l_cpg_info *info,
 			   struct rzg2l_cpg_priv *priv)
 {
-	struct mstp_clock *clock = NULL;
+	struct mod_clock *clock = NULL;
 	struct device *dev = priv->dev;
 	unsigned int id = mod->id;
 	struct clk_init_data init;
@@ -1609,7 +1609,7 @@ rzg2l_cpg_register_mod_clk(const struct rzg2l_mod_clk *mod,
 	}
 
 	if (mod->is_coupled) {
-		struct mstp_clock *sibling;
+		struct mod_clock *sibling;
 
 		clock->enabled = rzg2l_mod_clock_is_enabled(&clock->hw);
 		sibling = rzg2l_mod_clock_get_sibling(clock, priv);
-- 
2.43.0


