Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81FAE414DB2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Sep 2021 18:04:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236503AbhIVQFg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Sep 2021 12:05:36 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:11783 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S232357AbhIVQFg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Sep 2021 12:05:36 -0400
X-IronPort-AV: E=Sophos;i="5.85,314,1624287600"; 
   d="scan'208";a="94837301"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 23 Sep 2021 01:04:05 +0900
Received: from localhost.localdomain (unknown [10.226.92.203])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 4260F4003EB6;
        Thu, 23 Sep 2021 01:04:02 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v4 4/4] clk: renesas: r9a07g044: Add GbEthernet clock/reset
Date:   Wed, 22 Sep 2021 16:51:45 +0100
Message-Id: <20210922155145.28156-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210922155145.28156-1-biju.das.jz@bp.renesas.com>
References: <20210922155145.28156-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add ETH{0,1} clock/reset entries to CPG driver.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3->v4:
 * Added Geert's Rb tag.
v2->v3:
 * Updated the commit header
v1->v2:
 * Register axi/chi clock as coupled clocks
v1:-
 * New patch
---
 drivers/clk/renesas/r9a07g044-cpg.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index ce2c40a0213a..3c518b56c5a6 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -138,6 +138,14 @@ static struct rzg2l_mod_clk r9a07g044_mod_clks[] = {
 				0x578, 2),
 	DEF_MOD("usb_pclk",	R9A07G044_USB_PCLK, R9A07G044_CLK_P1,
 				0x578, 3),
+	DEF_COUPLED("eth0_axi",	R9A07G044_ETH0_CLK_AXI, R9A07G044_CLK_M0,
+				0x57c, 0),
+	DEF_COUPLED("eth0_chi",	R9A07G044_ETH0_CLK_CHI, R9A07G044_CLK_ZT,
+				0x57c, 0),
+	DEF_COUPLED("eth1_axi",	R9A07G044_ETH1_CLK_AXI, R9A07G044_CLK_M0,
+				0x57c, 1),
+	DEF_COUPLED("eth1_chi",	R9A07G044_ETH1_CLK_CHI, R9A07G044_CLK_ZT,
+				0x57c, 1),
 	DEF_MOD("i2c0",		R9A07G044_I2C0_PCLK, R9A07G044_CLK_P0,
 				0x580, 0),
 	DEF_MOD("i2c1",		R9A07G044_I2C1_PCLK, R9A07G044_CLK_P0,
@@ -182,6 +190,8 @@ static struct rzg2l_reset r9a07g044_resets[] = {
 	DEF_RST(R9A07G044_USB_U2H1_HRESETN, 0x878, 1),
 	DEF_RST(R9A07G044_USB_U2P_EXL_SYSRST, 0x878, 2),
 	DEF_RST(R9A07G044_USB_PRESETN, 0x878, 3),
+	DEF_RST(R9A07G044_ETH0_RST_HW_N, 0x87c, 0),
+	DEF_RST(R9A07G044_ETH1_RST_HW_N, 0x87c, 1),
 	DEF_RST(R9A07G044_I2C0_MRST, 0x880, 0),
 	DEF_RST(R9A07G044_I2C1_MRST, 0x880, 1),
 	DEF_RST(R9A07G044_I2C2_MRST, 0x880, 2),
-- 
2.17.1

