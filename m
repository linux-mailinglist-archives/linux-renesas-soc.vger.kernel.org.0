Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBD7244CDE0
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 11 Nov 2021 00:29:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234240AbhKJXcU (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 10 Nov 2021 18:32:20 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:16625 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S234229AbhKJXcU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Nov 2021 18:32:20 -0500
X-IronPort-AV: E=Sophos;i="5.87,225,1631545200"; 
   d="scan'208";a="100146432"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 11 Nov 2021 08:29:31 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id A444A4143452;
        Thu, 11 Nov 2021 08:29:28 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 2/3] dt-bindings: serial: renesas,sci: Document RZ/G2L SoC
Date:   Wed, 10 Nov 2021 23:29:19 +0000
Message-Id: <20211110232920.19198-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211110232920.19198-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20211110232920.19198-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add SCI binding documentation for Renesas RZ/G2L SoC.

Also update the example node with RZ/G2L SCI0 node.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2->v3
* Added const "renesas,sci" entry under items for h8300
---
 .../bindings/serial/renesas,sci.yaml          | 46 ++++++++++++++++---
 1 file changed, 40 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/renesas,sci.yaml b/Documentation/devicetree/bindings/serial/renesas,sci.yaml
index 22ed2f0b1dc3..f00b1d38e9a5 100644
--- a/Documentation/devicetree/bindings/serial/renesas,sci.yaml
+++ b/Documentation/devicetree/bindings/serial/renesas,sci.yaml
@@ -14,7 +14,14 @@ allOf:
 
 properties:
   compatible:
-    const: renesas,sci
+    oneOf:
+      - items:
+          - enum:
+              - renesas,r9a07g044-sci     # RZ/G2{L,LC}
+          - const: renesas,sci            # generic SCI compatible UART
+
+      - items:
+          - const: renesas,sci            # generic SCI compatible UART
 
   reg:
     maxItems: 1
@@ -54,18 +61,45 @@ required:
   - clocks
   - clock-names
 
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - renesas,r9a07g044-sci
+then:
+  properties:
+    resets:
+      maxItems: 1
+
+    power-domains:
+      maxItems: 1
+
+  required:
+    - resets
+    - power-domains
+
 unevaluatedProperties: false
 
 examples:
   - |
+    #include <dt-bindings/clock/r9a07g044-cpg.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
     aliases {
             serial0 = &sci0;
     };
 
-    sci0: serial@ffff78 {
-            compatible = "renesas,sci";
-            reg = <0xffff78 8>;
-            interrupts = <88 0>, <89 0>, <90 0>, <91 0>;
-            clocks = <&fclk>;
+    sci0: serial@1004d000 {
+            compatible = "renesas,r9a07g044-sci", "renesas,sci";
+            reg = <0x1004d000 0x400>;
+            interrupts = <GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "eri", "rxi", "txi", "tei";
+            clocks = <&cpg CPG_MOD R9A07G044_SCI0_CLKP>;
             clock-names = "fck";
+            power-domains = <&cpg>;
+            resets = <&cpg R9A07G044_SCI0_RST>;
     };
-- 
2.17.1

