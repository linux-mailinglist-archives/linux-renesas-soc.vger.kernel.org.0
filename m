Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CAE303E059F
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  4 Aug 2021 18:13:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234324AbhHDQNt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 4 Aug 2021 12:13:49 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:61085 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231129AbhHDQNt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Aug 2021 12:13:49 -0400
X-IronPort-AV: E=Sophos;i="5.84,294,1620658800"; 
   d="scan'208";a="89812749"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 05 Aug 2021 01:13:34 +0900
Received: from localhost.localdomain (unknown [10.226.92.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 7EF2D40078C4;
        Thu,  5 Aug 2021 01:13:32 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: mmc: renesas,sdhi: Fix dtbs-check warning
Date:   Wed,  4 Aug 2021 17:13:24 +0100
Message-Id: <20210804161325.26996-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210804161325.26996-1-biju.das.jz@bp.renesas.com>
References: <20210804161325.26996-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Fix dtbs-check warning pinctrl-names:0:'default' was expected
for r8a77470-iwg23s-sbc.dts file.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3:
 * New patch to fix the dtbs-check warnings
 Ref:- https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20210804091940.23983-1-biju.das.jz@bp.renesas.com/
---
 .../devicetree/bindings/mmc/renesas,sdhi.yaml | 65 ++++++++++++-------
 1 file changed, 42 insertions(+), 23 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
index 677989bc5924..543eeb825dc3 100644
--- a/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
+++ b/Documentation/devicetree/bindings/mmc/renesas,sdhi.yaml
@@ -9,9 +9,6 @@ title: Renesas SDHI SD/MMC controller
 maintainers:
   - Wolfram Sang <wsa+renesas@sang-engineering.com>
 
-allOf:
-  - $ref: "mmc-controller.yaml"
-
 properties:
   compatible:
     oneOf:
@@ -104,14 +101,51 @@ properties:
   pinctrl-1:
     maxItems: 1
 
-  pinctrl-names:
-    minItems: 1
-    items:
-      - const: default
-      - const: state_uhs
+  pinctrl-names: true
 
   max-frequency: true
 
+allOf:
+  - $ref: "mmc-controller.yaml"
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,sdhi-mmc-r8a77470
+    then:
+      properties:
+        pinctrl-names:
+          items:
+            - const: state_uhs
+    else:
+      properties:
+        pinctrl-names:
+          minItems: 1
+          items:
+            - const: default
+            - const: state_uhs
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,sdhi-r7s72100
+              - renesas,sdhi-r7s9210
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: core
+            - const: cd
+      required:
+        - clock-names
+      description:
+        The internal card detection logic that exists in these controllers is
+        sectioned off to be run by a separate second clock source to allow
+        the main core clock to be turned off to save power.
+
 required:
   - compatible
   - reg
@@ -119,21 +153,6 @@ required:
   - clocks
   - power-domains
 
-if:
-  properties:
-    compatible:
-      contains:
-        enum:
-          - renesas,sdhi-r7s72100
-          - renesas,sdhi-r7s9210
-then:
-  required:
-    - clock-names
-  description:
-    The internal card detection logic that exists in these controllers is
-    sectioned off to be run by a separate second clock source to allow
-    the main core clock to be turned off to save power.
-
 unevaluatedProperties: false
 
 examples:
-- 
2.17.1

