Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 234DC481F3
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Jun 2019 14:26:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725973AbfFQMZl (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Jun 2019 08:25:41 -0400
Received: from xavier.telenet-ops.be ([195.130.132.52]:42054 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727463AbfFQMZl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Jun 2019 08:25:41 -0400
Received: from ramsan ([84.194.111.163])
        by xavier.telenet-ops.be with bizsmtp
        id RoRe2000W3XaVaC01oReQC; Mon, 17 Jun 2019 14:25:39 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hcqhe-0001jZ-MV; Mon, 17 Jun 2019 14:25:38 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hcqhe-0002z0-K2; Mon, 17 Jun 2019 14:25:38 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: cpg-mssr: Update kerneldoc for struct cpg_mssr_priv
Date:   Mon, 17 Jun 2019 14:25:37 +0200
Message-Id: <20190617122537.11423-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

New fields were added, but kerneldoc was forgotten, or inserted at the
wrong place.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in clk-renesas-for-v5.3.

 drivers/clk/renesas/renesas-cpg-mssr.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index 082d0bf12ea7f219..4ddf688b8bcc7ed8 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -112,14 +112,15 @@ static const u16 srcr[] = {
  * @dev: CPG/MSSR device
  * @base: CPG/MSSR register block base address
  * @rmw_lock: protects RMW register accesses
+ * @np: Device node in DT for this CPG/MSSR module
  * @clks: Array containing all Core and Module Clocks
  * @num_core_clks: Number of Core Clocks in clks[]
  * @num_mod_clks: Number of Module Clocks in clks[]
  * @last_dt_core_clk: ID of the last Core Clock exported to DT
+ * @stbyctrl: This device has Standby Control Registers
  * @notifiers: Notifier chain to save/restore clock state for system resume
  * @smstpcr_saved[].mask: Mask of SMSTPCR[] bits under our control
  * @smstpcr_saved[].val: Saved values of SMSTPCR[]
- * @stbyctrl: This device has Standby Control Registers
  */
 struct cpg_mssr_priv {
 #ifdef CONFIG_RESET_CONTROLLER
-- 
2.17.1

