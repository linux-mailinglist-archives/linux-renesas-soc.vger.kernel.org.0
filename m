Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B240668689
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Jan 2023 23:10:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232583AbjALWJC (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Jan 2023 17:09:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240365AbjALWIe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Jan 2023 17:08:34 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id F4228225;
        Thu, 12 Jan 2023 13:59:16 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.97,212,1669042800"; 
   d="scan'208";a="146137073"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 13 Jan 2023 06:59:16 +0900
Received: from localhost.localdomain (unknown [10.226.92.132])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 20D15400A66D;
        Fri, 13 Jan 2023 06:59:12 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v2 01/12] dt-bindings: usb: renesas,usb-xhci: Document RZ/V2M support
Date:   Thu, 12 Jan 2023 21:58:55 +0000
Message-Id: <20230112215906.494394-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230112215906.494394-1-biju.das.jz@bp.renesas.com>
References: <20230112215906.494394-1-biju.das.jz@bp.renesas.com>
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
You can access the registers associated with the currently set DRD mode,
therefore as part of init, we have to set the DRD mode to host.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v1->v2:
 * Added Rb tag from Rob
 * Renamed clock-name "host_axi"->"axi"
 * Drop quotes around usb-xhci.yaml.
---
 .../bindings/usb/renesas,usb-xhci.yaml        | 41 +++++++++++++++++--
 1 file changed, 37 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/renesas,usb-xhci.yaml b/Documentation/devicetree/bindings/usb/renesas,usb-xhci.yaml
index 4c5efaf02308..1a07c0d2b1b1 100644
--- a/Documentation/devicetree/bindings/usb/renesas,usb-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/renesas,usb-xhci.yaml
@@ -10,9 +10,6 @@ maintainers:
   - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
   - Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
 
-allOf:
-  - $ref: "usb-xhci.yaml"
-
 properties:
   compatible:
     oneOf:
@@ -37,6 +34,11 @@ properties:
               - renesas,xhci-r8a77965 # R-Car M3-N
               - renesas,xhci-r8a77990 # R-Car E3
           - const: renesas,rcar-gen3-xhci # R-Car Gen3 and RZ/G2
+      - items:
+          - enum:
+              - renesas,r9a09g011-xhci # RZ/V2M
+              - renesas,r9a09g055-xhci # RZ/V2MA
+          - const: renesas,rzv2m-xhci  # RZ/{V2M, V2MA}
 
   reg:
     maxItems: 1
@@ -45,7 +47,16 @@ properties:
     maxItems: 1
 
   clocks:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: Main clock for host
+      - description: Register access clock
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: axi
+      - const: reg
 
   phys:
     maxItems: 1
@@ -68,6 +79,28 @@ required:
   - power-domains
   - resets
 
+allOf:
+  - $ref: usb-xhci.yaml
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,rzv2m-xhci
+    then:
+      properties:
+        clocks:
+          minItems: 2
+        clock-names:
+          minItems: 2
+      required:
+        - clock-names
+    else:
+      properties:
+        clocks:
+          maxItems: 1
+
 unevaluatedProperties: false
 
 examples:
-- 
2.25.1

