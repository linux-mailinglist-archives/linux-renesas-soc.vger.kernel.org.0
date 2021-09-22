Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 464484142E4
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Sep 2021 09:50:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233379AbhIVHwW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Sep 2021 03:52:22 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:6244 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S233283AbhIVHwW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Sep 2021 03:52:22 -0400
X-IronPort-AV: E=Sophos;i="5.85,313,1624287600"; 
   d="scan'208";a="94679288"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 22 Sep 2021 16:50:51 +0900
Received: from localhost.localdomain (unknown [10.226.92.203])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 64D2840C37E2;
        Wed, 22 Sep 2021 16:50:49 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 1/2] clk: renesas: r9a07g044: Add IA55_CLK and DMAC_ACLK
Date:   Wed, 22 Sep 2021 08:38:33 +0100
Message-Id: <20210922073834.21304-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add IA55_CLK and DMAC_ACLK as critical clocks.

Previously it worked ok, because of a bug in clock status function
and the following patch in this series fixes the original bug.

Fixes: c3e67ad6f5a2 ("dt-bindings: clock: r9a07g044-cpg: Update clock/reset definitions")
Fixes: eb829e549ba6 ("clk: renesas: r9a07g044: Add DMAC clocks/resets")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/r9a07g044-cpg.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index 4c94b94c4125..1490446985e2 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -186,6 +186,8 @@ static struct rzg2l_reset r9a07g044_resets[] = {
 
 static const unsigned int r9a07g044_crit_mod_clks[] __initconst = {
 	MOD_CLK_BASE + R9A07G044_GIC600_GICCLK,
+	MOD_CLK_BASE + R9A07G044_IA55_CLK,
+	MOD_CLK_BASE + R9A07G044_DMAC_ACLK,
 };
 
 const struct rzg2l_cpg_info r9a07g044_cpg_info = {
-- 
2.17.1

