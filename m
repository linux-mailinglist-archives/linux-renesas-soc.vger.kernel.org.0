Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 03C8A763977
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Jul 2023 16:45:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232569AbjGZOpG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 26 Jul 2023 10:45:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232389AbjGZOpD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Jul 2023 10:45:03 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27D0419A1
        for <linux-renesas-soc@vger.kernel.org>; Wed, 26 Jul 2023 07:44:58 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:d80c:aaca:e11d:6940])
        by albert.telenet-ops.be with bizsmtp
        id Rqkv2A00C4qLm8F06qkvoa; Wed, 26 Jul 2023 16:44:56 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qOfko-002Ym2-FH;
        Wed, 26 Jul 2023 16:44:55 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1qOfl1-00A8Hm-KY;
        Wed, 26 Jul 2023 16:44:55 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/3] arm64: dts: renesas: r8a779f0: Add INTC-EX node
Date:   Wed, 26 Jul 2023 16:44:42 +0200
Message-Id: <6c709d2c7776b2b31e127b14c2127195732c592e.1690382328.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1690382328.git.geert+renesas@glider.be>
References: <cover.1690382328.git.geert+renesas@glider.be>
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

Add the device node for the Interrupt Controller for External Devices
(INTC-EX) on the Renesas R-Car S4-8 (R8A779F0) SoC, which serves
external IRQ pins IRQ[0-5].

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
index 1d5426e6293c5616..0059c9c580f3f9ef 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
@@ -466,6 +466,21 @@ tsc: thermal@e6198000 {
 			#thermal-sensor-cells = <1>;
 		};
 
+		intc_ex: interrupt-controller@e61c0000 {
+			compatible = "renesas,intc-ex-r8a779f0", "renesas,irqc";
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			reg = <0 0xe61c0000 0 0x200>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_CORE R8A779F0_CLK_CL16M>;
+			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
+		};
+
 		tmu0: timer@e61e0000 {
 			compatible = "renesas,tmu-r8a779f0", "renesas,tmu";
 			reg = <0 0xe61e0000 0 0x30>;
-- 
2.34.1

