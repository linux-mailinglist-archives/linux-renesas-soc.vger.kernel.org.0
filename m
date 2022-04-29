Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E8BFB51433E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 29 Apr 2022 09:24:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355147AbiD2H1h (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 29 Apr 2022 03:27:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355119AbiD2H1f (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Apr 2022 03:27:35 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C29F1C0D1B;
        Fri, 29 Apr 2022 00:24:17 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.91,297,1647270000"; 
   d="scan'208";a="118389359"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 29 Apr 2022 16:24:17 +0900
Received: from localhost.localdomain (unknown [10.226.92.196])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id EFBBD40065C2;
        Fri, 29 Apr 2022 16:24:13 +0900 (JST)
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
Subject: [PATCH v3 3/3] arm64: dts: renesas: rzg2ul-smarc: Enable USB2.0 support
Date:   Fri, 29 Apr 2022 08:24:00 +0100
Message-Id: <20220429072400.23729-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220429072400.23729-1-biju.das.jz@bp.renesas.com>
References: <20220429072400.23729-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable USB2.0 Host/Device support on RZ/G2UL SMARC EVK by
adding usb{0,1} pincontrol entries to the soc-pinctrl dtsi
and deleting the nodes which disabled it.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
V2->v3:
 * Fixed typo in commit description RZ/G2L->RZ/G2UL.
v1->v2:
 * Fixed the code comment related to USB1 OVC and VBUS.
---
 .../boot/dts/renesas/r9a07g043u11-smarc.dts   | 46 -------------------
 .../dts/renesas/rzg2ul-smarc-pinfunction.dtsi | 11 +++++
 2 files changed, 11 insertions(+), 46 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts b/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts
index 52ee1640c3c1..2d740bd420ca 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts
@@ -14,54 +14,8 @@ / {
 	compatible = "renesas,smarc-evk", "renesas,r9a07g043u11", "renesas,r9a07g043";
 };
 
-&ehci0 {
-	/delete-property/ pinctrl-0;
-	/delete-property/ pinctrl-names;
-	status = "disabled";
-};
-
-&ehci1 {
-	/delete-property/ pinctrl-0;
-	/delete-property/ pinctrl-names;
-	status = "disabled";
-};
-
-&hsusb {
-	/delete-property/ pinctrl-0;
-	/delete-property/ pinctrl-names;
-	status = "disabled";
-};
-
-&ohci0 {
-	/delete-property/ pinctrl-0;
-	/delete-property/ pinctrl-names;
-	status = "disabled";
-};
-
-&ohci1 {
-	/delete-property/ pinctrl-0;
-	/delete-property/ pinctrl-names;
-	status = "disabled";
-};
-
-&phyrst {
-	status = "disabled";
-};
-
 &spi1 {
 	/delete-property/ pinctrl-0;
 	/delete-property/ pinctrl-names;
 	status = "disabled";
 };
-
-&usb2_phy0 {
-	/delete-property/ pinctrl-0;
-	/delete-property/ pinctrl-names;
-	status = "disabled";
-};
-
-&usb2_phy1 {
-	/delete-property/ pinctrl-0;
-	/delete-property/ pinctrl-names;
-	status = "disabled";
-};
diff --git a/arch/arm64/boot/dts/renesas/rzg2ul-smarc-pinfunction.dtsi b/arch/arm64/boot/dts/renesas/rzg2ul-smarc-pinfunction.dtsi
index 201b70150e01..bd8bc858c28c 100644
--- a/arch/arm64/boot/dts/renesas/rzg2ul-smarc-pinfunction.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2ul-smarc-pinfunction.dtsi
@@ -105,4 +105,15 @@ ssi1_pins: ssi1 {
 			 <RZG2L_PORT_PINMUX(3, 2, 2)>, /* TXD */
 			 <RZG2L_PORT_PINMUX(3, 3, 2)>; /* RXD */
 	};
+
+	usb0_pins: usb0 {
+		pinmux = <RZG2L_PORT_PINMUX(5, 0, 1)>, /* VBUS */
+			 <RZG2L_PORT_PINMUX(5, 2, 1)>, /* OVC */
+			 <RZG2L_PORT_PINMUX(5, 3, 1)>; /* OTG_ID */
+	};
+
+	usb1_pins: usb1 {
+		pinmux = <RZG2L_PORT_PINMUX(5, 4, 5)>, /* OVC */
+			 <RZG2L_PORT_PINMUX(6, 0, 1)>; /* VBUS */
+	};
 };
-- 
2.25.1

