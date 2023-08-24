Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 297B7786D1C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Aug 2023 12:49:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236224AbjHXKtB (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Aug 2023 06:49:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236262AbjHXKsd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Aug 2023 06:48:33 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8880E10DA;
        Thu, 24 Aug 2023 03:48:31 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,195,1684767600"; 
   d="scan'208";a="173833553"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 24 Aug 2023 19:48:31 +0900
Received: from localhost.localdomain (unknown [10.226.93.115])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0B065400721C;
        Thu, 24 Aug 2023 19:48:28 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v5 4/4] clk: vc3: Make vc3_clk_mux enum values based on vc3_clk enum values
Date:   Thu, 24 Aug 2023 11:48:12 +0100
Message-Id: <20230824104812.147775-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230824104812.147775-1-biju.das.jz@bp.renesas.com>
References: <20230824104812.147775-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Make vc3_clk_mux enum values depend upon vc3_clk enum valuesÂ to avoid
any accidental breakage in the future.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * No change.
v3->v4:
 * No change.
v3:
 * New patch.
---
 drivers/clk/clk-versaclock3.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/clk-versaclock3.c b/drivers/clk/clk-versaclock3.c
index 157cf510b23a..3d7de355f8f6 100644
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

