Return-Path: <linux-renesas-soc+bounces-16430-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D54C9A9FADC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Apr 2025 22:55:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F9C91A8644D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Apr 2025 20:55:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB34F20012C;
	Mon, 28 Apr 2025 20:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PcsODo/+"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69CF1FBE8A;
	Mon, 28 Apr 2025 20:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745873725; cv=none; b=utBi4NZyalm4PLMGBEi0Qm/ygB4Yq5be+ceCsjLyIRvnZAQpKZlZ1ZAP2QwoYMECosaQ9vlpkLQFy9FXUzidY0chrAkTUMSBjW0eaUX1cuJevHAHWMIBqiwya0nFfbykota+oVML9WNAHTQ7Ofy1JZILzgHo18QGXyikVAw353s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745873725; c=relaxed/simple;
	bh=tywGJEajZ/0KYn/9nCCXCHITXs3v8hcRIkX4Il0ZnWo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iPbejXMDtEaKWwMLeRABllHAkqOA5GX1IY1stAHMM0lgeqzMNwQUEieB0omsvRl7+bczQd9sknSpAUOmKJndc6S3nOb9WTjLKg6rhsp/fjHsUsEbpiiruafJz35a8mRDvdI2xz4HkThgld0Ogl7uE4nwClmrbsDf/VpJvyTo5eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PcsODo/+; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso33371175e9.0;
        Mon, 28 Apr 2025 13:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745873722; x=1746478522; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sJqmAEmLG5deGArmtU9OLFAQLsEZ1LvhT8cZ1irxdWE=;
        b=PcsODo/+04ZCW/nTMGkB1lBUVAdJQpxlNLun6J+1o2eH3HuwoAfQarvAZaKkQUC06i
         g80lxMqAAxKAFAAiiWEtF+tghBI6FH04LlmvfGVHds+y/GHv8zpocI6cJcD4V02aLJZm
         9Z7kJPzyI/xsxnvHUV1gYQGinVZsQrMhVGfuPeiXrJ3oURlvEJpK73fLG880mEdbm3w4
         HOaG4JIUhS3lvYcP4TEaXdTlsiSFdt3ISpJCwpcDkjM7iBkV5Xw9afSIOnqPWxlZoGnV
         ge5Gq2Pe23HF5fq1B5yVm9mV9K8jDtRVeYUpRnfd3hjdXxOi6T5oKspxlDkyWOM5va29
         47bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745873722; x=1746478522;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sJqmAEmLG5deGArmtU9OLFAQLsEZ1LvhT8cZ1irxdWE=;
        b=T3yQJM/HHZi0uxL+M1UDxbd24MviPPo4eBja+yIe8QyPeY/I8dGlibJmpIg1DaewMN
         LqvrbEYLOuckd2Bcd3TtyHgm+sve4oe4yg0B/eJd2wY30OsglerdwfvIR/ApDKql/kOo
         RvuPsoetvyKxn4JQeX+QDv/lfhZrX7Fw99PmVAE7ivKA1LcwKvQJ6mK3GeIiWlKvbP2T
         LCBBgPy21pbwngh9IsyHw8UQqyo2f2Yhkaom4+3/z28ha5sprsgW4F+ok7OOT7hZaINT
         S3zqyA+t04rSIsm3MzcI+ZL99SFZOQfImy1kgUXAjwX2n5N3pG1JhaKVVj1CLGDL4h+f
         21hA==
X-Forwarded-Encrypted: i=1; AJvYcCUJfLQYOwX04b/c+QbUYSgtDFJvTuMnDFkErvudr5Zz4BKvQcOdtOiBy8OG9vLI6BP5up6mFVNTsz4Tyg79@vger.kernel.org, AJvYcCVhBuk6HlUKStTEal8O/rnlZy00M4an5B0YGZBrBi0GpEegzSZ67YUe5uCihFg3xUl8oxdcJzC/mk/i@vger.kernel.org
X-Gm-Message-State: AOJu0YwyAyK0dIRSO0wK9EhyfuIYxyK9/z7MYEUBLAf3J0LkVYAyOmAM
	4DzLZfGPGwSM/2bUMlX5x52fKOgYIU46U9kBrbotCPoxeG2rgJr87MYBlUR3
X-Gm-Gg: ASbGncve6xK3cgbBkRdcFRrlFizfChfCMvVDW8jrCU8oB+eiDPQCCzt6QPeQ/xHX/0u
	2nYND84v1aAVrXQdfWCKVkStwU+g228h6JU9f5AVhQBZrmmCrAp+Ad8snoi9r3a1GcdnndpvPqO
	oSw2oYMiqi+Y9fTlhrhnuOAo1AXlfKh66aSFUXnSDIx16QjGB0c2vINMAXMrDI4XGJE7v28k2UD
	8LMq6QzQK2OUc99/xltivqkjLFtuqM16OTKY5wbEnaDxsaDpaOTd75WTBguLIFEhLKAbZ/1u9cO
	BMeVOc71l5EfgJqKYYkkox/B+EcA3at+8UbeMJaVzOGFNjVvlErVAciKnuLKrzYAuvYmwDxCdg=
	=
X-Google-Smtp-Source: AGHT+IH16Vi7Qtxlmy8Vr7THivvyu8q8glyHc/ckAMJfCUjCGAtvsy5mqo4l4fYeMHQKMUODir2JGg==
X-Received: by 2002:a05:600c:3b86:b0:43c:f509:2bbf with SMTP id 5b1f17b1804b1-441ad79c55amr144825e9.15.1745873722068;
        Mon, 28 Apr 2025 13:55:22 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:593b:8313:b361:2f0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2a2ac0sm167845705e9.15.2025.04.28.13.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 13:55:21 -0700 (PDT)
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
Subject: [PATCH 1/2] arm64: dts: renesas: r9a09g057: Add GBETH nodes
Date: Mon, 28 Apr 2025 21:55:17 +0100
Message-ID: <20250428205518.454960-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428205518.454960-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250428205518.454960-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
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
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi | 194 +++++++++++++++++++++
 1 file changed, 194 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
index 18ab5639b301..fd44de17e052 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g057.dtsi
@@ -701,6 +701,200 @@ sdhi2_vqmmc: vqmmc-regulator {
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
+				     <GIC_SPI 745 IRQ_TYPE_LEVEL_HIGH>,
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


