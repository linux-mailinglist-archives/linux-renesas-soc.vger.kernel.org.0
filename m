Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 069C945634D
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 18 Nov 2021 20:18:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231428AbhKRTVg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 18 Nov 2021 14:21:36 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:63244 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229632AbhKRTVg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 Nov 2021 14:21:36 -0500
X-IronPort-AV: E=Sophos;i="5.87,245,1631545200"; 
   d="scan'208";a="100723281"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 19 Nov 2021 04:18:34 +0900
Received: from localhost.localdomain (unknown [10.226.93.19])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 9574F400941A;
        Fri, 19 Nov 2021 04:18:32 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 1/2] arm64: dts: renesas: r9a07g044: Add OSTM nodes
Date:   Thu, 18 Nov 2021 19:18:24 +0000
Message-Id: <20211118191826.2026-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211118191826.2026-1-biju.das.jz@bp.renesas.com>
References: <20211118191826.2026-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add OSTM{0,1,2} nodes to RZ/G2L SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
 * Changed compatible from renesas,rzg2l-ostm -> renesas,ostm
---
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
index 485ef5f0fea1..52124ca95f99 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
@@ -641,6 +641,39 @@
 			power-domains = <&cpg>;
 			status = "disabled";
 		};
+
+		ostm0: timer@12801000 {
+			compatible = "renesas,r9a07g044-ostm",
+				     "renesas,ostm";
+			reg = <0x0 0x12801000 0x0 0x400>;
+			interrupts = <GIC_SPI 46 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&cpg CPG_MOD R9A07G044_OSTM0_PCLK>;
+			resets = <&cpg R9A07G044_OSTM0_PRESETZ>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ostm1: timer@12801400 {
+			compatible = "renesas,r9a07g044-ostm",
+				     "renesas,ostm";
+			reg = <0x0 0x12801400 0x0 0x400>;
+			interrupts = <GIC_SPI 47 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&cpg CPG_MOD R9A07G044_OSTM1_PCLK>;
+			resets = <&cpg R9A07G044_OSTM1_PRESETZ>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		ostm2: timer@12801800 {
+			compatible = "renesas,r9a07g044-ostm",
+				     "renesas,ostm";
+			reg = <0x0 0x12801800 0x0 0x400>;
+			interrupts = <GIC_SPI 48 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&cpg CPG_MOD R9A07G044_OSTM2_PCLK>;
+			resets = <&cpg R9A07G044_OSTM2_PRESETZ>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
 	};
 
 	timer {
-- 
2.17.1

