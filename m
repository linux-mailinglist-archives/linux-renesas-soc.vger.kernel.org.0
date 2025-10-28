Return-Path: <linux-renesas-soc+bounces-23794-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA61C16595
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 18:59:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 68797508076
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Oct 2025 17:56:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C54334F485;
	Tue, 28 Oct 2025 17:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gLERtt21"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD15234F465
	for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Oct 2025 17:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761674132; cv=none; b=GwI/qxsm13gk7Xp91hxjwFPgrdiMOyr5ZqAjGAKmGwXXL4DwTI3J5mfz1qmBYsa3ZWl9jk1luNsGOUV+gBewqYxXsb2nzIe6f6qcEf6zkI6UBJh3xU05OcGHiC4MoEpzb9Fsg/s1rwW/b6PtmUSKBCj7crllk9pRUhfkrmgHR4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761674132; c=relaxed/simple;
	bh=n1oEpBp6GUR1pTNhpMCY3LFgapbGrz8I4lfBaaG36MI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gUBz6nYD0dAPAmudQzeARsCRIVgF9+fkhWx/Ktk2MC/gcNsKd8g7H/9zFexs3LcuM/J8xLcVlBIt0cLOdG/LVsvFXudxzN+eTLuGZonAOFNrij/YSe7aU7BQGPahZj5F6v+mFh+LxU4wStq9QYY2f4eA8PQbjypFzfR+8e6M7Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gLERtt21; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2697899a202so1173255ad.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Oct 2025 10:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761674129; x=1762278929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jRHLT6EwOqQ30fPkoncskvIhsIgzGXhV6Rpwm+q/UZg=;
        b=gLERtt21LR7+H4oPaRwxnz0uVrN8oS3wGX7R+YOYcTyxwrKz2XdEj8XnLnVxld9S1j
         POywUMNIeJ2J6p8ce2/VPuDM7XMsFbqv3ZG7jMFSqN+GdXbrnu5Bu3Uzts4x955OnA8j
         brmFObBUN+js7cCw6tP981WcKzs94IuuwL5NIc7ajKtaM/eT7hbElnb5wOw3jzYLMuQ6
         XpMsnW8uazZGb/NKcScRVugJT/9aXDfsQ1LLwJIPHnz7nl1qrQJjUD2tIhiZiSBhRoFX
         acqafiicqt7+oeJtHOiYtNKjeqV2LBieDIQlI0Lnii7RgcvLSkAZPt8rDqMNjOlgNfgO
         dKag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761674129; x=1762278929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jRHLT6EwOqQ30fPkoncskvIhsIgzGXhV6Rpwm+q/UZg=;
        b=svY4MC6q64zYSgseurR1pDpvCPONVujGM1YzQxDgwuhS/MOIPfbO5jlUYDiraG07cC
         w5LdQLOjZ4+w3OtR+q4xjHpj7M3TTFcldDEDyuRTjKa70Oupp/rOJvJ7/Mm3cupETBWZ
         tED9o7yIAOlk/NByNM+GExubSun+cmzhrDK2uhLLOFuymoDpH2H4wVCDnAblRzUPMouk
         9Wfqf8w+HfUO49FqXismRpBKLVLy6B6aJjB565YPkHJjHiBw6BINjmNco9Y8GWyzfGa2
         i9t5gtJGpbE4shAG021jIsHNLTmy+thntdFmbYqCdV9JlI6oWbXjb0UD9xzAFQuvJJzO
         FvrQ==
X-Gm-Message-State: AOJu0YzhW0yZEAWo3ni5qGtugDWkpOABo2BpXoOJe3gRr5U6nX7QgCVf
	Gd1UalfPzM/5K9On/OeBciwnlSC3GpEdR5y7DsIHX3a4z76hfnglIjX2
X-Gm-Gg: ASbGncv7RbBJIlcAfct/XSACUOz7JKZHClKuZS+jD6UYo/ooNHtUlHz8FwaIx3HFCe1
	iOvv87FR9E7MJUJQIbjpJSsG0oJ45VOaW978DyOUrvaxXq2cdRs/1cyJDCxliDd5UqsYBE2O+Te
	+QZ28GDX1inZEUjj+cvXEb5/m3yVWFkFUxaYb4F6k7CQhV/nOppCFBWV9CRUjWFQ96UJ+HZFePb
	B8QMk0J80aDDoQg7NQ1L788xCmZP3gGbK6DZ3zJMvAolmY5LPCZiC5wNTf9V7y1jDQa1Ukz0LB7
	QDexdkJYa1AdAuVKQ4h9Km9Y9pmWR6+qa6zAx5IJLajY/uvBUPz9GvGcnVHDPae4uuiGGjnZg77
	r5VLzE6f35BKrsQ2Jr6eHTrZYvdNDQIdIS5esciHimVA4cg5Qa8JdVQ37yk2AOZb6O8/QB2pfca
	Y1L6jJGP3o5LS6C3s0GaEzyCrLZq0XpTm0
X-Google-Smtp-Source: AGHT+IHA9ZjOmzKrJ6D4mLP6YX0/bd+Ips0fHjhWEcsrobQIF5+7CsngR2loiZiNyTaG+twjEPJI8w==
X-Received: by 2002:a17:902:ef0f:b0:271:9b0e:54ca with SMTP id d9443c01a7336-294cc6b80femr48250775ad.13.1761674129076;
        Tue, 28 Oct 2025 10:55:29 -0700 (PDT)
Received: from iku.. ([2401:4900:1c06:77f0:168f:479e:bf92:ce93])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf3410sm125713005ad.8.2025.10.28.10.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 10:55:28 -0700 (PDT)
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
Subject: [PATCH v2 4/5] arm64: dts: renesas: r9a09g087: Add GMAC nodes
Date: Tue, 28 Oct 2025 17:54:57 +0000
Message-ID: <20251028175458.1037397-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
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

Add Ethernet MAC (GMAC) device nodes to the RZ/N2H (R9A09G087) SoC DTSI.
The RZ/T2H integrates three GMAC interfaces based on the Synopsys
DesignWare MAC (version 5.20).

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2 changes:
- No changes.
---
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi | 448 +++++++++++++++++++++
 1 file changed, 448 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
index fe0087a7d4b4..361a9235f00d 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g087.dtsi
@@ -270,6 +270,447 @@ i2c2: i2c@81008000 {
 			status = "disabled";
 		};
 
+		gmac0: ethernet@80100000 {
+			compatible = "renesas,r9a09g087-gbeth", "renesas,r9a09g077-gbeth",
+				     "snps,dwmac-5.20";
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
+				 <&cpg CPG_CORE R9A09G087_CLK_PCLKH>,
+				 <&cpg CPG_CORE R9A09G087_ETCLKB>;
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
+			compatible = "renesas,r9a09g087-gbeth", "renesas,r9a09g077-gbeth",
+				     "snps,dwmac-5.20";
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
+				 <&cpg CPG_CORE R9A09G087_CLK_PCLKAH>,
+				 <&cpg CPG_CORE R9A09G087_ETCLKB>;
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
+			compatible = "renesas,r9a09g087-gbeth", "renesas,r9a09g077-gbeth",
+				     "snps,dwmac-5.20";
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
+				 <&cpg CPG_CORE R9A09G087_CLK_PCLKAH>,
+				 <&cpg CPG_CORE R9A09G087_ETCLKB>;
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
 			compatible = "renesas,r9a09g087-miic", "renesas,r9a09g077-miic";
 			reg =  <0 0x80110000 0 0x10000>;
@@ -495,6 +936,13 @@ sdhi1_vqmmc: vqmmc-regulator {
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


