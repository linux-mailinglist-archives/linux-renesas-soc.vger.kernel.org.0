Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA08744BCEC
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 10 Nov 2021 09:32:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230254AbhKJIet (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Nov 2021 03:34:49 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:41853 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230245AbhKJIet (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Nov 2021 03:34:49 -0500
X-IronPort-AV: E=Sophos;i="5.87,223,1631545200"; 
   d="scan'208";a="99778034"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 10 Nov 2021 17:32:01 +0900
Received: from localhost.localdomain (unknown [10.226.92.40])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id AE7BE40062CE;
        Wed, 10 Nov 2021 17:31:58 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Chris Brandt <chris.brandt@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: timer: renesas: ostm: Document Renesas RZ/G2L OSTM
Date:   Wed, 10 Nov 2021 08:31:51 +0000
Message-Id: <20211110083152.31144-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211110083152.31144-1-biju.das.jz@bp.renesas.com>
References: <20211110083152.31144-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document the General Timer Module(a.k.a OSTM) found on the RZ/G2L SoC.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../bindings/timer/renesas,ostm.yaml          | 29 +++++++++++++++----
 1 file changed, 24 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/renesas,ostm.yaml b/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
index 600d47ab7d58..5a8ffdc8b1cb 100644
--- a/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
+++ b/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
@@ -19,11 +19,17 @@ description:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - renesas,r7s72100-ostm # RZ/A1H
-          - renesas,r7s9210-ostm  # RZ/A2M
-      - const: renesas,ostm       # Generic
+    oneOf:
+      - items:
+          - enum:
+              - renesas,r7s72100-ostm  # RZ/A1H
+              - renesas,r7s9210-ostm   # RZ/A2M
+          - const: renesas,ostm        # Generic
+
+      - items:
+          - enum:
+              - renesas,r9a07g044-ostm # RZ/G2{L,LC}
+          - const: renesas,rzg2l-ostm  # RZ/G2L
 
   reg:
     maxItems: 1
@@ -37,6 +43,9 @@ properties:
   power-domains:
     maxItems: 1
 
+  resets:
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -44,6 +53,16 @@ required:
   - clocks
   - power-domains
 
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - renesas,rzg2l-ostm
+then:
+  required:
+    - resets
+
 additionalProperties: false
 
 examples:
-- 
2.17.1

