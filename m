Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C92DBB97DA
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Sep 2019 21:35:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729588AbfITTfh (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 20 Sep 2019 15:35:37 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:41342 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726869AbfITTfh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Sep 2019 15:35:37 -0400
Received: by mail-pg1-f196.google.com with SMTP id s1so3267094pgv.8;
        Fri, 20 Sep 2019 12:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=k1LNWLTzufoAhsF/14MZiHJVb56pBySIo1G9IfUfnvo=;
        b=KyDwBXYUkn1nA9uIhYuqNfSTz5J/4G54qOgKQJ3l8F/N6AoDkqevJeZwvuAJ+gd7Fo
         uG6+6muNJb+E0kz/4RjoDFy9wkqZ/SgNFtCS6yLut1MUnTNU4rI/4mbJ51uPUFAM4+r9
         M5vOL1nA+3qnUAcx/Dc9WdFhHStNUpRxNToPDUIe+HUgvz0Q+5UomTjGYl7BY3c3a9v3
         0Z6vWbbe0LqQOowMBr9aYjNbcbZcWZPaKm8U4AuT2c9slOyv9SQFV1KJrYAx8ISflOXx
         IGM6jjAiqJhaDGUi8s2RMJ6m8FO4qrKs5550sLc+30JULIu8nOuzX5zqlJpS/0565fs+
         O2HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=k1LNWLTzufoAhsF/14MZiHJVb56pBySIo1G9IfUfnvo=;
        b=EZoyPl7eIR02cwTxvMH0ODXSgEcXhk7aD53uwNyo0RIa3QNEuZKOwZebBSNC0vHysf
         Nx/6UTMFQrgzr1QKmtItAcZ1qzO1FS3251RgLCyPa47megxCM+OxFMkhGM3Qj007pUuW
         2Jq6HxwfEquU4cUByI14QNVlCQoTLUSe4FkYfxz4Fp95DH5cHvoGl3M2GwMqYkWf05NC
         Kn06RRZtSGRBxAWKDVlXnOL1jo5GRpsyEAxSGfmc24akxcdugkHWbqmp1PwTrsd5y1WW
         JhVxRQKhGCeFltIi+W0wk7uJttKgf8zLvlmsXGj/AnAnQd17a+fSWXicblxPHHR+j0ne
         slxw==
X-Gm-Message-State: APjAAAUXB5oT0UB2VM3/xk91ObW/KkFq0MHYjXJUR0yTtifuqw0My0+3
        BihV/ksc1RKCjiBaOByahWV7zTQ5
X-Google-Smtp-Source: APXvYqxU2Q326rrAeAyBe6ebkoVEXZf5hxgbHhS5PXmLHYN8Glq+X2BFN6ew2Xcq4iNjstmY14eo1A==
X-Received: by 2002:a17:90a:b114:: with SMTP id z20mr6607763pjq.113.1569008135876;
        Fri, 20 Sep 2019 12:35:35 -0700 (PDT)
Received: from localhost.localdomain (KD118155013174.ppp-bb.dion.ne.jp. [118.155.13.174])
        by smtp.gmail.com with ESMTPSA id l12sm972940pgs.44.2019.09.20.12.35.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 20 Sep 2019 12:35:35 -0700 (PDT)
From:   Yoshihiro Kaneko <ykaneko0929@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Rob Herring <robh@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: pwm: renesas: pwm-rcar: convert bindings to json-schema
Date:   Sat, 21 Sep 2019 04:35:27 +0900
Message-Id: <1569008127-10555-1-git-send-email-ykaneko0929@gmail.com>
X-Mailer: git-send-email 1.9.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Convert Renesas R-Car PWM Timer Controller bindings documentation to
json-schema.

Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
---
 .../devicetree/bindings/pwm/renesas,pwm-rcar.txt   | 40 -----------
 .../devicetree/bindings/pwm/renesas,pwm-rcar.yaml  | 77 ++++++++++++++++++++++
 2 files changed, 77 insertions(+), 40 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/pwm/renesas,pwm-rcar.txt
 create mode 100644 Documentation/devicetree/bindings/pwm/renesas,pwm-rcar.yaml

diff --git a/Documentation/devicetree/bindings/pwm/renesas,pwm-rcar.txt b/Documentation/devicetree/bindings/pwm/renesas,pwm-rcar.txt
deleted file mode 100644
index fbd6a4f..0000000
--- a/Documentation/devicetree/bindings/pwm/renesas,pwm-rcar.txt
+++ /dev/null
@@ -1,40 +0,0 @@
-* Renesas R-Car PWM Timer Controller
-
-Required Properties:
-- compatible: should be "renesas,pwm-rcar" and one of the following.
- - "renesas,pwm-r8a7743": for RZ/G1M
- - "renesas,pwm-r8a7744": for RZ/G1N
- - "renesas,pwm-r8a7745": for RZ/G1E
- - "renesas,pwm-r8a774a1": for RZ/G2M
- - "renesas,pwm-r8a774c0": for RZ/G2E
- - "renesas,pwm-r8a7778": for R-Car M1A
- - "renesas,pwm-r8a7779": for R-Car H1
- - "renesas,pwm-r8a7790": for R-Car H2
- - "renesas,pwm-r8a7791": for R-Car M2-W
- - "renesas,pwm-r8a7794": for R-Car E2
- - "renesas,pwm-r8a7795": for R-Car H3
- - "renesas,pwm-r8a7796": for R-Car M3-W
- - "renesas,pwm-r8a77965": for R-Car M3-N
- - "renesas,pwm-r8a77970": for R-Car V3M
- - "renesas,pwm-r8a77980": for R-Car V3H
- - "renesas,pwm-r8a77990": for R-Car E3
- - "renesas,pwm-r8a77995": for R-Car D3
-- reg: base address and length of the registers block for the PWM.
-- #pwm-cells: should be 2. See pwm.txt in this directory for a description of
-  the cells format.
-- clocks: clock phandle and specifier pair.
-- pinctrl-0: phandle, referring to a default pin configuration node.
-- pinctrl-names: Set to "default".
-
-Example: R8A7743 (RZ/G1M) PWM Timer node
-
-	pwm0: pwm@e6e30000 {
-		compatible = "renesas,pwm-r8a7743", "renesas,pwm-rcar";
-		reg = <0 0xe6e30000 0 0x8>;
-		clocks = <&cpg CPG_MOD 523>;
-		power-domains = <&sysc R8A7743_PD_ALWAYS_ON>;
-		resets = <&cpg 523>;
-		#pwm-cells = <2>;
-		pinctrl-0 = <&pwm0_pins>;
-		pinctrl-names = "default";
-	};
diff --git a/Documentation/devicetree/bindings/pwm/renesas,pwm-rcar.yaml b/Documentation/devicetree/bindings/pwm/renesas,pwm-rcar.yaml
new file mode 100644
index 0000000..0976cfd
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/renesas,pwm-rcar.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/renesas,pwm-rcar.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas R-Car PWM Timer Controller
+
+maintainers:
+  - Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - renesas,pwm-r8a7743   # RZ/G1M
+          - renesas,pwm-r8a7744   # RZ/G1N
+          - renesas,pwm-r8a7745   # RZ/G1E
+          - renesas,pwm-r8a77470  # RZ/G1C
+          - renesas,pwm-r8a774a1  # RZ/G2M
+          - renesas,pwm-r8a774c0  # RZ/G2E
+          - renesas,pwm-r8a7778   # R-Car M1A
+          - renesas,pwm-r8a7779   # R-Car H1
+          - renesas,pwm-r8a7790   # R-Car H2
+          - renesas,pwm-r8a7791   # R-Car M2-W
+          - renesas,pwm-r8a7794   # R-Car E2
+          - renesas,pwm-r8a7795   # R-Car H3
+          - renesas,pwm-r8a7796   # R-Car M3-W
+          - renesas,pwm-r8a77965  # R-Car M3-N
+          - renesas,pwm-r8a77970  # R-Car V3M
+          - renesas,pwm-r8a77980  # R-Car V3H
+          - renesas,pwm-r8a77990  # R-Car E3
+          - renesas,pwm-r8a77995  # R-Car D3
+      - const: renesas,pwm-rcar
+
+  reg:
+    # base address and length of the registers block for the PWM.
+    maxItems: 1
+
+  '#pwm-cells':
+    # should be 2. See pwm.txt in this directory for a description of
+    # the cells format.
+    const: 2
+
+  clocks:
+    # clock phandle and specifier pair.
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
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r8a7743-cpg-mssr.h>
+    #include <dt-bindings/power/r8a7743-sysc.h>
+
+    pwm0: pwm@e6e30000 {
+        compatible = "renesas,pwm-r8a7743", "renesas,pwm-rcar";
+        reg = <0 0xe6e30000 0 0x8>;
+        clocks = <&cpg CPG_MOD 523>;
+        power-domains = <&sysc R8A7743_PD_ALWAYS_ON>;
+        resets = <&cpg 523>;
+        #pwm-cells = <2>;
+        pinctrl-0 = <&pwm0_pins>;
+        pinctrl-names = "default";
+    };
-- 
1.9.1

