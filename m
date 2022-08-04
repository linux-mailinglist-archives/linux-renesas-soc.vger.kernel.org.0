Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 471EF58A126
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Aug 2022 21:22:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237219AbiHDTWq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 4 Aug 2022 15:22:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234352AbiHDTWq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Aug 2022 15:22:46 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 079DC37FA9;
        Thu,  4 Aug 2022 12:22:44 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.93,216,1654527600"; 
   d="scan'208";a="128538893"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 05 Aug 2022 04:22:44 +0900
Received: from localhost.localdomain (unknown [10.226.92.63])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5E744408FB8D;
        Fri,  5 Aug 2022 04:22:41 +0900 (JST)
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
Subject: [PATCH v3 1/2] dt-bindings: usb: renesas, usb3-peri: Document RZ/V2M r9a09g011 support
Date:   Thu,  4 Aug 2022 20:22:19 +0100
Message-Id: <20220804192220.128601-2-phil.edworthy@renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220804192220.128601-1-phil.edworthy@renesas.com>
References: <20220804192220.128601-1-phil.edworthy@renesas.com>
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
v3:
 - Keep the existing constraints by adding an 'else' clause with
   'maxItems: 1' for various properties.
v2:
 - SoCs other than rz/v2m must limit the number of clock/interrupt names
 - Add "Battery Charging" and "Global Purpose Input" interrupts
---
 .../bindings/usb/renesas,usb3-peri.yaml       | 99 ++++++++++++++++---
 1 file changed, 84 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml b/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml
index 9fcf54b10b07..55dfd121b555 100644
--- a/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml
+++ b/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml
@@ -11,27 +11,55 @@ maintainers:
 
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
+      - description: Battery Charging
+      - description: Global Purpose Input
+
+  interrupt-names:
+    minItems: 1
+    items:
+      - const: all_p
+      - const: drd
+      - const: bc
+      - const: gpi
 
   clocks:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: Main clock
+      - description: Register access clock
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: aclk
+      - const: reg
 
   phys:
     maxItems: 1
@@ -43,7 +71,15 @@ properties:
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
@@ -78,6 +114,39 @@ required:
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
+        clock-names:
+          minItems: 2
+        interrupts:
+          minItems: 4
+        interrupt-names:
+          minItems: 4
+        resets:
+          minItems: 2
+      required:
+        - clock-names
+        - interrupt-names
+        - resets
+        - reset-names
+    else:
+      properties:
+        clocks:
+          maxItems: 1
+        interrupts:
+          maxItems: 1
+        resets:
+          maxItems: 1
+
 additionalProperties: false
 
 examples:
-- 
2.34.1

