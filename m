Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3C8A2E3663
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 28 Dec 2020 12:28:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726662AbgL1L2T (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 28 Dec 2020 06:28:19 -0500
Received: from www.zeus03.de ([194.117.254.33]:37442 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727163AbgL1L16 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Dec 2020 06:27:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=vkmgics4Aivxoo
        FY3MWEm8nR5Ee38vfG7+Lixr5wTV4=; b=wZM3jgcwouyEiPd3alq1NTbWlVTYgT
        lDQgRnZE+fpfF9oVD7bCCqxr56cwLpfDRCEj5Zw/HzFB8IOZMi2cRhJB9JsigP3A
        bx9lzxPXaoZACTuRTxosA+9f7A8wouj2IU8vdXjJHVzWkCswY2LU2RqG3bIpEPF6
        Zd2gwRCMlVHEA=
Received: (qmail 1738986 invoked from network); 28 Dec 2020 12:27:16 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Dec 2020 12:27:16 +0100
X-UD-Smtp-Session: l3s3148p1@UEBijoS3xpQgAwDPXwIpAOUwDQytQs2L
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linh Phung <linh.phung.jy@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] arm64: dts: renesas: r8a779a0: add & update SCIF nodes
Date:   Mon, 28 Dec 2020 12:27:08 +0100
Message-Id: <20201228112715.14947-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201228112715.14947-1-wsa+renesas@sang-engineering.com>
References: <20201228112715.14947-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This is the result of multiple patches taken from the BSP, combined,
rebased, and properly sorted. SCIF0 gets DMA properties, other SCIFs are
entirely new.

Signed-off-by: Linh Phung <linh.phung.jy@renesas.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 50 +++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index 68aaa49c3540..583cf2e232a0 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -656,11 +656,61 @@ scif0: serial@e6e60000 {
 				 <&cpg CPG_CORE R8A779A0_CLK_S1D2>,
 				 <&scif_clk>;
 			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac1 0x51>, <&dmac1 0x50>;
+			dma-names = "tx", "rx";
 			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
 			resets = <&cpg 702>;
 			status = "disabled";
 		};
 
+		scif1: serial@e6e68000 {
+			compatible = "renesas,scif-r8a779a0",
+				     "renesas,rcar-gen3-scif", "renesas,scif";
+			reg = <0 0xe6e68000 0 64>;
+			interrupts = <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 703>,
+				 <&cpg CPG_CORE R8A779A0_CLK_S1D2>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac1 0x53>, <&dmac1 0x52>;
+			dma-names = "tx", "rx";
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 703>;
+			status = "disabled";
+		};
+
+		scif4: serial@e6c40000 {
+			compatible = "renesas,scif-r8a779a0",
+				     "renesas,rcar-gen3-scif", "renesas,scif";
+			reg = <0 0xe6c40000 0 64>;
+			interrupts = <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 705>,
+				 <&cpg CPG_CORE R8A779A0_CLK_S1D2>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac1 0x59>, <&dmac1 0x58>;
+			dma-names = "tx", "rx";
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 705>;
+			status = "disabled";
+		};
+
+		scif3: serial@e6c50000 {
+			compatible = "renesas,scif-r8a779a0",
+				     "renesas,rcar-gen3-scif", "renesas,scif";
+			reg = <0 0xe6c50000 0 64>;
+			interrupts = <GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 704>,
+				 <&cpg CPG_CORE R8A779A0_CLK_S1D2>,
+				 <&scif_clk>;
+			clock-names = "fck", "brg_int", "scif_clk";
+			dmas = <&dmac1 0x57>, <&dmac1 0x56>;
+			dma-names = "tx", "rx";
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 704>;
+			status = "disabled";
+		};
+
 		dmac1: dma-controller@e7350000 {
 			reg = <0 0xe7350000 0 0x1000>;
 			#dma-cells = <1>;
-- 
2.29.2

