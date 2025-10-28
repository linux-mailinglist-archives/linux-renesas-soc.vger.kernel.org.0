Return-Path: <linux-renesas-soc+bounces-23793-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 81735C16589
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 18:59:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 859D350719E
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 17:56:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1ECE34F461;
	Tue, 28 Oct 2025 17:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AT2cblNY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0452234F241
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Oct 2025 17:55:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761674126; cv=none; b=QC25E/6xnYeJja5fdhiozT550k9XsbGysYTzEU7KGYINwulKlIyqukJIeCAJ4h2hziaJV5I6I/JrLYm9DTWi7kxUTtPHZRWZ6CIK40BaDDQti8BAiPmcyHSf3dR7jEY6rXA+q4RzUc31O66vheDbe7mOWwrD2MPmEEDBoFc1nIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761674126; c=relaxed/simple;
	bh=LCOhon9ThMmoYz92kUJxU/29y2KMjq2k0TTZ3F3aIUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dg2H1Q/p1TXqS4rngwJtrrGBX0Oiqvl1YV56+2GdyLkT9IM/e6E0ikqCbqvUXdLnk2HJwHqV5oMEJgqsSd6m7iL2gNRIfjUuB/+V7g3SOXkvp6hPqzawixr/nOLxnDG6XdXTwdn1A/nuWKndKOdOBashgTBgQinbVWho/yafN1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AT2cblNY; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-290aaff555eso58191535ad.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Oct 2025 10:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761674124; x=1762278924; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=15uIwUpwSENM1+tvVnSS8FqWf8Ai7AwwFEkvLlfTjzk=;
        b=AT2cblNY9neimhkezevAXOsJMkxYv0bhtDRAW5SfT1hbuBVHKdBAw1GWLjvzM1j2nU
         ROSKQKSxOM3PksCZeLsLDKGtud2QJEQi3ltHGLR/uoaZBHudfIy6V2QDeP5mDOK1KqFc
         EAYBWITJVZEtL+hYxic8AWcZlooVCL01cPFGTG97ViqPioZUYgRw88ZeDLBWHpKom3Wt
         gVa0KNn0hEsky4cumqQs8zG8R1WNhO6S656hf/W8XeJxsTCoUxYSdVb6Kj8vIdmiM3R0
         XckVSeuWLF2Ig5H3Zn1SPp6X9pLGGfHxL8+axzDID9cubVBnPI4QY+pb80Bgp1opD8YF
         M2FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761674124; x=1762278924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=15uIwUpwSENM1+tvVnSS8FqWf8Ai7AwwFEkvLlfTjzk=;
        b=j6GbVLWOVoO2kxIvY5mrbMJYpNpldo/DWVBcbXhP+hXVGp+ZzddzSjnMrAge8MtP9o
         PVmrH5BjON1N1GlizFO9AayQ0Kdv0ePnvbBG1YYyHbhJfQXqlbfeycLh8gIxhssuJFFP
         IY9GMlYLWXHGwEHpkqLka1eegUzLY1tTpu4abhc8DMQuV9ODOc769zNsIJVCjFSCTTs1
         8omHb/REeFWaj+7pQj3Vp4omLObnxdMhEMUIAYlpV/BNyVbVwhSP2FRbCWIPZK9YGtXb
         h9qK4LboMTEg/xtDh92eZyqNVSKFg8ccMXSTUfYnpeIX8XSHD0In4xks0nP/okL+xVnz
         5JgA==
X-Gm-Message-State: AOJu0YxM8Yg+f76tfAnI4aO5i4E2RfOJkDe+DNbs/MiH7O3I0NIdujPB
	7xQ7ArChv1V8ABlysFw1VZ+57ycAWqLb8wVFewy2MVF6nInDYky4ldf+
X-Gm-Gg: ASbGncuj62U0fmRjxJMu7L2JHXtoc3fMyt2VCG9CtE/ZPg6LQe31UozrHIKOC0oaHUN
	qMkxi3tYdwZZgS/XZfLVVvo/WKWdwbC3r78/vF2Djm1ealgIH/ZeVLL4HV7A9ACGMD9DaDVFC2a
	aDNGsfLM8saV9x4xg+Gq/ow9NQZTCcdz9BKj9Oqh7ptdIzcMFXN0kKdP+QxxX4b+14KfAfW13y2
	c0wOYzwZcKTnIoC2IMrVIPCwebdmVhtetQnGFvcv3BTNu5GNPIYlAQ1DdRePeVCdyjQ5qT43J39
	djSY8ee97qaGTz9cJ/6coUfiSSCN0jMhcMuxpM8d6A3PrM+t+GraSuNp5pKShr0RevKZpWzhZNH
	ClfywmSjjesn/PxEi7BV6eQjCybVXabBzwb6989g4sYi0HW/p4y2TmzEGfYPwVMxnG7igAeqsxC
	tJ/xY7JsYwKpW7Bc9TjbQUYw==
X-Google-Smtp-Source: AGHT+IGYnpVZgiWnZwi/XK/UvXCIdcl+IcWDsikwA+pIa36Wwl9CjeWfOTg3craDtJOTZVfDiScBCw==
X-Received: by 2002:a17:902:dad0:b0:293:e0f:3e3 with SMTP id d9443c01a7336-294deea953cmr406865ad.29.1761674124129;
        Tue, 28 Oct 2025 10:55:24 -0700 (PDT)
Received: from iku.. ([2401:4900:1c06:77f0:168f:479e:bf92:ce93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf3410sm125713005ad.8.2025.10.28.10.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 10:55:23 -0700 (PDT)
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
Subject: [PATCH v2 3/5] arm64: dts: renesas: r9a09g077: Add GMAC nodes
Date: Tue, 28 Oct 2025 17:54:56 +0000
Message-ID: <20251028175458.1037397-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251028175458.1037397-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20251028175458.1037397-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add Ethernet MAC (GMAC) device nodes to the RZ/T2H (R9A09G077) SoC DTSI.
The RZ/T2H integrates three GMAC interfaces based on the Synopsys
DesignWare MAC (version 5.20).

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2 changes:
- No changes.
---
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi | 445 +++++++++++++++++++++
 1 file changed, 445 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
index 8a530c12a6dc..f5fa6ca06409 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g077.dtsi
@@ -270,6 +270,444 @@ i2c2: i2c@81008000 {
 			status = "disabled";
 		};
 
+		gmac0: ethernet@80100000 {
+			compatible = "renesas,r9a09g077-gbeth", "snps,dwmac-5.20";
+			reg = <0 0x80100000 0 0x10000>;
+			interrupts = <GIC_SPI 498 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 500 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 499 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 509 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 510 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 511 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 512 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 513 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 514 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 515 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 516 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 501 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 502 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 503 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 504 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 505 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 506 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 508 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq", "eth_wake_irq", "eth_lpi",
+					  "rx-queue-0", "rx-queue-1", "rx-queue-2",
+					  "rx-queue-3", "rx-queue-4", "rx-queue-5",
+					  "rx-queue-6", "rx-queue-7", "tx-queue-0",
+					  "tx-queue-1", "tx-queue-2", "tx-queue-3",
+					  "tx-queue-4", "tx-queue-5", "tx-queue-6",
+					  "tx-queue-7";
+			clocks = <&cpg CPG_MOD 400>,
+				 <&cpg CPG_CORE R9A09G077_CLK_PCLKH>,
+				 <&cpg CPG_CORE R9A09G077_ETCLKB>;
+			clock-names = "stmmaceth", "pclk", "tx";
+			resets = <&cpg 400>, <&cpg 401>;
+			reset-names = "stmmaceth", "ahb";
+			power-domains = <&cpg>;
+			snps,multicast-filter-bins = <256>;
+			snps,perfect-filter-entries = <32>;
+			rx-fifo-depth = <8192>;
+			tx-fifo-depth = <8192>;
+			snps,fixed-burst;
+			snps,no-pbl-x8;
+			snps,force_thresh_dma_mode;
+			snps,axi-config = <&stmmac_axi_setup>;
+			snps,mtl-rx-config = <&mtl_rx_setup0>;
+			snps,mtl-tx-config = <&mtl_tx_setup0>;
+			snps,txpbl = <16>;
+			snps,rxpbl = <16>;
+			status = "disabled";
+
+			mdio0: mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			mtl_rx_setup0: rx-queues-config {
+				snps,rx-queues-to-use = <8>;
+				snps,rx-sched-sp;
+
+				queue0 {
+					snps,dcb-algorithm;
+					snps,priority = <0x1>;
+					snps,map-to-dma-channel = <0>;
+				};
+
+				queue1 {
+					snps,dcb-algorithm;
+					snps,priority = <0x2>;
+					snps,map-to-dma-channel = <1>;
+				};
+
+				queue2 {
+					snps,dcb-algorithm;
+					snps,priority = <0x4>;
+					snps,map-to-dma-channel = <2>;
+				};
+
+				queue3 {
+					snps,dcb-algorithm;
+					snps,priority = <0x8>;
+					snps,map-to-dma-channel = <3>;
+				};
+
+				queue4 {
+					snps,dcb-algorithm;
+					snps,priority = <0x10>;
+					snps,map-to-dma-channel = <4>;
+				};
+
+				queue5 {
+					snps,dcb-algorithm;
+					snps,priority = <0x20>;
+					snps,map-to-dma-channel = <5>;
+				};
+
+				queue6 {
+					snps,dcb-algorithm;
+					snps,priority = <0x40>;
+					snps,map-to-dma-channel = <6>;
+				};
+
+				queue7 {
+					snps,dcb-algorithm;
+					snps,priority = <0x80>;
+					snps,map-to-dma-channel = <7>;
+				};
+			};
+
+			mtl_tx_setup0: tx-queues-config {
+				snps,tx-queues-to-use = <8>;
+
+				queue0 {
+					snps,dcb-algorithm;
+				};
+
+				queue1 {
+					snps,dcb-algorithm;
+				};
+
+				queue2 {
+					snps,dcb-algorithm;
+				};
+
+				queue3 {
+					snps,dcb-algorithm;
+				};
+
+				queue4 {
+					snps,dcb-algorithm;
+				};
+
+				queue5 {
+					snps,dcb-algorithm;
+				};
+
+				queue6 {
+					snps,dcb-algorithm;
+				};
+
+				queue7 {
+					snps,dcb-algorithm;
+				};
+			};
+		};
+
+		gmac1: ethernet@92000000 {
+			compatible = "renesas,r9a09g077-gbeth", "snps,dwmac-5.20";
+			reg = <0 0x92000000 0 0x10000>;
+			interrupts = <GIC_SPI 517 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 519 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 518 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 528 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 529 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 530 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 531 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 532 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 533 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 534 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 535 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 520 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 521 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 522 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 523 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 524 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 525 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 526 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 527 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq", "eth_wake_irq", "eth_lpi",
+					  "rx-queue-0", "rx-queue-1", "rx-queue-2",
+					  "rx-queue-3", "rx-queue-4", "rx-queue-5",
+					  "rx-queue-6", "rx-queue-7", "tx-queue-0",
+					  "tx-queue-1", "tx-queue-2", "tx-queue-3",
+					  "tx-queue-4", "tx-queue-5", "tx-queue-6",
+					  "tx-queue-7";
+			clocks = <&cpg CPG_MOD 416>,
+				 <&cpg CPG_CORE R9A09G077_CLK_PCLKAH>,
+				 <&cpg CPG_CORE R9A09G077_ETCLKB>;
+			clock-names = "stmmaceth", "pclk", "tx";
+			resets = <&cpg 416>, <&cpg 417>;
+			reset-names = "stmmaceth", "ahb";
+			power-domains = <&cpg>;
+			snps,multicast-filter-bins = <256>;
+			snps,perfect-filter-entries = <32>;
+			rx-fifo-depth = <8192>;
+			tx-fifo-depth = <8192>;
+			snps,fixed-burst;
+			snps,no-pbl-x8;
+			snps,force_thresh_dma_mode;
+			snps,axi-config = <&stmmac_axi_setup>;
+			snps,mtl-rx-config = <&mtl_rx_setup1>;
+			snps,mtl-tx-config = <&mtl_tx_setup1>;
+			snps,txpbl = <16>;
+			snps,rxpbl = <16>;
+			status = "disabled";
+
+			mdio1: mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			mtl_rx_setup1: rx-queues-config {
+				snps,rx-queues-to-use = <8>;
+				snps,rx-sched-sp;
+
+				queue0 {
+					snps,dcb-algorithm;
+					snps,priority = <0x1>;
+					snps,map-to-dma-channel = <0>;
+				};
+
+				queue1 {
+					snps,dcb-algorithm;
+					snps,priority = <0x2>;
+					snps,map-to-dma-channel = <1>;
+				};
+
+				queue2 {
+					snps,dcb-algorithm;
+					snps,priority = <0x4>;
+					snps,map-to-dma-channel = <2>;
+				};
+
+				queue3 {
+					snps,dcb-algorithm;
+					snps,priority = <0x8>;
+					snps,map-to-dma-channel = <3>;
+				};
+
+				queue4 {
+					snps,dcb-algorithm;
+					snps,priority = <0x10>;
+					snps,map-to-dma-channel = <4>;
+				};
+
+				queue5 {
+					snps,dcb-algorithm;
+					snps,priority = <0x20>;
+					snps,map-to-dma-channel = <5>;
+				};
+
+				queue6 {
+					snps,dcb-algorithm;
+					snps,priority = <0x40>;
+					snps,map-to-dma-channel = <6>;
+				};
+
+				queue7 {
+					snps,dcb-algorithm;
+					snps,priority = <0x80>;
+					snps,map-to-dma-channel = <7>;
+				};
+			};
+
+			mtl_tx_setup1: tx-queues-config {
+				snps,tx-queues-to-use = <8>;
+
+				queue0 {
+					snps,dcb-algorithm;
+				};
+
+				queue1 {
+					snps,dcb-algorithm;
+				};
+
+				queue2 {
+					snps,dcb-algorithm;
+				};
+
+				queue3 {
+					snps,dcb-algorithm;
+				};
+
+				queue4 {
+					snps,dcb-algorithm;
+				};
+
+				queue5 {
+					snps,dcb-algorithm;
+				};
+
+				queue6 {
+					snps,dcb-algorithm;
+				};
+
+				queue7 {
+					snps,dcb-algorithm;
+				};
+			};
+		};
+
+		gmac2: ethernet@92010000 {
+			compatible = "renesas,r9a09g077-gbeth", "snps,dwmac-5.20";
+			reg = <0 0x92010000 0 0x10000>;
+			interrupts = <GIC_SPI 536 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 538 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 537 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 547 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 548 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 549 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 550 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 551 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 552 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 553 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 554 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 539 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 540 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 541 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 542 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 543 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 544 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 545 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 546 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq", "eth_wake_irq", "eth_lpi",
+					  "rx-queue-0", "rx-queue-1", "rx-queue-2",
+					  "rx-queue-3", "rx-queue-4", "rx-queue-5",
+					  "rx-queue-6", "rx-queue-7", "tx-queue-0",
+					  "tx-queue-1", "tx-queue-2", "tx-queue-3",
+					  "tx-queue-4", "tx-queue-5", "tx-queue-6",
+					  "tx-queue-7";
+			clocks = <&cpg CPG_MOD 417>,
+				 <&cpg CPG_CORE R9A09G077_CLK_PCLKAH>,
+				 <&cpg CPG_CORE R9A09G077_ETCLKB>;
+			clock-names = "stmmaceth", "pclk", "tx";
+			resets = <&cpg 418>, <&cpg 419>;
+			reset-names = "stmmaceth", "ahb";
+			power-domains = <&cpg>;
+			snps,multicast-filter-bins = <256>;
+			snps,perfect-filter-entries = <32>;
+			rx-fifo-depth = <8192>;
+			tx-fifo-depth = <8192>;
+			snps,fixed-burst;
+			snps,no-pbl-x8;
+			snps,force_thresh_dma_mode;
+			snps,axi-config = <&stmmac_axi_setup>;
+			snps,mtl-rx-config = <&mtl_rx_setup2>;
+			snps,mtl-tx-config = <&mtl_tx_setup2>;
+			snps,txpbl = <16>;
+			snps,rxpbl = <16>;
+			status = "disabled";
+
+			mdio2: mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			mtl_rx_setup2: rx-queues-config {
+				snps,rx-queues-to-use = <8>;
+				snps,rx-sched-sp;
+
+				queue0 {
+					snps,dcb-algorithm;
+					snps,priority = <0x1>;
+					snps,map-to-dma-channel = <0>;
+				};
+
+				queue1 {
+					snps,dcb-algorithm;
+					snps,priority = <0x2>;
+					snps,map-to-dma-channel = <1>;
+				};
+
+				queue2 {
+					snps,dcb-algorithm;
+					snps,priority = <0x4>;
+					snps,map-to-dma-channel = <2>;
+				};
+
+				queue3 {
+					snps,dcb-algorithm;
+					snps,priority = <0x8>;
+					snps,map-to-dma-channel = <3>;
+				};
+
+				queue4 {
+					snps,dcb-algorithm;
+					snps,priority = <0x10>;
+					snps,map-to-dma-channel = <4>;
+				};
+
+				queue5 {
+					snps,dcb-algorithm;
+					snps,priority = <0x20>;
+					snps,map-to-dma-channel = <5>;
+				};
+
+				queue6 {
+					snps,dcb-algorithm;
+					snps,priority = <0x40>;
+					snps,map-to-dma-channel = <6>;
+				};
+
+				queue7 {
+					snps,dcb-algorithm;
+					snps,priority = <0x80>;
+					snps,map-to-dma-channel = <7>;
+				};
+			};
+
+			mtl_tx_setup2: tx-queues-config {
+				snps,tx-queues-to-use = <8>;
+
+				queue0 {
+					snps,dcb-algorithm;
+				};
+
+				queue1 {
+					snps,dcb-algorithm;
+				};
+
+				queue2 {
+					snps,dcb-algorithm;
+				};
+
+				queue3 {
+					snps,dcb-algorithm;
+				};
+
+				queue4 {
+					snps,dcb-algorithm;
+				};
+
+				queue5 {
+					snps,dcb-algorithm;
+				};
+
+				queue6 {
+					snps,dcb-algorithm;
+				};
+
+				queue7 {
+					snps,dcb-algorithm;
+				};
+			};
+		};
+
 		ethss: ethss@80110000 {
 			compatible = "renesas,r9a09g077-miic";
 			reg =  <0 0x80110000 0 0x10000>;
@@ -495,6 +933,13 @@ sdhi1_vqmmc: vqmmc-regulator {
 		};
 	};
 
+	stmmac_axi_setup: stmmac-axi-config {
+		snps,lpi_en;
+		snps,wr_osr_lmt = <0xf>;
+		snps,rd_osr_lmt = <0xf>;
+		snps,blen = <16 8 4 0 0 0 0>;
+	};
+
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
-- 
2.43.0


