Return-Path: <linux-renesas-soc+bounces-17044-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B0AAB55B9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 15:14:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FD05860CD3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 May 2025 13:14:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D7E128F521;
	Tue, 13 May 2025 13:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dbYTLdde"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517B128E583;
	Tue, 13 May 2025 13:14:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747142059; cv=none; b=WUm5hbT1FIMCVhHtzhPQ/YV3QgDeL2YwW4ZPD3uXh9amtXluXzpeppy7iyWNPa68smWjoPTzTkuuvbPaOxquVWOizjJiCaJp5SJ8+1wXms5kx0FehcahyYikbpGHiPv/xUWVP9IzdDfSbBOHdZeEe/ZUtYU05yqJqc6mySt4Nxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747142059; c=relaxed/simple;
	bh=hh4hF6awWxhrU60uO2EEzpu79vOuDcpJC2u62pqgv+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Imfz+N8UYGVNqd//AlyD/sYGHueIcY/UkdSvlYTq1Nt97JwjeejzfBahgrVXGGfrJFZoorcAhRm5tGDn9Grf8p5tCIYHU6kquBVMh7gCYyftIXfmA3EwfMFP9S15vQ5jgzNI+sH6NVX/LUwQncJlVd7AMaYEiCFA7Jay31Cuus4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dbYTLdde; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cf848528aso48563695e9.2;
        Tue, 13 May 2025 06:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747142055; x=1747746855; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/8T+LcxT8V++1j16K6u++mwYYoiG9Gg5/MyYlhk+eOY=;
        b=dbYTLdde3nwbboySM/+wHLTNi/PKvsZgrUp188zAwlubrqJdNTkswXe4aKtgTlWnki
         IvqWB8+V34knyFXYT5qc73Evrdia9VgCvpzVjfTUMBuUm2JbNVRerAKMU1DcfT0MjPJF
         ktjKZ4cCLiZ23PxsJJ6EocSwHXC/xzP48kGgVATEM/v+wn6TXsJ8qm8VdzLIFuF864bZ
         asrVxEs1gFCxRieLlEWtyRLKOlopJvg7ZY6lBAiaYNJAu9iVjrFO4RopDFzYRABCjTds
         tkEsCii9+SpwCedpH9qqhAihdGRw23ZjkuZCAno6Ij9RbBZeHirQqhURpWZm02lwl9K4
         FrZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747142055; x=1747746855;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/8T+LcxT8V++1j16K6u++mwYYoiG9Gg5/MyYlhk+eOY=;
        b=SodxNj/UPkqNN0ZB6mLWAZLkso2VBkGLMEa/45VgCYq26t0z68ZjXBhKuMfqLnlyyb
         rm3dRzxa/BpFsvuCqUYLxQGrTV4vKP1py7ddQnr5AqUvqyBiBLXV+b2lw3GYWfRsnhrl
         837rvFq6QzcvosJovDzgnreWddSgjRj/+ueFunAuAYhDaTP1chLSnG47WWwdYwrHLDrj
         +h9SLhPB8KvIF7ndcn51++raUMdgdIU0SDeozF1leA0UuJ0/Rb6vGomTzpPJocNM1/Jh
         +eSNPV/HDmg0wb9la4XWno+mIfXPLL3RCvqAGveM3Ft7zXopWDfNf0pHfbxTJK7XUghq
         6Bxg==
X-Forwarded-Encrypted: i=1; AJvYcCWixxSwN4G5SGXftE0nOG6UwBHUVm0/vWL5U7GXakNAVMLZDO5Nun8QXQXjqJViaF9mHKvfTvtuYFcx@vger.kernel.org, AJvYcCWxM5776424lLFjVsra4utKI7ll+k8iaTdDttH8YMS7DKEeg59AlxUzs0DYgenzO/bxPZFU7cbLiiMXDSug@vger.kernel.org
X-Gm-Message-State: AOJu0YwoJv3+Eb0cJyOtkYi0OipZ1XkBsjARbr8BSg+NDoMon3h5om/F
	QdEUZRyVKTz4Pqxk8EnDHeUAghgDwwsLmHpK51xeZvxI0SxTpLrM7YthF2yf
X-Gm-Gg: ASbGncuNMTH0x16xC2GeLUuAIjSsrrigzyE823R09OuV/WAm1U3roRQVKsQZd/BBsO+
	EzT14FDwUAu5pJjhmbV+MHynsnguuOxDKcJ9W8zJWihs5c5dxpdjk6zgj+lU1uMycmqYc4y4R7j
	KBat+RokNl0Ube+z7aoblDO0lJpHaVrHQIwvf4WlmnFXHaihh6yiG4LBAZKV7oX4/QOljGLKWTV
	b46JjJr4/UnQjYcuuWJOeZ/DW97IcpK7GIk77YOijKKE1LOjPmEvb8RAgm+paGs7m/x0I110a1d
	QMLZDgXdwog6QpTabUE4wcRdYmOQI9D0eAcqI83qRmwKRV/PxFmyAx9tg8pI4hXIMZzFEQf+6+t
	4qc6RG7QmZg==
X-Google-Smtp-Source: AGHT+IH49nExO9dyiUs1nhU8VgiDiA9APH5cNCdZa3VsG2xrz+AppVSwbrDK18+uUEWO0sfke6gTUQ==
X-Received: by 2002:a5d:5f8f:0:b0:3a0:99de:5309 with SMTP id ffacd0b85a97d-3a1f6448d79mr13163755f8f.18.1747142055010;
        Tue, 13 May 2025 06:14:15 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c996:6219:e8d3:1274])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57ddfd6sm15910102f8f.4.2025.05.13.06.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 06:14:14 -0700 (PDT)
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
Subject: [PATCH v3 1/2] arm64: dts: renesas: r9a09g057: Add GBETH nodes
Date: Tue, 13 May 2025 14:14:11 +0100
Message-ID: <20250513131412.253091-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250513131412.253091-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250513131412.253091-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Renesas RZ/V2H(P) SoC is equipped with 2x Synopsys DesignWare Ethernet
Quality-of-Service IP block version 5.20. Add GBETH nodes to R9A09G057
RZ/V2H(P) SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
- Added the mdio0/1 nodes to SoC DTSI.

v1->v2:
- Added missing power-domains property to the GBETH nodes.
- Fixed interrupt number 745 to 775 in eth0 node.
- Added  snps,rx-sched-sp property to mtl_rx_setup1
---
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 209 +++++++++++++++++++++
 1 file changed, 209 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index 18ab5639b301..a7574ddd216f 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -701,6 +701,215 @@ sdhi2_vqmmc: vqmmc-regulator {
 				status = "disabled";
 			};
 		};
+
+		eth0: ethernet@15c30000 {
+			compatible = "renesas,r9a09g057-gbeth", "renesas,rzv2h-gbeth",
+				     "snps,dwmac-5.20";
+			reg = <0 0x15c30000 0 0x10000>;
+			interrupts = <GIC_SPI 765 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 767 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 766 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 772 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 773 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 774 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 775 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 768 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 769 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 770 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 771 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq", "eth_wake_irq", "eth_lpi",
+					  "rx-queue-0", "rx-queue-1", "rx-queue-2",
+					  "rx-queue-3", "tx-queue-0", "tx-queue-1",
+					  "tx-queue-2", "tx-queue-3";
+			clocks =  <&cpg CPG_MOD 0xbd>, <&cpg CPG_MOD 0xbc>,
+				  <&cpg CPG_CORE R9A09G057_GBETH_0_CLK_PTP_REF_I>,
+				  <&cpg CPG_MOD 0xb8>, <&cpg CPG_MOD 0xb9>,
+				  <&cpg CPG_MOD 0xba>, <&cpg CPG_MOD 0xbb>;
+			clock-names = "stmmaceth", "pclk", "ptp_ref",
+				      "tx", "rx", "tx-180", "rx-180";
+			resets = <&cpg 0xb0>;
+			power-domains = <&cpg>;
+			snps,multicast-filter-bins = <256>;
+			snps,perfect-filter-entries = <128>;
+			rx-fifo-depth = <8192>;
+			tx-fifo-depth = <8192>;
+			snps,fixed-burst;
+			snps,no-pbl-x8;
+			snps,force_thresh_dma_mode;
+			snps,axi-config = <&stmmac_axi_setup>;
+			snps,mtl-rx-config = <&mtl_rx_setup0>;
+			snps,mtl-tx-config = <&mtl_tx_setup0>;
+			snps,txpbl = <32>;
+			snps,rxpbl = <32>;
+			status = "disabled";
+
+			mdio0: mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <0x1>;
+				#size-cells = <0x0>;
+			};
+
+			mtl_rx_setup0: rx-queues-config {
+				snps,rx-queues-to-use = <4>;
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
+			};
+
+			mtl_tx_setup0: tx-queues-config {
+				snps,tx-queues-to-use = <4>;
+
+				queue0 {
+					snps,dcb-algorithm;
+					snps,priority = <0x1>;
+				};
+
+				queue1 {
+					snps,dcb-algorithm;
+					snps,priority = <0x2>;
+				};
+
+				queue2 {
+					snps,dcb-algorithm;
+					snps,priority = <0x4>;
+				};
+
+				queue3 {
+					snps,dcb-algorithm;
+					snps,priority = <0x8>;
+				};
+			};
+		};
+
+		eth1: ethernet@15c40000 {
+			compatible = "renesas,r9a09g057-gbeth", "renesas,rzv2h-gbeth",
+				     "snps,dwmac-5.20";
+			reg = <0 0x15c40000 0 0x10000>;
+			interrupts = <GIC_SPI 780 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 782 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 781 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 787 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 788 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 789 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 790 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 783 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 784 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 785 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 786 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq", "eth_wake_irq", "eth_lpi",
+					  "rx-queue-0", "rx-queue-1", "rx-queue-2",
+					  "rx-queue-3", "tx-queue-0", "tx-queue-1",
+					  "tx-queue-2", "tx-queue-3";
+			clocks =  <&cpg CPG_MOD 0xc3>, <&cpg CPG_MOD 0xc2>,
+				  <&cpg CPG_CORE R9A09G057_GBETH_1_CLK_PTP_REF_I>,
+				  <&cpg CPG_MOD 0xbe>, <&cpg CPG_MOD 0xbf>,
+				  <&cpg CPG_MOD 0xc0>, <&cpg CPG_MOD 0xc1>;
+			clock-names = "stmmaceth", "pclk", "ptp_ref",
+				      "tx", "rx", "tx-180", "rx-180";
+			resets = <&cpg 0xb1>;
+			power-domains = <&cpg>;
+			snps,multicast-filter-bins = <256>;
+			snps,perfect-filter-entries = <128>;
+			rx-fifo-depth = <8192>;
+			tx-fifo-depth = <8192>;
+			snps,fixed-burst;
+			snps,no-pbl-x8;
+			snps,force_thresh_dma_mode;
+			snps,axi-config = <&stmmac_axi_setup>;
+			snps,mtl-rx-config = <&mtl_rx_setup1>;
+			snps,mtl-tx-config = <&mtl_tx_setup1>;
+			snps,txpbl = <32>;
+			snps,rxpbl = <32>;
+			status = "disabled";
+
+			mdio1: mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <0x1>;
+				#size-cells = <0x0>;
+			};
+
+			mtl_rx_setup1: rx-queues-config {
+				snps,rx-queues-to-use = <4>;
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
+			};
+
+			mtl_tx_setup1: tx-queues-config {
+				snps,tx-queues-to-use = <4>;
+
+				queue0 {
+					snps,dcb-algorithm;
+					snps,priority = <0x1>;
+				};
+
+				queue1 {
+					snps,dcb-algorithm;
+					snps,priority = <0x2>;
+				};
+
+				queue2 {
+					snps,dcb-algorithm;
+					snps,priority = <0x4>;
+				};
+
+				queue3 {
+					snps,dcb-algorithm;
+					snps,priority = <0x8>;
+				};
+			};
+		};
+	};
+
+	stmmac_axi_setup: stmmac-axi-config {
+		snps,lpi_en;
+		snps,wr_osr_lmt = <0xf>;
+		snps,rd_osr_lmt = <0xf>;
+		snps,blen = <16 8 4 0 0 0 0>;
 	};
 
 	timer {
-- 
2.49.0


