Return-Path: <linux-renesas-soc+bounces-7793-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C481F94E304
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 11 Aug 2024 22:50:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EA5EF1C20DC3
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 11 Aug 2024 20:50:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F63115C147;
	Sun, 11 Aug 2024 20:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nFZUXcFg"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8354C224D6;
	Sun, 11 Aug 2024 20:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723409416; cv=none; b=nXZ60EGbY+rzGdkwZNhsm9RA/8phQCuJI3wTQ89aVA0PHg8FjVMu7U9F2nK2wzygsO8QnVum1w4lYG5q+Mbk7WNSNPUgFxUAjaSnHzfXEOqAU/srD1Bv0ujqaPwwEJBzu1CZ+WwEqdPhbCq7pal6haerdNPFj9VmkP2nQ8GvfKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723409416; c=relaxed/simple;
	bh=m3MxUas58rNZnmnZr0HMY5fnf9h0ZDYb+xLqPZ5Boa8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=A6iV8u+S/L7RrR1DHyN9P6sEq/PV9aAw8Z5eitY0nEsNWCBSNr/kfH6d7OifM9Q37fVOGlA+ml6c2sRgvMrbmFLF0xUZaYvRrx6vOrkFsXNNfLEN58386FBt2pnp+t8Sn/CF2yNaR94HXK3eY8Mzzmf5zKnj3qUPWQjeBKwDYBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nFZUXcFg; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4280bca3960so28779455e9.3;
        Sun, 11 Aug 2024 13:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723409413; x=1724014213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kuAPUmp28L8vOpShl3W2r7DMDmqMsPJY/XVsnIima5c=;
        b=nFZUXcFgJ6szrKdjhPMIt7n5YwVI1eFmnHNCVFnbDQcWdlv7pLX5gdrEF04CwkanrZ
         LgtEc9CCMWn5ol8MzTMus/KoFKYprxFk6aBFT276JpHq1AvMDhoYvO8dFG0DWs16DcDG
         XHiI3WalMLO0sXGHZAssMXdyszBZR6YcdOADyTt9u+haAG9/8jZpoxQ5leuZJSwLR/x/
         uqQ7N8uaRJkfph1zrx7GEXS1c0JGQFDtBPUmVEbDg1yIqSqVouUJlF1oN4MJLGlPugg/
         iLhq8zk9fhZpUdIiqUUtLW1u+vi3VcngrMd+gcXjIKcDgBED6wyetvl3ukn0IP7ARIsM
         GPTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723409413; x=1724014213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kuAPUmp28L8vOpShl3W2r7DMDmqMsPJY/XVsnIima5c=;
        b=am7H0+GdfKZIn9JxDLbLpdzXogCUoKjJ0syU3yKt8J6A7zRY2lU7sCqpZ/5iMZ72Mf
         KUjTsTV45tK07oxlCgv+z2g8fnoo/lH+5cG8Jm955MHtxYYpE/ycXt+Udk4uOkShTsfp
         tg8ASlGYOcXI9Aj1lm6HUSvs8eKx0OSJ3yxhc2HEmXys8vFogVmxrA6HwJxhtNwHab6k
         bKhlyA4alJTAJulBhywgzpjLEkAW2f95c6XGFiFEnU30DE1XbF6h6beamWs3SsE+ir90
         22MU++pDjjTRzQ1q35vjl09E+yywynp6wjtMFUtoL+hDMaiY50opk7PlxdgEbuUHt2Cw
         6eQg==
X-Forwarded-Encrypted: i=1; AJvYcCX2jlyMnQiYiz6Xcb7IaE2K68S0s4vR7Nq7iUgJz3PKBH4ieykY33sWF7t9M69B4o2npBkm/VKzVR550jMEdeyAFuP4FbVsL6sOoX0gZ2N2ticjDVO39nO3eMAYENuqMi/hWedQGWJdhw==
X-Gm-Message-State: AOJu0YzD+F0pExJkkZoIbdUIxHeK6Jgy0FK1hx3ug+DBBELgsOOSg/+P
	HS5GeTqs0JVYQ6SZG4FnnCZkqs1QFavvMn+f83wAG5NMze31ba0k
X-Google-Smtp-Source: AGHT+IE5uqH+lixFmZiYsbf9ikQbKU21hXFaGzPj8rEFDKSbL334COGp2mD6sch61RPD7CgCFdLdNQ==
X-Received: by 2002:a05:600c:3555:b0:428:1090:cfd4 with SMTP id 5b1f17b1804b1-429c3a5af4dmr47953145e9.33.1723409412502;
        Sun, 11 Aug 2024 13:50:12 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429c750f0absm76421845e9.17.2024.08.11.13.50.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 13:50:11 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 1/8] arm64: dts: renesas: Add initial SoC DTSI for RZ/V2H(P) SoC
Date: Sun, 11 Aug 2024 21:49:48 +0100
Message-Id: <20240811204955.270231-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240811204955.270231-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240811204955.270231-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add initial SoC DTSI for Renesas RZ/V2H(P) ("R9A09G057") SoC, below are
the list of blocks added:
- EXT CLKs
- 4X CA55
- SCIF
- PFC
- CPG
- SYS
- GIC
- ARMv8 Timer

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2
- Updated commit description
---
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 165 +++++++++++++++++++++
 1 file changed, 165 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g057.dtsi

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
new file mode 100644
index 000000000000..cf890026e284
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -0,0 +1,165 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/V2H(P) SoC
+ *
+ * Copyright (C) 2024 Renesas Electronics Corp.
+ */
+
+#include <dt-bindings/clock/renesas,r9a09g057-cpg.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	compatible = "renesas,r9a09g057";
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	audio_extal_clk: audio-clk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board */
+		clock-frequency = <0>;
+	};
+
+	rtxin_clk: rtxin-clk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board */
+		clock-frequency = <0>;
+	};
+
+	qextal_clk: qextal-clk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board */
+		clock-frequency = <0>;
+	};
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			compatible = "arm,cortex-a55";
+			reg = <0>;
+			device_type = "cpu";
+			next-level-cache = <&L3_CA55>;
+			enable-method = "psci";
+		};
+
+		cpu1: cpu@100 {
+			compatible = "arm,cortex-a55";
+			reg = <0x100>;
+			device_type = "cpu";
+			next-level-cache = <&L3_CA55>;
+			enable-method = "psci";
+		};
+
+		cpu2: cpu@200 {
+			compatible = "arm,cortex-a55";
+			reg = <0x200>;
+			device_type = "cpu";
+			next-level-cache = <&L3_CA55>;
+			enable-method = "psci";
+		};
+
+		cpu3: cpu@300 {
+			compatible = "arm,cortex-a55";
+			reg = <0x300>;
+			device_type = "cpu";
+			next-level-cache = <&L3_CA55>;
+			enable-method = "psci";
+		};
+
+		L3_CA55: cache-controller-0 {
+			compatible = "cache";
+			cache-unified;
+			cache-size = <0x100000>;
+			cache-level = <3>;
+		};
+	};
+
+	psci {
+		compatible = "arm,psci-1.0", "arm,psci-0.2";
+		method = "smc";
+	};
+
+	soc: soc {
+		compatible = "simple-bus";
+		interrupt-parent = <&gic>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		pinctrl: pinctrl@10410000 {
+			compatible = "renesas,r9a09g057-pinctrl";
+			reg = <0 0x10410000 0 0x10000>;
+			clocks = <&cpg CPG_CORE R9A09G057_IOTOP_0_SHCLK>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			gpio-ranges = <&pinctrl 0 0 96>;
+			#interrupt-cells = <2>;
+			interrupt-controller;
+			power-domains = <&cpg>;
+			resets = <&cpg 165>, <&cpg 166>;
+		};
+
+		cpg: clock-controller@10420000 {
+			compatible = "renesas,r9a09g057-cpg";
+			reg = <0 0x10420000 0 0x10000>;
+			clocks = <&audio_extal_clk>, <&rtxin_clk>, <&qextal_clk>;
+			clock-names = "audio_extal", "rtxin", "qextal";
+			#clock-cells = <2>;
+			#reset-cells = <1>;
+			#power-domain-cells = <0>;
+		};
+
+		sys: system-controller@10430000 {
+			compatible = "renesas,r9a09g057-sys";
+			reg = <0 0x10430000 0 0x10000>;
+			clocks = <&cpg CPG_CORE R9A09G057_SYS_0_PCLK>;
+			resets = <&cpg 48>;
+			status = "disabled";
+		};
+
+		scif: serial@11c01400 {
+			compatible = "renesas,scif-r9a09g057";
+			reg = <0 0x11c01400 0 0x400>;
+			interrupts = <GIC_SPI 529 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 532 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 533 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 534 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 536 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 537 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "eri", "rxi", "txi", "bri", "dri",
+					  "tei", "tei-dri", "rxi-edge", "txi-edge";
+			clocks = <&cpg CPG_MOD 143>;
+			clock-names = "fck";
+			power-domains = <&cpg>;
+			resets = <&cpg 149>;
+			status = "disabled";
+		};
+
+		gic: interrupt-controller@14900000 {
+			compatible = "arm,gic-v3";
+			#interrupt-cells = <3>;
+			#address-cells = <0>;
+			interrupt-controller;
+			reg = <0x0 0x14900000 0 0x20000>,
+			      <0x0 0x14940000 0 0x80000>;
+			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts-extended = <&gic GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
+				      <&gic GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
+				      <&gic GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
+				      <&gic GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
+				      <&gic GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-names = "sec-phys", "phys", "virt", "hyp-phys", "hyp-virt";
+	};
+};
-- 
2.34.1


