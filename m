Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FCCE38108F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 14 May 2021 21:24:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233101AbhENTZK (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 14 May 2021 15:25:10 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:53998 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S234052AbhENTZE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 May 2021 15:25:04 -0400
X-IronPort-AV: E=Sophos;i="5.82,300,1613401200"; 
   d="scan'208";a="81343886"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 15 May 2021 04:23:52 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 9A9AE4010906;
        Sat, 15 May 2021 04:23:48 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: [PATCH 11/16] dt-bindings: clock: renesas: Document RZ/G2L SoC CPG driver
Date:   Fri, 14 May 2021 20:22:13 +0100
Message-Id: <20210514192218.13022-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210514192218.13022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20210514192218.13022-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Document the device tree bindings of the Renesas RZ/G2L SoC clock
driver in Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../bindings/clock/renesas,rzg2l-cpg.yaml     | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml

diff --git a/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml b/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
new file mode 100644
index 000000000000..463d6667951b
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
@@ -0,0 +1,80 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/clock/renesas,rzg2l-cpg.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Renesas RZ/G2L Clock Pulse Generator / Module Stop and Software Reset
+
+maintainers:
+  - Geert Uytterhoeven <geert+renesas@glider.be>
+
+description: |
+  On Renesas RZ/G2L SoC, the CPG (Clock Pulse Generator) and MSTP
+  (Module Stop and Software Reset) share the same register block.
+
+  They provide the following functionalities:
+    - The CPG block generates various core clocks,
+    - The MSTP block provides two functions:
+        1. Module Stop, providing a Clock Domain to control the clock supply
+           to individual SoC devices,
+        2. Reset Control, to perform a software reset of individual SoC devices.
+
+properties:
+  compatible:
+    const: renesas,r9a07g044l-cpg  # RZ/G2L
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: extal
+
+  '#clock-cells':
+    description: |
+      - For CPG core clocks, the two clock specifier cells must be "CPG_CORE"
+        and a core clock reference, as defined in
+        <dt-bindings/clock/*-cpg-mssr.h>
+      - For module clocks, the two clock specifier cells must be "CPG_MOD" and
+        a module number, as defined in the datasheet.
+    const: 2
+
+  '#power-domain-cells':
+    description:
+      SoC devices that are part of the CPG/MSTP Clock Domain and can be
+      power-managed through Module Stop should refer to the CPG device node
+      in their "power-domains" property, as documented by the generic PM Domain
+      bindings in Documentation/devicetree/bindings/power/power-domain.yaml.
+    const: 0
+
+  '#reset-cells':
+    description:
+      The single reset specifier cell must be the module number, as defined in
+      the datasheet.
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
+            compatible = "renesas,r9a07g044l-cpg";
+            reg = <0x11010000 0x10000>;
+            clocks = <&extal_clk>;
+            clock-names = "extal";
+            #clock-cells = <2>;
+            #power-domain-cells = <0>;
+            #reset-cells = <1>;
+    };
-- 
2.17.1

