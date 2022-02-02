Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DED144A78C3
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Feb 2022 20:33:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346910AbiBBTdw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Feb 2022 14:33:52 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:39684 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230007AbiBBTdv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Feb 2022 14:33:51 -0500
X-IronPort-AV: E=Sophos;i="5.88,337,1635174000"; 
   d="scan'208";a="109157431"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 03 Feb 2022 04:33:51 +0900
Received: from localhost.localdomain (unknown [10.226.92.2])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 4A5A540F8ACC;
        Thu,  3 Feb 2022 04:33:49 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 3/4] arm64: dts: renesas: rzg2lc-smarc: Enable SCIF1 on carrier board
Date:   Wed,  2 Feb 2022 19:33:38 +0000
Message-Id: <20220202193339.22441-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220202193339.22441-1-biju.das.jz@bp.renesas.com>
References: <20220202193339.22441-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SCIF1 interface is available on PMOD1 connector (CN7) on carrier board.

This patch adds pinmux and scif1 node to carrier board dtsi file for
RZ/G2LC SMARC EVK.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
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

