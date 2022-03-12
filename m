Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2845F4D7125
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 12 Mar 2022 22:54:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231611AbiCLVze (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 12 Mar 2022 16:55:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229796AbiCLVzd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 12 Mar 2022 16:55:33 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A4B5D2A70F;
        Sat, 12 Mar 2022 13:54:27 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.90,177,1643641200"; 
   d="scan'208";a="113308968"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 13 Mar 2022 06:54:27 +0900
Received: from localhost.localdomain (unknown [10.226.92.30])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 9E8214007521;
        Sun, 13 Mar 2022 06:54:24 +0900 (JST)
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
Subject: [PATCH 1/7] dt-bindings: display: renesas,du: Document r9a07g044l bindings
Date:   Sat, 12 Mar 2022 21:54:11 +0000
Message-Id: <20220312215417.8023-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220312215417.8023-1-biju.das.jz@bp.renesas.com>
References: <20220312215417.8023-1-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Extend the Renesas DU display bindings to support the r9a07g044l
RZ/G2L LCDC.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
RFC->v1:
 * Changed  minItems->maxItems for renesas,vsps.
RFC:
 https://patchwork.kernel.org/project/linux-renesas-soc/patch/20220112174612.10773-18-biju.das.jz@bp.renesas.com/
---
 .../bindings/display/renesas,du.yaml          | 54 +++++++++++++++++++
 1 file changed, 54 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/renesas,du.yaml b/Documentation/devicetree/bindings/display/renesas,du.yaml
index 13efea574584..cdd54ea32401 100644
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
+          maxItems: 1
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

