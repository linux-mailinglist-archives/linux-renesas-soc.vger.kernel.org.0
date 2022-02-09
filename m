Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AADA94AFE84
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Feb 2022 21:34:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231550AbiBIUeY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Feb 2022 15:34:24 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:37866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229946AbiBIUeT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Feb 2022 15:34:19 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 27B60C102FE5;
        Wed,  9 Feb 2022 12:34:20 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.88,356,1635174000"; 
   d="scan'208";a="110043923"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 10 Feb 2022 05:34:20 +0900
Received: from localhost.localdomain (unknown [10.226.92.190])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id EC5D34006DF4;
        Thu, 10 Feb 2022 05:34:17 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] clk: renesas: r9a07g044: Use shared array for resets
Date:   Wed,  9 Feb 2022 20:34:11 +0000
Message-Id: <20220209203411.22332-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Instead of split resets in common and drp, but using a shared array,
we can still separate RZ/G2L and RZ/V2L by setting .num_resets to
the 'highest reset number + 1' for the specific SoC.

This patch uses shared array and sets .num_resets to the
'highest reset number + 1' for RZ/G2L and RZ/V2L SoC.

Suggested-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 drivers/clk/renesas/r9a07g044-cpg.c | 119 +++++++++++++---------------
 1 file changed, 54 insertions(+), 65 deletions(-)

diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index 8817d3838735..bdfabb992a20 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -299,67 +299,56 @@ static const struct {
 #endif
 };
 
-static const struct {
-	struct rzg2l_reset common[84];
-#ifdef CONFIG_CLK_R9A07G054
-	struct rzg2l_reset drp[1];
-#endif
-} rzg2l_resets = {
-	.common = {
-		DEF_RST(R9A07G044_GIC600_GICRESET_N, 0x814, 0),
-		DEF_RST(R9A07G044_GIC600_DBG_GICRESET_N, 0x814, 1),
-		DEF_RST(R9A07G044_IA55_RESETN, 0x818, 0),
-		DEF_RST(R9A07G044_DMAC_ARESETN, 0x82c, 0),
-		DEF_RST(R9A07G044_DMAC_RST_ASYNC, 0x82c, 1),
-		DEF_RST(R9A07G044_OSTM0_PRESETZ, 0x834, 0),
-		DEF_RST(R9A07G044_OSTM1_PRESETZ, 0x834, 1),
-		DEF_RST(R9A07G044_OSTM2_PRESETZ, 0x834, 2),
-		DEF_RST(R9A07G044_WDT0_PRESETN, 0x848, 0),
-		DEF_RST(R9A07G044_WDT1_PRESETN, 0x848, 1),
-		DEF_RST(R9A07G044_WDT2_PRESETN, 0x848, 2),
-		DEF_RST(R9A07G044_SPI_RST, 0x850, 0),
-		DEF_RST(R9A07G044_SDHI0_IXRST, 0x854, 0),
-		DEF_RST(R9A07G044_SDHI1_IXRST, 0x854, 1),
-		DEF_RST(R9A07G044_GPU_RESETN, 0x858, 0),
-		DEF_RST(R9A07G044_GPU_AXI_RESETN, 0x858, 1),
-		DEF_RST(R9A07G044_GPU_ACE_RESETN, 0x858, 2),
-		DEF_RST(R9A07G044_SSI0_RST_M2_REG, 0x870, 0),
-		DEF_RST(R9A07G044_SSI1_RST_M2_REG, 0x870, 1),
-		DEF_RST(R9A07G044_SSI2_RST_M2_REG, 0x870, 2),
-		DEF_RST(R9A07G044_SSI3_RST_M2_REG, 0x870, 3),
-		DEF_RST(R9A07G044_USB_U2H0_HRESETN, 0x878, 0),
-		DEF_RST(R9A07G044_USB_U2H1_HRESETN, 0x878, 1),
-		DEF_RST(R9A07G044_USB_U2P_EXL_SYSRST, 0x878, 2),
-		DEF_RST(R9A07G044_USB_PRESETN, 0x878, 3),
-		DEF_RST(R9A07G044_ETH0_RST_HW_N, 0x87c, 0),
-		DEF_RST(R9A07G044_ETH1_RST_HW_N, 0x87c, 1),
-		DEF_RST(R9A07G044_I2C0_MRST, 0x880, 0),
-		DEF_RST(R9A07G044_I2C1_MRST, 0x880, 1),
-		DEF_RST(R9A07G044_I2C2_MRST, 0x880, 2),
-		DEF_RST(R9A07G044_I2C3_MRST, 0x880, 3),
-		DEF_RST(R9A07G044_SCIF0_RST_SYSTEM_N, 0x884, 0),
-		DEF_RST(R9A07G044_SCIF1_RST_SYSTEM_N, 0x884, 1),
-		DEF_RST(R9A07G044_SCIF2_RST_SYSTEM_N, 0x884, 2),
-		DEF_RST(R9A07G044_SCIF3_RST_SYSTEM_N, 0x884, 3),
-		DEF_RST(R9A07G044_SCIF4_RST_SYSTEM_N, 0x884, 4),
-		DEF_RST(R9A07G044_SCI0_RST, 0x888, 0),
-		DEF_RST(R9A07G044_SCI1_RST, 0x888, 1),
-		DEF_RST(R9A07G044_RSPI0_RST, 0x890, 0),
-		DEF_RST(R9A07G044_RSPI1_RST, 0x890, 1),
-		DEF_RST(R9A07G044_RSPI2_RST, 0x890, 2),
-		DEF_RST(R9A07G044_CANFD_RSTP_N, 0x894, 0),
-		DEF_RST(R9A07G044_CANFD_RSTC_N, 0x894, 1),
-		DEF_RST(R9A07G044_GPIO_RSTN, 0x898, 0),
-		DEF_RST(R9A07G044_GPIO_PORT_RESETN, 0x898, 1),
-		DEF_RST(R9A07G044_GPIO_SPARE_RESETN, 0x898, 2),
-		DEF_RST(R9A07G044_ADC_PRESETN, 0x8a8, 0),
-		DEF_RST(R9A07G044_ADC_ADRST_N, 0x8a8, 1),
-		DEF_RST(R9A07G044_TSU_PRESETN, 0x8ac, 0),
-	},
-#ifdef CONFIG_CLK_R9A07G054
-	.drp = {
-	},
-#endif
+static struct rzg2l_reset r9a07g044_resets[] = {
+	DEF_RST(R9A07G044_GIC600_GICRESET_N, 0x814, 0),
+	DEF_RST(R9A07G044_GIC600_DBG_GICRESET_N, 0x814, 1),
+	DEF_RST(R9A07G044_IA55_RESETN, 0x818, 0),
+	DEF_RST(R9A07G044_DMAC_ARESETN, 0x82c, 0),
+	DEF_RST(R9A07G044_DMAC_RST_ASYNC, 0x82c, 1),
+	DEF_RST(R9A07G044_OSTM0_PRESETZ, 0x834, 0),
+	DEF_RST(R9A07G044_OSTM1_PRESETZ, 0x834, 1),
+	DEF_RST(R9A07G044_OSTM2_PRESETZ, 0x834, 2),
+	DEF_RST(R9A07G044_WDT0_PRESETN, 0x848, 0),
+	DEF_RST(R9A07G044_WDT1_PRESETN, 0x848, 1),
+	DEF_RST(R9A07G044_WDT2_PRESETN, 0x848, 2),
+	DEF_RST(R9A07G044_SPI_RST, 0x850, 0),
+	DEF_RST(R9A07G044_SDHI0_IXRST, 0x854, 0),
+	DEF_RST(R9A07G044_SDHI1_IXRST, 0x854, 1),
+	DEF_RST(R9A07G044_GPU_RESETN, 0x858, 0),
+	DEF_RST(R9A07G044_GPU_AXI_RESETN, 0x858, 1),
+	DEF_RST(R9A07G044_GPU_ACE_RESETN, 0x858, 2),
+	DEF_RST(R9A07G044_SSI0_RST_M2_REG, 0x870, 0),
+	DEF_RST(R9A07G044_SSI1_RST_M2_REG, 0x870, 1),
+	DEF_RST(R9A07G044_SSI2_RST_M2_REG, 0x870, 2),
+	DEF_RST(R9A07G044_SSI3_RST_M2_REG, 0x870, 3),
+	DEF_RST(R9A07G044_USB_U2H0_HRESETN, 0x878, 0),
+	DEF_RST(R9A07G044_USB_U2H1_HRESETN, 0x878, 1),
+	DEF_RST(R9A07G044_USB_U2P_EXL_SYSRST, 0x878, 2),
+	DEF_RST(R9A07G044_USB_PRESETN, 0x878, 3),
+	DEF_RST(R9A07G044_ETH0_RST_HW_N, 0x87c, 0),
+	DEF_RST(R9A07G044_ETH1_RST_HW_N, 0x87c, 1),
+	DEF_RST(R9A07G044_I2C0_MRST, 0x880, 0),
+	DEF_RST(R9A07G044_I2C1_MRST, 0x880, 1),
+	DEF_RST(R9A07G044_I2C2_MRST, 0x880, 2),
+	DEF_RST(R9A07G044_I2C3_MRST, 0x880, 3),
+	DEF_RST(R9A07G044_SCIF0_RST_SYSTEM_N, 0x884, 0),
+	DEF_RST(R9A07G044_SCIF1_RST_SYSTEM_N, 0x884, 1),
+	DEF_RST(R9A07G044_SCIF2_RST_SYSTEM_N, 0x884, 2),
+	DEF_RST(R9A07G044_SCIF3_RST_SYSTEM_N, 0x884, 3),
+	DEF_RST(R9A07G044_SCIF4_RST_SYSTEM_N, 0x884, 4),
+	DEF_RST(R9A07G044_SCI0_RST, 0x888, 0),
+	DEF_RST(R9A07G044_SCI1_RST, 0x888, 1),
+	DEF_RST(R9A07G044_RSPI0_RST, 0x890, 0),
+	DEF_RST(R9A07G044_RSPI1_RST, 0x890, 1),
+	DEF_RST(R9A07G044_RSPI2_RST, 0x890, 2),
+	DEF_RST(R9A07G044_CANFD_RSTP_N, 0x894, 0),
+	DEF_RST(R9A07G044_CANFD_RSTC_N, 0x894, 1),
+	DEF_RST(R9A07G044_GPIO_RSTN, 0x898, 0),
+	DEF_RST(R9A07G044_GPIO_PORT_RESETN, 0x898, 1),
+	DEF_RST(R9A07G044_GPIO_SPARE_RESETN, 0x898, 2),
+	DEF_RST(R9A07G044_ADC_PRESETN, 0x8a8, 0),
+	DEF_RST(R9A07G044_ADC_ADRST_N, 0x8a8, 1),
+	DEF_RST(R9A07G044_TSU_PRESETN, 0x8ac, 0),
 };
 
 static const unsigned int r9a07g044_crit_mod_clks[] __initconst = {
@@ -385,8 +374,8 @@ const struct rzg2l_cpg_info r9a07g044_cpg_info = {
 	.num_hw_mod_clks = R9A07G044_TSU_PCLK + 1,
 
 	/* Resets */
-	.resets = rzg2l_resets.common,
-	.num_resets = ARRAY_SIZE(rzg2l_resets.common),
+	.resets = r9a07g044_resets,
+	.num_resets = R9A07G044_TSU_PRESETN + 1, /* Last reset ID + 1 */
 };
 
 #ifdef CONFIG_CLK_R9A07G054
@@ -407,7 +396,7 @@ const struct rzg2l_cpg_info r9a07g054_cpg_info = {
 	.num_hw_mod_clks = R9A07G054_STPAI_ACLK_DRP + 1,
 
 	/* Resets */
-	.resets = rzg2l_resets.common,
-	.num_resets = ARRAY_SIZE(rzg2l_resets.common) + ARRAY_SIZE(rzg2l_resets.drp),
+	.resets = r9a07g044_resets,
+	.num_resets = R9A07G054_STPAI_ARESETN + 1, /* Last reset ID + 1 */
 };
 #endif
-- 
2.17.1

