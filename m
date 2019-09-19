Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 661A1B806A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 19 Sep 2019 19:48:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391161AbfISRsy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 19 Sep 2019 13:48:54 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:45617 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389433AbfISRsy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Sep 2019 13:48:54 -0400
Received: by mail-pf1-f195.google.com with SMTP id y72so2759671pfb.12;
        Thu, 19 Sep 2019 10:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=WWmTlVWMQmrXkfIJGz2eD08m1rMS2eN5iQn1Px5uO2k=;
        b=VCH+gi2NtmNx8dnH2TxKGnhMGM3SjLFTyEvHrCzMici0HFo7isL27uznwxOi45MAws
         GEtAD16rlZPlC6TMKVJ4kc9r082NisrWzK9LAOn/QPS8bt73gDTvYx+bE3xPxDCpdzpV
         XW2Bodzj90LLVKdO0LBovP24rkVXDOhNchxlc+PgMFl7bAFibnwUQlxieGIkKANqwYno
         QEKMFAheGqIn5oGqS4HDdZwPycOacznyrJ5hEl4qze+59aIh5txe0xFmW0ZOxrbW+Hv3
         aVy01GVCv7nU7tzdkcmtk1WMuf/Z4Bn6ebg/L7rfKp3RjLuiAUooc3sqwcJ5Z42vG6c5
         krzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=WWmTlVWMQmrXkfIJGz2eD08m1rMS2eN5iQn1Px5uO2k=;
        b=Ha7oV8fQoYaDZ61dFS8nRCfGldK99J9tOkghBN1YnhLNftq41hN56m5G3pE27QNDBo
         LGTl1qygNFnvSAIhNA2QzQZMWjeOyK8PUmT4RLiiANDkznzgOKxvsMQK1VxL3iBW4hx2
         mZV8wdE2+u+DGCiSJEe2rISCq6efNbz0b8aMB1UBVGapo5b+mDOD1FSc1XUJ1lV/A/2u
         LYSY5nttOhc2UVKTng52ENpZCsX5xAUl+5YGN1gBXZ/N526AwYkOW0M7siPCDUoyTFf8
         uW9Cb62N5/lyDQpE/hx6sgXn+6PfbiRsDgs0gpr1X2hemb39lf8e1ebqm8o4eQGPJAgU
         gPVg==
X-Gm-Message-State: APjAAAVVr3MRYd4svgIn9M3XxM6CqfwBm0OwlbJXkkMrJ/YjxHcRNPPZ
        hSI4QcaBb3O4LN5nBp0SPCGBHp6L
X-Google-Smtp-Source: APXvYqznTAI7wCsgsHfKK5sZLELb7oKReKXSmjgLF63Hlwe/o2IBnx7/+TYtihm7OR2LJBv15S10Ow==
X-Received: by 2002:a63:475d:: with SMTP id w29mr10371135pgk.46.1568915333306;
        Thu, 19 Sep 2019 10:48:53 -0700 (PDT)
Received: from localhost.localdomain (KD118155013174.ppp-bb.dion.ne.jp. [118.155.13.174])
        by smtp.gmail.com with ESMTPSA id z19sm8654562pgv.35.2019.09.19.10.48.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 19 Sep 2019 10:48:52 -0700 (PDT)
From:   Yoshihiro Kaneko <ykaneko0929@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Rob Herring <robh@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org
Subject: [PATCH v3] dt-bindings: irqchip: renesas-irqc: convert bindings to json-schema
Date:   Fri, 20 Sep 2019 02:48:31 +0900
Message-Id: <1568915311-28928-1-git-send-email-ykaneko0929@gmail.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Convert Renesas Interrupt Controller bindings documentation to json-schema.

Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---

v3
- Add interrups to required.
- Update the example to according to the current implementation.

v2
- Add SPDX tag.
- Document interrupt-contoller, reg, interrupts, power-domains and resets
  properties.
- Add addtionalProperties.

---
 .../bindings/interrupt-controller/renesas,irqc.txt | 48 ------------
 .../interrupt-controller/renesas,irqc.yaml         | 86 ++++++++++++++++++++++
 2 files changed, 86 insertions(+), 48 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt b/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt
deleted file mode 100644
index f977ea7..0000000
--- a/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.txt
+++ /dev/null
@@ -1,48 +0,0 @@
-DT bindings for the R-Mobile/R-Car/RZ/G interrupt controller
-
-Required properties:
-
-- compatible: must be "renesas,irqc-<soctype>" or "renesas,intc-ex-<soctype>",
-	      and "renesas,irqc" as fallback.
-  Examples with soctypes are:
-    - "renesas,irqc-r8a73a4" (R-Mobile APE6)
-    - "renesas,irqc-r8a7743" (RZ/G1M)
-    - "renesas,irqc-r8a7744" (RZ/G1N)
-    - "renesas,irqc-r8a7745" (RZ/G1E)
-    - "renesas,irqc-r8a77470" (RZ/G1C)
-    - "renesas,irqc-r8a7790" (R-Car H2)
-    - "renesas,irqc-r8a7791" (R-Car M2-W)
-    - "renesas,irqc-r8a7792" (R-Car V2H)
-    - "renesas,irqc-r8a7793" (R-Car M2-N)
-    - "renesas,irqc-r8a7794" (R-Car E2)
-    - "renesas,intc-ex-r8a774a1" (RZ/G2M)
-    - "renesas,intc-ex-r8a774c0" (RZ/G2E)
-    - "renesas,intc-ex-r8a7795" (R-Car H3)
-    - "renesas,intc-ex-r8a7796" (R-Car M3-W)
-    - "renesas,intc-ex-r8a77965" (R-Car M3-N)
-    - "renesas,intc-ex-r8a77970" (R-Car V3M)
-    - "renesas,intc-ex-r8a77980" (R-Car V3H)
-    - "renesas,intc-ex-r8a77990" (R-Car E3)
-    - "renesas,intc-ex-r8a77995" (R-Car D3)
-- #interrupt-cells: has to be <2>: an interrupt index and flags, as defined in
-  interrupts.txt in this directory
-- clocks: Must contain a reference to the functional clock.
-
-Optional properties:
-
-- any properties, listed in interrupts.txt, and any standard resource allocation
-  properties
-
-Example:
-
-	irqc0: interrupt-controller@e61c0000 {
-		compatible = "renesas,irqc-r8a7790", "renesas,irqc";
-		#interrupt-cells = <2>;
-		interrupt-controller;
-		reg = <0 0xe61c0000 0 0x200>;
-		interrupts = <0 0 IRQ_TYPE_LEVEL_HIGH>,
-			     <0 1 IRQ_TYPE_LEVEL_HIGH>,
-			     <0 2 IRQ_TYPE_LEVEL_HIGH>,
-			     <0 3 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&mstp4_clks R8A7790_CLK_IRQC>;
-	};
diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.yaml b/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.yaml
new file mode 100644
index 0000000..92f9f4d
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/renesas,irqc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: DT bindings for the R-Mobile/R-Car/RZ/G interrupt controller
+
+maintainers:
+  - Geert Uytterhoeven <geert+renesas@glider.be>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - renesas,irqc-r8a73a4        # R-Mobile APE6
+          - renesas,irqc-r8a7743        # RZ/G1M
+          - renesas,irqc-r8a7744        # RZ/G1N
+          - renesas,irqc-r8a7745        # RZ/G1E
+          - renesas,irqc-r8a77470       # RZ/G1C
+          - renesas,irqc-r8a7790        # R-Car H2
+          - renesas,irqc-r8a7791        # R-Car M2-W
+          - renesas,irqc-r8a7792        # R-Car V2H
+          - renesas,irqc-r8a7793        # R-Car M2-N
+          - renesas,irqc-r8a7794        # R-Car E2
+          - renesas,intc-ex-r8a774a1    # RZ/G2M
+          - renesas,intc-ex-r8a774c0    # RZ/G2E
+          - renesas,intc-ex-r8a7795     # R-Car H3
+          - renesas,intc-ex-r8a7796     # R-Car M3-W
+          - renesas,intc-ex-r8a77965    # R-Car M3-N
+          - renesas,intc-ex-r8a77970    # R-Car V3M
+          - renesas,intc-ex-r8a77980    # R-Car V3H
+          - renesas,intc-ex-r8a77990    # R-Car E3
+          - renesas,intc-ex-r8a77995    # R-Car D3
+      - const: renesas,irqc
+
+  '#interrupt-cells':
+    # an interrupt index and flags, as defined in interrupts.txt in
+    # this directory
+    const: 2
+
+  interrupt-controller: true
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 1
+    maxItems: 32
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
+  - '#interrupt-cells'
+  - interrupt-controller
+  - reg
+  - interrupts
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r8a7790-cpg-mssr.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    irqc0: interrupt-controller@e61c0000 {
+        compatible = "renesas,irqc-r8a7790", "renesas,irqc";
+        #interrupt-cells = <2>;
+        interrupt-controller;
+        reg = <0 0xe61c0000 0 0x200>;
+        interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&cpg CPG_MOD 407>;
+    };
-- 
1.9.1

