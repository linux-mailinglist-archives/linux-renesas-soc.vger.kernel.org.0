Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 881F1720456
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Jun 2023 16:25:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234678AbjFBOZA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Jun 2023 10:25:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235813AbjFBOYz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Jun 2023 10:24:55 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6CB2519B;
        Fri,  2 Jun 2023 07:24:53 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.00,213,1681138800"; 
   d="scan'208";a="165498994"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 02 Jun 2023 23:24:52 +0900
Received: from localhost.localdomain (unknown [10.226.93.55])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 20C1C40065BD;
        Fri,  2 Jun 2023 23:24:49 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: [PATCH v6 04/11] arm64: dts: renesas: rzg2l-smarc-som: Enable PMIC and built-in RTC
Date:   Fri,  2 Jun 2023 15:24:19 +0100
Message-Id: <20230602142426.438375-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230602142426.438375-1-biju.das.jz@bp.renesas.com>
References: <20230602142426.438375-1-biju.das.jz@bp.renesas.com>
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

Enable PMIC RAA215300 and the built-in RTC on the RZ/{G2L,V2L} SMARC
EVK.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v5->v6:
 * Replaced "clock-xtal"->"x2-clock" for x2 node.
 * Sorted nodes in alphabetical order.
v4->v5:
 * No change.
v3->v4:
 * Added clock nodes.
v2->v3:
 * No change.
RFC->V2:
 * Updated pmic device node based on the bindings.
---
 .../boot/dts/renesas/rzg2l-smarc-som.dtsi      | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
index fbbb4f03440b..aed0a9ca7f29 100644
--- a/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
@@ -73,6 +73,13 @@ vccq_sdhi0: regulator-vccq-sdhi0 {
 		gpios = <&pinctrl RZG2L_GPIO(39, 0) GPIO_ACTIVE_HIGH>;
 		regulator-always-on;
 	};
+
+	/* 32.768kHz crystal */
+	x2: x2-clock {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+	};
 };
 
 &adc {
@@ -148,6 +155,17 @@ &gpu {
 	mali-supply = <&reg_1p1v>;
 };
 
+&i2c3 {
+	raa215300: pmic@12 {
+		compatible = "renesas,raa215300";
+		reg = <0x12>, <0x6f>;
+		reg-names = "main", "rtc";
+
+		clocks = <&x2>;
+		clock-names = "xin";
+	};
+};
+
 &ostm1 {
 	status = "okay";
 };
-- 
2.25.1

