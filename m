Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2AB23578417
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 18 Jul 2022 15:45:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235133AbiGRNpU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 18 Jul 2022 09:45:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235152AbiGRNpS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Jul 2022 09:45:18 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 09CA4DFD0;
        Mon, 18 Jul 2022 06:45:16 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.92,281,1650898800"; 
   d="scan'208";a="128236357"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 18 Jul 2022 22:45:16 +0900
Received: from localhost.localdomain (unknown [10.226.92.65])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 5C7F34003EB6;
        Mon, 18 Jul 2022 22:45:13 +0900 (JST)
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH 1/2] dt-bindings: usb: renesas, usb3-peri: Document RZ/V2M r9a09g011 support
Date:   Mon, 18 Jul 2022 14:44:57 +0100
Message-Id: <20220718134458.19137-2-phil.edworthy@renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220718134458.19137-1-phil.edworthy@renesas.com>
References: <20220718134458.19137-1-phil.edworthy@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document the RZ/V2M SoC bindings.
The RZ/V2M SoC is a little different to the R-Car implementations.
A few DRD related registers and bits have moved, there is a separate
interrupt for DRD, an additional clock for register access and reset
lines for DRD and USBP.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../bindings/usb/renesas,usb3-peri.yaml       | 81 +++++++++++++++----
 1 file changed, 66 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml b/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml
index 9fcf54b10b07..28f785dd2012 100644
--- a/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml
+++ b/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml
@@ -11,27 +11,49 @@ maintainers:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - renesas,r8a774a1-usb3-peri # RZ/G2M
-          - renesas,r8a774b1-usb3-peri # RZ/G2N
-          - renesas,r8a774c0-usb3-peri # RZ/G2E
-          - renesas,r8a774e1-usb3-peri # RZ/G2H
-          - renesas,r8a7795-usb3-peri  # R-Car H3
-          - renesas,r8a7796-usb3-peri  # R-Car M3-W
-          - renesas,r8a77961-usb3-peri # R-Car M3-W+
-          - renesas,r8a77965-usb3-peri # R-Car M3-N
-          - renesas,r8a77990-usb3-peri # R-Car E3
-      - const: renesas,rcar-gen3-usb3-peri
+    oneOf:
+      - items:
+          - enum:
+              - renesas,r8a774a1-usb3-peri # RZ/G2M
+              - renesas,r8a774b1-usb3-peri # RZ/G2N
+              - renesas,r8a774c0-usb3-peri # RZ/G2E
+              - renesas,r8a774e1-usb3-peri # RZ/G2H
+              - renesas,r8a7795-usb3-peri  # R-Car H3
+              - renesas,r8a7796-usb3-peri  # R-Car M3-W
+              - renesas,r8a77961-usb3-peri # R-Car M3-W+
+              - renesas,r8a77965-usb3-peri # R-Car M3-N
+              - renesas,r8a77990-usb3-peri # R-Car E3
+          - const: renesas,rcar-gen3-usb3-peri
+
+      - items:
+          - enum:
+              - renesas,r9a09g011-usb3-peri # RZ/V2M
+          - const: renesas,rzv2m-usb3-peri
 
   reg:
     maxItems: 1
 
   interrupts:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: Combined interrupt for DMA, SYS and ERR
+      - description: Dual Role Device (DRD)
+
+  interrupt-names:
+    items:
+      - const: all_p
+      - const: drd
 
   clocks:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: Main clock
+      - description: Register access clock
+
+  clock-names:
+    items:
+      - const: aclk
+      - const: reg
 
   phys:
     maxItems: 1
@@ -43,7 +65,15 @@ properties:
     maxItems: 1
 
   resets:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: Peripheral reset
+      - description: DRD reset
+
+  reset-names:
+    items:
+      - const: aresetn_p
+      - const: drd_reset
 
   usb-role-switch:
     $ref: /schemas/types.yaml#/definitions/flag
@@ -78,6 +108,27 @@ required:
   - interrupts
   - clocks
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,rzv2m-usb3-peri
+    then:
+      properties:
+        clocks:
+          minItems: 2
+        interrupts:
+          minItems: 2
+        resets:
+          minItems: 2
+      required:
+        - clock-names
+        - interrupt-names
+        - resets
+        - reset-names
+
 additionalProperties: false
 
 examples:
-- 
2.34.1

