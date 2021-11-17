Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8184B453D82
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 17 Nov 2021 02:13:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232081AbhKQBPz (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 16 Nov 2021 20:15:55 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:58500 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231274AbhKQBPx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Nov 2021 20:15:53 -0500
X-IronPort-AV: E=Sophos;i="5.87,239,1631545200"; 
   d="scan'208";a="100847653"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 17 Nov 2021 10:12:54 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 12812400F501;
        Wed, 17 Nov 2021 10:12:52 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/2] arm64: dts: renesas: r9a07g044: Add RSPI{0,1,2} nodes
Date:   Wed, 17 Nov 2021 01:12:46 +0000
Message-Id: <20211117011247.27621-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211117011247.27621-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20211117011247.27621-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add RSPI{0,1,2} nodes to R9A07G044 (RZ/G2L) SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
index f3f1b76a780e..3b69d0c302e6 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
@@ -207,6 +207,54 @@
 			status = "disabled";
 		};
 
+		spi0: spi@1004ac00 {
+			compatible = "renesas,r9a07g044-rspi", "renesas,rspi-rz";
+			reg = <0 0x1004ac00 0 0x400>;
+			interrupts = <GIC_SPI 415 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 413 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 414 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "error", "rx", "tx";
+			clocks = <&cpg CPG_MOD R9A07G044_RSPI0_CLKB>;
+			resets = <&cpg R9A07G044_RSPI0_RST>;
+			power-domains = <&cpg>;
+			num-cs = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		spi1: spi@1004b000 {
+			compatible = "renesas,r9a07g044-rspi", "renesas,rspi-rz";
+			reg = <0 0x1004b000 0 0x400>;
+			interrupts = <GIC_SPI 418 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 416 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "error", "rx", "tx";
+			clocks = <&cpg CPG_MOD R9A07G044_RSPI1_CLKB>;
+			resets = <&cpg R9A07G044_RSPI1_RST>;
+			power-domains = <&cpg>;
+			num-cs = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		spi2: spi@1004b400 {
+			compatible = "renesas,r9a07g044-rspi", "renesas,rspi-rz";
+			reg = <0 0x1004b400 0 0x400>;
+			interrupts = <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "error", "rx", "tx";
+			clocks = <&cpg CPG_MOD R9A07G044_RSPI2_CLKB>;
+			resets = <&cpg R9A07G044_RSPI2_RST>;
+			power-domains = <&cpg>;
+			num-cs = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		scif0: serial@1004b800 {
 			compatible = "renesas,scif-r9a07g044";
 			reg = <0 0x1004b800 0 0x400>;
-- 
2.17.1

