Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16C1F690A5D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  9 Feb 2023 14:35:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230405AbjBINff (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 9 Feb 2023 08:35:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230355AbjBINfS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 9 Feb 2023 08:35:18 -0500
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CD28E60D63;
        Thu,  9 Feb 2023 05:34:59 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.97,283,1669042800"; 
   d="scan'208";a="152256220"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 09 Feb 2023 22:34:46 +0900
Received: from localhost.localdomain (unknown [10.166.15.32])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 8D19743638B8;
        Thu,  9 Feb 2023 22:34:46 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v3] dt-bindings: iommu: renesas,ipmmu-vmsa: Update for R-Car Gen4
Date:   Thu,  9 Feb 2023 22:34:40 +0900
Message-Id: <20230209133440.2643228-1-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Since R-Car Gen4 doens't have the main IPMMU IMSSTR register, update
the renesas,ipmmu-main property which sets maxItems as 1.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
Changes from v2:
https://lore.kernel.org/all/20230127140446.1728102-1-yoshihiro.shimoda.uh@renesas.com/
 - Set maxItems to renesas,ipmmu-main if R-Car Gen4.

Changes from v1:
https://lore.kernel.org/all/20230123012940.1250879-1-yoshihiro.shimoda.uh@renesas.com/
 - Change number of argument for R-Car Gen4 instead of "module id".
   On the discussion, using 'minItems' is a solution. But, it causes
   "too short" errors on dtbs_check. So, using "oneOf" instead.

 .../bindings/iommu/renesas,ipmmu-vmsa.yaml    | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml b/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml
index 72308a4c14e7..cc81bce44f3f 100644
--- a/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml
+++ b/Documentation/devicetree/bindings/iommu/renesas,ipmmu-vmsa.yaml
@@ -74,11 +74,10 @@ properties:
   renesas,ipmmu-main:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     items:
-      - items:
-          - description: phandle to main IPMMU
-          - description: the interrupt bit number associated with the particular
-              cache IPMMU device. The interrupt bit number needs to match the main
-              IPMMU IMSSTR register. Only used by cache IPMMU instances.
+      - description: phandle to main IPMMU
+      - description: the interrupt bit number associated with the particular
+          cache IPMMU device. The interrupt bit number needs to match the main
+          IPMMU IMSSTR register. Only used by cache IPMMU instances.
     description:
       Reference to the main IPMMU phandle plus 1 cell. The cell is
       the interrupt bit number associated with the particular cache IPMMU
@@ -109,6 +108,16 @@ allOf:
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
+          maxItems: 1
+
 examples:
   - |
     #include <dt-bindings/clock/r8a7791-cpg-mssr.h>
-- 
2.25.1

