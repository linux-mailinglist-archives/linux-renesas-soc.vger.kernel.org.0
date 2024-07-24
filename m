Return-Path: <linux-renesas-soc+bounces-7487-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C9193B3CD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jul 2024 17:35:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4577C1C236C3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 24 Jul 2024 15:35:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 406F815B966;
	Wed, 24 Jul 2024 15:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GV/9V8kc"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FE5155C8D;
	Wed, 24 Jul 2024 15:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721835311; cv=none; b=U80mvPG+n17blWrme85BBJl2ue1N1x1hoK43cKA/1b+J4JskOibDdcHM1T8waza/BZcKp1WUcFIkoQ0Buoztp/+FE6qAZ0mTRdIfhEGNt/rVNq/BIPb/xldPMo4oz6XvrWiQVlzdzH74+w7bR0qFHIcQ09irDeQYdedN5iyLEw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721835311; c=relaxed/simple;
	bh=u7DIidTUodfc2N5TKUJoHIFzQXXSjppn6Zr+4QMmy2A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mqm12eP6eQuMVoCicMdW5D30q/cDu9+ZdueISCWnYFHNoXauQHafJAEHacIfN3tFSrItSjRzw5r23MYW+EQIJJFcQ1xgska1dB1WieEnzuolUy4jgm9MNNlt4YIzTItOiRJ8zsqBp0Gr2MFX/b5MLLmb57RDVg+w9+Y5Xd+SWjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GV/9V8kc; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2eefe705510so76182951fa.1;
        Wed, 24 Jul 2024 08:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721835307; x=1722440107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GbiM9wJ4TsLIhQ8zgICk2p7MtQxlZCKj7KDPnIZ7Qls=;
        b=GV/9V8kcP+NKzNO/vbMGZbMaJXOzfOwr9uWzKlYvboJ6qngGm8g0nAG8sP3tsFqZjv
         AUff3sI+FVpSNUPWjYjkA60hFQJNjlCV4wj+/svfmaXYlQul075fTVcSFyM2hqKzZHdx
         RcU/p/jKVlkqt4EQBDRtbAr4AiGM0Tf+DftYOLresC5kQA0VeCrmx5yHaDp/MLOfAShF
         Sj/saMQSIoKG3q4vaxvzHC7bvbWEudJhT+NNjiPh830wWJeJMtBnyEKg5H4J/iFgQif0
         U2mbHcDbNhv+YkzQGF1qLz8O2tiMI1OAqla8YBU35Q5b0EX3to6aMka1x3MY5BM4uYL5
         bfuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721835307; x=1722440107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GbiM9wJ4TsLIhQ8zgICk2p7MtQxlZCKj7KDPnIZ7Qls=;
        b=rMFBWPc1OSaIvxBgh1t5noYIQTWNSw6RxYj2LEal56qT0P+B55sbqVbr/YERYMUcSw
         quvl+zEWnMxPHc9Uww3XumoJ6KWpXAeOKeazExc4jI6G/Ffud8ANqytcR/aamqsYHFSc
         1BWpqrHWkVQtH1FQzqLenJgqIaeAxgoWfU0kMz2mClN4eUuh7Edl7OeykDxyRNM+5a6A
         R+RaNqcRcNzD56Wf+Vqt9hCoG7UGgP6ty96eyOg64usR6z4/J3vStpGDTTdK2TkWUldM
         JP1m37GHUyfyuMLRM1QUCb/+lmLkwRx+v7HEw1V9Is6XxKac+w8nNpjOEobb9EJwAnGz
         ajYg==
X-Forwarded-Encrypted: i=1; AJvYcCWbQV9ecuDAtQ3mMBpVA+NhksM1bGtY7L0Xufdl+o22JTmyVhXjeXsMGiO7N7ZspRI7sNnoe36OfYE4zx04WA7C2+A5iN36nhOVN5C5wB/xLyJAHvdcbzlBCzJBQqqLJH15etGlxISahA==
X-Gm-Message-State: AOJu0YxKyN6qtXKqhEb5YscNf9GUU8myLULxi6vLOKJFoKoNzYj3LzW+
	Djkqz1N7x2RetYGlvfXAiT/NUj7WRXKsRfVaxnpQhH7TaQ7paPT6I3YrIRjd5RM=
X-Google-Smtp-Source: AGHT+IHChGb1LKSNwMpXPKtv9w3uDdYP2y9Lq3rViNo+v9CbG0Rg4qRu89T2tNCXfVQRQYMpNJ9H9g==
X-Received: by 2002:a2e:8089:0:b0:2ec:56d1:f28 with SMTP id 38308e7fff4ca-2f039ca783dmr1628431fa.26.1721835307050;
        Wed, 24 Jul 2024 08:35:07 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:2595:4364:d152:dff3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427f9397337sm34609565e9.23.2024.07.24.08.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 08:35:06 -0700 (PDT)
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
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/2] arm64: dts: renesas: Add initial SoC DTSI for RZ/V2H SoC
Date: Wed, 24 Jul 2024 16:33:38 +0100
Message-Id: <20240724153339.626460-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240724153339.626460-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240724153339.626460-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add initial SoC DTSI for RZ/V2H SoC, below are the list of
blocks added:
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
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 165 +++++++++++++++++++++
 1 file changed, 165 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g057.dtsi

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
new file mode 100644
index 000000000000..7eb8b7c4cfce
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -0,0 +1,165 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/V2H SoC
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


