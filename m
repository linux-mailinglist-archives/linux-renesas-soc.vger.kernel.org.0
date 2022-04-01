Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E59B04EF753
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Apr 2022 18:03:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345107AbiDAP4W (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 1 Apr 2022 11:56:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348692AbiDAPPL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Apr 2022 11:15:11 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C0D892B658A;
        Fri,  1 Apr 2022 07:57:08 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,227,1643641200"; 
   d="scan'208";a="116451900"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 01 Apr 2022 23:57:08 +0900
Received: from localhost.localdomain (unknown [10.226.92.166])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0BC68400F95D;
        Fri,  1 Apr 2022 23:57:05 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3] arm64: dts: renesas: rzg2lc-smarc: Enable RSPI1 on carrier board
Date:   Fri,  1 Apr 2022 15:57:02 +0100
Message-Id: <20220401145702.17954-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
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
v2->v3:
 * Removed redundant spi1 node, as it is already enabled in common.
v1->v2:
 * Sorted the node alphabetically
 * Delete/disable pinctrl/spi node, when SW_RSPI_CAN macro is set to 1.
   This change is done in common file, so that both single core and 
   dual core RZ/G2LC SMARC EVK can reuse the same.
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
index 74ad1ede3d0b..9ec8c503b0a3 100644
--- a/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi
@@ -158,3 +158,11 @@
 	status = "okay";
 };
 #endif
+
+#if (SW_RSPI_CAN)
+&spi1 {
+	/delete-property/ pinctrl-0;
+	/delete-property/ pinctrl-names;
+	status = "disabled";
+};
+#endif
-- 
2.17.1

