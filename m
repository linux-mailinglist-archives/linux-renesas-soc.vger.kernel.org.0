Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 820EC2FE850
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 21 Jan 2021 12:05:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727306AbhAULD5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 21 Jan 2021 06:03:57 -0500
Received: from www.zeus03.de ([194.117.254.33]:34596 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730040AbhAULBK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Jan 2021 06:01:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:in-reply-to:references
        :mime-version:content-transfer-encoding; s=k1; bh=tai4jzgLzsKSoA
        1PiUzh+/Kw72UyovYb1MzcKUmmuVI=; b=JgM66WJiqQp7SKP/Tq7wMwRannC6n6
        xtyl+YgjpqEqp+VkGuUfV0WuTJQlSTtksrQesq3ueYq8jpBmV2aDyK/mLOGHQ37D
        JUemWT25QrEawnX57xDQo28feDxreDO27DLcEi541aUCcWYtUW6HqCCLwBhrFMgJ
        YQD9ESj5yP3+E=
Received: (qmail 1815162 invoked from network); 21 Jan 2021 12:00:14 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Jan 2021 12:00:14 +0100
X-UD-Smtp-Session: l3s3148p1@DkLk+Wa5Fr8gAwDPXyX1ACWcscxtZ2TX
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linh Phung <linh.phung.jy@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 1/4] arm64: dts: renesas: r8a779a0: add & update SCIF nodes
Date:   Thu, 21 Jan 2021 12:00:05 +0100
Message-Id: <20210121110008.15894-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210121110008.15894-1-wsa+renesas@sang-engineering.com>
References: <20210121110008.15894-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This is the result of multiple patches taken from the BSP, combined,
rebased, and properly sorted. SCIF0 gets DMA properties, other SCIFs are
entirely new.

Signed-off-by: Linh Phung <linh.phung.jy@renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
Changes since v1:
* fixed sorting

 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 50 +++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index 45b4ea1965d4..7e311b591d5c 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -663,11 +663,61 @@ scif0: serial@e6e60000 {
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
 		msiof0: spi@e6e90000 {
 			compatible = "renesas,msiof-r8a779a0",
 				     "renesas,rcar-gen3-msiof";
-- 
2.29.2

