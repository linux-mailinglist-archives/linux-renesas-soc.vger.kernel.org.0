Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F50BB4D69
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 17 Sep 2019 14:06:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726999AbfIQMGx (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 17 Sep 2019 08:06:53 -0400
Received: from mail-pf1-f181.google.com ([209.85.210.181]:44767 "EHLO
        mail-pf1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726763AbfIQMGx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 17 Sep 2019 08:06:53 -0400
Received: by mail-pf1-f181.google.com with SMTP id q21so2028777pfn.11;
        Tue, 17 Sep 2019 05:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=FmaO2hIKfEbiI+f6oV8Mh0M6shwqo+19QJDyKV05Pnw=;
        b=OvS4ojQBeoC+/4WbqZFZaUwHBZ1lYe6ooi7JevjECbZZn8D6kRDPSYOQwopFlbpSX4
         ieDN/xAqntB8jvkaNh++lCNmFRFf7aaa5kOEBaiWYIZbuMFascb7Cy9B/OA3IDAenv2q
         03JXa2gx/TPNlqUmae2/1tLkyZrs/1OAH232IsCHLjGZjH0tGP8K4C6KL6fNo4bpjdZp
         MHDGnDR+GwDFZzYZsPnm8ZItSzxX74uuWE1ZJbeDgjlinIHQrIXnnCWG+bQvdqQ5BURp
         1eQ6hmehdzNcIoDyj8CRZtwbSSRxfsa1L9CDoUQztRRmFTScrLOsio8zxOFOP0uRn5/C
         5j+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=FmaO2hIKfEbiI+f6oV8Mh0M6shwqo+19QJDyKV05Pnw=;
        b=P12C9tVO7UbkAkd68/K7cZqxtZgTPtjuO8xqRoxaGLlHhuQu4yX/Ipzp55QQpLDbmI
         /FPIVwwvkDqgNAjNtGllF8OY9+JLq0X8fOSzLYjqGljwkfBaSEk9W1uHueO3E/ESopQy
         15xqQH1V7AMqt2J6MntJKxGz/NuCM+co9olqYWrIL2wa9lhFLGIjZ8nuCrQGMIJs+y9N
         HlS2YUsDOtZTstU2+TyG4lo6IquAbmq+uddq2AXfKEUbiKpi0W1MNRO2zaN1FHeZkq/b
         1T4Jgm/5AipNLyj6AzxSm++a2f8CwkyOdxf0nARXhnW7Yk4A1ATO1jGX/Ew97Xjq/mck
         mcYQ==
X-Gm-Message-State: APjAAAWXTgFrs6VYFiIJaxOGykij0dcVo74GaihSQAttX17t0G9SUKcs
        jhezrbJjzeck1uqz2EetxPAP9h85
X-Google-Smtp-Source: APXvYqxTBZL1mpcWMYnoO/gitpViJQgONQymTcvSiAu7iXlVGtKwTgzG1jJU1jPi74jz9FZOzD12FA==
X-Received: by 2002:a17:90a:2a4a:: with SMTP id d10mr4596436pjg.72.1568722011592;
        Tue, 17 Sep 2019 05:06:51 -0700 (PDT)
Received: from localhost.localdomain (p1607031-ipngn15601marunouchi.tokyo.ocn.ne.jp. [153.204.132.31])
        by smtp.gmail.com with ESMTPSA id c128sm2494200pfc.166.2019.09.17.05.06.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 17 Sep 2019 05:06:50 -0700 (PDT)
From:   Yoshihiro Kaneko <ykaneko0929@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: irqchip: renesas-irqc: convert bindings to json-schema
Date:   Tue, 17 Sep 2019 21:06:12 +0900
Message-Id: <1568721972-24266-1-git-send-email-ykaneko0929@gmail.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Convert Renesas Interrupt Controller bindings documentation to json-schema.

Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---
 .../bindings/interrupt-controller/renesas,irqc.txt | 48 ----------------
 .../interrupt-controller/renesas,irqc.yaml         | 64 ++++++++++++++++++++++
 2 files changed, 64 insertions(+), 48 deletions(-)
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
index 0000000..f08d368
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,irqc.yaml
@@ -0,0 +1,64 @@
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/renesas,irqc.yaml#
+$schema: http://devicetree.org/meta-schemas/interrupts.yaml#
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
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - '#interrupt-cells'
+  - clocks
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

