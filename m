Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DD531D91B4
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 19 May 2020 10:08:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728455AbgESIIQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 19 May 2020 04:08:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728260AbgESIIQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 May 2020 04:08:16 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DACB6C061A0C
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 May 2020 01:08:15 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:918e:b928:22c1:d715])
        by xavier.telenet-ops.be with bizsmtp
        id gY8D2200P4CPMDc01Y8DZR; Tue, 19 May 2020 10:08:13 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jaxIL-0000ef-Fw; Tue, 19 May 2020 10:08:13 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jaxIL-0007SY-EZ; Tue, 19 May 2020 10:08:13 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: memory-controllers: renesas,dbsc: Convert to json-schema
Date:   Tue, 19 May 2020 10:08:12 +0200
Message-Id: <20200519080812.28632-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Convert the Renesas DDR Bus Controller Device Tree binding documentation
to json-schema.

Drop referrals to driver behavior.
Make power-domains required, as it is present for all current users.
Update the example to match reality.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../memory-controllers/renesas,dbsc.txt       | 44 ---------------
 .../memory-controllers/renesas,dbsc.yaml      | 56 +++++++++++++++++++
 2 files changed, 56 insertions(+), 44 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/memory-controllers/renesas,dbsc.txt
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/renesas,dbsc.yaml

diff --git a/Documentation/devicetree/bindings/memory-controllers/renesas,dbsc.txt b/Documentation/devicetree/bindings/memory-controllers/renesas,dbsc.txt
deleted file mode 100644
index 9f78e6c82740cc89..0000000000000000
--- a/Documentation/devicetree/bindings/memory-controllers/renesas,dbsc.txt
+++ /dev/null
@@ -1,44 +0,0 @@
-DT bindings for Renesas R-Mobile and SH-Mobile memory controllers
-=================================================================
-
-Renesas R-Mobile and SH-Mobile SoCs contain one or more memory controllers.
-These memory controllers differ from one SoC variant to another, and are called
-by different names ("DDR Bus Controller (DBSC)", "DDR3 Bus State Controller
-(DBSC3)", "SDRAM Bus State Controller (SBSC)").
-
-Currently memory controller device nodes are used only to reference PM
-domains, and prevent these PM domains from being powered down, which would
-crash the system.
-
-As there exist no actual drivers for these controllers yet, these bindings
-should be considered EXPERIMENTAL for now.
-
-Required properties:
-  - compatible: Must be one of the following SoC-specific values:
-		  - "renesas,dbsc-r8a73a4" (R-Mobile APE6)
-		  - "renesas,dbsc3-r8a7740" (R-Mobile A1)
-		  - "renesas,sbsc-sh73a0" (SH-Mobile AG5)
-  - reg: Must contain the base address and length of the memory controller's
-	 registers.
-
-Optional properties:
-  - interrupts: Must contain a list of interrupt specifiers for memory
-		controller interrupts, if available.
-  - interrupt-names: Must contain a list of interrupt names corresponding to
-		     the interrupts in the interrupts property, if available.
-		     Valid interrupt names are:
-			- "sec" (secure interrupt)
-			- "temp" (normal (temperature) interrupt)
-  - power-domains: Must contain a reference to the PM domain that the memory
-		   controller belongs to, if available.
-
-Example:
-
-	sbsc1: memory-controller@fe400000 {
-		compatible = "renesas,sbsc-sh73a0";
-		reg = <0xfe400000 0x400>;
-		interrupts = <0 35 IRQ_TYPE_LEVEL_HIGH>,
-			     <0 36 IRQ_TYPE_LEVEL_HIGH>;
-		interrupt-names = "sec", "temp";
-		power-domains = <&pd_a4bc0>;
-	};
diff --git a/Documentation/devicetree/bindings/memory-controllers/renesas,dbsc.yaml b/Documentation/devicetree/bindings/memory-controllers/renesas,dbsc.yaml
new file mode 100644
index 0000000000000000..7056ccb7eb304cce
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/renesas,dbsc.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/memory-controllers/renesas,dbsc.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Renesas DDR Bus Controllers
+
+maintainers:
+  - Geert Uytterhoeven <geert+renesas@glider.be>
+
+description: |
+  Renesas SoCs contain one or more memory controllers.  These memory
+  controllers differ from one SoC variant to another, and are called by
+  different names, e.g. "DDR Bus Controller (DBSC)", "DDR3 Bus State Controller
+  (DBSC3)", or "SDRAM Bus State Controller (SBSC)").
+
+properties:
+  compatible:
+    enum:
+      - renesas,dbsc-r8a73a4  # R-Mobile APE6
+      - renesas,dbsc3-r8a7740 # R-Mobile A1
+      - renesas,sbsc-sh73a0   # SH-Mobile AG5
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 2
+
+  interrupt-names:
+    items:
+      - const: sec  # secure interrupt
+      - const: temp # normal (temperature) interrupt
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    sbsc1: memory-controller@fe400000 {
+            compatible = "renesas,sbsc-sh73a0";
+            reg = <0xfe400000 0x400>;
+            interrupts = <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "sec", "temp";
+            power-domains = <&pd_a4bc0>;
+    };
-- 
2.17.1

