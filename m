Return-Path: <linux-renesas-soc+bounces-24918-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EC653C78C0F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 12:20:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id ACF564F02B4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 11:16:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D94CF34C13D;
	Fri, 21 Nov 2025 11:15:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C97934B1A6;
	Fri, 21 Nov 2025 11:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763723726; cv=none; b=hvvp8eYNvjIzk8/y4AbARlUhOJkx0pizEkU4TtGyr7byfltSzcKB8xWT1hkvbQnkMoubtsGZRGSpQpAI9znMioPYlr2EsB4aj17Cu4y0my9CkI/TKmdhqN1deQR07bBr1qu8r7Ff0fhUwUNWpraEePMDgwsSc3+XsqhZVTRCpik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763723726; c=relaxed/simple;
	bh=hPI3ZPH4JOP8rwIM8cIvXKiDoUeRag5WDQC7mqBg0b8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L9r7fsluPomkuQkeJsxLGPQJYyV5UJJ45iVNl4IOaxLFh8vX6uHh2gqkdtYL71NEF9kYqctWepZa1riSi8LVJvSCDYXIzV8nx9MSgAo/NZF1M4Y0R5x0oSIfrx4e4zr7LP2k4LCEsNgU2JprTEs9PoBUm+YRa/XSnE45mOMnscE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: +10bNQJzTjGcOIDis63jWQ==
X-CSE-MsgGUID: zece/wgmRAy0a7xB6HMGqA==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 21 Nov 2025 20:15:23 +0900
Received: from demon-pc.localdomain (unknown [10.226.92.224])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id C508D430ED4F;
	Fri, 21 Nov 2025 20:15:19 +0900 (JST)
From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 3/4] arm64: dts: renesas: r9a09g077: add ICU support
Date: Fri, 21 Nov 2025 13:14:22 +0200
Message-ID: <20251121111423.1379395-4-cosmin-gabriel.tanislav.xa@renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251121111423.1379395-1-cosmin-gabriel.tanislav.xa@renesas.com>
References: <20251121111423.1379395-1-cosmin-gabriel.tanislav.xa@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Renesas RZ/T2H (R9A09G077) SoC has an Interrupt Controller (ICU)
block that routes external interrupts to the GIC's SPIs, with the
ability of level-translation, and can also produce software
and aggregate error interrupts.

Add support for it.

Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 73 ++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index f80c6d603eea..0af41287e6a8 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
@@ -862,6 +862,79 @@ cpg: clock-controller@80280000 {
 			#power-domain-cells = <0>;
 		};
 
+		icu: interrupt-controller@802a0000 {
+			compatible = "renesas,r9a09g077-icu";
+			reg = <0 0x802a0000 0 0x10000>,
+			      <0 0x812a0000 0 0x50>;
+			#interrupt-cells = <2>;
+			#address-cells = <0>;
+			interrupt-controller;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 1 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 2 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 3 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 4 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 5 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 6 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 7 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 8 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 9 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 10 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 11 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 12 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 13 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 14 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 15 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 16 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 17 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 18 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 19 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 20 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 21 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 22 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 23 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 24 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 25 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 26 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 27 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 28 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 29 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 30 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 31 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 406 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 407 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 408 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 409 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 410 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 411 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 412 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 413 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 414 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 415 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 416 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 417 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 418 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "intcpu0", "intcpu1", "intcpu2",
+					  "intcpu3", "intcpu4", "intcpu5",
+					  "intcpu6", "intcpu7", "intcpu8",
+					  "intcpu9", "intcpu10", "intcpu11",
+					  "intcpu12", "intcpu13", "intcpu14",
+					  "intcpu15",
+					  "irq0", "irq1", "irq2", "irq3",
+					  "irq4", "irq5", "irq6", "irq7",
+					  "irq8", "irq9", "irq10", "irq11",
+					  "irq12", "irq13", "irq14", "irq15",
+					  "sei",
+					  "ca55-err0", "ca55-err1",
+					  "cr520-err0", "cr520-err1",
+					  "cr521-err0", "cr521-err1",
+					  "peri-err0", "peri-err1",
+					  "dsmif-err0", "dsmif-err1",
+					  "encif-err0", "encif-err1";
+			clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKM>;
+			power-domains = <&cpg>;
+		};
+
 		pinctrl: pinctrl@802c0000 {
 			compatible = "renesas,r9a09g077-pinctrl";
 			reg = <0 0x802c0000 0 0x10000>,
-- 
2.52.0


