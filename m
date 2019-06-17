Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8E89F482AA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2019 14:39:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725884AbfFQMjw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jun 2019 08:39:52 -0400
Received: from baptiste.telenet-ops.be ([195.130.132.51]:50450 "EHLO
        baptiste.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725962AbfFQMjw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jun 2019 08:39:52 -0400
Received: from ramsan ([84.194.111.163])
        by baptiste.telenet-ops.be with bizsmtp
        id Rofo2000W3XaVaC01ofoz7; Mon, 17 Jun 2019 14:39:48 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hcqvM-0001pv-A7; Mon, 17 Jun 2019 14:39:48 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hcqvM-0003OL-95; Mon, 17 Jun 2019 14:39:48 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/3] clk: renesas: cpg-mssr: Combine driver-private and clock array allocation
Date:   Mon, 17 Jun 2019 14:39:41 +0200
Message-Id: <20190617123943.12990-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190617123943.12990-1-geert+renesas@glider.be>
References: <20190617123943.12990-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Make cpg_mssr_priv.clks[] a flexible array member, and use the new
struct_size() helper, to combine the allocation of the driver-private
structure and array of available clocks.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/renesas-cpg-mssr.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index 4ddf688b8bcc7ed8..7c241ff3ae2f0153 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -113,7 +113,6 @@ static const u16 srcr[] = {
  * @base: CPG/MSSR register block base address
  * @rmw_lock: protects RMW register accesses
  * @np: Device node in DT for this CPG/MSSR module
- * @clks: Array containing all Core and Module Clocks
  * @num_core_clks: Number of Core Clocks in clks[]
  * @num_mod_clks: Number of Module Clocks in clks[]
  * @last_dt_core_clk: ID of the last Core Clock exported to DT
@@ -121,6 +120,7 @@ static const u16 srcr[] = {
  * @notifiers: Notifier chain to save/restore clock state for system resume
  * @smstpcr_saved[].mask: Mask of SMSTPCR[] bits under our control
  * @smstpcr_saved[].val: Saved values of SMSTPCR[]
+ * @clks: Array containing all Core and Module Clocks
  */
 struct cpg_mssr_priv {
 #ifdef CONFIG_RESET_CONTROLLER
@@ -131,7 +131,6 @@ struct cpg_mssr_priv {
 	spinlock_t rmw_lock;
 	struct device_node *np;
 
-	struct clk **clks;
 	unsigned int num_core_clks;
 	unsigned int num_mod_clks;
 	unsigned int last_dt_core_clk;
@@ -142,6 +141,8 @@ struct cpg_mssr_priv {
 		u32 mask;
 		u32 val;
 	} smstpcr_saved[ARRAY_SIZE(smstpcr)];
+
+	struct clk *clks[];
 };
 
 static struct cpg_mssr_priv *cpg_mssr_priv;
@@ -891,7 +892,6 @@ static int __init cpg_mssr_common_init(struct device *dev,
 				       const struct cpg_mssr_info *info)
 {
 	struct cpg_mssr_priv *priv;
-	struct clk **clks = NULL;
 	unsigned int nclks, i;
 	int error;
 
@@ -901,7 +901,8 @@ static int __init cpg_mssr_common_init(struct device *dev,
 			return error;
 	}
 
-	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
+	nclks = info->num_total_core_clks + info->num_hw_mod_clks;
+	priv = kzalloc(struct_size(priv, clks, nclks), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
 
@@ -915,15 +916,7 @@ static int __init cpg_mssr_common_init(struct device *dev,
 		goto out_err;
 	}
 
-	nclks = info->num_total_core_clks + info->num_hw_mod_clks;
-	clks = kmalloc_array(nclks, sizeof(*clks), GFP_KERNEL);
-	if (!clks) {
-		error = -ENOMEM;
-		goto out_err;
-	}
-
 	cpg_mssr_priv = priv;
-	priv->clks = clks;
 	priv->num_core_clks = info->num_total_core_clks;
 	priv->num_mod_clks = info->num_hw_mod_clks;
 	priv->last_dt_core_clk = info->last_dt_core_clk;
@@ -931,7 +924,7 @@ static int __init cpg_mssr_common_init(struct device *dev,
 	priv->stbyctrl = info->stbyctrl;
 
 	for (i = 0; i < nclks; i++)
-		clks[i] = ERR_PTR(-ENOENT);
+		priv->clks[i] = ERR_PTR(-ENOENT);
 
 	error = of_clk_add_provider(np, cpg_mssr_clk_src_twocell_get, priv);
 	if (error)
@@ -940,7 +933,6 @@ static int __init cpg_mssr_common_init(struct device *dev,
 	return 0;
 
 out_err:
-	kfree(clks);
 	if (priv->base)
 		iounmap(priv->base);
 	kfree(priv);
-- 
2.17.1

