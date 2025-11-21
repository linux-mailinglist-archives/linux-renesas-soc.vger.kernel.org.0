Return-Path: <linux-renesas-soc+bounces-24917-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2DEC78C06
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 12:20:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 98FFE4EFE00
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 21 Nov 2025 11:16:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BE2C34A78C;
	Fri, 21 Nov 2025 11:15:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B92734A77C;
	Fri, 21 Nov 2025 11:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763723723; cv=none; b=K6dxBcL8O/Wr1WRDSFhDOrHaklSiAn5SzUGEhS2QZtzR4VCeRpiyL0ND6VUwGzNcjgR1S2eXwKJmVkJIT87d8w4fuq/aTy4qySXLdPfYZuTR/qyjwGvc+lmKzB4qpQIEXZIIMkPgtH4g/sfXqxe9BgtRGxOGW363t3jdPZTCp/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763723723; c=relaxed/simple;
	bh=1HfaF0aq+DGSJ26urdVVejUDvRknWq+XFEOIORqw7DQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BCFi5CGh4hD3KcixvF2zyut/Vkqu5Jech7gw5O7bkMZJ7s8BT2RFXSrBLr7gLVR0MtteS5rWM0uO43U9QxCdKSdRRnq95IeSg1CoIdXqdhDwVX0MPeT9Fdppd0/AmwsOXPeCEvCgp4D2eMSYzJmfv4FmODrILbdiP2/8d7ZMtAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: QS6s+KwHR0GPYR4x5ukFOQ==
X-CSE-MsgGUID: NwQLI9v9RLe5zA0NLUbUeQ==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 21 Nov 2025 20:15:13 +0900
Received: from demon-pc.localdomain (unknown [10.226.92.224])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 727BD4365DEE;
	Fri, 21 Nov 2025 20:15:09 +0900 (JST)
From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: interrupt-controller: document RZ/{T2H,N2H} ICU
Date: Fri, 21 Nov 2025 13:14:20 +0200
Message-ID: <20251121111423.1379395-2-cosmin-gabriel.tanislav.xa@renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251121111423.1379395-1-cosmin-gabriel.tanislav.xa@renesas.com>
References: <20251121111423.1379395-1-cosmin-gabriel.tanislav.xa@renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Renesas RZ/T2H (R9A09G077) and Renesas RZ/N2H (R9A09G087) SoCs have
an Interrupt Controller (ICU) block that routes external interrupts to
the GIC's SPIs, with the ability of level-translation, and can also
produce software interrupts and aggregate error interrupts.

It has 16 software triggered interrupts (INTCPUn), 16 external pin
interrupts (IRQn), a System error interrupt (SEI), two Cortex-A55 error
interrupts (CA55_ERRn), two Cortex-R52 error interrupts for each of the
two cores (CR52x_ERRn), two Peripheral error interrupts (PERI_ERRn),
two DSMIF error interrupts (DSMIF_ERRn), and two ENCIF error interrupts
(ENCIF_ERRn).

The IRQn and SEI interrupts are exposed externally, while the others
are software triggered.

INTCPU0 to INTCPU13, IRQ 0 to IRQ13 are non-safety interrupts, while
INTCPU14, INTCPU15, IRQ14, IRQ15 and SEI are safety interrupts, and are
exposed via a separate register space.

Document them, and use RZ/T2H as a fallback for RZ/N2H as the ICU is
entirely compatible.

Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
---
 .../renesas,r9a09g077-icu.yaml                | 236 ++++++++++++++++++
 1 file changed, 236 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,r9a09g077-icu.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,r9a09g077-icu.yaml b/Documentation/devicetree/bindings/interrupt-controller/renesas,r9a09g077-icu.yaml
new file mode 100644
index 000000000000..8ccdfc51ae3f
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,r9a09g077-icu.yaml
@@ -0,0 +1,236 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/renesas,r9a09g077-icu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/{T2H,N2H} Interrupt Controller
+
+maintainers:
+  - Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
+
+allOf:
+  - $ref: /schemas/interrupt-controller.yaml#
+
+description:
+  The Interrupt Controller (ICU) handles software-triggered interrupts
+  (INTCPU), external interrupts (IRQ and SEI), error interrupts and DMAC
+  requests.
+
+properties:
+  compatible:
+    oneOf:
+      - const: renesas,r9a09g077-icu # RZ/T2H
+
+      - items:
+          - enum:
+              - renesas,r9a09g087-icu # RZ/N2H
+          - const: renesas,r9a09g077-icu
+
+  '#interrupt-cells':
+    description: The first cell is the SPI number of the interrupt, as per user
+      manual. The second cell is used to specify the flag.
+    const: 2
+
+  '#address-cells':
+    const: 0
+
+  interrupt-controller: true
+
+  reg:
+    items:
+      - description: Non-safety registers (INTCPU0-13, IRQ0-13)
+      - description: Safety registers (INTCPU14-15, IRQ14-15, SEI)
+
+  interrupts:
+    items:
+      - description: Software interrupt 0
+      - description: Software interrupt 1
+      - description: Software interrupt 2
+      - description: Software interrupt 3
+      - description: Software interrupt 4
+      - description: Software interrupt 5
+      - description: Software interrupt 6
+      - description: Software interrupt 7
+      - description: Software interrupt 8
+      - description: Software interrupt 9
+      - description: Software interrupt 10
+      - description: Software interrupt 11
+      - description: Software interrupt 12
+      - description: Software interrupt 13
+      - description: Software interrupt 14
+      - description: Software interrupt 15
+      - description: External pin interrupt 0
+      - description: External pin interrupt 1
+      - description: External pin interrupt 2
+      - description: External pin interrupt 3
+      - description: External pin interrupt 4
+      - description: External pin interrupt 5
+      - description: External pin interrupt 6
+      - description: External pin interrupt 7
+      - description: External pin interrupt 8
+      - description: External pin interrupt 9
+      - description: External pin interrupt 10
+      - description: External pin interrupt 11
+      - description: External pin interrupt 12
+      - description: External pin interrupt 13
+      - description: External pin interrupt 14
+      - description: External pin interrupt 15
+      - description: System error interrupt
+      - description: Cortex-A55 error event 0
+      - description: Cortex-A55 error event 1
+      - description: Cortex-R52 CPU 0 error event 0
+      - description: Cortex-R52 CPU 0 error event 1
+      - description: Cortex-R52 CPU 1 error event 0
+      - description: Cortex-R52 CPU 1 error event 1
+      - description: Peripherals error event 0
+      - description: Peripherals error event 1
+      - description: DSMIF error event 0
+      - description: DSMIF error event 1
+      - description: ENCIF error event 0
+      - description: ENCIF error event 1
+
+  interrupt-names:
+    items:
+      - const: intcpu0
+      - const: intcpu1
+      - const: intcpu2
+      - const: intcpu3
+      - const: intcpu4
+      - const: intcpu5
+      - const: intcpu6
+      - const: intcpu7
+      - const: intcpu8
+      - const: intcpu9
+      - const: intcpu10
+      - const: intcpu11
+      - const: intcpu12
+      - const: intcpu13
+      - const: intcpu14
+      - const: intcpu15
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
+      - const: sei
+      - const: ca55-err0
+      - const: ca55-err1
+      - const: cr520-err0
+      - const: cr520-err1
+      - const: cr521-err0
+      - const: cr521-err1
+      - const: peri-err0
+      - const: peri-err1
+      - const: dsmif-err0
+      - const: dsmif-err1
+      - const: encif-err0
+      - const: encif-err1
+
+  clocks:
+    maxItems: 1
+
+  power-domains:
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
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h>
+
+    icu: interrupt-controller@802a0000 {
+      compatible = "renesas,r9a09g077-icu";
+      reg = <0x802a0000 0x10000>,
+            <0x812a0000 0x50>;
+      #interrupt-cells = <2>;
+      #address-cells = <0>;
+      interrupt-controller;
+      interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 1 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 2 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 3 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 4 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 5 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 6 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 7 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 8 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 9 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 10 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 11 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 12 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 13 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 14 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 15 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 16 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 17 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 18 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 19 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 20 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 21 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 22 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 23 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 24 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 25 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 26 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 27 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 28 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 29 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 30 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 31 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 406 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 407 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 408 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 409 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 410 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 411 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 412 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 413 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 414 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 415 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 416 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 417 IRQ_TYPE_EDGE_RISING>,
+                   <GIC_SPI 418 IRQ_TYPE_EDGE_RISING>;
+      interrupt-names = "intcpu0", "intcpu1", "intcpu2",
+                        "intcpu3", "intcpu4", "intcpu5",
+                        "intcpu6", "intcpu7", "intcpu8",
+                        "intcpu9", "intcpu10", "intcpu11",
+                        "intcpu12", "intcpu13", "intcpu14",
+                        "intcpu15",
+                        "irq0", "irq1", "irq2", "irq3",
+                        "irq4", "irq5", "irq6", "irq7",
+                        "irq8", "irq9", "irq10", "irq11",
+                        "irq12", "irq13", "irq14", "irq15",
+                        "sei",
+                        "ca55-err0", "ca55-err1",
+                        "cr520-err0", "cr520-err1",
+                        "cr521-err0", "cr521-err1",
+                        "peri-err0", "peri-err1",
+                        "dsmif-err0", "dsmif-err1",
+                        "encif-err0", "encif-err1";
+      clocks = <&cpg CPG_CORE R9A09G077_CLK_PCLKM>;
+      power-domains = <&cpg>;
+    };
-- 
2.52.0


