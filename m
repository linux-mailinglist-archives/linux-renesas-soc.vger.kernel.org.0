Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D38E14A8946
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Feb 2022 18:07:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352498AbiBCRGz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Feb 2022 12:06:55 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:19627 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1352493AbiBCRGv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Feb 2022 12:06:51 -0500
X-IronPort-AV: E=Sophos;i="5.88,340,1635174000"; 
   d="scan'208";a="108564577"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 04 Feb 2022 02:06:50 +0900
Received: from localhost.localdomain (unknown [10.226.92.2])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 76FFA40B1832;
        Fri,  4 Feb 2022 02:06:48 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 3/4] arm64: dts: renesas: rzg2lc-smarc: Enable SCIF1 on carrier board
Date:   Thu,  3 Feb 2022 17:06:35 +0000
Message-Id: <20220203170636.7747-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220203170636.7747-1-biju.das.jz@bp.renesas.com>
References: <20220203170636.7747-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SCIF1 interface is available on PMOD1 connector (CN7) on carrier board.

This patch adds pinmux and scif1 node to carrier board dtsi file for
RZ/G2LC SMARC EVK.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3: No change
v1->v2: No change
---
 .../dts/renesas/rzg2lc-smarc-pinfunction.dtsi |  7 +++++
 arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi | 26 +++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg2lc-smarc-pinfunction.dtsi b/arch/arm64/boot/dts/renesas/rzg2lc-smarc-pinfunction.dtsi
index 1032f6563515..ec9e08ec0822 100644
--- a/arch/arm64/boot/dts/renesas/rzg2lc-smarc-pinfunction.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2lc-smarc-pinfunction.dtsi
@@ -17,6 +17,13 @@
 			 <RZG2L_PORT_PINMUX(38, 1, 1)>;	/* RxD */
 	};
 
+	scif1_pins: scif1 {
+		pinmux = <RZG2L_PORT_PINMUX(40, 0, 1)>, /* TxD */
+			 <RZG2L_PORT_PINMUX(40, 1, 1)>, /* RxD */
+			 <RZG2L_PORT_PINMUX(41, 0, 1)>, /* CTS# */
+			 <RZG2L_PORT_PINMUX(41, 1, 1)>; /* RTS# */
+	};
+
 	sd1-pwr-en-hog {
 		gpio-hog;
 		gpios = <RZG2L_GPIO(39, 2) GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
index ca5ca7ce6692..1b59ef376296 100644
--- a/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
@@ -34,3 +34,29 @@
 #include "rzg2lc-smarc-som.dtsi"
 #include "rzg2lc-smarc-pinfunction.dtsi"
 #include "rz-smarc-common.dtsi"
+
+/* comment the #define statement to disable SCIF1 (SER0) on PMOD1 (CN7) */
+#define PMOD1_SER0	1
+
+/ {
+	aliases {
+		serial1 = &scif1;
+	};
+};
+
+/*
+ * To enable SCIF1 (SER0) on PMOD1 (CN7), On connector board
+ * SW1 should be at position 2->3 so that SER0_CTS# line is activated
+ * SW2 should be at position 2->3 so that SER0_TX line is activated
+ * SW3 should be at position 2->3 so that SER0_RX line is activated
+ * SW4 should be at position 2->3 so that SER0_RTS# line is activated
+ */
+#if (!SW_SCIF_CAN && PMOD1_SER0)
+&scif1 {
+	pinctrl-0 = <&scif1_pins>;
+	pinctrl-names = "default";
+
+	uart-has-rtscts;
+	status = "okay";
+};
+#endif
-- 
2.17.1

