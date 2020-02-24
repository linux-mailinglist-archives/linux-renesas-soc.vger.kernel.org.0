Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3505116A7AB
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2020 14:52:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727451AbgBXNw4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Feb 2020 08:52:56 -0500
Received: from xavier.telenet-ops.be ([195.130.132.52]:56016 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727393AbgBXNwz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Feb 2020 08:52:55 -0500
Received: from ramsan ([84.195.182.253])
        by xavier.telenet-ops.be with bizsmtp
        id 6dst220045USYZQ01dstuL; Mon, 24 Feb 2020 14:52:53 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j6EAH-00055U-7k; Mon, 24 Feb 2020 14:52:53 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j6EAH-0008NO-5R; Mon, 24 Feb 2020 14:52:53 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] dt-bindings: power: apmu: Convert to json-schema
Date:   Mon, 24 Feb 2020 14:52:51 +0100
Message-Id: <20200224135251.32157-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Convert the Renesas Advanced Power Management Unit Device Tree binding
documentation to json-schema.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Drop "DT bindings for the" from title.
---
 .../bindings/power/renesas,apmu.txt           | 35 ------------
 .../bindings/power/renesas,apmu.yaml          | 55 +++++++++++++++++++
 2 files changed, 55 insertions(+), 35 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/power/renesas,apmu.txt
 create mode 100644 Documentation/devicetree/bindings/power/renesas,apmu.yaml

diff --git a/Documentation/devicetree/bindings/power/renesas,apmu.txt b/Documentation/devicetree/bindings/power/renesas,apmu.txt
deleted file mode 100644
index 5f24586c8cf33fcf..0000000000000000
--- a/Documentation/devicetree/bindings/power/renesas,apmu.txt
+++ /dev/null
@@ -1,35 +0,0 @@
-DT bindings for the Renesas Advanced Power Management Unit
-
-Renesas R-Car and RZ/G1 SoCs utilize one or more APMU hardware units
-for CPU core power domain control including SMP boot and CPU Hotplug.
-
-Required properties:
-
-- compatible: Should be "renesas,<soctype>-apmu", "renesas,apmu" as fallback.
-	      Examples with soctypes are:
-		- "renesas,r8a7743-apmu" (RZ/G1M)
-		- "renesas,r8a7744-apmu" (RZ/G1N)
-		- "renesas,r8a7745-apmu" (RZ/G1E)
-		- "renesas,r8a77470-apmu" (RZ/G1C)
-		- "renesas,r8a7790-apmu" (R-Car H2)
-		- "renesas,r8a7791-apmu" (R-Car M2-W)
-		- "renesas,r8a7792-apmu" (R-Car V2H)
-		- "renesas,r8a7793-apmu" (R-Car M2-N)
-		- "renesas,r8a7794-apmu" (R-Car E2)
-
-- reg: Base address and length of the I/O registers used by the APMU.
-
-- cpus: This node contains a list of CPU cores, which should match the order
-  of CPU cores used by the WUPCR and PSTR registers in the Advanced Power
-  Management Unit section of the device's datasheet.
-
-
-Example:
-
-This shows the r8a7791 APMU that can control CPU0 and CPU1.
-
-	apmu@e6152000 {
-		compatible = "renesas,r8a7791-apmu", "renesas,apmu";
-		reg = <0 0xe6152000 0 0x188>;
-		cpus = <&cpu0 &cpu1>;
-	};
diff --git a/Documentation/devicetree/bindings/power/renesas,apmu.yaml b/Documentation/devicetree/bindings/power/renesas,apmu.yaml
new file mode 100644
index 0000000000000000..078b2cb40fe37483
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/renesas,apmu.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/power/renesas,apmu.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Renesas Advanced Power Management Unit
+
+maintainers:
+  - Geert Uytterhoeven <geert+renesas@glider.be>
+  - Magnus Damm <magnus.damm@gmail.com>
+
+description:
+  Renesas R-Car Gen2 and RZ/G1 SoCs utilize one or more APMU hardware units for
+  CPU core power domain control including SMP boot and CPU Hotplug.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - renesas,r8a7743-apmu  # RZ/G1M
+          - renesas,r8a7744-apmu  # RZ/G1N
+          - renesas,r8a7745-apmu  # RZ/G1E
+          - renesas,r8a77470-apmu # RZ/G1C
+          - renesas,r8a7790-apmu  # R-Car H2
+          - renesas,r8a7791-apmu  # R-Car M2-W
+          - renesas,r8a7792-apmu  # R-Car V2H
+          - renesas,r8a7793-apmu  # R-Car M2-N
+          - renesas,r8a7794-apmu  # R-Car E2
+      - const: renesas,apmu
+
+  reg:
+    maxItems: 1
+
+  cpus:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: |
+      Array of phandles pointing to CPU cores, which should match the order of
+      CPU cores used by the WUPCR and PSTR registers in the Advanced Power
+      Management Unit section of the device's datasheet.
+
+required:
+  - compatible
+  - reg
+  - cpus
+
+additionalProperties: false
+
+examples:
+  - |
+    apmu@e6152000 {
+            compatible = "renesas,r8a7791-apmu", "renesas,apmu";
+            reg = <0xe6152000 0x188>;
+            cpus = <&cpu0 &cpu1>;
+    };
-- 
2.17.1

