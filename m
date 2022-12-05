Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42708642ADC
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  5 Dec 2022 16:00:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231819AbiLEPAR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 5 Dec 2022 10:00:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229970AbiLEPAP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Dec 2022 10:00:15 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A9CE7DF7A;
        Mon,  5 Dec 2022 07:00:14 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.96,219,1665414000"; 
   d="scan'208";a="142271742"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 06 Dec 2022 00:00:14 +0900
Received: from localhost.localdomain (unknown [10.226.92.127])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 34B134009BED;
        Tue,  6 Dec 2022 00:00:11 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 4/6] dt-bindings: counter: Add RZ/V2M TIM counter binding
Date:   Mon,  5 Dec 2022 14:59:53 +0000
Message-Id: <20221205145955.391526-5-biju.das.jz@bp.renesas.com>
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

Add device tree binding for the Renesas RZ/V2M Counter Match Timer
(a.k.a TIM).

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../counter/renesas,rzv2m-tim-cnt.yaml        | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/counter/renesas,rzv2m-tim-cnt.yaml

diff --git a/Documentation/devicetree/bindings/counter/renesas,rzv2m-tim-cnt.yaml b/Documentation/devicetree/bindings/counter/renesas,rzv2m-tim-cnt.yaml
new file mode 100644
index 000000000000..963dffe1c957
--- /dev/null
+++ b/Documentation/devicetree/bindings/counter/renesas,rzv2m-tim-cnt.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/counter/renesas,rzv2m-tim-cnt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/V2M Compare Match Timer (TIM)
+
+maintainers:
+  - Biju Das <biju.das.jz@bp.renesas.com>
+
+description: |
+  The Compare Match Timer(TIM) on RZ/V2M like SoCs has an internal 32-bit
+  counter that can be used as an interval timer. This LSI has a total of 32
+  channels of TIM from ch. 0 to ch. 31. It supports the following features
+  * Configured with a 32-bit counter operating at INCLOCK (2 MHz)
+  * The clock input from the count clock input pin can be divided by 2, 4,
+    8, 16, 32, 64, 128, or 256, and one of these divided clocks can be
+    used as the count clock.
+  * The counter period can be set in the range of 1 to 4294967296
+    (32-bit timer) using the selected divider clock as the count clock.
+  * Generates an interrupt request signal every cycle set in the TIM
+    counter.
+  * The counter operation and the bus interface are asynchronous and
+    can operate independently regardless of the size of the respective
+    clock cycles.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - renesas,r9a09g011-tim-cnt  # RZ/V2M
+          - renesas,r9a09g055-tim-cnt  # RZ/V2MA
+      - const: renesas,rzv2m-tim-cnt
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: APB clock
+      - description: TIM clock
+
+  clock-names:
+    items:
+      - const: apb
+      - const: tim
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
+  - clocks
+  - clock-names
+  - power-domains
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r9a09g011-cpg.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    tim8: tim@a4000400 {
+        compatible = "renesas,r9a09g011-tim-cnt", "renesas,rzv2m-tim-cnt";
+        reg = <0xa4000400 0x80>;
+        interrupts = <GIC_SPI 115 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&cpg CPG_MOD R9A09G011_CPERI_GRPB_PCLK>,
+                 <&cpg CPG_MOD R9A09G011_TIM8_CLK>;
+        clock-names = "apb", "tim";
+        power-domains = <&cpg>;
+        resets = <&cpg R9A09G011_TIM_GPB_PRESETN>;
+    };
-- 
2.25.1

