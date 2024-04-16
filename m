Return-Path: <linux-renesas-soc+bounces-4661-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61F7D8A6FD1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Apr 2024 17:30:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0104D1F220A1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 16 Apr 2024 15:30:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A08A130E2B;
	Tue, 16 Apr 2024 15:30:07 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F94130AE6
	for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Apr 2024 15:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713281407; cv=none; b=k7eRnbkMjMGDAK5aR2ZXeFKFqdngwSTcFOSDO238IMMLGg43eVmdPelAI9MIubAGiq5EV/bbO17+TCru0UDPmDSWrfZk/w05eQn7T62YDEs1GO4zeHQwDCccoPFRZQ1bRR3ViGonGCyZRh5L852TtGNcci7LxzFy48ioiNcSvMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713281407; c=relaxed/simple;
	bh=9Ze62x3cyDegW4OzG+PdsulzrkOy6kLKXqmZOGflre4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=K7F4n4IsAYeZZPosDWuBuPJ+m5WrLEDXOdDJaxLkGWUnvPjzQhlTkF3Sl143lT44G+jQTbmEHUo3ttCvC6DIASx6CeNDPInShKjjxEmuZudw5WUB+078qI5VH/bYGQZKodfbuuFpvXBfU+cVUKbXxPhcIwTjB5cihT/rbM/PB/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
	by michel.telenet-ops.be with bizsmtp
	id BrW12C00H0SSLxL06rW1oS; Tue, 16 Apr 2024 17:30:03 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rwkkP-008GuH-Qr;
	Tue, 16 Apr 2024 17:30:01 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rwkkz-00EbYk-8Y;
	Tue, 16 Apr 2024 17:30:01 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Thanh Quan <thanh.quan.xn@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: r8a779h0: Add MSIOF nodes
Date: Tue, 16 Apr 2024 17:29:59 +0200
Message-Id: <62d2a1424cabda06c53541d93f6a1a5110267a71.1713280753.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thanh Quan <thanh.quan.xn@renesas.com>

Add device nodes for the Clock-Synchronized Serial Interfaces with FIFO
(MSIOF) on the Renesas R-Car V4M (R8A779H0) SoC.

Signed-off-by: Thanh Quan <thanh.quan.xn@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
MSIOF1 and MSIOF2 were tested on the MSIOF Pin Headers on the Gray Hawk
Single development board with external loopback, using the
spi-loopback-test module and loopback=1.

To be queued in renesas-devel for v6.10.

Changes compared to the BSP:
  - Drop bogus MSO clock input,
  - Drop undocumented clock-names property,
  - Drop assigned-clock{,-rate}s properties on the MSO clock.
---
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi | 96 +++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
index 0e97799fa55aabc8..530219f21295f76f 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
@@ -826,6 +826,102 @@ scif4: serial@e6c40000 {
 			status = "disabled";
 		};
 
+		msiof0: spi@e6e90000 {
+			compatible = "renesas,msiof-r8a779h0",
+				     "renesas,rcar-gen4-msiof";
+			reg = <0 0xe6e90000 0 0x0064>;
+			interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 618>;
+			dmas = <&dmac1 0x41>, <&dmac1 0x40>,
+			       <&dmac2 0x41>, <&dmac2 0x40>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
+			resets = <&cpg 618>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		msiof1: spi@e6ea0000 {
+			compatible = "renesas,msiof-r8a779h0",
+				     "renesas,rcar-gen4-msiof";
+			reg = <0 0xe6ea0000 0 0x0064>;
+			interrupts = <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 619>;
+			dmas = <&dmac1 0x43>, <&dmac1 0x42>,
+			       <&dmac2 0x43>, <&dmac2 0x42>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
+			resets = <&cpg 619>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		msiof2: spi@e6c00000 {
+			compatible = "renesas,msiof-r8a779h0",
+				     "renesas,rcar-gen4-msiof";
+			reg = <0 0xe6c00000 0 0x0064>;
+			interrupts = <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 620>;
+			dmas = <&dmac1 0x45>, <&dmac1 0x44>,
+			       <&dmac2 0x45>, <&dmac2 0x44>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
+			resets = <&cpg 620>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		msiof3: spi@e6c10000 {
+			compatible = "renesas,msiof-r8a779h0",
+				     "renesas,rcar-gen4-msiof";
+			reg = <0 0xe6c10000 0 0x0064>;
+			interrupts = <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 621>;
+			dmas = <&dmac1 0x47>, <&dmac1 0x46>,
+			       <&dmac2 0x47>, <&dmac2 0x46>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
+			resets = <&cpg 621>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		msiof4: spi@e6c20000 {
+			compatible = "renesas,msiof-r8a779h0",
+				     "renesas,rcar-gen4-msiof";
+			reg = <0 0xe6c20000 0 0x0064>;
+			interrupts = <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 622>;
+			dmas = <&dmac1 0x49>, <&dmac1 0x48>,
+			       <&dmac2 0x49>, <&dmac2 0x48>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
+			resets = <&cpg 622>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		msiof5: spi@e6c28000 {
+			compatible = "renesas,msiof-r8a779h0",
+				     "renesas,rcar-gen4-msiof";
+			reg = <0 0xe6c28000 0 0x0064>;
+			interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 623>;
+			dmas = <&dmac1 0x4b>, <&dmac1 0x4a>,
+			       <&dmac2 0x4b>, <&dmac2 0x4a>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
+			resets = <&cpg 623>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		dmac1: dma-controller@e7350000 {
 			compatible = "renesas,dmac-r8a779h0",
 				     "renesas,rcar-gen4-dmac";
-- 
2.34.1


