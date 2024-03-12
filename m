Return-Path: <linux-renesas-soc+bounces-3709-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D1A87903F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Mar 2024 10:03:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02D0B1C208E6
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Mar 2024 09:03:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AB4177F11;
	Tue, 12 Mar 2024 09:02:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be [195.130.137.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DD842A9E
	for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Mar 2024 09:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710234178; cv=none; b=lRlx/tpiqtdtg1lY61wjzrmk+ZVekxNz0sB9NTRaZcrlaEIhLmpADCEXqzVY6IueCnP4K6ejfSa6hODYYmG3ShjoaFC5v0oHSw+we2A3sCSGA2VAOXAq0mptU7PfaTrOhWpxBx33XyAppQkWplzZNzRwtdtLYRn82k9g5qQ2wAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710234178; c=relaxed/simple;
	bh=iD/W2a9ZSXtJIQfssGy8cG1AyyNr/CLyuH7LZ/Cq3sM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MnZTjsjjCQ27YtwaKl2J+Dptnj95rimCnIAqJfrJHwqAILyuWZQ5bJ1VldodL6Q5fBQKZAHuYTw1wRWpcZ7wKkNPDYZEGklMLSJAGYiatsY5/h+l4E3Lu5kaQEY5EJgJGeB95AeTs2qhCtBtJtGLXCNjgcWhlYFJ9nIj49oaHeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
	by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4Tv72c5dWXz4x1R0
	for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Mar 2024 10:02:48 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
	by baptiste.telenet-ops.be with bizsmtp
	id xl2d2B00J0SSLxL01l2d1Z; Tue, 12 Mar 2024 10:02:41 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rjy1d-003QlX-9p;
	Tue, 12 Mar 2024 10:02:37 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rjy1t-005m6v-G6;
	Tue, 12 Mar 2024 10:02:37 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/3] arm64: dts: renesas: r8a779h0: Add remaining HSCIF nodes
Date: Tue, 12 Mar 2024 10:02:34 +0100
Message-Id: <b39f081db01fde2d1bf83a193f25b295cfeb002d.1709741303.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1709741303.git.geert+renesas@glider.be>
References: <cover.1709741303.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device nodes for the remaining High Speed Serial Communication
Interfaces with FIFO (HSCIF) on the Renesas R-Car V4M (R8A779H0) SoC,
including DMA support and the optional external clock source used by
HSCIF2.

Based on a patch in the BSP by Nghia Nguyen.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Changes compared to the BSP:
  - Update External SCIF clock comment for multiple clocks,
  - Insert "-clk" into scif2 clock node name,
  - Change "scif_clk2" to "scif_clk" in clock-names for HSCIF2,
  - Add DMA properies.
---
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi | 59 ++++++++++++++++++++++-
 1 file changed, 58 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
index a01929231e08fa30..4bad906bf2cb155b 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
@@ -144,13 +144,19 @@ psci {
 		method = "smc";
 	};
 
-	/* External SCIF clock - to be overridden by boards that provide it */
+	/* External SCIF clocks - to be overridden by boards that provide them */
 	scif_clk: scif-clk {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <0>;
 	};
 
+	scif_clk2: scif-clk2 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <0>;
+	};
+
 	soc: soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&gic>;
@@ -413,6 +419,57 @@ hscif0: serial@e6540000 {
 			status = "disabled";
 		};
 
+		hscif1: serial@e6550000 {
+			compatible = "renesas,hscif-r8a779h0",
+				     "renesas,rcar-gen4-hscif", "renesas,hscif";
+			reg = <0 0xe6550000 0 0x60>;
+			interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 515>,
+				 <&cpg CPG_CORE R8A779H0_CLK_SASYNCPERD1>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
+			resets = <&cpg 515>;
+			dmas = <&dmac1 0x33>, <&dmac1 0x32>,
+			       <&dmac2 0x33>, <&dmac2 0x32>;
+			dma-names = "tx", "rx", "tx", "rx";
+			status = "disabled";
+		};
+
+		hscif2: serial@e6560000 {
+			compatible = "renesas,hscif-r8a779h0",
+				     "renesas,rcar-gen4-hscif", "renesas,hscif";
+			reg = <0 0xe6560000 0 0x60>;
+			interrupts = <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 516>,
+				 <&cpg CPG_CORE R8A779H0_CLK_SASYNCPERD1>,
+				 <&scif_clk2>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
+			resets = <&cpg 516>;
+			dmas = <&dmac1 0x35>, <&dmac1 0x34>,
+			       <&dmac2 0x35>, <&dmac2 0x34>;
+			dma-names = "tx", "rx", "tx", "rx";
+			status = "disabled";
+		};
+
+		hscif3: serial@e66a0000 {
+			compatible = "renesas,hscif-r8a779h0",
+				     "renesas,rcar-gen4-hscif", "renesas,hscif";
+			reg = <0 0xe66a0000 0 0x60>;
+			interrupts = <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 517>,
+				 <&cpg CPG_CORE R8A779H0_CLK_SASYNCPERD1>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
+			resets = <&cpg 517>;
+			dmas = <&dmac1 0x37>, <&dmac1 0x36>,
+			       <&dmac2 0x37>, <&dmac2 0x36>;
+			dma-names = "tx", "rx", "tx", "rx";
+			status = "disabled";
+		};
+
 		avb0: ethernet@e6800000 {
 			compatible = "renesas,etheravb-r8a779h0",
 				     "renesas,etheravb-rcar-gen4";
-- 
2.34.1


