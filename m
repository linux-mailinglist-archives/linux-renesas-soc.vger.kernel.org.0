Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F34151AD25
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 May 2022 20:44:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355605AbiEDSrx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 May 2022 14:47:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377116AbiEDSrw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 May 2022 14:47:52 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 480CD659F;
        Wed,  4 May 2022 11:44:12 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.91,198,1647270000"; 
   d="scan'208";a="119950008"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 05 May 2022 03:44:11 +0900
Received: from localhost.localdomain (unknown [10.226.92.27])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 148C9400F7B3;
        Thu,  5 May 2022 03:44:08 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] clk: renesas: cpg-mssr: Add a delay after deassert
Date:   Wed,  4 May 2022 19:44:06 +0100
Message-Id: <20220504184406.93788-1-biju.das.jz@bp.renesas.com>
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

After adding reset support to vsp, it needs a delay of 32 microseconds
after reset operation, otherwise system hangs(due to register read/write).
This patch fixes the system hang issue by adding delay after deassert
operation.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Hi All,

After adding reset/deassert support for vsp based on [1],
RZ/G1N board hangs. On debugging it found that it needs a delay
of 35 microseconds after deasserint reset. Wthout delay if
there is any register read/write will lead to hang.

This 35 microseconds value is  picked from the reset().

[1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220428065333.3108-3-biju.das.jz@bp.renesas.com/
---
 drivers/clk/renesas/renesas-cpg-mssr.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index 5d2c3edbaa14..025a75a3484c 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -637,6 +637,7 @@ static int cpg_mssr_assert(struct reset_controller_dev *rcdev, unsigned long id)
 	dev_dbg(priv->dev, "assert %u%02u\n", reg, bit);
 
 	writel(bitmask, priv->base + priv->reset_regs[reg]);
+
 	return 0;
 }
 
@@ -651,6 +652,10 @@ static int cpg_mssr_deassert(struct reset_controller_dev *rcdev,
 	dev_dbg(priv->dev, "deassert %u%02u\n", reg, bit);
 
 	writel(bitmask, priv->base + priv->reset_clear_regs[reg]);
+
+	/* Wait for at least one cycle of the RCLK clock (@ ca. 32 kHz) */
+	udelay(35);
+
 	return 0;
 }
 
-- 
2.25.1

