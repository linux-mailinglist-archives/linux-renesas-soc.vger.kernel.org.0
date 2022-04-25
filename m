Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 585A450E66A
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Apr 2022 19:05:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243716AbiDYRIt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Apr 2022 13:08:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242850AbiDYRIp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Apr 2022 13:08:45 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 99B1626AF7;
        Mon, 25 Apr 2022 10:05:40 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,288,1643641200"; 
   d="scan'208";a="117938206"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 26 Apr 2022 02:05:40 +0900
Received: from localhost.localdomain (unknown [10.226.93.95])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 09675400B9E1;
        Tue, 26 Apr 2022 02:05:36 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 01/13] arm64: dts: renesas: r9a07g043: Add I2C2 node and fillup the I2C{0,1,3} stub nodes
Date:   Mon, 25 Apr 2022 18:05:18 +0100
Message-Id: <20220425170530.200921-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220425170530.200921-1-biju.das.jz@bp.renesas.com>
References: <20220425170530.200921-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add I2C2 node and fillup the I2C{0,1,3} stub nodes in RZ/G2UL
(R9A07G043) SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a07g043.dtsi | 73 +++++++++++++++++++++-
 1 file changed, 70 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
index c8aadbe55278..2025224d71ab 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
@@ -220,22 +220,89 @@ canfd: can@10050000 {
 		i2c0: i2c@10058000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
+			compatible = "renesas,riic-r9a07g043", "renesas,riic-rz";
 			reg = <0 0x10058000 0 0x400>;
-			/* place holder */
+			interrupts = <GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 348 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 349 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tei", "ri", "ti", "spi", "sti",
+					  "naki", "ali", "tmoi";
+			clocks = <&cpg CPG_MOD R9A07G043_I2C0_PCLK>;
+			clock-frequency = <100000>;
+			resets = <&cpg R9A07G043_I2C0_MRST>;
+			power-domains = <&cpg>;
+			status = "disabled";
 		};
 
 		i2c1: i2c@10058400 {
 			#address-cells = <1>;
 			#size-cells = <0>;
+			compatible = "renesas,riic-r9a07g043", "renesas,riic-rz";
 			reg = <0 0x10058400 0 0x400>;
-			/* place holder */
+			interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 356 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 357 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 361 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 362 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tei", "ri", "ti", "spi", "sti",
+					  "naki", "ali", "tmoi";
+			clocks = <&cpg CPG_MOD R9A07G043_I2C1_PCLK>;
+			clock-frequency = <100000>;
+			resets = <&cpg R9A07G043_I2C1_MRST>;
+			power-domains = <&cpg>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@10058800 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "renesas,riic-r9a07g043", "renesas,riic-rz";
+			reg = <0 0x10058800 0 0x400>;
+			interrupts = <GIC_SPI 366 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 364 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 365 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 367 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tei", "ri", "ti", "spi", "sti",
+					  "naki", "ali", "tmoi";
+			clocks = <&cpg CPG_MOD R9A07G043_I2C2_PCLK>;
+			clock-frequency = <100000>;
+			resets = <&cpg R9A07G043_I2C2_MRST>;
+			power-domains = <&cpg>;
+			status = "disabled";
 		};
 
 		i2c3: i2c@10058c00 {
 			#address-cells = <1>;
 			#size-cells = <0>;
+			compatible = "renesas,riic-r9a07g043", "renesas,riic-rz";
 			reg = <0 0x10058c00 0 0x400>;
-			/* place holder */
+			interrupts = <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 372 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 373 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 376 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 377 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 378 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "tei", "ri", "ti", "spi", "sti",
+					  "naki", "ali", "tmoi";
+			clocks = <&cpg CPG_MOD R9A07G043_I2C3_PCLK>;
+			clock-frequency = <100000>;
+			resets = <&cpg R9A07G043_I2C3_MRST>;
+			power-domains = <&cpg>;
+			status = "disabled";
 		};
 
 		adc: adc@10059000 {
-- 
2.25.1

