Return-Path: <linux-renesas-soc+bounces-8980-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DA96D97B394
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Sep 2024 19:33:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FCB0283AE1
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Sep 2024 17:33:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F8BA188A0B;
	Tue, 17 Sep 2024 17:33:27 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B5298248C;
	Tue, 17 Sep 2024 17:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726594407; cv=none; b=EYVmxjFW9OAe7s7SBN97Y5k9rM4Y6e/LbTOPfsyHbPshwtRK2QKCal7hEJkLljP5hx8ShSDEqASOiCPHandOeTtmYmg8WIRumJUuyElyc+bmEcR7xioAWGhu4dIUNv7ubo9IpoPl5m6aVU74+WX6jhRjcJ/QXUW2hkzDFEIT7fU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726594407; c=relaxed/simple;
	bh=9B6K+3L64cQILWuCY3uI3uycgRjBfnYDUEolC4TKC20=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RpLQPRU96T5lG/ftS9vE45ZsrpBX3n/8e0OhrUHUnLmeL7FMDAhkFrK59ptSzi/1Nlkj2KGWUwgZ/KfoMl4njBcTCBoQZTmqABX/IKOlVFIyh8Eh+V4nxdti40hxP8VJ//8yJlHYpsD/i5U2+OWuzdznvTTHPwgApdvLjes4Mmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-IronPort-AV: E=Sophos;i="6.10,235,1719846000"; 
   d="scan'208";a="222945900"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 18 Sep 2024 02:33:24 +0900
Received: from mulinux.example.org (unknown [10.226.92.130])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 8740D4011F7F;
	Wed, 18 Sep 2024 02:33:20 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Chris Paterson <Chris.Paterson2@renesas.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 3/6] dt-bindings: interrupt-controller: Add Renesas RZ/V2H(P) Interrupt Controller
Date: Tue, 17 Sep 2024 18:32:46 +0100
Message-Id: <20240917173249.158920-4-fabrizio.castro.jz@renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240917173249.158920-1-fabrizio.castro.jz@renesas.com>
References: <20240917173249.158920-1-fabrizio.castro.jz@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add DT bindings for the Renesas RZ/V2H(P) Interrupt Controller.

Also add macros for the NMI and IRQ0-15 interrupts which map the
SPI0-16 interrupts on the RZ/V2H(P) SoC so that they can be
used in the first cell of the interrupt specifiers.

For the second cell of the interrupt specifier, since NMI, IRQn
and TINTn support different types of interrupts between themselves,
add helper macros to make it easier for the user to work out what's
available.

Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
---
 .../renesas,rzv2h-icu.yaml                    | 278 ++++++++++++++++++
 .../interrupt-controller/icu-rzv2h.h          |  48 +++
 2 files changed, 326 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,rzv2h-icu.yaml
 create mode 100644 include/dt-bindings/interrupt-controller/icu-rzv2h.h

diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,rzv2h-icu.yaml b/Documentation/devicetree/bindings/interrupt-controller/renesas,rzv2h-icu.yaml
new file mode 100644
index 000000000000..28f5b2f30c31
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,rzv2h-icu.yaml
@@ -0,0 +1,278 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/renesas,rzv2h-icu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/V2H(P) Interrupt Control Unit
+
+maintainers:
+  - Fabrizio Castro <fabrizio.castro.jz@renesas.com>
+  - Geert Uytterhoeven <geert+renesas@glider.be>
+
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
+description: |
+  The Interrupt Control Unit (ICU) handles external interrupts (NMI, IRQ, and
+  TINT), error interrupts, DMAC requests, GPT interrupts, and internal
+  interrupts.
+  It notifies GIC of the relevant interrupts.
+
+properties:
+  compatible:
+    const: renesas,r9a09g057-icu          # RZ/V2H(P)
+
+  '#interrupt-cells':
+    description: The first cell should contain a macro RZV2H_{NMI,IRQn} from
+                 file include/dt-bindings/interrupt-controller/icu-rzv2h.h,
+                 and the second cell is used to specify the flag. Helper macros
+                 for the second cell can also be found in the same header file.
+    const: 2
+
+  '#address-cells':
+    const: 0
+
+  interrupt-controller: true
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 58
+    items:
+      - description: NMI interrupt
+      - description: IRQ0 interrupt
+      - description: IRQ1 interrupt
+      - description: IRQ2 interrupt
+      - description: IRQ3 interrupt
+      - description: IRQ4 interrupt
+      - description: IRQ5 interrupt
+      - description: IRQ6 interrupt
+      - description: IRQ7 interrupt
+      - description: IRQ8 interrupt
+      - description: IRQ9 interrupt
+      - description: IRQ10 interrupt
+      - description: IRQ11 interrupt
+      - description: IRQ12 interrupt
+      - description: IRQ13 interrupt
+      - description: IRQ14 interrupt
+      - description: IRQ15 interrupt
+      - description: GPIO interrupt, TINT0
+      - description: GPIO interrupt, TINT1
+      - description: GPIO interrupt, TINT2
+      - description: GPIO interrupt, TINT3
+      - description: GPIO interrupt, TINT4
+      - description: GPIO interrupt, TINT5
+      - description: GPIO interrupt, TINT6
+      - description: GPIO interrupt, TINT7
+      - description: GPIO interrupt, TINT8
+      - description: GPIO interrupt, TINT9
+      - description: GPIO interrupt, TINT10
+      - description: GPIO interrupt, TINT11
+      - description: GPIO interrupt, TINT12
+      - description: GPIO interrupt, TINT13
+      - description: GPIO interrupt, TINT14
+      - description: GPIO interrupt, TINT15
+      - description: GPIO interrupt, TINT16
+      - description: GPIO interrupt, TINT17
+      - description: GPIO interrupt, TINT18
+      - description: GPIO interrupt, TINT19
+      - description: GPIO interrupt, TINT20
+      - description: GPIO interrupt, TINT21
+      - description: GPIO interrupt, TINT22
+      - description: GPIO interrupt, TINT23
+      - description: GPIO interrupt, TINT24
+      - description: GPIO interrupt, TINT25
+      - description: GPIO interrupt, TINT26
+      - description: GPIO interrupt, TINT27
+      - description: GPIO interrupt, TINT28
+      - description: GPIO interrupt, TINT29
+      - description: GPIO interrupt, TINT30
+      - description: GPIO interrupt, TINT31
+      - description: Software interrupt, INTA55_0
+      - description: Software interrupt, INTA55_1
+      - description: Software interrupt, INTA55_2
+      - description: Software interrupt, INTA55_3
+      - description: Error interrupt to CA55
+      - description: GTCCRA compare match/input capture (U0)
+      - description: GTCCRB compare match/input capture (U0)
+      - description: GTCCRA compare match/input capture (U1)
+      - description: GTCCRB compare match/input capture (U1)
+
+  interrupt-names:
+    minItems: 58
+    items:
+      - const: nmi
+      - const: irq0
+      - const: irq1
+      - const: irq2
+      - const: irq3
+      - const: irq4
+      - const: irq5
+      - const: irq6
+      - const: irq7
+      - const: irq8
+      - const: irq9
+      - const: irq10
+      - const: irq11
+      - const: irq12
+      - const: irq13
+      - const: irq14
+      - const: irq15
+      - const: tint0
+      - const: tint1
+      - const: tint2
+      - const: tint3
+      - const: tint4
+      - const: tint5
+      - const: tint6
+      - const: tint7
+      - const: tint8
+      - const: tint9
+      - const: tint10
+      - const: tint11
+      - const: tint12
+      - const: tint13
+      - const: tint14
+      - const: tint15
+      - const: tint16
+      - const: tint17
+      - const: tint18
+      - const: tint19
+      - const: tint20
+      - const: tint21
+      - const: tint22
+      - const: tint23
+      - const: tint24
+      - const: tint25
+      - const: tint26
+      - const: tint27
+      - const: tint28
+      - const: tint29
+      - const: tint30
+      - const: tint31
+      - const: int-ca55-0
+      - const: int-ca55-1
+      - const: int-ca55-2
+      - const: int-ca55-3
+      - const: icu-error-ca55
+      - const: gpt-u0-gtciada
+      - const: gpt-u0-gtciadb
+      - const: gpt-u1-gtciada
+      - const: gpt-u1-gtciadb
+
+  clocks:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - '#interrupt-cells'
+  - '#address-cells'
+  - interrupt-controller
+  - interrupts
+  - interrupt-names
+  - clocks
+  - power-domains
+  - resets
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/renesas-cpg-mssr.h>
+
+    icu: interrupt-controller@10400000 {
+        compatible = "renesas,r9a09g057-icu";
+        reg = <0x10400000 0x10000>;
+        #interrupt-cells = <2>;
+        #address-cells = <0>;
+        interrupt-controller;
+        interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 419 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 420 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 421 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 425 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 426 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 427 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 428 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 429 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 430 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 431 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 432 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 433 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 434 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 435 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 436 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 437 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 438 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 439 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 440 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 441 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 442 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 443 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 444 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 445 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 446 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 447 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 450 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 263 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 264 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 265 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 451 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 452 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 453 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 454 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "nmi",
+                          "irq0", "irq1", "irq2", "irq3",
+                          "irq4", "irq5", "irq6", "irq7",
+                          "irq8", "irq9", "irq10", "irq11",
+                          "irq12", "irq13", "irq14", "irq15",
+                          "tint0", "tint1", "tint2", "tint3",
+                          "tint4", "tint5", "tint6", "tint7",
+                          "tint8", "tint9", "tint10", "tint11",
+                          "tint12", "tint13", "tint14", "tint15",
+                          "tint16", "tint17", "tint18", "tint19",
+                          "tint20", "tint21", "tint22", "tint23",
+                          "tint24", "tint25", "tint26", "tint27",
+                          "tint28", "tint29", "tint30", "tint31",
+                          "int-ca55-0", "int-ca55-1",
+                          "int-ca55-2", "int-ca55-3",
+                          "icu-error-ca55",
+                          "gpt-u0-gtciada", "gpt-u0-gtciadb",
+                          "gpt-u1-gtciada", "gpt-u1-gtciadb";
+        clocks = <&cpg CPG_MOD 0x5>;
+        power-domains = <&cpg>;
+        resets = <&cpg 0x36>;
+    };
diff --git a/include/dt-bindings/interrupt-controller/icu-rzv2h.h b/include/dt-bindings/interrupt-controller/icu-rzv2h.h
new file mode 100644
index 000000000000..5d1e7bb256cd
--- /dev/null
+++ b/include/dt-bindings/interrupt-controller/icu-rzv2h.h
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * This header provides constants for Renesas RZ/V2H(P) SoC ICU bindings.
+ *
+ * Copyright (C) 2024 Renesas Electronics Corp.
+ *
+ */
+
+#ifndef __DT_BINDINGS_ICU_RZV2H_H
+#define __DT_BINDINGS_ICU_RZV2H_H
+
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/* NMI maps to SPI0 */
+#define RZV2H_NMI	0
+
+/* IRQ0-15 map to SPI1-16 */
+#define RZV2H_IRQ0	1
+#define RZV2H_IRQ1	2
+#define RZV2H_IRQ2	3
+#define RZV2H_IRQ3	4
+#define RZV2H_IRQ4	5
+#define RZV2H_IRQ5	6
+#define RZV2H_IRQ6	7
+#define RZV2H_IRQ7	8
+#define RZV2H_IRQ8	9
+#define RZV2H_IRQ9	10
+#define RZV2H_IRQ10	11
+#define RZV2H_IRQ11	12
+#define RZV2H_IRQ12	13
+#define RZV2H_IRQ13	14
+#define RZV2H_IRQ14	15
+#define RZV2H_IRQ15	16
+
+#define RZV2H_NMI_TYPE_EDGE_RISING		IRQ_TYPE_EDGE_RISING
+#define RZV2H_NMI_TYPE_EDGE_FALLING		IRQ_TYPE_EDGE_FALLING
+
+#define RZV2H_IRQ_TYPE_EDGE_RISING		IRQ_TYPE_EDGE_RISING
+#define RZV2H_IRQ_TYPE_EDGE_FALLING		IRQ_TYPE_EDGE_FALLING
+#define RZV2H_IRQ_TYPE_EDGE_BOTH		IRQ_TYPE_EDGE_BOTH
+#define RZV2H_IRQ_TYPE_LEVEL_LOW		IRQ_TYPE_LEVEL_LOW
+
+#define RZV2H_TINT_TYPE_EDGE_RISING		IRQ_TYPE_EDGE_RISING
+#define RZV2H_TINT_TYPE_EDGE_FALLING		IRQ_TYPE_EDGE_FALLING
+#define RZV2H_TINT_TYPE_LEVEL_HIGH		IRQ_TYPE_LEVEL_HIGH
+#define RZV2H_TINT_TYPE_LEVEL_LOW		IRQ_TYPE_LEVEL_LOW
+
+#endif /* __DT_BINDINGS_ICU_RZV2H_H */
-- 
2.34.1


