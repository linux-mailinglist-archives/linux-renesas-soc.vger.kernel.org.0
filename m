Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A0A316A7A2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Feb 2020 14:51:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727648AbgBXNvg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Feb 2020 08:51:36 -0500
Received: from andre.telenet-ops.be ([195.130.132.53]:56670 "EHLO
        andre.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727090AbgBXNvf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Feb 2020 08:51:35 -0500
Received: from ramsan ([84.195.182.253])
        by andre.telenet-ops.be with bizsmtp
        id 6drX2200A5USYZQ01drXQ6; Mon, 24 Feb 2020 14:51:31 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j6E8x-00052L-7F; Mon, 24 Feb 2020 14:51:31 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j6E8x-0008Il-56; Mon, 24 Feb 2020 14:51:31 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] dt-bindings: reset: rcar-rst: Convert to json-schema
Date:   Mon, 24 Feb 2020 14:51:29 +0100
Message-Id: <20200224135129.31870-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Convert the Renesas R-Car Reset Controller Device Tree binding
documentation to json-schema.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
v2:
  - Add Reviewed-by,
  - Drop "DT bindings for the" from title.
---
 .../devicetree/bindings/reset/renesas,rst.txt | 48 ---------------
 .../bindings/reset/renesas,rst.yaml           | 61 +++++++++++++++++++
 2 files changed, 61 insertions(+), 48 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/reset/renesas,rst.txt
 create mode 100644 Documentation/devicetree/bindings/reset/renesas,rst.yaml

diff --git a/Documentation/devicetree/bindings/reset/renesas,rst.txt b/Documentation/devicetree/bindings/reset/renesas,rst.txt
deleted file mode 100644
index de7f06ccd003da9f..0000000000000000
--- a/Documentation/devicetree/bindings/reset/renesas,rst.txt
+++ /dev/null
@@ -1,48 +0,0 @@
-DT bindings for the Renesas R-Car and RZ/G Reset Controllers
-
-The R-Car and RZ/G Reset Controllers provide reset control, and implement the
-following functions:
-  - Latching of the levels on mode pins when PRESET# is negated,
-  - Mode monitoring register,
-  - Reset control of peripheral devices (on R-Car Gen1),
-  - Watchdog timer (on R-Car Gen1),
-  - Register-based reset control and boot address registers for the various CPU
-    cores (on R-Car Gen2 and Gen3, and on RZ/G).
-
-
-Required properties:
-  - compatible: Should be
-		  - "renesas,<soctype>-reset-wdt" for R-Car Gen1,
-		  - "renesas,<soctype>-rst" for R-Car Gen2 and Gen3, and RZ/G
-		Examples with soctypes are:
-		  - "renesas,r8a7743-rst" (RZ/G1M)
-		  - "renesas,r8a7744-rst" (RZ/G1N)
-		  - "renesas,r8a7745-rst" (RZ/G1E)
-		  - "renesas,r8a77470-rst" (RZ/G1C)
-		  - "renesas,r8a774a1-rst" (RZ/G2M)
-		  - "renesas,r8a774b1-rst" (RZ/G2N)
-		  - "renesas,r8a774c0-rst" (RZ/G2E)
-		  - "renesas,r8a7778-reset-wdt" (R-Car M1A)
-		  - "renesas,r8a7779-reset-wdt" (R-Car H1)
-		  - "renesas,r8a7790-rst" (R-Car H2)
-		  - "renesas,r8a7791-rst" (R-Car M2-W)
-		  - "renesas,r8a7792-rst" (R-Car V2H
-		  - "renesas,r8a7793-rst" (R-Car M2-N)
-		  - "renesas,r8a7794-rst" (R-Car E2)
-		  - "renesas,r8a7795-rst" (R-Car H3)
-		  - "renesas,r8a7796-rst" (R-Car M3-W)
-		  - "renesas,r8a77961-rst" (R-Car M3-W+)
-		  - "renesas,r8a77965-rst" (R-Car M3-N)
-		  - "renesas,r8a77970-rst" (R-Car V3M)
-		  - "renesas,r8a77980-rst" (R-Car V3H)
-		  - "renesas,r8a77990-rst" (R-Car E3)
-		  - "renesas,r8a77995-rst" (R-Car D3)
-  - reg: Address start and address range for the device.
-
-
-Example:
-
-	rst: reset-controller@e6160000 {
-		compatible = "renesas,r8a7795-rst";
-		reg = <0 0xe6160000 0 0x0200>;
-	};
diff --git a/Documentation/devicetree/bindings/reset/renesas,rst.yaml b/Documentation/devicetree/bindings/reset/renesas,rst.yaml
new file mode 100644
index 0000000000000000..f329d3e0ce8825dc
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/renesas,rst.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/reset/renesas,rst.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Renesas R-Car and RZ/G Reset Controller
+
+maintainers:
+  - Geert Uytterhoeven <geert+renesas@glider.be>
+  - Magnus Damm <magnus.damm@gmail.com>
+
+description: |
+  The R-Car and RZ/G Reset Controllers provide reset control, and implement the
+  following functions:
+    - Latching of the levels on mode pins when PRESET# is negated,
+    - Mode monitoring register,
+    - Reset control of peripheral devices (on R-Car Gen1),
+    - Watchdog timer (on R-Car Gen1),
+    - Register-based reset control and boot address registers for the various
+      CPU cores (on R-Car Gen2 and Gen3, and on RZ/G).
+
+properties:
+  compatible:
+    enum:
+      - renesas,r8a7743-rst       # RZ/G1M
+      - renesas,r8a7744-rst       # RZ/G1N
+      - renesas,r8a7745-rst       # RZ/G1E
+      - renesas,r8a77470-rst      # RZ/G1C
+      - renesas,r8a774a1-rst      # RZ/G2M
+      - renesas,r8a774b1-rst      # RZ/G2N
+      - renesas,r8a774c0-rst      # RZ/G2E
+      - renesas,r8a7778-reset-wdt # R-Car M1A
+      - renesas,r8a7779-reset-wdt # R-Car H1
+      - renesas,r8a7790-rst       # R-Car H2
+      - renesas,r8a7791-rst       # R-Car M2-W
+      - renesas,r8a7792-rst       # R-Car V2H
+      - renesas,r8a7793-rst       # R-Car M2-N
+      - renesas,r8a7794-rst       # R-Car E2
+      - renesas,r8a7795-rst       # R-Car H3
+      - renesas,r8a7796-rst       # R-Car M3-W
+      - renesas,r8a77961-rst      # R-Car M3-W+
+      - renesas,r8a77965-rst      # R-Car M3-N
+      - renesas,r8a77970-rst      # R-Car V3M
+      - renesas,r8a77980-rst      # R-Car V3H
+      - renesas,r8a77990-rst      # R-Car E3
+      - renesas,r8a77995-rst      # R-Car D3
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    rst: reset-controller@e6160000 {
+            compatible = "renesas,r8a7795-rst";
+            reg = <0xe6160000 0x0200>;
+    };
-- 
2.17.1

