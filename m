Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8570550E673
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 25 Apr 2022 19:05:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243717AbiDYRJA (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 25 Apr 2022 13:09:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243715AbiDYRI7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Apr 2022 13:08:59 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 79D7427159;
        Mon, 25 Apr 2022 10:05:55 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,288,1643641200"; 
   d="scan'208";a="117938224"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 26 Apr 2022 02:05:54 +0900
Received: from localhost.localdomain (unknown [10.226.93.95])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id DC7F8400A0EF;
        Tue, 26 Apr 2022 02:05:51 +0900 (JST)
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
Subject: [PATCH 05/13] arm64: dts: renesas: r9a07g043: Fillup the OSTM{0,1,2} stub nodes
Date:   Mon, 25 Apr 2022 18:05:22 +0100
Message-Id: <20220425170530.200921-6-biju.das.jz@bp.renesas.com>
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

Fillup the OSTM{0,1,2} stub nodes in RZ/G2UL (R9A07G043) SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a07g043.dtsi | 24 +++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
index 60db9b02e0a7..d161600495aa 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
@@ -704,18 +704,36 @@ wdt2: watchdog@12800400 {
 		};
 
 		ostm0: timer@12801000 {
+			compatible = "renesas,r9a07g043-ostm",
+				     "renesas,ostm";
 			reg = <0x0 0x12801000 0x0 0x400>;
-			/* place holder */
+			interrupts = <GIC_SPI 46 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&cpg CPG_MOD R9A07G043_OSTM0_PCLK>;
+			resets = <&cpg R9A07G043_OSTM0_PRESETZ>;
+			power-domains = <&cpg>;
+			status = "disabled";
 		};
 
 		ostm1: timer@12801400 {
+			compatible = "renesas,r9a07g043-ostm",
+				     "renesas,ostm";
 			reg = <0x0 0x12801400 0x0 0x400>;
-			/* place holder */
+			interrupts = <GIC_SPI 47 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&cpg CPG_MOD R9A07G043_OSTM1_PCLK>;
+			resets = <&cpg R9A07G043_OSTM1_PRESETZ>;
+			power-domains = <&cpg>;
+			status = "disabled";
 		};
 
 		ostm2: timer@12801800 {
+			compatible = "renesas,r9a07g043-ostm",
+				     "renesas,ostm";
 			reg = <0x0 0x12801800 0x0 0x400>;
-			/* place holder */
+			interrupts = <GIC_SPI 48 IRQ_TYPE_EDGE_RISING>;
+			clocks = <&cpg CPG_MOD R9A07G043_OSTM2_PCLK>;
+			resets = <&cpg R9A07G043_OSTM2_PRESETZ>;
+			power-domains = <&cpg>;
+			status = "disabled";
 		};
 	};
 
-- 
2.25.1

