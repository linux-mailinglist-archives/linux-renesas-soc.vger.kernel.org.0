Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BA3942572C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Oct 2021 17:55:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242119AbhJGP4x (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 Oct 2021 11:56:53 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:1473 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S232589AbhJGP4w (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Oct 2021 11:56:52 -0400
X-IronPort-AV: E=Sophos;i="5.85,355,1624287600"; 
   d="scan'208";a="96455062"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 08 Oct 2021 00:54:58 +0900
Received: from localhost.localdomain (unknown [10.226.93.49])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 64D8F400F5D0;
        Fri,  8 Oct 2021 00:54:56 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/3] arm64: dts: renesas: r9a07g044: Add SDHI nodes
Date:   Thu,  7 Oct 2021 16:54:49 +0100
Message-Id: <20211007155451.10654-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211007155451.10654-1-biju.das.jz@bp.renesas.com>
References: <20211007155451.10654-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add SDHI{0, 1} nodes to RZ/G2L SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
This patch has dependency upon [1]
[1] https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=559045
---
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
index 1f01737d2def..0b0372a02515 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
@@ -456,6 +456,38 @@
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
 		};
 
+		sdhi0: mmc@11c00000  {
+			compatible = "renesas,sdhi-r9a07g044",
+				     "renesas,rcar-gen3-sdhi";
+			reg = <0x0 0x11c00000 0 0x10000>;
+			interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A07G044_SDHI0_IMCLK>,
+				 <&cpg CPG_MOD R9A07G044_SDHI0_IMCLK2>,
+				 <&cpg CPG_MOD R9A07G044_SDHI0_CLK_HS>,
+				 <&cpg CPG_MOD R9A07G044_SDHI0_ACLK>;
+			clock-names = "imclk", "imclk2", "clk_hs", "aclk";
+			resets = <&cpg R9A07G044_SDHI0_IXRST>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		sdhi1: mmc@11c10000 {
+			compatible = "renesas,sdhi-r9a07g044",
+				     "renesas,rcar-gen3-sdhi";
+			reg = <0x0 0x11c10000 0 0x10000>;
+			interrupts = <GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A07G044_SDHI1_IMCLK>,
+				 <&cpg CPG_MOD R9A07G044_SDHI1_IMCLK2>,
+				 <&cpg CPG_MOD R9A07G044_SDHI1_CLK_HS>,
+				 <&cpg CPG_MOD R9A07G044_SDHI1_ACLK>;
+			clock-names = "imclk", "imclk2", "clk_hs", "aclk";
+			resets = <&cpg R9A07G044_SDHI1_IXRST>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
 		phyrst: usbphy-ctrl@11c40000 {
 			compatible = "renesas,r9a07g044-usbphy-ctrl",
 				     "renesas,rzg2l-usbphy-ctrl";
-- 
2.17.1

