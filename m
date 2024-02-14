Return-Path: <linux-renesas-soc+bounces-2766-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4913854A49
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Feb 2024 14:19:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 019EB1C203B8
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Feb 2024 13:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 561EB52F61;
	Wed, 14 Feb 2024 13:19:33 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50A33535D6
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Feb 2024 13:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707916773; cv=none; b=En+LOa5n3woUeU+voC7AVK8RTPWmw38JvH1cyHFpymNDDvmSvPQPOiLEaoIt9u85ANOe8EcKver0o3En1MplsiHLoaL+5oVs3SpCJIFjeIodk3gB6MLM4zhjv9uxxLAuGQ7+OG3S6utOVLAeCvaiXqssyRiPwgiLI3BAhlSof2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707916773; c=relaxed/simple;
	bh=fdZpcKsWbgMdXgiNUwOd5pOOT6MihfaaPGHVFtMibhY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=CQyBLUiru42cHKMbG2HVdsYseo3jpCd0ZJW8gftlQ9QPsNBG/MWrT5USgYQ/ZYv7PKgRh8MTolIJYRm6cOVwGBJyAiizaxUTSzOT905silkR8ZUnTduTE3cO2qJQ+YIZZJ9kTjqP4xmQedxh0TZNBAPCsMtb/7An9sJrzJFrLb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:ac52:3a54:2a84:d65a])
	by xavier.telenet-ops.be with bizsmtp
	id n1KV2B0040LVNSS011KVt0; Wed, 14 Feb 2024 14:19:29 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1raFAY-000d5t-DL;
	Wed, 14 Feb 2024 14:19:29 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1raFAf-00GvZ2-1o;
	Wed, 14 Feb 2024 14:19:29 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: r8a779h0: Add DMA support
Date: Wed, 14 Feb 2024 14:19:27 +0100
Message-Id: <44de886cd83f41659d2f6962c0e277f548fb0adb.1707916707.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device nodes for the Direct Memory Access Controllers for System
(SYS-DMAC) on the Renesas R-Car V4M (R8A779H0) SoC.

Link all DMA consumers to the corresponding DMA controller channels.

Based on patches in the BSP by Thanh Le and Minh Le.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-devel for v6.9.

HSCIF0 DMA tested by removing the uart_console() check from
sci_request_dma().
I2C0 DMA tested by removing the I2C_M_DMA_SAFE check from rcar_i2c_dma()
(the AT24 EEPROM driver uses regmap, thus can't set I2C_M_DMA_SAFE).

Changes compared to the BSP:
  - Mix and match multiple patches,
  - Add missing "renesas,rcar-gen4-dmac" compatible fallbacks,
  - Add HSCIF0 DMA.
---
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi | 75 +++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
index d50ed1989ef52da7..46c586f4e326959f 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779h0.dtsi
@@ -326,6 +326,9 @@ i2c0: i2c@e6500000 {
 			clocks = <&cpg CPG_MOD 518>;
 			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
 			resets = <&cpg 518>;
+			dmas = <&dmac1 0x91>, <&dmac1 0x90>,
+			       <&dmac2 0x91>, <&dmac2 0x90>;
+			dma-names = "tx", "rx", "tx", "rx";
 			i2c-scl-internal-delay-ns = <110>;
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -340,6 +343,9 @@ i2c1: i2c@e6508000 {
 			clocks = <&cpg CPG_MOD 519>;
 			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
 			resets = <&cpg 519>;
+			dmas = <&dmac1 0x93>, <&dmac1 0x92>,
+			       <&dmac2 0x93>, <&dmac2 0x92>;
+			dma-names = "tx", "rx", "tx", "rx";
 			i2c-scl-internal-delay-ns = <110>;
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -354,6 +360,9 @@ i2c2: i2c@e6510000 {
 			clocks = <&cpg CPG_MOD 520>;
 			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
 			resets = <&cpg 520>;
+			dmas = <&dmac1 0x95>, <&dmac1 0x94>,
+			       <&dmac2 0x95>, <&dmac2 0x94>;
+			dma-names = "tx", "rx", "tx", "rx";
 			i2c-scl-internal-delay-ns = <110>;
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -368,6 +377,9 @@ i2c3: i2c@e66d0000 {
 			clocks = <&cpg CPG_MOD 521>;
 			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
 			resets = <&cpg 521>;
+			dmas = <&dmac1 0x97>, <&dmac1 0x96>,
+			       <&dmac2 0x97>, <&dmac2 0x96>;
+			dma-names = "tx", "rx", "tx", "rx";
 			i2c-scl-internal-delay-ns = <110>;
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -385,6 +397,9 @@ hscif0: serial@e6540000 {
 			clock-names = "fck", "brg_int", "scif_clk";
 			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
 			resets = <&cpg 514>;
+			dmas = <&dmac1 0x31>, <&dmac1 0x30>,
+			       <&dmac2 0x31>, <&dmac2 0x30>;
+			dma-names = "tx", "rx", "tx", "rx";
 			status = "disabled";
 		};
 
@@ -532,6 +547,66 @@ avb2: ethernet@e6820000 {
 			status = "disabled";
 		};
 
+		dmac1: dma-controller@e7350000 {
+			compatible = "renesas,dmac-r8a779h0",
+				     "renesas,rcar-gen4-dmac";
+			reg = <0 0xe7350000 0 0x1000>,
+			      <0 0xe7300000 0 0x10000>;
+			interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 84 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 93 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "error",
+					  "ch0", "ch1", "ch2", "ch3", "ch4",
+					  "ch5", "ch6", "ch7", "ch8", "ch9",
+					  "ch10", "ch11", "ch12", "ch13",
+					  "ch14", "ch15";
+			clocks = <&cpg CPG_MOD 709>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
+			resets = <&cpg 709>;
+			#dma-cells = <1>;
+			dma-channels = <16>;
+		};
+
+		dmac2: dma-controller@e7351000 {
+			compatible = "renesas,dmac-r8a779h0",
+				     "renesas,rcar-gen4-dmac";
+			reg = <0 0xe7351000 0 0x1000>,
+			      <0 0xe7310000 0 0x10000>;
+			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "error",
+					  "ch0", "ch1", "ch2", "ch3", "ch4",
+					  "ch5", "ch6", "ch7";
+			clocks = <&cpg CPG_MOD 710>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A779H0_PD_ALWAYS_ON>;
+			resets = <&cpg 710>;
+			#dma-cells = <1>;
+			dma-channels = <8>;
+		};
+
 		mmc0: mmc@ee140000 {
 			compatible = "renesas,sdhi-r8a779h0",
 				     "renesas,rcar-gen4-sdhi";
-- 
2.34.1


