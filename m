Return-Path: <linux-renesas-soc+bounces-17990-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAF0AD27B6
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Jun 2025 22:38:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 704243B41B3
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  9 Jun 2025 20:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41595223DF8;
	Mon,  9 Jun 2025 20:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KeCNvEsn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54DBD22256C;
	Mon,  9 Jun 2025 20:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749501427; cv=none; b=bvXZj9GPF0qpB27Y9Q4x27cP6n/vqPN3oE1xwI+FhX06BLwN7EwFfiyCMe8zs0WyKRNkL1I04uY5G3THO/2TyNYeBLb06y8UH1fF6h4mgvEYv01Sb46jwt5/CXg7QYXmQWoMVLKgUMy+uSCvP01gMiO+pkEiaLTGlpR0wqja0ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749501427; c=relaxed/simple;
	bh=NpWxEndc9lIoeJ6gh4YfGUMHFTHYVgGjX9z8sDMQDBo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HKg8wFhLyeYP6QNq4l+TK/naC6G+SotI7HPmR6N6FrrWnCNCehTuWXCEvglQgTCb+4Mv4mOsH44Knt/axWegGKCYHfJRXlbNvDS0LkvONCIW4tqI8w9WZ7WgObC+3wj14AM9b6IGg3MBHBng+rxBJCEH+fGc52bvvoXM3cXqlyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KeCNvEsn; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a4f72cba73so3939566f8f.1;
        Mon, 09 Jun 2025 13:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749501423; x=1750106223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/lwApDULB0hv0Ot0unpYCD6vhUFuvXKzE1xHNEnWOkw=;
        b=KeCNvEsneKBPa24q9MOh/Kny2H6cQxQ3zpz5kkV+iqVLu+68+eT1GO+GQHlpxJuP2U
         MmKXnFAFfW5whrE0ose3b2rLlRnqagtGatodBM55Jxt1hNYWem8mvMAjBdY7zLR0yew8
         zCIi2LIAhgZm+0NEGLPekIOz7WrSPLbEQ+Xghr0lJb8I4j2EfG/U+/c9OF/c1q1jE5Jv
         WtwdLoyOzpf32JeBm6Zt86J/7TUgOI68ADu3nv9H+xCXKI8b2FWL/p3+Y1g89+uJ+tAX
         upbh4sbGJeiqACLJnvhKfD5HIYWUu++nbcyaPdzmvTFh5nkLkhLCxKkicROtJSnZn9Vi
         QDUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749501423; x=1750106223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/lwApDULB0hv0Ot0unpYCD6vhUFuvXKzE1xHNEnWOkw=;
        b=EKy74X7eZp//U0Dh92Ch0i8lVpq4woDlagwsqlJ7sFJ0to/nOscGYGonD2TfmxgLeS
         JMns4ArDfvz6ywjmS6sFzZBwVjaAahrOri7r33sEDV/sqJCbODTIPaQiWViyYAghRFM0
         WpYWHUOO6sIOZGfrKbzcMNqK5E5tvv2Np0Gt6XYTyGE+Pz4G2w/c9C0ekyhJLHH8wCY1
         vMmhHi5vYsff3zGV1ginS7VTOK26znt2FAIlH0Oxgq14riJ53vzGMGxEdOJwJkBIg2q/
         rKxtgRH9rEBdT7RNJRB13kHi3N2z/gSBD4HIl9iW85hD3DEMcFZYzBclOzfJOIOQ+3cO
         /mig==
X-Forwarded-Encrypted: i=1; AJvYcCWIHaAE1f8pzG9QvMY0uAp3zp8IzmEK8cdz5Yf/qDkJtaE4MibSpeof/hPMGEX69fFelxe8bVr4PA8IHvYS@vger.kernel.org, AJvYcCWmt5ZHtfWQ5RDxKPmGp2dA4hJDJ4rOFyJaWJTCPm8BJBHCzSzaXIG4/tIzuM3GWIGyBHO1wNe9Hvgk@vger.kernel.org, AJvYcCXJEvYAELeD81iyGxnnyx+EKtI0j2z/sKyJElvgP4/mPuDWUUXzKUQEpFTtcqI2PONuUYy5RRydLgIx@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ3/t+cdS5Po7k7IgpNJue33VY8tA26CYI8wK0fP/CridefNlT
	re4xYZVCzW5TsnIX1tuhVWDGQOzTnmJJhHYod6yhnQ4wLqj8MYAne3gV
X-Gm-Gg: ASbGnctSmQQatBoSewXI1mWXgrsR0Eu/XtUXYK61CsL7nMW9ByneUMNOtKPal/RSfIx
	NKd6OWe8sPyQk9daSnI4lVrOFWOg7Qm37pJauwV9L8ouIaQeQ6BSGt4jgOIb1tw+tZgFYfPGg5U
	peeoSRWUqNbT4ekVv0Utv1mOnAUeqwunau2skJiaK2JbAtKEm+v1B1SEw0gUP9q2O/Yb4sn272S
	LWXAwQFJvA4AonNXtenIFcmmMIV8lq1SphwO0jlFVEGUp31xJgM59Iu9BB1MYFFUErup1oryBmO
	pECbg3tIUcMGpHSH5b9sruFBWKk6b4mvjk6ekxXIqmdcW7+gLTQnhSVTfirW6bPQY62VFOqSgeR
	QVXfjYkw3rfAPA8drARc=
X-Google-Smtp-Source: AGHT+IH5SRVi+XDsuqJSrTHQZn7tntJITQy1dcgcGBHALqbubLeGL9awaeALwEAxSWdxJmJuA7fEfQ==
X-Received: by 2002:a05:6000:4014:b0:3a5:1388:9a55 with SMTP id ffacd0b85a97d-3a5513de3a4mr649588f8f.5.1749501423502;
        Mon, 09 Jun 2025 13:37:03 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:3c26:913e:81d:9d46])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452730c73d2sm118240345e9.30.2025.06.09.13.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 13:37:02 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 5/8] arm64: dts: renesas: Add initial SoC DTSI for RZ/N2H SoC
Date: Mon,  9 Jun 2025 21:36:53 +0100
Message-ID: <20250609203656.333138-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250609203656.333138-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250609203656.333138-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add initial SoC DTSI for Renesas RZ/N2H ("R9A09G087") SoC, below are
the list of blocks added:
- EXT CLKs
- 4X CA55
- SCIF
- CPG
- GIC
- ARMv8 Timer

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 135 +++++++++++++++++++++
 1 file changed, 135 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g087.dtsi

diff --git a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
new file mode 100644
index 000000000000..c98753775e93
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
@@ -0,0 +1,135 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/N2H SoC
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ */
+
+#define RZN2H_PINS_PER_PORT	8
+
+/*
+ * Create the pin index from its bank and position numbers and store in
+ * the upper 16 bits the alternate function identifier
+ */
+#define RZN2H_PORT_PINMUX(b, p, f)	((b) * RZN2H_PINS_PER_PORT + (p) | ((f) << 16))
+
+/* Convert a port and pin label to its global pin index */
+#define RZN2H_GPIO(port, pin)	((port) * RZN2H_PINS_PER_PORT + (pin))
+
+#include <dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	compatible = "renesas,r9a09g087";
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		l3_ca55: cache-controller-0 {
+			compatible = "cache";
+			cache-unified;
+			cache-size = <0x100000>;
+			cache-level = <3>;
+		};
+
+		cpu0: cpu@0 {
+			compatible = "arm,cortex-a55";
+			reg = <0>;
+			device_type = "cpu";
+			next-level-cache = <&l3_ca55>;
+			enable-method = "psci";
+		};
+
+		cpu1: cpu@100 {
+			compatible = "arm,cortex-a55";
+			reg = <0x100>;
+			device_type = "cpu";
+			next-level-cache = <&l3_ca55>;
+			enable-method = "psci";
+		};
+
+		cpu2: cpu@200 {
+			compatible = "arm,cortex-a55";
+			reg = <0x200>;
+			device_type = "cpu";
+			next-level-cache = <&l3_ca55>;
+			enable-method = "psci";
+		};
+
+		cpu3: cpu@300 {
+			compatible = "arm,cortex-a55";
+			reg = <0x300>;
+			device_type = "cpu";
+			next-level-cache = <&l3_ca55>;
+			enable-method = "psci";
+		};
+	};
+
+	extal_clk: extal {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		/* This value must be overridden by the board */
+		clock-frequency = <0>;
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
+		sci0: serial@80005000 {
+			compatible = "renesas,r9a09g087-rsci", "renesas,r9a09g077-rsci";
+			reg = <0 0x80005000 0 0x400>;
+			interrupts = <GIC_SPI 590 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 591 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 592 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi", "tei";
+			clocks = <&cpg CPG_MOD 8>, <&cpg CPG_CORE R9A09G087_CLK_PCLKM>;
+			clock-names = "operation", "bus";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		cpg: clock-controller@80280000 {
+			compatible = "renesas,r9a09g087-cpg-mssr";
+			reg = <0 0x80280000 0 0x1000>,
+			      <0 0x81280000 0 0x9000>;
+			clocks = <&extal_clk>;
+			clock-names = "extal";
+			#clock-cells = <2>;
+			#reset-cells = <1>;
+			#power-domain-cells = <0>;
+		};
+
+		gic: interrupt-controller@83000000 {
+			compatible = "arm,gic-v3";
+			reg = <0x0 0x83000000 0 0x40000>,
+			      <0x0 0x83040000 0 0x160000>;
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
2.49.0


