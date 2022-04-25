Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37F7B50DD5B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Apr 2022 11:55:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234874AbiDYJ4b (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Apr 2022 05:56:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235072AbiDYJ4S (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Apr 2022 05:56:18 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id F406D403CC;
        Mon, 25 Apr 2022 02:52:53 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,287,1643641200"; 
   d="scan'208";a="119075168"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 25 Apr 2022 18:52:52 +0900
Received: from localhost.localdomain (unknown [10.226.93.95])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id EAC0E4218186;
        Mon, 25 Apr 2022 18:52:49 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/6] clk: renesas: r9a07g043: Add I2C clocks/resets
Date:   Mon, 25 Apr 2022 10:52:39 +0100
Message-Id: <20220425095244.156720-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220425095244.156720-1-biju.das.jz@bp.renesas.com>
References: <20220425095244.156720-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add I2C{0,1,2,3} clock and reset entries.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/r9a07g043-cpg.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/clk/renesas/r9a07g043-cpg.c b/drivers/clk/renesas/r9a07g043-cpg.c
index 2d6c96789f5c..961216d55e0b 100644
--- a/drivers/clk/renesas/r9a07g043-cpg.c
+++ b/drivers/clk/renesas/r9a07g043-cpg.c
@@ -152,6 +152,14 @@ static struct rzg2l_mod_clk r9a07g043_mod_clks[] = {
 				0x57c, 1),
 	DEF_COUPLED("eth1_chi",	R9A07G043_ETH1_CLK_CHI, R9A07G043_CLK_ZT,
 				0x57c, 1),
+	DEF_MOD("i2c0",		R9A07G043_I2C0_PCLK, R9A07G043_CLK_P0,
+				0x580, 0),
+	DEF_MOD("i2c1",		R9A07G043_I2C1_PCLK, R9A07G043_CLK_P0,
+				0x580, 1),
+	DEF_MOD("i2c2",		R9A07G043_I2C2_PCLK, R9A07G043_CLK_P0,
+				0x580, 2),
+	DEF_MOD("i2c3",		R9A07G043_I2C3_PCLK, R9A07G043_CLK_P0,
+				0x580, 3),
 	DEF_MOD("scif0",	R9A07G043_SCIF0_CLK_PCK, R9A07G043_CLK_P0,
 				0x584, 0),
 	DEF_MOD("scif1",	R9A07G043_SCIF1_CLK_PCK, R9A07G043_CLK_P0,
@@ -180,6 +188,10 @@ static struct rzg2l_reset r9a07g043_resets[] = {
 	DEF_RST(R9A07G043_SDHI1_IXRST, 0x854, 1),
 	DEF_RST(R9A07G043_ETH0_RST_HW_N, 0x87c, 0),
 	DEF_RST(R9A07G043_ETH1_RST_HW_N, 0x87c, 1),
+	DEF_RST(R9A07G043_I2C0_MRST, 0x880, 0),
+	DEF_RST(R9A07G043_I2C1_MRST, 0x880, 1),
+	DEF_RST(R9A07G043_I2C2_MRST, 0x880, 2),
+	DEF_RST(R9A07G043_I2C3_MRST, 0x880, 3),
 	DEF_RST(R9A07G043_SCIF0_RST_SYSTEM_N, 0x884, 0),
 	DEF_RST(R9A07G043_SCIF1_RST_SYSTEM_N, 0x884, 1),
 	DEF_RST(R9A07G043_SCIF2_RST_SYSTEM_N, 0x884, 2),
-- 
2.25.1

