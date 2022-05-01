Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4603751642D
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  1 May 2022 13:29:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344739AbiEALdU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 1 May 2022 07:33:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346371AbiEALdT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 1 May 2022 07:33:19 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B152E6D39F;
        Sun,  1 May 2022 04:29:54 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.91,189,1647270000"; 
   d="scan'208";a="119719510"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 01 May 2022 20:29:54 +0900
Received: from localhost.localdomain (unknown [10.226.92.14])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id E508A422925E;
        Sun,  1 May 2022 20:29:50 +0900 (JST)
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
Subject: [PATCH 6/6] arm64: dts: renesas: r9a07g043: Add ADC node
Date:   Sun,  1 May 2022 12:29:26 +0100
Message-Id: <20220501112926.47024-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220501112926.47024-1-biju.das.jz@bp.renesas.com>
References: <20220501112926.47024-1-biju.das.jz@bp.renesas.com>
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

Add ADC node to R9A07G043 (RZ/G2UL) SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
This patch depend upon[1]
[1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220501081523.22479-1-biju.das.jz@bp.renesas.com/
---
 arch/arm64/boot/dts/renesas/r9a07g043.dtsi | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
index 55081071293f..15086f5945a2 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
@@ -483,8 +483,27 @@ i2c3: i2c@10058c00 {
 		};
 
 		adc: adc@10059000 {
+			compatible = "renesas,r9a07g043-adc";
 			reg = <0 0x10059000 0 0x400>;
-			/* place holder */
+			interrupts = <GIC_SPI 347 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&cpg CPG_MOD R9A07G043_ADC_ADCLK>,
+				 <&cpg CPG_MOD R9A07G043_ADC_PCLK>;
+			clock-names = "adclk", "pclk";
+			resets = <&cpg R9A07G043_ADC_PRESETN>,
+				 <&cpg R9A07G043_ADC_ADRST_N>;
+			reset-names = "presetn", "adrst-n";
+			power-domains = <&cpg>;
+			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			channel@0 {
+				reg = <0>;
+			};
+			channel@1 {
+				reg = <1>;
+			};
 		};
 
 		tsu: thermal@10059400 {
-- 
2.25.1

