Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D34FF6766E0
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 21 Jan 2023 15:59:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229706AbjAUO7L (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 21 Jan 2023 09:59:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbjAUO7K (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 21 Jan 2023 09:59:10 -0500
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5B3CC1F93A;
        Sat, 21 Jan 2023 06:59:09 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.97,235,1669042800"; 
   d="scan'208";a="147051230"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 21 Jan 2023 23:59:09 +0900
Received: from localhost.localdomain (unknown [10.226.92.25])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 99CDF42BC25E;
        Sat, 21 Jan 2023 23:59:05 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        linux-renesas-soc@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v3 02/12] dt-bindings: usb: renesas,usb3-peri: Update reset, clock-name and interrupts properties
Date:   Sat, 21 Jan 2023 14:58:43 +0000
Message-Id: <20230121145853.4792-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230121145853.4792-1-biju.das.jz@bp.renesas.com>
References: <20230121145853.4792-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On RZ/V2M, USB3DRD module manages the drd_reset. Moreover, the interrupts
drd, gpi and bc are part of USB3DRD block. This patch removes
drd_reset and the interrupts drd, bc and gpi from usb3_peri bindings.
After this, there is only one reset and interrupts and therefore
removing reset-names and interrupt-names as well.

Whilst, Update the clock-name "aclk"->"axi" to make it consistent with
DRD and host blocks.

There is any harm in making such a change as, no users of
renesas,r9a09g011-usb3-peri yet in kernel release.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
v2->v3:
 * Added Rb tag from Rob
v1->v2:
 * Moved DRD interrupts to DRD bindings
 * Updated interrupts and dropped interrupt-names
 * Renamed aclk->axi
---
 .../bindings/usb/renesas,usb3-peri.yaml       | 39 ++-----------------
 1 file changed, 3 insertions(+), 36 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml b/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml
index 55dfd121b555..4ba36ebf0f1e 100644
--- a/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml
+++ b/Documentation/devicetree/bindings/usb/renesas,usb3-peri.yaml
@@ -34,20 +34,7 @@ properties:
     maxItems: 1
 
   interrupts:
-    minItems: 1
-    items:
-      - description: Combined interrupt for DMA, SYS and ERR
-      - description: Dual Role Device (DRD)
-      - description: Battery Charging
-      - description: Global Purpose Input
-
-  interrupt-names:
-    minItems: 1
-    items:
-      - const: all_p
-      - const: drd
-      - const: bc
-      - const: gpi
+    maxItems: 1
 
   clocks:
     minItems: 1
@@ -58,7 +45,7 @@ properties:
   clock-names:
     minItems: 1
     items:
-      - const: aclk
+      - const: axi
       - const: reg
 
   phys:
@@ -71,15 +58,7 @@ properties:
     maxItems: 1
 
   resets:
-    minItems: 1
-    items:
-      - description: Peripheral reset
-      - description: DRD reset
-
-  reset-names:
-    items:
-      - const: aresetn_p
-      - const: drd_reset
+    maxItems: 1
 
   usb-role-switch:
     $ref: /schemas/types.yaml#/definitions/flag
@@ -127,25 +106,13 @@ allOf:
           minItems: 2
         clock-names:
           minItems: 2
-        interrupts:
-          minItems: 4
-        interrupt-names:
-          minItems: 4
-        resets:
-          minItems: 2
       required:
         - clock-names
-        - interrupt-names
         - resets
-        - reset-names
     else:
       properties:
         clocks:
           maxItems: 1
-        interrupts:
-          maxItems: 1
-        resets:
-          maxItems: 1
 
 additionalProperties: false
 
-- 
2.25.1

