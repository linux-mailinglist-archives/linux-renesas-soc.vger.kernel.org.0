Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A9AB220EBF
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 15 Jul 2020 16:06:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732062AbgGOOGn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 15 Jul 2020 10:06:43 -0400
Received: from relay9-d.mail.gandi.net ([217.70.183.199]:43681 "EHLO
        relay9-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732039AbgGOOGl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Jul 2020 10:06:41 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.lan (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 715DEFF802;
        Wed, 15 Jul 2020 14:06:37 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-media@vger.kernel.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
        laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org,
        Leon Luo <leonl@leopardimaging.com>
Subject: [PATCH 5/8] dt-bindings: media: imx274: Convert to json-schema
Date:   Wed, 15 Jul 2020 16:09:48 +0200
Message-Id: <20200715140951.90753-6-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200715140951.90753-1-jacopo+renesas@jmondi.org>
References: <20200715140951.90753-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Convert the imx274 bindings document to json-schema and update
the MAINTAINERS file accordingly.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 .../devicetree/bindings/media/i2c/imx274.txt  | 33 ---------
 .../devicetree/bindings/media/i2c/imx274.yaml | 74 +++++++++++++++++++
 MAINTAINERS                                   |  2 +-
 3 files changed, 75 insertions(+), 34 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/media/i2c/imx274.txt
 create mode 100644 Documentation/devicetree/bindings/media/i2c/imx274.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/imx274.txt b/Documentation/devicetree/bindings/media/i2c/imx274.txt
deleted file mode 100644
index 80f2e89568e1..000000000000
--- a/Documentation/devicetree/bindings/media/i2c/imx274.txt
+++ /dev/null
@@ -1,33 +0,0 @@
-* Sony 1/2.5-Inch 8.51Mp CMOS Digital Image Sensor
-
-The Sony imx274 is a 1/2.5-inch CMOS active pixel digital image sensor with
-an active array size of 3864H x 2202V. It is programmable through I2C
-interface. The I2C address is fixed to 0x1a as per sensor data sheet.
-Image data is sent through MIPI CSI-2, which is configured as 4 lanes
-at 1440 Mbps.
-
-
-Required Properties:
-- compatible: value should be "sony,imx274" for imx274 sensor
-- reg: I2C bus address of the device
-
-Optional Properties:
-- reset-gpios: Sensor reset GPIO
-
-The imx274 device node should contain one 'port' child node with
-an 'endpoint' subnode. For further reading on port node refer to
-Documentation/devicetree/bindings/media/video-interfaces.txt.
-
-Example:
-	sensor@1a {
-		compatible = "sony,imx274";
-		reg = <0x1a>;
-		#address-cells = <1>;
-		#size-cells = <0>;
-		reset-gpios = <&gpio_sensor 0 0>;
-		port {
-			sensor_out: endpoint {
-				remote-endpoint = <&csiss_in>;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/media/i2c/imx274.yaml b/Documentation/devicetree/bindings/media/i2c/imx274.yaml
new file mode 100644
index 000000000000..acbc5690cad0
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/imx274.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/imx274.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sony 1/2.5-Inch 8.51Mp CMOS Digital Image Sensor
+
+maintainers:
+  - Leon Luo <leonl@leopardimaging.com>
+
+description: -|
+  The Sony imx274 is a 1/2.5-inch CMOS active pixel digital image sensor with
+  an active array size of 3864H x 2202V. It is programmable through I2C
+  interface. The I2C address is fixed to 0x1a as per sensor data sheet.
+  Image data is sent through MIPI CSI-2, which is configured as 4 lanes
+  at 1440 Mbps.
+
+properties:
+  compatible:
+    const: sony,imx274
+
+  reg:
+    description: I2C device address
+    maxItems: 1
+
+  reset-gpios:
+    description: Sensor reset GPIO.
+    maxItems: 1
+
+  port:
+    type: object
+    description: |
+      The device node must contain one 'port' child node for its digital output
+      video port, in accordance with the video interface bindings defined in
+      Documentation/devicetree/bindings/media/video-interfaces.txt.
+
+    properties:
+      endpoint:
+        type: object
+        properties:
+          remote-endpoint:
+            description: A phandle to the bus receiver's endpoint node.
+
+        required:
+          - remote-endpoint
+
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - port
+
+examples:
+  - |
+    i2c0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        imx274: camera-sensor@1a {
+            compatible = "sony,imx274";
+            reg = <0x1a>;
+            reset-gpios = <&gpio_sensor 0 0>;
+
+            port {
+                sensor_out: endpoint {
+                    remote-endpoint = <&csiss_in>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 8f9b94aaea84..a30f08ddaead 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15922,7 +15922,7 @@ M:	Leon Luo <leonl@leopardimaging.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 T:	git git://linuxtv.org/media_tree.git
-F:	Documentation/devicetree/bindings/media/i2c/imx274.txt
+F:	Documentation/devicetree/bindings/media/i2c/imx274.yaml
 F:	drivers/media/i2c/imx274.c

 SONY IMX290 SENSOR DRIVER
--
2.27.0

