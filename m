Return-Path: <linux-renesas-soc+bounces-7968-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CF375959826
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Aug 2024 12:46:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 866932844AF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 21 Aug 2024 10:46:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BE5319ABBE;
	Wed, 21 Aug 2024 08:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lMN4ME+R"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CAD7197A83;
	Wed, 21 Aug 2024 08:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724230615; cv=none; b=j9bVZ2HFckUiHDq3QeGFvB/vPFqRb+axq2fNYKuVaVAs/nPhPqY6Vr7Cp4GQRzvHAPLucu2/D8HuTfcmmzbTMuTKCXZdK1mnrtjQoAcTl7YJM/yeuN+BRaInN6gzKWHKeupsdDeK1RSHu+duc9viW7DudhcqG+awhv7TojJu7+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724230615; c=relaxed/simple;
	bh=Ld0xT5NAS+q5L8cCFSs0AFa05OMHQ2jsWlV3tdEg7io=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=M+IS5yKgCdayqIwTiMf/whOXhdBGkb5l2lVWNoCCBBdvIpya6c9D3XYgORDazXBYm3CGLh6+Xe1xUDBg4qiXSy+Qs5Q8q2qUyDfz1RNrYnT4N/Op/tN51f89LfCnOwSl30p0PSFQaoa13TISua3nGVixFHgptm/Zxa1ihUsJzk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lMN4ME+R; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a7aabb71bb2so703669366b.2;
        Wed, 21 Aug 2024 01:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724230612; x=1724835412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vwm+dqAYu73QsgGGtgK2F4B2q5fFFnYa3Pw2Is7qI/c=;
        b=lMN4ME+RHRg+lhIwbD8qjvozCZ4tJSgRGFmE/f6w0g+mPItSQNud+Q5M84pPz/eK07
         HbGlZH8Gy8rRb4KWkL9oEAwgmEJOhdZenUiz+kixKcxH1pbJxf8b1NwnSwXy2E5gcNqp
         CfvKv2ei4WThKS8H0pDJh/beL9ajvpV9v+0s3yZusG6VcCQG//gVjS8FWQkt6y9Jj43K
         vxTBgo+kjUedvas/VZ12nvpW1o4WsREzI0tKGCmH6Uw+xr7PJVSaXLkokq6yTm8bw9l/
         rolkG1QbRP0Psk9jkQ4XVF2/HPZY7UOrXxHEO7+MmEBkwxE1uis7o1bhE0dqLuoE2Bx8
         IjiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724230612; x=1724835412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vwm+dqAYu73QsgGGtgK2F4B2q5fFFnYa3Pw2Is7qI/c=;
        b=EwOWRJQSKgJooqehWH82tbEXO0jIOgbBotVtguWU0SgzmN/dv3/ACfm2eVEsrF04c0
         1gmvhiHbyCvZqshLISKlkUHKG9qBkMXTBDgQRZ0ci/gUR56Uk4AQlWyY/ozXmq+ZLtRX
         rcXn3n1kUiDJae1dJu59I3QdDQv4Fpgib0PgN70dtCIqPzeaYaYW7sFN0yk4ooXSErBN
         kd5R59OuDR9f0cyA4byWQ2m1iXfFxIxywHcNefF5J8aD4cRDV8lwlX6rKcdFHthL4iPg
         rcwmeKfpV1VUmTwFdNd5bwi48tpREBYxQJHDWDk7E1y0aJ1Q0ZWXN/p+6K47X5MPvZRW
         6pTA==
X-Forwarded-Encrypted: i=1; AJvYcCUjxsjtXHRPXjXzxo/vNSj3D4iBSR+fk8E/ebDlv7FSFy2fkSAY76e5w62ujeWKUhMaBZH5kSqZG6Ku@vger.kernel.org, AJvYcCX1BZP6wYsB59lABExDOJgMzoZtoJfiWY5Et0OYYQq2OG2pxgMhA4PLFvysBxMPKWTxEZkRJidv/yKW59+c@vger.kernel.org
X-Gm-Message-State: AOJu0Ywrx6oCIY8HUr2maell0J73DhXYv/uxGu3ScaqCDMfigmbUxHHZ
	1Y+pOLPrmz2wXJF4xMN7cQqCUiC3YOaxZVzcSKWn52qA0FJUDg4r
X-Google-Smtp-Source: AGHT+IEgmM4ik9kWUrhC72+mhMQsK8IJBqWIuJeh6sIoLEHcPHe7Pv6TzlHr01nv9uaI6Id4iWWTvw==
X-Received: by 2002:a17:907:f7a0:b0:a7a:bb54:c852 with SMTP id a640c23a62f3a-a866f9efba8mr125621366b.61.1724230611600;
        Wed, 21 Aug 2024 01:56:51 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:b9a9:40a4:353f:6481])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83838cf183sm873416266b.56.2024.08.21.01.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 01:56:51 -0700 (PDT)
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
Subject: [PATCH v3 1/8] arm64: dts: renesas: Add initial SoC DTSI for RZ/V2H(P) SoC
Date: Wed, 21 Aug 2024 09:56:37 +0100
Message-Id: <20240821085644.240009-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240821085644.240009-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240821085644.240009-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v2->v3
- Updated GIC node to match with the coding-style of DTS

v1->v2
- Updated commit description
---
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 165 +++++++++++++++++++++
 1 file changed, 165 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g057.dtsi

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
new file mode 100644
index 000000000000..4f89894417f6
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
+			reg = <0x0 0x14900000 0 0x20000>,
+			      <0x0 0x14940000 0 0x80000>;
+			#interrupt-cells = <3>;
+			#address-cells = <0>;
+			interrupt-controller;
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


