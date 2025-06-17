Return-Path: <linux-renesas-soc+bounces-18474-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C70BAADDA92
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 19:26:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C3EEE1887782
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Jun 2025 17:20:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C62A28505A;
	Tue, 17 Jun 2025 17:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HXyBZKHE"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C47B238151;
	Tue, 17 Jun 2025 17:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750180803; cv=none; b=t0uiMe2ZPDuXHRRcJBpon7gE+U+pHbVoXfRhnaGiH1zYhdp2LHOo/6tXfTQRzIjmnAbM02wzPAqnNvqdjzRrNdMP3x5y7hlZ+eHjMbRiOaXHdMs+djBjOFiFD5dV6Wt77TLQCmHCY1slb8R3edc67TFAXLO9DdrR5JSHDUzCi8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750180803; c=relaxed/simple;
	bh=3B6sYc3JcWa5R1lAqdT82tP9yWC6WDVNz34v5OH2hsE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GBwB7tRZCtaCkjfg/nkq1utsOMK9G4JoHKgQ8JAKf7Dv59PI0777ukaWJEx511YQyMMXA8arz7ZmAJjOot8/cCPj/z/YkuPTt9GiWJPXR4UBiYc6rriQL75UKlJaIueECx5gWy6wIuMoDdTmgcBwLJUMVUw1BONWBfAlBGYi0u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HXyBZKHE; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a531fcaa05so3737315f8f.3;
        Tue, 17 Jun 2025 10:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750180800; x=1750785600; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UVe4//z2CuBD+1IiscWmuKMvR6aBvgiQ2yq2GBOD6ic=;
        b=HXyBZKHEBcu1m0mPmAF0C/oHP1FlzI95o4tnu81/SBRzq6u+JehzVwi07ySG0XcZhH
         xjhaP6CEIAJH/JlZRuXx1Kcc1uhOYA2yEj/oAqTdjlnJwFhOPoQQpAKyIjlyBeU1t/EJ
         0H9Xn/pKbjB+Qo8VlXY/rM8tEmNFX/iL3kLZUDRaHlkxiOM7ot3LUw8wyTKYMSDCuzwD
         qdR0HKf4oimgy8h+JKwiW3gYiCExZ7y9iaTUjbuLKPtumgD8cfLslwtxQqssr2j/3Les
         /TQ58roBabNnWoRCupPnoNUzv6IQ1c3y7WwYFmWdib4GATS/LDKIMAhzLeXtcCUCxEG3
         sdXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750180800; x=1750785600;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UVe4//z2CuBD+1IiscWmuKMvR6aBvgiQ2yq2GBOD6ic=;
        b=YOgffQrCTjP7qovg/8yCoPuKX7H0YYCO8wT728ivQnxhTLhCqETpPibtUBHdhkfx8X
         5kZdw1p93N+ai8PQ0oCtcTAsC8BGORNl+JZGbzvyEnTmAFzmwM3F/ExN4jSH6dDgU/Ed
         UP+F9xTy70e4caJ/hG3kW3ONTwOEe/FO4eCdaTZVKvs6beE+NA3O/+dIDdP6UOuQqqRq
         kvTaYmfM6sRHDTitNeFEyPyz3FiOWv8c4sx9tXknhkX3jLZpubb2XlWxRoXMXPIv4Cax
         yJRFngrMwhjD3aqK9rn2tekkchKeKw5709QHunqwFlft/jkvig7HgtJ6iWaa/5Gm+xe2
         ma3Q==
X-Forwarded-Encrypted: i=1; AJvYcCV9PoUbyGxaLfw9z6W6qIscYw3E4fISgvvZYu0IoptehtQo+bUNMmDrX7rX43zpNf9aRLt4meT2o24x@vger.kernel.org, AJvYcCWleT30IE9Iz8j/ycubVh5JILJkuzmJuMFlduDV0tuCaPHL5fs5X7C+YTpNVhqlT4llW7HF/Gyyoi98rp8F@vger.kernel.org
X-Gm-Message-State: AOJu0YxRBDtPrdGd/7GNY++AxxX18mCiyXkSkjD7VL1KPmbJdCL/qnkd
	N6N1pwOQodW2evPjp2t77W/IFJz8zpzPqpJsIag4b3dgkJ5iEuZK1FIj
X-Gm-Gg: ASbGncuDKLW4fcttpKsD5ob3mgERwVFP0a3K7BShLz8sxIAGOZjNrq75mOaVFEhnhij
	4Q2Js429AwG7wafzcDn3W37q/XycVjabpnqrGZ8rOSdJr8ga79kMFuJl5AL/lmYFDNWN0d5rWLG
	wFJyZBGfzBo1FT6ImcX8G1t0pwjItxDPPe8epd5Ho3q6bg0VW42Sxm5VYAYB7lov3sZkiwo36Z+
	p1XJIw5I4VoI/kBhITMtMN89XyVN1ARDR6dYZ6Su8gNqv+X+DAQgnvzLj6Mfa+YVJVGdXwcTJf2
	MHBCMslT4xb8Wj+GaMgI3+jkOBdpALGhpxYgxCe++MbSqmY2S3iL+Yzvq++/1C+8UQAaPgpA+wn
	EkUC7Cm2Elt0=
X-Google-Smtp-Source: AGHT+IG3ZARnB/HpLnW+bcehKJX/bLtYA4MUQGHHzlj3ScDd5zDGgl0841lo3zZbpqy1hawnmNZ4hA==
X-Received: by 2002:a05:6000:2089:b0:3a5:2ec5:35b8 with SMTP id ffacd0b85a97d-3a572398cecmr10937054f8f.11.1750180800205;
        Tue, 17 Jun 2025 10:20:00 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:a081:30f1:e1c7:6f28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e25f207sm180875415e9.35.2025.06.17.10.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 10:19:59 -0700 (PDT)
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
Subject: [PATCH v2 1/4] arm64: dts: renesas: Add initial SoC DTSI for RZ/N2H SoC
Date: Tue, 17 Jun 2025 18:19:54 +0100
Message-ID: <20250617171957.162145-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250617171957.162145-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250617171957.162145-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v1->v2:
- Reordered the `l3_ca55` node and renamed it to `L3_CA55` for consistency
- Added reviewed-by tag from Geert
---
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 124 +++++++++++++++++++++
 1 file changed, 124 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g087.dtsi

diff --git a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
new file mode 100644
index 000000000000..e57a91adcb68
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
@@ -0,0 +1,124 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/N2H SoC
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ */
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


