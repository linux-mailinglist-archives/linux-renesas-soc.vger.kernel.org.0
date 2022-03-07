Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F4144D07A6
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  7 Mar 2022 20:24:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238784AbiCGTZr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 7 Mar 2022 14:25:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232064AbiCGTZq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Mar 2022 14:25:46 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 011C94BB84;
        Mon,  7 Mar 2022 11:24:50 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.90,163,1643641200"; 
   d="scan'208";a="112774393"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 08 Mar 2022 04:24:50 +0900
Received: from localhost.localdomain (unknown [10.226.92.211])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 77EA740DBAF2;
        Tue,  8 Mar 2022 04:24:48 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 4/4] arm64: dts: renesas: rzg2lc-smarc: Enable RSPI1 on carrier board
Date:   Mon,  7 Mar 2022 19:24:36 +0000
Message-Id: <20220307192436.13237-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220307192436.13237-1-biju.das.jz@bp.renesas.com>
References: <20220307192436.13237-1-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

RSPI1 (SPI1) interface is available on PMOD0 connector (J1) on the
carrier board.  This patch adds pinmux and spi1 nodes to the carrier
board dtsi file and drops deleting pinctl* properties from DTS file.

RSPI1 interface is tested by setting the macro SW_RSPI_CAN to 0.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts         | 6 ------
 arch/arm64/boot/dts/renesas/rzg2lc-smarc-pinfunction.dtsi | 7 +++++++
 arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi             | 8 ++++++++
 3 files changed, 15 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts b/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts
index 74a2f2bade10..fc34058002e2 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a07g044c2-smarc.dts
@@ -13,9 +13,3 @@
 	model = "Renesas SMARC EVK based on r9a07g044c2";
 	compatible = "renesas,smarc-evk", "renesas,r9a07g044c2", "renesas,r9a07g044";
 };
-
-&spi1 {
-	/delete-property/ pinctrl-0;
-	/delete-property/ pinctrl-names;
-	status = "disabled";
-};
diff --git a/arch/arm64/boot/dts/renesas/rzg2lc-smarc-pinfunction.dtsi b/arch/arm64/boot/dts/renesas/rzg2lc-smarc-pinfunction.dtsi
index d275a55333e3..a78a8def363e 100644
--- a/arch/arm64/boot/dts/renesas/rzg2lc-smarc-pinfunction.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2lc-smarc-pinfunction.dtsi
@@ -106,6 +106,13 @@
 		input-enable;
 	};
 
+	spi1_pins: spi1 {
+		pinmux = <RZG2L_PORT_PINMUX(44, 0, 1)>, /* CK */
+			 <RZG2L_PORT_PINMUX(44, 1, 1)>, /* MOSI */
+			 <RZG2L_PORT_PINMUX(44, 2, 1)>, /* MISO */
+			 <RZG2L_PORT_PINMUX(44, 3, 1)>; /* SSL */
+	};
+
 	ssi0_pins: ssi0 {
 		pinmux = <RZG2L_PORT_PINMUX(45, 0, 1)>, /* BCK */
 			 <RZG2L_PORT_PINMUX(45, 1, 1)>, /* RCK */
diff --git a/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
index f73b4acb8f9e..292513635baf 100644
--- a/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
@@ -74,6 +74,14 @@
 	};
 };
 
+#if (!SW_RSPI_CAN)
+&spi1 {
+	pinctrl-0 = <&spi1_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+#endif
+
 /*
  * To enable SCIF1 (SER0) on PMOD1 (CN7), On connector board
  * SW1 should be at position 2->3 so that SER0_CTS# line is activated
-- 
2.17.1

