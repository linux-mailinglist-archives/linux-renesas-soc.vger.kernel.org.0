Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC601642AE1
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Dec 2022 16:00:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231828AbiLEPAY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 5 Dec 2022 10:00:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231599AbiLEPAX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Dec 2022 10:00:23 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 628A51D0F4;
        Mon,  5 Dec 2022 07:00:22 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.96,219,1665414000"; 
   d="scan'208";a="145045992"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 06 Dec 2022 00:00:20 +0900
Received: from localhost.localdomain (unknown [10.226.92.127])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id B119B4009F87;
        Tue,  6 Dec 2022 00:00:17 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: [PATCH 6/6] arm64: dts: renesas: r9a09g011: Add tim nodes
Date:   Mon,  5 Dec 2022 14:59:55 +0000
Message-Id: <20221205145955.391526-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221205145955.391526-1-biju.das.jz@bp.renesas.com>
References: <20221205145955.391526-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add device nodes for the compare match timer(TIM) channels that are
not assigned to the ISP.

The channels 22 is assigned for clock source and channel 23 for
clock event and rest of the channels are assigned for counter
operation.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/r9a09g011.dtsi | 192 +++++++++++++++++++++
 1 file changed, 192 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g011.dtsi b/arch/arm64/boot/dts/renesas/r9a09g011.dtsi
index dcd3a05e54fe..69c1ebc5e0dd 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g011.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g011.dtsi
@@ -135,6 +135,198 @@ sys: system-controller@a3f03000 {
 			reg = <0 0xa3f03000 0 0x400>;
 		};
 
+		tim8: timer@a4000400 {
+			compatible = "renesas,r9a09g011-tim-cnt",
+				     "renesas,rzv2m-tim-cnt";
+			reg = <0 0xa4000400 0 0x80>;
+			interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A09G011_CPERI_GRPB_PCLK>,
+				 <&cpg CPG_MOD R9A09G011_TIM8_CLK>;
+			clock-names = "apb", "tim";
+			resets = <&cpg R9A09G011_TIM_GPB_PRESETN>;
+			power-domains = <&cpg>;
+		};
+
+		tim9: timer@a4000480 {
+			compatible = "renesas,r9a09g011-tim-cnt",
+				     "renesas,rzv2m-tim-cnt";
+			reg = <0 0xa4000480 0 0x80>;
+			interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A09G011_CPERI_GRPB_PCLK>,
+				 <&cpg CPG_MOD R9A09G011_TIM9_CLK>;
+			clock-names = "apb", "tim";
+			resets = <&cpg R9A09G011_TIM_GPB_PRESETN>;
+			power-domains = <&cpg>;
+		};
+
+		tim10: timer@a4000500 {
+			compatible = "renesas,r9a09g011-tim-cnt",
+				     "renesas,rzv2m-tim-cnt";
+			reg = <0 0xa4000500 0 0x80>;
+			interrupts = <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A09G011_CPERI_GRPB_PCLK>,
+				 <&cpg CPG_MOD R9A09G011_TIM10_CLK>;
+			clock-names = "apb", "tim";
+			resets = <&cpg R9A09G011_TIM_GPB_PRESETN>;
+			power-domains = <&cpg>;
+		};
+
+		tim11: timer@a4000580 {
+			compatible = "renesas,r9a09g011-tim-cnt",
+				     "renesas,rzv2m-tim-cnt";
+			reg = <0 0xa4000580 0 0x80>;
+			interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A09G011_CPERI_GRPB_PCLK>,
+				 <&cpg CPG_MOD R9A09G011_TIM11_CLK>;
+			clock-names = "apb", "tim";
+			resets = <&cpg R9A09G011_TIM_GPB_PRESETN>;
+			power-domains = <&cpg>;
+		};
+
+		tim12: timer@a4000600 {
+			compatible = "renesas,r9a09g011-tim-cnt",
+				     "renesas,rzv2m-tim-cnt";
+			reg = <0 0xa4000600 0 0x80>;
+			interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A09G011_CPERI_GRPB_PCLK>,
+				 <&cpg CPG_MOD R9A09G011_TIM12_CLK>;
+			clock-names = "apb", "tim";
+			resets = <&cpg R9A09G011_TIM_GPB_PRESETN>;
+			power-domains = <&cpg>;
+		};
+
+		tim13: timer@a4000680 {
+			compatible = "renesas,r9a09g011-tim-cnt",
+				     "renesas,rzv2m-tim-cnt";
+			reg = <0 0xa4000680 0 0x80>;
+			interrupts = <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A09G011_CPERI_GRPB_PCLK>,
+				 <&cpg CPG_MOD R9A09G011_TIM13_CLK>;
+			clock-names = "apb", "tim";
+			resets = <&cpg R9A09G011_TIM_GPB_PRESETN>;
+			power-domains = <&cpg>;
+		};
+
+		tim14: timer@a4000700 {
+			compatible = "renesas,r9a09g011-tim-cnt",
+				     "renesas,rzv2m-tim-cnt";
+			reg = <0 0xa4000700 0 0x80>;
+			interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A09G011_CPERI_GRPB_PCLK>,
+				 <&cpg CPG_MOD R9A09G011_TIM14_CLK>;
+			clock-names = "apb", "tim";
+			resets = <&cpg R9A09G011_TIM_GPB_PRESETN>;
+			power-domains = <&cpg>;
+		};
+
+		tim15: timer@a4000780 {
+			compatible = "renesas,r9a09g011-tim-cnt",
+				     "renesas,rzv2m-tim-cnt";
+			reg = <0 0xa4000780 0 0x80>;
+			interrupts = <GIC_SPI 122 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A09G011_CPERI_GRPB_PCLK>,
+				 <&cpg CPG_MOD R9A09G011_TIM15_CLK>;
+			clock-names = "apb", "tim";
+			resets = <&cpg R9A09G011_TIM_GPB_PRESETN>;
+			power-domains = <&cpg>;
+		};
+
+		tim16: timer@a4000800 {
+			compatible = "renesas,r9a09g011-tim-cnt",
+				     "renesas,rzv2m-tim-cnt";
+			reg = <0 0xa4000800 0 0x80>;
+			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A09G011_CPERI_GRPC_PCLK>,
+				 <&cpg CPG_MOD R9A09G011_TIM16_CLK>;
+			clock-names = "apb", "tim";
+			resets = <&cpg R9A09G011_TIM_GPC_PRESETN>;
+			power-domains = <&cpg>;
+		};
+
+		tim17: timer@a4000880 {
+			compatible = "renesas,r9a09g011-tim-cnt",
+				     "renesas,rzv2m-tim-cnt";
+			reg = <0 0xa4000880 0 0x80>;
+			interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A09G011_CPERI_GRPC_PCLK>,
+				 <&cpg CPG_MOD R9A09G011_TIM17_CLK>;
+			clock-names = "apb", "tim";
+			resets = <&cpg R9A09G011_TIM_GPC_PRESETN>;
+			power-domains = <&cpg>;
+		};
+
+		tim18: timer@a4000900 {
+			compatible = "renesas,r9a09g011-tim-cnt",
+				     "renesas,rzv2m-tim-cnt";
+			reg = <0 0xa4000900 0 0x80>;
+			interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A09G011_CPERI_GRPC_PCLK>,
+				 <&cpg CPG_MOD R9A09G011_TIM18_CLK>;
+			clock-names = "apb", "tim";
+			resets = <&cpg R9A09G011_TIM_GPC_PRESETN>;
+			power-domains = <&cpg>;
+		};
+
+		tim19: timer@a4000980 {
+			compatible = "renesas,r9a09g011-tim-cnt",
+				     "renesas,rzv2m-tim-cnt";
+			reg = <0 0xa4000980 0 0x80>;
+			interrupts = <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A09G011_CPERI_GRPC_PCLK>,
+				 <&cpg CPG_MOD R9A09G011_TIM19_CLK>;
+			clock-names = "apb", "tim";
+			resets = <&cpg R9A09G011_TIM_GPC_PRESETN>;
+			power-domains = <&cpg>;
+		};
+
+		tim20: timer@a4000a00 {
+			compatible = "renesas,r9a09g011-tim-cnt",
+				     "renesas,rzv2m-tim-cnt";
+			reg = <0 0xa4000a00 0 0x80>;
+			interrupts = <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A09G011_CPERI_GRPC_PCLK>,
+				 <&cpg CPG_MOD R9A09G011_TIM20_CLK>;
+			clock-names = "apb", "tim";
+			resets = <&cpg R9A09G011_TIM_GPC_PRESETN>;
+			power-domains = <&cpg>;
+		};
+
+		tim21: timer@a4000a80 {
+			compatible = "renesas,r9a09g011-tim-cnt",
+				     "renesas,rzv2m-tim-cnt";
+			reg = <0 0xa4000a80 0 0x80>;
+			interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A09G011_CPERI_GRPC_PCLK>,
+				 <&cpg CPG_MOD R9A09G011_TIM21_CLK>;
+			clock-names = "apb", "tim";
+			resets = <&cpg R9A09G011_TIM_GPC_PRESETN>;
+			power-domains = <&cpg>;
+		};
+
+		tim22: timer@a4000b00 {
+			compatible = "renesas,r9a09g011-tim",
+				     "renesas,rzv2m-tim";
+			reg = <0 0xa4000b00 0 0x80>;
+			interrupts = <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A09G011_CPERI_GRPC_PCLK>,
+				 <&cpg CPG_MOD R9A09G011_TIM22_CLK>;
+			clock-names = "apb", "tim";
+			resets = <&cpg R9A09G011_TIM_GPC_PRESETN>;
+			power-domains = <&cpg>;
+		};
+
+		tim23: timer@a4000b80 {
+			compatible = "renesas,r9a09g011-tim",
+				     "renesas,rzv2m-tim";
+			reg = <0 0xa4000b80 0 0x80>;
+			interrupts = <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A09G011_CPERI_GRPC_PCLK>,
+				 <&cpg CPG_MOD R9A09G011_TIM23_CLK>;
+			clock-names = "apb", "tim";
+			resets = <&cpg R9A09G011_TIM_GPC_PRESETN>;
+			power-domains = <&cpg>;
+		};
+
 		pwm8: pwm@a4010400 {
 			compatible = "renesas,r9a09g011-pwm",
 				     "renesas,rzv2m-pwm";
-- 
2.25.1

