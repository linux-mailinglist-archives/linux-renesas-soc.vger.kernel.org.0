Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8F8759A689
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Aug 2022 21:40:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349506AbiHSTkJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 19 Aug 2022 15:40:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350891AbiHSTkI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 19 Aug 2022 15:40:08 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id F06B3112F80;
        Fri, 19 Aug 2022 12:40:07 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.93,248,1654527600"; 
   d="scan'208";a="131896575"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 20 Aug 2022 04:40:07 +0900
Received: from localhost.localdomain (unknown [10.226.92.25])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id A7E01400D4D3;
        Sat, 20 Aug 2022 04:40:05 +0900 (JST)
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 1/3] clk: renesas: r9a09g011: Add IIC clock and reset entries
Date:   Fri, 19 Aug 2022 20:39:42 +0100
Message-Id: <20220819193944.337599-2-phil.edworthy@renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220819193944.337599-1-phil.edworthy@renesas.com>
References: <20220819193944.337599-1-phil.edworthy@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add IIC groups clock and reset entries to CPG driver.
IIC Group A consists of IIC0 and IIC1. IIC Group B consists of
IIC2 and IIC3. To confuse things, IIC_PCLK0 is used by group A
and IIC_PCLK1 is used by group B.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
---
 drivers/clk/renesas/r9a09g011-cpg.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g011-cpg.c b/drivers/clk/renesas/r9a09g011-cpg.c
index b21915cf6648..fbef1b35d254 100644
--- a/drivers/clk/renesas/r9a09g011-cpg.c
+++ b/drivers/clk/renesas/r9a09g011-cpg.c
@@ -132,6 +132,8 @@ static const struct rzg2l_mod_clk r9a09g011_mod_clks[] __initconst = {
 	DEF_COUPLED("eth_chi",	R9A09G011_ETH0_CLK_CHI,	 CLK_PLL2_100, 0x40c, 8),
 	DEF_MOD("eth_clk_gptp",	R9A09G011_ETH0_GPTP_EXT, CLK_PLL2_100, 0x40c, 9),
 	DEF_MOD("syc_cnt_clk",	R9A09G011_SYC_CNT_CLK,	 CLK_MAIN_24,  0x41c, 12),
+	DEF_MOD("iic_pclk0",	R9A09G011_IIC_PCLK0,	 CLK_SEL_E,    0x420, 12),
+	DEF_MOD("iic_pclk1",	R9A09G011_IIC_PCLK1,	 CLK_SEL_E,    0x424, 12),
 	DEF_MOD("wdt0_pclk",	R9A09G011_WDT0_PCLK,	 CLK_SEL_E,    0x428, 12),
 	DEF_MOD("wdt0_clk",	R9A09G011_WDT0_CLK,	 CLK_MAIN,     0x428, 13),
 	DEF_MOD("urt_pclk",	R9A09G011_URT_PCLK,	 CLK_SEL_E,    0x438, 4),
@@ -143,6 +145,8 @@ static const struct rzg2l_reset r9a09g011_resets[] = {
 	DEF_RST(R9A09G011_PFC_PRESETN,		0x600, 2),
 	DEF_RST_MON(R9A09G011_ETH0_RST_HW_N,	0x608, 11, 11),
 	DEF_RST_MON(R9A09G011_SYC_RST_N,	0x610, 9,  13),
+	DEF_RST(R9A09G011_IIC_GPA_PRESETN,	0x614, 8),
+	DEF_RST(R9A09G011_IIC_GPB_PRESETN,	0x614, 9),
 	DEF_RST_MON(R9A09G011_WDT0_PRESETN,	0x614, 12, 19),
 };
 
-- 
2.34.1

