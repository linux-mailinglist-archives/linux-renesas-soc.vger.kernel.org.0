Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3B0F690963
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Feb 2023 13:57:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230020AbjBIM5U (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Feb 2023 07:57:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229869AbjBIM5S (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Feb 2023 07:57:18 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 33D935EA16;
        Thu,  9 Feb 2023 04:57:14 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.97,283,1669042800"; 
   d="scan'208";a="149037957"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 09 Feb 2023 21:57:13 +0900
Received: from localhost.localdomain (unknown [10.226.92.132])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 4330643191AC;
        Thu,  9 Feb 2023 21:57:10 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: [PATCH v4 3/4] arm64: dts: renesas: r9a09g011: Add pwm nodes
Date:   Thu,  9 Feb 2023 12:56:55 +0000
Message-Id: <20230209125656.191905-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230209125656.191905-1-biju.das.jz@bp.renesas.com>
References: <20230209125656.191905-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add device nodes for the pwm timer channels that are not assigned
to the ISP.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3->v4:
 * No change
v2->v3:
 * Added Rb tag from Geert
v1->v2:
 * Added resets property
---
 arch/arm64/boot/dts/renesas/r9a09g011.dtsi | 98 ++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g011.dtsi b/arch/arm64/boot/dts/renesas/r9a09g011.dtsi
index 46d67b200a66..b0af7404269b 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g011.dtsi
+++ b/arch/arm64/boot/dts/renesas/r9a09g011.dtsi
@@ -236,6 +236,104 @@ sys: system-controller@a3f03000 {
 			reg = <0 0xa3f03000 0 0x400>;
 		};
 
+		pwm8: pwm@a4010400 {
+			compatible = "renesas,r9a09g011-pwm",
+				     "renesas,rzv2m-pwm";
+			reg = <0 0xa4010400 0 0x80>;
+			interrupts = <GIC_SPI 376 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A09G011_CPERI_GRPF_PCLK>,
+				 <&cpg CPG_MOD R9A09G011_PWM8_CLK>;
+			clock-names = "apb", "pwm";
+			resets = <&cpg R9A09G011_PWM_GPF_PRESETN>;
+			power-domains = <&cpg>;
+			#pwm-cells = <2>;
+			status = "disabled";
+		};
+
+		pwm9: pwm@a4010480 {
+			compatible = "renesas,r9a09g011-pwm",
+				     "renesas,rzv2m-pwm";
+			reg = <0 0xa4010480 0 0x80>;
+			interrupts = <GIC_SPI 377 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A09G011_CPERI_GRPF_PCLK>,
+				 <&cpg CPG_MOD R9A09G011_PWM9_CLK>;
+			clock-names = "apb", "pwm";
+			resets = <&cpg R9A09G011_PWM_GPF_PRESETN>;
+			power-domains = <&cpg>;
+			#pwm-cells = <2>;
+			status = "disabled";
+		};
+
+		pwm10: pwm@a4010500 {
+			compatible = "renesas,r9a09g011-pwm",
+				     "renesas,rzv2m-pwm";
+			reg = <0 0xa4010500 0 0x80>;
+			interrupts = <GIC_SPI 378 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A09G011_CPERI_GRPF_PCLK>,
+				 <&cpg CPG_MOD R9A09G011_PWM10_CLK>;
+			clock-names = "apb", "pwm";
+			resets = <&cpg R9A09G011_PWM_GPF_PRESETN>;
+			power-domains = <&cpg>;
+			#pwm-cells = <2>;
+			status = "disabled";
+		};
+
+		pwm11: pwm@a4010580 {
+			compatible = "renesas,r9a09g011-pwm",
+				     "renesas,rzv2m-pwm";
+			reg = <0 0xa4010580 0 0x80>;
+			interrupts = <GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A09G011_CPERI_GRPF_PCLK>,
+				 <&cpg CPG_MOD R9A09G011_PWM11_CLK>;
+			clock-names = "apb", "pwm";
+			resets = <&cpg R9A09G011_PWM_GPF_PRESETN>;
+			power-domains = <&cpg>;
+			#pwm-cells = <2>;
+			status = "disabled";
+		};
+
+		pwm12: pwm@a4010600 {
+			compatible = "renesas,r9a09g011-pwm",
+				     "renesas,rzv2m-pwm";
+			reg = <0 0xa4010600 0 0x80>;
+			interrupts = <GIC_SPI 380 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A09G011_CPERI_GRPF_PCLK>,
+				 <&cpg CPG_MOD R9A09G011_PWM12_CLK>;
+			clock-names = "apb", "pwm";
+			resets = <&cpg R9A09G011_PWM_GPF_PRESETN>;
+			power-domains = <&cpg>;
+			#pwm-cells = <2>;
+			status = "disabled";
+		};
+
+		pwm13: pwm@a4010680 {
+			compatible = "renesas,r9a09g011-pwm",
+				     "renesas,rzv2m-pwm";
+			reg = <0 0xa4010680 0 0x80>;
+			interrupts = <GIC_SPI 381 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A09G011_CPERI_GRPF_PCLK>,
+				 <&cpg CPG_MOD R9A09G011_PWM13_CLK>;
+			clock-names = "apb", "pwm";
+			resets = <&cpg R9A09G011_PWM_GPF_PRESETN>;
+			power-domains = <&cpg>;
+			#pwm-cells = <2>;
+			status = "disabled";
+		};
+
+		pwm14: pwm@a4010700 {
+			compatible = "renesas,r9a09g011-pwm",
+				     "renesas,rzv2m-pwm";
+			reg = <0 0xa4010700 0 0x80>;
+			interrupts = <GIC_SPI 382 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&cpg CPG_MOD R9A09G011_CPERI_GRPF_PCLK>,
+				 <&cpg CPG_MOD R9A09G011_PWM14_CLK>;
+			clock-names = "apb", "pwm";
+			resets = <&cpg R9A09G011_PWM_GPF_PRESETN>;
+			power-domains = <&cpg>;
+			#pwm-cells = <2>;
+			status = "disabled";
+		};
+
 		i2c0: i2c@a4030000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.25.1

