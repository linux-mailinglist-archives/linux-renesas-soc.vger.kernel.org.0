Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56913543A6D
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jun 2022 19:30:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229515AbiFHRan (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Jun 2022 13:30:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231254AbiFHRal (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Jun 2022 13:30:41 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id ED6841AD;
        Wed,  8 Jun 2022 10:30:37 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.91,286,1647270000"; 
   d="scan'208";a="123763348"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 09 Jun 2022 02:30:37 +0900
Received: from localhost.localdomain (unknown [10.226.92.52])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id D1D6E40CE9B7;
        Thu,  9 Jun 2022 02:30:33 +0900 (JST)
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
Subject: [PATCH 1/2] arm64: dts: renesas: rzg2ul-smarc: Enable RSPI1 on carrier board
Date:   Wed,  8 Jun 2022 18:30:24 +0100
Message-Id: <20220608173025.22792-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220608173025.22792-1-biju.das.jz@bp.renesas.com>
References: <20220608173025.22792-1-biju.das.jz@bp.renesas.com>
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

RSPI1 (SPI1) interface is available on PMOD0 connector (J1) on the
carrier board.  This patch adds pinmux and spi1 nodes to the carrier
board dtsi file and drops deleting pinctl* properties from board
DTS file.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts | 6 ------
 arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi  | 7 +++++++
 arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi      | 6 ++++++
 3 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts b/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts
index 2d740bd420ca..121e55282d18 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc.dts
@@ -13,9 +13,3 @@ / {
 	model = "Renesas SMARC EVK based on r9a07g043u11";
 	compatible = "renesas,smarc-evk", "renesas,r9a07g043u11", "renesas,r9a07g043";
 };
-
-&spi1 {
-	/delete-property/ pinctrl-0;
-	/delete-property/ pinctrl-names;
-	status = "disabled";
-};
diff --git a/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
index 429bdde579c3..8fdc956cd6c7 100644
--- a/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi
@@ -209,6 +209,13 @@ sd0_mux_uhs {
 			pinmux = <RZG2L_PORT_PINMUX(0, 0, 1)>; /* SD0_CD */
 		};
 	};
+
+	spi1_pins: rspi1 {
+		pinmux = <RZG2L_PORT_PINMUX(4, 0, 2)>, /* CK */
+			 <RZG2L_PORT_PINMUX(4, 1, 2)>, /* MOSI */
+			 <RZG2L_PORT_PINMUX(4, 2, 2)>, /* MISO */
+			 <RZG2L_PORT_PINMUX(4, 3, 2)>; /* SSL */
+	};
 };
 
 #if (SW_SW0_DEV_SEL)
diff --git a/arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi
index 0051634d7b1c..f9835c12023e 100644
--- a/arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi
@@ -51,6 +51,12 @@ &snd_rzg2l {
 	status = "disabled";
 };
 
+&spi1 {
+	/delete-property/ pinctrl-0;
+	/delete-property/ pinctrl-names;
+	status = "disabled";
+};
+
 &ssi1 {
 	/delete-property/ pinctrl-0;
 	/delete-property/ pinctrl-names;
-- 
2.25.1

