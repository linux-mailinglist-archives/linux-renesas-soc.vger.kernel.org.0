Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2AFA4D9D77
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 15 Mar 2022 15:26:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349067AbiCOO2K (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 15 Mar 2022 10:28:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233525AbiCOO2J (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 15 Mar 2022 10:28:09 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 44ED154FA5;
        Tue, 15 Mar 2022 07:26:57 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,183,1643641200"; 
   d="scan'208";a="113582339"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 15 Mar 2022 23:26:56 +0900
Received: from localhost.localdomain (unknown [10.226.92.209])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id E12924325461;
        Tue, 15 Mar 2022 23:26:54 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 3/7] dt-bindings: clock: Add R9A07G043 CPG Clock and Reset Definitions
Date:   Tue, 15 Mar 2022 14:26:40 +0000
Message-Id: <20220315142644.17660-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220315142644.17660-1-biju.das.jz@bp.renesas.com>
References: <20220315142644.17660-1-biju.das.jz@bp.renesas.com>
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
---
v2->v3:
 * Removed leading u/U from r9a07g043
 * renamed the file r9a07g043u-cpg.h->r9a07g043-cpg.h
 * Prepared Common Module Clock/Reset indices for RZ/G2UL and RZ/Five
 * Prepared RZ/G2UL specific Module Clock/Reset indices.
v1->v2:
 * No change
---
 include/dt-bindings/clock/r9a07g043-cpg.h | 190 ++++++++++++++++++++++
 1 file changed, 190 insertions(+)
 create mode 100644 include/dt-bindings/clock/r9a07g043-cpg.h

diff --git a/include/dt-bindings/clock/r9a07g043-cpg.h b/include/dt-bindings/clock/r9a07g043-cpg.h
new file mode 100644
index 000000000000..a3429ad15aad
--- /dev/null
+++ b/include/dt-bindings/clock/r9a07g043-cpg.h
@@ -0,0 +1,190 @@
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
+/* R9A07G043 Common Module Clocks */
+#define R9A07G043_IA55_CLK		0
+#define R9A07G043_IA55_PCLK		1
+#define R9A07G043_DMAC_ACLK		2
+#define R9A07G043_DMAC_PCLK		3
+#define R9A07G043_OSTM0_PCLK		4
+#define R9A07G043_OSTM1_PCLK		5
+#define R9A07G043_OSTM2_PCLK		6
+#define R9A07G043_MTU_X_MCK_MTU3	7
+#define R9A07G043_POE3_CLKM_POE		8
+#define R9A07G043_WDT0_PCLK		9
+#define R9A07G043_WDT0_CLK		10
+#define R9A07G043_SPI_CLK2		11
+#define R9A07G043_SPI_CLK		12
+#define R9A07G043_SDHI0_IMCLK		13
+#define R9A07G043_SDHI0_IMCLK2		14
+#define R9A07G043_SDHI0_CLK_HS		15
+#define R9A07G043_SDHI0_ACLK		16
+#define R9A07G043_SDHI1_IMCLK		17
+#define R9A07G043_SDHI1_IMCLK2		18
+#define R9A07G043_SDHI1_CLK_HS		19
+#define R9A07G043_SDHI1_ACLK		20
+#define R9A07G043_SSI0_PCLK2		21
+#define R9A07G043_SSI0_PCLK_SFR		22
+#define R9A07G043_SSI1_PCLK2		23
+#define R9A07G043_SSI1_PCLK_SFR		24
+#define R9A07G043_SSI2_PCLK2		25
+#define R9A07G043_SSI2_PCLK_SFR		26
+#define R9A07G043_SSI3_PCLK2		27
+#define R9A07G043_SSI3_PCLK_SFR		28
+#define R9A07G043_SRC_CLKP		29
+#define R9A07G043_USB_U2H0_HCLK		30
+#define R9A07G043_USB_U2H1_HCLK		31
+#define R9A07G043_USB_U2P_EXR_CPUCLK	32
+#define R9A07G043_USB_PCLK		33
+#define R9A07G043_ETH0_CLK_AXI		34
+#define R9A07G043_ETH0_CLK_CHI		35
+#define R9A07G043_ETH1_CLK_AXI		36
+#define R9A07G043_ETH1_CLK_CHI		37
+#define R9A07G043_I2C0_PCLK		38
+#define R9A07G043_I2C1_PCLK		39
+#define R9A07G043_I2C2_PCLK		40
+#define R9A07G043_I2C3_PCLK		41
+#define R9A07G043_SCIF0_CLK_PCK		42
+#define R9A07G043_SCIF1_CLK_PCK		43
+#define R9A07G043_SCIF2_CLK_PCK		44
+#define R9A07G043_SCIF3_CLK_PCK		45
+#define R9A07G043_SCIF4_CLK_PCK		46
+#define R9A07G043_SCI0_CLKP		47
+#define R9A07G043_SCI1_CLKP		48
+#define R9A07G043_IRDA_CLKP		49
+#define R9A07G043_RSPI0_CLKB		50
+#define R9A07G043_RSPI1_CLKB		51
+#define R9A07G043_RSPI2_CLKB		52
+#define R9A07G043_CANFD_PCLK		53
+#define R9A07G043_GPIO_HCLK		54
+#define R9A07G043_ADC_ADCLK		55
+#define R9A07G043_ADC_PCLK		56
+#define R9A07G043_TSU_PCLK		57
+#define R9A07G043_LAST_COMMON_CLK	(R9A07G043_TSU_PCLK)
+
+/* RZ/G2UL Specific */
+#define R9A07G043_CA55_SCLK		(R9A07G043_LAST_COMMON_CLK + 1)
+#define R9A07G043_CA55_PCLK		(R9A07G043_LAST_COMMON_CLK + 2)
+#define R9A07G043_CA55_ATCLK		(R9A07G043_LAST_COMMON_CLK + 3)
+#define R9A07G043_CA55_GICCLK		(R9A07G043_LAST_COMMON_CLK + 4)
+#define R9A07G043_CA55_PERICLK		(R9A07G043_LAST_COMMON_CLK + 5)
+#define R9A07G043_CA55_ACLK		(R9A07G043_LAST_COMMON_CLK + 6)
+#define R9A07G043_CA55_TSCLK		(R9A07G043_LAST_COMMON_CLK + 7)
+#define R9A07G043_GIC600_GICCLK		(R9A07G043_LAST_COMMON_CLK + 8)
+#define R9A07G043_MHU_PCLK		(R9A07G043_LAST_COMMON_CLK + 9)
+#define R9A07G043_SYC_CNT_CLK		(R9A07G043_LAST_COMMON_CLK + 10)
+#define R9A07G043_WDT2_PCLK		(R9A07G043_LAST_COMMON_CLK + 11)
+#define R9A07G043_WDT2_CLK		(R9A07G043_LAST_COMMON_CLK + 12)
+#define R9A07G043_ISU_ACLK		(R9A07G043_LAST_COMMON_CLK + 13)
+#define R9A07G043_ISU_PCLK		(R9A07G043_LAST_COMMON_CLK + 14)
+#define R9A07G043_CRU_SYSCLK		(R9A07G043_LAST_COMMON_CLK + 15)
+#define R9A07G043_CRU_VCLK		(R9A07G043_LAST_COMMON_CLK + 16)
+#define R9A07G043_CRU_PCLK		(R9A07G043_LAST_COMMON_CLK + 17)
+#define R9A07G043_CRU_ACLK		(R9A07G043_LAST_COMMON_CLK + 18)
+#define R9A07G043_LCDC_CLK_A		(R9A07G043_LAST_COMMON_CLK + 19)
+#define R9A07G043_LCDC_CLK_P		(R9A07G043_LAST_COMMON_CLK + 20)
+#define R9A07G043_LCDC_CLK_D		(R9A07G043_LAST_COMMON_CLK + 21)
+
+/* R9A07G043 Common Resets */
+#define R9A07G043_IA55_RESETN		0
+#define R9A07G043_DMAC_ARESETN		1
+#define R9A07G043_DMAC_RST_ASYNC	2
+#define R9A07G043_OSTM0_PRESETZ		3
+#define R9A07G043_OSTM1_PRESETZ		4
+#define R9A07G043_OSTM2_PRESETZ		5
+#define R9A07G043_MTU_X_PRESET_MTU3	6
+#define R9A07G043_POE3_RST_M_REG	7
+#define R9A07G043_WDT0_PRESETN		8
+#define R9A07G043_SPI_RST		9
+#define R9A07G043_SDHI0_IXRST		10
+#define R9A07G043_SDHI1_IXRST		11
+#define R9A07G043_SRC_RST		12
+#define R9A07G043_USB_U2H0_HRESETN	13
+#define R9A07G043_USB_U2H1_HRESETN	14
+#define R9A07G043_USB_U2P_EXL_SYSRST	15
+#define R9A07G043_USB_PRESETN		16
+#define R9A07G043_I2C0_MRST		17
+#define R9A07G043_I2C1_MRST		18
+#define R9A07G043_I2C2_MRST		19
+#define R9A07G043_I2C3_MRST		20
+#define R9A07G043_SCI0_RST		21
+#define R9A07G043_SCI1_RST		22
+#define R9A07G043_IRDA_RST		23
+#define R9A07G043_RSPI0_RST		24
+#define R9A07G043_RSPI1_RST		25
+#define R9A07G043_RSPI2_RST		26
+#define R9A07G043_CANFD_RSTP_N		27
+#define R9A07G043_CANFD_RSTC_N		28
+#define R9A07G043_GPIO_RSTN		29
+#define R9A07G043_GPIO_PORT_RESETN	30
+#define R9A07G043_GPIO_SPARE_RESETN	31
+#define R9A07G043_TSU_PRESETN		32
+#define R9A07G043_SSI0_RST_M2_REG	33
+#define R9A07G043_SSI1_RST_M2_REG	34
+#define R9A07G043_SSI2_RST_M2_REG	35
+#define R9A07G043_SSI3_RST_M2_REG	36
+#define R9A07G043_ETH0_RST_HW_N		37
+#define R9A07G043_ETH1_RST_HW_N		38
+#define R9A07G043_SCIF0_RST_SYSTEM_N	39
+#define R9A07G043_SCIF1_RST_SYSTEM_N	40
+#define R9A07G043_SCIF2_RST_SYSTEM_N	41
+#define R9A07G043_SCIF3_RST_SYSTEM_N	42
+#define R9A07G043_SCIF4_RST_SYSTEM_N	43
+#define R9A07G043_ADC_PRESETN		44
+#define R9A07G043_ADC_ADRST_N		45
+#define R9A07G043_LAST_COMMON_RST	(R9A07G043_ADC_ADRST_N)
+
+/* RZ/G2UL Specific */
+#define R9A07G043_CA55_RST_1_0		(R9A07G043_LAST_COMMON_RST + 1)
+#define R9A07G043_CA55_RST_1_1		(R9A07G043_LAST_COMMON_RST + 2)
+#define R9A07G043_CA55_RST_3_0		(R9A07G043_LAST_COMMON_RST + 3)
+#define R9A07G043_CA55_RST_3_1		(R9A07G043_LAST_COMMON_RST + 4)
+#define R9A07G043_CA55_RST_4		(R9A07G043_LAST_COMMON_RST + 5)
+#define R9A07G043_CA55_RST_5		(R9A07G043_LAST_COMMON_RST + 6)
+#define R9A07G043_CA55_RST_6		(R9A07G043_LAST_COMMON_RST + 7)
+#define R9A07G043_CA55_RST_7		(R9A07G043_LAST_COMMON_RST + 8)
+#define R9A07G043_CA55_RST_8		(R9A07G043_LAST_COMMON_RST + 9)
+#define R9A07G043_CA55_RST_9		(R9A07G043_LAST_COMMON_RST + 10)
+#define R9A07G043_CA55_RST_10		(R9A07G043_LAST_COMMON_RST + 11)
+#define R9A07G043_CA55_RST_11		(R9A07G043_LAST_COMMON_RST + 12)
+#define R9A07G043_CA55_RST_12		(R9A07G043_LAST_COMMON_RST + 13)
+#define R9A07G043_GIC600_GICRESET_N	(R9A07G043_LAST_COMMON_RST + 14)
+#define R9A07G043_GIC600_DBG_GICRESET_N	(R9A07G043_LAST_COMMON_RST + 15)
+#define R9A07G043_MHU_RESETN		(R9A07G043_LAST_COMMON_RST + 16)
+#define R9A07G043_SYC_RESETN		(R9A07G043_LAST_COMMON_RST + 17)
+#define R9A07G043_WDT2_PRESETN		(R9A07G043_LAST_COMMON_RST + 18)
+#define R9A07G043_ISU_ARESETN		(R9A07G043_LAST_COMMON_RST + 19)
+#define R9A07G043_ISU_PRESETN		(R9A07G043_LAST_COMMON_RST + 20)
+#define R9A07G043_CRU_CMN_RSTB		(R9A07G043_LAST_COMMON_RST + 21)
+#define R9A07G043_CRU_PRESETN		(R9A07G043_LAST_COMMON_RST + 22)
+#define R9A07G043_CRU_ARESETN		(R9A07G043_LAST_COMMON_RST + 23)
+#define R9A07G043_LCDC_RESET_N		(R9A07G043_LAST_COMMON_RST + 24)
+
+#endif /* __DT_BINDINGS_CLOCK_R9A07G043_CPG_H__ */
-- 
2.17.1

