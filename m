Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 381905183BA
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 May 2022 14:01:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233112AbiECMEq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 3 May 2022 08:04:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235042AbiECMEp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 3 May 2022 08:04:45 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3CC7E3134F;
        Tue,  3 May 2022 05:01:10 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.91,195,1647270000"; 
   d="scan'208";a="119861721"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 03 May 2022 21:01:09 +0900
Received: from localhost.localdomain (unknown [10.226.92.6])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 1B9DC4226AEA;
        Tue,  3 May 2022 21:01:06 +0900 (JST)
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH v3 02/12] dt-bindings: clock: Add r9a09g011 CPG Clock Definitions
Date:   Tue,  3 May 2022 12:55:47 +0100
Message-Id: <20220503115557.53370-3-phil.edworthy@renesas.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220503115557.53370-1-phil.edworthy@renesas.com>
References: <20220503115557.53370-1-phil.edworthy@renesas.com>
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

Define RZ/V2M (R9A09G011) Clock Pulse Generator module clock outputs
(CPG_CLK_ON* registers), and reset definitions (CPG_RST_* registers)
in Section 48.5 ("Register Description") of the RZ/V2M Hardware User's
Manual (Rev. 1.10, Sep. 2021).

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3:
 - Add missing clocks and resets.
 - Change names of ETH clocks to ETH0, even though there is just one ETH,
   to match the HW manual.
 - Change names of IIC PCLKs to better match the HW manual
---
 include/dt-bindings/clock/r9a09g011-cpg.h | 352 ++++++++++++++++++++++
 1 file changed, 352 insertions(+)
 create mode 100644 include/dt-bindings/clock/r9a09g011-cpg.h

diff --git a/include/dt-bindings/clock/r9a09g011-cpg.h b/include/dt-bindings/clock/r9a09g011-cpg.h
new file mode 100644
index 000000000000..41dd585d7115
--- /dev/null
+++ b/include/dt-bindings/clock/r9a09g011-cpg.h
@@ -0,0 +1,352 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+ *
+ * Copyright (C) 2022 Renesas Electronics Corp.
+ */
+#ifndef __DT_BINDINGS_CLOCK_R9A09G011_CPG_H__
+#define __DT_BINDINGS_CLOCK_R9A09G011_CPG_H__
+
+#include <dt-bindings/clock/renesas-cpg-mssr.h>
+
+/* Module Clocks */
+#define R9A09G011_SYS_CLK		0
+#define R9A09G011_PFC_PCLK		1
+#define R9A09G011_PMC_CORE_CLOCK	2
+#define R9A09G011_GIC_CLK		3
+#define R9A09G011_RAMA_ACLK		4
+#define R9A09G011_ROMA_ACLK		5
+#define R9A09G011_SEC_ACLK		6
+#define R9A09G011_SEC_PCLK		7
+#define R9A09G011_SEC_TCLK		8
+#define R9A09G011_DMAA_ACLK		9
+#define R9A09G011_TSU0_PCLK		10
+#define R9A09G011_TSU1_PCLK		11
+
+#define R9A09G011_CST_TRACECLK		12
+#define R9A09G011_CST_SB_CLK		13
+#define R9A09G011_CST_AHB_CLK		14
+#define R9A09G011_CST_ATB_SB_CLK	15
+#define R9A09G011_CST_TS_SB_CLK		16
+
+#define R9A09G011_SDI0_ACLK		17
+#define R9A09G011_SDI0_IMCLK		18
+#define R9A09G011_SDI0_IMCLK2		19
+#define R9A09G011_SDI0_CLK_HS		20
+#define R9A09G011_SDI1_ACLK		21
+#define R9A09G011_SDI1_IMCLK		22
+#define R9A09G011_SDI1_IMCLK2		23
+#define R9A09G011_SDI1_CLK_HS		24
+#define R9A09G011_EMM_ACLK		25
+#define R9A09G011_EMM_IMCLK		26
+#define R9A09G011_EMM_IMCLK2		27
+#define R9A09G011_EMM_CLK_HS		28
+#define R9A09G011_NFI_ACLK		29
+#define R9A09G011_NFI_NF_CLK		30
+
+#define R9A09G011_PCI_ACLK		31
+#define R9A09G011_PCI_CLK_PMU		32
+#define R9A09G011_PCI_APB_CLK		33
+#define R9A09G011_USB_ACLK_H		34
+#define R9A09G011_USB_ACLK_P		35
+#define R9A09G011_USB_PCLK		36
+#define R9A09G011_ETH0_CLK_AXI		37
+#define R9A09G011_ETH0_CLK_CHI		38
+#define R9A09G011_ETH0_GPTP_EXT		39
+
+#define R9A09G011_SDT_CLK		40
+#define R9A09G011_SDT_CLKAPB		41
+#define R9A09G011_SDT_CLK48		42
+#define R9A09G011_GRP_CLK		43
+#define R9A09G011_CIF_P0_CLK		44
+#define R9A09G011_CIF_P1_CLK		45
+#define R9A09G011_CIF_APB_CLK		46
+#define R9A09G011_DCI_CLKAXI		47
+#define R9A09G011_DCI_CLKAPB		48
+#define R9A09G011_DCI_CLKDCI2		49
+
+#define R9A09G011_HMI_PCLK		50
+#define R9A09G011_LCI_PCLK		51
+#define R9A09G011_LCI_ACLK		52
+#define R9A09G011_LCI_VCLK		53
+#define R9A09G011_LCI_LPCLK		54
+
+#define R9A09G011_AUI_CLK		55
+#define R9A09G011_AUI_CLKAXI		56
+#define R9A09G011_AUI_CLKAPB		57
+#define R9A09G011_AUMCLK		58
+#define R9A09G011_GMCLK0		59
+#define R9A09G011_GMCLK1		60
+#define R9A09G011_MTR_CLK0		61
+#define R9A09G011_MTR_CLK1		62
+#define R9A09G011_MTR_CLKAPB		63
+#define R9A09G011_GFT_CLK		64
+#define R9A09G011_GFT_CLKAPB		65
+#define R9A09G011_GFT_MCLK		66
+
+#define R9A09G011_ATGA_CLK		67
+#define R9A09G011_ATGA_CLKAPB		68
+#define R9A09G011_ATGB_CLK		69
+#define R9A09G011_ATGB_CLKAPB		70
+#define R9A09G011_SYC_CNT_CLK		71
+
+#define R9A09G011_CPERI_GRPA_PCLK	72
+#define R9A09G011_TIM0_CLK		73
+#define R9A09G011_TIM1_CLK		74
+#define R9A09G011_TIM2_CLK		75
+#define R9A09G011_TIM3_CLK		76
+#define R9A09G011_TIM4_CLK		77
+#define R9A09G011_TIM5_CLK		78
+#define R9A09G011_TIM6_CLK		79
+#define R9A09G011_TIM7_CLK		80
+#define R9A09G011_IIC_PCLK0		81
+
+#define R9A09G011_CPERI_GRPB_PCLK	82
+#define R9A09G011_TIM8_CLK		83
+#define R9A09G011_TIM9_CLK		84
+#define R9A09G011_TIM10_CLK		85
+#define R9A09G011_TIM11_CLK		86
+#define R9A09G011_TIM12_CLK		87
+#define R9A09G011_TIM13_CLK		88
+#define R9A09G011_TIM14_CLK		89
+#define R9A09G011_TIM15_CLK		90
+#define R9A09G011_IIC_PCLK1		91
+
+#define R9A09G011_CPERI_GRPC_PCLK	92
+#define R9A09G011_TIM16_CLK		93
+#define R9A09G011_TIM17_CLK		94
+#define R9A09G011_TIM18_CLK		95
+#define R9A09G011_TIM19_CLK		96
+#define R9A09G011_TIM20_CLK		97
+#define R9A09G011_TIM21_CLK		98
+#define R9A09G011_TIM22_CLK		99
+#define R9A09G011_TIM23_CLK		100
+#define R9A09G011_WDT0_PCLK		101
+#define R9A09G011_WDT0_CLK		102
+#define R9A09G011_WDT1_PCLK		103
+#define R9A09G011_WDT1_CLK		104
+
+#define R9A09G011_CPERI_GRPD_PCLK	105
+#define R9A09G011_TIM24_CLK		106
+#define R9A09G011_TIM25_CLK		107
+#define R9A09G011_TIM26_CLK		108
+#define R9A09G011_TIM27_CLK		109
+#define R9A09G011_TIM28_CLK		110
+#define R9A09G011_TIM29_CLK		111
+#define R9A09G011_TIM30_CLK		112
+#define R9A09G011_TIM31_CLK		113
+
+#define R9A09G011_CPERI_GRPE_PCLK	114
+#define R9A09G011_PWM0_CLK		115
+#define R9A09G011_PWM1_CLK		116
+#define R9A09G011_PWM2_CLK		117
+#define R9A09G011_PWM3_CLK		118
+#define R9A09G011_PWM4_CLK		119
+#define R9A09G011_PWM5_CLK		120
+#define R9A09G011_PWM6_CLK		121
+#define R9A09G011_PWM7_CLK		122
+
+#define R9A09G011_CPERI_GRPF_PCLK	123
+#define R9A09G011_PWM8_CLK		124
+#define R9A09G011_PWM9_CLK		125
+#define R9A09G011_PWM10_CLK		126
+#define R9A09G011_PWM11_CLK		127
+#define R9A09G011_PWM12_CLK		128
+#define R9A09G011_PWM13_CLK		129
+#define R9A09G011_PWM14_CLK		130
+#define R9A09G011_PWM15_CLK		131
+
+#define R9A09G011_CPERI_GRPG_PCLK	132
+#define R9A09G011_CPERI_GRPH_PCLK	133
+#define R9A09G011_URT_PCLK		134
+#define R9A09G011_URT0_CLK		135
+#define R9A09G011_URT1_CLK		136
+#define R9A09G011_CSI0_CLK		137
+#define R9A09G011_CSI1_CLK		138
+#define R9A09G011_CSI2_CLK		139
+#define R9A09G011_CSI3_CLK		140
+#define R9A09G011_CSI4_CLK		141
+#define R9A09G011_CSI5_CLK		142
+
+#define R9A09G011_ICB_ACLK1		143
+#define R9A09G011_ICB_GIC_CLK		144
+#define R9A09G011_ICB_MPCLK1		145
+#define R9A09G011_ICB_SPCLK1		146
+#define R9A09G011_ICB_CLK48		147
+#define R9A09G011_ICB_CLK48_2		148
+#define R9A09G011_ICB_CLK48_3		149
+#define R9A09G011_ICB_CLK48_4L		150
+#define R9A09G011_ICB_CLK48_4R		151
+#define R9A09G011_ICB_CLK48_5		152
+#define R9A09G011_ICB_CST_ATB_SB_CLK	153
+#define R9A09G011_ICB_CST_CS_CLK	154
+#define R9A09G011_ICB_CLK100_1		155
+#define R9A09G011_ICB_ETH0_CLK_AXI	156
+#define R9A09G011_ICB_DCI_CLKAXI	157
+#define R9A09G011_ICB_SYC_CNT_CLK	158
+
+#define R9A09G011_ICB_DRPA_ACLK		159
+#define R9A09G011_ICB_RFX_ACLK		160
+#define R9A09G011_ICB_RFX_PCLK5		161
+#define R9A09G011_ICB_MMC_ACLK		162
+
+#define R9A09G011_ICB_MPCLK3		163
+#define R9A09G011_ICB_CIMA_CLK		164
+#define R9A09G011_ICB_CIMB_CLK		165
+#define R9A09G011_ICB_BIMA_CLK		166
+#define R9A09G011_ICB_FCD_CLKAXI	167
+#define R9A09G011_ICB_VD_ACLK4		168
+#define R9A09G011_ICB_MPCLK4		169
+#define R9A09G011_ICB_VCD_PCLK4		170
+
+#define R9A09G011_CA53_CLK		171
+#define R9A09G011_CA53_ACLK		172
+#define R9A09G011_CA53_APCLK_DBG	173
+#define R9A09G011_CST_APB_CA53_CLK	174
+#define R9A09G011_CA53_ATCLK		175
+#define R9A09G011_CST_CS_CLK		176
+#define R9A09G011_CA53_TSCLK		177
+#define R9A09G011_CST_TS_CLK		178
+#define R9A09G011_CA53_APCLK_REG	179
+
+#define R9A09G011_DRPA_ACLK		180
+#define R9A09G011_DRPA_DCLK		181
+#define R9A09G011_DRPA_INITCLK		182
+
+#define R9A09G011_RAMB0_ACLK		183
+#define R9A09G011_RAMB1_ACLK		184
+#define R9A09G011_RAMB2_ACLK		185
+#define R9A09G011_RAMB3_ACLK		186
+
+#define R9A09G011_CIMA_CLKAPB		187
+#define R9A09G011_CIMA_CLK		188
+#define R9A09G011_CIMB_CLK		189
+#define R9A09G011_FAFA_CLK		190
+#define R9A09G011_STG_CLKAXI		191
+#define R9A09G011_STG_CLK0		192
+
+#define R9A09G011_BIMA_CLKAPB		193
+#define R9A09G011_BIMA_CLK		194
+#define R9A09G011_FAFB_CLK		195
+#define R9A09G011_FCD_CLK		196
+#define R9A09G011_FCD_CLKAXI		197
+
+#define R9A09G011_RIM_CLK		198
+#define R9A09G011_VCD_ACLK		199
+#define R9A09G011_VCD_PCLK		200
+#define R9A09G011_JPG0_CLK		201
+#define R9A09G011_JPG0_ACLK		202
+
+#define R9A09G011_MMC_CORE_DDRC_CLK	203
+#define R9A09G011_MMC_ACLK		204
+#define R9A09G011_MMC_PCLK		205
+#define R9A09G011_DDI_APBCLK		206
+
+/* Resets */
+#define R9A09G011_SYS_RST_N		0
+#define R9A09G011_PFC_PRESETN		1
+#define R9A09G011_RAMA_ARESETN		2
+#define R9A09G011_ROM_ARESETN		3
+#define R9A09G011_DMAA_ARESETN		4
+#define R9A09G011_SEC_ARESETN		5
+#define R9A09G011_SEC_PRESETN		6
+#define R9A09G011_SEC_RSTB		7
+#define R9A09G011_TSU0_RESETN		8
+#define R9A09G011_TSU1_RESETN		9
+#define R9A09G011_PMC_RESET_N		10
+
+#define R9A09G011_CST_NTRST		11
+#define R9A09G011_CST_NPOTRST		12
+#define R9A09G011_CST_NTRST2		13
+#define R9A09G011_CST_CS_RESETN		14
+#define R9A09G011_CST_TS_RESETN		15
+#define R9A09G011_CST_TRESETN		16
+#define R9A09G011_CST_SB_RESETN		17
+#define R9A09G011_CST_AHB_RESETN	18
+#define R9A09G011_CST_TS_SB_RESETN	19
+#define R9A09G011_CST_APB_CA53_RESETN	20
+#define R9A09G011_CST_ATB_SB_RESETN	21
+
+#define R9A09G011_SDI0_IXRST		22
+#define R9A09G011_SDI1_IXRST		23
+#define R9A09G011_EMM_IXRST		24
+#define R9A09G011_NFI_MARESETN		25
+#define R9A09G011_NFI_REG_RST_N		26
+#define R9A09G011_USB_PRESET_N		27
+#define R9A09G011_USB_DRD_RESET		28
+#define R9A09G011_USB_ARESETN_P		29
+#define R9A09G011_USB_ARESETN_H		30
+#define R9A09G011_ETH0_RST_HW_N		31
+#define R9A09G011_PCI_ARESETN		32
+
+#define R9A09G011_SDT_RSTSYSAX		33
+#define R9A09G011_GRP_RESETN		34
+#define R9A09G011_CIF_RST_N		35
+#define R9A09G011_DCU_RSTSYSAX		36
+#define R9A09G011_HMI_RST_N		37
+#define R9A09G011_HMI_PRESETN		38
+#define R9A09G011_LCI_PRESETN		39
+#define R9A09G011_LCI_ARESETN		40
+
+#define R9A09G011_AUI_RSTSYSAX		41
+#define R9A09G011_MTR_RSTSYSAX		42
+#define R9A09G011_GFT_RSTSYSAX		43
+#define R9A09G011_ATGA_RSTSYSAX		44
+#define R9A09G011_ATGB_RSTSYSAX		45
+#define R9A09G011_SYC_RST_N		46
+
+#define R9A09G011_TIM_GPA_PRESETN	47
+#define R9A09G011_TIM_GPB_PRESETN	48
+#define R9A09G011_TIM_GPC_PRESETN	49
+#define R9A09G011_TIM_GPD_PRESETN	50
+#define R9A09G011_PWM_GPE_PRESETN	51
+#define R9A09G011_PWM_GPF_PRESETN	52
+#define R9A09G011_CSI_GPG_PRESETN	53
+#define R9A09G011_CSI_GPH_PRESETN	54
+#define R9A09G011_IIC_GPA_PRESETN	55
+#define R9A09G011_IIC_GPB_PRESETN	56
+#define R9A09G011_URT_PRESETN		57
+#define R9A09G011_WDT0_PRESETN		58
+#define R9A09G011_WDT1_PRESETN		59
+
+#define R9A09G011_ICB_PD_AWO_RST_N	60
+#define R9A09G011_ICB_PD_MMC_RST_N	61
+#define R9A09G011_ICB_PD_VD0_RST_N	62
+#define R9A09G011_ICB_PD_VD1_RST_N	63
+#define R9A09G011_ICB_PD_RFX_RST_N	64
+
+#define R9A09G011_CA53_NCPUPORESET0	65
+#define R9A09G011_CA53_NCPUPORESET1	66
+#define R9A09G011_CA53_NCORERESET0	67
+#define R9A09G011_CA53_NCORERESET1	68
+#define R9A09G011_CA53_NPRESETDBG	69
+#define R9A09G011_CA53_L2RESET		70
+#define R9A09G011_CA53_NMISCRESET_HM	71
+#define R9A09G011_CA53_NMISCRESET_SM	72
+#define R9A09G011_CA53_NARESET		73
+
+#define R9A09G011_DRPA_ARESETN		74
+
+#define R9A09G011_RAMB0_ARESETN		75
+#define R9A09G011_RAMB1_ARESETN		76
+#define R9A09G011_RAMB2_ARESETN		77
+#define R9A09G011_RAMB3_ARESETN		78
+
+#define R9A09G011_CIMA_RSTSYSAX		79
+#define R9A09G011_CIMB_RSTSYSAX		80
+#define R9A09G011_FAFA_RSTSYSAX		81
+#define R9A09G011_STG_RSTSYSAX		82
+
+#define R9A09G011_BIMA_RSTSYSAX		83
+#define R9A09G011_FAFB_RSTSYSAX		84
+#define R9A09G011_FCD_RSTSYSAX		85
+#define R9A09G011_RIM_RSTSYSAX		86
+#define R9A09G011_VCD_RESETN		87
+#define R9A09G011_JPG_XRESET		88
+
+#define R9A09G011_MMC_CORE_DDRC_RSTN	89
+#define R9A09G011_MMC_ARESETN_N		90
+#define R9A09G011_MMC_PRESETN		91
+#define R9A09G011_DDI_PWROK		92
+#define R9A09G011_DDI_RESET		93
+#define R9A09G011_DDI_RESETN_APB	94
+
+#endif /* __DT_BINDINGS_CLOCK_R9A09G011_CPG_H__ */
-- 
2.32.0

