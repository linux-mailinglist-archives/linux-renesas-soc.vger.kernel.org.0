Return-Path: <linux-renesas-soc+bounces-13810-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D12A49E54
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Feb 2025 17:08:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BC7FC17373B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Feb 2025 16:08:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17C0F1EA7EE;
	Fri, 28 Feb 2025 16:08:23 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF507188CCA;
	Fri, 28 Feb 2025 16:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740758903; cv=none; b=YLbpKUFA6w0mZ9MIBT2fdmHiFYPVxkqMQYdb+NkIzt/xU1y2fbVkSTGKBkAXAknYbrj5KGto5pm7Vxb5Erd6OoV0dG0Ai9AYhCczKcTGbeoZewHAxuSRWp1UhoMY4vHu79/pFsZB5sC88Lx/nYJ0Hl02uTu4V8VHorhX6xmQIdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740758903; c=relaxed/simple;
	bh=8FtAlja7uu3OCRuQLkNoAerAT/6aDJw+IqM3IRHNZ0c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=izUQeJSRvMIwNYpGNRdiOx815CPhu4gpG/a7LsV2JV3svUqaiKqIq+UAE7jCfwkLBCM36d7ZM6SNz453GDnxqWP8nuvuvnXG/SyfbT2lbSl7FfH31XpcD0dhMO7j6/A5pQDFR5tZ0dgztLjixCmav7Uh0FToZ/myQxo9DBwNbIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: GrBzGrBLRO2Garvikv6+Ig==
X-CSE-MsgGUID: C4sPv18BTEeYXwJTFI1ICw==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 01 Mar 2025 01:08:19 +0900
Received: from localhost.localdomain (unknown [10.226.92.94])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 72842401C3E9;
	Sat,  1 Mar 2025 01:08:16 +0900 (JST)
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
Subject: [PATCH 1/8] dt-bindings: memory: Document RZ/G3E support
Date: Fri, 28 Feb 2025 16:07:55 +0000
Message-ID: <20250228160810.171413-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250228160810.171413-1-biju.das.jz@bp.renesas.com>
References: <20250228160810.171413-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document support for the Expanded Serial Peripheral Interface (xSPI)
Controller in the Renesas RZ/G3E (R9A09G047) SoC.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../memory-controllers/renesas,rz-xspi.yaml   | 137 ++++++++++++++++++
 1 file changed, 137 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/memory-controllers/renesas,rz-xspi.yaml

diff --git a/Documentation/devicetree/bindings/memory-controllers/renesas,rz-xspi.yaml b/Documentation/devicetree/bindings/memory-controllers/renesas,rz-xspi.yaml
new file mode 100644
index 000000000000..84875cd28460
--- /dev/null
+++ b/Documentation/devicetree/bindings/memory-controllers/renesas,rz-xspi.yaml
@@ -0,0 +1,137 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/memory-controllers/renesas,rz-xspi.yaml#
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
+    items:
+      - const: renesas,r9a09g047-xspi  # RZ/G3E
+      - const: renesas,rz-xspi         # a generic RZ xSPI device
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
+      - const: spi_pulse
+      - const: spi_err_pulse
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
+        compatible = "renesas,r9a09g047-xspi", "renesas,rz-xspi";
+        reg = <0x11030000 0x10000>, <0x20000000 0x10000000>;
+        reg-names = "regs", "dirmap";
+        interrupts = <GIC_SPI 228 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 229 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "spi_pulse", "spi_err_pulse";
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


