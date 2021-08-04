Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB41F3DFBFF
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Aug 2021 09:23:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235799AbhHDHXZ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Aug 2021 03:23:25 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:8657 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S235736AbhHDHXY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Aug 2021 03:23:24 -0400
X-IronPort-AV: E=Sophos;i="5.84,293,1620658800"; 
   d="scan'208";a="89787602"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 04 Aug 2021 16:23:11 +0900
Received: from localhost.localdomain (unknown [10.226.92.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id E29704010902;
        Wed,  4 Aug 2021 16:23:07 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] dt-bindings: mmc: renesas,sdhi: Document RZ/G2L bindings
Date:   Wed,  4 Aug 2021 08:23:05 +0100
Message-Id: <20210804072305.20932-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document RZ/G2L SDHI controller bindings.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../devicetree/bindings/mmc/renesas,sdhi.yaml | 97 ++++++++++++-------
 1 file changed, 62 insertions(+), 35 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
index 677989bc5924..ed05e49d61af 100644
--- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
+++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
@@ -9,9 +9,6 @@ title: Renesas SDHI SD/MMC controller
 maintainers:
   - Wolfram Sang <wsa+renesas@sang-engineering.com>
 
-allOf:
-  - $ref: "mmc-controller.yaml"
-
 properties:
   compatible:
     oneOf:
@@ -47,19 +44,20 @@ properties:
           - const: renesas,sdhi-mmc-r8a77470 # RZ/G1C (SDHI/MMC IP)
       - items:
           - enum:
-              - renesas,sdhi-r8a774a1 # RZ/G2M
-              - renesas,sdhi-r8a774b1 # RZ/G2N
-              - renesas,sdhi-r8a774c0 # RZ/G2E
-              - renesas,sdhi-r8a774e1 # RZ/G2H
-              - renesas,sdhi-r8a7795  # R-Car H3
-              - renesas,sdhi-r8a7796  # R-Car M3-W
-              - renesas,sdhi-r8a77961 # R-Car M3-W+
-              - renesas,sdhi-r8a77965 # R-Car M3-N
-              - renesas,sdhi-r8a77970 # R-Car V3M
-              - renesas,sdhi-r8a77980 # R-Car V3H
-              - renesas,sdhi-r8a77990 # R-Car E3
-              - renesas,sdhi-r8a77995 # R-Car D3
-              - renesas,sdhi-r8a779a0 # R-Car V3U
+              - renesas,sdhi-r8a774a1  # RZ/G2M
+              - renesas,sdhi-r8a774b1  # RZ/G2N
+              - renesas,sdhi-r8a774c0  # RZ/G2E
+              - renesas,sdhi-r8a774e1  # RZ/G2H
+              - renesas,sdhi-r8a7795   # R-Car H3
+              - renesas,sdhi-r8a7796   # R-Car M3-W
+              - renesas,sdhi-r8a77961  # R-Car M3-W+
+              - renesas,sdhi-r8a77965  # R-Car M3-N
+              - renesas,sdhi-r8a77970  # R-Car V3M
+              - renesas,sdhi-r8a77980  # R-Car V3H
+              - renesas,sdhi-r8a77990  # R-Car E3
+              - renesas,sdhi-r8a77995  # R-Car D3
+              - renesas,sdhi-r8a779a0  # R-Car V3U
+              - renesas,sdhi-r9a07g044 # RZ/G2{L,LC}
           - const: renesas,rcar-gen3-sdhi # R-Car Gen3 or RZ/G2
 
   reg:
@@ -71,13 +69,11 @@ properties:
 
   clocks:
     minItems: 1
-    maxItems: 2
+    maxItems: 4
 
   clock-names:
     minItems: 1
-    items:
-      - const: core
-      - const: cd
+    maxItems: 4
 
   dmas:
     minItems: 4
@@ -112,6 +108,52 @@ properties:
 
   max-frequency: true
 
+allOf:
+  - $ref: "mmc-controller.yaml"
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,sdhi-r7s72100
+              - renesas,sdhi-r7s9210
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: core
+            - const: cd
+      required:
+        - clock-names
+      description:
+        The internal card detection logic that exists in these controllers is
+        sectioned off to be run by a separate second clock source to allow
+        the main core clock to be turned off to save power.
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,sdhi-r9a07g044
+    then:
+      properties:
+        clocks:
+          items:
+            - description: IMCLK, SDHI channel main clock1.
+            - description: IMCLK2, SDHI channel main clock2. When this clock is
+                           turned off, external SD card detection cannot be
+                           detected.
+            - description: CLK_HS, SDHI channel High speed clock which operates
+                           4 times that of SDHI channel main clock1.
+            - description: ACLK, SDHI channel bus clock.
+      required:
+        - resets
+    else:
+      properties:
+        clocks:
+          maxItems: 1
+
 required:
   - compatible
   - reg
@@ -119,21 +161,6 @@ required:
   - clocks
   - power-domains
 
-if:
-  properties:
-    compatible:
-      contains:
-        enum:
-          - renesas,sdhi-r7s72100
-          - renesas,sdhi-r7s9210
-then:
-  required:
-    - clock-names
-  description:
-    The internal card detection logic that exists in these controllers is
-    sectioned off to be run by a separate second clock source to allow
-    the main core clock to be turned off to save power.
-
 unevaluatedProperties: false
 
 examples:
-- 
2.17.1

