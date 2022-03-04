Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 43B3D4CD678
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Mar 2022 15:32:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230135AbiCDOdg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Mar 2022 09:33:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230076AbiCDOdf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Mar 2022 09:33:35 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 19FAD54F81;
        Fri,  4 Mar 2022 06:32:46 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.90,155,1643641200"; 
   d="scan'208";a="113179477"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 04 Mar 2022 23:32:46 +0900
Received: from localhost.localdomain (unknown [10.226.92.27])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 6A6994422B9C;
        Fri,  4 Mar 2022 23:32:44 +0900 (JST)
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>
Subject: [PATCH] clk: renesas: rzg2l: Remove unused notifiers
Date:   Fri,  4 Mar 2022 14:32:41 +0000
Message-Id: <20220304143241.8523-1-phil.edworthy@renesas.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

notifiers is not used.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
---
 drivers/clk/renesas/rzg2l-cpg.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 486d0656c58a..b3a1533970e5 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -76,7 +76,6 @@ struct sd_hw_data {
  * @num_mod_clks: Number of Module Clocks in clks[]
  * @num_resets: Number of Module Resets in info->resets[]
  * @last_dt_core_clk: ID of the last Core Clock exported to DT
- * @notifiers: Notifier chain to save/restore clock state for system resume
  * @info: Pointer to platform data
  */
 struct rzg2l_cpg_priv {
@@ -91,7 +90,6 @@ struct rzg2l_cpg_priv {
 	unsigned int num_resets;
 	unsigned int last_dt_core_clk;
 
-	struct raw_notifier_head notifiers;
 	const struct rzg2l_cpg_info *info;
 };
 
-- 
2.17.1

