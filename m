Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F15D2834FA
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Oct 2020 13:30:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725937AbgJELaM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 5 Oct 2020 07:30:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725843AbgJELaB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Oct 2020 07:30:01 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D997C0613CE
        for <linux-renesas-soc@vger.kernel.org>; Mon,  5 Oct 2020 04:30:00 -0700 (PDT)
Received: from ramsan ([84.195.186.194])
        by baptiste.telenet-ops.be with bizsmtp
        id cBVy2300N4C55Sk01BVyg1; Mon, 05 Oct 2020 13:29:58 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kPOgo-0005Li-I5; Mon, 05 Oct 2020 13:29:58 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1kPOgo-0005sA-Gc; Mon, 05 Oct 2020 13:29:58 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] arm64: dts: renesas: r8a77961: Add MSIOF nodes
Date:   Mon,  5 Oct 2020 13:29:51 +0200
Message-Id: <20201005112951.22532-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add the device nodes for all Clock-Synchronized Serial Interface with
FIFO (MSIOF) instances on R-Car M3-W+.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Tested on Salvator-XS with R-Car M3-W+, using MSIOF2A loopback
(MOSI = EXIO D pin 21 <-> MISO = EXIO D pin 23),
CONFIG_SPI_LOOPBACK_TEST, and the following appended to
arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dts:

    &pfc {
	    msiof2_pins: msiof2 {
		    groups = "msiof2_clk_a", "msiof2_sync_a",
			     "msiof2_rxd_a", "msiof2_txd_a";
		    function = "msiof2";
	    };
    };

    &msiof2 {
	    pinctrl-0 = <&msiof2_pins>;
	    pinctrl-names = "default";

	    #address-cells = <1>;
	    #size-cells = <0>;
	    status = "okay";

	    spidev@0 {
		    compatible = "linux,spi-loopback-test";
		    reg = <0>;
		    spi-max-frequency = <10000000>;
	    };
    };

Yielding:

    spi-loopback-test spi0.0: Executing spi-loopback-tests
    spi-loopback-test spi0.0: Running test tx/rx-transfer - start of page
    ...
    spi-loopback-test spi0.0:   with iteration values: len = 131072, tx_off = 0, rx_off = 0
    spi-loopback-test spi0.0: Finished spi-loopback-tests with return: 0
---
 arch/arm64/boot/dts/renesas/r8a77961.dtsi | 62 +++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
index 720592a91f5c0590..9266c60f21faf2b8 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
@@ -1189,6 +1189,68 @@
 			status = "disabled";
 		};
 
+		msiof0: spi@e6e90000 {
+			compatible = "renesas,msiof-r8a77961",
+				     "renesas,rcar-gen3-msiof";
+			reg = <0 0xe6e90000 0 0x0064>;
+			interrupts = <GIC_SPI 156 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 211>;
+			dmas = <&dmac1 0x41>, <&dmac1 0x40>,
+			       <&dmac2 0x41>, <&dmac2 0x40>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
+			resets = <&cpg 211>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		msiof1: spi@e6ea0000 {
+			compatible = "renesas,msiof-r8a77961",
+				     "renesas,rcar-gen3-msiof";
+			reg = <0 0xe6ea0000 0 0x0064>;
+			interrupts = <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 210>;
+			dmas = <&dmac1 0x43>, <&dmac1 0x42>,
+			       <&dmac2 0x43>, <&dmac2 0x42>;
+			dma-names = "tx", "rx", "tx", "rx";
+			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
+			resets = <&cpg 210>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		msiof2: spi@e6c00000 {
+			compatible = "renesas,msiof-r8a77961",
+				     "renesas,rcar-gen3-msiof";
+			reg = <0 0xe6c00000 0 0x0064>;
+			interrupts = <GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 209>;
+			dmas = <&dmac0 0x45>, <&dmac0 0x44>;
+			dma-names = "tx", "rx";
+			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
+			resets = <&cpg 209>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		msiof3: spi@e6c10000 {
+			compatible = "renesas,msiof-r8a77961",
+				     "renesas,rcar-gen3-msiof";
+			reg = <0 0xe6c10000 0 0x0064>;
+			interrupts = <GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD 208>;
+			dmas = <&dmac0 0x47>, <&dmac0 0x46>;
+			dma-names = "tx", "rx";
+			power-domains = <&sysc R8A77961_PD_ALWAYS_ON>;
+			resets = <&cpg 208>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		vin0: video@e6ef0000 {
 			reg = <0 0xe6ef0000 0 0x1000>;
 			/* placeholder */
-- 
2.17.1

