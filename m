Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6EA944AD8A
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  9 Nov 2021 13:31:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242483AbhKIMeD (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 9 Nov 2021 07:34:03 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:13003 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231250AbhKIMeB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 9 Nov 2021 07:34:01 -0500
X-IronPort-AV: E=Sophos;i="5.87,220,1631545200"; 
   d="scan'208";a="99680378"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 09 Nov 2021 21:31:15 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 48DFA4006CC6;
        Tue,  9 Nov 2021 21:31:13 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 2/3] arm64: dts: renesas: r9a07g044: Add SCI[0-1] nodes
Date:   Tue,  9 Nov 2021 12:31:10 +0000
Message-Id: <20211109123110.8543-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add SCI[0-1] nodes to r9a07g044 (RZ/G2L) SoC DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Hi Geert,
Sending this lone patch from series [1] as rest of the patches
have been queued up.
[1] https://patchwork.kernel.org/project/linux-renesas-soc/cover/
    20211103195600.23964-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

v1->v2
* Added the nodes in sort order (by unit address)
* Included RB tag from Geert

v1: https://patchwork.kernel.org/project/linux-renesas-soc/patch/
20211103195600.23964-3-prabhakar.mahadev-lad.rj@bp.renesas.com/
---
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
index 09bfdedfac2a..358db254c4ea 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
@@ -266,6 +266,36 @@
 			status = "disabled";
 		};
 
+		sci0: serial@1004d000 {
+			compatible = "renesas,r9a07g044-sci", "renesas,sci";
+			reg = <0 0x1004d000 0 0x400>;
+			interrupts = <GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi", "tei";
+			clocks = <&cpg CPG_MOD R9A07G044_SCI0_CLKP>;
+			clock-names = "fck";
+			power-domains = <&cpg>;
+			resets = <&cpg R9A07G044_SCI0_RST>;
+			status = "disabled";
+		};
+
+		sci1: serial@1004d400 {
+			compatible = "renesas,r9a07g044-sci", "renesas,sci";
+			reg = <0 0x1004d400 0 0x400>;
+			interrupts = <GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 410 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 411 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "eri", "rxi", "txi", "tei";
+			clocks = <&cpg CPG_MOD R9A07G044_SCI1_CLKP>;
+			clock-names = "fck";
+			power-domains = <&cpg>;
+			resets = <&cpg R9A07G044_SCI1_RST>;
+			status = "disabled";
+		};
+
 		canfd: can@10050000 {
 			compatible = "renesas,r9a07g044-canfd", "renesas,rzg2l-canfd";
 			reg = <0 0x10050000 0 0x8000>;
-- 
2.17.1

