Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BA9B433610
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Oct 2021 14:35:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235667AbhJSMh7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 Oct 2021 08:37:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235626AbhJSMh6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Oct 2021 08:37:58 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1A01C061745
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Oct 2021 05:35:45 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:b4c3:ba80:54db:46f])
        by laurent.telenet-ops.be with bizsmtp
        id 7obk2600212AN0U01obkni; Tue, 19 Oct 2021 14:35:44 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mcoLH-0069I3-PL; Tue, 19 Oct 2021 14:35:43 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mcoLH-00EEKh-93; Tue, 19 Oct 2021 14:35:43 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: rzg2l: Add missing kerneldoc for resets
Date:   Tue, 19 Oct 2021 14:35:36 +0200
Message-Id: <39c2c5fd4232b6620a4a56dba4e2b0d61476ee36.1634646869.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

make W=1:

    drivers/clk/renesas/rzg2l-cpg.c:95: warning: Function parameter or member 'num_resets' not described in 'rzg2l_cpg_priv'

Add the missing kerneldoc for fields in struct rzg2l_cpg_priv and struct
rzg2l_cpg_info related to Module Resets.

Fixes: c3e67ad6f5a2c698 ("dt-bindings: clock: r9a07g044-cpg: Update clock/reset definitions")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-clk for v5.17.
---
 drivers/clk/renesas/rzg2l-cpg.c | 1 +
 drivers/clk/renesas/rzg2l-cpg.h | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 4021f6cabda4b3bc..a77cb47b75e7c253 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -74,6 +74,7 @@ struct sd_hw_data {
  * @clks: Array containing all Core and Module Clocks
  * @num_core_clks: Number of Core Clocks in clks[]
  * @num_mod_clks: Number of Module Clocks in clks[]
+ * @num_resets: Number of Module Resets in info->resets[]
  * @last_dt_core_clk: ID of the last Core Clock exported to DT
  * @notifiers: Notifier chain to save/restore clock state for system resume
  * @info: Pointer to platform data
diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
index 7fb6b4030f72e237..484c7cee2629366f 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -168,6 +168,9 @@ struct rzg2l_reset {
  * @num_mod_clks: Number of entries in mod_clks[]
  * @num_hw_mod_clks: Number of Module Clocks supported by the hardware
  *
+ * @resets: Array of Module Reset definitions
+ * @num_resets: Number of entries in resets[]
+ *
  * @crit_mod_clks: Array with Module Clock IDs of critical clocks that
  *                 should not be disabled without a knowledgeable driver
  * @num_crit_mod_clks: Number of entries in crit_mod_clks[]
-- 
2.25.1

