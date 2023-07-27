Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E439764D92
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Jul 2023 10:36:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234411AbjG0IgV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 27 Jul 2023 04:36:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234218AbjG0IgC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Jul 2023 04:36:02 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AEA8D2D71;
        Thu, 27 Jul 2023 01:19:25 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,234,1684767600"; 
   d="scan'208";a="171020969"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 27 Jul 2023 17:19:14 +0900
Received: from localhost.localdomain (unknown [10.226.93.33])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id DF1B941CA1EF;
        Thu, 27 Jul 2023 17:19:10 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 4/5] arm64: dts: renesas: r9a07g043: Add MTU3a node
Date:   Thu, 27 Jul 2023 09:18:47 +0100
Message-Id: <20230727081848.100834-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230727081848.100834-1-biju.das.jz@bp.renesas.com>
References: <20230727081848.100834-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UPPERCASE_50_75 autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add MTU3a node to R9A07G043 (RZ/{G2UL,Five}) SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * No change
v1->v2:
 * Updated commit description RZ/G2UL->RZ/{G2UL,Five}.
 * Fixed build error reported by kernel test robot by replacing
   GIC_SPI x ->SOC_PERIPHERAL_IRQ(x).
---
 arch/arm64/boot/dts/renesas/r9a07g043.dtsi | 70 ++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
index 27c35a657b15..8721f4c9fa0f 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a07g043.dtsi
@@ -74,6 +74,76 @@ soc: soc {
 		#size-cells = <2>;
 		ranges;
 
+		mtu3: timer@10001200 {
+			compatible = "renesas,r9a07g043-mtu3",
+				     "renesas,rz-mtu3";
+			reg = <0 0x10001200 0 0xb00>;
+			interrupts = <SOC_PERIPHERAL_IRQ(170) IRQ_TYPE_EDGE_RISING>,
+				     <SOC_PERIPHERAL_IRQ(171) IRQ_TYPE_EDGE_RISING>,
+				     <SOC_PERIPHERAL_IRQ(172) IRQ_TYPE_EDGE_RISING>,
+				     <SOC_PERIPHERAL_IRQ(173) IRQ_TYPE_EDGE_RISING>,
+				     <SOC_PERIPHERAL_IRQ(174) IRQ_TYPE_EDGE_RISING>,
+				     <SOC_PERIPHERAL_IRQ(175) IRQ_TYPE_EDGE_RISING>,
+				     <SOC_PERIPHERAL_IRQ(176) IRQ_TYPE_EDGE_RISING>,
+				     <SOC_PERIPHERAL_IRQ(177) IRQ_TYPE_EDGE_RISING>,
+				     <SOC_PERIPHERAL_IRQ(178) IRQ_TYPE_EDGE_RISING>,
+				     <SOC_PERIPHERAL_IRQ(179) IRQ_TYPE_EDGE_RISING>,
+				     <SOC_PERIPHERAL_IRQ(180) IRQ_TYPE_EDGE_RISING>,
+				     <SOC_PERIPHERAL_IRQ(181) IRQ_TYPE_EDGE_RISING>,
+				     <SOC_PERIPHERAL_IRQ(182) IRQ_TYPE_EDGE_RISING>,
+				     <SOC_PERIPHERAL_IRQ(183) IRQ_TYPE_EDGE_RISING>,
+				     <SOC_PERIPHERAL_IRQ(184) IRQ_TYPE_EDGE_RISING>,
+				     <SOC_PERIPHERAL_IRQ(185) IRQ_TYPE_EDGE_RISING>,
+				     <SOC_PERIPHERAL_IRQ(186) IRQ_TYPE_EDGE_RISING>,
+				     <SOC_PERIPHERAL_IRQ(187) IRQ_TYPE_EDGE_RISING>,
+				     <SOC_PERIPHERAL_IRQ(188) IRQ_TYPE_EDGE_RISING>,
+				     <SOC_PERIPHERAL_IRQ(189) IRQ_TYPE_EDGE_RISING>,
+				     <SOC_PERIPHERAL_IRQ(190) IRQ_TYPE_EDGE_RISING>,
+				     <SOC_PERIPHERAL_IRQ(191) IRQ_TYPE_EDGE_RISING>,
+				     <SOC_PERIPHERAL_IRQ(192) IRQ_TYPE_EDGE_RISING>,
+				     <SOC_PERIPHERAL_IRQ(193) IRQ_TYPE_EDGE_RISING>,
+				     <SOC_PERIPHERAL_IRQ(194) IRQ_TYPE_EDGE_RISING>,
+				     <SOC_PERIPHERAL_IRQ(195) IRQ_TYPE_EDGE_RISING>,
+				     <SOC_PERIPHERAL_IRQ(196) IRQ_TYPE_EDGE_RISING>,
+				     <SOC_PERIPHERAL_IRQ(197) IRQ_TYPE_EDGE_RISING>,
+				     <SOC_PERIPHERAL_IRQ(198) IRQ_TYPE_EDGE_RISING>,
+				     <SOC_PERIPHERAL_IRQ(199) IRQ_TYPE_EDGE_RISING>,
+				     <SOC_PERIPHERAL_IRQ(200) IRQ_TYPE_EDGE_RISING>,
+				     <SOC_PERIPHERAL_IRQ(201) IRQ_TYPE_EDGE_RISING>,
+				     <SOC_PERIPHERAL_IRQ(202) IRQ_TYPE_EDGE_RISING>,
+				     <SOC_PERIPHERAL_IRQ(203) IRQ_TYPE_EDGE_RISING>,
+				     <SOC_PERIPHERAL_IRQ(204) IRQ_TYPE_EDGE_RISING>,
+				     <SOC_PERIPHERAL_IRQ(205) IRQ_TYPE_EDGE_RISING>,
+				     <SOC_PERIPHERAL_IRQ(206) IRQ_TYPE_EDGE_RISING>,
+				     <SOC_PERIPHERAL_IRQ(207) IRQ_TYPE_EDGE_RISING>,
+				     <SOC_PERIPHERAL_IRQ(208) IRQ_TYPE_EDGE_RISING>,
+				     <SOC_PERIPHERAL_IRQ(209) IRQ_TYPE_EDGE_RISING>,
+				     <SOC_PERIPHERAL_IRQ(210) IRQ_TYPE_EDGE_RISING>,
+				     <SOC_PERIPHERAL_IRQ(211) IRQ_TYPE_EDGE_RISING>,
+				     <SOC_PERIPHERAL_IRQ(212) IRQ_TYPE_EDGE_RISING>,
+				     <SOC_PERIPHERAL_IRQ(213) IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "tgia0", "tgib0", "tgic0", "tgid0",
+					  "tciv0", "tgie0", "tgif0",
+					  "tgia1", "tgib1", "tciv1", "tciu1",
+					  "tgia2", "tgib2", "tciv2", "tciu2",
+					  "tgia3", "tgib3", "tgic3", "tgid3",
+					  "tciv3",
+					  "tgia4", "tgib4", "tgic4", "tgid4",
+					  "tciv4",
+					  "tgiu5", "tgiv5", "tgiw5",
+					  "tgia6", "tgib6", "tgic6", "tgid6",
+					  "tciv6",
+					  "tgia7", "tgib7", "tgic7", "tgid7",
+					  "tciv7",
+					  "tgia8", "tgib8", "tgic8", "tgid8",
+					  "tciv8", "tciu8";
+			clocks = <&cpg CPG_MOD R9A07G043_MTU_X_MCK_MTU3>;
+			power-domains = <&cpg>;
+			resets = <&cpg R9A07G043_MTU_X_PRESET_MTU3>;
+			#pwm-cells = <2>;
+			status = "disabled";
+		};
+
 		ssi0: ssi@10049c00 {
 			compatible = "renesas,r9a07g043-ssi",
 				     "renesas,rz-ssi";
-- 
2.25.1

