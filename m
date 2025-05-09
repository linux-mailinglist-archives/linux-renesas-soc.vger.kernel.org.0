Return-Path: <linux-renesas-soc+bounces-16900-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11568AB18DD
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 17:36:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 687573AB02C
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  9 May 2025 15:35:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 770AE22FAD4;
	Fri,  9 May 2025 15:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ebcg9//l"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5970222F166;
	Fri,  9 May 2025 15:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746804967; cv=none; b=EfjdfXJk/pTb6j5lrN1Cnsb19S3Pnn4Y/8xUaPL3tFL5YraxecS3EUaEwlkXgeKzBSuKCo9gPlddoQ/vyBG1uH+ZypPPYGgNwFiJn//lu1SIoxFbXh3inot9CIDbPlzswRxJn6sI6Msm75XYYAam//DjXMn5xeRBR3S5ifMPFA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746804967; c=relaxed/simple;
	bh=rtIFzopyYYUGuNlPSbaWjFEc8g8Pmmfh11/D3sJE/us=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K0o4S86IfSMCcLLg6qE486BLwvHa02subIC4eC00nVlxPakeRMiI0SxYVw1M6DHOFRyI/U8xAUI8VBo7YeYyCWkt2LcosQBdWair8N6RnR9UCh9QciPEcEDmXfXMfNhcQWUntKQUiz7CyDJnPzBcK2wcZHfd8YGfZa+kRs5yIcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ebcg9//l; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a0be321968so1242172f8f.2;
        Fri, 09 May 2025 08:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746804964; x=1747409764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VNDTmp1Fd2+WXNTcG/OnlYm2PG6VMUJuRIlv6+F8NTA=;
        b=ebcg9//lIqT208CWjtWL6gQbB1cRpQdItPlg1sgWQmD8baApsdY3J61hdEcLg6e3s0
         L8UE9Lw31D235lJr+XSabHzz1UN49eG7Ei/3H133JeBgOgYdFb0Tu2GA9gBNldaoqQGh
         dk0RHNgSyRmH4y9ZY2EtE5DLRMOJJoGGKpVOC+1yE271wSxjTiHLAYA9vy4q+4OtcHuQ
         7NxbunX329eHA54uwOAM15EXhcttA8y538YYNIXQ54qx1c7qNyA/i3hevJ/iqi6xQ78/
         EJKyPMmxgJuUMeMd8TEqmWkdJfg2sNtqeT/pphu7/OS9JLz36X7b9waYfm9hYd/0Tm/n
         IRVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746804964; x=1747409764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VNDTmp1Fd2+WXNTcG/OnlYm2PG6VMUJuRIlv6+F8NTA=;
        b=GFkHBpAYMjRT9VAPdfRcV9/5j0hUzygIcZAcd9adab+4Z2109KWAlG9UosngJVd36T
         jTAEBNd0uyXVOvUINpBkEh6MhUdG6dCPdWnhgJ1FEh0Fkon0Zp5PzXcDyfUH040fqn/5
         ovScVKSuzcXTUUaGw31UI9SWjvtg0pbOmP8KdnjzIruZl2TjF/eTpZBJxkudX3Kw26tN
         A3nGeIMJYvV4IHjxcBrJCiC3t2ZtbMQ9/YN63r9e30MKJcIEX0cRsLPENRwifLcM3gCx
         urq3VlGfPn1padxxuj49f1xzgur/TQMe194P3sts9NVniZ2QH6/LwP4+cRh/q1M0XFHr
         aZ9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUIORsrzPgqltANKm5ySYMctSHzXsUqIviIykqeaQGsornYFhyiB9ltricCCdpVo6fQJrBkFJTTDnMx@vger.kernel.org, AJvYcCUTqwYO/GZuHcHBE4Q/sKp7NB2dwqCMuibSnT+SZ0gHEiwXifj4FWGIcLziEbQqgiictoM0Rvakf56rt0vJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwQI7hBCp7Rve4xd1zQHcRA9qPk5K/EmDqse8VA8XcQlXYYxTLz
	bZYJ8Xwa03tEX84eOOLzYtpEzcyaTDTm9IcQOZIRbaXRNKX8XZS3
X-Gm-Gg: ASbGncsWCsc9DL2h5S6JC6tu1k7OLMKrDTOK3xapsmLXBLNaAWURnkZe9AguPJaaJzp
	oJC8Q2olaEFzlz4FAszqktLZns8jffZQyg3geJ2WW2QcHYlczZg9m1yCNq884+PfJORDTxRBuw0
	LhjnrBzSj0lN7mUpx/KlswER74sAVJwb+Hir0fNJxhC4TVs+u9UMoeN5Db4ZJGbrC7zUEsmHvSn
	frGzKF0wNnLPpCkjbfDrbXIb4ezwbtl4XhjD/YK7oKKGNwMr4dTkat2cRM+NUvEdb+1On8MrMFf
	drRhekbZd7cEI9oG+RSWhnFvlsphHljhFbJXXQMihv6gDyQW4RA8UVbmdMQwFUNLbw==
X-Google-Smtp-Source: AGHT+IFHsGjXUM2t5JUYm2IWPv6pP492c6fZSmoYQYu25ERZTfWmfMGL5HwhWKsOHAM7vIaRI0X6yQ==
X-Received: by 2002:a05:6000:4205:b0:3a0:8c45:d30e with SMTP id ffacd0b85a97d-3a1f6469589mr3004069f8f.35.1746804963368;
        Fri, 09 May 2025 08:36:03 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:40e3:34f3:a241:140c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ec912sm3550781f8f.23.2025.05.09.08.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 08:36:02 -0700 (PDT)
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
Subject: [PATCH v2 1/2] arm64: dts: renesas: r9a09g057: Add GBETH nodes
Date: Fri,  9 May 2025 16:35:58 +0100
Message-ID: <20250509153559.326603-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250509153559.326603-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250509153559.326603-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
v1->v2:
- Added missing power-domains property to the GBETH nodes.
- Fixed interrupt number 745 to 775 in eth0 node.
- Added  snps,rx-sched-sp property to mtl_rx_setup1
---
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 197 +++++++++++++++++++++
 1 file changed, 197 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index 18ab5639b301..69964b313e38 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -701,6 +701,203 @@ sdhi2_vqmmc: vqmmc-regulator {
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


