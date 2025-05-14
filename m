Return-Path: <linux-renesas-soc+bounces-17083-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AAFAB6888
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 May 2025 12:15:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98C2B3B12AD
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 May 2025 10:15:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0B4E27056D;
	Wed, 14 May 2025 10:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i/rkeN8V"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9923726FDB3;
	Wed, 14 May 2025 10:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747217738; cv=none; b=ndjubuhVGVBbv4S8WolFn5BXIlWv9/hWnzI/AmGiDZp4Qn/zVrMMB26OsGH5mylD3vIhawQ/S3LEDfxQb6rd50mfcWzhocklErrAePNnuMAz7tNIISWrAlczi/HpqIP/mH7+5Lt63e5lerOTPZ0okMCt8Z1pZUcx4VfJPqCOcow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747217738; c=relaxed/simple;
	bh=eukL9TCk8BnXnIdUcQP7og/WQ1x9dfuzvlCW03cE2Js=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NqMkqIsM/h7AZFtnyVGtFgMgznuObKr+jgJ6T29ZViiMysfLDVhnugAnih53wT5RvV7FBSJm4i9wCYZJGyItgBb8QX9UDUJ1nfzKIPyfzDV21GH3ZbwpCd0iBW1jQr6XOc4IeH2+oAYU4v+52K/bdVYLycS7TW9kqJxrj7au5bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i/rkeN8V; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3a1f5d2d91eso3824919f8f.1;
        Wed, 14 May 2025 03:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747217735; x=1747822535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PhlDQsdjdw0RanBiUCqMax4DhMt+IE2KXRBtFr2LhGE=;
        b=i/rkeN8VuTtg03Pjrx6PhWrIB/f/vJlv/B3BoM7gMG1tfsmrHnUbr/xpnOvdcYt6o+
         QKTJX1TJDNXTbky7ooxug415QIEoquk+LJzJHiEGk+JAoNA6Zl2KWFsmBxyT4cBAkYiM
         ocAOaVojqnbxH8K2qgvF+uETk7IVMISMtIQNY4+yhXeJkrvGfpNhMd3cI62D9omFKrxN
         U1ZdoVLpU4SE8rr2srob3RmBUxab32sXTqKGEBrz9NrrQ6vgVY8tjIPZgR8x6ub1uIpD
         IyBuwfNgcisE7OYS0lMGlsLacN9sZy12ML6Ps14WAivLyVuLbf+7IHTcPhDeY8Z63HYA
         fGXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747217735; x=1747822535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PhlDQsdjdw0RanBiUCqMax4DhMt+IE2KXRBtFr2LhGE=;
        b=bDaaezJFj3iXUpJq4qBkOHHup/qvYO6uzEJmFAO4fc91H2XXtoin6eSRRWGYWP0EWl
         CkhVgyzmQLQiH+WKXbnohsUCWQMe+4fumCWiD9aWcRXDr3IERHqy+8COUdoCRfjg32W1
         8SL1/rr4r9QvWDOnyeZMPs0eum55XZB9StVkjgb79vwWGNpkd594qaUepuOA6aMn/a5b
         e2oUNrNXp4nA7OwJC7s15T5YoRM/R86LumhJ1rkVx+oTuxtOf2YItBGfce4NC/H1YoGI
         ub6B1Da/w1DaacH2FOekz7MXIgPFf8xHs3IDkRLWbQc3+RG6An3Krf3MXr1m3gtnvCAu
         UqhA==
X-Forwarded-Encrypted: i=1; AJvYcCVIDxqDVl2KlBsIZrFpU3KKQiO/7J/rkiTIo6ihQCN6TWP+NFXLBVZcR36v9eetLx1rOTmxyyK8e5HFqm/SmdZv8S4=@vger.kernel.org, AJvYcCWN8JQkWslGwzFWWlKxuJTRq4jNr747oVseGeoiG4iFWUu66UXgCD41r70fuAUh/VFDM4/oInkFkDAkaiU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx175El0QV4CF1Rb9T8mrvb0hMWu3keOw88Ao0Tp6EXl5HpxJP5
	ch25RWSGyL/xd+8puWMf4AYw245foWFGWrA/8sk18ohNIxrgOKfO0dPGM46U
X-Gm-Gg: ASbGncu8goV5TlrsrYiQKNjaPPO1LXn/QkT8+lEmk/rOCQF+BXn1AieZITuVesr20wI
	DPdQDG5RY6cHirR6ZmPaZJfPxSOXVIczmjwwfLCdFUZ/ovHHIlR32u4/qboHH+W3Z0DWQ2dLx6M
	WokodrQBXk9SqxIFNnMeN+y6NridanJHGI75RA+U8Bu3jww+wyICk+HCu5rbD6i+rF9Ea+W/tW+
	2k3fDQO/Wdd2eVwchUtdN9udDxXarBPZ4/T6Upa1bId1PLpq7GX2uAGOet8RjAR2N11GPxGwclq
	0IZYig0bwi+jIHO46v7d7QbKhikdV1hzXPdssRPvhsrGnHZ/rnzmRbXid2V4Xa7lJX8eOJcIIER
	Y
X-Google-Smtp-Source: AGHT+IFhx/MBdPcI5SRemQkshzNR93hgdWRL/JavePqACvoBE5q8ns/HQKQV9OClpYExIRjlV0PFjw==
X-Received: by 2002:a05:6000:4007:b0:3a0:b4fa:a260 with SMTP id ffacd0b85a97d-3a349694664mr2193138f8f.5.1747217734555;
        Wed, 14 May 2025 03:15:34 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:6140:13af:687a:7a66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58f3afdsm19530249f8f.60.2025.05.14.03.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 03:15:33 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 01/10] arm64: dts: renesas: r9a09g056: Add GBETH nodes
Date: Wed, 14 May 2025 11:15:19 +0100
Message-ID: <20250514101528.41663-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250514101528.41663-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250514101528.41663-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Renesas RZ/V2N SoC is equipped with 2x Synopsys DesignWare Ethernet
Quality-of-Service IP block version 5.20. Add GBETH nodes to R9A09G056
RZ/V2N SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi | 209 +++++++++++++++++++++
 1 file changed, 209 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
index 90964bd864cc..0528c6a6ec12 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g056.dtsi
@@ -268,6 +268,215 @@ sdhi2_vqmmc: vqmmc-regulator {
 				status = "disabled";
 			};
 		};
+
+		eth0: ethernet@15c30000 {
+			compatible = "renesas,r9a09g056-gbeth", "renesas,rzv2h-gbeth",
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
+				  <&cpg CPG_CORE R9A09G056_GBETH_0_CLK_PTP_REF_I>,
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
+			compatible = "renesas,r9a09g056-gbeth", "renesas,rzv2h-gbeth",
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
+				  <&cpg CPG_CORE R9A09G056_GBETH_1_CLK_PTP_REF_I>,
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


