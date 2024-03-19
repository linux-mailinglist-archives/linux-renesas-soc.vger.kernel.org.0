Return-Path: <linux-renesas-soc+bounces-3908-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9084880250
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Mar 2024 17:29:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9EB21C23135
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Mar 2024 16:29:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 088D2823C4;
	Tue, 19 Mar 2024 16:29:22 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from gauss.telenet-ops.be (gauss.telenet-ops.be [195.130.132.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FE60823C2
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Mar 2024 16:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710865761; cv=none; b=fgVa/HRTK4k5vLl9h4oQuYyOcydxqse16O7ABQrAXqWhNafPF0WANKaf9lD9kMSEhuY1l+bm0MD6QptsQ5JktTUvu/GDSmzi1/yiaNdQ5Geh1+HakaE9OhsEcOi2fYZb3/myaOmGjidZZDBZsAV8vNS9rbfoqc43dy0xtbkMlqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710865761; c=relaxed/simple;
	bh=MN1MrsyjgBwT8fByYfs0JiBMAdFruu6vG67PfvIihto=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Fb9icVn3Ib7xE2PRHzIZUKZAIlxRJeNjPRwL1cptmopUpz3sw0G4g7Ta83m+jfBLdbYSfF2V6fXCp4r0yz9Kr+OymToYMkfH1SSafpfI8DslVyD8zaItNpLKfYrRE0/lccbGsdR8XDJYAVkRmCi2ur1ozTJdK1AjYmZsavBxxuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
	by gauss.telenet-ops.be (Postfix) with ESMTPS id 4TzccZ3Dqrz4wyyb
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Mar 2024 17:29:18 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
	by xavier.telenet-ops.be with bizsmtp
	id 0gVA2C00S0SSLxL01gVAm9; Tue, 19 Mar 2024 17:29:11 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rmcKZ-0046H5-QX;
	Tue, 19 Mar 2024 17:29:10 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rmcKs-000pvS-MS;
	Tue, 19 Mar 2024 17:29:10 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/3] ARM: dts: renesas: r8a73a4: Add TMU nodes
Date: Tue, 19 Mar 2024 17:29:05 +0100
Message-Id: <1a60832f3ba37afb4a5791f4e5db4610ab31beb3.1710864964.git.geert+renesas@glider.be>
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

Add device nodes for the Timer Units (TMU) on the R-Mobile APE6 SoC,
and the clocks serving them.

Note that TMU channels 1 and 2 are not added, as their interrupts are
not wired to the interrupt controller for the AP-System Core (INTC-SYS),
only to the interrupt controller for the AP-Realtime Core (INTC-RT).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/renesas/r8a73a4.dtsi    | 37 +++++++++++++++++++++++
 include/dt-bindings/clock/r8a73a4-clock.h |  4 +++
 2 files changed, 41 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r8a73a4.dtsi b/arch/arm/boot/dts/renesas/r8a73a4.dtsi
index ac654ff45d0e9a9c..9a2ae282a46ba4b1 100644
--- a/arch/arm/boot/dts/renesas/r8a73a4.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a73a4.dtsi
@@ -60,6 +60,32 @@ timer {
 			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
 	};
 
+	tmu0: timer@e61e0000 {
+		compatible = "renesas,tmu-r8a73a4", "renesas,tmu";
+		reg = <0 0xe61e0000 0 0x30>;
+		interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "tuni0", "tuni1", "tuni2";
+		clocks = <&mstp1_clks R8A73A4_CLK_TMU0>;
+		clock-names = "fck";
+		power-domains = <&pd_c5>;
+		status = "disabled";
+	};
+
+	tmu3: timer@fff80000 {
+		compatible = "renesas,tmu-r8a73a4", "renesas,tmu";
+		reg = <0 0xfff80000 0 0x30>;
+		interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "tuni0", "tuni1", "tuni2";
+		clocks = <&mstp1_clks R8A73A4_CLK_TMU3>;
+		clock-names = "fck";
+		power-domains = <&pd_a3r>;
+		status = "disabled";
+	};
+
 	dbsc1: memory-controller@e6790000 {
 		compatible = "renesas,dbsc-r8a73a4";
 		reg = <0 0xe6790000 0 0x10000>;
@@ -654,6 +680,17 @@ extal1_div2_clk: extal1_div2 {
 		};
 
 		/* Gate clocks */
+		mstp1_clks: mstp1_clks@e6150134 {
+			compatible = "renesas,r8a73a4-mstp-clocks", "renesas,cpg-mstp-clocks";
+			reg = <0 0xe6150134 0 4>, <0 0xe6150038 0 4>;
+			clocks = <&cp_clk>, <&mp_clk>;
+			#clock-cells = <1>;
+			clock-indices = <
+				R8A73A4_CLK_TMU0 R8A73A4_CLK_TMU3
+			>;
+			clock-output-names =
+				"tmu0", "tmu3";
+		};
 		mstp2_clks: mstp2_clks@e6150138 {
 			compatible = "renesas,r8a73a4-mstp-clocks", "renesas,cpg-mstp-clocks";
 			reg = <0 0xe6150138 0 4>, <0 0xe6150040 0 4>;
diff --git a/include/dt-bindings/clock/r8a73a4-clock.h b/include/dt-bindings/clock/r8a73a4-clock.h
index 1ec4827b80916054..655440a3e7c6868a 100644
--- a/include/dt-bindings/clock/r8a73a4-clock.h
+++ b/include/dt-bindings/clock/r8a73a4-clock.h
@@ -24,6 +24,10 @@
 #define R8A73A4_CLK_ZS		14
 #define R8A73A4_CLK_HP		15
 
+/* MSTP1 */
+#define R8A73A4_CLK_TMU0	25
+#define R8A73A4_CLK_TMU3	21
+
 /* MSTP2 */
 #define R8A73A4_CLK_DMAC	18
 #define R8A73A4_CLK_SCIFB3	17
-- 
2.34.1


