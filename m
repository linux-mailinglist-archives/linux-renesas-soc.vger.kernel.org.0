Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C02555F7A9A
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  7 Oct 2022 17:34:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229549AbiJGPeJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 7 Oct 2022 11:34:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230045AbiJGPeJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 7 Oct 2022 11:34:09 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03FA8118759
        for <linux-renesas-soc@vger.kernel.org>; Fri,  7 Oct 2022 08:34:06 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:a4a4:fd15:fba:df3b])
        by xavier.telenet-ops.be with bizsmtp
        id V3a4280085Lh0ZK013a4Yc; Fri, 07 Oct 2022 17:34:04 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ogpMR-000ugm-R5; Fri, 07 Oct 2022 17:34:03 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ogpMR-00CQXZ-3t; Fri, 07 Oct 2022 17:34:03 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        CongDang <cong.dang.xn@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] arm64: dts: renesas: r8a779g0: Add PWM device nodes
Date:   Fri,  7 Oct 2022 17:34:01 +0200
Message-Id: <6a2df8c9f751993ae40aa8f196f4124e384b0aab.1665156417.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1665156417.git.geert+renesas@glider.be>
References: <cover.1665156417.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: CongDang <cong.dang.xn@renesas.com>

Add device nodes for the PWM timers on the Renesas R-Car V4H (R8A779G0)
SoC.

Signed-off-by: CongDang <cong.dang.xn@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 100 ++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index f90ff272d155bb19..3d972c742fc7e272 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -562,6 +562,106 @@ avb2: ethernet@e6820000 {
 			status = "disabled";
 		};
 
+		pwm0: pwm@e6e30000 {
+			compatible = "renesas,pwm-r8a779g0", "renesas,pwm-rcar";
+			reg = <0 0xe6e30000 0 0x10>;
+			#pwm-cells = <2>;
+			clocks = <&cpg CPG_MOD 628>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 628>;
+			status = "disabled";
+		};
+
+		pwm1: pwm@e6e31000 {
+			compatible = "renesas,pwm-r8a779g0", "renesas,pwm-rcar";
+			reg = <0 0xe6e31000 0 0x10>;
+			#pwm-cells = <2>;
+			clocks = <&cpg CPG_MOD 628>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 628>;
+			status = "disabled";
+		};
+
+		pwm2: pwm@e6e32000 {
+			compatible = "renesas,pwm-r8a779g0", "renesas,pwm-rcar";
+			reg = <0 0xe6e32000 0 0x10>;
+			#pwm-cells = <2>;
+			clocks = <&cpg CPG_MOD 628>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 628>;
+			status = "disabled";
+		};
+
+		pwm3: pwm@e6e33000 {
+			compatible = "renesas,pwm-r8a779g0", "renesas,pwm-rcar";
+			reg = <0 0xe6e33000 0 0x10>;
+			#pwm-cells = <2>;
+			clocks = <&cpg CPG_MOD 628>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 628>;
+			status = "disabled";
+		};
+
+		pwm4: pwm@e6e34000 {
+			compatible = "renesas,pwm-r8a779g0", "renesas,pwm-rcar";
+			reg = <0 0xe6e34000 0 0x10>;
+			#pwm-cells = <2>;
+			clocks = <&cpg CPG_MOD 628>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 628>;
+			status = "disabled";
+		};
+
+		pwm5: pwm@e6e35000 {
+			compatible = "renesas,pwm-r8a779g0", "renesas,pwm-rcar";
+			reg = <0 0xe6e35000 0 0x10>;
+			#pwm-cells = <2>;
+			clocks = <&cpg CPG_MOD 628>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 628>;
+			status = "disabled";
+		};
+
+		pwm6: pwm@e6e36000 {
+			compatible = "renesas,pwm-r8a779g0", "renesas,pwm-rcar";
+			reg = <0 0xe6e36000 0 0x10>;
+			#pwm-cells = <2>;
+			clocks = <&cpg CPG_MOD 628>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 628>;
+			status = "disabled";
+		};
+
+		pwm7: pwm@e6e37000 {
+			compatible = "renesas,pwm-r8a779g0", "renesas,pwm-rcar";
+			reg = <0 0xe6e37000 0 0x10>;
+			#pwm-cells = <2>;
+			clocks = <&cpg CPG_MOD 628>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 628>;
+			status = "disabled";
+		};
+
+		pwm8: pwm@e6e38000 {
+			compatible = "renesas,pwm-r8a779g0", "renesas,pwm-rcar";
+			reg = <0 0xe6e38000 0 0x10>;
+			#pwm-cells = <2>;
+			clocks = <&cpg CPG_MOD 628>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 628>;
+			status = "disabled";
+		};
+
+		pwm9: pwm@e6e39000 {
+			compatible = "renesas,pwm-r8a779g0", "renesas,pwm-rcar";
+			reg = <0 0xe6e39000 0 0x10>;
+			#pwm-cells = <2>;
+			clocks = <&cpg CPG_MOD 628>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 628>;
+			status = "disabled";
+		};
+
 		scif0: serial@e6e60000 {
 			compatible = "renesas,scif-r8a779g0",
 				     "renesas,rcar-gen4-scif", "renesas,scif";
-- 
2.25.1

