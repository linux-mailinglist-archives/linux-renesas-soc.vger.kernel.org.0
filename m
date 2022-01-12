Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4966E48CA3D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 12 Jan 2022 18:47:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355947AbiALRrW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 12 Jan 2022 12:47:22 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:62349 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1355949AbiALRrE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 12 Jan 2022 12:47:04 -0500
X-IronPort-AV: E=Sophos;i="5.88,282,1635174000"; 
   d="scan'208";a="106824743"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 13 Jan 2022 02:47:03 +0900
Received: from localhost.localdomain (unknown [10.226.92.38])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 8BEC74000A94;
        Thu, 13 Jan 2022 02:47:00 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC 17/28] dt-bindings: display: renesas,du: Document r9a07g044l bindings
Date:   Wed, 12 Jan 2022 17:46:01 +0000
Message-Id: <20220112174612.10773-18-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
References: <20220112174612.10773-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Extend the Renesas DU display bindings to support the r9a07g044l RZ/G2L.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../bindings/display/renesas,du.yaml          | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/renesas,du.yaml b/Documentation/devicetree/bindings/display/renesas,du.yaml
index 13efea574584..fc050b1088f3 100644
--- a/Documentation/devicetree/bindings/display/renesas,du.yaml
+++ b/Documentation/devicetree/bindings/display/renesas,du.yaml
@@ -40,6 +40,7 @@ properties:
       - renesas,du-r8a77990 # for R-Car E3 compatible DU
       - renesas,du-r8a77995 # for R-Car D3 compatible DU
       - renesas,du-r8a779a0 # for R-Car V3U compatible DU
+      - renesas,du-r9a07g044l # for RZ/G2L compatible DU
 
   reg:
     maxItems: 1
@@ -824,6 +825,59 @@ allOf:
         - reset-names
         - renesas,vsps
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,du-r9a07g044l
+    then:
+      properties:
+        clocks:
+          items:
+            - description: LCDC Main clock
+            - description: LCDC Register Access Clock
+            - description: LCDC Video Clock
+
+        clock-names:
+          items:
+            - const: du.0
+            - const: pclk
+            - const: vclk
+
+        interrupts:
+          maxItems: 1
+
+        resets:
+          maxItems: 1
+
+        reset-names:
+          items:
+            - const: du.0
+
+        ports:
+          properties:
+            port@0:
+              description: DPAD 0
+            port@1:
+              description: DSI 0
+            port@2: false
+            port@3: false
+
+          required:
+            - port@0
+            - port@1
+
+        renesas,vsps:
+          minItems: 1
+
+      required:
+        - clock-names
+        - interrupts
+        - resets
+        - reset-names
+        - renesas,vsps
+
 additionalProperties: false
 
 examples:
-- 
2.17.1

