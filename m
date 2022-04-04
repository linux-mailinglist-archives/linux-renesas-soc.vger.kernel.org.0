Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F32724F1888
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  4 Apr 2022 17:35:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237757AbiDDPhi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 4 Apr 2022 11:37:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230240AbiDDPhi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Apr 2022 11:37:38 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A9E535AB3
        for <linux-renesas-soc@vger.kernel.org>; Mon,  4 Apr 2022 08:35:40 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:6d4d:d9ec:3c70:7c2c])
        by albert.telenet-ops.be with bizsmtp
        id Efbe2700840M8zK06fbemZ; Mon, 04 Apr 2022 17:35:38 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nbOjx-008Mia-N2; Mon, 04 Apr 2022 17:35:37 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nbOjx-00CdZd-7o; Mon, 04 Apr 2022 17:35:37 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] arm64: dts: renesas: r8a779f0: Add GPIO nodes
Date:   Mon,  4 Apr 2022 17:35:32 +0200
Message-Id: <7fb68561026fa8bb5d9baf0596560c5c719a38cc.1649086225.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
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

Add device nodes for the General Purpose Input/Output (GPIO) blocks on
the Renesas R-Car S4-8 (R8A779F0) SoC.

Note that GPIO blocks 4-7 are not added, as they can only be accessed
from the Control Domain.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Tested with i2c-gpio, by reading the contents from the I2C EEPROMs
connected to I2C4 (GP1_[89]) on the Spider development board.
Note that this requires manual setting of MOD_SEL1 to zero in U-Boot, as
the pin control driver does not handle this special case yet.

v2:
  - Drop gpio4-7],
  - Drop RFC,
  - Split series in DT bindings+driver series and DTS patch.
---
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi | 60 +++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
index f4e549867371184c..e44b8a44919dc91d 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
@@ -75,6 +75,66 @@ pfc: pinctrl@e6050000 {
 			      <0 0xe6051000 0 0x16c>, <0 0xe6051800 0 0x16c>;
 		};
 
+		gpio0: gpio@e6050180 {
+			compatible = "renesas,gpio-r8a779f0",
+				     "renesas,rcar-gen4-gpio";
+			reg = <0 0xe6050180 0 0x54>;
+			interrupts = <GIC_SPI 822 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 915>;
+			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
+			resets = <&cpg 915>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pfc 0 0 21>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpio1: gpio@e6050980 {
+			compatible = "renesas,gpio-r8a779f0",
+				     "renesas,rcar-gen4-gpio";
+			reg = <0 0xe6050980 0 0x54>;
+			interrupts = <GIC_SPI 823 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 915>;
+			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
+			resets = <&cpg 915>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pfc 0 32 25>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpio2: gpio@e6051180 {
+			compatible = "renesas,gpio-r8a779f0",
+				     "renesas,rcar-gen4-gpio";
+			reg = <0 0xe6051180 0 0x54>;
+			interrupts = <GIC_SPI 824 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 915>;
+			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
+			resets = <&cpg 915>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pfc 0 64 17>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpio3: gpio@e6051980 {
+			compatible = "renesas,gpio-r8a779f0",
+				     "renesas,rcar-gen4-gpio";
+			reg = <0 0xe6051980 0 0x54>;
+			interrupts = <GIC_SPI 825 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 915>;
+			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
+			resets = <&cpg 915>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pfc 0 96 19>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
 		cpg: clock-controller@e6150000 {
 			compatible = "renesas,r8a779f0-cpg-mssr";
 			reg = <0 0xe6150000 0 0x4000>;
-- 
2.25.1

