Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DE38482B3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2019 14:40:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727207AbfFQMkM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jun 2019 08:40:12 -0400
Received: from andre.telenet-ops.be ([195.130.132.53]:51558 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726878AbfFQMkL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jun 2019 08:40:11 -0400
Received: from ramsan ([84.194.111.163])
        by andre.telenet-ops.be with bizsmtp
        id Rofo2000C3XaVaC01ofohs; Mon, 17 Jun 2019 14:39:58 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hcqvM-0001q0-CS; Mon, 17 Jun 2019 14:39:48 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hcqvM-0003OR-AO; Mon, 17 Jun 2019 14:39:48 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/3] clk: renesas: mstp: Combine group-private and clock array allocation
Date:   Mon, 17 Jun 2019 14:39:43 +0200
Message-Id: <20190617123943.12990-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190617123943.12990-1-geert+renesas@glider.be>
References: <20190617123943.12990-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Make mstp_clock_group.clks[] a flexible array member, and use the new
struct_size() helper, to combine the allocation of the group-private
structure and array of module clocks.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/clk/renesas/clk-mstp.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/renesas/clk-mstp.c b/drivers/clk/renesas/clk-mstp.c
index a5e9f9edf04079c7..dfbef37eed4a82e8 100644
--- a/drivers/clk/renesas/clk-mstp.c
+++ b/drivers/clk/renesas/clk-mstp.c
@@ -30,11 +30,12 @@
 /**
  * struct mstp_clock_group - MSTP gating clocks group
  *
- * @data: clocks in this group
+ * @data: clock specifier translation for clocks in this group
  * @smstpcr: module stop control register
  * @mstpsr: module stop status register (optional)
  * @lock: protects writes to SMSTPCR
  * @width_8bit: registers are 8-bit, not 32-bit
+ * @clks: clocks in this group
  */
 struct mstp_clock_group {
 	struct clk_onecell_data data;
@@ -42,6 +43,7 @@ struct mstp_clock_group {
 	void __iomem *mstpsr;
 	spinlock_t lock;
 	bool width_8bit;
+	struct clk *clks[];
 };
 
 /**
@@ -187,14 +189,13 @@ static void __init cpg_mstp_clocks_init(struct device_node *np)
 	struct clk **clks;
 	unsigned int i;
 
-	group = kzalloc(sizeof(*group), GFP_KERNEL);
-	clks = kmalloc_array(MSTP_MAX_CLOCKS, sizeof(*clks), GFP_KERNEL);
-	if (group == NULL || clks == NULL) {
+	group = kzalloc(struct_size(group, clks, MSTP_MAX_CLOCKS), GFP_KERNEL);
+	if (group == NULL) {
 		kfree(group);
-		kfree(clks);
 		return;
 	}
 
+	clks = group->clks;
 	spin_lock_init(&group->lock);
 	group->data.clks = clks;
 
@@ -204,7 +205,6 @@ static void __init cpg_mstp_clocks_init(struct device_node *np)
 	if (group->smstpcr == NULL) {
 		pr_err("%s: failed to remap SMSTPCR\n", __func__);
 		kfree(group);
-		kfree(clks);
 		return;
 	}
 
-- 
2.17.1

