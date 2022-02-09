Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52A034AF861
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Feb 2022 18:28:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238198AbiBIR1p (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Feb 2022 12:27:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238216AbiBIR1n (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Feb 2022 12:27:43 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CE2CCC05CBB0
        for <linux-renesas-soc@vger.kernel.org>; Wed,  9 Feb 2022 09:27:42 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.88,356,1635174000"; 
   d="scan'208";a="110765425"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 10 Feb 2022 02:22:40 +0900
Received: from localhost.localdomain (unknown [10.226.92.190])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id EFC51401071C;
        Thu, 10 Feb 2022 02:22:38 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] clk: renesas: rzg2l-cpg: Add id to struct rzg2l_reset
Date:   Wed,  9 Feb 2022 17:22:36 +0000
Message-Id: <20220209172236.21151-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

We now have the reset ID split between common and additional entries.
But the index is hidden inside the DEF_RST macro and this can create
compilation issue when we add a reset ID on the additional entry
array.

This patch adds id to struct rzg2l_reset, so that we can lookup an
ID entry in the reset table instead of just using the ID as the
index.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/rzg2l-cpg.c | 17 +++++++++++++----
 drivers/clk/renesas/rzg2l-cpg.h |  7 +++++--
 2 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 8c0a6252c984..adb3353a419d 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -760,13 +760,22 @@ static int rzg2l_cpg_reset_xlate(struct reset_controller_dev *rcdev,
 	struct rzg2l_cpg_priv *priv = rcdev_to_priv(rcdev);
 	const struct rzg2l_cpg_info *info = priv->info;
 	unsigned int id = reset_spec->args[0];
+	unsigned int i;
+
+	if (id >= rcdev->nr_resets)
+		goto err;
 
-	if (id >= rcdev->nr_resets || !info->resets[id].off) {
-		dev_err(rcdev->dev, "Invalid reset index %u\n", id);
-		return -EINVAL;
+	for (i = 0; i < rcdev->nr_resets; i++) {
+		if (info->resets[i].id == id)
+			break;
 	}
 
-	return id;
+	if (info->resets[i].off)
+		return i;
+
+err:
+	dev_err(rcdev->dev, "Invalid reset index %u\n", id);
+	return -EINVAL;
 }
 
 static int rzg2l_cpg_reset_controller_register(struct rzg2l_cpg_priv *priv)
diff --git a/drivers/clk/renesas/rzg2l-cpg.h b/drivers/clk/renesas/rzg2l-cpg.h
index 92c88f42ca7f..fe2bcf9cce5d 100644
--- a/drivers/clk/renesas/rzg2l-cpg.h
+++ b/drivers/clk/renesas/rzg2l-cpg.h
@@ -150,16 +150,19 @@ struct rzg2l_mod_clk {
  *
  * @off: register offset
  * @bit: reset bit
+ * @id: reset index
  */
 struct rzg2l_reset {
 	u16 off;
 	u8 bit;
+	u8 id;
 };
 
 #define DEF_RST(_id, _off, _bit)	\
-	[_id] = { \
+	{ \
 		.off = (_off), \
-		.bit = (_bit) \
+		.bit = (_bit), \
+		.id = (_id) \
 	}
 
 /**
-- 
2.17.1

