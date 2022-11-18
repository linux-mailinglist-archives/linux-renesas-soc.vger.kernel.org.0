Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 840A362F5C8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 18 Nov 2022 14:17:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242085AbiKRNRM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 18 Nov 2022 08:17:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42174 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242072AbiKRNRL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Nov 2022 08:17:11 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BE0498B13C;
        Fri, 18 Nov 2022 05:17:05 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.96,174,1665414000"; 
   d="scan'208";a="143137469"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 18 Nov 2022 22:17:05 +0900
Received: from localhost.localdomain (unknown [10.226.92.26])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id B025243651BA;
        Fri, 18 Nov 2022 22:17:02 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: [PATCH 5/5] arm64: dts: renesas: rzv2m evk: Enable pwm
Date:   Fri, 18 Nov 2022 13:16:41 +0000
Message-Id: <20221118131641.469238-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221118131641.469238-1-biju.das.jz@bp.renesas.com>
References: <20221118131641.469238-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable pwm{8..14} on RZ/V2M EVK.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../boot/dts/renesas/r9a09g011-v2mevk2.dts    | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts b/arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts
index 11e1d51c7c0e..73d7481b468e 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts
@@ -78,6 +78,76 @@ i2c2_pins: i2c2 {
 		pinmux = <RZV2M_PORT_PINMUX(3, 8, 2)>, /* SDA */
 			 <RZV2M_PORT_PINMUX(3, 9, 2)>; /* SCL */
 	};
+
+	pwm8_pins: pwm8 {
+		pinmux = <RZV2M_PORT_PINMUX(1, 8, 1)>;  /* PM8 */
+	};
+
+	pwm9_pins: pwm9 {
+		pinmux = <RZV2M_PORT_PINMUX(1, 9, 1)>;  /* PM9 */
+	};
+
+	pwm10_pins: pwm10 {
+		pinmux = <RZV2M_PORT_PINMUX(1, 10, 1)>; /* PM10 */
+	};
+
+	pwm11_pins: pwm11 {
+		pinmux = <RZV2M_PORT_PINMUX(1, 11, 1)>; /* PM11 */
+	};
+
+	pwm12_pins: pwm12 {
+		pinmux = <RZV2M_PORT_PINMUX(1, 12, 1)>; /* PM12 */
+	};
+
+	pwm13_pins: pwm13 {
+		pinmux = <RZV2M_PORT_PINMUX(1, 13, 1)>; /* PM13 */
+	};
+
+	pwm14_pins: pwm14 {
+		pinmux = <RZV2M_PORT_PINMUX(1, 14, 1)>; /* PM14 */
+	};
+};
+
+&pwm8 {
+	pinctrl-0 = <&pwm8_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&pwm9 {
+	pinctrl-0 = <&pwm9_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&pwm10 {
+	pinctrl-0 = <&pwm10_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&pwm11 {
+	pinctrl-0 = <&pwm11_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&pwm12 {
+	pinctrl-0 = <&pwm12_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&pwm13 {
+	pinctrl-0 = <&pwm13_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&pwm14 {
+	pinctrl-0 = <&pwm14_pins>;
+	pinctrl-names = "default";
+	status = "okay";
 };
 
 &uart0 {
-- 
2.25.1

