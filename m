Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F1235A68A7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Aug 2022 18:45:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230122AbiH3Qpw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Aug 2022 12:45:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230035AbiH3Qpm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Aug 2022 12:45:42 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 208BC62AAD;
        Tue, 30 Aug 2022 09:45:41 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.93,275,1654527600"; 
   d="scan'208";a="133114605"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 31 Aug 2022 01:45:40 +0900
Received: from localhost.localdomain (unknown [10.226.92.122])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 63CF44038323;
        Wed, 31 Aug 2022 01:45:37 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH v3 3/3] ARM: dts: r9a06g032-rzn1d400-db: Enable CAN{0,1}
Date:   Tue, 30 Aug 2022 17:45:18 +0100
Message-Id: <20220830164518.1381632-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220830164518.1381632-1-biju.das.jz@bp.renesas.com>
References: <20220830164518.1381632-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable CAN{0,1} on RZ/N1D-DB board.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change
v1->v2:
 * No change
---
 arch/arm/boot/dts/r9a06g032-rzn1d400-db.dts | 26 +++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm/boot/dts/r9a06g032-rzn1d400-db.dts b/arch/arm/boot/dts/r9a06g032-rzn1d400-db.dts
index 4bf813335e21..49104c73eca3 100644
--- a/arch/arm/boot/dts/r9a06g032-rzn1d400-db.dts
+++ b/arch/arm/boot/dts/r9a06g032-rzn1d400-db.dts
@@ -26,6 +26,20 @@ aliases {
 	};
 };
 
+&can0 {
+	pinctrl-0 = <&pins_can0>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
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
@@ -52,6 +66,18 @@ &mii_conv5 {
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

