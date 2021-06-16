Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8C7D3A98F5
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Jun 2021 13:18:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229951AbhFPLU3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Jun 2021 07:20:29 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:58610 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229563AbhFPLU2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Jun 2021 07:20:28 -0400
X-IronPort-AV: E=Sophos;i="5.83,277,1616425200"; 
   d="scan'208";a="84403327"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 16 Jun 2021 20:18:21 +0900
Received: from localhost.localdomain (unknown [10.226.93.117])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 050F54001964;
        Wed, 16 Jun 2021 20:18:19 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] dt-bindings: clk: renesas: Update {ETH,SDHI,USB} CPG Clock Definitions
Date:   Wed, 16 Jun 2021 11:59:49 +0100
Message-Id: <20210616105949.10215-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Update {ETH, SDHI, USB} clock definitions, as they need special
handling.

ETH has 2 clocks controlled by single bit.
USB has 4 clocks pclock is shared by USB Ch0 and USB Ch1.
SDHI has 4 clocks.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 include/dt-bindings/clock/r9a07g044-cpg.h | 102 ++++++++++++----------
 1 file changed, 56 insertions(+), 46 deletions(-)

diff --git a/include/dt-bindings/clock/r9a07g044-cpg.h b/include/dt-bindings/clock/r9a07g044-cpg.h
index 1d8986563fc5..fe6db7519a63 100644
--- a/include/dt-bindings/clock/r9a07g044-cpg.h
+++ b/include/dt-bindings/clock/r9a07g044-cpg.h
@@ -39,51 +39,61 @@
 #define R9A07G044_CLK_SYSC		4
 #define R9A07G044_CLK_MTU		5
 #define R9A07G044_CLK_GPT		6
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
+#define ETH0_CLK_AXI			7
+#define ETH0_CLK_CHI			8
+#define ETH1_CLK_AXI			9
+#define ETH1_CLK_CHI			10
+#define R9A07G044_CLK_I2C0		11
+#define R9A07G044_CLK_I2C1		12
+#define R9A07G044_CLK_I2C2		13
+#define R9A07G044_CLK_I2C3		14
+#define R9A07G044_CLK_SCIF0		15
+#define R9A07G044_CLK_SCIF1		16
+#define R9A07G044_CLK_SCIF2		17
+#define R9A07G044_CLK_SCIF3		18
+#define R9A07G044_CLK_SCIF4		19
+#define R9A07G044_CLK_SCI0		20
+#define R9A07G044_CLK_SCI1		21
+#define R9A07G044_CLK_GPIO		22
+#define R9A07G044_CLK_SDHI0_IMCLK	23
+#define R9A07G044_CLK_SDHI0_IMCLK2	24
+#define R9A07G044_CLK_SDHI0_CLK_HS	25
+#define R9A07G044_CLK_SDHI0_ACLK	26
+#define R9A07G044_CLK_SDHI1_IMCLK	27
+#define R9A07G044_CLK_SDHI1_IMCLK2	28
+#define R9A07G044_CLK_SDHI1_CLK_HS	29
+#define R9A07G044_CLK_SDHI1_ACLK	30
+#define R9A07G044_CLK_USB_U2H0_HCLK	31
+#define R9A07G044_CLK_USB_U2H1_HCLK	32
+#define R9A07G044_CLK_HSUSB		33
+#define R9A07G044_CLK_USB_PCLK		34
+#define R9A07G044_CLK_CANFD		35
+#define R9A07G044_CLK_SSI0		36
+#define R9A07G044_CLK_SSI1		37
+#define R9A07G044_CLK_SSI2		38
+#define R9A07G044_CLK_SSI3		39
+#define R9A07G044_CLK_MHU		40
+#define R9A07G044_CLK_OSTM0		41
+#define R9A07G044_CLK_OSTM1		42
+#define R9A07G044_CLK_OSTM2		43
+#define R9A07G044_CLK_WDT0		44
+#define R9A07G044_CLK_WDT1		45
+#define R9A07G044_CLK_WDT2		46
+#define R9A07G044_CLK_WDT_PON		47
+#define R9A07G044_CLK_GPU		48
+#define R9A07G044_CLK_ISU		49
+#define R9A07G044_CLK_H264		50
+#define R9A07G044_CLK_CRU		51
+#define R9A07G044_CLK_MIPI_DSI		52
+#define R9A07G044_CLK_LCDC		53
+#define R9A07G044_CLK_SRC		54
+#define R9A07G044_CLK_RSPI0		55
+#define R9A07G044_CLK_RSPI1		56
+#define R9A07G044_CLK_RSPI2		57
+#define R9A07G044_CLK_ADC		58
+#define R9A07G044_CLK_TSU_PCLK		59
+#define R9A07G044_CLK_SPI		60
+#define R9A07G044_CLK_MIPI_DSI_V	61
+#define R9A07G044_CLK_MIPI_DSI_PIN	62
 
 #endif /* __DT_BINDINGS_CLOCK_R9A07G044_CPG_H__ */
-- 
2.17.1

