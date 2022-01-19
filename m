Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97CE64937BF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Jan 2022 10:52:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353077AbiASJw4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Jan 2022 04:52:56 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:12917 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1353109AbiASJw4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Jan 2022 04:52:56 -0500
X-IronPort-AV: E=Sophos;i="5.88,299,1635174000"; 
   d="scan'208";a="106965460"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 19 Jan 2022 18:52:55 +0900
Received: from localhost.localdomain (unknown [10.226.92.24])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 119AC411517B;
        Wed, 19 Jan 2022 18:52:52 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 3/4] arm64: dts: renesas: rzg2lc-smarc: Enable SCIF1 on carrier board
Date:   Wed, 19 Jan 2022 09:52:44 +0000
Message-Id: <20220119095245.5611-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220119095245.5611-1-biju.das.jz@bp.renesas.com>
References: <20220119095245.5611-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

SCIF1 interface is available on PMOD1 connector (CN7) on carrier board.

This patch adds pinmux and scif1 node to carrier board dtsi file for
RZ/G2LC SMARC EVK.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
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
index a998b4dbf35c..9add19eb5511 100644
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

