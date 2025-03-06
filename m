Return-Path: <linux-renesas-soc+bounces-14110-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2006DA55241
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 18:06:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F5CC3A1D3D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  6 Mar 2025 17:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0CF025A65F;
	Thu,  6 Mar 2025 17:05:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F1857FD;
	Thu,  6 Mar 2025 17:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741280725; cv=none; b=dH1g99xdxPeCapnQO/SnV1d2ADd/50ONxmb1h9vmQZ9dhz4i3R/Gvib1X/fA0stsCEAP9ugUXg89/wn9aQqs1n39DMuCB3EJRXz5oQewIv9afGW4ED4y6yLge+tJ0ipYkxidiOvTB0LXLcejCbYjI1ut3Chrt974SityiE91QQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741280725; c=relaxed/simple;
	bh=oPL7AcdLFNWLlMSc6qEktyyBhLnlf5M3wTvbx3Kf2Hs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NoohrT3LczQxGju+66jSL8Nu3VcdNVBnV757S0u2m4kTCMx7u3MNyYWjsrg0s883L7h1H0jacaXnIK8HPcBIADUbc2tZdCE+0sVRkkS3777HeNa6sk5Tnc8N8I5u7UChhZhTPnoT6vzTMPogrKe+QMw+WjiWfM3DwQp1dP1wQ6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: S1NlkesqTYKSQ1hDd3zluQ==
X-CSE-MsgGUID: uzXnZlP3TBCitPS2TlBYOg==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 07 Mar 2025 02:05:21 +0900
Received: from localhost.localdomain (unknown [10.226.92.10])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id D1E49401C948;
	Fri,  7 Mar 2025 02:05:18 +0900 (JST)
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
Subject: [PATCH v2 1/8] dt-bindings: memory: Document RZ/G3E support
Date: Thu,  6 Mar 2025 17:04:59 +0000
Message-ID: <20250306170512.241128-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250306170512.241128-1-biju.das.jz@bp.renesas.com>
References: <20250306170512.241128-1-biju.das.jz@bp.renesas.com>
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
index 000000000000..4d5aa5812d74
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
+    #include <dt-bindings/clock/renesas-cpg-mssr.h>
+
+    spi@11030000 {
+        compatible = "renesas,r9a09g047-xspi";
+        reg = <0x11030000 0x10000>, <0x20000000 0x10000000>;
+        reg-names = "regs", "dirmap";
+        interrupts = <GIC_SPI 228 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 229 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "pulse", "err_pulse";
+        clocks = <&cpg CPG_MOD 0x9f>, <&cpg CPG_MOD 0xa0>,
+                 <&cpg CPG_MOD 0xa1>, <&cpg CPG_MOD 0xa1>;
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


