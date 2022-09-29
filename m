Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F09735EF379
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Sep 2022 12:30:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235467AbiI2Ka7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 29 Sep 2022 06:30:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234950AbiI2Ka6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Sep 2022 06:30:58 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C71A710F704;
        Thu, 29 Sep 2022 03:30:54 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.93,354,1654527600"; 
   d="scan'208";a="134378859"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 29 Sep 2022 19:30:54 +0900
Received: from localhost.localdomain (unknown [10.226.92.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 13139400F7A2;
        Thu, 29 Sep 2022 19:30:50 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, Lee Jones <lee@kernel.org>,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH RFC 1/7] dt-bindings: mfd: Document RZ/G2L MTU3a bindings
Date:   Thu, 29 Sep 2022 11:30:37 +0100
Message-Id: <20220929103043.1228235-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220929103043.1228235-1-biju.das.jz@bp.renesas.com>
References: <20220929103043.1228235-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The RZ/G2L multi-function timer pulse unit 3 (MTU3a) is embedded in
the Renesas RZ/G2L family SoC's. It consists of eight 16-bit timer
channels and one 32-bit timer channel. It supports the following
functions
 - Counter
 - Timer
 - PWM

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
It is same as [1]. Just sending this patch to avoid any bot error for
the subsequent patches.
[1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220926132114.60396-3-biju.das.jz@bp.renesas.com/
---
 .../bindings/mfd/renesas,rzg2l-mtu3.yaml      | 275 ++++++++++++++++++
 1 file changed, 275 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/renesas,rzg2l-mtu3.yaml

diff --git a/Documentation/devicetree/bindings/mfd/renesas,rzg2l-mtu3.yaml b/Documentation/devicetree/bindings/mfd/renesas,rzg2l-mtu3.yaml
new file mode 100644
index 000000000000..c1fae8e8d9f9
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/renesas,rzg2l-mtu3.yaml
@@ -0,0 +1,275 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/renesas,rzg2l-mtu3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/G2L Multi-Function Timer Pulse Unit 3 (MTU3a) bindings
+
+maintainers:
+  - Biju Das <biju.das.jz@bp.renesas.com>
+
+description: |
+  This hardware block pconsisting of eight 16-bit timer channels and one
+  32- bit timer channel. It supports the following specifications:
+    - Pulse input/output: 28 lines max.
+    - Pulse input 3 lines
+    - Count clock 11 clocks for each channel (14 clocks for MTU0, 12 clocks
+      for MTU2, and 10 clocks for MTU5, four clocks for MTU1-MTU2 combination
+      (when LWA = 1))
+    - Operating frequency Up to 100 MHz
+    - Available operations [MTU0 to MTU4, MTU6, MTU7, and MTU8]
+        - Waveform output on compare match
+        - Input capture function (noise filter setting available)
+        - Counter-clearing operation
+        - Simultaneous writing to multiple timer counters (TCNT)
+          (excluding MTU8).
+        - Simultaneous clearing on compare match or input capture
+          (excluding MTU8).
+        - Simultaneous input and output to registers in synchronization with
+          counter operations           (excluding MTU8).
+        - Up to 12-phase PWM output in combination with synchronous operation
+          (excluding MTU8)
+    - [MTU0 MTU3, MTU4, MTU6, MTU7, and MTU8]
+        - Buffer operation specifiable
+    - [MTU1, MTU2]
+        - Phase counting mode can be specified independently
+        - 32-bit phase counting mode can be specified for interlocked operation
+          of MTU1 and MTU2 (when TMDR3.LWA = 1)
+        - Cascade connection operation available
+    - [MTU3, MTU4, MTU6, and MTU7]
+        - Through interlocked operation of MTU3/4 and MTU6/7, the positive and
+          negative signals in six phases (12 phases in total) can be output in
+          complementary PWM and reset-synchronized PWM operation.
+        - In complementary PWM mode, values can be transferred from buffer
+          registers to temporary registers at crests and troughs of the timer-
+          counter values or when the buffer registers (TGRD registers in MTU4
+          and MTU7) are written to.
+        - Double-buffering selectable in complementary PWM mode.
+    - [MTU3 and MTU4]
+        - Through interlocking with MTU0, a mode for driving AC synchronous
+          motors (brushless DC motors) by using complementary PWM output and
+          reset-synchronized PWM output is settable and allows the selection
+          of two types of waveform output (chopping or level).
+    - [MTU5]
+        - Capable of operation as a dead-time compensation counter.
+    - [MTU0/MTU5, MTU1, MTU2, and MTU8]
+        - 32-bit phase counting mode specifiable by combining MTU1 and MTU2 and
+          through interlocked operation with MTU0/MTU5 and MTU8.
+    - Interrupt-skipping function
+        - In complementary PWM mode, interrupts on crests and troughs of counter
+          values and triggers to start conversion by the A/D converter can be
+          skipped.
+    - Interrupt sources: 43 sources.
+    - Buffer operation:
+        - Automatic transfer of register data (transfer from the buffer
+          register to the timer register).
+    - Trigger generation
+        - A/D converter start triggers can be generated
+        - A/D converter start request delaying function enables A/D converter
+          to be started with any desired timing and to be synchronized with
+          PWM output.
+    - Low power consumption function
+        - The MTU3a can be placed in the module-stop state.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - renesas,r9a07g044-mtu3  # RZ/G2{L,LC}
+          - renesas,r9a07g054-mtu3  # RZ/V2L
+      - const: renesas,rzg2l-mtu3
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: MTU0.TGRA input capture/compare match
+      - description: MTU0.TGRB input capture/compare match
+      - description: MTU0.TGRC input capture/compare match
+      - description: MTU0.TGRD input capture/compare match
+      - description: MTU0.TCNT overflow
+      - description: MTU0.TGRE compare match
+      - description: MTU0.TGRF compare match
+      - description: MTU1.TGRA input capture/compare match
+      - description: MTU1.TGRB input capture/compare match
+      - description: MTU1.TCNT overflow
+      - description: MTU1.TCNT underflow
+      - description: MTU2.TGRA input capture/compare match
+      - description: MTU2.TGRB input capture/compare match
+      - description: MTU2.TCNT overflow
+      - description: MTU2.TCNT underflow
+      - description: MTU3.TGRA input capture/compare match
+      - description: MTU3.TGRB input capture/compare match
+      - description: MTU3.TGRC input capture/compare match
+      - description: MTU3.TGRD input capture/compare match
+      - description: MTU3.TCNT overflow
+      - description: MTU4.TGRA input capture/compare match
+      - description: MTU4.TGRB input capture/compare match
+      - description: MTU4.TGRC input capture/compare match
+      - description: MTU4.TGRD input capture/compare match
+      - description: MTU4.TCNT overflow/underflow
+      - description: MTU5.TGRU input capture/compare match
+      - description: MTU5.TGRV input capture/compare match
+      - description: MTU5.TGRW input capture/compare match
+      - description: MTU6.TGRA input capture/compare match
+      - description: MTU6.TGRB input capture/compare match
+      - description: MTU6.TGRC input capture/compare match
+      - description: MTU6.TGRD input capture/compare match
+      - description: MTU6.TCNT overflow
+      - description: MTU7.TGRA input capture/compare match
+      - description: MTU7.TGRB input capture/compare match
+      - description: MTU7.TGRC input capture/compare match
+      - description: MTU7.TGRD input capture/compare match
+      - description: MTU7.TCNT overflow/underflow
+      - description: MTU8.TGRA input capture/compare match
+      - description: MTU8.TGRB input capture/compare match
+      - description: MTU8.TGRC input capture/compare match
+      - description: MTU8.TGRD input capture/compare match
+      - description: MTU8.TCNT overflow
+      - description: MTU8.TCNT underflow
+
+  interrupt-names:
+    items:
+      - const: tgia0
+      - const: tgib0
+      - const: tgic0
+      - const: tgid0
+      - const: tgiv0
+      - const: tgie0
+      - const: tgif0
+      - const: tgia1
+      - const: tgib1
+      - const: tgiv1
+      - const: tgiu1
+      - const: tgia2
+      - const: tgib2
+      - const: tgiv2
+      - const: tgiu2
+      - const: tgia3
+      - const: tgib3
+      - const: tgic3
+      - const: tgid3
+      - const: tgiv3
+      - const: tgia4
+      - const: tgib4
+      - const: tgic4
+      - const: tgid4
+      - const: tgiv4
+      - const: tgiu5
+      - const: tgiv5
+      - const: tgiw5
+      - const: tgia6
+      - const: tgib6
+      - const: tgic6
+      - const: tgid6
+      - const: tgiv6
+      - const: tgia7
+      - const: tgib7
+      - const: tgic7
+      - const: tgid7
+      - const: tgiv7
+      - const: tgia8
+      - const: tgib8
+      - const: tgic8
+      - const: tgid8
+      - const: tgiv8
+      - const: tgiu8
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
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
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
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r9a07g044-cpg.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    mtu3: timer@10001200 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      compatible = "renesas,r9a07g044-mtu3", "renesas,rzg2l-mtu3";
+      reg = <0x10001200 0xb00>;
+      interrupts = <GIC_SPI 170 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 171 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 172 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 173 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 174 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 175 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 176 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 177 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 178 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 179 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 180 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 181 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 182 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 183 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 184 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 185 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 186 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 187 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 188 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 189 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 190 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 191 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 192 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 193 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 194 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 195 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 196 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 197 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 198 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 199 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 200 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 201 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 202 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 203 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 204 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 205 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 206 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 207 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 208 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 209 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 210 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 211 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 212 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 213 IRQ_TYPE_EDGE_RISING>;
+      interrupt-names = "tgia0", "tgib0", "tgic0", "tgid0", "tgiv0", "tgie0",
+                        "tgif0",
+                        "tgia1", "tgib1", "tgiv1", "tgiu1",
+                        "tgia2", "tgib2", "tgiv2", "tgiu2",
+                        "tgia3", "tgib3", "tgic3", "tgid3", "tgiv3",
+                        "tgia4", "tgib4", "tgic4", "tgid4", "tgiv4",
+                        "tgiu5", "tgiv5", "tgiw5",
+                        "tgia6", "tgib6", "tgic6", "tgid6", "tgiv6",
+                        "tgia7", "tgib7", "tgic7", "tgid7", "tgiv7",
+                        "tgia8", "tgib8", "tgic8", "tgid8", "tgiv8", "tgiu8";
+      clocks = <&cpg CPG_MOD R9A07G044_MTU_X_MCK_MTU3>;
+      power-domains = <&cpg>;
+      resets = <&cpg R9A07G044_MTU_X_PRESET_MTU3>;
+    };
+
+...
-- 
2.25.1

