Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1F313AC82B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Jun 2021 11:58:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233139AbhFRKAo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Jun 2021 06:00:44 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:34971 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S232690AbhFRKAm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Jun 2021 06:00:42 -0400
X-IronPort-AV: E=Sophos;i="5.83,283,1616425200"; 
   d="scan'208";a="84769008"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 18 Jun 2021 18:58:30 +0900
Received: from localhost.localdomain (unknown [10.226.93.115])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0ED49401BC11;
        Fri, 18 Jun 2021 18:58:28 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/7] dt-bindings: clk: r9a07g044-cpg: Update clock definitions
Date:   Fri, 18 Jun 2021 10:58:17 +0100
Message-Id: <20210618095823.19885-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210618095823.19885-1-biju.das.jz@bp.renesas.com>
References: <20210618095823.19885-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Update clock definitions as per the RZG2L_clock_list(Rev.02) manual.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 include/dt-bindings/clock/r9a07g044-cpg.h | 153 ++++++++++++++--------
 1 file changed, 100 insertions(+), 53 deletions(-)

diff --git a/include/dt-bindings/clock/r9a07g044-cpg.h b/include/dt-bindings/clock/r9a07g044-cpg.h
index 1d8986563fc5..7e0127646973 100644
--- a/include/dt-bindings/clock/r9a07g044-cpg.h
+++ b/include/dt-bindings/clock/r9a07g044-cpg.h
@@ -32,58 +32,105 @@
 #define R9A07G044_OSCCLK		21
 
 /* R9A07G044 Module Clocks */
-#define R9A07G044_CLK_GIC600		0
-#define R9A07G044_CLK_IA55		1
-#define R9A07G044_CLK_SYC		2
-#define R9A07G044_CLK_DMAC		3
-#define R9A07G044_CLK_SYSC		4
-#define R9A07G044_CLK_MTU		5
-#define R9A07G044_CLK_GPT		6
-#define R9A07G044_CLK_ETH0		7
-#define R9A07G044_CLK_ETH1		8
-#define R9A07G044_CLK_I2C0		9
-#define R9A07G044_CLK_I2C1		10
-#define R9A07G044_CLK_I2C2		11
-#define R9A07G044_CLK_I2C3		12
-#define R9A07G044_CLK_SCIF0		13
-#define R9A07G044_CLK_SCIF1		14
-#define R9A07G044_CLK_SCIF2		15
-#define R9A07G044_CLK_SCIF3		16
-#define R9A07G044_CLK_SCIF4		17
-#define R9A07G044_CLK_SCI0		18
-#define R9A07G044_CLK_SCI1		19
-#define R9A07G044_CLK_GPIO		20
-#define R9A07G044_CLK_SDHI0		21
-#define R9A07G044_CLK_SDHI1		22
-#define R9A07G044_CLK_USB0		23
-#define R9A07G044_CLK_USB1		24
-#define R9A07G044_CLK_CANFD		25
-#define R9A07G044_CLK_SSI0		26
-#define R9A07G044_CLK_SSI1		27
-#define R9A07G044_CLK_SSI2		28
-#define R9A07G044_CLK_SSI3		29
-#define R9A07G044_CLK_MHU		30
-#define R9A07G044_CLK_OSTM0		31
-#define R9A07G044_CLK_OSTM1		32
-#define R9A07G044_CLK_OSTM2		33
-#define R9A07G044_CLK_WDT0		34
-#define R9A07G044_CLK_WDT1		35
-#define R9A07G044_CLK_WDT2		36
-#define R9A07G044_CLK_WDT_PON		37
-#define R9A07G044_CLK_GPU		38
-#define R9A07G044_CLK_ISU		39
-#define R9A07G044_CLK_H264		40
-#define R9A07G044_CLK_CRU		41
-#define R9A07G044_CLK_MIPI_DSI		42
-#define R9A07G044_CLK_LCDC		43
-#define R9A07G044_CLK_SRC		44
-#define R9A07G044_CLK_RSPI0		45
-#define R9A07G044_CLK_RSPI1		46
-#define R9A07G044_CLK_RSPI2		47
-#define R9A07G044_CLK_ADC		48
-#define R9A07G044_CLK_TSU_PCLK		49
-#define R9A07G044_CLK_SPI		50
-#define R9A07G044_CLK_MIPI_DSI_V	51
-#define R9A07G044_CLK_MIPI_DSI_PIN	52
+#define R9A07G044_CA55_SCLK		0
+#define R9A07G044_CA55_PCLK		1
+#define R9A07G044_CA55_ATCLK		2
+#define R9A07G044_CA55_GICCLK		3
+#define R9A07G044_CA55_PERICLK		4
+#define R9A07G044_CA55_ACLK		5
+#define R9A07G044_CA55_TSCLK		6
+#define R9A07G044_GIC600_GICCLK		7
+#define R9A07G044_IA55_CLK		8
+#define R9A07G044_IA55_PCLK		9
+#define R9A07G044_MHU_PCLK		10
+#define R9A07G044_SYC_CNT_CLK		11
+#define R9A07G044_DMAC_ACLK		12
+#define R9A07G044_DMAC_PCLK		13
+#define R9A07G044_OSTM0_PCLK		14
+#define R9A07G044_OSTM1_PCLK		15
+#define R9A07G044_OSTM2_PCLK		16
+#define R9A07G044_MTU_X_MCK_MTU3	17
+#define R9A07G044_POE3_CLKM_POE		18
+#define R9A07G044_GPT_PCLK		19
+#define R9A07G044_POEG_A_CLKP		20
+#define R9A07G044_POEG_B_CLKP		21
+#define R9A07G044_POEG_C_CLKP		22
+#define R9A07G044_POEG_D_CLKP		23
+#define R9A07G044_WDT0_PCLK		24
+#define R9A07G044_WDT0_CLK		25
+#define R9A07G044_WDT1_PCLK		26
+#define R9A07G044_WDT1_CLK		27
+#define R9A07G044_WDT2_PCLK		28
+#define R9A07G044_WDT2_CLK		29
+#define R9A07G044_SPI_CLK2		30
+#define R9A07G044_SPI_CLK		31
+#define R9A07G044_SDHI0_IMCLK		32
+#define R9A07G044_SDHI0_IMCLK2		33
+#define R9A07G044_SDHI0_CLK_HS		34
+#define R9A07G044_SDHI0_ACLK		35
+#define R9A07G044_SDHI1_IMCLK		36
+#define R9A07G044_SDHI1_IMCLK2		37
+#define R9A07G044_SDHI1_CLK_HS		38
+#define R9A07G044_SDHI1_ACLK		39
+#define R9A07G044_GPU_CLK		40
+#define R9A07G044_GPU_AXI_CLK		41
+#define R9A07G044_GPU_ACE_CLK		42
+#define R9A07G044_ISU_ACLK		43
+#define R9A07G044_ISU_PCLK		44
+#define R9A07G044_H264_CLK_A		45
+#define R9A07G044_H264_CLK_P		46
+#define R9A07G044_CRU_SYSCLK		47
+#define R9A07G044_CRU_VCLK		48
+#define R9A07G044_CRU_PCLK		49
+#define R9A07G044_CRU_ACLK		50
+#define R9A07G044_MIPI_DSI_PLLCLK	51
+#define R9A07G044_MIPI_DSI_SYSCLK	52
+#define R9A07G044_MIPI_DSI_ACLK		53
+#define R9A07G044_MIPI_DSI_PCLK		54
+#define R9A07G044_MIPI_DSI_VCLK		55
+#define R9A07G044_MIPI_DSI_LPCLK	56
+#define R9A07G044_LCDC_CLK_A		57
+#define R9A07G044_LCDC_CLK_P		58
+#define R9A07G044_LCDC_CLK_D		59
+#define R9A07G044_SSI0_PCLK2		60
+#define R9A07G044_SSI0_PCLK_SFR		61
+#define R9A07G044_SSI1_PCLK2		62
+#define R9A07G044_SSI1_PCLK_SFR		63
+#define R9A07G044_SSI2_PCLK2		64
+#define R9A07G044_SSI2_PCLK_SFR		65
+#define R9A07G044_SSI3_PCLK2		66
+#define R9A07G044_SSI3_PCLK_SFR		67
+#define R9A07G044_SRC_CLKP		68
+#define R9A07G044_USB_U2H0_HCLK		69
+#define R9A07G044_USB_U2H1_HCLK		70
+#define R9A07G044_USB_U2P_EXR_CPUCLK	71
+#define R9A07G044_USB_PCLK		72
+#define R9A07G044_USB_SCLK		73
+#define R9A07G044_ETH0_CLK_AXI		74
+#define R9A07G044_ETH0_CLK_CHI		75
+#define R9A07G044_ETH0_REFCLK		76
+#define R9A07G044_ETH1_CLK_AXI		77
+#define R9A07G044_ETH1_CLK_CHI		78
+#define R9A07G044_ETH1_REFCLK		79
+#define R9A07G044_I2C0_PCLK		80
+#define R9A07G044_I2C1_PCLK		81
+#define R9A07G044_I2C2_PCLK		82
+#define R9A07G044_I2C3_PCLK		83
+#define R9A07G044_SCIF0_CLK_PCK		84
+#define R9A07G044_SCIF1_CLK_PCK		85
+#define R9A07G044_SCIF2_CLK_PCK		86
+#define R9A07G044_SCIF3_CLK_PCK		87
+#define R9A07G044_SCIF4_CLK_PCK		88
+#define R9A07G044_SCI0_CLKP		89
+#define R9A07G044_SCI1_CLKP		90
+#define R9A07G044_IRDA_CLKP		91
+#define R9A07G044_RSPI0_CLKB		92
+#define R9A07G044_RSPI1_CLKB		93
+#define R9A07G044_RSPI2_CLKB		94
+#define R9A07G044_CANFD_PCLK		95
+#define R9A07G044_GPIO_HCLK		96
+#define R9A07G044_ADC_ADCLK		97
+#define R9A07G044_ADC_PCLK		98
+#define R9A07G044_TSU_PCLK		99
 
 #endif /* __DT_BINDINGS_CLOCK_R9A07G044_CPG_H__ */
-- 
2.17.1

