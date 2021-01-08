Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 661AC2EF0CF
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  8 Jan 2021 11:44:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727176AbhAHKoa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 8 Jan 2021 05:44:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727016AbhAHKo3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 8 Jan 2021 05:44:29 -0500
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50A8DC0612F4
        for <linux-renesas-soc@vger.kernel.org>; Fri,  8 Jan 2021 02:43:49 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by michel.telenet-ops.be with bizsmtp
        id EAjn2400A4C55Sk06AjnWn; Fri, 08 Jan 2021 11:43:48 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kxpFD-001zuW-7s; Fri, 08 Jan 2021 11:43:47 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kxpFC-008VI0-At; Fri, 08 Jan 2021 11:43:46 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] arm64: dts: renesas: r8a779a0: Add MSIOF device nodes
Date:   Fri,  8 Jan 2021 11:43:45 +0100
Message-Id: <20210108104345.2026857-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>

Add device nodes for the Clock-Synchronized Serial Interface with
FIFO (MSIOF) instances on the Renesas R-Car V3U (r8a779a0) SoC.

Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This depends on "[PATCH] arm64: dts: renesas: r8a779a0: Add SYS-DMAC
nodes"
https://lore.kernel.org/linux-arm-kernel/20210107182045.1948037-1-geert+renesas@glider.be/

v2:
  - Tested MSIOF1 and MSIOF2 (both PIO and DMA) with SPI external
    loopback (spi-loopback-test and loopback=1).
---
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi | 90 +++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
index 695913c8911afdeb..2b9b7d202b04e8c2 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0.dtsi
@@ -770,6 +770,96 @@ scif3: serial@e6c50000 {
 			status = "disabled";
 		};
 
+		msiof0: spi@e6e90000 {
+			compatible = "renesas,msiof-r8a779a0",
+				     "renesas,rcar-gen3-msiof";
+			reg = <0 0xe6e90000 0 0x0064>;
+			interrupts = <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 618>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 618>;
+			dmas = <&dmac1 0x41>, <&dmac1 0x40>;
+			dma-names = "tx", "rx";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		msiof1: spi@e6ea0000 {
+			compatible = "renesas,msiof-r8a779a0",
+				     "renesas,rcar-gen3-msiof";
+			reg = <0 0xe6ea0000 0 0x0064>;
+			interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 619>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 619>;
+			dmas = <&dmac1 0x43>, <&dmac1 0x42>;
+			dma-names = "tx", "rx";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		msiof2: spi@e6c00000 {
+			compatible = "renesas,msiof-r8a779a0",
+				     "renesas,rcar-gen3-msiof";
+			reg = <0 0xe6c00000 0 0x0064>;
+			interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 620>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 620>;
+			dmas = <&dmac1 0x45>, <&dmac1 0x44>;
+			dma-names = "tx", "rx";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		msiof3: spi@e6c10000 {
+			compatible = "renesas,msiof-r8a779a0",
+				     "renesas,rcar-gen3-msiof";
+			reg = <0 0xe6c10000 0 0x0064>;
+			interrupts = <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 621>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 621>;
+			dmas = <&dmac1 0x47>, <&dmac1 0x46>;
+			dma-names = "tx", "rx";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		msiof4: spi@e6c20000 {
+			compatible = "renesas,msiof-r8a779a0",
+				     "renesas,rcar-gen3-msiof";
+			reg = <0 0xe6c20000 0 0x0064>;
+			interrupts = <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 622>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 622>;
+			dmas = <&dmac1 0x49>, <&dmac1 0x48>;
+			dma-names = "tx", "rx";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		msiof5: spi@e6c28000 {
+			compatible = "renesas,msiof-r8a779a0",
+				     "renesas,rcar-gen3-msiof";
+			reg = <0 0xe6c28000 0 0x0064>;
+			interrupts = <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 623>;
+			power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+			resets = <&cpg 623>;
+			dmas = <&dmac1 0x4b>, <&dmac1 0x4a>;
+			dma-names = "tx", "rx";
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		dmac1: dma-controller@e7350000 {
 			compatible = "renesas,dmac-r8a779a0";
 			reg = <0 0xe7350000 0 0x1000>,
-- 
2.25.1

