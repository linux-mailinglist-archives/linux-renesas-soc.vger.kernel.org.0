Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E0534676C8
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  3 Dec 2021 12:52:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380589AbhLCLzf (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 3 Dec 2021 06:55:35 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:36104 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231944AbhLCLzd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 3 Dec 2021 06:55:33 -0500
X-IronPort-AV: E=Sophos;i="5.87,284,1631545200"; 
   d="scan'208";a="102706790"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 03 Dec 2021 20:52:09 +0900
Received: from localhost.localdomain (unknown [10.226.93.66])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 598574016D6F;
        Fri,  3 Dec 2021 20:52:07 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 4/6] dt-bindings: gpu: mali-bifrost: Document RZ/G2L support
Date:   Fri,  3 Dec 2021 11:51:52 +0000
Message-Id: <20211203115154.31864-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211203115154.31864-1-biju.das.jz@bp.renesas.com>
References: <20211203115154.31864-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The Renesas RZ/G2{L, LC} SoC (a.k.a R9A07G044) has a Bifrost Mali-G31 GPU,
add a compatible string for it.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../bindings/gpu/arm,mali-bifrost.yaml        | 32 +++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 6f98dd55fb4c..c9fac2498f5e 100644
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
@@ -27,19 +28,30 @@ properties:
     maxItems: 1
 
   interrupts:
+    minItems: 3
     items:
       - description: Job interrupt
       - description: MMU interrupt
       - description: GPU interrupt
+      - description: EVENT interrupt
 
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
+  clock-names:
+    items:
+      - const: gpu
+      - const: bus
+      - const: bus_ace
 
   mali-supply: true
 
@@ -52,7 +64,8 @@ properties:
     maxItems: 3
 
   resets:
-    maxItems: 2
+    minItems: 1
+    maxItems: 3
 
   "#cooling-cells":
     const: 2
@@ -113,6 +126,21 @@ allOf:
         - sram-supply
         - power-domains
         - power-domain-names
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a07g044-mali
+    then:
+      properties:
+        interrupt-names:
+          minItems: 4
+        clock-names:
+          minItems: 3
+      required:
+        - clock-names
+        - power-domains
+        - resets
     else:
       properties:
         power-domains:
-- 
2.17.1

