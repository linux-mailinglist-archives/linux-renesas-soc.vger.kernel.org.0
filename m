Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC4C5606B8
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Jul 2019 15:39:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728290AbfGENjy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 5 Jul 2019 09:39:54 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:18501 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727066AbfGENjx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 Jul 2019 09:39:53 -0400
X-IronPort-AV: E=Sophos;i="5.62,455,1554735600"; 
   d="scan'208";a="20441066"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 05 Jul 2019 22:39:51 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 85FFC42559A9;
        Fri,  5 Jul 2019 22:39:48 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 2/3] arm64: dts: renesas: r8a774a1: Add SSIU support for sound
Date:   Fri,  5 Jul 2019 14:39:38 +0100
Message-Id: <1562333979-28516-3-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1562333979-28516-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1562333979-28516-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add SSIU support to the SoC DT as the sound driver supports
it now, and also since the sound driver can now handle
BUSIF0-7 via SSIU remove the no longer needed "rxu" and "txu"
properties.

Based on similar work from Kuninori Morimoto and Simon Horman:
8d14bfa074db ("arm64: dts: renesas: r8a7796: add SSIU support for
sound")
10bd03fa896e ("arm64: dts: renesas: r8a7796: remove BUSIF0 settings from
rcar_sound,ssi")

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi | 251 +++++++++++++++++++++++++++---
 1 file changed, 231 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
index 2c5173e..aa27097 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
@@ -1777,56 +1777,267 @@
 				};
 			};
 
+			rcar_sound,ssiu {
+				ssiu00: ssiu-0 {
+					dmas = <&audma0 0x15>, <&audma1 0x16>;
+					dma-names = "rx", "tx";
+				};
+				ssiu01: ssiu-1 {
+					dmas = <&audma0 0x35>, <&audma1 0x36>;
+					dma-names = "rx", "tx";
+				};
+				ssiu02: ssiu-2 {
+					dmas = <&audma0 0x37>, <&audma1 0x38>;
+					dma-names = "rx", "tx";
+				};
+				ssiu03: ssiu-3 {
+					dmas = <&audma0 0x47>, <&audma1 0x48>;
+					dma-names = "rx", "tx";
+				};
+				ssiu04: ssiu-4 {
+					dmas = <&audma0 0x3F>, <&audma1 0x40>;
+					dma-names = "rx", "tx";
+				};
+				ssiu05: ssiu-5 {
+					dmas = <&audma0 0x43>, <&audma1 0x44>;
+					dma-names = "rx", "tx";
+				};
+				ssiu06: ssiu-6 {
+					dmas = <&audma0 0x4F>, <&audma1 0x50>;
+					dma-names = "rx", "tx";
+				};
+				ssiu07: ssiu-7 {
+					dmas = <&audma0 0x53>, <&audma1 0x54>;
+					dma-names = "rx", "tx";
+				};
+				ssiu10: ssiu-8 {
+					dmas = <&audma0 0x49>, <&audma1 0x4a>;
+					dma-names = "rx", "tx";
+				};
+				ssiu11: ssiu-9 {
+					dmas = <&audma0 0x4B>, <&audma1 0x4C>;
+					dma-names = "rx", "tx";
+				};
+				ssiu12: ssiu-10 {
+					dmas = <&audma0 0x57>, <&audma1 0x58>;
+					dma-names = "rx", "tx";
+				};
+				ssiu13: ssiu-11 {
+					dmas = <&audma0 0x59>, <&audma1 0x5A>;
+					dma-names = "rx", "tx";
+				};
+				ssiu14: ssiu-12 {
+					dmas = <&audma0 0x5F>, <&audma1 0x60>;
+					dma-names = "rx", "tx";
+				};
+				ssiu15: ssiu-13 {
+					dmas = <&audma0 0xC3>, <&audma1 0xC4>;
+					dma-names = "rx", "tx";
+				};
+				ssiu16: ssiu-14 {
+					dmas = <&audma0 0xC7>, <&audma1 0xC8>;
+					dma-names = "rx", "tx";
+				};
+				ssiu17: ssiu-15 {
+					dmas = <&audma0 0xCB>, <&audma1 0xCC>;
+					dma-names = "rx", "tx";
+				};
+				ssiu20: ssiu-16 {
+					dmas = <&audma0 0x63>, <&audma1 0x64>;
+					dma-names = "rx", "tx";
+				};
+				ssiu21: ssiu-17 {
+					dmas = <&audma0 0x67>, <&audma1 0x68>;
+					dma-names = "rx", "tx";
+				};
+				ssiu22: ssiu-18 {
+					dmas = <&audma0 0x6B>, <&audma1 0x6C>;
+					dma-names = "rx", "tx";
+				};
+				ssiu23: ssiu-19 {
+					dmas = <&audma0 0x6D>, <&audma1 0x6E>;
+					dma-names = "rx", "tx";
+				};
+				ssiu24: ssiu-20 {
+					dmas = <&audma0 0xCF>, <&audma1 0xCE>;
+					dma-names = "rx", "tx";
+				};
+				ssiu25: ssiu-21 {
+					dmas = <&audma0 0xEB>, <&audma1 0xEC>;
+					dma-names = "rx", "tx";
+				};
+				ssiu26: ssiu-22 {
+					dmas = <&audma0 0xED>, <&audma1 0xEE>;
+					dma-names = "rx", "tx";
+				};
+				ssiu27: ssiu-23 {
+					dmas = <&audma0 0xEF>, <&audma1 0xF0>;
+					dma-names = "rx", "tx";
+				};
+				ssiu30: ssiu-24 {
+					dmas = <&audma0 0x6f>, <&audma1 0x70>;
+					dma-names = "rx", "tx";
+				};
+				ssiu31: ssiu-25 {
+					dmas = <&audma0 0x21>, <&audma1 0x22>;
+					dma-names = "rx", "tx";
+				};
+				ssiu32: ssiu-26 {
+					dmas = <&audma0 0x23>, <&audma1 0x24>;
+					dma-names = "rx", "tx";
+				};
+				ssiu33: ssiu-27 {
+					dmas = <&audma0 0x25>, <&audma1 0x26>;
+					dma-names = "rx", "tx";
+				};
+				ssiu34: ssiu-28 {
+					dmas = <&audma0 0x27>, <&audma1 0x28>;
+					dma-names = "rx", "tx";
+				};
+				ssiu35: ssiu-29 {
+					dmas = <&audma0 0x29>, <&audma1 0x2A>;
+					dma-names = "rx", "tx";
+				};
+				ssiu36: ssiu-30 {
+					dmas = <&audma0 0x2B>, <&audma1 0x2C>;
+					dma-names = "rx", "tx";
+				};
+				ssiu37: ssiu-31 {
+					dmas = <&audma0 0x2D>, <&audma1 0x2E>;
+					dma-names = "rx", "tx";
+				};
+				ssiu40: ssiu-32 {
+					dmas =	<&audma0 0x71>, <&audma1 0x72>;
+					dma-names = "rx", "tx";
+				};
+				ssiu41: ssiu-33 {
+					dmas = <&audma0 0x17>, <&audma1 0x18>;
+					dma-names = "rx", "tx";
+				};
+				ssiu42: ssiu-34 {
+					dmas = <&audma0 0x19>, <&audma1 0x1A>;
+					dma-names = "rx", "tx";
+				};
+				ssiu43: ssiu-35 {
+					dmas = <&audma0 0x1B>, <&audma1 0x1C>;
+					dma-names = "rx", "tx";
+				};
+				ssiu44: ssiu-36 {
+					dmas = <&audma0 0x1D>, <&audma1 0x1E>;
+					dma-names = "rx", "tx";
+				};
+				ssiu45: ssiu-37 {
+					dmas = <&audma0 0x1F>, <&audma1 0x20>;
+					dma-names = "rx", "tx";
+				};
+				ssiu46: ssiu-38 {
+					dmas = <&audma0 0x31>, <&audma1 0x32>;
+					dma-names = "rx", "tx";
+				};
+				ssiu47: ssiu-39 {
+					dmas = <&audma0 0x33>, <&audma1 0x34>;
+					dma-names = "rx", "tx";
+				};
+				ssiu50: ssiu-40 {
+					dmas = <&audma0 0x73>, <&audma1 0x74>;
+					dma-names = "rx", "tx";
+				};
+				ssiu60: ssiu-41 {
+					dmas = <&audma0 0x75>, <&audma1 0x76>;
+					dma-names = "rx", "tx";
+				};
+				ssiu70: ssiu-42 {
+					dmas = <&audma0 0x79>, <&audma1 0x7a>;
+					dma-names = "rx", "tx";
+				};
+				ssiu80: ssiu-43 {
+					dmas = <&audma0 0x7b>, <&audma1 0x7c>;
+					dma-names = "rx", "tx";
+				};
+				ssiu90: ssiu-44 {
+					dmas = <&audma0 0x7d>, <&audma1 0x7e>;
+					dma-names = "rx", "tx";
+				};
+				ssiu91: ssiu-45 {
+					dmas = <&audma0 0x7F>, <&audma1 0x80>;
+					dma-names = "rx", "tx";
+				};
+				ssiu92: ssiu-46 {
+					dmas = <&audma0 0x81>, <&audma1 0x82>;
+					dma-names = "rx", "tx";
+				};
+				ssiu93: ssiu-47 {
+					dmas = <&audma0 0x83>, <&audma1 0x84>;
+					dma-names = "rx", "tx";
+				};
+				ssiu94: ssiu-48 {
+					dmas = <&audma0 0xA3>, <&audma1 0xA4>;
+					dma-names = "rx", "tx";
+				};
+				ssiu95: ssiu-49 {
+					dmas = <&audma0 0xA5>, <&audma1 0xA6>;
+					dma-names = "rx", "tx";
+				};
+				ssiu96: ssiu-50 {
+					dmas = <&audma0 0xA7>, <&audma1 0xA8>;
+					dma-names = "rx", "tx";
+				};
+				ssiu97: ssiu-51 {
+					dmas = <&audma0 0xA9>, <&audma1 0xAA>;
+					dma-names = "rx", "tx";
+				};
+			};
+
 			rcar_sound,ssi {
 				ssi0: ssi-0 {
 					interrupts = <GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>;
-					dmas = <&audma0 0x01>, <&audma1 0x02>, <&audma0 0x15>, <&audma1 0x16>;
-					dma-names = "rx", "tx", "rxu", "txu";
+					dmas = <&audma0 0x01>, <&audma1 0x02>;
+					dma-names = "rx", "tx";
 				};
 				ssi1: ssi-1 {
 					interrupts = <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>;
-					dmas = <&audma0 0x03>, <&audma1 0x04>, <&audma0 0x49>, <&audma1 0x4a>;
-					dma-names = "rx", "tx", "rxu", "txu";
+					dmas = <&audma0 0x03>, <&audma1 0x04>;
+					dma-names = "rx", "tx";
 				};
 				ssi2: ssi-2 {
 					interrupts = <GIC_SPI 372 IRQ_TYPE_LEVEL_HIGH>;
-					dmas = <&audma0 0x05>, <&audma1 0x06>, <&audma0 0x63>, <&audma1 0x64>;
-					dma-names = "rx", "tx", "rxu", "txu";
+					dmas = <&audma0 0x05>, <&audma1 0x06>;
+					dma-names = "rx", "tx";
 				};
 				ssi3: ssi-3 {
 					interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
-					dmas = <&audma0 0x07>, <&audma1 0x08>, <&audma0 0x6f>, <&audma1 0x70>;
-					dma-names = "rx", "tx", "rxu", "txu";
+					dmas = <&audma0 0x07>, <&audma1 0x08>;
+					dma-names = "rx", "tx";
 				};
 				ssi4: ssi-4 {
 					interrupts = <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>;
-					dmas = <&audma0 0x09>, <&audma1 0x0a>, <&audma0 0x71>, <&audma1 0x72>;
-					dma-names = "rx", "tx", "rxu", "txu";
+					dmas = <&audma0 0x09>, <&audma1 0x0a>;
+					dma-names = "rx", "tx";
 				};
 				ssi5: ssi-5 {
 					interrupts = <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>;
-					dmas = <&audma0 0x0b>, <&audma1 0x0c>, <&audma0 0x73>, <&audma1 0x74>;
-					dma-names = "rx", "tx", "rxu", "txu";
+					dmas = <&audma0 0x0b>, <&audma1 0x0c>;
+					dma-names = "rx", "tx";
 				};
 				ssi6: ssi-6 {
 					interrupts = <GIC_SPI 376 IRQ_TYPE_LEVEL_HIGH>;
-					dmas = <&audma0 0x0d>, <&audma1 0x0e>, <&audma0 0x75>, <&audma1 0x76>;
-					dma-names = "rx", "tx", "rxu", "txu";
+					dmas = <&audma0 0x0d>, <&audma1 0x0e>;
+					dma-names = "rx", "tx";
 				};
 				ssi7: ssi-7 {
 					interrupts = <GIC_SPI 377 IRQ_TYPE_LEVEL_HIGH>;
-					dmas = <&audma0 0x0f>, <&audma1 0x10>, <&audma0 0x79>, <&audma1 0x7a>;
-					dma-names = "rx", "tx", "rxu", "txu";
+					dmas = <&audma0 0x0f>, <&audma1 0x10>;
+					dma-names = "rx", "tx";
 				};
 				ssi8: ssi-8 {
 					interrupts = <GIC_SPI 378 IRQ_TYPE_LEVEL_HIGH>;
-					dmas = <&audma0 0x11>, <&audma1 0x12>, <&audma0 0x7b>, <&audma1 0x7c>;
-					dma-names = "rx", "tx", "rxu", "txu";
+					dmas = <&audma0 0x11>, <&audma1 0x12>;
+					dma-names = "rx", "tx";
 				};
 				ssi9: ssi-9 {
 					interrupts = <GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH>;
-					dmas = <&audma0 0x13>, <&audma1 0x14>, <&audma0 0x7d>, <&audma1 0x7e>;
-					dma-names = "rx", "tx", "rxu", "txu";
+					dmas = <&audma0 0x13>, <&audma1 0x14>;
+					dma-names = "rx", "tx";
 				};
 			};
 
-- 
2.7.4

