Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 509BD6D4210
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  3 Apr 2023 12:33:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232190AbjDCKdY (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 3 Apr 2023 06:33:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231744AbjDCKdJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Apr 2023 06:33:09 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6E06C524A;
        Mon,  3 Apr 2023 03:33:07 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.98,314,1673881200"; 
   d="scan'208";a="154702133"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 03 Apr 2023 19:33:06 +0900
Received: from localhost.localdomain (unknown [10.226.92.243])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 920ED42050D2;
        Mon,  3 Apr 2023 19:33:03 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/3] dt-bindings: clock: Add Renesas versa3 clock generator bindings
Date:   Mon,  3 Apr 2023 11:32:55 +0100
Message-Id: <20230403103257.328954-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230403103257.328954-1-biju.das.jz@bp.renesas.com>
References: <20230403103257.328954-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
v2->v3:
 * Added Rb tag from Krzysztof Kozlowski
 * Removed | from Link to data sheet.
 * Dropped stray blank line from example.
 * Updated example section for assigned-clocks to mach same alignment
   with assigned-clock-rates. This is trivial change so retained the
   Rb tag.
RFC->v2:
 * Renamed the filename to match with compatible
 * Added maintainers entry after title
 * Removed the wrapping for the link to data sheet.
 * Removed reg description
 * Removed clock names
 * Replaced minItems->maxItems in renesas,settings property
 * Dropped assigned-clocks, assigned-clock-rates
 * Dropped renesas,clock-divider-read-only and renesas,clock-flags
 * Drooped clock handle part from example
 * Dropped reg from example.
 * Dropped consumer example
---
 .../bindings/clock/renesas,5p35023.yaml       | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,5p35023.yaml

diff --git a/Documentation/devicetree/bindings/clock/renesas,5p35023.yaml b/Documentation/devicetree/bindings/clock/renesas,5p35023.yaml
new file mode 100644
index 000000000000..839648e753d4
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/renesas,5p35023.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/renesas,5p35023.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas 5p35023 VersaClock 3 programmable I2C clock generator
+
+maintainers:
+  - Biju Das <biju.das.jz@bp.renesas.com>
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
+  Link to datasheet:
+  https://www.renesas.com/us/en/products/clocks-timing/clock-generation/programmable-clocks/5p35023-versaclock-3s-programmable-clock-generator
+
+properties:
+  compatible:
+    enum:
+      - renesas,5p35023
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  clocks:
+    maxItems: 1
+
+  renesas,settings:
+    description: Optional, complete register map of the device.
+      Optimized settings for the device must be provided in full
+      and are written during initialization.
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    maxItems: 37
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        versa3: clock-generator@68 {
+            compatible = "renesas,5p35023";
+            reg = <0x68>;
+            #clock-cells = <1>;
+
+            clocks = <&x1_x2>;
+
+            renesas,settings = [
+                80 00 11 19 4c 02 23 7f 83 19 08 a9 5f 25 24 bf
+                00 14 7a e1 00 00 00 00 01 55 59 bb 3f 30 90 b6
+                80 b0 45 c4 95
+            ];
+
+            assigned-clocks = <&versa3 0>, <&versa3 1>,
+                              <&versa3 2>, <&versa3 3>,
+                              <&versa3 4>, <&versa3 5>;
+            assigned-clock-rates = <12288000>, <25000000>,
+                                   <12000000>, <11289600>,
+                                   <11289600>, <24000000>;
+        };
+    };
-- 
2.25.1

