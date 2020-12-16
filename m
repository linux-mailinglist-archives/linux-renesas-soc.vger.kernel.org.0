Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59A9E2DC281
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 16 Dec 2020 15:53:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726485AbgLPOxS (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 16 Dec 2020 09:53:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725913AbgLPOxS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 16 Dec 2020 09:53:18 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17346C0617A6
        for <linux-renesas-soc@vger.kernel.org>; Wed, 16 Dec 2020 06:52:37 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by baptiste.telenet-ops.be with bizsmtp
        id 52sa240094C55Sk012sa3M; Wed, 16 Dec 2020 15:52:34 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kpYAL-00BCBr-UG; Wed, 16 Dec 2020 15:52:33 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kpYAL-005djI-4Z; Wed, 16 Dec 2020 15:52:33 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Luca Ceresoli <luca@lucaceresoli.net>,
        Adam Ford <aford173@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: clk: versaclock5: Miscellaneous fixes and improvements:
Date:   Wed, 16 Dec 2020 15:52:31 +0100
Message-Id: <20201216145231.1344317-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

  - Add reference to clock.yaml, and switch to unevaluatedProperties, to
    stop complaining about the presence of "assigned-clock-rates" and
    "assigned-clocks" in board DTS files,
  - Fix typo in "idt,voltage-microvolts" property name, to match example
    and driver code,
  - Add missing reference for "idt,voltage-microvolts",
  - Add missing "additionalProperties: false" for subnodes, to catch
    typos in properties,
  - There is no reason to wrap the (single) if condition in an allOf
    block,
  - Fix obsolete property names in example.

Fixes: 45c940184b501fc6 ("dt-bindings: clk: versaclock5: convert to yaml")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Notes:
  1. The use of "idt,voltage-microvolts" (with trailing S) is a bit
     unfortunate, as Documentation/devicetree/bindings/property-units.txt
     suggests to not have the trailing edge.
     Can we still fix the driver and bindings?  While this entered
     uptstream in v5.9, there are no users in next-20201216.

  2. Due to "clock-output-names" being part of
     dt-schema/schemas/clock/clock.yaml, the presence of this property
     does not trigger an error.  Adding "clock-output-names: false"
     can fix that.  But given this property is deprecated, except for
     very specific use cases, explicitly allowing it for those few use
     cases would be better.
---
 .../bindings/clock/idt,versaclock5.yaml       | 53 ++++++++++---------
 1 file changed, 29 insertions(+), 24 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
index 2ac1131fd9222a86..14851e76f6342095 100644
--- a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
+++ b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
@@ -33,6 +33,9 @@ description: |
 maintainers:
   - Luca Ceresoli <luca@lucaceresoli.net>
 
+allOf:
+  - $ref: clock.yaml#
+
 properties:
   compatible:
     enum:
@@ -73,40 +76,42 @@ patternProperties:
         $ref: /schemas/types.yaml#/definitions/uint32
         minimum: 0
         maximum: 6
-      idt,voltage-microvolt:
+      idt,voltage-microvolts:
         description: The output drive voltage.
+        $ref: /schemas/types.yaml#/definitions/uint32
         enum: [ 1800000, 2500000, 3300000 ]
       idt,slew-percent:
         description: The Slew rate control for CMOS single-ended.
         $ref: /schemas/types.yaml#/definitions/uint32
         enum: [ 80, 85, 90, 100 ]
 
+    additionalProperties: false
+
 required:
   - compatible
   - reg
   - '#clock-cells'
 
-allOf:
-  - if:
-      properties:
-        compatible:
-          enum:
-            - idt,5p49v5933
-            - idt,5p49v5935
-    then:
-      # Devices with builtin crystal + optional external input
-      properties:
-        clock-names:
-          const: clkin
-        clocks:
-          maxItems: 1
-    else:
-      # Devices without builtin crystal
-      required:
-        - clock-names
-        - clocks
-
-additionalProperties: false
+if:
+  properties:
+    compatible:
+      enum:
+        - idt,5p49v5933
+        - idt,5p49v5935
+then:
+  # Devices with builtin crystal + optional external input
+  properties:
+    clock-names:
+      const: clkin
+    clocks:
+      maxItems: 1
+else:
+  # Devices without builtin crystal
+  required:
+    - clock-names
+    - clocks
+
+unevaluatedProperties: false
 
 examples:
   - |
@@ -135,13 +140,13 @@ examples:
             clock-names = "xin";
 
             OUT1 {
-                idt,drive-mode = <VC5_CMOSD>;
+                idt,mode = <VC5_CMOSD>;
                 idt,voltage-microvolts = <1800000>;
                 idt,slew-percent = <80>;
             };
 
             OUT4 {
-                idt,drive-mode = <VC5_LVDS>;
+                idt,mode = <VC5_LVDS>;
             };
         };
     };
-- 
2.25.1

