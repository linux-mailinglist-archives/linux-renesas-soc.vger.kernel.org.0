Return-Path: <linux-renesas-soc+bounces-16307-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBE2A9A73B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Apr 2025 11:00:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 309543A48F6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Apr 2025 08:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0012421C9EF;
	Thu, 24 Apr 2025 09:00:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 247697081C;
	Thu, 24 Apr 2025 09:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745485214; cv=none; b=Rh0ppZOPko3/T/8sbW2rmeBdh1HoY/YaX4rqRbYrWIZ++FCEnfgTL0Ek7iMMJ3Lv9acJmqoWc+/HbCA4lyAEAfKLZEq9/jdYqMdEjqiklyyGKUxDCY2IuOdZdcid1QMG8S7Iq+R60Wcri00n823C2xPcMvg1XjqFpQLWxmwXoX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745485214; c=relaxed/simple;
	bh=d14vRwyPGEhX7dbooqrvQ9ra9ihjLrcb9Pww9Yv1+zs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JIJyeh1cxCsgES9Iiyfg67QU5FaQdRxiiIxWXk4sW8hVCNu0h7xGO/QQcOsAIoQLjRVENc6UGa6OP7HJ5F5RXPaqrqx29WMUyfptf5oTc8DKHc1ju0mqPkR9yt+QNP4rh/GL+u0MYJG2RBmsQ8gN7FywBcDdbr8fWpIOkNvSsyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: snITA7AgRMSR+xK38U7Hxw==
X-CSE-MsgGUID: UZ3lDPLsTuCtpq80hSHXBw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 24 Apr 2025 18:00:10 +0900
Received: from localhost.localdomain (unknown [10.226.92.69])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 519DE4005B3F;
	Thu, 24 Apr 2025 18:00:07 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v5 1/7] dt-bindings: memory: Document RZ/G3E support
Date: Thu, 24 Apr 2025 09:59:49 +0100
Message-ID: <20250424090000.136804-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424090000.136804-1-biju.das.jz@bp.renesas.com>
References: <20250424090000.136804-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document support for the Expanded Serial Peripheral Interface (xSPI)
Controller in the Renesas RZ/G3E (R9A09G047) SoC.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * Removed CPG bindings header file changes
 * Updated example replacing R9A09G047_SPI_CLK_SPI->9, so that there is
   no dependency with clk.
v3->v4:
 * Added a definition for the spi core clock in the R9A09G047 CPG bindings
   header file.
 * Updated the example with spi core clock
 * Retained Rb tag from Rob as these changes are trivial.
v2->v3:
 * No change.
v1->v2:
 * As rz-xspi is too generic, replaced file name rz-xspi->rzg3e-xspi
   and dropped generic compatible rz-xspi.
 * Dropped prefix spi from interrupt names.
 * Updated the example with above changes.
 * Retained Rb tag from Rob as these changes are trivial.
---
 .../renesas,rzg3e-xspi.yaml                   | 135 ++++++++++++++++++
 1 file changed, 135 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/renesas,rzg3e-xspi.yaml

diff --git a/Documentation/devicetree/bindings/memory-controllers/renesas,rzg3e-xspi.yaml b/Documentation/devicetree/bindings/memory-controllers/renesas,rzg3e-xspi.yaml
new file mode 100644
index 000000000000..2bfe63ec62dc
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/renesas,rzg3e-xspi.yaml
@@ -0,0 +1,135 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/renesas,rzg3e-xspi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas Expanded Serial Peripheral Interface (xSPI)
+
+maintainers:
+  - Biju Das <biju.das.jz@bp.renesas.com>
+
+description: |
+  Renesas xSPI allows a SPI flash connected to the SoC to be accessed via
+  the memory-mapping or the manual command mode.
+
+  The flash chip itself should be represented by a subnode of the XSPI node.
+  The flash interface is selected based on the "compatible" property of this
+  subnode:
+  -  "jedec,spi-nor";
+
+allOf:
+  - $ref: /schemas/spi/spi-controller.yaml#
+
+properties:
+  compatible:
+    const: renesas,r9a09g047-xspi  # RZ/G3E
+
+  reg:
+    items:
+      - description: xSPI registers
+      - description: direct mapping area
+
+  reg-names:
+    items:
+      - const: regs
+      - const: dirmap
+
+  interrupts:
+    items:
+      - description: Interrupt pulse signal by factors excluding errors
+      - description: Interrupt pulse signal by error factors
+
+  interrupt-names:
+    items:
+      - const: pulse
+      - const: err_pulse
+
+  clocks:
+    items:
+      - description: AHB clock
+      - description: AXI clock
+      - description: SPI clock
+      - description: Double speed SPI clock
+
+  clock-names:
+    items:
+      - const: ahb
+      - const: axi
+      - const: spi
+      - const: spix2
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    items:
+      - description: Hardware reset
+      - description: AXI reset
+
+  reset-names:
+    items:
+      - const: hresetn
+      - const: aresetn
+
+  renesas,xspi-cs-addr-sys:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: |
+      Phandle to the system controller (sys) that allows to configure
+      xSPI CS0 and CS1 addresses.
+
+patternProperties:
+  "flash@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+
+    properties:
+      compatible:
+        contains:
+          const: jedec,spi-nor
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+  - clocks
+  - clock-names
+  - power-domains
+  - resets
+  - reset-names
+  - '#address-cells'
+  - '#size-cells'
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/renesas,r9a09g047-cpg.h>
+
+    spi@11030000 {
+        compatible = "renesas,r9a09g047-xspi";
+        reg = <0x11030000 0x10000>, <0x20000000 0x10000000>;
+        reg-names = "regs", "dirmap";
+        interrupts = <GIC_SPI 228 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 229 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "pulse", "err_pulse";
+        clocks = <&cpg CPG_MOD 0x9f>, <&cpg CPG_MOD 0xa0>,
+                 <&cpg CPG_CORE 9>, <&cpg CPG_MOD 0xa1>;
+        clock-names = "ahb", "axi", "spi", "spix2";
+        power-domains = <&cpg>;
+        resets = <&cpg 0xa3>, <&cpg 0xa4>;
+        reset-names = "hresetn", "aresetn";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        flash@0 {
+          compatible = "jedec,spi-nor";
+          reg = <0>;
+          spi-max-frequency = <40000000>;
+          spi-tx-bus-width = <1>;
+          spi-rx-bus-width = <1>;
+        };
+    };
-- 
2.43.0


