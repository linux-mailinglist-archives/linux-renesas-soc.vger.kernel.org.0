Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01763478D48
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Dec 2021 15:20:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234472AbhLQOUm (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Dec 2021 09:20:42 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:37559 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232629AbhLQOUm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Dec 2021 09:20:42 -0500
Received: (Authenticated sender: miquel.raynal@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 4B4EB60014;
        Fri, 17 Dec 2021 14:20:38 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tudor Ambarus <Tudor.Ambarus@microchip.com>,
        Pratyush Yadav <p.yadav@ti.com>,
        Michael Walle <michael@walle.cc>,
        <linux-mtd@lists.infradead.org>
Cc:     Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa@kernel.org>,
        Chris Brandt <Chris.Brandt@renesas.com>,
        Ralph Siemsen <ralph.siemsen@linaro.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v6 1/4] dt-bindings: mtd: renesas: Describe Renesas R-Car Gen3 & RZ/N1 NAND controller
Date:   Fri, 17 Dec 2021 15:20:30 +0100
Message-Id: <20211217142033.353599-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211217142033.353599-1-miquel.raynal@bootlin.com>
References: <20211217142033.353599-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add a Yaml description for this Renesas NAND controller.

As this controller is embedded on different SoC families, provide:
* a family-specific "r-car-gen3" compatible and a more specific
  "r8a77951" one
* a family-specific "rzn1" compatible and a more specific "r9a06g032"
  one

More compatibles can be added later if new SoCs with this controller
must be supported.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/mtd/renesas-nandc.yaml           | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/renesas-nandc.yaml

diff --git a/Documentation/devicetree/bindings/mtd/renesas-nandc.yaml b/Documentation/devicetree/bindings/mtd/renesas-nandc.yaml
new file mode 100644
index 000000000000..71886dbda35c
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/renesas-nandc.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/renesas-nandc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas R-Car Gen3 & RZ/N1x NAND flash controller device tree bindings
+
+maintainers:
+  - Miquel Raynal <miquel.raynal@bootlin.com>
+
+allOf:
+  - $ref: "nand-controller.yaml"
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - renesas,r8a77951-nandc
+          - const: renesas,rcar-gen3-nandc
+
+      - items:
+          - enum:
+              - renesas,r9a06g032-nandc
+          - const: renesas,rzn1-nandc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: APB host controller clock
+      - description: External NAND bus clock
+
+  clock-names:
+    items:
+      - const: hclk
+      - const: eclk
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/r9a06g032-sysctrl.h>
+
+    nand-controller@40102000 {
+        compatible = "renesas,r9a06g032-nandc", "renesas,rzn1-nandc";
+        reg = <0x40102000 0x2000>;
+        interrupts = <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&sysctrl R9A06G032_HCLK_NAND>, <&sysctrl R9A06G032_CLK_NAND>;
+        clock-names = "hclk", "eclk";
+        #address-cells = <1>;
+        #size-cells = <0>;
+    };
-- 
2.27.0

