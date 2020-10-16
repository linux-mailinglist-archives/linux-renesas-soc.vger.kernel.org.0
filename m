Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DE9C2904DB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 16 Oct 2020 14:17:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407336AbgJPMRW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 16 Oct 2020 08:17:22 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:52101 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2407333AbgJPMRV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Oct 2020 08:17:21 -0400
X-IronPort-AV: E=Sophos;i="5.77,382,1596466800"; 
   d="scan'208";a="59986363"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 16 Oct 2020 21:17:20 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 7E1A443871A4;
        Fri, 16 Oct 2020 21:17:18 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/4] clk: renesas: rcar-gen3: Add support to pass custom RPCSRC div table
Date:   Fri, 16 Oct 2020 13:17:06 +0100
Message-Id: <20201016121709.8447-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201016121709.8447-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20201016121709.8447-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

RPCSRC div table is SoC specific and is not common for all R-Car Gen3
devices, with the current implementation in rcar-gen3-cpg not all the
SoC's are covered.

To handle such case introduce a new member cpg_rpcsrc_div_table in
priv structure so that we pass SoC specific div table for RPCSRC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/rcar-gen3-cpg.c    | 2 ++
 drivers/clk/renesas/renesas-cpg-mssr.h | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/drivers/clk/renesas/rcar-gen3-cpg.c b/drivers/clk/renesas/rcar-gen3-cpg.c
index 488f8b3980c5..cdfcd108d1a3 100644
--- a/drivers/clk/renesas/rcar-gen3-cpg.c
+++ b/drivers/clk/renesas/rcar-gen3-cpg.c
@@ -693,6 +693,8 @@ struct clk * __init rcar_gen3_cpg_clk_register(struct device *dev,
 		return clk_register_divider_table(NULL, core->name,
 						  __clk_get_name(parent), 0,
 						  base + CPG_RPCCKCR, 3, 2, 0,
+						  info->cpg_rpcsrc_div_table ?
+						  info->cpg_rpcsrc_div_table :
 						  cpg_rpcsrc_div_table,
 						  &cpg_lock);
 
diff --git a/drivers/clk/renesas/renesas-cpg-mssr.h b/drivers/clk/renesas/renesas-cpg-mssr.h
index f369b06c903b..3b0a70c59e04 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.h
+++ b/drivers/clk/renesas/renesas-cpg-mssr.h
@@ -8,6 +8,8 @@
 #ifndef __CLK_RENESAS_CPG_MSSR_H__
 #define __CLK_RENESAS_CPG_MSSR_H__
 
+#include <linux/clk-provider.h>
+
     /*
      * Definitions of CPG Core Clocks
      *
@@ -116,6 +118,8 @@ enum clk_reg_layout {
      *                Management, in addition to Module Clocks
      * @num_core_pm_clks: Number of entries in core_pm_clks[]
      *
+     * @cpg_rpcsrc_div_table: DIV table for RPCSRC
+     *
      * @init: Optional callback to perform SoC-specific initialization
      * @cpg_clk_register: Optional callback to handle special Core Clock types
      */
@@ -147,6 +151,8 @@ struct cpg_mssr_info {
 	const unsigned int *core_pm_clks;
 	unsigned int num_core_pm_clks;
 
+	const struct clk_div_table *cpg_rpcsrc_div_table;
+
 	/* Callbacks */
 	int (*init)(struct device *dev);
 	struct clk *(*cpg_clk_register)(struct device *dev,
-- 
2.17.1

