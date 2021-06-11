Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0246B3A433E
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 11 Jun 2021 15:47:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231197AbhFKNtD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 11 Jun 2021 09:49:03 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:29237 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231253AbhFKNtD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Jun 2021 09:49:03 -0400
X-IronPort-AV: E=Sophos;i="5.83,265,1616425200"; 
   d="scan'208";a="83958019"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 11 Jun 2021 22:47:05 +0900
Received: from localhost.localdomain (unknown [10.226.92.121])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 2B3724274BCF;
        Fri, 11 Jun 2021 22:47:02 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 6/6] arm64: dts: renesas: r9a07g044: Add USB2.0 phy and host support
Date:   Fri, 11 Jun 2021 14:46:42 +0100
Message-Id: <20210611134642.24029-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210611134642.24029-1-biju.das.jz@bp.renesas.com>
References: <20210611134642.24029-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add USB2.0 phy and host support to SoC DT.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
This patch depend on [1]
[1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20210609153230.6967-11-prabhakar.mahadev-lad.rj@bp.renesas.com/
---
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 81 ++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
index 47f9fafd6c06..2ffdaed6c9a5 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
@@ -158,6 +158,87 @@
 			      <0x0 0x11940000 0 0x60000>;
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
 		};
+
+		usbphyctrl: usbphyctrl@11c40000 {
+			compatible = "renesas,r9a07g044-usbphyctrl",
+				     "renesas,rzg2l-usbphyctrl";
+			reg = <0 0x11c40000 0 0x10000>;
+			#phy-cells = <1>;
+		};
+
+		ohci0: usb@11c50000 {
+			compatible = "generic-ohci";
+			reg = <0 0x11c50000 0 0x100>;
+			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A07G044_CLK_USB0>;
+			resets = <&cpg R9A07G044_CLK_USB0>;
+			phys = <&usbphyctrl 0>, <&usb2_phy0 1>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ohci1: usb@11c70000 {
+			compatible = "generic-ohci";
+			reg = <0 0x11c70000 0 0x100>;
+			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A07G044_CLK_USB1>;
+			resets = <&cpg R9A07G044_CLK_USB1>;
+			phys = <&usbphyctrl 1>, <&usb2_phy1 1>;
+			phy-names = "usb";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ehci0: usb@11c50100 {
+			compatible = "generic-ehci";
+			reg = <0 0x11c50100 0 0x100>;
+			interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A07G044_CLK_USB0>;
+			resets = <&cpg R9A07G044_CLK_USB0>;
+			phys = <&usbphyctrl 0>, <&usb2_phy0 2>;
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
+			clocks = <&cpg CPG_MOD R9A07G044_CLK_USB1>;
+			resets = <&cpg R9A07G044_CLK_USB1>;
+			phys = <&usbphyctrl 1>, <&usb2_phy1 2>;
+			phy-names = "usb";
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
+			clocks = <&cpg CPG_MOD R9A07G044_CLK_USB0>;
+			resets = <&cpg R9A07G044_CLK_USB0>;
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
+			clocks = <&cpg CPG_MOD R9A07G044_CLK_USB1>;
+			resets = <&cpg R9A07G044_CLK_USB1>;
+			#phy-cells = <1>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
 	};
 
 	timer {
-- 
2.17.1

