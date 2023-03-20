Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D4F16C1CFE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Mar 2023 17:57:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232584AbjCTQ5N (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Mar 2023 12:57:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232670AbjCTQ4q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Mar 2023 12:56:46 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1F5F3608D
        for <linux-renesas-soc@vger.kernel.org>; Mon, 20 Mar 2023 09:49:29 -0700 (PDT)
Received: from ramsan.of.borg ([84.195.187.55])
        by michel.telenet-ops.be with bizsmtp
        id agpU2900g1C8whw06gpUcB; Mon, 20 Mar 2023 17:49:28 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1peIgh-00E2z7-RC;
        Mon, 20 Mar 2023 17:49:28 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1peIhM-007SlA-K3;
        Mon, 20 Mar 2023 17:49:28 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] ARM: dts: r8a7790: Add PWM device nodes
Date:   Mon, 20 Mar 2023 17:49:27 +0100
Message-Id: <9755b3af4296060ee31c4652def639574cbbd2fb.1679330878.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
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

Add support for the 7 PWM channels provided by PWM Timers on R-Car H2,
by adding device nodes describing the PWM Timers.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
PWM1(b) and PWM3-6 have bested with PWM sysfs and a logic analyzer on
the Lager development board using DT overlays available from [1].

To be queued in renesas-devel-for-v6.4.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/log/?h=topic/renesas-overlays

 arch/arm/boot/dts/r8a7790.dtsi | 70 ++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
index 7211a5bb18a3b3df..46fb81f5062ff6bc 100644
--- a/arch/arm/boot/dts/r8a7790.dtsi
+++ b/arch/arm/boot/dts/r8a7790.dtsi
@@ -1048,6 +1048,76 @@ msiof3: spi@e6c90000 {
 			status = "disabled";
 		};
 
+		pwm0: pwm@e6e30000 {
+			compatible = "renesas,pwm-r8a7790", "renesas,pwm-rcar";
+			reg = <0 0xe6e30000 0 0x8>;
+			clocks = <&cpg CPG_MOD 523>;
+			power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
+			resets = <&cpg 523>;
+			#pwm-cells = <2>;
+			status = "disabled";
+		};
+
+		pwm1: pwm@e6e31000 {
+			compatible = "renesas,pwm-r8a7790", "renesas,pwm-rcar";
+			reg = <0 0xe6e31000 0 0x8>;
+			clocks = <&cpg CPG_MOD 523>;
+			power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
+			resets = <&cpg 523>;
+			#pwm-cells = <2>;
+			status = "disabled";
+		};
+
+		pwm2: pwm@e6e32000 {
+			compatible = "renesas,pwm-r8a7790", "renesas,pwm-rcar";
+			reg = <0 0xe6e32000 0 0x8>;
+			clocks = <&cpg CPG_MOD 523>;
+			power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
+			resets = <&cpg 523>;
+			#pwm-cells = <2>;
+			status = "disabled";
+		};
+
+		pwm3: pwm@e6e33000 {
+			compatible = "renesas,pwm-r8a7790", "renesas,pwm-rcar";
+			reg = <0 0xe6e33000 0 0x8>;
+			clocks = <&cpg CPG_MOD 523>;
+			power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
+			resets = <&cpg 523>;
+			#pwm-cells = <2>;
+			status = "disabled";
+		};
+
+		pwm4: pwm@e6e34000 {
+			compatible = "renesas,pwm-r8a7790", "renesas,pwm-rcar";
+			reg = <0 0xe6e34000 0 0x8>;
+			clocks = <&cpg CPG_MOD 523>;
+			power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
+			resets = <&cpg 523>;
+			#pwm-cells = <2>;
+			status = "disabled";
+		};
+
+		pwm5: pwm@e6e35000 {
+			compatible = "renesas,pwm-r8a7790", "renesas,pwm-rcar";
+			reg = <0 0xe6e35000 0 0x8>;
+			clocks = <&cpg CPG_MOD 523>;
+			power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
+			resets = <&cpg 523>;
+			#pwm-cells = <2>;
+			status = "disabled";
+		};
+
+		pwm6: pwm@e6e36000 {
+			compatible = "renesas,pwm-r8a7790", "renesas,pwm-rcar";
+			reg = <0 0xe6e36000 0 0x8>;
+			clocks = <&cpg CPG_MOD 523>;
+			power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
+			resets = <&cpg 523>;
+			#pwm-cells = <2>;
+			status = "disabled";
+		};
+
 		can0: can@e6e80000 {
 			compatible = "renesas,can-r8a7790",
 				     "renesas,rcar-gen2-can";
-- 
2.34.1

