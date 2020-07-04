Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18B2F21473F
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  4 Jul 2020 18:08:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726897AbgGDQId (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 4 Jul 2020 12:08:33 -0400
Received: from vsp-unauthed02.binero.net ([195.74.38.227]:7459 "EHLO
        vsp-unauthed02.binero.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727069AbgGDQId (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 4 Jul 2020 12:08:33 -0400
X-Halon-ID: 998f316d-be10-11ea-933e-005056917a89
Authorized-sender: niklas@soderlund.pp.se
Received: from bismarck.berto.se (p4fca2eca.dip0.t-ipconnect.de [79.202.46.202])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id 998f316d-be10-11ea-933e-005056917a89;
        Sat, 04 Jul 2020 18:08:31 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 1/2] dt-bindings: adv7180: Convert bindings to json-schema
Date:   Sat,  4 Jul 2020 18:06:43 +0200
Message-Id: <20200704160644.3040636-2-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200704160644.3040636-1-niklas.soderlund+renesas@ragnatech.se>
References: <20200704160644.3040636-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Convert ADV7180 analog video decoder documentation to json-schema.

As the examples in the bindings can be tested add another example to
test the more advance adv7180cp binding description.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../devicetree/bindings/media/i2c/adv7180.txt |  49 -----
 .../bindings/media/i2c/adv7180.yaml           | 184 ++++++++++++++++++
 2 files changed, 184 insertions(+), 49 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/adv7180.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/adv7180.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/adv7180.txt b/Documentation/devicetree/bindings/media/i2c/adv7180.txt
deleted file mode 100644
index 552b6a82cb1f0ed4..0000000000000000
--- a/Documentation/devicetree/bindings/media/i2c/adv7180.txt
+++ /dev/null
@@ -1,49 +0,0 @@
-* Analog Devices ADV7180 analog video decoder family
-
-The adv7180 family devices are used to capture analog video to different
-digital interfaces like MIPI CSI-2 or parallel video.
-
-Required Properties :
-- compatible : value must be one of
-		"adi,adv7180"
-		"adi,adv7180cp"
-		"adi,adv7180st"
-		"adi,adv7182"
-		"adi,adv7280"
-		"adi,adv7280-m"
-		"adi,adv7281"
-		"adi,adv7281-m"
-		"adi,adv7281-ma"
-		"adi,adv7282"
-		"adi,adv7282-m"
-
-Device nodes of "adi,adv7180cp" and "adi,adv7180st" must contain one
-'port' child node per device input and output port, in accordance with the
-video interface bindings defined in
-Documentation/devicetree/bindings/media/video-interfaces.txt. The port
-nodes are numbered as follows.
-
-  Port		adv7180cp	adv7180st
--------------------------------------------------------------------
-  Input		0-2		0-5
-  Output	3		6
-
-The digital output port node must contain at least one endpoint.
-
-Optional Properties :
-- powerdown-gpios: reference to the GPIO connected to the powerdown pin,
-  if any.
-
-
-Example:
-
-	i2c0@1c22000 {
-		...
-		...
-		adv7180@21 {
-			compatible = "adi,adv7180";
-			reg = <0x21>;
-		};
-		...
-	};
-
diff --git a/Documentation/devicetree/bindings/media/i2c/adv7180.yaml b/Documentation/devicetree/bindings/media/i2c/adv7180.yaml
new file mode 100644
index 0000000000000000..e0084b272b25a194
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/adv7180.yaml
@@ -0,0 +1,184 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/adv7180.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices ADV7180 analog video decoder family
+
+maintainers:
+  - Lars-Peter Clausen <lars@metafoo.de>
+
+description:
+  The adv7180 family devices are used to capture analog video to different
+  digital interfaces like MIPI CSI-2 or parallel video.
+
+properties:
+  compatible:
+    items:
+      - enum:
+        - adi,adv7180
+        - adi,adv7180cp
+        - adi,adv7180st
+        - adi,adv7182
+        - adi,adv7280
+        - adi,adv7280-m
+        - adi,adv7281
+        - adi,adv7281-m
+        - adi,adv7281-ma
+        - adi,adv7282
+        - adi,adv7282-m
+
+  reg:
+    maxItems: 1
+
+  powerdown-gpios:
+    maxItems: 1
+
+  port:
+    type: object
+    description:
+      A node containing a single endpoint as doucmented in
+      Documentation/devicetree/bindings/media/video-interfaces.txt
+
+  ports:
+    type: object
+    description:
+      A node containing input and output port nodes with endpoint definitions
+      as documented in
+      Documentation/devicetree/bindings/media/video-interfaces.txt
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          items:
+            - enum:
+              - adi,adv7180
+              - adi,adv7182
+              - adi,adv7280
+              - adi,adv7280-m
+              - adi,adv7281
+              - adi,adv7281-m
+              - adi,adv7281-ma
+              - adi,adv7282
+              - adi,adv7282-m
+    then:
+      required:
+        - port
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: adi,adv7180cp
+    then:
+      properties:
+        ports:
+          properties:
+            '#address-cells':
+              const: 1
+            '#size-cells':
+              const: 0
+            port@3:
+              type: object
+              description: Output port
+
+          patternProperties:
+            "^port@[0-2]$":
+              type: object
+              description: Input port
+
+          required:
+            - port@3
+
+          additionalProperties: false
+
+      required:
+        - ports
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: adi,adv7180st
+    then:
+      properties:
+        ports:
+          properties:
+            '#address-cells':
+              const: 1
+            '#size-cells':
+              const: 0
+            port@6:
+              type: object
+              description: Output port
+
+          patternProperties:
+            "^port@[0-5]$":
+              type: object
+              description: Input port
+
+          required:
+            - port@6
+
+          additionalProperties: false
+
+      required:
+        - ports
+
+examples:
+  - |
+    i2c {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            composite-in@20 {
+                    compatible = "adi,adv7180";
+                    reg = <0x20>;
+
+                    port {
+                            adv7180: endpoint {
+                                    bus-width = <8>;
+                                    remote-endpoint = <&vin1ep>;
+                            };
+                    };
+            };
+
+    };
+
+  - |
+    i2c {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            composite-in@20 {
+                    compatible = "adi,adv7180cp";
+                    reg = <0x20>;
+
+                    ports {
+                            #address-cells = <1>;
+                            #size-cells = <0>;
+
+                            port@0 {
+                                    reg = <0>;
+                                    adv7180_in: endpoint {
+                                            remote-endpoint = <&composite_con_in>;
+                                    };
+                            };
+
+                            port@3 {
+                                    reg = <3>;
+                                    adv7180_out: endpoint {
+                                            remote-endpoint = <&vin4_in>;
+                                    };
+                            };
+                    };
+            };
+    };
-- 
2.27.0

