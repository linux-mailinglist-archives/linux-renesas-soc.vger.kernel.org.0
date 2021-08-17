Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 797D53EE90C
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Aug 2021 11:04:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239151AbhHQJEI (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Aug 2021 05:04:08 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:31411 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S235009AbhHQJD5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Aug 2021 05:03:57 -0400
X-IronPort-AV: E=Sophos;i="5.84,328,1620658800"; 
   d="scan'208";a="90896777"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 17 Aug 2021 18:03:24 +0900
Received: from localhost.localdomain (unknown [10.226.93.29])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id E9506424A1FB;
        Tue, 17 Aug 2021 18:03:21 +0900 (JST)
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
Subject: [PATCH v4 2/2] dt-bindings: mmc: renesas,sdhi: Document RZ/G2L bindings
Date:   Tue, 17 Aug 2021 10:03:13 +0100
Message-Id: <20210817090313.31858-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210817090313.31858-1-biju.das.jz@bp.renesas.com>
References: <20210817090313.31858-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document RZ/G2L SDHI controller bindings.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4:
 * Defined clock-names for RZ/G2L SoC and make it as a required property
v2->v3:
 * split the patch into 2, first one for fixing dtbs-check issue and
   later one for documenting RZ/G2L SDHI bindings.
v1->v2:
 * Fixed dtbs-check issue for RZ/A{1,2} platforms.
---
 .../devicetree/bindings/mmc/renesas,sdhi.yaml | 73 +++++++++++++------
 1 file changed, 52 insertions(+), 21 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
index 43584f4f4c7e..9f1e7092cf44 100644
--- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
+++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
@@ -44,19 +44,20 @@ properties:
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
@@ -66,15 +67,9 @@ properties:
     minItems: 1
     maxItems: 3
 
-  clocks:
-    minItems: 1
-    maxItems: 2
+  clocks: true
 
-  clock-names:
-    minItems: 1
-    items:
-      - const: core
-      - const: cd
+  clock-names: true
 
   dmas:
     minItems: 4
@@ -108,6 +103,42 @@ properties:
 allOf:
   - $ref: "mmc-controller.yaml"
 
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
+        clock-names:
+          items:
+            - const: imclk
+            - const: imclk2
+            - const: clk_hs
+            - const: aclk
+      required:
+        - clock-names
+        - resets
+    else:
+      properties:
+        clocks:
+          minItems: 1
+          maxItems: 2
+        clock-names:
+          minItems: 1
+          items:
+            - const: core
+            - const: cd
+
   - if:
       properties:
         compatible:
-- 
2.17.1

