Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C9FA58AC93
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Aug 2022 16:57:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240966AbiHEO5S (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 5 Aug 2022 10:57:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240962AbiHEO5R (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 Aug 2022 10:57:17 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E22184D801;
        Fri,  5 Aug 2022 07:57:15 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.93,216,1654527600"; 
   d="scan'208";a="128657095"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 05 Aug 2022 23:57:15 +0900
Received: from localhost.localdomain (unknown [10.226.92.175])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 70DF743C0900;
        Fri,  5 Aug 2022 23:57:11 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-pwm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v5 1/2] dt-bindings: pwm: Add RZ/G2L GPT binding
Date:   Fri,  5 Aug 2022 15:57:03 +0100
Message-Id: <20220805145704.951293-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220805145704.951293-1-biju.das.jz@bp.renesas.com>
References: <20220805145704.951293-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add device tree bindings for the General PWM Timer (GPT).

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v4->v5:
 * No change.
v3->v4:
 * No change.
v2->v3:
 * Added Rb tag from Rob.
v1->v2:
 * Added '|' after 'description:' to preserve formatting.
 * Removed description for pwm_cells as it is common property.
 * Changed the reg size in example from 0xa4->0x100
 * Added Rb tag from Geert.
RFC->v1:
 * Added Description
 * Removed comments from reg and clock
---
 .../bindings/pwm/renesas,rzg2l-gpt.yaml       | 129 ++++++++++++++++++
 1 file changed, 129 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/renesas,rzg2l-gpt.yaml

diff --git a/Documentation/devicetree/bindings/pwm/renesas,rzg2l-gpt.yaml b/Documentation/devicetree/bindings/pwm/renesas,rzg2l-gpt.yaml
new file mode 100644
index 000000000000..e8f7b9947eaa
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/renesas,rzg2l-gpt.yaml
@@ -0,0 +1,129 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/renesas,rzg2l-gpt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/G2L General PWM Timer (GPT)
+
+maintainers:
+  - Biju Das <biju.das.jz@bp.renesas.com>
+
+description: |
+  RZ/G2L General PWM Timer (GPT) composed of 8 channels with 32-bit timer
+  (GPT32E). It supports the following functions
+  * 32 bits × 8 channels.
+  * Up-counting or down-counting (saw waves) or up/down-counting
+    (triangle waves) for each counter.
+  * Clock sources independently selectable for each channel.
+  * Two I/O pins per channel.
+  * Two output compare/input capture registers per channel.
+  * For the two output compare/input capture registers of each channel,
+    four registers are provided as buffer registers and are capable of
+    operating as comparison registers when buffering is not in use.
+  * In output compare operation, buffer switching can be at crests or
+    troughs, enabling the generation of laterally asymmetric PWM waveforms.
+  * Registers for setting up frame cycles in each channel (with capability
+    for generating interrupts at overflow or underflow)
+  * Generation of dead times in PWM operation.
+  * Synchronous starting, stopping and clearing counters for arbitrary
+    channels.
+  * Starting, stopping, clearing and up/down counters in response to input
+    level comparison.
+  * Starting, clearing, stopping and up/down counters in response to a
+    maximum of four external triggers.
+  * Output pin disable function by dead time error and detected
+    short-circuits between output pins.
+  * A/D converter start triggers can be generated (GPT32E0 to GPT32E3)
+  * Enables the noise filter for input capture and external trigger
+    operation.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - renesas,r9a07g044-gpt  # RZ/G2{L,LC}
+          - renesas,r9a07g054-gpt  # RZ/V2L
+      - const: renesas,rzg2l-gpt
+
+  reg:
+    maxItems: 1
+
+  '#pwm-cells':
+    const: 2
+
+  interrupts:
+    items:
+      - description: GTCCRA input capture/compare match
+      - description: GTCCRB input capture/compare
+      - description: GTCCRC compare match
+      - description: GTCCRD compare match
+      - description: GTCCRE compare match
+      - description: GTCCRF compare match
+      - description: GTADTRA compare match
+      - description: GTADTRB compare match
+      - description: GTCNT overflow/GTPR compare match
+      - description: GTCNT underflow
+
+  interrupt-names:
+    items:
+      - const: ccmpa
+      - const: ccmpb
+      - const: cmpc
+      - const: cmpd
+      - const: cmpe
+      - const: cmpf
+      - const: adtrga
+      - const: adtrgb
+      - const: ovf
+      - const: unf
+
+  clocks:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clocks
+  - power-domains
+  - resets
+
+allOf:
+  - $ref: pwm.yaml#
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r9a07g044-cpg.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    gpt4: pwm@10048400 {
+        compatible = "renesas,r9a07g044-gpt", "renesas,rzg2l-gpt";
+        reg = <0x10048400 0x100>;
+        interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 271 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 272 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 273 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 274 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 275 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 276 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 277 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 278 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 279 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "ccmpa", "ccmpb", "cmpc", "cmpd",
+                          "cmpe", "cmpf", "adtrga", "adtrgb",
+                          "ovf", "unf";
+        clocks = <&cpg CPG_MOD R9A07G044_GPT_PCLK>;
+        power-domains = <&cpg>;
+        resets = <&cpg R9A07G044_GPT_RST_C>;
+        #pwm-cells = <2>;
+    };
-- 
2.25.1

