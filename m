Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA510603B97
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 19 Oct 2022 10:35:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229963AbiJSIf4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 19 Oct 2022 04:35:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230036AbiJSIfw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Oct 2022 04:35:52 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A64E67D783
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Oct 2022 01:35:42 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.95,195,1661785200"; 
   d="scan'208";a="139550112"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 19 Oct 2022 17:35:41 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id CD7B1400BC0B;
        Wed, 19 Oct 2022 17:35:41 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     geert+renesas@glider.be, magnus.damm@gmail.com
Cc:     linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v4 1/2] arm64: dts: renesas: r8a779f0: Add Ethernet Switch and SERDES nodes
Date:   Wed, 19 Oct 2022 17:35:37 +0900
Message-Id: <20221019083538.933127-2-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221019083538.933127-1-yoshihiro.shimoda.uh@renesas.com>
References: <20221019083538.933127-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,KHOP_HELO_FCRDNS,
        SPF_HELO_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add Ethernet Switch and SERDES nodes into R-Car S4-8 (r8a779f0).

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi | 109 ++++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
index c2f152bcf10e..d49271d64dc6 100644
--- a/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779f0.dtsi
@@ -469,6 +469,16 @@ tmu4: timer@ffc00000 {
 			status = "disabled";
 		};
 
+		eth_serdes: serdes@e6444000 {
+			compatible = "renesas,r8a779f0-ether-serdes";
+			reg = <0 0xe6444000 0 0x2800>;
+			clocks = <&cpg CPG_MOD 1506>;
+			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
+			resets = <&cpg 1506>;
+			#phy-cells = <1>;
+			status = "disabled";
+		};
+
 		i2c0: i2c@e6500000 {
 			compatible = "renesas,i2c-r8a779f0",
 				     "renesas,rcar-gen4-i2c";
@@ -651,6 +661,105 @@ ufs: ufs@e6860000 {
 			status = "disabled";
 		};
 
+		rswitch: ethernet@e6880000 {
+			compatible = "renesas,r8a779f0-ether-switch";
+			reg = <0 0xe6880000 0 0x20000>, <0 0xe68c0000 0 0x20000>;
+			reg-names = "base", "secure_base";
+			interrupts = <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 257 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 258 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 259 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 263 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 270 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 273 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 274 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 276 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 277 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 278 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 285 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 286 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 288 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 291 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 292 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "mfwd_error", "race_error",
+					  "coma_error", "gwca0_error",
+					  "gwca1_error", "etha0_error",
+					  "etha1_error", "etha2_error",
+					  "gptp0_status", "gptp1_status",
+					  "mfwd_status", "race_status",
+					  "coma_status", "gwca0_status",
+					  "gwca1_status", "etha0_status",
+					  "etha1_status", "etha2_status",
+					  "rmac0_status", "rmac1_status",
+					  "rmac2_status",
+					  "gwca0_rxtx0", "gwca0_rxtx1",
+					  "gwca0_rxtx2", "gwca0_rxtx3",
+					  "gwca0_rxtx4", "gwca0_rxtx5",
+					  "gwca0_rxtx6", "gwca0_rxtx7",
+					  "gwca1_rxtx0", "gwca1_rxtx1",
+					  "gwca1_rxtx2", "gwca1_rxtx3",
+					  "gwca1_rxtx4", "gwca1_rxtx5",
+					  "gwca1_rxtx6", "gwca1_rxtx7",
+					  "gwca0_rxts0", "gwca0_rxts1",
+					  "gwca1_rxts0", "gwca1_rxts1",
+					  "rmac0_mdio", "rmac1_mdio",
+					  "rmac2_mdio",
+					  "rmac0_phy", "rmac1_phy",
+					  "rmac2_phy";
+			clocks = <&cpg CPG_MOD 1505>;
+			power-domains = <&sysc R8A779F0_PD_ALWAYS_ON>;
+			resets = <&cpg 1505>;
+			status = "disabled";
+
+			ethernet-ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+				port@0 {
+					reg = <0>;
+					phys = <&eth_serdes 0>;
+				};
+				port@1 {
+					reg = <1>;
+					phys = <&eth_serdes 1>;
+				};
+				port@2 {
+					reg = <2>;
+					phys = <&eth_serdes 2>;
+				};
+			};
+		};
+
 		scif0: serial@e6e60000 {
 			compatible = "renesas,scif-r8a779f0",
 				     "renesas,rcar-gen4-scif", "renesas,scif";
-- 
2.25.1

