Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D45194CC30D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Mar 2022 17:42:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235104AbiCCQmw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Mar 2022 11:42:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235134AbiCCQmu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Mar 2022 11:42:50 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D4F9219D638;
        Thu,  3 Mar 2022 08:42:04 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.90,151,1643641200"; 
   d="scan'208";a="113065535"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 04 Mar 2022 01:42:04 +0900
Received: from localhost.localdomain (unknown [10.226.93.138])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 367D340178C7;
        Fri,  4 Mar 2022 01:42:02 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH V2 1/4] arm64: dts: renesas: rzg2lc-smarc-pinfunction: Sort the nodes
Date:   Thu,  3 Mar 2022 16:41:52 +0000
Message-Id: <20220303164155.7706-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220303164155.7706-1-biju.das.jz@bp.renesas.com>
References: <20220303164155.7706-1-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Sort the pinctrl nodes alphabetically.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
 * Fixed typo in commit message
---
 .../dts/renesas/rzg2lc-smarc-pinfunction.dtsi | 24 +++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/rzg2lc-smarc-pinfunction.dtsi b/arch/arm64/boot/dts/renesas/rzg2lc-smarc-pinfunction.dtsi
index 5f5ec21e655c..53759c3ddecb 100644
--- a/arch/arm64/boot/dts/renesas/rzg2lc-smarc-pinfunction.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2lc-smarc-pinfunction.dtsi
@@ -12,11 +12,6 @@
 	pinctrl-0 = <&sound_clk_pins>;
 	pinctrl-names = "default";
 
-	scif0_pins: scif0 {
-		pinmux = <RZG2L_PORT_PINMUX(38, 0, 1)>,	/* TxD */
-			 <RZG2L_PORT_PINMUX(38, 1, 1)>;	/* RxD */
-	};
-
 #if SW_SCIF_CAN
 	/* SW8 should be at position 2->1 */
 	can1_pins: can1 {
@@ -25,13 +20,6 @@
 	};
 #endif
 
-	scif1_pins: scif1 {
-		pinmux = <RZG2L_PORT_PINMUX(40, 0, 1)>, /* TxD */
-			 <RZG2L_PORT_PINMUX(40, 1, 1)>, /* RxD */
-			 <RZG2L_PORT_PINMUX(41, 0, 1)>, /* CTS# */
-			 <RZG2L_PORT_PINMUX(41, 1, 1)>; /* RTS# */
-	};
-
 #if SW_RSPI_CAN
 	/* SW8 should be at position 2->3 so that GPIO9_CAN1_STB line is activated */
 	can1-stb-hog {
@@ -47,6 +35,18 @@
 	};
 #endif
 
+	scif0_pins: scif0 {
+		pinmux = <RZG2L_PORT_PINMUX(38, 0, 1)>,	/* TxD */
+			 <RZG2L_PORT_PINMUX(38, 1, 1)>;	/* RxD */
+	};
+
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
-- 
2.17.1

