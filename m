Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5778F27B75
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 23 May 2019 13:11:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729962AbfEWLLp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 23 May 2019 07:11:45 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:57966 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728518AbfEWLLo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 May 2019 07:11:44 -0400
X-IronPort-AV: E=Sophos;i="5.60,502,1549897200"; 
   d="scan'208";a="16567050"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 23 May 2019 20:11:40 +0900
Received: from localhost.localdomain (unknown [10.166.17.210])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 9B8094009BCA;
        Thu, 23 May 2019 20:11:40 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     horms@verge.net.au, magnus.damm@gmail.com
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] arm64: dts: renesas: Revise usb2_phy nodes and phys properties
Date:   Thu, 23 May 2019 20:06:56 +0900
Message-Id: <1558609616-10438-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Since the commit 233da2c9ec22 ("dt-bindings: phy: rcar-gen3-phy-usb2:
Revise #phy-cells property") revised the #phy-cells, this patch follows
the updated document for R-Car Gen3 and RZ/A2 SoCs.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 14 +++++++-------
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi |  8 ++++----
 arch/arm64/boot/dts/renesas/r8a7795.dtsi  | 28 ++++++++++++++--------------
 arch/arm64/boot/dts/renesas/r8a7796.dtsi  | 14 +++++++-------
 arch/arm64/boot/dts/renesas/r8a77965.dtsi | 14 +++++++-------
 arch/arm64/boot/dts/renesas/r8a77990.dtsi |  8 ++++----
 arch/arm64/boot/dts/renesas/r8a77995.dtsi |  8 ++++----
 7 files changed, 47 insertions(+), 47 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
index ff9bc16..c2d99f5 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
@@ -606,7 +606,7 @@
 			       <&usb_dmac1 0>, <&usb_dmac1 1>;
 			dma-names = "ch0", "ch1", "ch2", "ch3";
 			renesas,buswait = <11>;
-			phys = <&usb2_phy0>;
+			phys = <&usb2_phy0 3>;
 			phy-names = "usb";
 			power-domains = <&sysc R8A774A1_PD_ALWAYS_ON>;
 			resets = <&cpg 704>;
@@ -1733,7 +1733,7 @@
 			reg = <0 0xee080000 0 0x100>;
 			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 703>;
-			phys = <&usb2_phy0>;
+			phys = <&usb2_phy0 1>;
 			phy-names = "usb";
 			power-domains = <&sysc R8A774A1_PD_ALWAYS_ON>;
 			resets = <&cpg 703>;
@@ -1745,7 +1745,7 @@
 			reg = <0 0xee0a0000 0 0x100>;
 			interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 702>;
-			phys = <&usb2_phy1>;
+			phys = <&usb2_phy1 1>;
 			phy-names = "usb";
 			power-domains = <&sysc R8A774A1_PD_ALWAYS_ON>;
 			resets = <&cpg 702>;
@@ -1757,7 +1757,7 @@
 			reg = <0 0xee080100 0 0x100>;
 			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 703>;
-			phys = <&usb2_phy0>;
+			phys = <&usb2_phy0 2>;
 			phy-names = "usb";
 			companion = <&ohci0>;
 			power-domains = <&sysc R8A774A1_PD_ALWAYS_ON>;
@@ -1770,7 +1770,7 @@
 			reg = <0 0xee0a0100 0 0x100>;
 			interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 702>;
-			phys = <&usb2_phy1>;
+			phys = <&usb2_phy1 2>;
 			phy-names = "usb";
 			companion = <&ohci1>;
 			power-domains = <&sysc R8A774A1_PD_ALWAYS_ON>;
@@ -1786,7 +1786,7 @@
 			clocks = <&cpg CPG_MOD 703>;
 			power-domains = <&sysc R8A774A1_PD_ALWAYS_ON>;
 			resets = <&cpg 703>;
-			#phy-cells = <0>;
+			#phy-cells = <1>;
 			status = "disabled";
 		};
 
@@ -1797,7 +1797,7 @@
 			clocks = <&cpg CPG_MOD 702>;
 			power-domains = <&sysc R8A774A1_PD_ALWAYS_ON>;
 			resets = <&cpg 702>;
-			#phy-cells = <0>;
+			#phy-cells = <1>;
 			status = "disabled";
 		};
 
diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
index 500b7bd..e7b5bf2 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
@@ -684,7 +684,7 @@
 			       <&usb_dmac1 0>, <&usb_dmac1 1>;
 			dma-names = "ch0", "ch1", "ch2", "ch3";
 			renesas,buswait = <11>;
-			phys = <&usb2_phy0>;
+			phys = <&usb2_phy0 3>;
 			phy-names = "usb";
 			power-domains = <&sysc R8A774C0_PD_ALWAYS_ON>;
 			resets = <&cpg 704>, <&cpg 703>;
@@ -1580,7 +1580,7 @@
 			reg = <0 0xee080000 0 0x100>;
 			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>;
-			phys = <&usb2_phy0>;
+			phys = <&usb2_phy0 1>;
 			phy-names = "usb";
 			power-domains = <&sysc R8A774C0_PD_ALWAYS_ON>;
 			resets = <&cpg 703>, <&cpg 704>;
@@ -1592,7 +1592,7 @@
 			reg = <0 0xee080100 0 0x100>;
 			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>;
-			phys = <&usb2_phy0>;
+			phys = <&usb2_phy0 2>;
 			phy-names = "usb";
 			companion = <&ohci0>;
 			power-domains = <&sysc R8A774C0_PD_ALWAYS_ON>;
@@ -1608,7 +1608,7 @@
 			clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>;
 			power-domains = <&sysc R8A774C0_PD_ALWAYS_ON>;
 			resets = <&cpg 703>, <&cpg 704>;
-			#phy-cells = <0>;
+			#phy-cells = <1>;
 			status = "disabled";
 		};
 
diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
index 7a8fd80..e09bd31 100644
--- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
@@ -812,7 +812,7 @@
 			       <&usb_dmac1 0>, <&usb_dmac1 1>;
 			dma-names = "ch0", "ch1", "ch2", "ch3";
 			renesas,buswait = <11>;
-			phys = <&usb2_phy0>;
+			phys = <&usb2_phy0 3>;
 			phy-names = "usb";
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 			resets = <&cpg 704>, <&cpg 703>;
@@ -829,7 +829,7 @@
 			       <&usb_dmac3 0>, <&usb_dmac3 1>;
 			dma-names = "ch0", "ch1", "ch2", "ch3";
 			renesas,buswait = <11>;
-			phys = <&usb2_phy3>;
+			phys = <&usb2_phy3 3>;
 			phy-names = "usb";
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 			resets = <&cpg 705>, <&cpg 700>;
@@ -2416,7 +2416,7 @@
 			reg = <0 0xee080000 0 0x100>;
 			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>;
-			phys = <&usb2_phy0>;
+			phys = <&usb2_phy0 1>;
 			phy-names = "usb";
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 			resets = <&cpg 703>, <&cpg 704>;
@@ -2428,7 +2428,7 @@
 			reg = <0 0xee0a0000 0 0x100>;
 			interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 702>;
-			phys = <&usb2_phy1>;
+			phys = <&usb2_phy1 1>;
 			phy-names = "usb";
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 			resets = <&cpg 702>;
@@ -2440,7 +2440,7 @@
 			reg = <0 0xee0c0000 0 0x100>;
 			interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 701>;
-			phys = <&usb2_phy2>;
+			phys = <&usb2_phy2 1>;
 			phy-names = "usb";
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 			resets = <&cpg 701>;
@@ -2452,7 +2452,7 @@
 			reg = <0 0xee0e0000 0 0x100>;
 			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 700>, <&cpg CPG_MOD 705>;
-			phys = <&usb2_phy3>;
+			phys = <&usb2_phy3 1>;
 			phy-names = "usb";
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 			resets = <&cpg 700>, <&cpg 705>;
@@ -2464,7 +2464,7 @@
 			reg = <0 0xee080100 0 0x100>;
 			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>;
-			phys = <&usb2_phy0>;
+			phys = <&usb2_phy0 2>;
 			phy-names = "usb";
 			companion = <&ohci0>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
@@ -2477,7 +2477,7 @@
 			reg = <0 0xee0a0100 0 0x100>;
 			interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 702>;
-			phys = <&usb2_phy1>;
+			phys = <&usb2_phy1 2>;
 			phy-names = "usb";
 			companion = <&ohci1>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
@@ -2490,7 +2490,7 @@
 			reg = <0 0xee0c0100 0 0x100>;
 			interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 701>;
-			phys = <&usb2_phy2>;
+			phys = <&usb2_phy2 2>;
 			phy-names = "usb";
 			companion = <&ohci2>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
@@ -2503,7 +2503,7 @@
 			reg = <0 0xee0e0100 0 0x100>;
 			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 700>, <&cpg CPG_MOD 705>;
-			phys = <&usb2_phy3>;
+			phys = <&usb2_phy3 2>;
 			phy-names = "usb";
 			companion = <&ohci3>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
@@ -2519,7 +2519,7 @@
 			clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 			resets = <&cpg 703>, <&cpg 704>;
-			#phy-cells = <0>;
+			#phy-cells = <1>;
 			status = "disabled";
 		};
 
@@ -2530,7 +2530,7 @@
 			clocks = <&cpg CPG_MOD 702>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 			resets = <&cpg 702>;
-			#phy-cells = <0>;
+			#phy-cells = <1>;
 			status = "disabled";
 		};
 
@@ -2541,7 +2541,7 @@
 			clocks = <&cpg CPG_MOD 701>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 			resets = <&cpg 701>;
-			#phy-cells = <0>;
+			#phy-cells = <1>;
 			status = "disabled";
 		};
 
@@ -2553,7 +2553,7 @@
 			clocks = <&cpg CPG_MOD 700>, <&cpg CPG_MOD 705>;
 			power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
 			resets = <&cpg 700>, <&cpg 705>;
-			#phy-cells = <0>;
+			#phy-cells = <1>;
 			status = "disabled";
 		};
 
diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
index a5c6a99..452532f 100644
--- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
@@ -783,7 +783,7 @@
 			       <&usb_dmac1 0>, <&usb_dmac1 1>;
 			dma-names = "ch0", "ch1", "ch2", "ch3";
 			renesas,buswait = <11>;
-			phys = <&usb2_phy0>;
+			phys = <&usb2_phy0 3>;
 			phy-names = "usb";
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
 			resets = <&cpg 704>, <&cpg 703>;
@@ -2286,7 +2286,7 @@
 			reg = <0 0xee080000 0 0x100>;
 			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>;
-			phys = <&usb2_phy0>;
+			phys = <&usb2_phy0 1>;
 			phy-names = "usb";
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
 			resets = <&cpg 703>, <&cpg 704>;
@@ -2298,7 +2298,7 @@
 			reg = <0 0xee0a0000 0 0x100>;
 			interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 702>;
-			phys = <&usb2_phy1>;
+			phys = <&usb2_phy1 1>;
 			phy-names = "usb";
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
 			resets = <&cpg 702>;
@@ -2310,7 +2310,7 @@
 			reg = <0 0xee080100 0 0x100>;
 			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>;
-			phys = <&usb2_phy0>;
+			phys = <&usb2_phy0 2>;
 			phy-names = "usb";
 			companion = <&ohci0>;
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
@@ -2323,7 +2323,7 @@
 			reg = <0 0xee0a0100 0 0x100>;
 			interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 702>;
-			phys = <&usb2_phy1>;
+			phys = <&usb2_phy1 2>;
 			phy-names = "usb";
 			companion = <&ohci1>;
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
@@ -2339,7 +2339,7 @@
 			clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>;
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
 			resets = <&cpg 703>, <&cpg 704>;
-			#phy-cells = <0>;
+			#phy-cells = <1>;
 			status = "disabled";
 		};
 
@@ -2350,7 +2350,7 @@
 			clocks = <&cpg CPG_MOD 702>;
 			power-domains = <&sysc R8A7796_PD_ALWAYS_ON>;
 			resets = <&cpg 702>;
-			#phy-cells = <0>;
+			#phy-cells = <1>;
 			status = "disabled";
 		};
 
diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 41dfead..814ed14 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -667,7 +667,7 @@
 			       <&usb_dmac1 0>, <&usb_dmac1 1>;
 			dma-names = "ch0", "ch1", "ch2", "ch3";
 			renesas,buswait = <11>;
-			phys = <&usb2_phy0>;
+			phys = <&usb2_phy0 3>;
 			phy-names = "usb";
 			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
 			resets = <&cpg 704>, <&cpg 703>;
@@ -2026,7 +2026,7 @@
 			reg = <0 0xee080000 0 0x100>;
 			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>;
-			phys = <&usb2_phy0>;
+			phys = <&usb2_phy0 1>;
 			phy-names = "usb";
 			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
 			resets = <&cpg 703>, <&cpg 704>;
@@ -2038,7 +2038,7 @@
 			reg = <0 0xee0a0000 0 0x100>;
 			interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 702>;
-			phys = <&usb2_phy1>;
+			phys = <&usb2_phy1 1>;
 			phy-names = "usb";
 			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
 			resets = <&cpg 702>;
@@ -2050,7 +2050,7 @@
 			reg = <0 0xee080100 0 0x100>;
 			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>;
-			phys = <&usb2_phy0>;
+			phys = <&usb2_phy0 2>;
 			phy-names = "usb";
 			companion = <&ohci0>;
 			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
@@ -2063,7 +2063,7 @@
 			reg = <0 0xee0a0100 0 0x100>;
 			interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 702>;
-			phys = <&usb2_phy1>;
+			phys = <&usb2_phy1 2>;
 			phy-names = "usb";
 			companion = <&ohci1>;
 			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
@@ -2079,7 +2079,7 @@
 			clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>;
 			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
 			resets = <&cpg 703>, <&cpg 704>;
-			#phy-cells = <0>;
+			#phy-cells = <1>;
 			status = "disabled";
 		};
 
@@ -2090,7 +2090,7 @@
 			clocks = <&cpg CPG_MOD 702>;
 			power-domains = <&sysc R8A77965_PD_ALWAYS_ON>;
 			resets = <&cpg 702>;
-			#phy-cells = <0>;
+			#phy-cells = <1>;
 			status = "disabled";
 		};
 
diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index 56cb566..3864fdc 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -630,7 +630,7 @@
 			       <&usb_dmac1 0>, <&usb_dmac1 1>;
 			dma-names = "ch0", "ch1", "ch2", "ch3";
 			renesas,buswait = <11>;
-			phys = <&usb2_phy0>;
+			phys = <&usb2_phy0 3>;
 			phy-names = "usb";
 			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
 			resets = <&cpg 704>, <&cpg 703>;
@@ -1537,7 +1537,7 @@
 			reg = <0 0xee080000 0 0x100>;
 			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>;
-			phys = <&usb2_phy0>;
+			phys = <&usb2_phy0 1>;
 			phy-names = "usb";
 			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
 			resets = <&cpg 703>, <&cpg 704>;
@@ -1549,7 +1549,7 @@
 			reg = <0 0xee080100 0 0x100>;
 			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>;
-			phys = <&usb2_phy0>;
+			phys = <&usb2_phy0 2>;
 			phy-names = "usb";
 			companion = <&ohci0>;
 			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
@@ -1565,7 +1565,7 @@
 			clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>;
 			power-domains = <&sysc R8A77990_PD_ALWAYS_ON>;
 			resets = <&cpg 703>, <&cpg 704>;
-			#phy-cells = <0>;
+			#phy-cells = <1>;
 			status = "disabled";
 		};
 
diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index 5bf3af2..e0a0149 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
@@ -354,7 +354,7 @@
 			       <&usb_dmac1 0>, <&usb_dmac1 1>;
 			dma-names = "ch0", "ch1", "ch2", "ch3";
 			renesas,buswait = <11>;
-			phys = <&usb2_phy0>;
+			phys = <&usb2_phy0 3>;
 			phy-names = "usb";
 			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
 			resets = <&cpg 704>, <&cpg 703>;
@@ -875,7 +875,7 @@
 			reg = <0 0xee080000 0 0x100>;
 			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>;
-			phys = <&usb2_phy0>;
+			phys = <&usb2_phy0 1>;
 			phy-names = "usb";
 			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
 			resets = <&cpg 703>, <&cpg 704>;
@@ -887,7 +887,7 @@
 			reg = <0 0xee080100 0 0x100>;
 			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>;
-			phys = <&usb2_phy0>;
+			phys = <&usb2_phy0 2>;
 			phy-names = "usb";
 			companion = <&ohci0>;
 			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
@@ -903,7 +903,7 @@
 			clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>;
 			power-domains = <&sysc R8A77995_PD_ALWAYS_ON>;
 			resets = <&cpg 703>, <&cpg 704>;
-			#phy-cells = <0>;
+			#phy-cells = <1>;
 			status = "disabled";
 		};
 
-- 
2.7.4

