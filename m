Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7FE7513994
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 28 Apr 2022 18:20:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349897AbiD1QXC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 28 Apr 2022 12:23:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349895AbiD1QXB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 28 Apr 2022 12:23:01 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 744125D1B1;
        Thu, 28 Apr 2022 09:19:46 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.91,295,1647270000"; 
   d="scan'208";a="119526893"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 29 Apr 2022 01:19:45 +0900
Received: from localhost.localdomain (unknown [10.226.92.196])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 850F44010DC0;
        Fri, 29 Apr 2022 01:19:42 +0900 (JST)
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
Subject: [PATCH v2 2/3] arm64: dts: renesas: rzg2ul-smarc: Enable Audio
Date:   Thu, 28 Apr 2022 17:19:31 +0100
Message-Id: <20220428161932.20370-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220428161932.20370-1-biju.das.jz@bp.renesas.com>
References: <20220428161932.20370-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable Audio on RZ/G2LC SMARC EVK by adding ssi1 pincontrol entries
to the soc-pinctrl dtsi and ssi1 and cpu sound_dai nodes to the board
dtsi.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1->v2:
 * started using cpu_dai node instead of snd_rzg2l in board dtsi.
 * Added rb tag from Geert.
---
 .../dts/renesas/rzg2ul-smarc-pinfunction.dtsi |  7 ++++++
 arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi | 23 +++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg2ul-smarc-pinfunction.dtsi b/arch/arm64/boot/dts/renesas/rzg2ul-smarc-pinfunction.dtsi
index 17527184ff2a..201b70150e01 100644
--- a/arch/arm64/boot/dts/renesas/rzg2ul-smarc-pinfunction.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2ul-smarc-pinfunction.dtsi
@@ -98,4 +98,11 @@ sound_clk_pins: sound_clk {
 		pins = "AUDIO_CLK1", "AUDIO_CLK2";
 		input-enable;
 	};
+
+	ssi1_pins: ssi1 {
+		pinmux = <RZG2L_PORT_PINMUX(3, 0, 2)>, /* BCK */
+			 <RZG2L_PORT_PINMUX(3, 1, 2)>, /* RCK */
+			 <RZG2L_PORT_PINMUX(3, 2, 2)>, /* TXD */
+			 <RZG2L_PORT_PINMUX(3, 3, 2)>; /* RXD */
+	};
 };
diff --git a/arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi
index d75ad79ba804..a97c8781d223 100644
--- a/arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi
@@ -25,6 +25,10 @@ &canfd {
 	/delete-property/ pinctrl-names;
 	status = "disabled";
 };
+#else
+&cpu_dai {
+	sound-dai = <&ssi1>;
+};
 #endif
 
 &i2c1 {
@@ -35,6 +39,25 @@ wm8978: codec@1a {
 	};
 };
 
+#if (SW_ET0_EN_N)
+&ssi1 {
+	pinctrl-0 = <&ssi1_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+#else
+&snd_rzg2l {
+	status = "disabled";
+};
+
+&ssi1 {
+	/delete-property/ pinctrl-0;
+	/delete-property/ pinctrl-names;
+	status = "disabled";
+};
+#endif
+
 &vccq_sdhi1 {
 	gpios = <&pinctrl RZG2L_GPIO(6, 1) GPIO_ACTIVE_HIGH>;
 };
-- 
2.25.1

