Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B9CB4EFF53
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  2 Apr 2022 09:32:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241915AbiDBHck (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 2 Apr 2022 03:32:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241575AbiDBHci (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 2 Apr 2022 03:32:38 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C6EBB173B3E;
        Sat,  2 Apr 2022 00:30:46 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,229,1643641200"; 
   d="scan'208";a="115483261"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 02 Apr 2022 16:30:46 +0900
Received: from localhost.localdomain (unknown [10.226.92.166])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 270AA4001DB4;
        Sat,  2 Apr 2022 16:30:43 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v4 2/5] dt-bindings: clock: Add R9A07G043 CPG Clock and Reset Definitions
Date:   Sat,  2 Apr 2022 08:30:34 +0100
Message-Id: <20220402073037.23947-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220402073037.23947-1-biju.das.jz@bp.renesas.com>
References: <20220402073037.23947-1-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Define RZ/G2UL (R9A07G043U) Clock Pulse Generator Core Clock and module
clock outputs, as listed in Table 7.1.4.2 ("Clock List r0.51") and also
add Reset definitions referring to registers CPG_RST_* in Section 7.2.3
("Register configuration") of the RZ/G2UL Hardware User's Manual (Rev.
0.51, Nov. 2021).

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Acked-by: Rob Herring <robh@kernel.org>
---
v3->v4:
 * Added Ab tag from Rob
 * Removed LAST_COMMON macro from clock and reset indices.
 * Added comment for RZ/G2UL specific clocks
 * Listed all clocks and reset in the same order as RZ/G2L.
v2->v3:
 * Removed leading u/U from r9a07g043
 * renamed the file r9a07g043u-cpg.h->r9a07g043-cpg.h
 * Prepared Common Module Clock/Reset indices for RZ/G2UL and RZ/Five
 * Prepared RZ/G2UL specific Module Clock/Reset indices.
v1->v2:
 * No change
---
 include/dt-bindings/clock/r9a07g043-cpg.h | 184 ++++++++++++++++++++++
 1 file changed, 184 insertions(+)
 create mode 100644 include/dt-bindings/clock/r9a07g043-cpg.h

diff --git a/include/dt-bindings/clock/r9a07g043-cpg.h b/include/dt-bindings/clock/r9a07g043-cpg.h
new file mode 100644
index 000000000000..4cc5ad354188
--- /dev/null
+++ b/include/dt-bindings/clock/r9a07g043-cpg.h
@@ -0,0 +1,184 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+ *
+ * Copyright (C) 2022 Renesas Electronics Corp.
+ */
+#ifndef __DT_BINDINGS_CLOCK_R9A07G043_CPG_H__
+#define __DT_BINDINGS_CLOCK_R9A07G043_CPG_H__
+
+#include <dt-bindings/clock/renesas-cpg-mssr.h>
+
+/* R9A07G043 CPG Core Clocks */
+#define R9A07G043_CLK_I			0
+#define R9A07G043_CLK_I2		1
+#define R9A07G043_CLK_S0		2
+#define R9A07G043_CLK_SPI0		3
+#define R9A07G043_CLK_SPI1		4
+#define R9A07G043_CLK_SD0		5
+#define R9A07G043_CLK_SD1		6
+#define R9A07G043_CLK_M0		7
+#define R9A07G043_CLK_M2		8
+#define R9A07G043_CLK_M3		9
+#define R9A07G043_CLK_HP		10
+#define R9A07G043_CLK_TSU		11
+#define R9A07G043_CLK_ZT		12
+#define R9A07G043_CLK_P0		13
+#define R9A07G043_CLK_P1		14
+#define R9A07G043_CLK_P2		15
+#define R9A07G043_CLK_AT		16
+#define R9A07G043_OSCCLK		17
+#define R9A07G043_CLK_P0_DIV2		18
+
+/* R9A07G043 Module Clocks */
+#define R9A07G043_CA55_SCLK		0	/* RZ/G2UL Only */
+#define R9A07G043_CA55_PCLK		1	/* RZ/G2UL Only */
+#define R9A07G043_CA55_ATCLK		2	/* RZ/G2UL Only */
+#define R9A07G043_CA55_GICCLK		3	/* RZ/G2UL Only */
+#define R9A07G043_CA55_PERICLK		4	/* RZ/G2UL Only */
+#define R9A07G043_CA55_ACLK		5	/* RZ/G2UL Only */
+#define R9A07G043_CA55_TSCLK		6	/* RZ/G2UL Only */
+#define R9A07G043_GIC600_GICCLK		7	/* RZ/G2UL Only */
+#define R9A07G043_IA55_CLK		8	/* RZ/G2UL Only */
+#define R9A07G043_IA55_PCLK		9	/* RZ/G2UL Only */
+#define R9A07G043_MHU_PCLK		10	/* RZ/G2UL Only */
+#define R9A07G043_SYC_CNT_CLK		11
+#define R9A07G043_DMAC_ACLK		12
+#define R9A07G043_DMAC_PCLK		13
+#define R9A07G043_OSTM0_PCLK		14
+#define R9A07G043_OSTM1_PCLK		15
+#define R9A07G043_OSTM2_PCLK		16
+#define R9A07G043_MTU_X_MCK_MTU3	17
+#define R9A07G043_POE3_CLKM_POE		18
+#define R9A07G043_WDT0_PCLK		19
+#define R9A07G043_WDT0_CLK		20
+#define R9A07G043_WDT2_PCLK		21	/* RZ/G2UL Only */
+#define R9A07G043_WDT2_CLK		22	/* RZ/G2UL Only */
+#define R9A07G043_SPI_CLK2		23
+#define R9A07G043_SPI_CLK		24
+#define R9A07G043_SDHI0_IMCLK		25
+#define R9A07G043_SDHI0_IMCLK2		26
+#define R9A07G043_SDHI0_CLK_HS		27
+#define R9A07G043_SDHI0_ACLK		28
+#define R9A07G043_SDHI1_IMCLK		29
+#define R9A07G043_SDHI1_IMCLK2		30
+#define R9A07G043_SDHI1_CLK_HS		31
+#define R9A07G043_SDHI1_ACLK		32
+#define R9A07G043_ISU_ACLK		33	/* RZ/G2UL Only */
+#define R9A07G043_ISU_PCLK		34	/* RZ/G2UL Only */
+#define R9A07G043_CRU_SYSCLK		35	/* RZ/G2UL Only */
+#define R9A07G043_CRU_VCLK		36	/* RZ/G2UL Only */
+#define R9A07G043_CRU_PCLK		37	/* RZ/G2UL Only */
+#define R9A07G043_CRU_ACLK		38	/* RZ/G2UL Only */
+#define R9A07G043_LCDC_CLK_A		39	/* RZ/G2UL Only */
+#define R9A07G043_LCDC_CLK_P		40	/* RZ/G2UL Only */
+#define R9A07G043_LCDC_CLK_D		41	/* RZ/G2UL Only */
+#define R9A07G043_SSI0_PCLK2		42
+#define R9A07G043_SSI0_PCLK_SFR		43
+#define R9A07G043_SSI1_PCLK2		44
+#define R9A07G043_SSI1_PCLK_SFR		45
+#define R9A07G043_SSI2_PCLK2		46
+#define R9A07G043_SSI2_PCLK_SFR		47
+#define R9A07G043_SSI3_PCLK2		48
+#define R9A07G043_SSI3_PCLK_SFR		49
+#define R9A07G043_SRC_CLKP		50	/* RZ/G2UL Only */
+#define R9A07G043_USB_U2H0_HCLK		51
+#define R9A07G043_USB_U2H1_HCLK		52
+#define R9A07G043_USB_U2P_EXR_CPUCLK	53
+#define R9A07G043_USB_PCLK		54
+#define R9A07G043_ETH0_CLK_AXI		55
+#define R9A07G043_ETH0_CLK_CHI		56
+#define R9A07G043_ETH1_CLK_AXI		57
+#define R9A07G043_ETH1_CLK_CHI		58
+#define R9A07G043_I2C0_PCLK		59
+#define R9A07G043_I2C1_PCLK		60
+#define R9A07G043_I2C2_PCLK		61
+#define R9A07G043_I2C3_PCLK		62
+#define R9A07G043_SCIF0_CLK_PCK		63
+#define R9A07G043_SCIF1_CLK_PCK		64
+#define R9A07G043_SCIF2_CLK_PCK		65
+#define R9A07G043_SCIF3_CLK_PCK		66
+#define R9A07G043_SCIF4_CLK_PCK		67
+#define R9A07G043_SCI0_CLKP		68
+#define R9A07G043_SCI1_CLKP		69
+#define R9A07G043_IRDA_CLKP		70
+#define R9A07G043_RSPI0_CLKB		71
+#define R9A07G043_RSPI1_CLKB		72
+#define R9A07G043_RSPI2_CLKB		73
+#define R9A07G043_CANFD_PCLK		74
+#define R9A07G043_GPIO_HCLK		75
+#define R9A07G043_ADC_ADCLK		76
+#define R9A07G043_ADC_PCLK		77
+#define R9A07G043_TSU_PCLK		78
+
+/* R9A07G044 Resets */
+#define R9A07G043_CA55_RST_1_0		0	/* RZ/G2UL Only */
+#define R9A07G043_CA55_RST_1_1		1	/* RZ/G2UL Only */
+#define R9A07G043_CA55_RST_3_0		2	/* RZ/G2UL Only */
+#define R9A07G043_CA55_RST_3_1		3	/* RZ/G2UL Only */
+#define R9A07G043_CA55_RST_4		4	/* RZ/G2UL Only */
+#define R9A07G043_CA55_RST_5		5	/* RZ/G2UL Only */
+#define R9A07G043_CA55_RST_6		6	/* RZ/G2UL Only */
+#define R9A07G043_CA55_RST_7		7	/* RZ/G2UL Only */
+#define R9A07G043_CA55_RST_8		8	/* RZ/G2UL Only */
+#define R9A07G043_CA55_RST_9		9	/* RZ/G2UL Only */
+#define R9A07G043_CA55_RST_10		10	/* RZ/G2UL Only */
+#define R9A07G043_CA55_RST_11		11	/* RZ/G2UL Only */
+#define R9A07G043_CA55_RST_12		12	/* RZ/G2UL Only */
+#define R9A07G043_GIC600_GICRESET_N	13	/* RZ/G2UL Only */
+#define R9A07G043_GIC600_DBG_GICRESET_N	14	/* RZ/G2UL Only */
+#define R9A07G043_IA55_RESETN		15	/* RZ/G2UL Only */
+#define R9A07G043_MHU_RESETN		16	/* RZ/G2UL Only */
+#define R9A07G043_DMAC_ARESETN		17
+#define R9A07G043_DMAC_RST_ASYNC	18
+#define R9A07G043_SYC_RESETN		19
+#define R9A07G043_OSTM0_PRESETZ		20
+#define R9A07G043_OSTM1_PRESETZ		21
+#define R9A07G043_OSTM2_PRESETZ		22
+#define R9A07G043_MTU_X_PRESET_MTU3	23
+#define R9A07G043_POE3_RST_M_REG	24
+#define R9A07G043_WDT0_PRESETN		25
+#define R9A07G043_WDT2_PRESETN		26	/* RZ/G2UL Only */
+#define R9A07G043_SPI_RST		27
+#define R9A07G043_SDHI0_IXRST		28
+#define R9A07G043_SDHI1_IXRST		29
+#define R9A07G043_ISU_ARESETN		30	/* RZ/G2UL Only */
+#define R9A07G043_ISU_PRESETN		31	/* RZ/G2UL Only */
+#define R9A07G043_CRU_CMN_RSTB		32	/* RZ/G2UL Only */
+#define R9A07G043_CRU_PRESETN		33	/* RZ/G2UL Only */
+#define R9A07G043_CRU_ARESETN		34	/* RZ/G2UL Only */
+#define R9A07G043_LCDC_RESET_N		35	/* RZ/G2UL Only */
+#define R9A07G043_SSI0_RST_M2_REG	36
+#define R9A07G043_SSI1_RST_M2_REG	37
+#define R9A07G043_SSI2_RST_M2_REG	38
+#define R9A07G043_SSI3_RST_M2_REG	39
+#define R9A07G043_SRC_RST		40	/* RZ/G2UL Only */
+#define R9A07G043_USB_U2H0_HRESETN	41
+#define R9A07G043_USB_U2H1_HRESETN	42
+#define R9A07G043_USB_U2P_EXL_SYSRST	43
+#define R9A07G043_USB_PRESETN		44
+#define R9A07G043_ETH0_RST_HW_N		45
+#define R9A07G043_ETH1_RST_HW_N		46
+#define R9A07G043_I2C0_MRST		47
+#define R9A07G043_I2C1_MRST		48
+#define R9A07G043_I2C2_MRST		49
+#define R9A07G043_I2C3_MRST		50
+#define R9A07G043_SCIF0_RST_SYSTEM_N	51
+#define R9A07G043_SCIF1_RST_SYSTEM_N	52
+#define R9A07G043_SCIF2_RST_SYSTEM_N	53
+#define R9A07G043_SCIF3_RST_SYSTEM_N	54
+#define R9A07G043_SCIF4_RST_SYSTEM_N	55
+#define R9A07G043_SCI0_RST		56
+#define R9A07G043_SCI1_RST		57
+#define R9A07G043_IRDA_RST		58
+#define R9A07G043_RSPI0_RST		59
+#define R9A07G043_RSPI1_RST		60
+#define R9A07G043_RSPI2_RST		61
+#define R9A07G043_CANFD_RSTP_N		62
+#define R9A07G043_CANFD_RSTC_N		63
+#define R9A07G043_GPIO_RSTN		64
+#define R9A07G043_GPIO_PORT_RESETN	65
+#define R9A07G043_GPIO_SPARE_RESETN	66
+#define R9A07G043_ADC_PRESETN		67
+#define R9A07G043_ADC_ADRST_N		68
+#define R9A07G043_TSU_PRESETN		69
+
+#endif /* __DT_BINDINGS_CLOCK_R9A07G043_CPG_H__ */
-- 
2.17.1

