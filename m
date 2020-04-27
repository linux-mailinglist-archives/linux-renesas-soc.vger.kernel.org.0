Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52CEF1BADFD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 27 Apr 2020 21:32:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726743AbgD0Tcc (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 27 Apr 2020 15:32:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726285AbgD0Tcc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Apr 2020 15:32:32 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC9F2C0610D5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Apr 2020 12:32:31 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:d03f:8af3:4e83:6587])
        by andre.telenet-ops.be with bizsmtp
        id XvYW2200L27aUyk01vYW0f; Mon, 27 Apr 2020 21:32:30 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jT9UU-0007rt-8w; Mon, 27 Apr 2020 21:32:30 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jT9UU-0007hL-7J; Mon, 27 Apr 2020 21:32:30 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Chris Brandt <chris.brandt@renesas.com>
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: timer: renesas: ostm: Convert to json-schema
Date:   Mon, 27 Apr 2020 21:32:24 +0200
Message-Id: <20200427193224.29548-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Convert the Renesas OS Timer (OSTM) Device Tree binding documentation to
json-schema.

Document missing properties.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
For a clean dtbs_check, this depends on "[PATCH] ARM: dts: r7s9210: Remove
bogus clock-names from OSTM nodes"
(https://lore.kernel.org/r/20200427192932.28967-1-geert+renesas@glider.be)
which I intend to queue as a fix for v5.7.

 .../bindings/timer/renesas,ostm.txt           | 31 ----------
 .../bindings/timer/renesas,ostm.yaml          | 59 +++++++++++++++++++
 2 files changed, 59 insertions(+), 31 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/timer/renesas,ostm.txt
 create mode 100644 Documentation/devicetree/bindings/timer/renesas,ostm.yaml

diff --git a/Documentation/devicetree/bindings/timer/renesas,ostm.txt b/Documentation/devicetree/bindings/timer/renesas,ostm.txt
deleted file mode 100644
index 81a78f8bcf170a82..0000000000000000
--- a/Documentation/devicetree/bindings/timer/renesas,ostm.txt
+++ /dev/null
@@ -1,31 +0,0 @@
-* Renesas OS Timer (OSTM)
-
-The OSTM is a multi-channel 32-bit timer/counter with fixed clock
-source that can operate in either interval count down timer or free-running
-compare match mode.
-
-Channels are independent from each other.
-
-Required Properties:
-
-  - compatible: must be one or more of the following:
-    - "renesas,r7s72100-ostm" for the R7S72100 (RZ/A1) OSTM
-    - "renesas,r7s9210-ostm" for the R7S9210 (RZ/A2) OSTM
-    - "renesas,ostm" for any OSTM
-		This is a fallback for the above renesas,*-ostm entries
-
-  - reg: base address and length of the register block for a timer channel.
-
-  - interrupts: interrupt specifier for the timer channel.
-
-  - clocks: clock specifier for the timer channel.
-
-Example: R7S72100 (RZ/A1H) OSTM node
-
-	ostm0: timer@fcfec000 {
-		compatible = "renesas,r7s72100-ostm", "renesas,ostm";
-		reg = <0xfcfec000 0x30>;
-		interrupts = <GIC_SPI 102 IRQ_TYPE_EDGE_RISING>;
-		clocks = <&mstp5_clks R7S72100_CLK_OSTM0>;
-		power-domains = <&cpg_clocks>;
-	};
diff --git a/Documentation/devicetree/bindings/timer/renesas,ostm.yaml b/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
new file mode 100644
index 0000000000000000..600d47ab7d58570f
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/renesas,ostm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas OS Timer (OSTM)
+
+maintainers:
+  - Chris Brandt <chris.brandt@renesas.com>
+  - Geert Uytterhoeven <geert+renesas@glider.be>
+
+description:
+  The OSTM is a multi-channel 32-bit timer/counter with fixed clock source that
+  can operate in either interval count down timer or free-running compare match
+  mode.
+
+  Channels are independent from each other.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - renesas,r7s72100-ostm # RZ/A1H
+          - renesas,r7s9210-ostm  # RZ/A2M
+      - const: renesas,ostm       # Generic
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r7s72100-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    ostm0: timer@fcfec000 {
+            compatible = "renesas,r7s72100-ostm", "renesas,ostm";
+            reg = <0xfcfec000 0x30>;
+            interrupts = <GIC_SPI 102 IRQ_TYPE_EDGE_RISING>;
+            clocks = <&mstp5_clks R7S72100_CLK_OSTM0>;
+            power-domains = <&cpg_clocks>;
+    };
-- 
2.17.1

