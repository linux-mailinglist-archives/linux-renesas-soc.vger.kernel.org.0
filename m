Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74206444935
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  3 Nov 2021 20:56:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231215AbhKCT6y (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 3 Nov 2021 15:58:54 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:62946 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230248AbhKCT6y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Nov 2021 15:58:54 -0400
X-IronPort-AV: E=Sophos;i="5.87,206,1631545200"; 
   d="scan'208";a="99104654"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 04 Nov 2021 04:56:15 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 135C440E5D5B;
        Thu,  4 Nov 2021 04:56:13 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/3] arm64: dts: renesas: r9a07g044: Add SCIF[1-4] nodes
Date:   Wed,  3 Nov 2021 19:55:58 +0000
Message-Id: <20211103195600.23964-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211103195600.23964-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20211103195600.23964-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add SCIF[1-4] nodes to r9a07g044 (RZ/G2L) SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 72 ++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
index 485ef5f0fea1..09bfdedfac2a 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
@@ -194,6 +194,78 @@
 			status = "disabled";
 		};
 
+		scif1: serial@1004bc00 {
+			compatible = "renesas,scif-r9a07g044";
+			reg = <0 0x1004bc00 0 0x400>;
+			interrupts = <GIC_SPI 385 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 387 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 388 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 386 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 389 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 389 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi",
+					  "bri", "dri", "tei";
+			clocks = <&cpg CPG_MOD R9A07G044_SCIF1_CLK_PCK>;
+			clock-names = "fck";
+			power-domains = <&cpg>;
+			resets = <&cpg R9A07G044_SCIF1_RST_SYSTEM_N>;
+			status = "disabled";
+		};
+
+		scif2: serial@1004c000 {
+			compatible = "renesas,scif-r9a07g044";
+			reg = <0 0x1004c000 0 0x400>;
+			interrupts = <GIC_SPI 390 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 392 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 393 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 391 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 394 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 394 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi",
+					  "bri", "dri", "tei";
+			clocks = <&cpg CPG_MOD R9A07G044_SCIF2_CLK_PCK>;
+			clock-names = "fck";
+			power-domains = <&cpg>;
+			resets = <&cpg R9A07G044_SCIF2_RST_SYSTEM_N>;
+			status = "disabled";
+		};
+
+		scif3: serial@1004c400 {
+			compatible = "renesas,scif-r9a07g044";
+			reg = <0 0x1004c400 0 0x400>;
+			interrupts = <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi",
+					  "bri", "dri", "tei";
+			clocks = <&cpg CPG_MOD R9A07G044_SCIF3_CLK_PCK>;
+			clock-names = "fck";
+			power-domains = <&cpg>;
+			resets = <&cpg R9A07G044_SCIF3_RST_SYSTEM_N>;
+			status = "disabled";
+		};
+
+		scif4: serial@1004c800 {
+			compatible = "renesas,scif-r9a07g044";
+			reg = <0 0x1004c800 0 0x400>;
+			interrupts = <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi",
+					  "bri", "dri", "tei";
+			clocks = <&cpg CPG_MOD R9A07G044_SCIF4_CLK_PCK>;
+			clock-names = "fck";
+			power-domains = <&cpg>;
+			resets = <&cpg R9A07G044_SCIF4_RST_SYSTEM_N>;
+			status = "disabled";
+		};
+
 		canfd: can@10050000 {
 			compatible = "renesas,r9a07g044-canfd", "renesas,rzg2l-canfd";
 			reg = <0 0x10050000 0 0x8000>;
-- 
2.17.1

