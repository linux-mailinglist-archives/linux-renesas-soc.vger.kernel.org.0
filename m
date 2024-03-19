Return-Path: <linux-renesas-soc+bounces-3909-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C18880251
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Mar 2024 17:30:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07C3E2860B3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Mar 2024 16:29:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5353B1E4A9;
	Tue, 19 Mar 2024 16:29:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from gauss.telenet-ops.be (gauss.telenet-ops.be [195.130.132.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE9D823DF
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Mar 2024 16:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710865762; cv=none; b=s5hzRNK4LDpvIceoSuddU0R1O/84Cd5T5jXq3O9M18yX53HeWfWt9NTXMwQpTX51jT7bpMWhHJ0JquwgMncjbbqpYKLujGqYZyu2o7TqU0Uj3fXpfoWePviNcbvaC+KvljNs+eMMEByOy4pTpFZnhBLb/7xVcB3giyroudtlMHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710865762; c=relaxed/simple;
	bh=M0dWC6PkSJ5Le+3m+9XhjARVhHGA6nIWkPBKaULsaKs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=STaAGIEgxSlU0ttjsO0esS3L4Kc7tHsbNW+wl+7ZyztrZG1yKeBAxkGHHNg1Bh12Qyh/e2xoXDzAxI63k1H1WA9hhr7AEyc11G50LxKCnetQN6/Jp2akw4fBc+PF+0dGTXwjYciCD/Jz4zdbZrXwCPT03gB5pXKJvDBJUxftArs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
	by gauss.telenet-ops.be (Postfix) with ESMTPS id 4TzccZ38Bbz4wxKP
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Mar 2024 17:29:18 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
	by xavier.telenet-ops.be with bizsmtp
	id 0gVA2C00U0SSLxL01gVAmA; Tue, 19 Mar 2024 17:29:11 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rmcKZ-0046HA-S3;
	Tue, 19 Mar 2024 17:29:10 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rmcKs-000pva-PW;
	Tue, 19 Mar 2024 17:29:10 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/3] ARM: dts: renesas: rcar-gen2: Add TMU nodes
Date: Tue, 19 Mar 2024 17:29:07 +0100
Message-Id: <7efbc8dbac6876f454011563edc1ae8eb50c95db.1710864964.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1710864964.git.geert+renesas@glider.be>
References: <cover.1710864964.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device nodes for the Timer Units (TMU) on the R-Car H2 (R8A7790),
M2-W (R8A7791), V2H (R8A7792), M2-N (R8A7793), and E2 (R8A7794) SoCs.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/renesas/r8a7790.dtsi | 58 +++++++++++++++++++++++++
 arch/arm/boot/dts/renesas/r8a7791.dtsi | 58 +++++++++++++++++++++++++
 arch/arm/boot/dts/renesas/r8a7792.dtsi | 59 ++++++++++++++++++++++++++
 arch/arm/boot/dts/renesas/r8a7793.dtsi | 58 +++++++++++++++++++++++++
 arch/arm/boot/dts/renesas/r8a7794.dtsi | 58 +++++++++++++++++++++++++
 5 files changed, 291 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r8a7790.dtsi b/arch/arm/boot/dts/renesas/r8a7790.dtsi
index 46fb81f5062ff6bc..583b74a9f071c39e 100644
--- a/arch/arm/boot/dts/renesas/r8a7790.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7790.dtsi
@@ -434,6 +434,64 @@ irqc0: interrupt-controller@e61c0000 {
 			resets = <&cpg 407>;
 		};
 
+		tmu0: timer@e61e0000 {
+			compatible = "renesas,tmu-r8a7790", "renesas,tmu";
+			reg = <0 0xe61e0000 0 0x30>;
+			interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2";
+			clocks = <&cpg CPG_MOD 125>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
+			resets = <&cpg 125>;
+			status = "disabled";
+		};
+
+		tmu1: timer@fff60000 {
+			compatible = "renesas,tmu-r8a7790", "renesas,tmu";
+			reg = <0 0xfff60000 0 0x30>;
+			interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
+			clocks = <&cpg CPG_MOD 111>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
+			resets = <&cpg 111>;
+			status = "disabled";
+		};
+
+		tmu2: timer@fff70000 {
+			compatible = "renesas,tmu-r8a7790", "renesas,tmu";
+			reg = <0 0xfff70000 0 0x30>;
+			interrupts = <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
+			clocks = <&cpg CPG_MOD 122>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
+			resets = <&cpg 122>;
+			status = "disabled";
+		};
+
+		tmu3: timer@fff80000 {
+			compatible = "renesas,tmu-r8a7790", "renesas,tmu";
+			reg = <0 0xfff80000 0 0x30>;
+			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2";
+			clocks = <&cpg CPG_MOD 121>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A7790_PD_ALWAYS_ON>;
+			resets = <&cpg 121>;
+			status = "disabled";
+		};
+
 		thermal: thermal@e61f0000 {
 			compatible = "renesas,thermal-r8a7790",
 				     "renesas,rcar-gen2-thermal",
diff --git a/arch/arm/boot/dts/renesas/r8a7791.dtsi b/arch/arm/boot/dts/renesas/r8a7791.dtsi
index b9d34147628e1201..de08ceb62230b6dd 100644
--- a/arch/arm/boot/dts/renesas/r8a7791.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7791.dtsi
@@ -351,6 +351,64 @@ irqc0: interrupt-controller@e61c0000 {
 			resets = <&cpg 407>;
 		};
 
+		tmu0: timer@e61e0000 {
+			compatible = "renesas,tmu-r8a7791", "renesas,tmu";
+			reg = <0 0xe61e0000 0 0x30>;
+			interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2";
+			clocks = <&cpg CPG_MOD 125>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A7791_PD_ALWAYS_ON>;
+			resets = <&cpg 125>;
+			status = "disabled";
+		};
+
+		tmu1: timer@fff60000 {
+			compatible = "renesas,tmu-r8a7791", "renesas,tmu";
+			reg = <0 0xfff60000 0 0x30>;
+			interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
+			clocks = <&cpg CPG_MOD 111>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A7791_PD_ALWAYS_ON>;
+			resets = <&cpg 111>;
+			status = "disabled";
+		};
+
+		tmu2: timer@fff70000 {
+			compatible = "renesas,tmu-r8a7791", "renesas,tmu";
+			reg = <0 0xfff70000 0 0x30>;
+			interrupts = <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
+			clocks = <&cpg CPG_MOD 122>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A7791_PD_ALWAYS_ON>;
+			resets = <&cpg 122>;
+			status = "disabled";
+		};
+
+		tmu3: timer@fff80000 {
+			compatible = "renesas,tmu-r8a7791", "renesas,tmu";
+			reg = <0 0xfff80000 0 0x30>;
+			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2";
+			clocks = <&cpg CPG_MOD 121>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A7791_PD_ALWAYS_ON>;
+			resets = <&cpg 121>;
+			status = "disabled";
+		};
+
 		thermal: thermal@e61f0000 {
 			compatible = "renesas,thermal-r8a7791",
 				     "renesas,rcar-gen2-thermal",
diff --git a/arch/arm/boot/dts/renesas/r8a7792.dtsi b/arch/arm/boot/dts/renesas/r8a7792.dtsi
index ecfab3ff59e843ff..7defeb8e4cd1f499 100644
--- a/arch/arm/boot/dts/renesas/r8a7792.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7792.dtsi
@@ -351,6 +351,65 @@ irqc: interrupt-controller@e61c0000 {
 			resets = <&cpg 407>;
 		};
 
+		tmu0: timer@e61e0000 {
+			compatible = "renesas,tmu-r8a7792", "renesas,tmu";
+			reg = <0 0xe61e0000 0 0x30>;
+			interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2";
+			clocks = <&cpg CPG_MOD 125>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A7792_PD_ALWAYS_ON>;
+			resets = <&cpg 125>;
+			status = "disabled";
+		};
+
+		tmu1: timer@fff60000 {
+			compatible = "renesas,tmu-r8a7792", "renesas,tmu";
+			reg = <0 0xfff60000 0 0x30>;
+			interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
+			clocks = <&cpg CPG_MOD 111>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A7792_PD_ALWAYS_ON>;
+			resets = <&cpg 111>;
+			status = "disabled";
+		};
+
+		tmu2: timer@fff70000 {
+			compatible = "renesas,tmu-r8a7792", "renesas,tmu";
+			reg = <0 0xfff70000 0 0x30>;
+			interrupts = <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
+			clocks = <&cpg CPG_MOD 122>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A7792_PD_ALWAYS_ON>;
+			resets = <&cpg 122>;
+			status = "disabled";
+		};
+
+		tmu3: timer@fff80000 {
+			compatible = "renesas,tmu-r8a7792", "renesas,tmu";
+			reg = <0 0xfff80000 0 0x30>;
+			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
+			clocks = <&cpg CPG_MOD 121>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A7792_PD_ALWAYS_ON>;
+			resets = <&cpg 121>;
+			status = "disabled";
+		};
+
 		icram0:	sram@e63a0000 {
 			compatible = "mmio-sram";
 			reg = <0 0xe63a0000 0 0x12000>;
diff --git a/arch/arm/boot/dts/renesas/r8a7793.dtsi b/arch/arm/boot/dts/renesas/r8a7793.dtsi
index f51bf687f4bd55d3..d32a9d5d3faa71fc 100644
--- a/arch/arm/boot/dts/renesas/r8a7793.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7793.dtsi
@@ -326,6 +326,64 @@ irqc0: interrupt-controller@e61c0000 {
 			resets = <&cpg 407>;
 		};
 
+		tmu0: timer@e61e0000 {
+			compatible = "renesas,tmu-r8a7793", "renesas,tmu";
+			reg = <0 0xe61e0000 0 0x30>;
+			interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2";
+			clocks = <&cpg CPG_MOD 125>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A7793_PD_ALWAYS_ON>;
+			resets = <&cpg 125>;
+			status = "disabled";
+		};
+
+		tmu1: timer@fff60000 {
+			compatible = "renesas,tmu-r8a7793", "renesas,tmu";
+			reg = <0 0xfff60000 0 0x30>;
+			interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
+			clocks = <&cpg CPG_MOD 111>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A7793_PD_ALWAYS_ON>;
+			resets = <&cpg 111>;
+			status = "disabled";
+		};
+
+		tmu2: timer@fff70000 {
+			compatible = "renesas,tmu-r8a7793", "renesas,tmu";
+			reg = <0 0xfff70000 0 0x30>;
+			interrupts = <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
+			clocks = <&cpg CPG_MOD 122>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A7793_PD_ALWAYS_ON>;
+			resets = <&cpg 122>;
+			status = "disabled";
+		};
+
+		tmu3: timer@fff80000 {
+			compatible = "renesas,tmu-r8a7793", "renesas,tmu";
+			reg = <0 0xfff80000 0 0x30>;
+			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2";
+			clocks = <&cpg CPG_MOD 121>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A7793_PD_ALWAYS_ON>;
+			resets = <&cpg 121>;
+			status = "disabled";
+		};
+
 		thermal: thermal@e61f0000 {
 			compatible = "renesas,thermal-r8a7793",
 				     "renesas,rcar-gen2-thermal",
diff --git a/arch/arm/boot/dts/renesas/r8a7794.dtsi b/arch/arm/boot/dts/renesas/r8a7794.dtsi
index 371dd4715ddef83d..f37f094cecc8c399 100644
--- a/arch/arm/boot/dts/renesas/r8a7794.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7794.dtsi
@@ -292,6 +292,64 @@ irqc0: interrupt-controller@e61c0000 {
 			resets = <&cpg 407>;
 		};
 
+		tmu0: timer@e61e0000 {
+			compatible = "renesas,tmu-r8a7794", "renesas,tmu";
+			reg = <0 0xe61e0000 0 0x30>;
+			interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2";
+			clocks = <&cpg CPG_MOD 125>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A7794_PD_ALWAYS_ON>;
+			resets = <&cpg 125>;
+			status = "disabled";
+		};
+
+		tmu1: timer@fff60000 {
+			compatible = "renesas,tmu-r8a7794", "renesas,tmu";
+			reg = <0 0xfff60000 0 0x30>;
+			interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
+			clocks = <&cpg CPG_MOD 111>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A7794_PD_ALWAYS_ON>;
+			resets = <&cpg 111>;
+			status = "disabled";
+		};
+
+		tmu2: timer@fff70000 {
+			compatible = "renesas,tmu-r8a7794", "renesas,tmu";
+			reg = <0 0xfff70000 0 0x30>;
+			interrupts = <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
+			clocks = <&cpg CPG_MOD 122>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A7794_PD_ALWAYS_ON>;
+			resets = <&cpg 122>;
+			status = "disabled";
+		};
+
+		tmu3: timer@fff80000 {
+			compatible = "renesas,tmu-r8a7794", "renesas,tmu";
+			reg = <0 0xfff80000 0 0x30>;
+			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2";
+			clocks = <&cpg CPG_MOD 121>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A7794_PD_ALWAYS_ON>;
+			resets = <&cpg 121>;
+			status = "disabled";
+		};
+
 		ipmmu_sy0: iommu@e6280000 {
 			compatible = "renesas,ipmmu-r8a7794",
 				     "renesas,ipmmu-vmsa";
-- 
2.34.1


