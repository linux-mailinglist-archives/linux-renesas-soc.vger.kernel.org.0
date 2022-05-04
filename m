Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B19451A2C7
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 May 2022 16:57:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351588AbiEDPAj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 May 2022 11:00:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351644AbiEDPAa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 May 2022 11:00:30 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B23F02B18E;
        Wed,  4 May 2022 07:56:52 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.91,198,1647270000"; 
   d="scan'208";a="118715078"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 04 May 2022 23:56:51 +0900
Received: from localhost.localdomain (unknown [10.226.93.27])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 640574250F0B;
        Wed,  4 May 2022 23:56:49 +0900 (JST)
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH 8/9] arm64: dts: renesas: r9a09g011: Add ethernet nodes
Date:   Wed,  4 May 2022 15:54:53 +0100
Message-Id: <20220504145454.71287-9-phil.edworthy@renesas.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220504145454.71287-1-phil.edworthy@renesas.com>
References: <20220504145454.71287-1-phil.edworthy@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add Ethernet nodes to SoC dtsi.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g011.dtsi | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g011.dtsi b/arch/arm64/boot/dts/renesas/r9a09g011.dtsi
index 27810f4ad4cb..5948d4f0047b 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g011.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g011.dtsi
@@ -62,6 +62,57 @@ gic: interrupt-controller@82000000 {
 			clock-names = "clk";
 		};
 
+		avb: ethernet@a3300000 {
+			compatible = "renesas,etheravb-r9a09g011","renesas,etheravb-rzv2m";
+			reg = <0 0xa3300000 0 0x800>;
+			interrupts = <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>, /* ch0: Rx0 BE */
+				     <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH>, /* ch1: Rx1 NC */
+				     <GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 257 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 258 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 259 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 263 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 264 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH>, /* ch18: Tx0 BE */
+				     <GIC_SPI 270 IRQ_TYPE_LEVEL_HIGH>, /* ch19: Tx1 NC */
+				     <GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 273 IRQ_TYPE_LEVEL_HIGH>, /* ch22: DiA */
+				     <GIC_SPI 274 IRQ_TYPE_LEVEL_HIGH>, /* DiB */
+				     <GIC_SPI 275 IRQ_TYPE_LEVEL_HIGH>, /* Line1_A */
+				     <GIC_SPI 276 IRQ_TYPE_LEVEL_HIGH>, /* Line1_B */
+				     <GIC_SPI 277 IRQ_TYPE_LEVEL_HIGH>, /* Line2_A */
+				     <GIC_SPI 278 IRQ_TYPE_LEVEL_HIGH>, /* Line2_B */
+				     <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>; /* ch24: Line3 MAC */
+			interrupt-names = "ch0", "ch1", "ch2", "ch3",
+					  "ch4", "ch5", "ch6", "ch7",
+					  "ch8", "ch9", "ch10", "ch11",
+					  "ch12", "ch13", "ch14", "ch15",
+					  "ch16", "ch17", "ch18", "ch19",
+					  "ch20", "ch21", "ch22", "dib",
+					  "err_a", "err_b", "mgmt_a", "mgmt_b",
+					  "ch24";
+			clocks = <&cpg CPG_MOD R9A09G011_ETH0_CLK_AXI>,
+				 <&cpg CPG_MOD R9A09G011_ETH0_CLK_CHI>,
+				 <&cpg CPG_MOD R9A09G011_ETH0_GPTP_EXT>;
+			clock-names = "axi", "chi", "gptp";
+			resets = <&cpg R9A09G011_ETH0_RST_HW_N>;
+			power-domains = <&cpg>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disable";
+		};
+
 		cpg: clock-controller@a3500000 {
 			compatible = "renesas,r9a09g011-cpg";
 			reg = <0 0xa3500000 0 0x1000>;
-- 
2.32.0

