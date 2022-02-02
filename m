Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1814E4A78C1
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Feb 2022 20:33:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243752AbiBBTdu (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Feb 2022 14:33:50 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:28308 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230007AbiBBTdu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Feb 2022 14:33:50 -0500
X-IronPort-AV: E=Sophos;i="5.88,337,1635174000"; 
   d="scan'208";a="108464083"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 03 Feb 2022 04:33:48 +0900
Received: from localhost.localdomain (unknown [10.226.92.2])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id CAA8E40F8ACC;
        Thu,  3 Feb 2022 04:33:46 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 2/4] arm64: dts: renesas: rzg2lc-smarc: Add macros for DIP-Switch settings
Date:   Wed,  2 Feb 2022 19:33:37 +0000
Message-Id: <20220202193339.22441-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220202193339.22441-1-biju.das.jz@bp.renesas.com>
References: <20220202193339.22441-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

RZ/G2LC SoM uses DIP-SWitch SW1 for various pin multiplexing functions.

This patch describes DIP-SWitch SW1 settings on SoM and adds the
corresponding macros for enabling pinmux functionality on RZ/G2LC
SMARC EVK.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2: No change
---
 .../boot/dts/renesas/r9a07g044c2-smarc.dts    |  4 +--
 arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi | 36 +++++++++++++++++++
 2 files changed, 37 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi

diff --git a/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts b/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts
index af84fd6c8a81..50abdabc374a 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts
@@ -7,9 +7,7 @@
 
 /dts-v1/;
 #include "r9a07g044c2.dtsi"
-#include "rzg2lc-smarc-som.dtsi"
-#include "rzg2lc-smarc-pinfunction.dtsi"
-#include "rz-smarc-common.dtsi"
+#include "rzg2lc-smarc.dtsi"
 
 / {
 	model = "Renesas SMARC EVK based on r9a07g044c2";
diff --git a/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
new file mode 100644
index 000000000000..ca5ca7ce6692
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/G2LC SMARC EVK parts
+ *
+ * Copyright (C) 2022 Renesas Electronics Corp.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
+
+/*
+ * DIP-Switch SW1 setting on SoM
+ * 1 : High; 0: Low
+ * SW1-2 : SW_SD0_DEV_SEL	(1: eMMC; 0: uSD)
+ * SW1-3 : SW_SCIF_CAN		(1: CAN1; 0: SCIF1)
+ * SW1-4 : SW_RSPI_CAN		(1: CAN1; 0: RSPI1)
+ * SW1-5 : SW_I2S0_I2S1		(1: I2S2 (HDMI audio); 0: I2S0)
+ * Please change below macros according to SW1 setting
+ */
+
+#define SW_SCIF_CAN	0
+#if (SW_SCIF_CAN)
+/* Due to HW routing, SW_RSPI_CAN is always 0 when SW_SCIF_CAN is set to 1 */
+#define SW_RSPI_CAN	0
+#else
+/* Please set SW_RSPI_CAN. Default value is 1 */
+#define SW_RSPI_CAN	1
+#endif
+
+#if (SW_SCIF_CAN & SW_RSPI_CAN)
+#error "Can not set 1 to both SW_SCIF_CAN and SW_RSPI_CAN due to HW routing"
+#endif
+
+#include "rzg2lc-smarc-som.dtsi"
+#include "rzg2lc-smarc-pinfunction.dtsi"
+#include "rz-smarc-common.dtsi"
-- 
2.17.1

