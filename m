Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 507326C1BDA
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Mar 2023 17:36:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232034AbjCTQgr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Mar 2023 12:36:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232037AbjCTQgS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Mar 2023 12:36:18 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56E31EB76
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Mar 2023 09:30:15 -0700 (PDT)
Received: from ramsan.of.borg ([84.195.187.55])
        by albert.telenet-ops.be with bizsmtp
        id agWC2901D1C8whw06gWCwr; Mon, 20 Mar 2023 17:30:12 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1peIO3-00E2uz-P5;
        Mon, 20 Mar 2023 17:30:12 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1peIOi-007SSt-JE;
        Mon, 20 Mar 2023 17:30:12 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] ARM: dts: r8a7779: Add PWM support
Date:   Mon, 20 Mar 2023 17:30:06 +0100
Message-Id: <71622584db692f571d542ef2dcf088ce549aed3f.1679329211.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679329211.git.geert+renesas@glider.be>
References: <cover.1679329211.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for the 7 PWM channels provided by PWM Timers on R-Car
H1, by describing the PWM Timers and their module clock.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/r8a7779.dtsi | 91 +++++++++++++++++++++++++++++-----
 1 file changed, 78 insertions(+), 13 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7779.dtsi b/arch/arm/boot/dts/r8a7779.dtsi
index 39fc58f32df61b9a..97b767d81d926049 100644
--- a/arch/arm/boot/dts/r8a7779.dtsi
+++ b/arch/arm/boot/dts/r8a7779.dtsi
@@ -324,6 +324,69 @@ hscif1: serial@ffe49000 {
 		status = "disabled";
 	};
 
+	pwm0: pwm@ffe50000 {
+		compatible = "renesas,pwm-r8a7779", "renesas,pwm-rcar";
+		reg = <0xffe50000 0x8>;
+		clocks = <&mstp0_clks R8A7779_CLK_PWM>;
+		power-domains = <&sysc R8A7779_PD_ALWAYS_ON>;
+		#pwm-cells = <2>;
+		status = "disabled";
+	};
+
+	pwm1: pwm@ffe51000 {
+		compatible = "renesas,pwm-r8a7779", "renesas,pwm-rcar";
+		reg = <0xffe51000 0x8>;
+		clocks = <&mstp0_clks R8A7779_CLK_PWM>;
+		power-domains = <&sysc R8A7779_PD_ALWAYS_ON>;
+		#pwm-cells = <2>;
+		status = "disabled";
+	};
+
+	pwm2: pwm@ffe52000 {
+		compatible = "renesas,pwm-r8a7779", "renesas,pwm-rcar";
+		reg = <0xffe52000 0x8>;
+		clocks = <&mstp0_clks R8A7779_CLK_PWM>;
+		power-domains = <&sysc R8A7779_PD_ALWAYS_ON>;
+		#pwm-cells = <2>;
+		status = "disabled";
+	};
+
+	pwm3: pwm@ffe53000 {
+		compatible = "renesas,pwm-r8a7779", "renesas,pwm-rcar";
+		reg = <0xffe53000 0x8>;
+		clocks = <&mstp0_clks R8A7779_CLK_PWM>;
+		power-domains = <&sysc R8A7779_PD_ALWAYS_ON>;
+		#pwm-cells = <2>;
+		status = "disabled";
+	};
+
+	pwm4: pwm@ffe54000 {
+		compatible = "renesas,pwm-r8a7779", "renesas,pwm-rcar";
+		reg = <0xffe54000 0x8>;
+		clocks = <&mstp0_clks R8A7779_CLK_PWM>;
+		power-domains = <&sysc R8A7779_PD_ALWAYS_ON>;
+		#pwm-cells = <2>;
+		status = "disabled";
+	};
+
+	pwm5: pwm@ffe55000 {
+		compatible = "renesas,pwm-r8a7779", "renesas,pwm-rcar";
+		reg = <0xffe55000 0x8>;
+		clocks = <&mstp0_clks R8A7779_CLK_PWM>;
+		power-domains = <&sysc R8A7779_PD_ALWAYS_ON>;
+		#pwm-cells = <2>;
+		status = "disabled";
+	};
+
+	pwm6: pwm@ffe56000 {
+		compatible = "renesas,pwm-r8a7779", "renesas,pwm-rcar";
+		reg = <0xffe56000 0x8>;
+		clocks = <&mstp0_clks R8A7779_CLK_PWM>;
+		power-domains = <&sysc R8A7779_PD_ALWAYS_ON>;
+		#pwm-cells = <2>;
+		status = "disabled";
+	};
+
 	pfc: pinctrl@fffc0000 {
 		compatible = "renesas,pfc-r8a7779";
 		reg = <0xfffc0000 0x23c>;
@@ -554,7 +617,8 @@ mstp0_clks: clocks@ffc80030 {
 			compatible = "renesas,r8a7779-mstp-clocks",
 				     "renesas,cpg-mstp-clocks";
 			reg = <0xffc80030 4>;
-			clocks = <&cpg_clocks R8A7779_CLK_S>,
+			clocks = <&cpg_clocks R8A7779_CLK_P>,
+				 <&cpg_clocks R8A7779_CLK_S>,
 				 <&cpg_clocks R8A7779_CLK_P>,
 				 <&cpg_clocks R8A7779_CLK_P>,
 				 <&cpg_clocks R8A7779_CLK_P>,
@@ -572,20 +636,21 @@ mstp0_clks: clocks@ffc80030 {
 				 <&cpg_clocks R8A7779_CLK_P>;
 			#clock-cells = <1>;
 			clock-indices = <
-				R8A7779_CLK_HSPI R8A7779_CLK_TMU2
-				R8A7779_CLK_TMU1 R8A7779_CLK_TMU0
-				R8A7779_CLK_HSCIF1 R8A7779_CLK_HSCIF0
-				R8A7779_CLK_SCIF5 R8A7779_CLK_SCIF4
-				R8A7779_CLK_SCIF3 R8A7779_CLK_SCIF2
-				R8A7779_CLK_SCIF1 R8A7779_CLK_SCIF0
-				R8A7779_CLK_I2C3 R8A7779_CLK_I2C2
-				R8A7779_CLK_I2C1 R8A7779_CLK_I2C0
+				R8A7779_CLK_PWM R8A7779_CLK_HSPI
+				R8A7779_CLK_TMU2 R8A7779_CLK_TMU1
+				R8A7779_CLK_TMU0 R8A7779_CLK_HSCIF1
+				R8A7779_CLK_HSCIF0 R8A7779_CLK_SCIF5
+				R8A7779_CLK_SCIF4 R8A7779_CLK_SCIF3
+				R8A7779_CLK_SCIF2 R8A7779_CLK_SCIF1
+				R8A7779_CLK_SCIF0 R8A7779_CLK_I2C3
+				R8A7779_CLK_I2C2 R8A7779_CLK_I2C1
+				R8A7779_CLK_I2C0
 			>;
 			clock-output-names =
-				"hspi", "tmu2", "tmu1", "tmu0", "hscif1",
-				"hscif0", "scif5", "scif4", "scif3", "scif2",
-				"scif1", "scif0", "i2c3", "i2c2", "i2c1",
-				"i2c0";
+				"pwm", "hspi", "tmu2", "tmu1", "tmu0",
+				"hscif1", "hscif0", "scif5", "scif4", "scif3",
+				"scif2", "scif1", "scif0", "i2c3", "i2c2",
+				"i2c1", "i2c0";
 		};
 		mstp1_clks: clocks@ffc80034 {
 			compatible = "renesas,r8a7779-mstp-clocks",
-- 
2.34.1

