Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F9FF50E66E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Apr 2022 19:05:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240496AbiDYRIy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Apr 2022 13:08:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240888AbiDYRIx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Apr 2022 13:08:53 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B7EBD27141;
        Mon, 25 Apr 2022 10:05:47 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,288,1643641200"; 
   d="scan'208";a="119104480"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 26 Apr 2022 02:05:47 +0900
Received: from localhost.localdomain (unknown [10.226.93.95])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 5E5C04004D06;
        Tue, 26 Apr 2022 02:05:44 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 03/13] arm64: dts: renesas: r9a07g043: Add USB2.0 support
Date:   Mon, 25 Apr 2022 18:05:20 +0100
Message-Id: <20220425170530.200921-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220425170530.200921-1-biju.das.jz@bp.renesas.com>
References: <20220425170530.200921-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add USB2.0 host and device support by filling usb phy control,
phy, device and host stub nodes in RZ/G2UL SoC dtsi.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a07g043.dtsi | 90 ++++++++++++++++++++--
 1 file changed, 82 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
index ef8550a2de09..8bcda969d130 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
@@ -551,43 +551,117 @@ eth1: ethernet@11c30000 {
 		};
 
 		phyrst: usbphy-ctrl@11c40000 {
+			compatible = "renesas,r9a07g043-usbphy-ctrl",
+				     "renesas,rzg2l-usbphy-ctrl";
 			reg = <0 0x11c40000 0 0x10000>;
-			/* place holder */
+			clocks = <&cpg CPG_MOD R9A07G043_USB_PCLK>;
+			resets = <&cpg R9A07G043_USB_PRESETN>;
+			power-domains = <&cpg>;
+			#reset-cells = <1>;
+			status = "disabled";
 		};
 
 		ohci0: usb@11c50000 {
+			compatible = "generic-ohci";
 			reg = <0 0x11c50000 0 0x100>;
-			/* place holder */
+			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A07G043_USB_PCLK>,
+				 <&cpg CPG_MOD R9A07G043_USB_U2H0_HCLK>;
+			resets = <&phyrst 0>,
+				 <&cpg R9A07G043_USB_U2H0_HRESETN>;
+			phys = <&usb2_phy0 1>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
 		};
 
 		ohci1: usb@11c70000 {
+			compatible = "generic-ohci";
 			reg = <0 0x11c70000 0 0x100>;
-			/* place holder */
+			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A07G043_USB_PCLK>,
+				 <&cpg CPG_MOD R9A07G043_USB_U2H1_HCLK>;
+			resets = <&phyrst 1>,
+				 <&cpg R9A07G043_USB_U2H1_HRESETN>;
+			phys = <&usb2_phy1 1>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
 		};
 
 		ehci0: usb@11c50100 {
+			compatible = "generic-ehci";
 			reg = <0 0x11c50100 0 0x100>;
-			/* place holder */
+			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A07G043_USB_PCLK>,
+				 <&cpg CPG_MOD R9A07G043_USB_U2H0_HCLK>;
+			resets = <&phyrst 0>,
+				 <&cpg R9A07G043_USB_U2H0_HRESETN>;
+			phys = <&usb2_phy0 2>;
+			phy-names = "usb";
+			companion = <&ohci0>;
+			power-domains = <&cpg>;
+			status = "disabled";
 		};
 
 		ehci1: usb@11c70100 {
+			compatible = "generic-ehci";
 			reg = <0 0x11c70100 0 0x100>;
-			/* place holder */
+			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A07G043_USB_PCLK>,
+				 <&cpg CPG_MOD R9A07G043_USB_U2H1_HCLK>;
+			resets = <&phyrst 1>,
+				 <&cpg R9A07G043_USB_U2H1_HRESETN>;
+			phys = <&usb2_phy1 2>;
+			phy-names = "usb";
+			companion = <&ohci1>;
+			power-domains = <&cpg>;
+			status = "disabled";
 		};
 
 		usb2_phy0: usb-phy@11c50200 {
+			compatible = "renesas,usb2-phy-r9a07g043",
+				     "renesas,rzg2l-usb2-phy";
 			reg = <0 0x11c50200 0 0x700>;
-			/* place holder */
+			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A07G043_USB_PCLK>,
+				 <&cpg CPG_MOD R9A07G043_USB_U2H0_HCLK>;
+			resets = <&phyrst 0>;
+			#phy-cells = <1>;
+			power-domains = <&cpg>;
+			status = "disabled";
 		};
 
 		usb2_phy1: usb-phy@11c70200 {
+			compatible = "renesas,usb2-phy-r9a07g043",
+				     "renesas,rzg2l-usb2-phy";
 			reg = <0 0x11c70200 0 0x700>;
-			/* place holder */
+			interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A07G043_USB_PCLK>,
+				 <&cpg CPG_MOD R9A07G043_USB_U2H1_HCLK>;
+			resets = <&phyrst 1>;
+			#phy-cells = <1>;
+			power-domains = <&cpg>;
+			status = "disabled";
 		};
 
 		hsusb: usb@11c60000 {
+			compatible = "renesas,usbhs-r9a07g043",
+				     "renesas,rza2-usbhs";
 			reg = <0 0x11c60000 0 0x10000>;
-			/* place holder */
+			interrupts = <GIC_SPI 100 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 101 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A07G043_USB_PCLK>,
+				 <&cpg CPG_MOD R9A07G043_USB_U2P_EXR_CPUCLK>;
+			resets = <&phyrst 0>,
+				 <&cpg R9A07G043_USB_U2P_EXL_SYSRST>;
+			renesas,buswait = <7>;
+			phys = <&usb2_phy0 3>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
 		};
 
 		wdt0: watchdog@12800800 {
-- 
2.25.1

