Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB41B5637C4
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  1 Jul 2022 18:23:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229570AbiGAQXe (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 1 Jul 2022 12:23:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231779AbiGAQXc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 1 Jul 2022 12:23:32 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id AF89412624;
        Fri,  1 Jul 2022 09:23:29 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.92,237,1650898800"; 
   d="scan'208";a="126374381"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 02 Jul 2022 01:23:29 +0900
Received: from localhost.localdomain (unknown [10.226.92.73])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 58324409F5B2;
        Sat,  2 Jul 2022 01:23:26 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: [PATCH 1/2] ARM: dts: r9a06g032: Add CAN{0,1} nodes
Date:   Fri,  1 Jul 2022 17:23:19 +0100
Message-Id: <20220701162320.102165-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220701162320.102165-1-biju.das.jz@bp.renesas.com>
References: <20220701162320.102165-1-biju.das.jz@bp.renesas.com>
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
 arch/arm/boot/dts/r9a06g032.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/r9a06g032.dtsi b/arch/arm/boot/dts/r9a06g032.dtsi
index 5b97fa85474f..48c936cf7be5 100644
--- a/arch/arm/boot/dts/r9a06g032.dtsi
+++ b/arch/arm/boot/dts/r9a06g032.dtsi
@@ -423,6 +423,24 @@ gic: interrupt-controller@44101000 {
 			interrupts =
 				<GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(2) | IRQ_TYPE_LEVEL_HIGH)>;
 		};
+
+		can0: can@52104000 {
+			compatible = "nxp,sja1000";
+			reg = <0x52104000 0x800>;
+			reg-io-width = <4>;
+			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&sysctrl R9A06G032_HCLK_CAN0>;
+			status = "disabled";
+		};
+
+		can1: can@52105000 {
+			compatible = "nxp,sja1000";
+			reg = <0x52105000 0x800>;
+			reg-io-width = <4>;
+			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&sysctrl R9A06G032_HCLK_CAN1>;
+			status = "disabled";
+		};
 	};
 
 	timer {
-- 
2.25.1

