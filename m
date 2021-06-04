Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 770FB39BF57
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jun 2021 20:09:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230022AbhFDSL3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Jun 2021 14:11:29 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:6354 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229726AbhFDSL3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Jun 2021 14:11:29 -0400
X-IronPort-AV: E=Sophos;i="5.83,248,1616425200"; 
   d="scan'208";a="83279183"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 05 Jun 2021 03:09:42 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 3138A40C7B95;
        Sat,  5 Jun 2021 03:09:40 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/3] dt-bindings: power: renesas,rzg2l-sysc: Add DT binding documentation for SYSC controller
Date:   Fri,  4 Jun 2021 19:09:31 +0100
Message-Id: <20210604180933.16754-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210604180933.16754-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20210604180933.16754-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add DT binding documentation for SYSC controller found on
RZ/G2{L,LC,UL} SoC's.

SYSC block contains the LSI_DEVID register which is used to retrieve
SoC product information.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../bindings/power/renesas,rzg2l-sysc.yaml    | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/renesas,rzg2l-sysc.yaml

diff --git a/Documentation/devicetree/bindings/power/renesas,rzg2l-sysc.yaml b/Documentation/devicetree/bindings/power/renesas,rzg2l-sysc.yaml
new file mode 100644
index 000000000000..616a5139644f
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/renesas,rzg2l-sysc.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/power/renesas,rzg2l-sysc.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Renesas RZ/G2L System Controller (SYSC)
+
+maintainers:
+  - Geert Uytterhoeven <geert+renesas@glider.be>
+
+description:
+  The RZ/G2L System Controller (SYSC) performs system control of the LSI and
+  supports following functions,
+  - External terminal state capture function
+  - 34-bit address space access function
+  - Low power consumption control
+  - WDT stop control
+
+properties:
+  compatible:
+    enum:
+      - renesas,r9a07g044-sysc # RZ/G2{L,LC}
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 4
+    maxItems: 4
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    // System Controller node
+    sysc: system-controller@11020000 {
+            compatible = "renesas,r9a07g044-sysc";
+            reg = <0x11020000 0x10000>;
+            interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
+    };
-- 
2.17.1

