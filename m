Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BFC219EE85
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Apr 2020 01:23:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727857AbgDEXXi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 5 Apr 2020 19:23:38 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:34620 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727841AbgDEXXi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 5 Apr 2020 19:23:38 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DEE7A11F3;
        Mon,  6 Apr 2020 01:23:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586129016;
        bh=pozkGKqsejRbmYLU+Z9/Qc6jJ4lh6jNC1qZjC+6WgXg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VaGB8RqOtdzpW4lQ9pICbW2qCFctwmJy+xA9hWReq9Cil8t08EUV1AgX+AnCibIbB
         aamMeACfSLHD5VFIYzgggnsT0s+p1sLFKmoGbBnM9kAHSY94Zg5aHEFeY47iY9AaDb
         xWasmI2Y4WgTKj7NglBA/d9fEpOBGevJfRCeqD9o=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     devicetree@vger.kernel.org
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Rob Herring <robh+dt@kernel.org>
Subject: [PATCH 3/4] dt-bindings: display: bridge: thc63lvd1024: Convert binding to YAML
Date:   Mon,  6 Apr 2020 02:23:17 +0300
Message-Id: <20200405232318.26833-4-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200405232318.26833-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200405232318.26833-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Convert the Thine THC63LVD1024 text binding to YAML.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../display/bridge/thine,thc63lvd1024.txt     |  66 ----------
 .../display/bridge/thine,thc63lvd1024.yaml    | 121 ++++++++++++++++++
 2 files changed, 121 insertions(+), 66 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt
 create mode 100644 Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt b/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt
deleted file mode 100644
index d17d1e5820d7..000000000000
--- a/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.txt
+++ /dev/null
@@ -1,66 +0,0 @@
-Thine Electronics THC63LVD1024 LVDS decoder
--------------------------------------------
-
-The THC63LVD1024 is a dual link LVDS receiver designed to convert LVDS streams
-to parallel data outputs. The chip supports single/dual input/output modes,
-handling up to two LVDS input streams and up to two digital CMOS/TTL outputs.
-
-Single or dual operation mode, output data mapping and DDR output modes are
-configured through input signals and the chip does not expose any control bus.
-
-Required properties:
-- compatible: Shall be "thine,thc63lvd1024"
-- vcc-supply: Power supply for TTL output, TTL CLOCKOUT signal, LVDS input,
-  PPL and digital circuitry
-
-Optional properties:
-- powerdown-gpios: Power down GPIO signal, pin name "/PDWN". Active low
-- oe-gpios: Output enable GPIO signal, pin name "OE". Active high
-
-The THC63LVD1024 video port connections are modeled according
-to OF graph bindings specified by Documentation/devicetree/bindings/graph.txt
-
-Required video port nodes:
-- port@0: First LVDS input port
-- port@2: First digital CMOS/TTL parallel output
-
-Optional video port nodes:
-- port@1: Second LVDS input port
-- port@3: Second digital CMOS/TTL parallel output
-
-The device can operate in single-link mode or dual-link mode. In single-link
-mode, all pixels are received on port@0, and port@1 shall not contain any
-endpoint. In dual-link mode, even-numbered pixels are received on port@0 and
-odd-numbered pixels on port@1, and both port@0 and port@1 shall contain
-endpoints.
-
-Example:
---------
-
-	thc63lvd1024: lvds-decoder {
-		compatible = "thine,thc63lvd1024";
-
-		vcc-supply = <&reg_lvds_vcc>;
-		powerdown-gpios = <&gpio4 15 GPIO_ACTIVE_LOW>;
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@0 {
-				reg = <0>;
-
-				lvds_dec_in_0: endpoint {
-					remote-endpoint = <&lvds_out>;
-				};
-			};
-
-			port@2{
-				reg = <2>;
-
-				lvds_dec_out_2: endpoint {
-					remote-endpoint = <&adv7511_in>;
-				};
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.yaml b/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.yaml
new file mode 100644
index 000000000000..469ac4a34273
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/thine,thc63lvd1024.yaml
@@ -0,0 +1,121 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/thine,thc63lvd1024.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Thine Electronics THC63LVD1024 LVDS Decoder
+
+maintainers:
+  - Jacopo Mondi <jacopo+renesas@jmondi.org>
+  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
+
+description: |
+  The THC63LVD1024 is a dual link LVDS receiver designed to convert LVDS
+  streams to parallel data outputs. The chip supports single/dual input/output
+  modes, handling up to two LVDS input streams and up to two digital CMOS/TTL
+  outputs.
+
+  Single or dual operation mode, output data mapping and DDR output modes are
+  configured through input signals and the chip does not expose any control
+  bus.
+
+properties:
+  compatible:
+    const: thine,thc63lvd1024
+
+  ports:
+    type: object
+    description: |
+      This device has four video ports. Their connections are modeled using the
+      OF graph bindings specified in Documentation/devicetree/bindings/graph.txt.
+
+      The device can operate in single-link mode or dual-link mode. In
+      single-link mode, all pixels are received on port@0, and port@1 shall not
+      contain any endpoint. In dual-link mode, even-numbered pixels are
+      received on port@0 and odd-numbered pixels on port@1, and both port@0 and
+      port@1 shall contain endpoints.
+
+    properties:
+      '#address-cells':
+        const: 1
+
+      '#size-cells':
+        const: 0
+
+      port@0:
+        type: object
+        description: First LVDS input port
+
+      port@1:
+        type: object
+        description: Second LVDS input port
+
+      port@2:
+        type: object
+        description: First digital CMOS/TTL parallel output
+
+      port@3:
+        type: object
+        description: Second digital CMOS/TTL parallel output
+
+    required:
+      - port@0
+      - port@2
+
+    additionalProperties: false
+
+  oe-gpios:
+    maxItems: 1
+    description: Output enable GPIO signal, pin name "OE", active high.
+
+  powerdown-gpios:
+    maxItems: 1
+    description: Power down GPIO signal, pin name "/PDWN", active low.
+
+  vcc-supply:
+    maxItems: 1
+    description:
+      Power supply for the TTL output, TTL CLOCKOUT signal, LVDS input, PLL and
+      digital circuitry.
+
+required:
+  - compatible
+  - ports
+  - vcc-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    lvds-decoder {
+        compatible = "thine,thc63lvd1024";
+
+        vcc-supply = <&reg_lvds_vcc>;
+        powerdown-gpios = <&gpio4 15 GPIO_ACTIVE_LOW>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                lvds_dec_in_0: endpoint {
+                    remote-endpoint = <&lvds_out>;
+                };
+            };
+
+            port@2 {
+                reg = <2>;
+
+                lvds_dec_out_2: endpoint {
+                    remote-endpoint = <&adv7511_in>;
+                };
+            };
+        };
+    };
+
+...
-- 
Regards,

Laurent Pinchart

