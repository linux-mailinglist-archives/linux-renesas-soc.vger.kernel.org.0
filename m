Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 175C511420B
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2019 14:59:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729547AbfLEN7e (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 5 Dec 2019 08:59:34 -0500
Received: from andre.telenet-ops.be ([195.130.132.53]:40700 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729524AbfLEN7e (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Dec 2019 08:59:34 -0500
Received: from ramsan ([84.195.182.253])
        by andre.telenet-ops.be with bizsmtp
        id aDzY210095USYZQ01DzYRT; Thu, 05 Dec 2019 14:59:33 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1icrfI-0002LA-6h; Thu, 05 Dec 2019 14:59:32 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1icrfI-0001xL-5K; Thu, 05 Dec 2019 14:59:32 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Eugeniu Rosca <erosca@de.adit-jv.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 6/6] arm64: dts: renesas: r8a77961: Add SDHI nodes
Date:   Thu,  5 Dec 2019 14:59:30 +0100
Message-Id: <20191205135930.7454-7-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191205135930.7454-1-geert+renesas@glider.be>
References: <20191205135930.7454-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add device nodes for the SDHI Interfaces on the Renesas R-Car M3-W+
(r8a77961) SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Test procedure (eMMC):
  1. "hd /dev/mmcblk0boot1".
---
 arch/arm64/boot/dts/renesas/r8a77961.dtsi | 39 +++++++++++++++++++++--
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
index 26bffffe7c544bb4..81e089458ce5b770 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
@@ -905,18 +905,51 @@
 		};
 
 		sdhi0: sd@ee100000 {
+			compatible = "renesas,sdhi-r8a77961",
+				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee100000 0 0x2000>;
-			/* placeholder */
+			interrupts = <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 314>;
+			max-frequency = <200000000>;
+			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
+			resets = <&cpg 314>;
+			status = "disabled";
+		};
+
+		sdhi1: sd@ee120000 {
+			compatible = "renesas,sdhi-r8a77961",
+				     "renesas,rcar-gen3-sdhi";
+			reg = <0 0xee120000 0 0x2000>;
+			interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 313>;
+			max-frequency = <200000000>;
+			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
+			resets = <&cpg 313>;
+			status = "disabled";
 		};
 
 		sdhi2: sd@ee140000 {
+			compatible = "renesas,sdhi-r8a77961",
+				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee140000 0 0x2000>;
-			/* placeholder */
+			interrupts = <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 312>;
+			max-frequency = <200000000>;
+			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
+			resets = <&cpg 312>;
+			status = "disabled";
 		};
 
 		sdhi3: sd@ee160000 {
+			compatible = "renesas,sdhi-r8a77961",
+				     "renesas,rcar-gen3-sdhi";
 			reg = <0 0xee160000 0 0x2000>;
-			/* placeholder */
+			interrupts = <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 311>;
+			max-frequency = <200000000>;
+			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
+			resets = <&cpg 311>;
+			status = "disabled";
 		};
 
 		gic: interrupt-controller@f1010000 {
-- 
2.17.1

