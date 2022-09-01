Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA7B85A9D10
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Sep 2022 18:29:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235026AbiIAQ3a (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 1 Sep 2022 12:29:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231455AbiIAQ33 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Sep 2022 12:29:29 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 912577B7BA;
        Thu,  1 Sep 2022 09:29:26 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.93,281,1654527600"; 
   d="scan'208";a="131364655"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 02 Sep 2022 01:29:25 +0900
Received: from localhost.localdomain (unknown [10.226.92.28])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 20A4A400A8B9;
        Fri,  2 Sep 2022 01:29:22 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH v4] ARM: dts: r9a06g032-rzn1d400-db: Enable CAN2
Date:   Thu,  1 Sep 2022 17:29:19 +0100
Message-Id: <20220901162919.47090-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable CAN2 on RZ/N1-EB board by default.
Also add a macro to enable CAN1, if the board
support it.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Updated commit descriptiom
 * Enabled CAN2 by default
 * Added a macro BOARD_HAS_CAN1_ENABLED to configure CAN1,
   if the board supports it.
v2->v3:
 * No change
v1->v2:
 * No change
---
 arch/arm/boot/dts/r9a06g032-rzn1d400-db.dts | 28 +++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm/boot/dts/r9a06g032-rzn1d400-db.dts b/arch/arm/boot/dts/r9a06g032-rzn1d400-db.dts
index 4bf813335e21..c073ca360866 100644
--- a/arch/arm/boot/dts/r9a06g032-rzn1d400-db.dts
+++ b/arch/arm/boot/dts/r9a06g032-rzn1d400-db.dts
@@ -26,6 +26,22 @@ aliases {
 	};
 };
 
+#if BOARD_HAS_CAN1_ENABLED /* CN10 on RZ/N1-EB board */
+&can0 {
+	pinctrl-0 = <&pins_can0>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+#endif
+
+&can1 {
+	pinctrl-0 = <&pins_can1>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
 &eth_miic {
 	status = "okay";
 	renesas,miic-switch-portin = <MIIC_GMAC2_PORT>;
@@ -52,6 +68,18 @@ &mii_conv5 {
 };
 
 &pinctrl{
+	pins_can0: pins_can0 {
+		pinmux = <RZN1_PINMUX(162, RZN1_FUNC_CAN)>,	/* CAN0_TXD */
+			 <RZN1_PINMUX(163, RZN1_FUNC_CAN)>;	/* CAN0_RXD */
+		drive-strength = <6>;
+	};
+
+	pins_can1: pins_can1 {
+		pinmux = <RZN1_PINMUX(109, RZN1_FUNC_CAN)>,	/* CAN1_TXD */
+			 <RZN1_PINMUX(110, RZN1_FUNC_CAN)>;	/* CAN1_RXD */
+		drive-strength = <6>;
+	};
+
 	pins_eth3: pins_eth3 {
 		pinmux = <RZN1_PINMUX(36, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
 			 <RZN1_PINMUX(37, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
-- 
2.25.1

