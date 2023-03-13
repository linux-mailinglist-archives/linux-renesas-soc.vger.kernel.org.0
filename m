Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 499566B77B2
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 13 Mar 2023 13:40:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229783AbjCMMkg (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 13 Mar 2023 08:40:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229689AbjCMMkg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Mar 2023 08:40:36 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3BFEC1CBCC;
        Mon, 13 Mar 2023 05:40:35 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.98,256,1673881200"; 
   d="scan'208";a="152420029"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 13 Mar 2023 21:40:34 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 62D454008558;
        Mon, 13 Mar 2023 21:40:34 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     geert+renesas@glider.be, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v4] dt-bindings: iommu: renesas, ipmmu-vmsa: Update for R-Car Gen4
Date:   Mon, 13 Mar 2023 21:40:26 +0900
Message-Id: <20230313124026.954514-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.4 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Since R-Car Gen4 does not have the main IPMMU IMSSTR register, update
the bindings to drop the interrupt bit number from the
renesas,ipmmu-main property.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
[geert: Re-add removed items level, add minItems/maxItems constraints]
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Changes from v3:
https://lore.kernel.org/all/20230209133440.2643228-1-yoshihiro.shimoda.uh@renesas.com/
 - Revise the dt-bindings by Geert-san (Thanks a lot!).

 .../bindings/iommu/renesas,ipmmu-vmsa.yaml    | 32 ++++++++++++++-----
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml b/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml
index 72308a4c14e7..be90f68c11d1 100644
--- a/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml
+++ b/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml
@@ -74,16 +74,16 @@ properties:
   renesas,ipmmu-main:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     items:
-      - items:
+      - minItems: 1
+        items:
           - description: phandle to main IPMMU
-          - description: the interrupt bit number associated with the particular
-              cache IPMMU device. The interrupt bit number needs to match the main
-              IPMMU IMSSTR register. Only used by cache IPMMU instances.
+          - description:
+              The interrupt bit number associated with the particular cache
+              IPMMU device. If present, the interrupt bit number needs to match
+              the main IPMMU IMSSTR register. Only used by cache IPMMU
+              instances.
     description:
-      Reference to the main IPMMU phandle plus 1 cell. The cell is
-      the interrupt bit number associated with the particular cache IPMMU
-      device. The interrupt bit number needs to match the main IPMMU IMSSTR
-      register. Only used by cache IPMMU instances.
+      Reference to the main IPMMU.
 
 required:
   - compatible
@@ -109,6 +109,22 @@ allOf:
       required:
         - power-domains
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,rcar-gen4-ipmmu-vmsa
+    then:
+      properties:
+        renesas,ipmmu-main:
+          items:
+            - maxItems: 1
+    else:
+      properties:
+        renesas,ipmmu-main:
+          items:
+            - minItems: 2
+
 examples:
   - |
     #include <dt-bindings/clock/r8a7791-cpg-mssr.h>
-- 
2.25.1

