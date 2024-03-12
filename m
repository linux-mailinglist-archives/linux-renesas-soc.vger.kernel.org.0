Return-Path: <linux-renesas-soc+bounces-3708-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE38F87903E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Mar 2024 10:02:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C5541C20BA2
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Mar 2024 09:02:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0066277F1C;
	Tue, 12 Mar 2024 09:02:49 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F8777F11
	for <linux-renesas-soc@vger.kernel.org>; Tue, 12 Mar 2024 09:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710234168; cv=none; b=cQQEuUhA9L2NAGdLiCJNtGnNr8wMzWIvkZ6DTqdx0yp27Vcd8ltLB2y+7R0ZSYCEc8XZD2+wVxDCr75YkzyV/BRfnfItUnMHfF+RYBXYnEch5irp9NAUEWjwoO/hLwGEa4xjvECtkPc9GYOEtXQhoLzLWqBeL99FHGTbPTte/Pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710234168; c=relaxed/simple;
	bh=yW/D7IqB3pSvE0+j2coK6zhhsAszFhlfu+uBEQ80qUI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=TWIjK3l2N6XFyFXmOs2NzDzhnOeU2O3E88WI1xX7f0xcw9RxsQkobLgQJt1aWyARGKQpZDwYxI2uWxcQY++DqQid9yWirj+nrTqBf8q3L1K+ZMfy/jM77n+itMdQ5lr0iqX8Bh9RbtU1IfAXNGCwp0ZXVvzIO93Tr0LGZJ2aP9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
	by michel.telenet-ops.be with bizsmtp
	id xl2d2B00A0SSLxL06l2dJB; Tue, 12 Mar 2024 10:02:37 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rjy1d-003Qla-Aa;
	Tue, 12 Mar 2024 10:02:37 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rjy1t-005m6z-Gt;
	Tue, 12 Mar 2024 10:02:37 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/3] arm64: dts: renesas: r8a779h0: Add SCIF nodes
Date: Tue, 12 Mar 2024 10:02:35 +0100
Message-Id: <1285062a78f8ec810d2c93366c2c9dc1f883683f.1709741303.git.geert+renesas@glider.be>
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

Add device nodes for the Serial Communication Interfaces with FIFO
(SCIF) on the Renesas R-Car V4M (R8A779H0) SoC, including DMA support.

Based on a patch in the BSP by Nghia Nguyen.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Changes compared to the BSP:
  - Change reg size from 0x64 to 64,
  - Change "scif_clk2" to "scif_clk" in clock-names for SCIF4,
  - Add DMA properies.
---
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi | 68 +++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
index 4bad906bf2cb155b..3a40b56c4dcf113c 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
@@ -614,6 +614,74 @@ avb2: ethernet@e6820000 {
 			status = "disabled";
 		};
 
+		scif0: serial@e6e60000 {
+			compatible = "renesas,scif-r8a779h0",
+				     "renesas,rcar-gen4-scif", "renesas,scif";
+			reg = <0 0xe6e60000 0 64>;
+			interrupts = <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 702>,
+				 <&cpg CPG_CORE R8A779H0_CLK_SASYNCPERD1>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
+			resets = <&cpg 702>;
+			dmas = <&dmac1 0x51>, <&dmac1 0x50>,
+			       <&dmac2 0x51>, <&dmac2 0x50>;
+			dma-names = "tx", "rx", "tx", "rx";
+			status = "disabled";
+		};
+
+		scif1: serial@e6e68000 {
+			compatible = "renesas,scif-r8a779h0",
+				     "renesas,rcar-gen4-scif", "renesas,scif";
+			reg = <0 0xe6e68000 0 64>;
+			interrupts = <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 703>,
+				 <&cpg CPG_CORE R8A779H0_CLK_SASYNCPERD1>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
+			resets = <&cpg 703>;
+			dmas = <&dmac1 0x53>, <&dmac1 0x52>,
+			       <&dmac2 0x53>, <&dmac2 0x52>;
+			dma-names = "tx", "rx", "tx", "rx";
+			status = "disabled";
+		};
+
+		scif3: serial@e6c50000 {
+			compatible = "renesas,scif-r8a779h0",
+				     "renesas,rcar-gen4-scif", "renesas,scif";
+			reg = <0 0xe6c50000 0 64>;
+			interrupts = <GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 704>,
+				 <&cpg CPG_CORE R8A779H0_CLK_SASYNCPERD1>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
+			resets = <&cpg 704>;
+			dmas = <&dmac1 0x57>, <&dmac1 0x56>,
+			       <&dmac2 0x57>, <&dmac2 0x56>;
+			dma-names = "tx", "rx", "tx", "rx";
+			status = "disabled";
+		};
+
+		scif4: serial@e6c40000 {
+			compatible = "renesas,scif-r8a779h0",
+				     "renesas,rcar-gen4-scif", "renesas,scif";
+			reg = <0 0xe6c40000 0 64>;
+			interrupts = <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 705>,
+				 <&cpg CPG_CORE R8A779H0_CLK_SASYNCPERD1>,
+				 <&scif_clk2>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
+			resets = <&cpg 705>;
+			dmas = <&dmac1 0x59>, <&dmac1 0x58>,
+			       <&dmac2 0x59>, <&dmac2 0x58>;
+			dma-names = "tx", "rx", "tx", "rx";
+			status = "disabled";
+		};
+
 		dmac1: dma-controller@e7350000 {
 			compatible = "renesas,dmac-r8a779h0",
 				     "renesas,rcar-gen4-dmac";
-- 
2.34.1


