Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C22D14147E2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Sep 2021 13:36:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235698AbhIVLhw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Sep 2021 07:37:52 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:3349 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S235596AbhIVLhs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Sep 2021 07:37:48 -0400
X-IronPort-AV: E=Sophos;i="5.85,313,1624287600"; 
   d="scan'208";a="94820031"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 22 Sep 2021 20:36:17 +0900
Received: from localhost.localdomain (unknown [10.226.92.203])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 6E0314007F2F;
        Wed, 22 Sep 2021 20:36:14 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH v2 1/2] clk: renesas: r9a07g044: Add IA55_CLK and DMAC_ACLK
Date:   Wed, 22 Sep 2021 12:24:04 +0100
Message-Id: <20210922112405.26413-1-biju.das.jz@bp.renesas.com>
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
v1->v2
 * No change.
---
 drivers/clk/renesas/r9a07g044-cpg.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index 8956828d7fca..df3c89f81373 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -213,6 +213,8 @@ static struct rzg2l_reset r9a07g044_resets[] = {
 
 static const unsigned int r9a07g044_crit_mod_clks[] __initconst = {
 	MOD_CLK_BASE + R9A07G044_GIC600_GICCLK,
+	MOD_CLK_BASE + R9A07G044_IA55_CLK,
+	MOD_CLK_BASE + R9A07G044_DMAC_ACLK,
 };
 
 const struct rzg2l_cpg_info r9a07g044_cpg_info = {
-- 
2.17.1

