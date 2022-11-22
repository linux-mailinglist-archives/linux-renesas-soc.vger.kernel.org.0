Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 97CE1634964
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 22 Nov 2022 22:35:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235080AbiKVVft (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Nov 2022 16:35:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235087AbiKVVfs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Nov 2022 16:35:48 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 870F4C4C2B;
        Tue, 22 Nov 2022 13:35:47 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.96,185,1665414000"; 
   d="scan'208";a="143583243"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 23 Nov 2022 06:35:46 +0900
Received: from localhost.localdomain (unknown [10.226.92.123])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 797A240D24DA;
        Wed, 23 Nov 2022 06:35:44 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 4/7] arm64: dts: renesas: r9a07g054: Add DSI node
Date:   Tue, 22 Nov 2022 21:35:26 +0000
Message-Id: <20221122213529.2103849-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221122213529.2103849-1-biju.das.jz@bp.renesas.com>
References: <20221122213529.2103849-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add DSI node to RZ/V2L SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
This patch depend upon bingings [1]
[1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20221122195413.1882486-1-biju.das.jz@bp.renesas.com/
---
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g054.dtsi b/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
index 304ade54425b..8d0b84ea389c 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g054.dtsi
@@ -623,6 +623,34 @@ sbc: spi@10060000 {
 			status = "disabled";
 		};
 
+		dsi: dsi@10850000 {
+			compatible = "renesas,r9a07g054-mipi-dsi",
+				     "renesas,rzg2l-mipi-dsi";
+			reg = <0 0x10850000 0 0x20000>;
+			interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "seq0", "seq1", "vin1", "rcv",
+					  "ferr", "ppi", "debug";
+			clocks = <&cpg CPG_MOD R9A07G054_MIPI_DSI_PLLCLK>,
+				 <&cpg CPG_MOD R9A07G054_MIPI_DSI_SYSCLK>,
+				 <&cpg CPG_MOD R9A07G054_MIPI_DSI_ACLK>,
+				 <&cpg CPG_MOD R9A07G054_MIPI_DSI_PCLK>,
+				 <&cpg CPG_MOD R9A07G054_MIPI_DSI_VCLK>,
+				 <&cpg CPG_MOD R9A07G054_MIPI_DSI_LPCLK>;
+			clock-names = "pllclk", "sysclk", "aclk", "pclk", "vclk", "lpclk";
+			resets = <&cpg R9A07G054_MIPI_DSI_CMN_RSTB>,
+				 <&cpg R9A07G054_MIPI_DSI_ARESET_N>,
+				 <&cpg R9A07G054_MIPI_DSI_PRESET_N>;
+			reset-names = "rst", "arst", "prst";
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
 		cpg: clock-controller@11010000 {
 			compatible = "renesas,r9a07g054-cpg";
 			reg = <0 0x11010000 0 0x10000>;
-- 
2.25.1

