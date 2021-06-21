Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5C3F3AE643
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Jun 2021 11:40:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230288AbhFUJm3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Jun 2021 05:42:29 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:12185 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230433AbhFUJm2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Jun 2021 05:42:28 -0400
X-IronPort-AV: E=Sophos;i="5.83,289,1616425200"; 
   d="scan'208";a="84924704"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 21 Jun 2021 18:40:14 +0900
Received: from localhost.localdomain (unknown [10.226.92.241])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2C623400C9E2;
        Mon, 21 Jun 2021 18:40:11 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 08/11] arm64: dts: renesas: r9a07g044: Add USB2.0 phy and host support
Date:   Mon, 21 Jun 2021 10:39:40 +0100
Message-Id: <20210621093943.12143-9-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210621093943.12143-1-biju.das.jz@bp.renesas.com>
References: <20210621093943.12143-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add USB2.0 phy and host support to SoC DT.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 100 +++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
index 397e3b182c02..ae71404c6238 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
@@ -236,6 +236,106 @@
 			      <0x0 0x11940000 0 0x60000>;
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
 		};
+
+		usbphyctrl: usbphyctrl@11c40000 {
+			compatible = "renesas,r9a07g044-usbphyctrl",
+				     "renesas,rzg2l-usbphyctrl";
+			reg = <0 0x11c40000 0 0x10000>;
+			clocks = <&cpg CPG_MOD R9A07G044_USB_PCLK>;
+			resets = <&cpg R9A07G044_USB_PCLK>;
+			power-domains = <&cpg>;
+			#phy-cells = <1>;
+		};
+
+		ohci0: usb@11c50000 {
+			compatible = "renesas,r9a07g044-ohci",
+				     "generic-ohci";
+			reg = <0 0x11c50000 0 0x100>;
+			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A07G044_USB_PCLK>,
+				 <&cpg CPG_MOD R9A07G044_USB_U2H0_HCLK>;
+			resets = <&cpg R9A07G044_USB_PCLK>,
+				 <&cpg R9A07G044_USB_U2H0_HCLK>;
+			phys = <&usbphyctrl 0>, <&usb2_phy0 1>;
+			phy-names = "usbphyctrl", "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ohci1: usb@11c70000 {
+			compatible = "renesas,r9a07g044-ohci",
+				     "generic-ohci";
+			reg = <0 0x11c70000 0 0x100>;
+			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A07G044_USB_PCLK>,
+				 <&cpg CPG_MOD R9A07G044_USB_U2H1_HCLK>;
+			resets = <&cpg R9A07G044_USB_PCLK>,
+				 <&cpg R9A07G044_USB_U2H1_HCLK>;
+			phys = <&usbphyctrl 1>, <&usb2_phy1 1>;
+			phy-names = "usbphyctrl", "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ehci0: usb@11c50100 {
+			compatible = "renesas,r9a07g044-ehci",
+				     "generic-ehci";
+			reg = <0 0x11c50100 0 0x100>;
+			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A07G044_USB_PCLK>,
+				 <&cpg CPG_MOD R9A07G044_USB_U2H0_HCLK>;
+			resets = <&cpg R9A07G044_USB_PCLK>,
+				 <&cpg R9A07G044_USB_U2H0_HCLK>;
+			phys = <&usbphyctrl 0>, <&usb2_phy0 2>;
+			phy-names = "usbphyctrl", "usb";
+			companion = <&ohci0>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ehci1: usb@11c70100 {
+			compatible = "renesas,r9a07g044-ehci",
+				     "generic-ehci";
+			reg = <0 0x11c70100 0 0x100>;
+			interrupts = <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A07G044_USB_PCLK>,
+				 <&cpg CPG_MOD R9A07G044_USB_U2H1_HCLK>;
+			resets = <&cpg R9A07G044_USB_PCLK>,
+				 <&cpg R9A07G044_USB_U2H1_HCLK>;
+			phys = <&usbphyctrl 1>, <&usb2_phy1 2>;
+			phy-names = "usbphyctrl", "usb";
+			companion = <&ohci1>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		usb2_phy0: usb-phy@11c50200 {
+			compatible = "renesas,usb2-phy-r9a07g044",
+				     "renesas,rcar-gen3-usb2-phy";
+			reg = <0 0x11c50200 0 0x700>;
+			interrupts = <GIC_SPI 94 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A07G044_USB_PCLK>,
+				 <&cpg CPG_MOD R9A07G044_USB_U2H0_HCLK>;
+			resets = <&cpg R9A07G044_USB_PCLK>,
+				 <&cpg R9A07G044_USB_U2H0_HCLK>;
+			#phy-cells = <1>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		usb2_phy1: usb-phy@11c70200 {
+			compatible = "renesas,usb2-phy-r9a07g044",
+				     "renesas,rcar-gen3-usb2-phy";
+			reg = <0 0x11c70200 0 0x700>;
+			interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A07G044_USB_PCLK>,
+				 <&cpg CPG_MOD R9A07G044_USB_U2H1_HCLK>;
+			resets = <&cpg R9A07G044_USB_PCLK>,
+				 <&cpg R9A07G044_USB_U2H1_HCLK>;
+			#phy-cells = <1>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
 	};
 
 	timer {
-- 
2.17.1

