Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8E3A538BE6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 31 May 2022 09:17:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244492AbiEaHRN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 31 May 2022 03:17:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244475AbiEaHRL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 31 May 2022 03:17:11 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6CAB84C79E;
        Tue, 31 May 2022 00:17:03 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.91,264,1647270000"; 
   d="scan'208";a="122810497"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 31 May 2022 16:17:03 +0900
Received: from localhost.localdomain (unknown [10.226.92.53])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 32ED141EB050;
        Tue, 31 May 2022 16:16:59 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH] clk: renesas: rzg2l: Fix reset status function
Date:   Tue, 31 May 2022 08:16:57 +0100
Message-Id: <20220531071657.104121-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

As per RZ/G2L HW(Rev.1.10) manual, reset monitor register value 0 means
reset signal is not applied (deassert state) and 1 means reset signal
is applied (assert state).

reset_control_status() expects a positive value if the reset line is
asserted. But rzg2l_cpg_status function returns zero for asserted
state.

This patch fixes the issue by adding double inverted logic, so that
reset_control_status returns a positive value if the reset line is
asserted.

Fixes: ef3c613ccd68 ("clk: renesas: Add CPG core wrapper for RZ/G2L SoC")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/rzg2l-cpg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index e2999ab2b53c..3ff6ecd61756 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -1180,7 +1180,7 @@ static int rzg2l_cpg_status(struct reset_controller_dev *rcdev,
 	s8 monbit = info->resets[id].monbit;
 
 	if (info->has_clk_mon_regs) {
-		return !(readl(priv->base + CLK_MRST_R(reg)) & bitmask);
+		return !!(readl(priv->base + CLK_MRST_R(reg)) & bitmask);
 	} else if (monbit >= 0) {
 		u32 monbitmask = BIT(monbit);
 
-- 
2.25.1

