Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8EBE93D7E19
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 27 Jul 2021 20:55:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229763AbhG0Szs (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 27 Jul 2021 14:55:48 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:49485 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230270AbhG0Szr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Jul 2021 14:55:47 -0400
X-IronPort-AV: E=Sophos;i="5.84,274,1620658800"; 
   d="scan'208";a="88939039"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 28 Jul 2021 03:55:47 +0900
Received: from localhost.localdomain (unknown [10.226.92.236])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 05C34400C747;
        Wed, 28 Jul 2021 03:55:44 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 4/6] arm64: dts: renesas: r9a07g044: Add USB2.0 phy and host support
Date:   Tue, 27 Jul 2021 19:55:25 +0100
Message-Id: <20210727185527.19907-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210727185527.19907-1-biju.das.jz@bp.renesas.com>
References: <20210727185527.19907-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add USB2.0 phy and host support to SoC DT.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4->v5:
 * No change.
V3->v4:
 * Removed second reset from phy node.
 V3:
  * Added reset entries
  * Updated compatible, phy and reset entries.
---
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 94 ++++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
index 9a7489dc70d1..f0dcd086ba20 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
@@ -200,6 +200,100 @@
 			      <0x0 0x11940000 0 0x60000>;
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
 		};
+
+		phyrst: usbphy-ctrl@11c40000 {
+			compatible = "renesas,r9a07g044-usbphy-ctrl",
+				     "renesas,rzg2l-usbphy-ctrl";
+			reg = <0 0x11c40000 0 0x10000>;
+			clocks = <&cpg CPG_MOD R9A07G044_USB_PCLK>;
+			resets = <&cpg R9A07G044_USB_PRESETN>;
+			power-domains = <&cpg>;
+			#reset-cells = <1>;
+		};
+
+		ohci0: usb@11c50000 {
+			compatible = "generic-ohci";
+			reg = <0 0x11c50000 0 0x100>;
+			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A07G044_USB_PCLK>,
+				 <&cpg CPG_MOD R9A07G044_USB_U2H0_HCLK>;
+			resets = <&phyrst 0>,
+				 <&cpg R9A07G044_USB_U2H0_HRESETN>;
+			phys = <&usb2_phy0 1>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ohci1: usb@11c70000 {
+			compatible = "generic-ohci";
+			reg = <0 0x11c70000 0 0x100>;
+			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A07G044_USB_PCLK>,
+				 <&cpg CPG_MOD R9A07G044_USB_U2H1_HCLK>;
+			resets = <&phyrst 1>,
+				 <&cpg R9A07G044_USB_U2H1_HRESETN>;
+			phys = <&usb2_phy1 1>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ehci0: usb@11c50100 {
+			compatible = "generic-ehci";
+			reg = <0 0x11c50100 0 0x100>;
+			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A07G044_USB_PCLK>,
+				 <&cpg CPG_MOD R9A07G044_USB_U2H0_HCLK>;
+			resets = <&phyrst 0>,
+				 <&cpg R9A07G044_USB_U2H0_HRESETN>;
+			phys = <&usb2_phy0 2>;
+			phy-names = "usb";
+			companion = <&ohci0>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ehci1: usb@11c70100 {
+			compatible = "generic-ehci";
+			reg = <0 0x11c70100 0 0x100>;
+			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A07G044_USB_PCLK>,
+				 <&cpg CPG_MOD R9A07G044_USB_U2H1_HCLK>;
+			resets = <&phyrst 1>,
+				 <&cpg R9A07G044_USB_U2H1_HRESETN>;
+			phys = <&usb2_phy1 2>;
+			phy-names = "usb";
+			companion = <&ohci1>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		usb2_phy0: usb-phy@11c50200 {
+			compatible = "renesas,usb2-phy-r9a07g044",
+				     "renesas,rzg2l-usb2-phy";
+			reg = <0 0x11c50200 0 0x700>;
+			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A07G044_USB_PCLK>,
+				 <&cpg CPG_MOD R9A07G044_USB_U2H0_HCLK>;
+			resets = <&phyrst 0>;
+			#phy-cells = <1>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		usb2_phy1: usb-phy@11c70200 {
+			compatible = "renesas,usb2-phy-r9a07g044",
+				     "renesas,rzg2l-usb2-phy";
+			reg = <0 0x11c70200 0 0x700>;
+			interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A07G044_USB_PCLK>,
+				 <&cpg CPG_MOD R9A07G044_USB_U2H1_HCLK>;
+			resets = <&phyrst 1>;
+			#phy-cells = <1>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
 	};
 
 	timer {
-- 
2.17.1

