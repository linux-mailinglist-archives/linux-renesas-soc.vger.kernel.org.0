Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B64C94142E7
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Sep 2021 09:50:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233380AbhIVHwZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Sep 2021 03:52:25 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:26982 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S233283AbhIVHwY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Sep 2021 03:52:24 -0400
X-IronPort-AV: E=Sophos;i="5.85,313,1624287600"; 
   d="scan'208";a="94795152"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 22 Sep 2021 16:50:54 +0900
Received: from localhost.localdomain (unknown [10.226.92.203])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id D1E354144A9A;
        Wed, 22 Sep 2021 16:50:51 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Vinod Koul <vkoul@kernel.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 2/2] clk: renesas: rzg2l: Fix clk status function
Date:   Wed, 22 Sep 2021 08:38:34 +0100
Message-Id: <20210922073834.21304-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210922073834.21304-1-biju.das.jz@bp.renesas.com>
References: <20210922073834.21304-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

As per RZ/G2L HW(Rev.0.50) manual, clock monitor register value
0 means clock is not supplied and 1 means clock is supplied.
This patch fixes the issue by removing the inverted logic.

Fixing the above, triggered following 2 issues

1) GIC interrupts don't work if we disable IA55_CLK and DMAC_ACLK.
   Fixed this issue by adding these clocks as critical clocks.

2) DMA is not working, since the DMA driver is not turning on DMAC_PCLK.
   So will provide a fix in the DMA driver to turn on DMA_PCLK.

Fixes: ef3c613ccd68 ("clk: renesas: Add CPG core wrapper for RZ/G2L SoC")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/rzg2l-cpg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/rzg2l-cpg.c b/drivers/clk/renesas/rzg2l-cpg.c
index 3b3b2c3347f3..3e32a858b852 100644
--- a/drivers/clk/renesas/rzg2l-cpg.c
+++ b/drivers/clk/renesas/rzg2l-cpg.c
@@ -391,7 +391,7 @@ static int rzg2l_mod_clock_is_enabled(struct clk_hw *hw)
 
 	value = readl(priv->base + CLK_MON_R(clock->off));
 
-	return !(value & bitmask);
+	return (value & bitmask);
 }
 
 static const struct clk_ops rzg2l_mod_clock_ops = {
-- 
2.17.1

