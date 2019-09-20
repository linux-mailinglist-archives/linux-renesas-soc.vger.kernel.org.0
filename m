Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E029B97DF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Sep 2019 21:36:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729485AbfITTgi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 20 Sep 2019 15:36:38 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:41663 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726442AbfITTgh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Sep 2019 15:36:37 -0400
Received: by mail-pf1-f193.google.com with SMTP id q7so5168123pfh.8;
        Fri, 20 Sep 2019 12:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=yjUfSUmLnG245NxVkI3s8LV16rw5RLIekoYlk/qdTF8=;
        b=P0gdsvnSktZj3qRiE53zWL7RtKLa0PEbXZlmvqzdjNAcrFoWTYFktmxbHqfStniX3c
         go0hoGi69a1tlyGuWHbN164YAlU4VHtFUKen9tRMYNdEqIZ9Q6jr9Gex5BiKYPs0uolR
         MsMm8Zib5SjNdjCemweFXUZwvEo8N6srUJCgEmAbJd141QswEiFNHcKv/q2+HfqCet3r
         1AZiqdO6eJ2pc2Tz0xIyyRLw7TxyY/a8S1KHPe77ZKw5f7Gt8n4s/kVldQp/IP9F2xPi
         uZ/knhhFXAVuk4ngFhilTiAe05mLYYAeX8WpsGD7DUvabtCVKwVXJ4L7iLnt13oJsvH1
         5mnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=yjUfSUmLnG245NxVkI3s8LV16rw5RLIekoYlk/qdTF8=;
        b=mkKpdFaAla0jYBEHtrsnNsFAGZGB+ChkEdgTNkiJeumawwYLNyEZlgXvBGuoDI/03v
         XfGrgPcAIOnwWRu+WWtuUMlMTwD24BHtXBJ+WbYyAuY6GeeG7fhFtaaO8+dSmTwLcz9w
         cRKt5xUUQbhjlT28nWCKxloNvseloIFCa5o74LZN5JY6a9qCA0ygL2UIG+a7kYbxLZ/u
         FKWOJtBHSCOm8TbCfu+5l+gEtQvoi4K+O8pm/LBl9o1QQ+WL99R/kIboOFEhpjc4Wpqh
         S0oK85xnOP7TxsM16lWFqYt9LxHJ4pNvznThOfeWGTJZVSSsoYD03ZSYeRf76QnW51eh
         jO9Q==
X-Gm-Message-State: APjAAAX6fZA07R5TuTsJvbBHKr8FwfNCxf5dPSNBPELdnIc4vh9UushW
        8je0WCsT+QPtF3zfaaNlUows54H3
X-Google-Smtp-Source: APXvYqx7dyE3dAhX9vHFQVJhZyA6EBPgcvZuL017C7mMVjcw0iWBJSehGyzmf0+pmC2QUwYLXFB6OQ==
X-Received: by 2002:a17:90a:bd0c:: with SMTP id y12mr6565481pjr.59.1569008196595;
        Fri, 20 Sep 2019 12:36:36 -0700 (PDT)
Received: from localhost.localdomain (KD118155013174.ppp-bb.dion.ne.jp. [118.155.13.174])
        by smtp.gmail.com with ESMTPSA id x72sm2476921pfc.89.2019.09.20.12.36.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 20 Sep 2019 12:36:36 -0700 (PDT)
From:   Yoshihiro Kaneko <ykaneko0929@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Rob Herring <robh@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: pwm: renesas: tpu: convert bindings to json-schema
Date:   Sat, 21 Sep 2019 04:36:29 +0900
Message-Id: <1569008189-10611-1-git-send-email-ykaneko0929@gmail.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Convert Renesas R-Car Timer Pulse Unit PWM Controller bindings documentation
to json-schema.

Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---
 .../devicetree/bindings/pwm/renesas,tpu-pwm.txt    | 35 -----------
 .../devicetree/bindings/pwm/renesas,tpu-pwm.yaml   | 69 ++++++++++++++++++++++
 2 files changed, 69 insertions(+), 35 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.txt
 create mode 100644 Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.txt b/Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.txt
deleted file mode 100644
index 848a92b..0000000
--- a/Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.txt
+++ /dev/null
@@ -1,35 +0,0 @@
-* Renesas R-Car Timer Pulse Unit PWM Controller
-
-Required Properties:
-
-  - compatible: must contain one or more of the following:
-    - "renesas,tpu-r8a73a4": for R8A73A4 (R-Mobile APE6) compatible PWM controller.
-    - "renesas,tpu-r8a7740": for R8A7740 (R-Mobile A1) compatible PWM controller.
-    - "renesas,tpu-r8a7743": for R8A7743 (RZ/G1M) compatible PWM controller.
-    - "renesas,tpu-r8a7744": for R8A7744 (RZ/G1N) compatible PWM controller.
-    - "renesas,tpu-r8a7745": for R8A7745 (RZ/G1E) compatible PWM controller.
-    - "renesas,tpu-r8a7790": for R8A7790 (R-Car H2) compatible PWM controller.
-    - "renesas,tpu-r8a77970": for R8A77970 (R-Car V3M) compatible PWM
-			      controller.
-    - "renesas,tpu-r8a77980": for R8A77980 (R-Car V3H) compatible PWM
-			      controller.
-    - "renesas,tpu": for the generic TPU PWM controller; this is a fallback for
-		     the entries listed above.
-
-  - reg: Base address and length of each memory resource used by the PWM
-    controller hardware module.
-
-  - #pwm-cells: should be 3. See pwm.txt in this directory for a description of
-    the cells format. The only third cell flag supported by this binding is
-    PWM_POLARITY_INVERTED.
-
-Please refer to pwm.txt in this directory for details of the common PWM bindings
-used by client devices.
-
-Example: R8A7740 (R-Mobile A1) TPU controller node
-
-	tpu: pwm@e6600000 {
-		compatible = "renesas,tpu-r8a7740", "renesas,tpu";
-		reg = <0xe6600000 0x148>;
-		#pwm-cells = <3>;
-	};
diff --git a/Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.yaml b/Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.yaml
new file mode 100644
index 0000000..4908f00
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/renesas,tpu-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas R-Car Timer Pulse Unit PWM Controller
+
+maintainers:
+  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - renesas,tpu-r8a73a4   # R-Mobile APE6
+          - renesas,tpu-r8a7740   # R-Mobile A1
+          - renesas,tpu-r8a7743   # RZ/G1M
+          - renesas,tpu-r8a7744   # RZ/G1N
+          - renesas,tpu-r8a7745   # RZ/G1E
+          - renesas,tpu-r8a7790   # R-Car H2
+          - renesas,tpu-r8a7795   # R-Car H3
+          - renesas,tpu-r8a7796   # R-Car M3-W
+          - renesas,tpu-r8a77965  # R-Car M3-N
+          - renesas,tpu-r8a77970  # R-Car V3M
+          - renesas,tpu-r8a77980  # R-Car V3H
+      - const: renesas,tpu
+
+  reg:
+    # Base address and length of each memory resource used by the PWM
+    # controller hardware module.
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  '#pwm-cells':
+    # should be 3. See pwm.txt in this directory for a description of
+    # the cells format. The only third cell flag supported by this binding is
+    # PWM_POLARITY_INVERTED.
+    const: 3
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
+  - '#pwm-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r8a7740-clock.h>
+
+    tpu: pwm@e6600000 {
+        compatible = "renesas,tpu-r8a7740", "renesas,tpu";
+        reg = <0xe6600000 0x148>;
+        clocks = <&mstp3_clks R8A7740_CLK_TPU0>;
+        power-domains = <&pd_a3sp>;
+        #pwm-cells = <3>;
+    };
-- 
1.9.1

