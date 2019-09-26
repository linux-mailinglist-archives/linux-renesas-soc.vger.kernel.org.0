Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DFA2BFA5A
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Sep 2019 22:00:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727840AbfIZUAJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Sep 2019 16:00:09 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:38866 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727764AbfIZUAJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Sep 2019 16:00:09 -0400
Received: by mail-pl1-f193.google.com with SMTP id w10so88169plq.5;
        Thu, 26 Sep 2019 13:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=4LgOlMCcWiDoUkRX/z8btdsD3PNOaBlbEV7cwFphb10=;
        b=usZZ3neZAPyQDf+SKAfTPEIKu9o+dAnjlSB61Y03oFrK9UbMKQdLV/20fzRGak0zBg
         Bxjczzw4jqalzEZanJ3nXrVJtaVsAQwfUHhSc0qTwItKPo95fof5IuWSkFBayTxjp20/
         7bZCkWL0a+BkSIh20hES3QJBfEOzkkt0U5PU8JmoMpDoO4npifvx+5Ez3da9FX1ZrGKS
         EC3Rp7Ph0ra+KWCdu4WIrHycwghxTrt63jG28aj+UqjNeXXycc+PyaZnOkvh9m/EoF/T
         W1vDyXGGP/fXtnwlNjTYDLcwMZnbBiWhyE8SbsGCNhZ+cNYW1bnslsh16qYzOHBnCW1D
         ZxKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=4LgOlMCcWiDoUkRX/z8btdsD3PNOaBlbEV7cwFphb10=;
        b=skm8UUZ1EwyyRjg4c3f+VOaEHD3Su6lp/KQQCH18fDLzqyInK7dPV1e/EcT/+MfiyH
         qMC0dN8qeUHUCTBCUoSZMiZbqzl6NJnBEDkRlT5NZOo8z0Q/SnYLbpNMMdRobFYp20gc
         jpoTPOrFxtGSoKAbkPeOJSWyOYmat3XqofWf3qlCQAiA1tuY1HdvSFmZMfhKptPyUJSo
         UJNksdb/MCPnCU4v1MSmUZt/HXIF4DlvfUFBgkJ20F8YZHFsemAYnnUkRUXNXq02GKh7
         JhPUES4LYEz4Zol1exfznNwaLOUQp+rrisylEzyUd6vxvSE50iKJz0X5YGOlvFDE06VK
         ffxw==
X-Gm-Message-State: APjAAAW9guo7aNPXLtTbXf9g+kYLxe2e27myUVqIpxKqCptrBTm0FFeB
        Kd1cvfQt2HXuxOPRdrrDO9gdvtvc
X-Google-Smtp-Source: APXvYqzVzRkqMPUAktqY/FikmcdCE5a2QXO3Eq0s2utLcbR0QHsIcAuvFcGrXYski93dR0xO4NZfOA==
X-Received: by 2002:a17:902:ab90:: with SMTP id f16mr307228plr.191.1569528006739;
        Thu, 26 Sep 2019 13:00:06 -0700 (PDT)
Received: from localhost.localdomain (KD118155013174.ppp-bb.dion.ne.jp. [118.155.13.174])
        by smtp.gmail.com with ESMTPSA id v44sm8653934pgn.17.2019.09.26.13.00.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 26 Sep 2019 13:00:06 -0700 (PDT)
From:   Yoshihiro Kaneko <ykaneko0929@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Rob Herring <robh@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org
Subject: [PATCH v2] dt-bindings: irqchip: renesas: intc-irqpin: convert bindings to json-schema
Date:   Fri, 27 Sep 2019 04:59:37 +0900
Message-Id: <1569527977-21213-1-git-send-email-ykaneko0929@gmail.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Convert R-/SH-Mobile IRQPin Controller bindings documentation to json-schema.

Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---

v2
- correct Geert-san's E-mail address.
- delete Guennadi-san from the maintainer of this binding.
- give 'sense-bitfield-width' the uint32 type.
- describe 'control-parent' property as a boolean.

 .../interrupt-controller/renesas,intc-irqpin.txt   |  62 -------------
 .../interrupt-controller/renesas,intc-irqpin.yaml  | 102 +++++++++++++++++++++
 2 files changed, 102 insertions(+), 62 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.txt
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.txt b/Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.txt
deleted file mode 100644
index 772c550..0000000
--- a/Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.txt
+++ /dev/null
@@ -1,62 +0,0 @@
-DT bindings for the R-/SH-Mobile irqpin controller
-
-Required properties:
-
-- compatible: has to be "renesas,intc-irqpin-<soctype>", "renesas,intc-irqpin"
-  as fallback.
-  Examples with soctypes are:
-    - "renesas,intc-irqpin-r8a7740" (R-Mobile A1)
-    - "renesas,intc-irqpin-r8a7778" (R-Car M1A)
-    - "renesas,intc-irqpin-r8a7779" (R-Car H1)
-    - "renesas,intc-irqpin-sh73a0" (SH-Mobile AG5)
-
-- reg: Base address and length of each register bank used by the external
-  IRQ pins driven by the interrupt controller hardware module. The base
-  addresses, length and number of required register banks varies with soctype.
-- interrupt-controller: Identifies the node as an interrupt controller.
-- #interrupt-cells: has to be <2>: an interrupt index and flags, as defined in
-  interrupts.txt in this directory.
-- interrupts: Must contain a list of interrupt specifiers. For each interrupt
-  provided by this irqpin controller instance, there must be one entry,
-  referring to the corresponding parent interrupt.
-
-Optional properties:
-
-- any properties, listed in interrupts.txt, and any standard resource allocation
-  properties
-- sense-bitfield-width: width of a single sense bitfield in the SENSE register,
-  if different from the default 4 bits
-- control-parent: disable and enable interrupts on the parent interrupt
-  controller, needed for some broken implementations
-- clocks: Must contain a reference to the functional clock.  This property is
-  mandatory if the hardware implements a controllable functional clock for
-  the irqpin controller instance.
-- power-domains: Must contain a reference to the power domain. This property is
-  mandatory if the irqpin controller instance is part of a controllable power
-  domain.
-
-
-Example
--------
-
-	irqpin1: interrupt-controller@e6900004 {
-		compatible = "renesas,intc-irqpin-r8a7740",
-			     "renesas,intc-irqpin";
-		#interrupt-cells = <2>;
-		interrupt-controller;
-		reg = <0xe6900004 4>,
-			<0xe6900014 4>,
-			<0xe6900024 1>,
-			<0xe6900044 1>,
-			<0xe6900064 1>;
-		interrupts = <0 149 IRQ_TYPE_LEVEL_HIGH
-			      0 149 IRQ_TYPE_LEVEL_HIGH
-			      0 149 IRQ_TYPE_LEVEL_HIGH
-			      0 149 IRQ_TYPE_LEVEL_HIGH
-			      0 149 IRQ_TYPE_LEVEL_HIGH
-			      0 149 IRQ_TYPE_LEVEL_HIGH
-			      0 149 IRQ_TYPE_LEVEL_HIGH
-			      0 149 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&mstp2_clks R8A7740_CLK_INTCA>;
-		power-domains = <&pd_a4s>;
-	};
diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.yaml b/Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.yaml
new file mode 100644
index 0000000..5925890
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,intc-irqpin.yaml
@@ -0,0 +1,102 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/renesas,intc-irqpin.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: DT bindings for the R-/SH-Mobile irqpin controller
+
+maintainers:
+  - Geert Uytterhoeven <geert+renesas@glider.be>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - renesas,intc-irqpin-r8a7740  # R-Mobile A1
+          - renesas,intc-irqpin-r8a7778  # R-Car M1A
+          - renesas,intc-irqpin-r8a7779  # R-Car H1
+          - renesas,intc-irqpin-sh73a0   # SH-Mobile AG5
+      - const: renesas,intc-irqpin
+
+  reg:
+    # Base address and length of each register bank used by the external
+    # IRQ pins driven by the interrupt controller hardware module. The base
+    # addresses, length and number of required register banks varies with
+    # soctype.
+    minItems: 1
+    maxItems: 6
+
+  interrupt-controller: true
+    # Identifies the node as an interrupt controller.
+
+  '#interrupt-cells':
+    # an interrupt index and flags, as defined in interrupts.txt in this
+    # directory.
+    const: 2
+
+  interrupts:
+    # Must contain a list of interrupt specifiers. For each interrupt
+    # provided by this irqpin controller instance, there must be one entry,
+    # referring to the corresponding parent interrupt.
+    maxItems: 1
+
+  sense-bitfield-width:
+    # width of a single sense bitfield in the SENSE register, if different
+    # from the default 4 bits
+    $ref: /schemas/types.yaml#/definitions/uint32
+    maxItems: 1
+
+  control-parent:
+    # disable and enable interrupts on the parent interrupt controller,
+    # needed for some broken implementations
+    type: boolean
+
+  clocks:
+    # Must contain a reference to the functional clock.  This property is
+    # mandatory if the hardware implements a controllable functional clock for
+    # the irqpin controller instance.
+    maxItems: 1
+
+  power-domains:
+    # Must contain a reference to the power domain. This property is
+    # mandatory if the irqpin controller instance is part of a controllable
+    # power domain.
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupt-controller
+  - '#interrupt-cells'
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r8a7740-clock.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    irqpin1: interrupt-controller@e6900004 {
+        compatible = "renesas,intc-irqpin-r8a7740",
+                     "renesas,intc-irqpin";
+        #interrupt-cells = <2>;
+        interrupt-controller;
+        reg = <0xe6900004 4>,
+              <0xe6900014 4>,
+              <0xe6900024 1>,
+              <0xe6900044 1>,
+              <0xe6900064 1>;
+        interrupts = <GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH
+                      GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH
+                      GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH
+                      GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH
+                      GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH
+                      GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH
+                      GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH
+                      GIC_SPI 149 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&mstp2_clks R8A7740_CLK_INTCA>;
+        power-domains = <&pd_a4s>;
+    };
-- 
1.9.1

