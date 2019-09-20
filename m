Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1EB3B97D8
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Sep 2019 21:34:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726923AbfITTeq (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 20 Sep 2019 15:34:46 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:46580 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726869AbfITTep (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Sep 2019 15:34:45 -0400
Received: by mail-pf1-f195.google.com with SMTP id q5so5143934pfg.13;
        Fri, 20 Sep 2019 12:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=hdHjIxyoV9MME/UUbH4XvoAgxtGcK/yVQNUdaWSWHWs=;
        b=m8ABt2kRL9DqKKo/IH4LrQnJkfQXteSs39QJB+Y3H8sexRkhSk2+ufbkgUEaPktN7Z
         eIIaAyZh0XVaG2e3GtAj5X+1YH3megACRzpt7yzx1ncyyt4JOdYL6XpDWyxU6dgbJtsg
         9rWERdcI5O/Z8sDsveoGCk73+6D14Y26JwUC/MOa3r8B4dO4OtJB/aAsSB6k+MfUEM74
         EocDadAIF/c15iBlSENKYshcojwiTnHbxvTPT8qjYZdJt2hQkn7MdXk528aHRQkFolXw
         zjv8hsoWTzA3VLOe5A+dkaBFthFnkc/RInrGokKv+pZAIDYKnF/78dICH3PLDJ660Sie
         A2tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=hdHjIxyoV9MME/UUbH4XvoAgxtGcK/yVQNUdaWSWHWs=;
        b=ooMpDhcaezHD99lwDUyHOAOWK3X9CwS02LYoSeH3Vmky4vPVSHVj6sFgRp8g/1GXqj
         pENBhwDPcOF7kQBzp4cnklk5/S4001S2kgWqNKcV8SoXELA5VgNjrPTjDcaS9ThR7+zy
         I2WSGnk7DD1rO+LNJCIbhltq8+dIqM51CitosvsJSzDfB7Ig9HeIivg6zq8NVOQE4mWJ
         SmluAYXCb+eU518Qb2zbjA2xHUmv5ikRHe8kdNYwY4hFkNVRMMSMh0R+8LeNwtkqmcvr
         twEC5MUxypQPejtMqjRZrEh+ioc8JGJe8hEtOSM/B9wr0q64I6b4eati1Xs8mtd7Vuac
         pNCQ==
X-Gm-Message-State: APjAAAVwf+yUwgv2pnesOMC/QJ/zPNX6/cld8xTuBDxx1VGbeBt2rlzD
        eUfUKbkYSFZDhn+TLEkWqHepsS23
X-Google-Smtp-Source: APXvYqxDq/xHL0/bG1WRW/lrqvdoCaaPYO5S8jAHUPi0WcDXuLETKdqUi0wq7vcPltomsgfGO93nng==
X-Received: by 2002:a63:6904:: with SMTP id e4mr14601298pgc.321.1569008084522;
        Fri, 20 Sep 2019 12:34:44 -0700 (PDT)
Received: from localhost.localdomain (KD118155013174.ppp-bb.dion.ne.jp. [118.155.13.174])
        by smtp.gmail.com with ESMTPSA id l23sm2227301pgj.53.2019.09.20.12.34.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 20 Sep 2019 12:34:43 -0700 (PDT)
From:   Yoshihiro Kaneko <ykaneko0929@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Rob Herring <robh@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: irqchip: renesas: intc-irqpin: convert bindings to json-schema
Date:   Sat, 21 Sep 2019 04:34:21 +0900
Message-Id: <1569008061-10459-1-git-send-email-ykaneko0929@gmail.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Convert R-/SH-Mobile IRQPin Controller bindings documentation to json-schema.

Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---
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
index 0000000..d4d3cf8
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
+  - Geert Uytterhoeven <geert+renesas@xxxxxxxxx>
+  - Guennadi Liakhovetski <g.liakhovetski@gmx.de>
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
+    maxItems: 1
+
+  control-parent:
+    # disable and enable interrupts on the parent interrupt controller,
+    # needed for some broken implementations
+    maxItems: 1
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

