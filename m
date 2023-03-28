Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44B106CC24F
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 28 Mar 2023 16:42:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233009AbjC1OmP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 28 Mar 2023 10:42:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233020AbjC1OmJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 28 Mar 2023 10:42:09 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB3914EEC
        for <linux-renesas-soc@vger.kernel.org>; Tue, 28 Mar 2023 07:42:01 -0700 (PDT)
Received: from ramsan.of.borg ([84.195.187.55])
        by andre.telenet-ops.be with bizsmtp
        id dqhy2900f1C8whw01qhyj0; Tue, 28 Mar 2023 16:41:59 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1phAVf-00F96J-4l;
        Tue, 28 Mar 2023 16:41:58 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1phAWM-006GAn-Lq;
        Tue, 28 Mar 2023 16:41:58 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 1/2] ARM: dts: r8a7779: Add PCIe nodes
Date:   Tue, 28 Mar 2023 16:41:56 +0200
Message-Id: <2a266c049a1899330d73fbaa47b004ca0af7cde5.1680012171.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680012171.git.geert+renesas@glider.be>
References: <cover.1680012171.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.4 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add device nodes for the PCI Express controller and the related
external PCIe bus clock on the Renesas R-Car H1 (R8A7779) SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Comparing this to R-Car Gen2 SoCs (r8a779[01].dtsi), the latter have an
extra dma-ranges entry:

    <0x43000000 1 0x80000000 1 0x80000000 0 0x80000000>

However, R-Car Gen2 supports LPAE, while R-Car H1 does not.

Does this need an entry with 0x43000000? After +25 years of exposue, I
still can't say I understand the PCI DT bindings...
---
 arch/arm/boot/dts/r8a7779.dtsi | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm/boot/dts/r8a7779.dtsi b/arch/arm/boot/dts/r8a7779.dtsi
index 97b767d81d926049..bba0c6d2386cd042 100644
--- a/arch/arm/boot/dts/r8a7779.dtsi
+++ b/arch/arm/boot/dts/r8a7779.dtsi
@@ -563,6 +563,13 @@ extal_clk: extal {
 			clock-frequency = <0>;
 		};
 
+		/* External PCIe clock - can be overridden by the board */
+		pcie_bus_clk: pcie-bus {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <0>;
+		};
+
 		/* External SCIF clock */
 		scif_clk: scif {
 			compatible = "fixed-clock";
@@ -699,6 +706,31 @@ R8A7779_CLK_MMC1 R8A7779_CLK_MMC0
 		};
 	};
 
+	pciec: pcie@fe000000 {
+		compatible = "renesas,pcie-r8a7779";
+		reg = <0xfe000000 0x80000>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		bus-range = <0x00 0xff>;
+		device_type = "pci";
+		ranges = <0x01000000 0 0x00000000 0xfe100000 0 0x00100000>,
+			 <0x02000000 0 0xfe200000 0xfe200000 0 0x00200000>,
+			 <0x02000000 0 0x20000000 0x20000000 0 0x20000000>,
+			 <0x42000000 0 0xc0000000 0xc0000000 0 0x20000000>;
+		/* Map all possible DDR as inbound ranges */
+		dma-ranges = <0x42000000 0 0x40000000 0x40000000 0 0x80000000>;
+		interrupts = <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
+		#interrupt-cells = <1>;
+		interrupt-map-mask = <0 0 0 0>;
+		interrupt-map = <0 0 0 0 &gic GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&mstp1_clks R8A7779_CLK_PCIE>, <&pcie_bus_clk>;
+		clock-names = "pcie", "pcie_bus";
+		power-domains = <&sysc R8A7779_PD_ALWAYS_ON>;
+		status = "disabled";
+	};
+
 	prr: chipid@ff000044 {
 		compatible = "renesas,prr";
 		reg = <0xff000044 4>;
-- 
2.34.1

