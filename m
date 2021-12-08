Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53DBF46D128
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Dec 2021 11:40:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231795AbhLHKoH (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Dec 2021 05:44:07 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:27339 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229618AbhLHKoH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Dec 2021 05:44:07 -0500
X-IronPort-AV: E=Sophos;i="5.87,297,1631545200"; 
   d="scan'208";a="102799662"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 08 Dec 2021 19:40:35 +0900
Received: from localhost.localdomain (unknown [10.226.92.71])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 974484256394;
        Wed,  8 Dec 2021 19:40:32 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Steven Price <steven.price@arm.com>,
        tomeu.vizoso@collabora.com, Robin Murphy <robin.murphy@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 1/3] dt-bindings: gpu: mali-bifrost: Document RZ/G2L support
Date:   Wed,  8 Dec 2021 10:40:24 +0000
Message-Id: <20211208104026.421-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211208104026.421-1-biju.das.jz@bp.renesas.com>
References: <20211208104026.421-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The Renesas RZ/G2{L, LC} SoC (a.k.a R9A07G044) has a Bifrost Mali-G31 GPU,
add a compatible string for it.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3:
 * Moved optional clock-names and reset-names to SoC-specific conditional schemas.
 * minimum number of reset for the generic GPU is set to 1.
 * Documented number of clocks, resets, interrupts and interrupt-names in RZ/G2L
   SoC-specific conditional schemas.
v1->v2:
 * Updated minItems for resets as 2
 * Documented optional property reset-names
 * Documented reset-names as required property for RZ/G2L SoC.
---
 .../bindings/gpu/arm,mali-bifrost.yaml        | 45 ++++++++++++++++++-
 1 file changed, 43 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 6f98dd55fb4c..63a08f3f321d 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -19,6 +19,7 @@ properties:
           - amlogic,meson-g12a-mali
           - mediatek,mt8183-mali
           - realtek,rtd1619-mali
+          - renesas,r9a07g044-mali
           - rockchip,px30-mali
           - rockchip,rk3568-mali
       - const: arm,mali-bifrost # Mali Bifrost GPU model/revision is fully discoverable
@@ -27,19 +28,26 @@ properties:
     maxItems: 1
 
   interrupts:
+    minItems: 3
     items:
       - description: Job interrupt
       - description: MMU interrupt
       - description: GPU interrupt
+      - description: Event interrupt
 
   interrupt-names:
+    minItems: 3
     items:
       - const: job
       - const: mmu
       - const: gpu
+      - const: event
 
   clocks:
-    maxItems: 1
+    minItems: 1
+    maxItems: 3
+
+  clock-names: true
 
   mali-supply: true
 
@@ -52,7 +60,10 @@ properties:
     maxItems: 3
 
   resets:
-    maxItems: 2
+    minItems: 1
+    maxItems: 3
+
+  reset-names: true
 
   "#cooling-cells":
     const: 2
@@ -94,6 +105,36 @@ allOf:
     then:
       required:
         - resets
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a07g044-mali
+    then:
+      properties:
+        interrupts:
+          minItems: 4
+        interrupt-names:
+          minItems: 4
+        clocks:
+          minItems: 3
+        clock-names:
+          items:
+            - const: gpu
+            - const: bus
+            - const: bus_ace
+        resets:
+          minItems: 3
+        reset-names:
+          items:
+            - const: rst
+            - const: axi_rst
+            - const: ace_rst
+      required:
+        - clock-names
+        - power-domains
+        - resets
+        - reset-names
   - if:
       properties:
         compatible:
-- 
2.17.1

