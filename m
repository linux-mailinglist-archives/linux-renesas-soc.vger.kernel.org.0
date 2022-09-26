Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A7CCE5EA92E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Sep 2022 16:54:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234080AbiIZOyy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 26 Sep 2022 10:54:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235254AbiIZOyd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Sep 2022 10:54:33 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4022173336;
        Mon, 26 Sep 2022 06:21:50 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.93,346,1654527600"; 
   d="scan'208";a="136203517"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 26 Sep 2022 22:21:49 +0900
Received: from localhost.localdomain (unknown [10.226.92.133])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id A48764005B43;
        Mon, 26 Sep 2022 22:21:46 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH RFC 8/8] arm64: dts: renesas: rzg2l-smarc: [HACK] Enable MTU for 16-bit phase count testing
Date:   Mon, 26 Sep 2022 14:21:14 +0100
Message-Id: <20220926132114.60396-9-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220926132114.60396-1-biju.das.jz@bp.renesas.com>
References: <20220926132114.60396-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable MTU{1,2} for 16-bit phase count testing.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../boot/dts/renesas/r9a07g044l2-smarc.dts    |  2 --
 .../dts/renesas/rzg2l-smarc-pinfunction.dtsi  | 11 ++++++++
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi  | 25 ++++++++++++++++++-
 3 files changed, 35 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dts b/arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dts
index bc2af6c92ccd..247b0b3f1b58 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dts
@@ -8,8 +8,6 @@
 /dts-v1/;
 #include "r9a07g044l2.dtsi"
 #include "rzg2l-smarc-som.dtsi"
-#include "rzg2l-smarc-pinfunction.dtsi"
-#include "rz-smarc-common.dtsi"
 #include "rzg2l-smarc.dtsi"
 
 / {
diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc-pinfunction.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc-pinfunction.dtsi
index 9085d8c76ce1..8c25c9f31ec0 100644
--- a/arch/arm64/boot/dts/renesas/rzg2l-smarc-pinfunction.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc-pinfunction.dtsi
@@ -53,17 +53,28 @@ i2c3_pins: i2c3 {
 			 <RZG2L_PORT_PINMUX(18, 1, 3)>; /* SCL */
 	};
 
+#if (MTU3_PHASE_COUNTING_SUPPORT)
+	mtu3_pins: mtu3 {
+		mtu3_clk {
+			pinmux = <RZG2L_PORT_PINMUX(48, 0, 4)>, /* MTCLKA */
+				 <RZG2L_PORT_PINMUX(48, 1, 4)>; /* MTLCKB */
+		};
+	};
+#endif
+
 	scif0_pins: scif0 {
 		pinmux = <RZG2L_PORT_PINMUX(38, 0, 1)>,	/* TxD */
 			 <RZG2L_PORT_PINMUX(38, 1, 1)>;	/* RxD */
 	};
 
+#if (!MTU3_PHASE_COUNTING_SUPPORT)
 	scif2_pins: scif2 {
 		pinmux = <RZG2L_PORT_PINMUX(48, 0, 1)>, /* TxD */
 			 <RZG2L_PORT_PINMUX(48, 1, 1)>, /* RxD */
 			 <RZG2L_PORT_PINMUX(48, 3, 1)>, /* CTS# */
 			 <RZG2L_PORT_PINMUX(48, 4, 1)>; /* RTS# */
 	};
+#endif
 
 	sd1-pwr-en-hog {
 		gpio-hog;
diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
index e180a955b6ac..79b3088d2eda 100644
--- a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
@@ -9,7 +9,14 @@
 #include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
 
 /* comment the #define statement to disable SCIF2 (SER0) on PMOD1 (CN7) */
-#define PMOD1_SER0	1
+#define PMOD1_SER0	0
+
+#if (!PMOD1_SER0)
+#define MTU3_PHASE_COUNTING_SUPPORT	1
+#endif
+
+#include "rzg2l-smarc-pinfunction.dtsi"
+#include "rz-smarc-common.dtsi"
 
 / {
 	aliases {
@@ -36,6 +43,22 @@ wm8978: codec@1a {
 	};
 };
 
+#if (MTU3_PHASE_COUNTING_SUPPORT)
+&mtu3 {
+	pinctrl-0 = <&mtu3_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+	counter@1 {
+		status = "okay";
+	};
+
+	counter@2 {
+		status = "okay";
+	};
+};
+#endif
+
 /*
  * To enable SCIF2 (SER0) on PMOD1 (CN7)
  * SW1 should be at position 2->3 so that SER0_CTS# line is activated
-- 
2.25.1

