Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4C051743B04
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 30 Jun 2023 13:40:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232598AbjF3LkZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 30 Jun 2023 07:40:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232420AbjF3LkY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Jun 2023 07:40:24 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CE5A11FE4;
        Fri, 30 Jun 2023 04:40:23 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,170,1684767600"; 
   d="scan'208";a="166224254"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 30 Jun 2023 20:40:23 +0900
Received: from localhost.localdomain (unknown [10.226.93.15])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id BB14E421E673;
        Fri, 30 Jun 2023 20:40:20 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: [PATCH v5 3/4] arm64: dts: renesas: r9a09g011: Add pwm nodes
Date:   Fri, 30 Jun 2023 12:40:02 +0100
Message-Id: <20230630114003.320641-4-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230630114003.320641-1-biju.das.jz@bp.renesas.com>
References: <20230630114003.320641-1-biju.das.jz@bp.renesas.com>
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

Add device nodes for the pwm timer channels that are not assigned
to the ISP.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v4->v5:
 * No change.
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

