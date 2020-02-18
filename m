Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D95A162720
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 18 Feb 2020 14:30:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726340AbgBRNaZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 18 Feb 2020 08:30:25 -0500
Received: from xavier.telenet-ops.be ([195.130.132.52]:53420 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726512AbgBRNaZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Feb 2020 08:30:25 -0500
Received: from ramsan ([84.195.182.253])
        by xavier.telenet-ops.be with bizsmtp
        id 4DWN2200V5USYZQ01DWN2B; Tue, 18 Feb 2020 14:30:23 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j42xC-0005cX-LU; Tue, 18 Feb 2020 14:30:22 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j42xC-0005oY-KM; Tue, 18 Feb 2020 14:30:22 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 1/4] ARM: dts: rcar-gen2: Add reset control properties for display
Date:   Tue, 18 Feb 2020 14:30:16 +0100
Message-Id: <20200218133019.22299-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200218133019.22299-1-geert+renesas@glider.be>
References: <20200218133019.22299-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add reset control properties to the device nodes for the Display Units
on all supported R-Car Gen2 SoCs.  Note that on these SoCs, there is
only a single reset for all DU channels.

Join the clocks lines while at it, to increase uniformity.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.
---
 arch/arm/boot/dts/r8a7790.dtsi | 2 ++
 arch/arm/boot/dts/r8a7791.dtsi | 5 +++--
 arch/arm/boot/dts/r8a7792.dtsi | 5 +++--
 arch/arm/boot/dts/r8a7793.dtsi | 5 +++--
 arch/arm/boot/dts/r8a7794.dtsi | 2 ++
 5 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7790.dtsi b/arch/arm/boot/dts/r8a7790.dtsi
index 334ba19769b998ac..e5ef9fd4284ae436 100644
--- a/arch/arm/boot/dts/r8a7790.dtsi
+++ b/arch/arm/boot/dts/r8a7790.dtsi
@@ -1719,6 +1719,8 @@
 			clocks = <&cpg CPG_MOD 724>, <&cpg CPG_MOD 723>,
 				 <&cpg CPG_MOD 722>;
 			clock-names = "du.0", "du.1", "du.2";
+			resets = <&cpg 724>;
+			reset-names = "du.0";
 			status = "disabled";
 
 			ports {
diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791.dtsi
index baedfab84cb09134..e38a5f01490d70a1 100644
--- a/arch/arm/boot/dts/r8a7791.dtsi
+++ b/arch/arm/boot/dts/r8a7791.dtsi
@@ -1682,9 +1682,10 @@
 			reg = <0 0xfeb00000 0 0x40000>;
 			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 724>,
-				 <&cpg CPG_MOD 723>;
+			clocks = <&cpg CPG_MOD 724>, <&cpg CPG_MOD 723>;
 			clock-names = "du.0", "du.1";
+			resets = <&cpg 724>;
+			reset-names = "du.0";
 			status = "disabled";
 
 			ports {
diff --git a/arch/arm/boot/dts/r8a7792.dtsi b/arch/arm/boot/dts/r8a7792.dtsi
index 39af16caa2aef501..4627eefa502b7677 100644
--- a/arch/arm/boot/dts/r8a7792.dtsi
+++ b/arch/arm/boot/dts/r8a7792.dtsi
@@ -852,9 +852,10 @@
 			reg = <0 0xfeb00000 0 0x40000>;
 			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 724>,
-				 <&cpg CPG_MOD 723>;
+			clocks = <&cpg CPG_MOD 724>, <&cpg CPG_MOD 723>;
 			clock-names = "du.0", "du.1";
+			resets = <&cpg 724>;
+			reset-names = "du.0";
 			status = "disabled";
 
 			ports {
diff --git a/arch/arm/boot/dts/r8a7793.dtsi b/arch/arm/boot/dts/r8a7793.dtsi
index eef035c4d98341b6..dadbda16161b7457 100644
--- a/arch/arm/boot/dts/r8a7793.dtsi
+++ b/arch/arm/boot/dts/r8a7793.dtsi
@@ -1341,9 +1341,10 @@
 			reg = <0 0xfeb00000 0 0x40000>;
 			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 724>,
-				 <&cpg CPG_MOD 723>;
+			clocks = <&cpg CPG_MOD 724>, <&cpg CPG_MOD 723>;
 			clock-names = "du.0", "du.1";
+			resets = <&cpg 724>;
+			reset-names = "du.0";
 			status = "disabled";
 
 			ports {
diff --git a/arch/arm/boot/dts/r8a7794.dtsi b/arch/arm/boot/dts/r8a7794.dtsi
index 05ef79c6ed7f6b61..2c9e7a1ebfec1863 100644
--- a/arch/arm/boot/dts/r8a7794.dtsi
+++ b/arch/arm/boot/dts/r8a7794.dtsi
@@ -1356,6 +1356,8 @@
 				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 724>, <&cpg CPG_MOD 723>;
 			clock-names = "du.0", "du.1";
+			resets = <&cpg 724>;
+			reset-names = "du.0";
 			status = "disabled";
 
 			ports {
-- 
2.17.1

