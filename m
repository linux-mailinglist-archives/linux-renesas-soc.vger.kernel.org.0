Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44FCB39727E
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Jun 2021 13:36:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230308AbhFALiA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Jun 2021 07:38:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230288AbhFALh7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Jun 2021 07:37:59 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9720FC061574
        for <linux-renesas-soc@vger.kernel.org>; Tue,  1 Jun 2021 04:36:18 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:b9f6:a814:dab1:1579])
        by albert.telenet-ops.be with bizsmtp
        id BncE2500Z47zJAe06ncEpg; Tue, 01 Jun 2021 13:36:16 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lo2gw-00BqBO-A2; Tue, 01 Jun 2021 13:36:14 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lo2gv-00HRNV-Rw; Tue, 01 Jun 2021 13:36:13 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: r8a77961: Add INTC-EX device node
Date:   Tue,  1 Jun 2021 13:36:12 +0200
Message-Id: <6f3cc1a1b6d777e743a7a9e66a80aaf9d5232a4f.1622547125.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Populate the device node for the Interrupt Controller for External
Devices (INTC-EX) on R-Car M3-W+, which serves external IRQ pins
IRQ[0-5].

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Remote-tested on Salvator-XS with R-Car M3-W+.
After this, the PMIC connected to IRQ0 is instantiated.

To be queued in renesas-devel for v5.14.

 arch/arm64/boot/dts/renesas/r8a77961.dtsi | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
index 3c73ee47791542a9..91b501e0121ef26f 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
@@ -560,10 +560,19 @@ tsc: thermal@e6198000 {
 		};
 
 		intc_ex: interrupt-controller@e61c0000 {
+			compatible = "renesas,intc-ex-r8a77961", "renesas,irqc";
 			#interrupt-cells = <2>;
 			interrupt-controller;
 			reg = <0 0xe61c0000 0 0x200>;
-			/* placeholder */
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 407>;
+			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
+			resets = <&cpg 407>;
 		};
 
 		tmu0: timer@e61e0000 {
-- 
2.25.1

