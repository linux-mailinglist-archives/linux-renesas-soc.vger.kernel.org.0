Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 626E150E680
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Apr 2022 19:06:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243722AbiDYRJP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Apr 2022 13:09:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243729AbiDYRJO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Apr 2022 13:09:14 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 21D5927CF2;
        Mon, 25 Apr 2022 10:06:10 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,288,1643641200"; 
   d="scan'208";a="119104516"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 26 Apr 2022 02:06:09 +0900
Received: from localhost.localdomain (unknown [10.226.93.95])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 84CDE4004D06;
        Tue, 26 Apr 2022 02:06:06 +0900 (JST)
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
Subject: [PATCH 09/13] arm64: dts: renesas: rzg2ul-smarc: Enable Audio
Date:   Mon, 25 Apr 2022 18:05:26 +0100
Message-Id: <20220425170530.200921-10-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220425170530.200921-1-biju.das.jz@bp.renesas.com>
References: <20220425170530.200921-1-biju.das.jz@bp.renesas.com>
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
to the soc-pinctrl dtsi and ssi1 and cpu_dai nodes to the board dtsi.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../dts/renesas/rzg2ul-smarc-pinfunction.dtsi |  7 ++++++
 arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi | 25 +++++++++++++++++++
 2 files changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg2ul-smarc-pinfunction.dtsi b/arch/arm64/boot/dts/renesas/rzg2ul-smarc-pinfunction.dtsi
index 94106095c66a..12bd61dca336 100644
--- a/arch/arm64/boot/dts/renesas/rzg2ul-smarc-pinfunction.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2ul-smarc-pinfunction.dtsi
@@ -70,4 +70,11 @@ sound_clk_pins: sound_clk {
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
index a580b04987ec..0f7a9f000c5a 100644
--- a/arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2ul-smarc.dtsi
@@ -27,6 +27,31 @@ wm8978: codec@1a {
 	};
 };
 
+#if (SW_ET0_EN_N)
+&snd_rzg2l {
+	cpu_dai: simple-audio-card,cpu {
+		sound-dai = <&ssi1>;
+	};
+};
+
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

