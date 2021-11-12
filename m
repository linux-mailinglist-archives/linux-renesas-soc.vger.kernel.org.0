Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 440C744ECC2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Nov 2021 19:44:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235598AbhKLSrR (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 12 Nov 2021 13:47:17 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:46808 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S235616AbhKLSrQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Nov 2021 13:47:16 -0500
X-IronPort-AV: E=Sophos;i="5.87,230,1631545200"; 
   d="scan'208";a="100101575"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 13 Nov 2021 03:44:25 +0900
Received: from localhost.localdomain (unknown [10.226.92.48])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 4E36840D6012;
        Sat, 13 Nov 2021 03:44:22 +0900 (JST)
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
Subject: [PATCH v3 2/4] dt-bindings: timer: renesas: ostm: Document Renesas RZ/G2L OSTM
Date:   Fri, 12 Nov 2021 18:44:11 +0000
Message-Id: <20211112184413.4391-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211112184413.4391-1-biju.das.jz@bp.renesas.com>
References: <20211112184413.4391-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document the General Timer Module(a.k.a OSTM) found on the RZ/G2L SoC.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
V2->v3:
 * Added Geert's Rb tag.
v1->v2:
 * Use renesas,ostm instead od rzg2l-ostm
---
 .../bindings/timer/renesas,ostm.yaml          | 20 ++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/renesas,ostm.yaml b/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
index 600d47ab7d58..7fa7f977b44c 100644
--- a/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
+++ b/Documentation/devicetree/bindings/timer/renesas,ostm.yaml
@@ -21,9 +21,10 @@ properties:
   compatible:
     items:
       - enum:
-          - renesas,r7s72100-ostm # RZ/A1H
-          - renesas,r7s9210-ostm  # RZ/A2M
-      - const: renesas,ostm       # Generic
+          - renesas,r7s72100-ostm  # RZ/A1H
+          - renesas,r7s9210-ostm   # RZ/A2M
+          - renesas,r9a07g044-ostm # RZ/G2{L,LC}
+      - const: renesas,ostm        # Generic
 
   reg:
     maxItems: 1
@@ -37,6 +38,9 @@ properties:
   power-domains:
     maxItems: 1
 
+  resets:
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -44,6 +48,16 @@ required:
   - clocks
   - power-domains
 
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - renesas,r9a07g044-ostm
+then:
+  required:
+    - resets
+
 additionalProperties: false
 
 examples:
-- 
2.17.1

