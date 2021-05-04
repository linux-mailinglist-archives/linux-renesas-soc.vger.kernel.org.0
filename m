Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F8093727E2
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 May 2021 11:12:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230030AbhEDJNa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 May 2021 05:13:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229815AbhEDJN3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 May 2021 05:13:29 -0400
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D952AC06174A
        for <linux-renesas-soc@vger.kernel.org>; Tue,  4 May 2021 02:12:34 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:1ca1:e52f:3ec5:3ac5])
        by baptiste.telenet-ops.be with bizsmtp
        id 0ZCZ2500E3aEpPb01ZCZAi; Tue, 04 May 2021 11:12:33 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ldr6W-002j8z-QU; Tue, 04 May 2021 11:12:32 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1ldr6W-00H7BZ-A9; Tue, 04 May 2021 11:12:32 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Gareth Williams <gareth.williams.jx@renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: clock: renesas,r9a06g032-sysctrl: Convert to json-schema
Date:   Tue,  4 May 2021 11:12:31 +0200
Message-Id: <24d1bd7c4c46747f4e2828974c2e2e48e778bff8.1620119439.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Convert the Renesas RZ/N1D (R9A06G032) System Controller (SYSCTRL)
Device Tree binding documentation to json-schema.

Drop the consumer example, as it doesn't belong here.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../clock/renesas,r9a06g032-sysctrl.txt       | 46 --------------
 .../clock/renesas,r9a06g032-sysctrl.yaml      | 62 +++++++++++++++++++
 2 files changed, 62 insertions(+), 46 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/renesas,r9a06g032-sysctrl.txt
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,r9a06g032-sysctrl.yaml

diff --git a/Documentation/devicetree/bindings/clock/renesas,r9a06g032-sysctrl.txt b/Documentation/devicetree/bindings/clock/renesas,r9a06g032-sysctrl.txt
deleted file mode 100644
index aed713cf083128fa..0000000000000000
--- a/Documentation/devicetree/bindings/clock/renesas,r9a06g032-sysctrl.txt
+++ /dev/null
@@ -1,46 +0,0 @@
-* Renesas R9A06G032 SYSCTRL
-
-Required Properties:
-
-  - compatible: Must be:
-    - "renesas,r9a06g032-sysctrl"
-  - reg: Base address and length of the SYSCTRL IO block.
-  - #clock-cells: Must be 1
-  - clocks: References to the parent clocks:
-	- external 40mhz crystal.
-	- external (optional) 32.768khz
-	- external (optional) jtag input
-	- external (optional) RGMII_REFCLK
-  - clock-names: Must be:
-        clock-names = "mclk", "rtc", "jtag", "rgmii_ref_ext";
-  - #power-domain-cells: Must be 0
-
-Examples
---------
-
-  - SYSCTRL node:
-
-	sysctrl: system-controller@4000c000 {
-		compatible = "renesas,r9a06g032-sysctrl";
-		reg = <0x4000c000 0x1000>;
-		#clock-cells = <1>;
-
-		clocks = <&ext_mclk>, <&ext_rtc_clk>,
-				<&ext_jtag_clk>, <&ext_rgmii_ref>;
-		clock-names = "mclk", "rtc", "jtag", "rgmii_ref_ext";
-		#power-domain-cells = <0>;
-	};
-
-  - Other nodes can use the clocks provided by SYSCTRL as in:
-
-	#include <dt-bindings/clock/r9a06g032-sysctrl.h>
-	uart0: serial@40060000 {
-		compatible = "snps,dw-apb-uart";
-		reg = <0x40060000 0x400>;
-		interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
-		reg-shift = <2>;
-		reg-io-width = <4>;
-		clocks = <&sysctrl R9A06G032_CLK_UART0>, <&sysctrl R9A06G032_HCLK_UART0>;
-		clock-names = "baudclk", "apb_pclk";
-		power-domains = <&sysctrl>;
-	};
diff --git a/Documentation/devicetree/bindings/clock/renesas,r9a06g032-sysctrl.yaml b/Documentation/devicetree/bindings/clock/renesas,r9a06g032-sysctrl.yaml
new file mode 100644
index 0000000000000000..25dbb0fac0656460
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/renesas,r9a06g032-sysctrl.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/renesas,r9a06g032-sysctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/N1D (R9A06G032) System Controller
+
+maintainers:
+  - Gareth Williams <gareth.williams.jx@renesas.com>
+  - Geert Uytterhoeven <geert+renesas@glider.be>
+
+properties:
+  compatible:
+    const: renesas,r9a06g032-sysctrl
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    items:
+      - description: External 40 MHz crystal
+      - description: Optional external 32.768 kHz crystal
+      - description: Optional external JTAG input
+      - description: Optional external RGMII_REFCLK
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: mclk
+      - const: rtc
+      - const: jtag
+      - const: rgmii_ref_ext
+
+  '#clock-cells':
+    const: 1
+
+  '#power-domain-cells':
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#clock-cells'
+  - '#power-domain-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    sysctrl: system-controller@4000c000 {
+            compatible = "renesas,r9a06g032-sysctrl";
+            reg = <0x4000c000 0x1000>;
+            clocks = <&ext_mclk>, <&ext_rtc_clk>, <&ext_jtag_clk>,
+                     <&ext_rgmii_ref>;
+            clock-names = "mclk", "rtc", "jtag", "rgmii_ref_ext";
+            #clock-cells = <1>;
+            #power-domain-cells = <0>;
+    };
-- 
2.25.1

