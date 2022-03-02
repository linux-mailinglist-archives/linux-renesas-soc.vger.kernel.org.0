Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 709774CA241
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Mar 2022 11:33:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241013AbiCBKd5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Mar 2022 05:33:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241016AbiCBKd4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Mar 2022 05:33:56 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 41D86BE1F9;
        Wed,  2 Mar 2022 02:33:13 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.90,148,1643641200"; 
   d="scan'208";a="112918830"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 02 Mar 2022 19:33:13 +0900
Received: from localhost.localdomain (unknown [10.226.93.124])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 1328C4235F96;
        Wed,  2 Mar 2022 19:33:10 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 3/4] arm64: dts: renesas: rzg2lc-smarc: Enable i2c{0,1,2}
Date:   Wed,  2 Mar 2022 10:33:00 +0000
Message-Id: <20220302103301.23852-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220302103301.23852-1-biju.das.jz@bp.renesas.com>
References: <20220302103301.23852-1-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable i2c{0,1} on RZ/G2LC SMARC EVK by deleting respective
entries from board dts and adding pincontrol entries to the
soc-pinctrl dtsi. Also enable i2c2 by adding to soc dtsi.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts | 12 ------------
 .../dts/renesas/rzg2lc-smarc-pinfunction.dtsi     | 15 +++++++++++++++
 arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi     |  6 +++++-
 3 files changed, 20 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts b/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts
index dc39b05e9256..52b834205126 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts
@@ -14,18 +14,6 @@
 	compatible = "renesas,smarc-evk", "renesas,r9a07g044c2", "renesas,r9a07g044";
 };
 
-&i2c0 {
-	/delete-property/ pinctrl-0;
-	/delete-property/ pinctrl-names;
-	status = "disabled";
-};
-
-&i2c1 {
-	/delete-property/ pinctrl-0;
-	/delete-property/ pinctrl-names;
-	status = "disabled";
-};
-
 &spi1 {
 	/delete-property/ pinctrl-0;
 	/delete-property/ pinctrl-names;
diff --git a/arch/arm64/boot/dts/renesas/rzg2lc-smarc-pinfunction.dtsi b/arch/arm64/boot/dts/renesas/rzg2lc-smarc-pinfunction.dtsi
index 53759c3ddecb..1322e5bcd456 100644
--- a/arch/arm64/boot/dts/renesas/rzg2lc-smarc-pinfunction.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2lc-smarc-pinfunction.dtsi
@@ -35,6 +35,21 @@
 	};
 #endif
 
+	i2c0_pins: i2c0 {
+		pins = "RIIC0_SDA", "RIIC0_SCL";
+		input-enable;
+	};
+
+	i2c1_pins: i2c1 {
+		pins = "RIIC1_SDA", "RIIC1_SCL";
+		input-enable;
+	};
+
+	i2c2_pins: i2c2 {
+		pinmux = <RZG2L_PORT_PINMUX(42, 3, 1)>, /* SDA */
+			 <RZG2L_PORT_PINMUX(42, 4, 1)>; /* SCL */
+	};
+
 	scif0_pins: scif0 {
 		pinmux = <RZG2L_PORT_PINMUX(38, 0, 1)>,	/* TxD */
 			 <RZG2L_PORT_PINMUX(38, 1, 1)>;	/* RxD */
diff --git a/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
index 55d3b73f84e7..f73b4acb8f9e 100644
--- a/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
@@ -61,7 +61,11 @@
 #endif
 
 &i2c2 {
-	status = "disabled";
+	pinctrl-0 = <&i2c2_pins>;
+	pinctrl-names = "default";
+	clock-frequency = <400000>;
+
+	status = "okay";
 
 	wm8978: codec@1a {
 		compatible = "wlf,wm8978";
-- 
2.17.1

