Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FDB477F8C1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Aug 2023 16:23:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351703AbjHQOXB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 17 Aug 2023 10:23:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351831AbjHQOWd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Aug 2023 10:22:33 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1A8622D78;
        Thu, 17 Aug 2023 07:22:31 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,180,1684767600"; 
   d="scan'208";a="176882453"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 17 Aug 2023 23:22:31 +0900
Received: from localhost.localdomain (unknown [10.226.93.71])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 957954270482;
        Thu, 17 Aug 2023 23:22:29 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 4/4] clk: vc3: Make vc3_clk_mux enum values based on vc3_clk enum values
Date:   Thu, 17 Aug 2023 15:22:11 +0100
Message-Id: <20230817142211.311366-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230817142211.311366-1-biju.das.jz@bp.renesas.com>
References: <20230817142211.311366-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Make vc3_clk_mux enum values depend upon vc3_clk enum values to avoid
any accidental breakage in the future.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3:
 * New patch.
---
 drivers/clk/clk-versaclock3.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/clk-versaclock3.c b/drivers/clk/clk-versaclock3.c
index 6dce21a8608b..4a8130a273d4 100644
--- a/drivers/clk/clk-versaclock3.c
+++ b/drivers/clk/clk-versaclock3.c
@@ -118,14 +118,6 @@ enum vc3_div {
 	VC3_DIV5,
 };
 
-enum vc3_clk_mux {
-	VC3_SE1_MUX,
-	VC3_SE2_MUX,
-	VC3_SE3_MUX,
-	VC3_DIFF1_MUX,
-	VC3_DIFF2_MUX,
-};
-
 enum vc3_clk {
 	VC3_REF,
 	VC3_SE1,
@@ -135,6 +127,14 @@ enum vc3_clk {
 	VC3_DIFF2,
 };
 
+enum vc3_clk_mux {
+	VC3_SE1_MUX = VC3_SE1 - 1,
+	VC3_SE2_MUX = VC3_SE2 - 1,
+	VC3_SE3_MUX = VC3_SE3 - 1,
+	VC3_DIFF1_MUX = VC3_DIFF1 - 1,
+	VC3_DIFF2_MUX = VC3_DIFF2 - 1,
+};
+
 struct vc3_clk_data {
 	u8 offs;
 	u8 bitmsk;
-- 
2.25.1

