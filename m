Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 332A73CC82
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 11 Jun 2019 15:07:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389772AbfFKNHH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 11 Jun 2019 09:07:07 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:25340 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2387657AbfFKNHG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Jun 2019 09:07:06 -0400
X-IronPort-AV: E=Sophos;i="5.60,579,1549897200"; 
   d="scan'208";a="18183671"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 11 Jun 2019 22:07:04 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id E33D74004BD9;
        Tue, 11 Jun 2019 22:07:01 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 1/6] arm64: dts: renesas: r8a774a1: Fix USB 2.0 clocks
Date:   Tue, 11 Jun 2019 14:06:36 +0100
Message-Id: <1560258401-9517-2-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560258401-9517-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1560258401-9517-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Similarly to what done for the r8a7796 with commit 737e05bf034e
("arm64: dts: renesas: revise properties for R-Car Gen3 SoCs'
usb 2.0"), this patch lists the clock for the USB High-Speed Module
(HS-USB) with the USB2.0 Host (EHCI/OHCI) IP DT node, and it lists
the clock for the USB2.0 Host IP with the HS-USB module DT node.

Fixes: 4c2c2fb99876 ("arm64: dts: renesas: r8a774a1: Add USB2.0 phy and host(EHCI/OHCI) device nodes")
Fixes: ed898d4fc19d ("arm64: dts: renesas: r8a774a1: Add USB-DMAC and HSUSB device nodes")
Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
index eb9f299..4a12a42 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
@@ -649,7 +649,7 @@
 				     "renesas,rcar-gen3-usbhs";
 			reg = <0 0xe6590000 0 0x200>;
 			interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 704>;
+			clocks = <&cpg CPG_MOD 704>, <&cpg CPG_MOD 703>;
 			dmas = <&usb_dmac0 0>, <&usb_dmac0 1>,
 			       <&usb_dmac1 0>, <&usb_dmac1 1>;
 			dma-names = "ch0", "ch1", "ch2", "ch3";
@@ -657,7 +657,7 @@
 			phys = <&usb2_phy0 3>;
 			phy-names = "usb";
 			power-domains = <&sysc R8A774A1_PD_ALWAYS_ON>;
-			resets = <&cpg 704>;
+			resets = <&cpg 704>, <&cpg 703>;
 			status = "disabled";
 		};
 
@@ -1780,11 +1780,11 @@
 			compatible = "generic-ohci";
 			reg = <0 0xee080000 0 0x100>;
 			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 703>;
+			clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>;
 			phys = <&usb2_phy0 1>;
 			phy-names = "usb";
 			power-domains = <&sysc R8A774A1_PD_ALWAYS_ON>;
-			resets = <&cpg 703>;
+			resets = <&cpg 703>, <&cpg 704>;
 			status = "disabled";
 		};
 
@@ -1804,12 +1804,12 @@
 			compatible = "generic-ehci";
 			reg = <0 0xee080100 0 0x100>;
 			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 703>;
+			clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>;
 			phys = <&usb2_phy0 2>;
 			phy-names = "usb";
 			companion = <&ohci0>;
 			power-domains = <&sysc R8A774A1_PD_ALWAYS_ON>;
-			resets = <&cpg 703>;
+			resets = <&cpg 703>, <&cpg 704>;
 			status = "disabled";
 		};
 
@@ -1831,9 +1831,9 @@
 				     "renesas,rcar-gen3-usb2-phy";
 			reg = <0 0xee080200 0 0x700>;
 			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&cpg CPG_MOD 703>;
+			clocks = <&cpg CPG_MOD 703>, <&cpg CPG_MOD 704>;
 			power-domains = <&sysc R8A774A1_PD_ALWAYS_ON>;
-			resets = <&cpg 703>;
+			resets = <&cpg 703>, <&cpg 704>;
 			#phy-cells = <1>;
 			status = "disabled";
 		};
-- 
2.7.4

