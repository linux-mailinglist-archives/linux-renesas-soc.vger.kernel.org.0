Return-Path: <linux-renesas-soc+bounces-2217-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF878459CE
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Feb 2024 15:16:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB125283123
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Feb 2024 14:16:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0F135F474;
	Thu,  1 Feb 2024 14:16:02 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D4EF5D497
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Feb 2024 14:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706796962; cv=none; b=Y3aWYbTvdyDF4EdZgElGr72J3wJO9Uxcy3Uxev8MGqoM7DVWBj7V0UZKbsGuZahtxo1704A4hAbvepsc57CcyBYSmzaDaRiHsUDyGC5d505gamn1IKEXUfd4Jary39XJnQ+D6IccP7jm7lR6bTUH0h96Shz3HAenKkIiaLIrwXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706796962; c=relaxed/simple;
	bh=wmKP0b1OdLHqfOIuiaamyz4hO73xgp9scT/+8xNRG6g=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=JATVV/GLsny28xW7yVtVAgHujkomcPrQ4yNMpyNtKTSMWbVD4sVcmf95118NovGpTJY0272KMsJgu+1A4SfpMAKor+PquLdRK1m8RZSMnOYmXEE0UPG8Dw9UKVKhjsgfA8KQG5bqsufgRRnNUFSCrmbl0Yulkvn0ewxPPovaTYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:88f0:c83b:bafa:cdc3])
	by andre.telenet-ops.be with bizsmtp
	id hqFy2B0034efzLr01qFy7M; Thu, 01 Feb 2024 15:15:58 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rVXqL-00Gv4K-1a;
	Thu, 01 Feb 2024 15:15:58 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rVXrC-00AXas-1C;
	Thu, 01 Feb 2024 15:15:58 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Cong Dang <cong.dang.xn@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: r8a779h0: Add GPIO nodes
Date: Thu,  1 Feb 2024 15:15:56 +0100
Message-Id: <d4c1c40404ab84c7e7c07612077ca1a319ae7283.1706796918.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Cong Dang <cong.dang.xn@renesas.com>

Add device nodes for the General Purpose Input/Output (GPIO) blocks on
the Renesas R-Car V4M (R8A779H0) SoC.

Signed-off-by: Cong Dang <cong.dang.xn@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Changes compared to the BSP:
  - Correct module clock and reset for gpio[2-7] (verified by checking
    impacted registers on reset).
---
To be queued in renesas-devel for v6.9.

 arch/arm64/boot/dts/renesas/r8a779h0.dtsi | 120 ++++++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
index 8121aadaf6999429..eb555cbf51a41001 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
@@ -78,6 +78,126 @@ pfc: pinctrl@e6050000 {
 			      <0 0xe6061000 0 0x16c>, <0 0xe6061800 0 0x16c>;
 		};
 
+		gpio0: gpio@e6050180 {
+			compatible = "renesas,gpio-r8a779h0",
+				     "renesas,rcar-gen4-gpio";
+			reg = <0 0xe6050180 0 0x54>;
+			interrupts = <GIC_SPI 619 IRQ_TYPE_LEVEL_HIGH>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			gpio-ranges = <&pfc 0 0 19>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			clocks = <&cpg CPG_MOD 915>;
+			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
+			resets = <&cpg 915>;
+		};
+
+		gpio1: gpio@e6050980 {
+			compatible = "renesas,gpio-r8a779h0",
+				     "renesas,rcar-gen4-gpio";
+			reg = <0 0xe6050980 0 0x54>;
+			interrupts = <GIC_SPI 623 IRQ_TYPE_LEVEL_HIGH>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			gpio-ranges = <&pfc 0 32 30>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			clocks = <&cpg CPG_MOD 915>;
+			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
+			resets = <&cpg 915>;
+		};
+
+		gpio2: gpio@e6058180 {
+			compatible = "renesas,gpio-r8a779h0",
+				     "renesas,rcar-gen4-gpio";
+			reg = <0 0xe6058180 0 0x54>;
+			interrupts = <GIC_SPI 627 IRQ_TYPE_LEVEL_HIGH>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			gpio-ranges = <&pfc 0 64 20>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			clocks = <&cpg CPG_MOD 916>;
+			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
+			resets = <&cpg 916>;
+		};
+
+		gpio3: gpio@e6058980 {
+			compatible = "renesas,gpio-r8a779h0",
+				     "renesas,rcar-gen4-gpio";
+			reg = <0 0xe6058980 0 0x54>;
+			interrupts = <GIC_SPI 631 IRQ_TYPE_LEVEL_HIGH>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			gpio-ranges = <&pfc 0 96 32>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			clocks = <&cpg CPG_MOD 916>;
+			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
+			resets = <&cpg 916>;
+		};
+
+		gpio4: gpio@e6060180 {
+			compatible = "renesas,gpio-r8a779h0",
+				     "renesas,rcar-gen4-gpio";
+			reg = <0 0xe6060180 0 0x54>;
+			interrupts = <GIC_SPI 635 IRQ_TYPE_LEVEL_HIGH>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			gpio-ranges = <&pfc 0 128 25>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			clocks = <&cpg CPG_MOD 917>;
+			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
+			resets = <&cpg 917>;
+		};
+
+		gpio5: gpio@e6060980 {
+			compatible = "renesas,gpio-r8a779h0",
+				     "renesas,rcar-gen4-gpio";
+			reg = <0 0xe6060980 0 0x54>;
+			interrupts = <GIC_SPI 639 IRQ_TYPE_LEVEL_HIGH>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			gpio-ranges = <&pfc 0 160 21>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			clocks = <&cpg CPG_MOD 917>;
+			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
+			resets = <&cpg 917>;
+		};
+
+		gpio6: gpio@e6061180 {
+			compatible = "renesas,gpio-r8a779h0",
+				     "renesas,rcar-gen4-gpio";
+			reg = <0 0xe6061180 0 0x54>;
+			interrupts = <GIC_SPI 643 IRQ_TYPE_LEVEL_HIGH>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			gpio-ranges = <&pfc 0 192 21>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			clocks = <&cpg CPG_MOD 917>;
+			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
+			resets = <&cpg 917>;
+		};
+
+		gpio7: gpio@e6061980 {
+			compatible = "renesas,gpio-r8a779h0",
+				     "renesas,rcar-gen4-gpio";
+			reg = <0 0xe6061980 0 0x54>;
+			interrupts = <GIC_SPI 647 IRQ_TYPE_LEVEL_HIGH>;
+			#gpio-cells = <2>;
+			gpio-controller;
+			gpio-ranges = <&pfc 0 224 21>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			clocks = <&cpg CPG_MOD 917>;
+			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
+			resets = <&cpg 917>;
+		};
+
 		cpg: clock-controller@e6150000 {
 			compatible = "renesas,r8a779h0-cpg-mssr";
 			reg = <0 0xe6150000 0 0x4000>;
-- 
2.34.1


