Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B9F53A19BF
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jun 2021 17:33:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237316AbhFIPfN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Jun 2021 11:35:13 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:54523 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S237168AbhFIPfL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Jun 2021 11:35:11 -0400
X-IronPort-AV: E=Sophos;i="5.83,261,1616425200"; 
   d="scan'208";a="83886980"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 10 Jun 2021 00:33:16 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id C5D7B4009102;
        Thu, 10 Jun 2021 00:33:12 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 06/11] clk: renesas: Define RZ/G2L CPG Clock Definitions
Date:   Wed,  9 Jun 2021 16:32:25 +0100
Message-Id: <20210609153230.6967-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210609153230.6967-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20210609153230.6967-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Define RZ/G2L (R9A07G044) Clock Pulse Generator Core Clock
and module clock outputs, as listed in Table 8.3 ("Clock List")
of the RZ/G2L Hardware User's Manual (Rev.0.42, Feb.2021).

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 include/dt-bindings/clock/r9a07g044-cpg.h | 89 +++++++++++++++++++++++
 1 file changed, 89 insertions(+)
 create mode 100644 include/dt-bindings/clock/r9a07g044-cpg.h

diff --git a/include/dt-bindings/clock/r9a07g044-cpg.h b/include/dt-bindings/clock/r9a07g044-cpg.h
new file mode 100644
index 000000000000..1d8986563fc5
--- /dev/null
+++ b/include/dt-bindings/clock/r9a07g044-cpg.h
@@ -0,0 +1,89 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+ *
+ * Copyright (C) 2021 Renesas Electronics Corp.
+ */
+#ifndef __DT_BINDINGS_CLOCK_R9A07G044_CPG_H__
+#define __DT_BINDINGS_CLOCK_R9A07G044_CPG_H__
+
+#include <dt-bindings/clock/renesas-cpg-mssr.h>
+
+/* R9A07G044 CPG Core Clocks */
+#define R9A07G044_CLK_I			0
+#define R9A07G044_CLK_I2		1
+#define R9A07G044_CLK_G			2
+#define R9A07G044_CLK_S0		3
+#define R9A07G044_CLK_S1		4
+#define R9A07G044_CLK_SPI0		5
+#define R9A07G044_CLK_SPI1		6
+#define R9A07G044_CLK_SD0		7
+#define R9A07G044_CLK_SD1		8
+#define R9A07G044_CLK_M0		9
+#define R9A07G044_CLK_M1		10
+#define R9A07G044_CLK_M2		11
+#define R9A07G044_CLK_M3		12
+#define R9A07G044_CLK_M4		13
+#define R9A07G044_CLK_HP		14
+#define R9A07G044_CLK_TSU		15
+#define R9A07G044_CLK_ZT		16
+#define R9A07G044_CLK_P0		17
+#define R9A07G044_CLK_P1		18
+#define R9A07G044_CLK_P2		19
+#define R9A07G044_CLK_AT		20
+#define R9A07G044_OSCCLK		21
+
+/* R9A07G044 Module Clocks */
+#define R9A07G044_CLK_GIC600		0
+#define R9A07G044_CLK_IA55		1
+#define R9A07G044_CLK_SYC		2
+#define R9A07G044_CLK_DMAC		3
+#define R9A07G044_CLK_SYSC		4
+#define R9A07G044_CLK_MTU		5
+#define R9A07G044_CLK_GPT		6
+#define R9A07G044_CLK_ETH0		7
+#define R9A07G044_CLK_ETH1		8
+#define R9A07G044_CLK_I2C0		9
+#define R9A07G044_CLK_I2C1		10
+#define R9A07G044_CLK_I2C2		11
+#define R9A07G044_CLK_I2C3		12
+#define R9A07G044_CLK_SCIF0		13
+#define R9A07G044_CLK_SCIF1		14
+#define R9A07G044_CLK_SCIF2		15
+#define R9A07G044_CLK_SCIF3		16
+#define R9A07G044_CLK_SCIF4		17
+#define R9A07G044_CLK_SCI0		18
+#define R9A07G044_CLK_SCI1		19
+#define R9A07G044_CLK_GPIO		20
+#define R9A07G044_CLK_SDHI0		21
+#define R9A07G044_CLK_SDHI1		22
+#define R9A07G044_CLK_USB0		23
+#define R9A07G044_CLK_USB1		24
+#define R9A07G044_CLK_CANFD		25
+#define R9A07G044_CLK_SSI0		26
+#define R9A07G044_CLK_SSI1		27
+#define R9A07G044_CLK_SSI2		28
+#define R9A07G044_CLK_SSI3		29
+#define R9A07G044_CLK_MHU		30
+#define R9A07G044_CLK_OSTM0		31
+#define R9A07G044_CLK_OSTM1		32
+#define R9A07G044_CLK_OSTM2		33
+#define R9A07G044_CLK_WDT0		34
+#define R9A07G044_CLK_WDT1		35
+#define R9A07G044_CLK_WDT2		36
+#define R9A07G044_CLK_WDT_PON		37
+#define R9A07G044_CLK_GPU		38
+#define R9A07G044_CLK_ISU		39
+#define R9A07G044_CLK_H264		40
+#define R9A07G044_CLK_CRU		41
+#define R9A07G044_CLK_MIPI_DSI		42
+#define R9A07G044_CLK_LCDC		43
+#define R9A07G044_CLK_SRC		44
+#define R9A07G044_CLK_RSPI0		45
+#define R9A07G044_CLK_RSPI1		46
+#define R9A07G044_CLK_RSPI2		47
+#define R9A07G044_CLK_ADC		48
+#define R9A07G044_CLK_TSU_PCLK		49
+#define R9A07G044_CLK_SPI		50
+#define R9A07G044_CLK_MIPI_DSI_V	51
+#define R9A07G044_CLK_MIPI_DSI_PIN	52
+
+#endif /* __DT_BINDINGS_CLOCK_R9A07G044_CPG_H__ */
-- 
2.17.1

