Return-Path: <linux-renesas-soc+bounces-18068-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E64D5AD4B4E
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Jun 2025 08:19:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 900ED16586C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Jun 2025 06:18:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEF7523184B;
	Wed, 11 Jun 2025 06:16:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59014231844;
	Wed, 11 Jun 2025 06:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749622590; cv=none; b=eFGyHsybRxFBjcTORKtIBMtVwHg4NwJrJqWnoaeooRmYMEEITt/JLzPbc8D7My8JErN1vGx9Qx0FBaAXZC8vwAOW8NJmDlVXIhIALgJKGwOCwRrG2DdsYB/VcIdxpDIgmSRV7Z1X67so+zmE994IQPwc1VZ61zzQ4smCx8EToQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749622590; c=relaxed/simple;
	bh=SHgyJkJw6ts5JXxTF0Om4+r++lflqduzleGEnmAsJWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q3nJ20Py5QsSIciVr3PrRvKVyarpLiY4bITEiuFiUgYBbfUAjn7W7EDCLnaczjYF+GVjE8jq4QcpTAa724zqKzaowUV2U6ElDXlilxU9x3Y6CwNzOiLgx6GBeRHX/1H/gBEzP/locSC+Mc9kZkTv8hd1OtymNxAKyblvA/tWSV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: JCaD0eQUQEKe8ikXkbRQuw==
X-CSE-MsgGUID: fsyhh0LGQCSKXK+G4YRJEQ==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 11 Jun 2025 15:16:28 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.57])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0DD59401BEEC;
	Wed, 11 Jun 2025 15:16:22 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: andrew+netdev@lunn.ch,
	conor+dt@kernel.org,
	davem@davemloft.net,
	edumazet@google.com,
	geert+renesas@glider.be,
	krzk+dt@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	robh@kernel.org
Cc: biju.das.jz@bp.renesas.com,
	devicetree@vger.kernel.org,
	john.madieu@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	magnus.damm@gmail.com,
	netdev@vger.kernel.org,
	John Madieu <john.madieu.xa@bp.renesas.com>
Subject: [PATCH v2 2/3] arm64: dts: renesas: r9a09g047: Add GBETH nodes
Date: Wed, 11 Jun 2025 08:16:08 +0200
Message-ID: <20250611061609.15527-3-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250611061609.15527-1-john.madieu.xa@bp.renesas.com>
References: <20250611061609.15527-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add GBETH nodes to RZ/G3E (R9A09G047) SoC DTSI.

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Tested-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi | 207 +++++++++++++++++++++
 1 file changed, 207 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
index a0d4fab4fe05..e6e35b41a9d3 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g047.dtsi
@@ -759,6 +759,213 @@ csi2cru: endpoint@0 {
 				};
 			};
 		};
+
+		eth0: ethernet@15c30000 {
+			compatible = "renesas,r9a09g047-gbeth", "renesas,rzv2h-gbeth", "snps,dwmac-5.20";
+			reg = <0 0x15c30000 0 0x10000>;
+			clocks = <&cpg CPG_MOD 0xbd>, <&cpg CPG_MOD 0xbc>,
+				 <&cpg CPG_CORE R9A09G047_GBETH_0_CLK_PTP_REF_I>,
+				 <&cpg CPG_MOD 0xb8>, <&cpg CPG_MOD 0xb9>,
+				 <&cpg CPG_MOD 0xba>, <&cpg CPG_MOD 0xbb>;
+			clock-names = "stmmaceth", "pclk", "ptp_ref",
+				      "tx", "rx", "tx-180", "rx-180";
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
+			mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
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
+			compatible = "renesas,r9a09g047-gbeth", "renesas,rzv2h-gbeth", "snps,dwmac-5.20";
+			reg = <0 0x15c40000 0 0x10000>;
+			clocks = <&cpg CPG_MOD 0xc3>, <&cpg CPG_MOD 0xc2>,
+				 <&cpg CPG_CORE R9A09G047_GBETH_1_CLK_PTP_REF_I>,
+				 <&cpg CPG_MOD 0xbe>, <&cpg CPG_MOD 0xbf>,
+				 <&cpg CPG_MOD 0xc0>, <&cpg CPG_MOD 0xc1>;
+			clock-names = "stmmaceth", "pclk", "ptp_ref",
+				      "tx", "rx", "tx-180", "rx-180";
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
+			mdio {
+				compatible = "snps,dwmac-mdio";
+				#address-cells = <1>;
+				#size-cells = <0>;
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
2.25.1


