Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 436953B2FA2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Jun 2021 15:03:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230490AbhFXNFU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Jun 2021 09:05:20 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:37795 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229573AbhFXNFT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Jun 2021 09:05:19 -0400
X-IronPort-AV: E=Sophos;i="5.83,296,1616425200"; 
   d="scan'208";a="85302210"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 24 Jun 2021 22:03:00 +0900
Received: from localhost.localdomain (unknown [10.226.92.59])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 55C6049705BA;
        Thu, 24 Jun 2021 22:02:58 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 06/11] drivers: clk: renesas: renesas-rzg2l-cpg: Separate reset from module clocks
Date:   Thu, 24 Jun 2021 14:02:34 +0100
Message-Id: <20210624130240.17468-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210624130240.17468-1-biju.das.jz@bp.renesas.com>
References: <20210624130240.17468-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

RZ/G2L SoC's have different definitions for clock and reset.
Separate reset from module clocks in order to handle it efficiently.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2:
 * New patch
---
 drivers/clk/renesas/renesas-rzg2l-cpg.c |  1 +
 drivers/clk/renesas/renesas-rzg2l-cpg.h | 24 ++++++++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/clk/renesas/renesas-rzg2l-cpg.c b/drivers/clk/renesas/renesas-rzg2l-cpg.c
index 892392b9e0b2..c969c31d4197 100644
--- a/drivers/clk/renesas/renesas-rzg2l-cpg.c
+++ b/drivers/clk/renesas/renesas-rzg2l-cpg.c
@@ -78,6 +78,7 @@ struct rzg2l_cpg_priv {
 	struct clk **clks;
 	unsigned int num_core_clks;
 	unsigned int num_mod_clks;
+	unsigned int num_resets;
 	unsigned int last_dt_core_clk;
 
 	struct raw_notifier_head notifiers;
diff --git a/drivers/clk/renesas/renesas-rzg2l-cpg.h b/drivers/clk/renesas/renesas-rzg2l-cpg.h
index a6a3bade1985..10beb1913363 100644
--- a/drivers/clk/renesas/renesas-rzg2l-cpg.h
+++ b/drivers/clk/renesas/renesas-rzg2l-cpg.h
@@ -99,6 +99,26 @@ struct rzg2l_mod_clk {
 		.reset = (_reset) \
 	}
 
+/**
+ * struct rzg2l_reset - Reset definitions
+ *
+ * @id: reset index in array containing all resets
+ * @off: register offset
+ * @reset: reset bits
+ */
+struct rzg2l_reset {
+	unsigned int id;
+	u16 off;
+	u8 reset;
+};
+
+#define DEF_RST(_id, _off, _reset)	\
+	[_id] = { \
+		.id = _id, \
+		.off = (_off), \
+		.reset = (_reset) \
+	}
+
 /**
  * struct rzg2l_cpg_info - SoC-specific CPG Description
  *
@@ -127,6 +147,10 @@ struct rzg2l_cpg_info {
 	unsigned int num_mod_clks;
 	unsigned int num_hw_mod_clks;
 
+	/* Resets */
+	const struct rzg2l_reset *resets;
+	unsigned int num_resets;
+
 	/* Critical Module Clocks that should not be disabled */
 	const unsigned int *crit_mod_clks;
 	unsigned int num_crit_mod_clks;
-- 
2.17.1

