Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 343603A19C6
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  9 Jun 2021 17:34:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236999AbhFIPfW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 9 Jun 2021 11:35:22 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:33258 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S237166AbhFIPfP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Jun 2021 11:35:15 -0400
X-IronPort-AV: E=Sophos;i="5.83,261,1616425200"; 
   d="scan'208";a="83733806"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 10 Jun 2021 00:33:19 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5F3824009102;
        Thu, 10 Jun 2021 00:33:16 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 07/11] dt-bindings: clock: renesas: Document RZ/G2L SoC CPG driver
Date:   Wed,  9 Jun 2021 16:32:26 +0100
Message-Id: <20210609153230.6967-8-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210609153230.6967-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20210609153230.6967-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document the device tree bindings of the Renesas RZ/G2L SoC clock
driver in Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/clock/renesas,rzg2l-cpg.yaml     | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml

diff --git a/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml b/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
new file mode 100644
index 000000000000..30b2e3d0d25d
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/clock/renesas,rzg2l-cpg.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Renesas RZ/G2L Clock Pulse Generator / Module Standby Mode
+
+maintainers:
+  - Geert Uytterhoeven <geert+renesas@glider.be>
+
+description: |
+  On Renesas RZ/G2L SoC, the CPG (Clock Pulse Generator) and Module
+  Standby Mode share the same register block.
+
+  They provide the following functionalities:
+    - The CPG block generates various core clocks,
+    - The Module Standby Mode block provides two functions:
+        1. Module Standby, providing a Clock Domain to control the clock supply
+           to individual SoC devices,
+        2. Reset Control, to perform a software reset of individual SoC devices.
+
+properties:
+  compatible:
+    const: renesas,r9a07g044-cpg  # RZ/G2{L,LC}
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    description:
+      Clock source to CPG can be either from external clock input (EXCLK) or
+      crystal oscillator (XIN/XOUT).
+    const: extal
+
+  '#clock-cells':
+    description: |
+      - For CPG core clocks, the two clock specifier cells must be "CPG_CORE"
+        and a core clock reference, as defined in
+        <dt-bindings/clock/r9a07g044-cpg.h>
+      - For module clocks, the two clock specifier cells must be "CPG_MOD" and
+        a module number, as defined in the <dt-bindings/clock/r9a07g044-cpg.h>.
+    const: 2
+
+  '#power-domain-cells':
+    description:
+      SoC devices that are part of the CPG/Module Standby Mode Clock Domain and
+      can be power-managed through Module Standby should refer to the CPG device
+      node in their "power-domains" property, as documented by the generic PM
+      Domain bindings in Documentation/devicetree/bindings/power/power-domain.yaml.
+    const: 0
+
+  '#reset-cells':
+    description:
+      The single reset specifier cell must be the module number, as defined in
+      the <dt-bindings/clock/r9a07g044-cpg.h>.
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - '#clock-cells'
+  - '#power-domain-cells'
+  - '#reset-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    cpg: clock-controller@11010000 {
+            compatible = "renesas,r9a07g044-cpg";
+            reg = <0x11010000 0x10000>;
+            clocks = <&extal_clk>;
+            clock-names = "extal";
+            #clock-cells = <2>;
+            #power-domain-cells = <0>;
+            #reset-cells = <1>;
+    };
-- 
2.17.1

