Return-Path: <linux-renesas-soc+bounces-3906-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CA088024F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Mar 2024 17:29:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1878F285F49
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 Mar 2024 16:29:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1D49657AD;
	Tue, 19 Mar 2024 16:29:15 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DE781AA7
	for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Mar 2024 16:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710865755; cv=none; b=sHdf7PzFXy2L4MZO8MKoQZmFcdp6Q9yVCoz0mxoA7cYfAzKq+aVm4SL4O48ziiV6335r98df/sfV/XTS5FNwf7Jg+sJ5iD95rHti9l+ztAk9l56bb84NXEjNN1qokuQwyaAwhBXJbV7AuGmRb/bA61Wx/XjOcR8Mz0zfN9DfpS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710865755; c=relaxed/simple;
	bh=yVZdXM25VeC0ej7icbzQEl7ACIZ/gRUXl+K4PHPyiqs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UQ33B0ebzlioPtt9RGeXfT6hzLDWj8ebRq0qR971iFyoHBhvfowiMPhJKN4rC2OKxYMJ5N38/xKEfXEi+g0tQn4yPiNuvr8FGWEqvDd+WvzmhTBanLm1l732xvOm+0xTJRU+EfOZUyUatUxkrHSfUtRj8Y0JZxIuU4gm8IxaJHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:76d0:2bff:fec8:549])
	by andre.telenet-ops.be with bizsmtp
	id 0gVA2C00P0SSLxL01gVA7V; Tue, 19 Mar 2024 17:29:11 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rmcKZ-0046H9-RM;
	Tue, 19 Mar 2024 17:29:10 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rmcKs-000pvW-OO;
	Tue, 19 Mar 2024 17:29:10 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/3] ARM: dts: renesas: rzg1: Add TMU nodes
Date: Tue, 19 Mar 2024 17:29:06 +0100
Message-Id: <b09f55e0089a9824d43e89fd6bac3cbd48f40d8b.1710864964.git.geert+renesas@glider.be>
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

Add device nodes for the Timer Units (TMU) on the RZ/G1H (R8A7742),
RZ/G1M (R8A7743), RZ/G1N (R8A7744), RZ/G1E (R8A7745), and RZ/G1C
(R8A77470) SoCs.

Note that TMU channel 0 on RZ/G1C is not added, as its module clock is
not documented.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/renesas/r8a7742.dtsi  | 58 +++++++++++++++++++++++++
 arch/arm/boot/dts/renesas/r8a7743.dtsi  | 58 +++++++++++++++++++++++++
 arch/arm/boot/dts/renesas/r8a7744.dtsi  | 58 +++++++++++++++++++++++++
 arch/arm/boot/dts/renesas/r8a7745.dtsi  | 58 +++++++++++++++++++++++++
 arch/arm/boot/dts/renesas/r8a77470.dtsi | 44 +++++++++++++++++++
 5 files changed, 276 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r8a7742.dtsi b/arch/arm/boot/dts/renesas/r8a7742.dtsi
index 16d146db824a09e6..d55c344c1cd2b151 100644
--- a/arch/arm/boot/dts/renesas/r8a7742.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7742.dtsi
@@ -404,6 +404,64 @@ irqc: interrupt-controller@e61c0000 {
 			resets = <&cpg 407>;
 		};
 
+		tmu0: timer@e61e0000 {
+			compatible = "renesas,tmu-r8a7742", "renesas,tmu";
+			reg = <0 0xe61e0000 0 0x30>;
+			interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2";
+			clocks = <&cpg CPG_MOD 125>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A7742_PD_ALWAYS_ON>;
+			resets = <&cpg 125>;
+			status = "disabled";
+		};
+
+		tmu1: timer@fff60000 {
+			compatible = "renesas,tmu-r8a7742", "renesas,tmu";
+			reg = <0 0xfff60000 0 0x30>;
+			interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
+			clocks = <&cpg CPG_MOD 111>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A7742_PD_ALWAYS_ON>;
+			resets = <&cpg 111>;
+			status = "disabled";
+		};
+
+		tmu2: timer@fff70000 {
+			compatible = "renesas,tmu-r8a7742", "renesas,tmu";
+			reg = <0 0xfff70000 0 0x30>;
+			interrupts = <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
+			clocks = <&cpg CPG_MOD 122>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A7742_PD_ALWAYS_ON>;
+			resets = <&cpg 122>;
+			status = "disabled";
+		};
+
+		tmu3: timer@fff80000 {
+			compatible = "renesas,tmu-r8a7742", "renesas,tmu";
+			reg = <0 0xfff80000 0 0x30>;
+			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2";
+			clocks = <&cpg CPG_MOD 121>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A7742_PD_ALWAYS_ON>;
+			resets = <&cpg 121>;
+			status = "disabled";
+		};
+
 		thermal: thermal@e61f0000 {
 			compatible = "renesas,thermal-r8a7742",
 				     "renesas,rcar-gen2-thermal";
diff --git a/arch/arm/boot/dts/renesas/r8a7743.dtsi b/arch/arm/boot/dts/renesas/r8a7743.dtsi
index 2245d19a23bb0a8b..d917c0a971f51b94 100644
--- a/arch/arm/boot/dts/renesas/r8a7743.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7743.dtsi
@@ -329,6 +329,64 @@ irqc: interrupt-controller@e61c0000 {
 			resets = <&cpg 407>;
 		};
 
+		tmu0: timer@e61e0000 {
+			compatible = "renesas,tmu-r8a7743", "renesas,tmu";
+			reg = <0 0xe61e0000 0 0x30>;
+			interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2";
+			clocks = <&cpg CPG_MOD 125>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A7743_PD_ALWAYS_ON>;
+			resets = <&cpg 125>;
+			status = "disabled";
+		};
+
+		tmu1: timer@fff60000 {
+			compatible = "renesas,tmu-r8a7743", "renesas,tmu";
+			reg = <0 0xfff60000 0 0x30>;
+			interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
+			clocks = <&cpg CPG_MOD 111>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A7743_PD_ALWAYS_ON>;
+			resets = <&cpg 111>;
+			status = "disabled";
+		};
+
+		tmu2: timer@fff70000 {
+			compatible = "renesas,tmu-r8a7743", "renesas,tmu";
+			reg = <0 0xfff70000 0 0x30>;
+			interrupts = <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
+			clocks = <&cpg CPG_MOD 122>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A7743_PD_ALWAYS_ON>;
+			resets = <&cpg 122>;
+			status = "disabled";
+		};
+
+		tmu3: timer@fff80000 {
+			compatible = "renesas,tmu-r8a7743", "renesas,tmu";
+			reg = <0 0xfff80000 0 0x30>;
+			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2";
+			clocks = <&cpg CPG_MOD 121>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A7743_PD_ALWAYS_ON>;
+			resets = <&cpg 121>;
+			status = "disabled";
+		};
+
 		thermal: thermal@e61f0000 {
 			compatible = "renesas,thermal-r8a7743",
 				     "renesas,rcar-gen2-thermal";
diff --git a/arch/arm/boot/dts/renesas/r8a7744.dtsi b/arch/arm/boot/dts/renesas/r8a7744.dtsi
index aa13841f978149bf..754859c38a939a90 100644
--- a/arch/arm/boot/dts/renesas/r8a7744.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7744.dtsi
@@ -329,6 +329,64 @@ irqc: interrupt-controller@e61c0000 {
 			resets = <&cpg 407>;
 		};
 
+		tmu0: timer@e61e0000 {
+			compatible = "renesas,tmu-r8a7744", "renesas,tmu";
+			reg = <0 0xe61e0000 0 0x30>;
+			interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2";
+			clocks = <&cpg CPG_MOD 125>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
+			resets = <&cpg 125>;
+			status = "disabled";
+		};
+
+		tmu1: timer@fff60000 {
+			compatible = "renesas,tmu-r8a7744", "renesas,tmu";
+			reg = <0 0xfff60000 0 0x30>;
+			interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
+			clocks = <&cpg CPG_MOD 111>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
+			resets = <&cpg 111>;
+			status = "disabled";
+		};
+
+		tmu2: timer@fff70000 {
+			compatible = "renesas,tmu-r8a7744", "renesas,tmu";
+			reg = <0 0xfff70000 0 0x30>;
+			interrupts = <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
+			clocks = <&cpg CPG_MOD 122>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
+			resets = <&cpg 122>;
+			status = "disabled";
+		};
+
+		tmu3: timer@fff80000 {
+			compatible = "renesas,tmu-r8a7744", "renesas,tmu";
+			reg = <0 0xfff80000 0 0x30>;
+			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2";
+			clocks = <&cpg CPG_MOD 121>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A7744_PD_ALWAYS_ON>;
+			resets = <&cpg 121>;
+			status = "disabled";
+		};
+
 		thermal: thermal@e61f0000 {
 			compatible = "renesas,thermal-r8a7744",
 				     "renesas,rcar-gen2-thermal";
diff --git a/arch/arm/boot/dts/renesas/r8a7745.dtsi b/arch/arm/boot/dts/renesas/r8a7745.dtsi
index 44688b8431c3f7b3..168298300490d31c 100644
--- a/arch/arm/boot/dts/renesas/r8a7745.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a7745.dtsi
@@ -304,6 +304,64 @@ irqc: interrupt-controller@e61c0000 {
 			resets = <&cpg 407>;
 		};
 
+		tmu0: timer@e61e0000 {
+			compatible = "renesas,tmu-r8a7745", "renesas,tmu";
+			reg = <0 0xe61e0000 0 0x30>;
+			interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2";
+			clocks = <&cpg CPG_MOD 125>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A7745_PD_ALWAYS_ON>;
+			resets = <&cpg 125>;
+			status = "disabled";
+		};
+
+		tmu1: timer@fff60000 {
+			compatible = "renesas,tmu-r8a7745", "renesas,tmu";
+			reg = <0 0xfff60000 0 0x30>;
+			interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
+			clocks = <&cpg CPG_MOD 111>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A7745_PD_ALWAYS_ON>;
+			resets = <&cpg 111>;
+			status = "disabled";
+		};
+
+		tmu2: timer@fff70000 {
+			compatible = "renesas,tmu-r8a7745", "renesas,tmu";
+			reg = <0 0xfff70000 0 0x30>;
+			interrupts = <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
+			clocks = <&cpg CPG_MOD 122>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A7745_PD_ALWAYS_ON>;
+			resets = <&cpg 122>;
+			status = "disabled";
+		};
+
+		tmu3: timer@fff80000 {
+			compatible = "renesas,tmu-r8a7745", "renesas,tmu";
+			reg = <0 0xfff80000 0 0x30>;
+			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2";
+			clocks = <&cpg CPG_MOD 121>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A7745_PD_ALWAYS_ON>;
+			resets = <&cpg 121>;
+			status = "disabled";
+		};
+
 		ipmmu_sy0: iommu@e6280000 {
 			compatible = "renesas,ipmmu-r8a7745",
 				     "renesas,ipmmu-vmsa";
diff --git a/arch/arm/boot/dts/renesas/r8a77470.dtsi b/arch/arm/boot/dts/renesas/r8a77470.dtsi
index a5cf663a0118ee1d..2375438d83c9d5b6 100644
--- a/arch/arm/boot/dts/renesas/r8a77470.dtsi
+++ b/arch/arm/boot/dts/renesas/r8a77470.dtsi
@@ -241,6 +241,50 @@ irqc: interrupt-controller@e61c0000 {
 			resets = <&cpg 407>;
 		};
 
+		tmu1: timer@fff60000 {
+			compatible = "renesas,tmu-r8a77470", "renesas,tmu";
+			reg = <0 0xfff60000 0 0x30>;
+			interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
+			clocks = <&cpg CPG_MOD 111>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
+			resets = <&cpg 111>;
+			status = "disabled";
+		};
+
+		tmu2: timer@fff70000 {
+			compatible = "renesas,tmu-r8a77470", "renesas,tmu";
+			reg = <0 0xfff70000 0 0x30>;
+			interrupts = <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
+			clocks = <&cpg CPG_MOD 122>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
+			resets = <&cpg 122>;
+			status = "disabled";
+		};
+
+		tmu3: timer@fff80000 {
+			compatible = "renesas,tmu-r8a77470", "renesas,tmu";
+			reg = <0 0xfff80000 0 0x30>;
+			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tuni0", "tuni1", "tuni2";
+			clocks = <&cpg CPG_MOD 121>;
+			clock-names = "fck";
+			power-domains = <&sysc R8A77470_PD_ALWAYS_ON>;
+			resets = <&cpg 121>;
+			status = "disabled";
+		};
+
 		icram0:	sram@e63a0000 {
 			compatible = "mmio-sram";
 			reg = <0 0xe63a0000 0 0x12000>;
-- 
2.34.1


