Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B52336EAC1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Apr 2021 14:45:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237051AbhD2Mqn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 29 Apr 2021 08:46:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233731AbhD2Mqn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Apr 2021 08:46:43 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55607C06138B
        for <linux-renesas-soc@vger.kernel.org>; Thu, 29 Apr 2021 05:45:56 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:d4dd:70b4:3264:8d97])
        by michel.telenet-ops.be with bizsmtp
        id yclu240064p6Y3806clutx; Thu, 29 Apr 2021 14:45:56 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lc63F-001F96-Nz; Thu, 29 Apr 2021 14:45:53 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lc63E-009Vqv-W8; Thu, 29 Apr 2021 14:45:53 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: media: renesas,vin: Make resets optional on R-Car Gen1
Date:   Thu, 29 Apr 2021 14:45:52 +0200
Message-Id: <217c8197efaee7d803b22d433abb0ea8e33b84c6.1619700314.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The "resets" property is not present on R-Car Gen1 SoCs.
Supporting it would require migrating from renesas,cpg-clocks to
renesas,cpg-mssr.

Fixes: 905fc6b1bfb4a631 ("dt-bindings: rcar-vin: Convert bindings to json-schema")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Note that VIN is not yet enabled in r8a777[89].dtsi.
---
 .../bindings/media/renesas,vin.yaml           | 46 ++++++++++++-------
 1 file changed, 29 insertions(+), 17 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/renesas,vin.yaml b/Documentation/devicetree/bindings/media/renesas,vin.yaml
index 79c936b313ea91ae..19fccc2fd8ece120 100644
--- a/Documentation/devicetree/bindings/media/renesas,vin.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,vin.yaml
@@ -194,23 +194,35 @@ required:
   - interrupts
   - clocks
   - power-domains
-  - resets
-
-if:
-  properties:
-    compatible:
-      contains:
-        enum:
-          - renesas,vin-r8a7778
-          - renesas,vin-r8a7779
-          - renesas,rcar-gen2-vin
-then:
-  required:
-    - port
-else:
-  required:
-    - renesas,id
-    - ports
+
+allOf:
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - renesas,vin-r8a7778
+                - renesas,vin-r8a7779
+    then:
+      required:
+        - resets
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,vin-r8a7778
+              - renesas,vin-r8a7779
+              - renesas,rcar-gen2-vin
+    then:
+      required:
+        - port
+    else:
+      required:
+        - renesas,id
+        - ports
 
 additionalProperties: false
 
-- 
2.25.1

