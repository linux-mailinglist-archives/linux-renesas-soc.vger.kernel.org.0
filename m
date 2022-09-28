Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 89A105EDD18
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Sep 2022 14:45:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233186AbiI1Mp5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 28 Sep 2022 08:45:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231920AbiI1Mp4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Sep 2022 08:45:56 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08D325757B
        for <linux-renesas-soc@vger.kernel.org>; Wed, 28 Sep 2022 05:45:54 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed50:5556:1b6:16f5:2874])
        by baptiste.telenet-ops.be with bizsmtp
        id RQlq2801e40fT9J01QlqUl; Wed, 28 Sep 2022 14:45:53 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1odWRi-0006nh-Ed; Wed, 28 Sep 2022 14:45:50 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1odWRi-0032H4-1h; Wed, 28 Sep 2022 14:45:50 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: r8a779g0: Add INTC-EX node
Date:   Wed, 28 Sep 2022 14:45:48 +0200
Message-Id: <f2e5adf62a7666db7350d9596a907bc7f9e81d43.1664369015.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
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

Add the device node for the Interrupt Controller for External Devices
(INTC-EX) on the Renesas R-Car V4H (R8A779G0) SoC, which serves external
IRQ pins IRQ[0-5].

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Tested on the White Hawk development board using IRQ2[1].
To be queued in renesas-devel for v6.2.

[1] "arm64: dts: renesas: r8a779g0: whitehawk: Add overlay for IRQ2"
    https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git/commit/?h=topic/renesas-overlays&id=4ccf4c30402d0876e44a741f368cbc067068e7f6

 arch/arm64/boot/dts/renesas/r8a779g0.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
index d31b1fb42fc67cf8..edabd1519ccc979d 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0.dtsi
@@ -235,6 +235,22 @@ sysc: system-controller@e6180000 {
 			#power-domain-cells = <1>;
 		};
 
+		intc_ex: interrupt-controller@e61c0000 {
+			compatible = "renesas,intc-ex-r8a779g0", "renesas,irqc";
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			reg = <0 0xe61c0000 0 0x200>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 611>;
+			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+			resets = <&cpg 611>;
+		};
+
 		i2c0: i2c@e6500000 {
 			compatible = "renesas,i2c-r8a779g0",
 				     "renesas,rcar-gen4-i2c";
-- 
2.25.1

