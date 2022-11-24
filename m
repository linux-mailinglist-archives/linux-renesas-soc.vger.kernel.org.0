Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F0DFE637F88
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Nov 2022 20:16:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229724AbiKXTQ5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 24 Nov 2022 14:16:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229735AbiKXTQz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Nov 2022 14:16:55 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9E07187A67;
        Thu, 24 Nov 2022 11:16:53 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.96,190,1665414000"; 
   d="scan'208";a="141120254"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 25 Nov 2022 04:16:53 +0900
Received: from localhost.localdomain (unknown [10.226.92.56])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 0522B40C6827;
        Fri, 25 Nov 2022 04:16:50 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: [PATCH v2 1/5] clk: renesas: r9a09g011: Add PWM clock and reset entries
Date:   Thu, 24 Nov 2022 19:16:39 +0000
Message-Id: <20221124191643.3193423-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221124191643.3193423-1-biju.das.jz@bp.renesas.com>
References: <20221124191643.3193423-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add PWM{8..14} clock and reset entries to CPG driver.

The PWM IP on the RZ/V2M comes with 16 channels, but the ISP has
full control of channels 0 to 7, and channel 15, therefore Linux
is only allowed to use channels 8 to 14.

The PWM channel 15 shares apb clock and reset with PWM{8..14}.
The reset is deasserted by the bootloader/ISP.

Add PWM{8..14} clocks to CPG driver and mark apb clock as
critical clock, so that the apb clock will be always on.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Updated commit description
 * Replaced pwm8_15_pclk->cperi_grpf
 * Added reset entry R9A09G011_PWM_GPF_PRESETN
---
 drivers/clk/renesas/r9a09g011-cpg.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g011-cpg.c b/drivers/clk/renesas/r9a09g011-cpg.c
index fbef1b35d254..dd5e442ec4a9 100644
--- a/drivers/clk/renesas/r9a09g011-cpg.c
+++ b/drivers/clk/renesas/r9a09g011-cpg.c
@@ -136,6 +136,14 @@ static const struct rzg2l_mod_clk r9a09g011_mod_clks[] __initconst = {
 	DEF_MOD("iic_pclk1",	R9A09G011_IIC_PCLK1,	 CLK_SEL_E,    0x424, 12),
 	DEF_MOD("wdt0_pclk",	R9A09G011_WDT0_PCLK,	 CLK_SEL_E,    0x428, 12),
 	DEF_MOD("wdt0_clk",	R9A09G011_WDT0_CLK,	 CLK_MAIN,     0x428, 13),
+	DEF_MOD("cperi_grpf",	R9A09G011_CPERI_GRPF_PCLK, CLK_SEL_E,  0x434, 0),
+	DEF_MOD("pwm8_clk",	R9A09G011_PWM8_CLK,	 CLK_MAIN,     0x434, 4),
+	DEF_MOD("pwm9_clk",	R9A09G011_PWM9_CLK,	 CLK_MAIN,     0x434, 5),
+	DEF_MOD("pwm10_clk",	R9A09G011_PWM10_CLK,	 CLK_MAIN,     0x434, 6),
+	DEF_MOD("pwm11_clk",	R9A09G011_PWM11_CLK,	 CLK_MAIN,     0x434, 7),
+	DEF_MOD("pwm12_clk",	R9A09G011_PWM12_CLK,	 CLK_MAIN,     0x434, 8),
+	DEF_MOD("pwm13_clk",	R9A09G011_PWM13_CLK,	 CLK_MAIN,     0x434, 9),
+	DEF_MOD("pwm14_clk",	R9A09G011_PWM14_CLK,	 CLK_MAIN,     0x434, 10),
 	DEF_MOD("urt_pclk",	R9A09G011_URT_PCLK,	 CLK_SEL_E,    0x438, 4),
 	DEF_MOD("urt0_clk",	R9A09G011_URT0_CLK,	 CLK_SEL_W0,   0x438, 5),
 	DEF_MOD("ca53",		R9A09G011_CA53_CLK,	 CLK_DIV_A,    0x448, 0),
@@ -147,11 +155,13 @@ static const struct rzg2l_reset r9a09g011_resets[] = {
 	DEF_RST_MON(R9A09G011_SYC_RST_N,	0x610, 9,  13),
 	DEF_RST(R9A09G011_IIC_GPA_PRESETN,	0x614, 8),
 	DEF_RST(R9A09G011_IIC_GPB_PRESETN,	0x614, 9),
+	DEF_RST_MON(R9A09G011_PWM_GPF_PRESETN,	0x614, 5, 23),
 	DEF_RST_MON(R9A09G011_WDT0_PRESETN,	0x614, 12, 19),
 };
 
 static const unsigned int r9a09g011_crit_mod_clks[] __initconst = {
 	MOD_CLK_BASE + R9A09G011_CA53_CLK,
+	MOD_CLK_BASE + R9A09G011_CPERI_GRPF_PCLK,
 	MOD_CLK_BASE + R9A09G011_GIC_CLK,
 	MOD_CLK_BASE + R9A09G011_SYC_CNT_CLK,
 	MOD_CLK_BASE + R9A09G011_URT_PCLK,
-- 
2.25.1

