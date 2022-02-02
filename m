Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 24E714A78C5
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Feb 2022 20:33:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230007AbiBBTdy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Feb 2022 14:33:54 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:39684 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1346913AbiBBTdy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Feb 2022 14:33:54 -0500
X-IronPort-AV: E=Sophos;i="5.88,337,1635174000"; 
   d="scan'208";a="109157436"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 03 Feb 2022 04:33:53 +0900
Received: from localhost.localdomain (unknown [10.226.92.2])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id B11F740F8ACC;
        Thu,  3 Feb 2022 04:33:51 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 4/4] arm64: dts: renesas: rzg2lc-smarc: Enable CANFD channel 1
Date:   Wed,  2 Feb 2022 19:33:39 +0000
Message-Id: <20220202193339.22441-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220202193339.22441-1-biju.das.jz@bp.renesas.com>
References: <20220202193339.22441-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On RZ/G2LC SMARC EVK, CAN0 is not populated.

CAN1 is multiplexed with SCIF1 using SW1[3] or RSPI using SW1[4].

This patch adds support for the CAN1 interface on RZ/G2LC SMARC EVK.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2: No change
---
 .../boot/dts/renesas/r9a07g044c2-smarc.dts    |  6 -----
 .../dts/renesas/rzg2lc-smarc-pinfunction.dtsi | 23 +++++++++++++++++++
 arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi | 13 +++++++++++
 3 files changed, 36 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts b/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts
index 50abdabc374a..5a5cea82a5d9 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts
@@ -14,12 +14,6 @@
 	compatible = "renesas,smarc-evk", "renesas,r9a07g044c2", "renesas,r9a07g044";
 };
 
-&canfd {
-	/delete-property/ pinctrl-0;
-	/delete-property/ pinctrl-names;
-	status = "disabled";
-};
-
 &ehci0 {
 	/delete-property/ pinctrl-0;
 	/delete-property/ pinctrl-names;
diff --git a/arch/arm64/boot/dts/renesas/rzg2lc-smarc-pinfunction.dtsi b/arch/arm64/boot/dts/renesas/rzg2lc-smarc-pinfunction.dtsi
index ec9e08ec0822..bff56d696936 100644
--- a/arch/arm64/boot/dts/renesas/rzg2lc-smarc-pinfunction.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2lc-smarc-pinfunction.dtsi
@@ -17,6 +17,14 @@
 			 <RZG2L_PORT_PINMUX(38, 1, 1)>;	/* RxD */
 	};
 
+#if SW_SCIF_CAN
+	/* SW8 should be at position 2->1 */
+	can1_pins: can1 {
+		pinmux = <RZG2L_PORT_PINMUX(40, 0, 3)>, /* TxD */
+			 <RZG2L_PORT_PINMUX(40, 1, 3)>; /* RxD */
+	};
+#endif
+
 	scif1_pins: scif1 {
 		pinmux = <RZG2L_PORT_PINMUX(40, 0, 1)>, /* TxD */
 			 <RZG2L_PORT_PINMUX(40, 1, 1)>, /* RxD */
@@ -24,6 +32,21 @@
 			 <RZG2L_PORT_PINMUX(41, 1, 1)>; /* RTS# */
 	};
 
+#if SW_RSPI_CAN
+	/* SW8 should be at position 2->3 so that GPIO9_CAN1_STB line is activated */
+	can1-stb {
+		gpio-hog;
+		gpios = <RZG2L_GPIO(44, 3) GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "can1_stb";
+	};
+
+	can1_pins: can1 {
+		pinmux = <RZG2L_PORT_PINMUX(44, 0, 3)>, /* TxD */
+			 <RZG2L_PORT_PINMUX(44, 1, 3)>; /* RxD */
+	};
+#endif
+
 	sd1-pwr-en-hog {
 		gpio-hog;
 		gpios = <RZG2L_GPIO(39, 2) GPIO_ACTIVE_HIGH>;
diff --git a/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
index 1b59ef376296..28f21c287ba3 100644
--- a/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
@@ -44,6 +44,19 @@
 	};
 };
 
+#if (SW_SCIF_CAN || SW_RSPI_CAN)
+&canfd {
+	pinctrl-0 = <&can1_pins>;
+	/delete-node/ channel@0;
+};
+#else
+&canfd {
+	/delete-property/ pinctrl-0;
+	/delete-property/ pinctrl-names;
+	status = "disabled";
+};
+#endif
+
 /*
  * To enable SCIF1 (SER0) on PMOD1 (CN7), On connector board
  * SW1 should be at position 2->3 so that SER0_CTS# line is activated
-- 
2.17.1

