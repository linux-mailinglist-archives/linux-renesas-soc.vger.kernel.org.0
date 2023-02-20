Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18B0069CBCE
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Feb 2023 14:14:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229881AbjBTNN2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Feb 2023 08:13:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231160AbjBTNNV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Feb 2023 08:13:21 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 36515B467;
        Mon, 20 Feb 2023 05:13:19 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.97,312,1669042800"; 
   d="scan'208";a="153478098"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 20 Feb 2023 22:13:18 +0900
Received: from localhost.localdomain (unknown [10.226.92.229])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 668334004BDC;
        Mon, 20 Feb 2023 22:13:15 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: [PATCH RFC 1/3] dt-bindings: clock: Add Renesas versa3 clock generator bindings
Date:   Mon, 20 Feb 2023 13:13:05 +0000
Message-Id: <20230220131307.269100-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230220131307.269100-1-biju.das.jz@bp.renesas.com>
References: <20230220131307.269100-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document Renesas versa3 clock generator(5P35023) bindings.

The 5P35023 is a VersaClock programmable clock generator and
is designed for low-power, consumer, and high-performance PCI
Express applications. The 5P35023 device is a three PLL
architecture design, and each PLL is individually programmable
and allowing for up to 6 unique frequency outputs.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../bindings/clock/renesas,versaclock3.yaml   | 135 ++++++++++++++++++
 1 file changed, 135 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,versaclock3.yaml

diff --git a/Documentation/devicetree/bindings/clock/renesas,versaclock3.yaml b/Documentation/devicetree/bindings/clock/renesas,versaclock3.yaml
new file mode 100644
index 000000000000..f45b8da73ec3
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/renesas,versaclock3.yaml
@@ -0,0 +1,135 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/renesas,versaclock3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas VersaClock 3 programmable I2C clock generators
+
+description: |
+  The 5P35023 is a VersaClock programmable clock generator and
+  is designed for low-power, consumer, and high-performance PCI
+  express applications. The 5P35023 device is a three PLL
+  architecture design, and each PLL is individually programmable
+  and allowing for up to 6 unique frequency outputs.
+
+  An internal OTP memory allows the user to store the configuration
+  in the device. After power up, the user can change the device register
+  settings through the I2C interface when I2C mode is selected.
+
+  The driver can read a full register map from the DT, and will use that
+  register map to initialize the attached part (via I2C) when the system
+  boots. Any configuration not supported by the common clock framework
+  must be done via the full register map, including optimized settings.
+
+  Link to datasheet: https://www.renesas.com/us/en/products/clocks-timing/
+                     clock-generation/programmable-clocks/
+                     5p35023-versaclock-3s-programmable-clock-generator
+
+maintainers:
+  - Biju Das <biju.das.jz@bp.renesas.com>
+
+properties:
+  compatible:
+    enum:
+      - renesas,5p35023
+
+  reg:
+    description: I2C device address
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  clock-names:
+    oneOf:
+      - items:
+          - const: x1
+      - items:
+          - const: clkin
+
+  clocks:
+    maxItems: 1
+
+  renesas,settings:
+    description: Optional, complete register map of the device.
+      Optimized settings for the device must be provided in full
+      and are written during initialization.
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    minItems: 37
+
+  assigned-clocks:
+    minItems: 6
+
+  assigned-clock-rates:
+    minItems: 6
+
+  renesas,clock-divider-read-only:
+    description: Flag for setting divider in read only mode.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 5
+
+  renesas,clock-flags:
+    description: Flags used in common clock frame work for configuring
+      clk outputs. See include/linux/clk-provider.h
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 6
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    /* 24MHz crystal */
+    x1_x2: xtal {
+      compatible = "fixed-clock";
+      #clock-cells = <0>;
+      clock-frequency = <24000000>;
+    };
+
+    i2c@0 {
+        reg = <0x0 0x100>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        versa3: clock-generator@68 {
+            compatible = "renesas,5p35023";
+            reg = <0x68>;
+            #clock-cells = <1>;
+
+            clocks = <&x1_x2>;
+            clock-names = "x1";
+
+            renesas,settings = [
+                80 00 11 19 4c 02 23 7f 83 19 08 a9 5f 25 24 bf
+                00 14 7a e1 00 00 00 00 01 55 59 bb 3f 30 90 b6
+                80 b0 45 c4 95
+            ];
+
+            assigned-clocks = <&versa3 0>,
+                              <&versa3 1>,
+                              <&versa3 2>,
+                              <&versa3 3>,
+                              <&versa3 4>,
+                              <&versa3 5>;
+            assigned-clock-rates = <12288000>, <25000000>,
+                                   <12000000>, <11289600>,
+                                   <11289600>, <24000000>;
+            renesas,clock-divider-read-only = <1>, <1>, <1>, <1>, <1>;
+            renesas,clock-flags = <2176>, <2176>, <2176>, <2052>,
+                                  <2176>, <2048>;
+        };
+    };
+
+    /* Consumer referencing the versa 3 */
+    consumer {
+        /* ... */
+        clocks = <&versa3 3>;
+        /* ... */
+    };
-- 
2.25.1

