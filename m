Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C02893E05A2
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Aug 2021 18:13:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234236AbhHDQNv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Aug 2021 12:13:51 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:61085 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231129AbhHDQNv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Aug 2021 12:13:51 -0400
X-IronPort-AV: E=Sophos;i="5.84,294,1620658800"; 
   d="scan'208";a="89812757"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 05 Aug 2021 01:13:37 +0900
Received: from localhost.localdomain (unknown [10.226.92.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 570F04010906;
        Thu,  5 Aug 2021 01:13:35 +0900 (JST)
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
Subject: [PATCH v3 2/2] dt-bindings: mmc: renesas,sdhi: Document RZ/G2L bindings
Date:   Wed,  4 Aug 2021 17:13:25 +0100
Message-Id: <20210804161325.26996-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210804161325.26996-1-biju.das.jz@bp.renesas.com>
References: <20210804161325.26996-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document RZ/G2L SDHI controller bindings.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
 * This patch depends up on the previous patch in this series.
v1->v2:
 * Fixed dtbs-check issue for RZ/A{1,2} platforms.
---
 .../devicetree/bindings/mmc/renesas,sdhi.yaml | 54 +++++++++++++------
 1 file changed, 37 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
index 543eeb825dc3..e195ee5c0900 100644
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
@@ -68,13 +69,11 @@ properties:
 
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
@@ -135,6 +134,8 @@ allOf:
               - renesas,sdhi-r7s9210
     then:
       properties:
+        clocks:
+          maxItems: 2
         clock-names:
           items:
             - const: core
@@ -146,6 +147,25 @@ allOf:
         sectioned off to be run by a separate second clock source to allow
         the main core clock to be turned off to save power.
 
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
+
 required:
   - compatible
   - reg
-- 
2.17.1

