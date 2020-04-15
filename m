Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E356A1A8FF6
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Apr 2020 02:59:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733283AbgDOA73 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 14 Apr 2020 20:59:29 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:39302 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733273AbgDOA70 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Apr 2020 20:59:26 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4D0D0521;
        Wed, 15 Apr 2020 02:59:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586912363;
        bh=j5kJSamXH9jDSKixOpba6vl/Y+uSM9bjwj4lPXbnkdo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FLshN5d5d9E5aLBSigpPmwC5aNb4nlF6NeWV0BpwgvSssPaiqwXapbpb0964r5mvr
         PsN+8s/+QquDu7WMfXG8GUK+n0hV0Vm2hSDHNz9aiHYT9Ac7YJXtwZijE+3cEExa7h
         4ALiuTdOG8Zxg26T3h8SUNUKkzBBDVtm/Ayp+zFU=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh@kernel.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v1.1 2/4] dt-bindings: display: bridge: Convert simple-bridge bindings to YAML
Date:   Wed, 15 Apr 2020 03:59:09 +0300
Message-Id: <20200415005909.18650-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200415005427.GY19819@pendragon.ideasonboard.com>
References: <20200415005427.GY19819@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The simple-bridge driver supports multiple simple or dumb bridges,
covered by different compatible strings but otherwise identical DT
bindings. Some of those bridges have undocumented bindings, while others
are documented in text form in separate files. Group them all in a
single binding and convert it to YAML.

The psave-gpios property of the adi,adv7123 is dropped, as it isn't
supported by the driver and isn't specified in any DT file upstream.
Support for power saving is available through the enable-gpios property
that should cover all the needs of the ADV7123 (as the device only has a
/PSAVE pin and no enable pin).

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Acked-by: Maxime Ripard <mripard@kernel.org>
---
Changes since v1:

- Mention dropping psave-gpios in the commit message.
---
 .../bindings/display/bridge/adi,adv7123.txt   | 50 ----------
 .../bindings/display/bridge/dumb-vga-dac.txt  | 50 ----------
 .../display/bridge/simple-bridge.yaml         | 99 +++++++++++++++++++
 .../bindings/display/bridge/ti,ths813x.txt    | 51 ----------
 4 files changed, 99 insertions(+), 151 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/adi,adv7123.txt
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/dumb-vga-dac.txt
 create mode 100644 Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/ti,ths813x.txt

diff --git a/Documentation/devicetree/bindings/display/bridge/adi,adv7123.txt b/Documentation/devicetree/bindings/display/bridge/adi,adv7123.txt
deleted file mode 100644
index a6b2b2b8f3d9..000000000000
--- a/Documentation/devicetree/bindings/display/bridge/adi,adv7123.txt
+++ /dev/null
@@ -1,50 +0,0 @@
-Analog Device ADV7123 Video DAC
--------------------------------
-
-The ADV7123 is a digital-to-analog converter that outputs VGA signals from a
-parallel video input.
-
-Required properties:
-
-- compatible: Should be "adi,adv7123"
-
-Optional properties:
-
-- psave-gpios: Power save control GPIO
-
-Required nodes:
-
-The ADV7123 has two video ports. Their connections are modeled using the OF
-graph bindings specified in Documentation/devicetree/bindings/graph.txt.
-
-- Video port 0 for DPI input
-- Video port 1 for VGA output
-
-
-Example
--------
-
-	adv7123: encoder@0 {
-		compatible = "adi,adv7123";
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@0 {
-				reg = <0>;
-
-				adv7123_in: endpoint@0 {
-					remote-endpoint = <&dpi_out>;
-				};
-			};
-
-			port@1 {
-				reg = <1>;
-
-				adv7123_out: endpoint@0 {
-					remote-endpoint = <&vga_connector_in>;
-				};
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/bridge/dumb-vga-dac.txt b/Documentation/devicetree/bindings/display/bridge/dumb-vga-dac.txt
deleted file mode 100644
index 164cbb15f04c..000000000000
--- a/Documentation/devicetree/bindings/display/bridge/dumb-vga-dac.txt
+++ /dev/null
@@ -1,50 +0,0 @@
-Dumb RGB to VGA DAC bridge
----------------------------
-
-This binding is aimed for dumb RGB to VGA DAC based bridges that do not require
-any configuration.
-
-Required properties:
-
-- compatible: Must be "dumb-vga-dac"
-
-Required nodes:
-
-This device has two video ports. Their connections are modelled using the OF
-graph bindings specified in Documentation/devicetree/bindings/graph.txt.
-
-- Video port 0 for RGB input
-- Video port 1 for VGA output
-
-Optional properties:
-- vdd-supply: Power supply for DAC
-
-Example
--------
-
-bridge {
-	compatible = "dumb-vga-dac";
-	#address-cells = <1>;
-	#size-cells = <0>;
-
-	ports {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		port@0 {
-			reg = <0>;
-
-			vga_bridge_in: endpoint {
-				remote-endpoint = <&tcon0_out_vga>;
-			};
-		};
-
-		port@1 {
-			reg = <1>;
-
-			vga_bridge_out: endpoint {
-				remote-endpoint = <&vga_con_in>;
-			};
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
new file mode 100644
index 000000000000..0880cbf217d5
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/simple-bridge.yaml
@@ -0,0 +1,99 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/simple-bridge.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Transparent non-programmable DRM bridges
+
+maintainers:
+  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
+  - Maxime Ripard <mripard@kernel.org>
+
+description: |
+  This binding supports transparent non-programmable bridges that don't require
+  any configuration, with a single input and a single output.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+        - enum:
+          - ti,ths8134a
+          - ti,ths8134b
+        - const: ti,ths8134
+      - enum:
+        - adi,adv7123
+        - dumb-vga-dac
+        - ti,opa362
+        - ti,ths8134
+        - ti,ths8135
+
+  ports:
+    type: object
+    description: |
+      This device has two video ports. Their connections are modeled using the
+      OF graph bindings specified in Documentation/devicetree/bindings/graph.txt.
+    properties:
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+      port@0:
+        type: object
+        description: The bridge input
+
+      port@1:
+        type: object
+        description: The bridge output
+
+    required:
+      - port@0
+      - port@1
+
+    additionalProperties: false
+
+  enable-gpios:
+    maxItems: 1
+    description: GPIO controlling bridge enable
+
+  vdd-supply:
+    maxItems: 1
+    description: Power supply for the bridge
+
+required:
+  - compatible
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    bridge {
+        compatible = "ti,ths8134a", "ti,ths8134";
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                vga_bridge_in: endpoint {
+                    remote-endpoint = <&tcon0_out_vga>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+
+                vga_bridge_out: endpoint {
+                    remote-endpoint = <&vga_con_in>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/display/bridge/ti,ths813x.txt b/Documentation/devicetree/bindings/display/bridge/ti,ths813x.txt
deleted file mode 100644
index df3d7c1ac09e..000000000000
--- a/Documentation/devicetree/bindings/display/bridge/ti,ths813x.txt
+++ /dev/null
@@ -1,51 +0,0 @@
-THS8134 and THS8135 Video DAC
------------------------------
-
-This is the binding for Texas Instruments THS8134, THS8134A, THS8134B and
-THS8135 Video DAC bridges.
-
-Required properties:
-
-- compatible: Must be one of
-  "ti,ths8134"
-  "ti,ths8134a," "ti,ths8134"
-  "ti,ths8134b", "ti,ths8134"
-  "ti,ths8135"
-
-Required nodes:
-
-This device has two video ports. Their connections are modelled using the OF
-graph bindings specified in Documentation/devicetree/bindings/graph.txt.
-
-- Video port 0 for RGB input
-- Video port 1 for VGA output
-
-Example
--------
-
-vga-bridge {
-	compatible = "ti,ths8135";
-	#address-cells = <1>;
-	#size-cells = <0>;
-
-	ports {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		port@0 {
-			reg = <0>;
-
-			vga_bridge_in: endpoint {
-				remote-endpoint = <&lcdc_out_vga>;
-			};
-		};
-
-		port@1 {
-			reg = <1>;
-
-			vga_bridge_out: endpoint {
-				remote-endpoint = <&vga_con_in>;
-			};
-		};
-	};
-};
-- 
Regards,

Laurent Pinchart

