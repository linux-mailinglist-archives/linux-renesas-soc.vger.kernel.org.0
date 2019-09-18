Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EAB58B66B3
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 18 Sep 2019 17:05:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387415AbfIRPFt (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 18 Sep 2019 11:05:49 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:37325 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728330AbfIRPFt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Sep 2019 11:05:49 -0400
Received: by mail-pg1-f194.google.com with SMTP id c17so15703pgg.4;
        Wed, 18 Sep 2019 08:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=S8+DSKdJDupx7vBlIFaOZU3EN4XntW2KLafDePYTrEY=;
        b=NqMTpDaHk/W5JfBpXsVWnYEV5UJmn+IM+BhfKFNOiXNURQZNM24TsaDC/M++BGdN/P
         4gjpVzI+8kIohIO4KpTgy8uqykrVYHGLKiO0B9888w8wMHFd4sojhPlG57p0l4yLCSOA
         3s+MaLwwiSflhkHlOO+Nc53e/7XUMa4IBKbyfB7t6+WE6Z8QQIh7CFRB0Mn3NoCYnNFq
         Mxcnzv44CD7nJFZXnjjI5eh9G1kTQiOKiTLy6ic26idcKyDFjx64XbnxKh6pMRqTyEJI
         eA6xFhvPy+wUimf0RzVxqUWjcYzdKYdqDLQqN1gehDH7TUKEzMwATM8MGWGD27CB3C/d
         kXdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=S8+DSKdJDupx7vBlIFaOZU3EN4XntW2KLafDePYTrEY=;
        b=f3EEzLi9ShLFZkGjGXlmUaO0nT7J7Qgoj7GlYdDL6lm0LyXfX0LShd6k5UyVn32VHt
         q5HJhOIdMavjw6rQTJ7VUMuNj4Tk4LYglP9AevHndCUnbrEL2sAGajodO1VCywHPm3dN
         VclYY5YrudX7w/B56BRUPxVBeVpij8jpNFasF2aO95onLbJv3RWnv+vGHcFyh9l9vyOL
         g3mnYjvrbPZ/Az9gJ/Zy4/WjHlV4uZjOWkkW0MzcOtmsbPPk+D22dItXyb2DOfm4rrQm
         jXfyP5mCMaVK/dcOWffK60ShrrijC5hA6GVJH4K2FSS4JCzq0YCKCBD7cwbvwx+9GJYy
         afNg==
X-Gm-Message-State: APjAAAXTGnokwsBpcyRW4JbpnYk5wIL3eL9n4oiLOIV82PXggCJSl/WW
        PD7KtMgqX3043U/Rz5v5GsVPb8yr
X-Google-Smtp-Source: APXvYqzYiSaEQ8pNAJ5zI5NP1Mx/LAV/tH5OtpnPQ98Y/X07sgHLTuBj27LNqu2SvhIAY3ra0d09sg==
X-Received: by 2002:a62:3687:: with SMTP id d129mr4747229pfa.199.1568819148168;
        Wed, 18 Sep 2019 08:05:48 -0700 (PDT)
Received: from localhost.localdomain (p1607031-ipngn15601marunouchi.tokyo.ocn.ne.jp. [153.204.132.31])
        by smtp.gmail.com with ESMTPSA id p1sm13738415pfb.112.2019.09.18.08.05.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 18 Sep 2019 08:05:47 -0700 (PDT)
From:   Yoshihiro Kaneko <ykaneko0929@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Rob Herring <robh@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org
Subject: [PATCH v2] dt-bindings: irqchip: renesas-irqc: convert bindings to json-schema
Date:   Thu, 19 Sep 2019 00:05:21 +0900
Message-Id: <1568819121-32737-1-git-send-email-ykaneko0929@gmail.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Convert Renesas Interrupt Controller bindings documentation to json-schema.

Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---

v2
- Add SPDX tag.
- Document interrupt-contoller, reg, interrupts, power-domains and resets
  properties.
- Add addtionalProperties.

---
 .../bindings/interrupt-controller/renesas,irqc.txt | 48 -------------
 .../interrupt-controller/renesas,irqc.yaml         | 84 ++++++++++++++++++++++
 2 files changed, 84 insertions(+), 48 deletions(-)
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
index 0000000..18497c3
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.yaml
@@ -0,0 +1,84 @@
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
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/clock/r8a7790-clock.h>
+
+    irqc0: interrupt-controller@e61c0000 {
+        compatible = "renesas,irqc-r8a7790", "renesas,irqc";
+        #interrupt-cells = <2>;
+        interrupt-controller;
+        reg = <0 0xe61c0000 0 0x200>;
+        interrupts = <0 0 IRQ_TYPE_LEVEL_HIGH>,
+                     <0 1 IRQ_TYPE_LEVEL_HIGH>,
+                     <0 2 IRQ_TYPE_LEVEL_HIGH>,
+                     <0 3 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&mstp4_clks R8A7790_CLK_IRQC>;
+    };
-- 
1.9.1

