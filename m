Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC1753A1B16
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jun 2021 18:37:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232025AbhFIQju (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Jun 2021 12:39:50 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:37427 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231991AbhFIQjt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Jun 2021 12:39:49 -0400
X-IronPort-AV: E=Sophos;i="5.83,261,1616425200"; 
   d="scan'208";a="83736873"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 10 Jun 2021 01:37:53 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id B918C40A2B81;
        Thu, 10 Jun 2021 01:37:51 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 1/3] dt-bindings: power: renesas,rzg2l-sysc: Add DT binding documentation for SYSC controller
Date:   Wed,  9 Jun 2021 17:37:15 +0100
Message-Id: <20210609163717.3083-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210609163717.3083-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20210609163717.3083-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add DT binding documentation for SYSC controller found on
RZ/G2{L,LC,UL} SoC's.

SYSC block contains the LSI_DEVID register which is used to retrieve
SoC product information.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../bindings/power/renesas,rzg2l-sysc.yaml    | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/renesas,rzg2l-sysc.yaml

diff --git a/Documentation/devicetree/bindings/power/renesas,rzg2l-sysc.yaml b/Documentation/devicetree/bindings/power/renesas,rzg2l-sysc.yaml
new file mode 100644
index 000000000000..49f95065a274
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/renesas,rzg2l-sysc.yaml
@@ -0,0 +1,63 @@
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
+    items:
+      - description: CA55/CM33 Sleep/Software Standby Mode request interrupt
+      - description: CA55 Software Standby Mode release request interrupt
+      - description: CM33 Software Standby Mode release request interrupt
+      - description: CA55 ACE Asynchronous Bridge Master/Slave interface deny request interrupt
+
+  interrupt-names:
+    items:
+      - const: sys_lpm_int
+      - const: sys_ca55stbydone_int
+      - const: sys_cm33stbyr_int
+      - const: sys_ca55_deny
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
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
+            interrupt-names = "sys_lpm_int", "sys_ca55stbydone_int",
+                              "sys_cm33stbyr_int", "sys_ca55_deny";
+    };
-- 
2.17.1

