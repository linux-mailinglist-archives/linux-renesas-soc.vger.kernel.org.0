Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21A444937C2
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jan 2022 10:53:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353082AbiASJw6 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Jan 2022 04:52:58 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:12917 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1353108AbiASJw6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jan 2022 04:52:58 -0500
X-IronPort-AV: E=Sophos;i="5.88,299,1635174000"; 
   d="scan'208";a="106965467"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 19 Jan 2022 18:52:57 +0900
Received: from localhost.localdomain (unknown [10.226.92.24])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 6947F410DE64;
        Wed, 19 Jan 2022 18:52:55 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 4/4] arm64: dts: renesas: rzg2lc-smarc: Enable CANFD channel 1
Date:   Wed, 19 Jan 2022 09:52:45 +0000
Message-Id: <20220119095245.5611-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220119095245.5611-1-biju.das.jz@bp.renesas.com>
References: <20220119095245.5611-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On RZ/G2LC SMARC EVK, CAN0 is not populated.

CAN1 is multiplexed with SCIF1 using SW1[3] or RSPI using SW1[4].

This patch adds support for the CAN1 interface on RZ/G2LC SMARC EVK.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../boot/dts/renesas/r9a07g044c2-smarc.dts    |  5 ----
 .../dts/renesas/rzg2lc-smarc-pinfunction.dtsi | 23 +++++++++++++++++++
 arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi | 13 +++++++++++
 3 files changed, 36 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts b/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts
index f68491c56fff..0c83f4b6e497 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts
@@ -14,11 +14,6 @@
 	compatible = "renesas,smarc-evk", "renesas,r9a07g044c2", "renesas,r9a07g044";
 };
 
-&canfd {
-	/delete-property/ pinctrl-0;
-	status = "disabled";
-};
-
 &ehci0 {
 	/delete-property/ pinctrl-0;
 	status = "disabled";
diff --git a/arch/arm64/boot/dts/renesas/rzg2lc-smarc-pinfunction.dtsi b/arch/arm64/boot/dts/renesas/rzg2lc-smarc-pinfunction.dtsi
index ec9e08ec0822..4580e71b0aad 100644
--- a/arch/arm64/boot/dts/renesas/rzg2lc-smarc-pinfunction.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2lc-smarc-pinfunction.dtsi
@@ -17,12 +17,35 @@
 			 <RZG2L_PORT_PINMUX(38, 1, 1)>;	/* RxD */
 	};
 
+#if SW_SCIF_CAN
+	/* SW8 should be at position 2->1 */
+	can1_pins: can1 {
+		pinmux = <RZG2L_PORT_PINMUX(40, 0, 3)>, /* TxD */
+			 <RZG2L_PORT_PINMUX(40, 1, 3)>; /* RxD */
+	};
+#else
 	scif1_pins: scif1 {
 		pinmux = <RZG2L_PORT_PINMUX(40, 0, 1)>, /* TxD */
 			 <RZG2L_PORT_PINMUX(40, 1, 1)>, /* RxD */
 			 <RZG2L_PORT_PINMUX(41, 0, 1)>, /* CTS# */
 			 <RZG2L_PORT_PINMUX(41, 1, 1)>; /* RTS# */
 	};
+#endif
+
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
 
 	sd1-pwr-en-hog {
 		gpio-hog;
diff --git a/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
index 9add19eb5511..af0e014f95dc 100644
--- a/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
@@ -44,6 +44,19 @@
 	};
 };
 
+#if (SW_SCIF_CAN || SW_RSPI_CAN)
+&canfd {
+	pinctrl-0 = <&can1_pins>;
+
+	/delete-node/ channel@0;
+};
+#else
+&canfd {
+	/delete-property/ pinctrl-0;
+	status = "disabled";
+};
+#endif
+
 /*
  * To enable SCIF1 (SER0) on PMOD1 (CN7), On connector board
  * SW1 should be at position 2->3 so that SER0_CTS# line is activated
-- 
2.17.1

