Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1ECCE5B3499
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 Sep 2022 11:55:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbiIIJyT (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 9 Sep 2022 05:54:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229614AbiIIJyJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Sep 2022 05:54:09 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE4ECB08BF
        for <linux-renesas-soc@vger.kernel.org>; Fri,  9 Sep 2022 02:54:07 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:91db:705e:cfbc:a001])
        by michel.telenet-ops.be with bizsmtp
        id Hlu62800H0sKggw06lu6LF; Fri, 09 Sep 2022 11:54:06 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oWai5-004bsi-Ox; Fri, 09 Sep 2022 11:54:05 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oWai4-004i68-Kk; Fri, 09 Sep 2022 11:54:04 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 14/14] arm64: dts: renesas: white-hawk-cpu: Add Ethernet support
Date:   Fri,  9 Sep 2022 11:54:01 +0200
Message-Id: <50a31bc8267ab4c90bff27ef3aca1169f8ebc7ae.1662715538.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662715538.git.geert+renesas@glider.be>
References: <cover.1662715538.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Describe the wiring of the first Ethernet AVB instance to the Micrel
KSZ9031RNXVB PHY.

Based on a larger patch in the BSP by Takeshi Kihara.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Changes compared to the BSP:
  - Move to CPU board.
---
 .../dts/renesas/r8a779g0-white-hawk-cpu.dtsi  | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi
index e382b2d5c8d49fd3..77f0130a2f856ddb 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi
@@ -16,6 +16,7 @@ / {
 	compatible = "renesas,white-hawk-cpu", "renesas,r8a779g0";
 
 	aliases {
+		ethernet0 = &avb0;
 		serial0 = &hscif0;
 	};
 
@@ -96,6 +97,24 @@ memory@600000000 {
 	};
 };
 
+&avb0 {
+	pinctrl-0 = <&avb0_pins>;
+	pinctrl-names = "default";
+	phy-handle = <&phy0>;
+	tx-internal-delay-ps = <2000>;
+	status = "okay";
+
+	phy0: ethernet-phy@0 {
+		compatible = "ethernet-phy-id0022.1622",
+			     "ethernet-phy-ieee802.3-c22";
+		rxc-skew-ps = <1500>;
+		reg = <0>;
+		interrupt-parent = <&gpio7>;
+		interrupts = <5 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&gpio7 10 GPIO_ACTIVE_LOW>;
+	};
+};
+
 &extal_clk {
 	clock-frequency = <16666666>;
 };
@@ -127,6 +146,24 @@ &pfc {
 	pinctrl-0 = <&scif_clk_pins>;
 	pinctrl-names = "default";
 
+	avb0_pins: avb0 {
+		mux {
+			groups = "avb0_link", "avb0_mdio", "avb0_rgmii",
+				 "avb0_txcrefclk";
+			function = "avb0";
+		};
+
+		pins_mdio {
+			groups = "avb0_mdio";
+			drive-strength = <21>;
+		};
+
+		pins_mii {
+			groups = "avb0_rgmii";
+			drive-strength = <21>;
+		};
+
+	};
 	hscif0_pins: hscif0 {
 		groups = "hscif0_data";
 		function = "hscif0";
-- 
2.25.1

