Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 147D251C853
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 May 2022 20:46:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1384250AbiEESuG (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 5 May 2022 14:50:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384175AbiEESti (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 May 2022 14:49:38 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5F7565F273;
        Thu,  5 May 2022 11:44:01 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.91,201,1647270000"; 
   d="scan'208";a="118801394"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 06 May 2022 03:44:00 +0900
Received: from localhost.localdomain (unknown [10.226.92.72])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 73BCD40D01F0;
        Fri,  6 May 2022 03:43:57 +0900 (JST)
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
Subject: [PATCH] arm64: dts: renesas: r9a07g043: Add ADC node
Date:   Thu,  5 May 2022 19:43:53 +0100
Message-Id: <20220505184353.512133-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add ADC node to R9A07G043 (RZ/G2UL) SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a07g043.dtsi | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
index b31fb713ae4d..40201a16d653 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
@@ -483,8 +483,27 @@ i2c3: i2c@10058c00 {
 		};
 
 		adc: adc@10059000 {
+			compatible = "renesas,r9a07g043-adc", "renesas,rzg2l-adc";
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

