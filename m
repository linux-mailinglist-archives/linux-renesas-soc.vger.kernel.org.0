Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18AE15A68A3
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 30 Aug 2022 18:45:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229999AbiH3Qpj (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 30 Aug 2022 12:45:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229559AbiH3Qpi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Aug 2022 12:45:38 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E4F194CA36;
        Tue, 30 Aug 2022 09:45:36 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.93,275,1654527600"; 
   d="scan'208";a="133114596"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 31 Aug 2022 01:45:36 +0900
Received: from localhost.localdomain (unknown [10.226.92.122])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id F2EE54035E90;
        Wed, 31 Aug 2022 01:45:32 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH v3 2/3] ARM: dts: r9a06g032: Add CAN{0,1} nodes
Date:   Tue, 30 Aug 2022 17:45:17 +0100
Message-Id: <20220830164518.1381632-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220830164518.1381632-1-biju.das.jz@bp.renesas.com>
References: <20220830164518.1381632-1-biju.das.jz@bp.renesas.com>
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

Add CAN{0,1} nodes to R9A06G032 (RZ/N1) SoC DTSI.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v2->v3:
 * Dropped clock-names property.
 * Added power-domains property.
v1->v2:
 * Added RZ/N1 specific compatible string.
 * Added clock-names property.
---
 arch/arm/boot/dts/r9a06g032.dtsi | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/r9a06g032.dtsi b/arch/arm/boot/dts/r9a06g032.dtsi
index 5b97fa85474f..563024c9a4ae 100644
--- a/arch/arm/boot/dts/r9a06g032.dtsi
+++ b/arch/arm/boot/dts/r9a06g032.dtsi
@@ -423,6 +423,26 @@ gic: interrupt-controller@44101000 {
 			interrupts =
 				<GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIGH)>;
 		};
+
+		can0: can@52104000 {
+			compatible = "renesas,r9a06g032-sja1000","renesas,rzn1-sja1000";
+			reg = <0x52104000 0x800>;
+			reg-io-width = <4>;
+			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&sysctrl R9A06G032_HCLK_CAN0>;
+			power-domains = <&sysctrl>;
+			status = "disabled";
+		};
+
+		can1: can@52105000 {
+			compatible = "renesas,r9a06g032-sja1000", "renesas,rzn1-sja1000";
+			reg = <0x52105000 0x800>;
+			reg-io-width = <4>;
+			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&sysctrl R9A06G032_HCLK_CAN1>;
+			power-domains = <&sysctrl>;
+			status = "disabled";
+		};
 	};
 
 	timer {
-- 
2.25.1

