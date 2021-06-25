Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A6B33B497C
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 25 Jun 2021 21:55:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229878AbhFYT5f (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 25 Jun 2021 15:57:35 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:8739 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229712AbhFYT5f (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Jun 2021 15:57:35 -0400
X-IronPort-AV: E=Sophos;i="5.83,299,1616425200"; 
   d="scan'208";a="85449054"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 26 Jun 2021 04:55:13 +0900
Received: from localhost.localdomain (unknown [10.226.92.12])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 6772440E6204;
        Sat, 26 Jun 2021 04:55:11 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 05/10] dt-bindings: clk: r9a07g044-cpg: Update clock/reset definitions
Date:   Fri, 25 Jun 2021 20:54:50 +0100
Message-Id: <20210625195455.3607-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210625195455.3607-1-biju.das.jz@bp.renesas.com>
References: <20210625195455.3607-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Update clock and reset definitions as per RZ/G2L_clock_list_r02_02.xlsx
and RZ/G2L HW(Rev.0.50) manual.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2->v3:
  * Added Geert's Rb tag.
v1->v2:
  * Added seperate reset entries.
v1:-
  * https://patchwork.kernel.org/project/linux-renesas-soc/patch/20210618095823.19885-2-biju.das.jz@bp.renesas.com/
---
 include/dt-bindings/clock/r9a07g044-cpg.h | 236 +++++++++++++++++-----
 1 file changed, 183 insertions(+), 53 deletions(-)

diff --git a/include/dt-bindings/clock/r9a07g044-cpg.h b/include/dt-bindings/clock/r9a07g044-cpg.h
index 1d8986563fc5..0728ad07ff7a 100644
--- a/include/dt-bindings/clock/r9a07g044-cpg.h
+++ b/include/dt-bindings/clock/r9a07g044-cpg.h
@@ -32,58 +32,188 @@
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
+#define R9A07G044_ETH0_CLK_AXI		73
+#define R9A07G044_ETH0_CLK_CHI		74
+#define R9A07G044_ETH1_CLK_AXI		75
+#define R9A07G044_ETH1_CLK_CHI		76
+#define R9A07G044_I2C0_PCLK		77
+#define R9A07G044_I2C1_PCLK		78
+#define R9A07G044_I2C2_PCLK		79
+#define R9A07G044_I2C3_PCLK		80
+#define R9A07G044_SCIF0_CLK_PCK		81
+#define R9A07G044_SCIF1_CLK_PCK		82
+#define R9A07G044_SCIF2_CLK_PCK		83
+#define R9A07G044_SCIF3_CLK_PCK		84
+#define R9A07G044_SCIF4_CLK_PCK		85
+#define R9A07G044_SCI0_CLKP		86
+#define R9A07G044_SCI1_CLKP		87
+#define R9A07G044_IRDA_CLKP		88
+#define R9A07G044_RSPI0_CLKB		89
+#define R9A07G044_RSPI1_CLKB		90
+#define R9A07G044_RSPI2_CLKB		91
+#define R9A07G044_CANFD_PCLK		92
+#define R9A07G044_GPIO_HCLK		93
+#define R9A07G044_ADC_ADCLK		94
+#define R9A07G044_ADC_PCLK		95
+#define R9A07G044_TSU_PCLK		96
+
+/* R9A07G044 Resets */
+#define R9A07G044_CA55_RST_1_0		0
+#define R9A07G044_CA55_RST_1_1		1
+#define R9A07G044_CA55_RST_3_0		2
+#define R9A07G044_CA55_RST_3_1		3
+#define R9A07G044_CA55_RST_4		4
+#define R9A07G044_CA55_RST_5		5
+#define R9A07G044_CA55_RST_6		6
+#define R9A07G044_CA55_RST_7		7
+#define R9A07G044_CA55_RST_8		8
+#define R9A07G044_CA55_RST_9		9
+#define R9A07G044_CA55_RST_10		10
+#define R9A07G044_CA55_RST_11		11
+#define R9A07G044_CA55_RST_12		12
+#define R9A07G044_GIC600_GICRESET_N	13
+#define R9A07G044_GIC600_DBG_GICRESET_N	14
+#define R9A07G044_IA55_RESETN		15
+#define R9A07G044_MHU_RESETN		16
+#define R9A07G044_DMAC_ARESETN		17
+#define R9A07G044_DMAC_RST_ASYNC	18
+#define R9A07G044_SYC_RESETN		19
+#define R9A07G044_OSTM0_PRESETZ		20
+#define R9A07G044_OSTM1_PRESETZ		21
+#define R9A07G044_OSTM2_PRESETZ		22
+#define R9A07G044_MTU_X_PRESET_MTU3	23
+#define R9A07G044_POE3_RST_M_REG	24
+#define R9A07G044_GPT_RST_C		25
+#define R9A07G044_POEG_A_RST		26
+#define R9A07G044_POEG_B_RST		27
+#define R9A07G044_POEG_C_RST		28
+#define R9A07G044_POEG_D_RST		29
+#define R9A07G044_WDT0_PRESETN		30
+#define R9A07G044_WDT1_PRESETN		31
+#define R9A07G044_WDT2_PRESETN		32
+#define R9A07G044_SPI_RST		33
+#define R9A07G044_SDHI0_IXRST		34
+#define R9A07G044_SDHI1_IXRST		35
+#define R9A07G044_GPU_RESETN		36
+#define R9A07G044_GPU_AXI_RESETN	37
+#define R9A07G044_GPU_ACE_RESETN	38
+#define R9A07G044_ISU_ARESETN		39
+#define R9A07G044_ISU_PRESETN		40
+#define R9A07G044_H264_X_RESET_VCP	41
+#define R9A07G044_H264_CP_PRESET_P	42
+#define R9A07G044_CRU_CMN_RSTB		43
+#define R9A07G044_CRU_PRESETN		44
+#define R9A07G044_CRU_ARESETN		45
+#define R9A07G044_MIPI_DSI_CMN_RSTB	46
+#define R9A07G044_MIPI_DSI_ARESET_N	47
+#define R9A07G044_MIPI_DSI_PRESET_N	48
+#define R9A07G044_LCDC_RESET_N		49
+#define R9A07G044_SSI0_RST_M2_REG	50
+#define R9A07G044_SSI1_RST_M2_REG	51
+#define R9A07G044_SSI2_RST_M2_REG	52
+#define R9A07G044_SSI3_RST_M2_REG	53
+#define R9A07G044_SRC_RST		54
+#define R9A07G044_USB_U2H0_HRESETN	55
+#define R9A07G044_USB_U2H1_HRESETN	56
+#define R9A07G044_USB_U2P_EXL_SYSRST	57
+#define R9A07G044_USB_PRESETN		58
+#define R9A07G044_ETH0_RST_HW_N		59
+#define R9A07G044_ETH1_RST_HW_N		60
+#define R9A07G044_I2C0_MRST		61
+#define R9A07G044_I2C1_MRST		62
+#define R9A07G044_I2C2_MRST		63
+#define R9A07G044_I2C3_MRST		64
+#define R9A07G044_SCIF0_RST_SYSTEM_N	65
+#define R9A07G044_SCIF1_RST_SYSTEM_N	66
+#define R9A07G044_SCIF2_RST_SYSTEM_N	67
+#define R9A07G044_SCIF3_RST_SYSTEM_N	68
+#define R9A07G044_SCIF4_RST_SYSTEM_N	69
+#define R9A07G044_SCI0_RST		70
+#define R9A07G044_SCI1_RST		71
+#define R9A07G044_IRDA_RST		72
+#define R9A07G044_RSPI0_RST		73
+#define R9A07G044_RSPI1_RST		74
+#define R9A07G044_RSPI2_RST		75
+#define R9A07G044_CANFD_RSTP_N		76
+#define R9A07G044_CANFD_RSTC_N		77
+#define R9A07G044_GPIO_RSTN		78
+#define R9A07G044_GPIO_PORT_RESETN	79
+#define R9A07G044_GPIO_SPARE_RESETN	80
+#define R9A07G044_ADC_PRESETN		81
+#define R9A07G044_ADC_ADRST_N		82
+#define R9A07G044_TSU_PRESETN		83
 
 #endif /* __DT_BINDINGS_CLOCK_R9A07G044_CPG_H__ */
-- 
2.17.1

