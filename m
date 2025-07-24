Return-Path: <linux-renesas-soc+bounces-19656-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 03EAFB106D4
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Jul 2025 11:46:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 20290AE8033
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 24 Jul 2025 09:41:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D36E821A42F;
	Thu, 24 Jul 2025 09:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="MeqSrt+a"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CAF923BCF1
	for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Jul 2025 09:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753350115; cv=none; b=U+Ot78fdkBAd4JMBu8nXeX3FpDcfbU5baKgoTq2eD3ROyu2HWL4hhNS7zPwDuEJ4Mfq/n6E3hDkxptSeLmiAR7J38sdseGIr3b3Qz6WmILMPmhk9PFPB0goFP0oPIxpbwOBis/D3J1BMSDa7o9xaIkJJIuaViSSCB7/2L/+22nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753350115; c=relaxed/simple;
	bh=2kB+/ViiQBadVqBH0fumCX7kNWKLUq87LxH72WsWKIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QxOJVl2eQ9exjseTLwPf3BAyPhBaosK77uG0tlumW6nVzX46mW//kdyx20KgzT6xZYhEWwv2Rj7DD+A4Gzl4dISOivkn+Dy6cMaWy5qd1ZsOFiQJ8M8tUxYQ21ui79eye5vwtQFiTtsrbwHrmiIcV1MUf6YT5Kas0jr18SsWf90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=MeqSrt+a; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=mPQCtAY2PWiSk1733xoRQnXAMnPArMUT0zyz5TdJULc=; b=MeqSrt
	+aNkBPyVGzSLj7iauThB4tyQ7/1k73l+q0soFGDmFZN8DTM4HVBWpo3+g+Fqgq1s
	+At15iTnjmP3OKQ3U5UXUfGnwE6rfK/GSSnfHJqNQ5HLlkeEqNwJZUPj+K/XXkO5
	WSgEHvwC0jJ9onXCjYaKKMABMhcLUxcRrT7Iy0BibD7H6zLmOTHNJhzRUy8WC0x+
	hEtTvXaORW3bo3/CAPCU26WTBpoOHm2myAD+znb8+8cun/WqISc3Q1DrvvWJx6HZ
	KOl9Q+KC471UyI9X2G1fWCBwCixwB5nWXtj8R77fiwJif9rmwn2XeCxvW+m7Cs1O
	vy7KE9CMeK705HMA==
Received: (qmail 2016600 invoked from network); 24 Jul 2025 11:41:50 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 24 Jul 2025 11:41:50 +0200
X-UD-Smtp-Session: l3s3148p1@5/17oqk6DJkgAwDPXyBWAATEinPyanBm
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v5 3/4] dt-bindings: i3c: Add Renesas I3C controller
Date: Thu, 24 Jul 2025 11:41:42 +0200
Message-ID: <20250724094146.6443-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250724094146.6443-1-wsa+renesas@sang-engineering.com>
References: <20250724094146.6443-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Add Renesas I3C controller which is available in R9A08G045 (RZ/G3S) and
R9A09G047 (RZ/G3E) SoCs.

Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---

Changes since v4:
* none

 .../devicetree/bindings/i3c/renesas,i3c.yaml  | 179 ++++++++++++++++++
 1 file changed, 179 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i3c/renesas,i3c.yaml

diff --git a/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml b/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
new file mode 100644
index 000000000000..fe2e9633c46f
--- /dev/null
+++ b/Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
@@ -0,0 +1,179 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i3c/renesas,i3c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas RZ/G3S and RZ/G3E I3C Bus Interface
+
+maintainers:
+  - Wolfram Sang <wsa+renesas@sang-engineering.com>
+  - Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - renesas,r9a08g045-i3c # RZ/G3S
+          - renesas,r9a09g047-i3c # RZ/G3E
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    items:
+      - description: Non-recoverable internal error interrupt
+      - description: Normal transfer error interrupt
+      - description: Normal transfer abort interrupt
+      - description: Normal response status buffer full interrupt
+      - description: Normal command buffer empty interrupt
+      - description: Normal IBI status buffer full interrupt
+      - description: Normal Rx data buffer full interrupt
+      - description: Normal Tx data buffer empty interrupt
+      - description: Normal receive status buffer full interrupt
+      - description: START condition detection interrupt
+      - description: STOP condition detection interrupt
+      - description: Transmit end interrupt
+      - description: NACK detection interrupt
+      - description: Arbitration lost interrupt
+      - description: Timeout detection interrupt
+      - description: Wake-up condition detection interrupt
+      - description: HDR Exit Pattern detection interrupt
+    minItems: 16
+
+  interrupt-names:
+    items:
+      - const: ierr
+      - const: terr
+      - const: abort
+      - const: resp
+      - const: cmd
+      - const: ibi
+      - const: rx
+      - const: tx
+      - const: rcv
+      - const: st
+      - const: sp
+      - const: tend
+      - const: nack
+      - const: al
+      - const: tmo
+      - const: wu
+      - const: exit
+    minItems: 16
+
+  clocks:
+    items:
+      - description: APB bus clock
+      - description: transfer clock
+      - description: SFRs clock
+    minItems: 2
+
+  clock-names:
+    items:
+      - const: pclk
+      - const: tclk
+      - const: pclkrw
+    minItems: 2
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    items:
+      - description: Reset signal
+      - description: APB interface reset signal/SCAN reset signal
+
+  reset-names:
+    items:
+      - const: presetn
+      - const: tresetn
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - clock-names
+  - clocks
+  - power-domains
+  - resets
+  - reset-names
+
+allOf:
+  - $ref: i3c.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a08g045-i3c
+    then:
+      properties:
+        clocks:
+          maxItems: 2
+        clock-names:
+          maxItems: 2
+        interrupts:
+          minItems: 17
+        interrupt-names:
+          minItems: 17
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g047-i3c
+    then:
+      properties:
+        clocks:
+          minItems: 3
+        clock-names:
+          minItems: 3
+        interrupts:
+          maxItems: 16
+        interrupt-names:
+          maxItems: 16
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r9a08g045-cpg.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    i3c@1005b000 {
+        compatible = "renesas,r9a08g045-i3c";
+        reg = <0x1005b000 0x1000>;
+        clocks = <&cpg CPG_MOD R9A08G045_I3C_PCLK>,
+                 <&cpg CPG_MOD R9A08G045_I3C_TCLK>;
+        clock-names = "pclk", "tclk";
+        interrupts = <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 294 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 295 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 296 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 297 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 298 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 299 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "ierr", "terr", "abort", "resp",
+                          "cmd", "ibi", "rx", "tx", "rcv",
+                          "st", "sp", "tend", "nack",
+                          "al", "tmo", "wu", "exit";
+        resets = <&cpg R9A08G045_I3C_PRESETN>,
+                 <&cpg R9A08G045_I3C_TRESETN>;
+        reset-names = "presetn", "tresetn";
+        power-domains = <&cpg>;
+        #address-cells = <3>;
+        #size-cells = <0>;
+    };
+...
-- 
2.47.2


