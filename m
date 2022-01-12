Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E739948CA50
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jan 2022 18:47:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355950AbiALRre (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jan 2022 12:47:34 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:20629 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1355944AbiALRr2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jan 2022 12:47:28 -0500
X-IronPort-AV: E=Sophos;i="5.88,282,1635174000"; 
   d="scan'208";a="106824774"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 13 Jan 2022 02:47:27 +0900
Received: from localhost.localdomain (unknown [10.226.92.38])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id CE13C4005E1F;
        Thu, 13 Jan 2022 02:47:25 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC 26/28] arm64: dts: renesas: r9a07g044: Add dsi node
Date:   Wed, 12 Jan 2022 17:46:10 +0000
Message-Id: <20220112174612.10773-27-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
References: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add dsi node to SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
index 86bbc536aee4..f5e63ffab9cc 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g044.dtsi
@@ -666,6 +666,43 @@
 			};
 		};
 
+		dsi0: dsi@10860000 {
+			compatible = "renesas,r9a07g044-mipi-dsi";
+			reg =	<0 0x10860000 0 0x10000>, /* LINK */
+				<0 0x10850000 0 0x10000>; /* DPHY */
+
+			clocks = <&cpg CPG_MOD R9A07G044_MIPI_DSI_PLLCLK>,
+				 <&cpg CPG_MOD R9A07G044_MIPI_DSI_SYSCLK>,
+				 <&cpg CPG_MOD R9A07G044_MIPI_DSI_ACLK>,
+				 <&cpg CPG_MOD R9A07G044_MIPI_DSI_PCLK>,
+				 <&cpg CPG_MOD R9A07G044_MIPI_DSI_VCLK>,
+				 <&cpg CPG_MOD R9A07G044_MIPI_DSI_LPCLK>;
+			clock-names = "pllclk", "sysclk", "aclk", "pclk", "vclk", "lpclk";
+			power-domains = <&cpg>;
+			resets = <&cpg R9A07G044_MIPI_DSI_CMN_RSTB>,
+				 <&cpg R9A07G044_MIPI_DSI_ARESET_N>,
+				 <&cpg R9A07G044_MIPI_DSI_PRESET_N>;
+			reset-names = "rst", "arst", "prst";
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+					dsi0_in: endpoint {
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+					dsi0_out: endpoint {
+					};
+				};
+			};
+		};
+
 		cpg: clock-controller@11010000 {
 			compatible = "renesas,r9a07g044-cpg";
 			reg = <0 0x11010000 0 0x10000>;
-- 
2.17.1

