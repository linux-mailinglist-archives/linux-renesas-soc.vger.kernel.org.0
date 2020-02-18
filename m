Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8900616271D
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Feb 2020 14:30:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726521AbgBRNaY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Feb 2020 08:30:24 -0500
Received: from xavier.telenet-ops.be ([195.130.132.52]:53412 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726475AbgBRNaY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Feb 2020 08:30:24 -0500
Received: from ramsan ([84.195.182.253])
        by xavier.telenet-ops.be with bizsmtp
        id 4DWN2200X5USYZQ01DWN2C; Tue, 18 Feb 2020 14:30:23 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j42xC-0005cj-Op; Tue, 18 Feb 2020 14:30:22 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j42xC-0005oh-Mz; Tue, 18 Feb 2020 14:30:22 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 4/4] arm64: dts: renesas: rzg2: Add reset control properties for display
Date:   Tue, 18 Feb 2020 14:30:19 +0100
Message-Id: <20200218133019.22299-5-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200218133019.22299-1-geert+renesas@glider.be>
References: <20200218133019.22299-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add reset control properties to the device nodes for the Display Units
on all supported RZ/G2 SoCs.  Note that on these SoCs, there is only a
single reset for each pair of DU channels.

Join the clocks lines while at it, to increase uniformity.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.
---
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 5 +++--
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi | 5 +++--
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi | 5 +++--
 3 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
index 507e78ebaab52330..79023433a740b7ca 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
@@ -2634,10 +2634,11 @@
 			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 724>,
-				 <&cpg CPG_MOD 723>,
+			clocks = <&cpg CPG_MOD 724>, <&cpg CPG_MOD 723>,
 				 <&cpg CPG_MOD 722>;
 			clock-names = "du.0", "du.1", "du.2";
+			resets = <&cpg 724>, <&cpg 722>;
+			reset-names = "du.0", "du.2";
 			status = "disabled";
 
 			renesas,vsps = <&vspd0 0>, <&vspd1 0>, <&vspd2 0>;
diff --git a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
index 93dd10b5d6d05712..3137f735974be165 100644
--- a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
@@ -2480,10 +2480,11 @@
 			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 270 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 724>,
-				 <&cpg CPG_MOD 723>,
+			clocks = <&cpg CPG_MOD 724>, <&cpg CPG_MOD 723>,
 				 <&cpg CPG_MOD 721>;
 			clock-names = "du.0", "du.1", "du.3";
+			resets = <&cpg 724>, <&cpg 722>;
+			reset-names = "du.0", "du.3";
 			status = "disabled";
 
 			renesas,vsps = <&vspd0 0>, <&vspd1 0>, <&vspd0 1>;
diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
index d4eee8fef35da74e..22785cbddff5d08c 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
@@ -1810,9 +1810,10 @@
 			reg = <0 0xfeb00000 0 0x40000>;
 			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 724>,
-				 <&cpg CPG_MOD 723>;
+			clocks = <&cpg CPG_MOD 724>, <&cpg CPG_MOD 723>;
 			clock-names = "du.0", "du.1";
+			resets = <&cpg 724>;
+			reset-names = "du.0";
 			renesas,vsps = <&vspd0 0>, <&vspd1 0>;
 
 			status = "disabled";
-- 
2.17.1

