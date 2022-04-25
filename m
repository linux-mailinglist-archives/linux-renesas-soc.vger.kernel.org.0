Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1C3650E670
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Apr 2022 19:05:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243714AbiDYRI5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Apr 2022 13:08:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240888AbiDYRI4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Apr 2022 13:08:56 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D101E27141;
        Mon, 25 Apr 2022 10:05:51 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,288,1643641200"; 
   d="scan'208";a="117938217"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 26 Apr 2022 02:05:51 +0900
Received: from localhost.localdomain (unknown [10.226.93.95])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 1CC2E400A0EF;
        Tue, 26 Apr 2022 02:05:47 +0900 (JST)
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
Subject: [PATCH 04/13] arm64: dts: renesas: r9a07g043: Fillup the CANFD stub node
Date:   Mon, 25 Apr 2022 18:05:21 +0100
Message-Id: <20220425170530.200921-5-biju.das.jz@bp.renesas.com>
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

Fillup the CANFD stub node in RZ/G2UL (R9A07G043) SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a07g043.dtsi | 31 +++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
index 8bcda969d130..60db9b02e0a7 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
@@ -291,8 +291,37 @@ sci1: serial@1004d400 {
 		};
 
 		canfd: can@10050000 {
+			compatible = "renesas,r9a07g043-canfd", "renesas,rzg2l-canfd";
 			reg = <0 0x10050000 0 0x8000>;
-			/* place holder */
+			interrupts = <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 427 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 428 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 429 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "g_err", "g_recc",
+					  "ch0_err", "ch0_rec", "ch0_trx",
+					  "ch1_err", "ch1_rec", "ch1_trx";
+			clocks = <&cpg CPG_MOD R9A07G043_CANFD_PCLK>,
+				 <&cpg CPG_CORE R9A07G043_CLK_P0_DIV2>,
+				 <&can_clk>;
+			clock-names = "fck", "canfd", "can_clk";
+			assigned-clocks = <&cpg CPG_CORE R9A07G043_CLK_P0_DIV2>;
+			assigned-clock-rates = <50000000>;
+			resets = <&cpg R9A07G043_CANFD_RSTP_N>,
+				 <&cpg R9A07G043_CANFD_RSTC_N>;
+			reset-names = "rstp_n", "rstc_n";
+			power-domains = <&cpg>;
+			status = "disabled";
+
+			channel0 {
+				status = "disabled";
+			};
+			channel1 {
+				status = "disabled";
+			};
 		};
 
 		i2c0: i2c@10058000 {
-- 
2.25.1

