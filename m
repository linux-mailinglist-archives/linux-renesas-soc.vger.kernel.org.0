Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A75671ABE19
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 16 Apr 2020 12:39:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505164AbgDPKju (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 16 Apr 2020 06:39:50 -0400
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:54501 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2505144AbgDPKjJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Apr 2020 06:39:09 -0400
X-Originating-IP: 2.224.242.101
Received: from uno.homenet.telecomitalia.it (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
        (Authenticated sender: jacopo@jmondi.org)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 0620660010;
        Thu, 16 Apr 2020 10:38:56 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     kieran.bingham+renesas@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org, robh@kernel.org
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        laurent.pinchart@ideasonboard.com, niklas.soderlund@ragnatech.se,
        hyunk@xilinx.com, manivannan.sadhasivam@linaro.org,
        devicetree@vger.kernel.org
Subject: [v8-rc1 19/20] dt-bindings: media: i2c: Add bindings for IMI RDACM2x
Date:   Thu, 16 Apr 2020 12:40:51 +0200
Message-Id: <20200416104052.2643098-20-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200416104052.2643098-1-jacopo+renesas@jmondi.org>
References: <20200416104052.2643098-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The IMI RDACM20 and IMI RDACM21 are Gigabit Multimedia Serial Link (GMSL) camera
capable of transmitting video and I2C control messages on a coax cable
physical link for automotive applications.

Document their device tree bindings.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

---
v2:
 - Provide imi vendor prefix
 - Fix minor spelling

v3:
 - update binding descriptions

v4:
 - No change

v5:
 - Specify optional third reg address for the MCU

v7:
 [Jacopo]
 - Rename to imi,rdacm2x-gmsl.yaml
 - Exand bindings to describe RDACM21

v8:
 - no changes

---
 .../bindings/media/i2c/imi,rdacm2x-gmsl.yaml  | 161 ++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 2 files changed, 163 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/imi,rdacm2x-gmsl.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/imi,rdacm2x-gmsl.yaml b/Documentation/devicetree/bindings/media/i2c/imi,rdacm2x-gmsl.yaml
new file mode 100644
index 000000000000..8476e99b46b5
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/imi,rdacm2x-gmsl.yaml
@@ -0,0 +1,161 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+# Copyright (C) 2019 Renesas Electronics Corp.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/imi,rdacm2x-gmsl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title:  IMI D&D RDACM20 and RDACM21 Automotive Camera Platforms
+
+maintainers:
+  - Jacopo Mondi <jacopo+renesas@jmondi.org>
+  - Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
+  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
+  - Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
+
+description: -|
+  The IMI D&D RDACM20 and RDACM21 are GMSL-compatible camera designed for
+  automotive applications.
+
+  The RDACM20 camera module encloses a Maxim Integrated MAX9271 GMSL serializer,
+  coupled with an OV10635 image sensor and an embedded MCU. Both the MCU and
+  the image sensor are connected to the serializer local I2C bus and are
+  accessible by the host SoC by direct addressing.
+
+  The RDACM21 camera module encloses the same serializer, coupled with an
+  OV10640 image sensor and an OV490 ISP. Only the OV490 ISP is interfaced to
+  the serializer local I2C bus while the image sensor is not accessible from
+  the host SoC.
+
+  They both connect to a remote GMSL endpoint through a coaxial cable.
+
+                                                   IMI RDACM20
+  +---------------+                        +--------------------------------+
+  |      GMSL     |   <- Video Stream      |       <- Video--------\        |
+  |               |< === GMSL Link ====== >|MAX9271<- I2C bus-> <-->OV10635 |
+  | de-serializer |   <- I2C messages ->   |                   \<-->MCU     |
+  +---------------+                        +--------------------------------+
+
+                                                   IMI RDACM21
+  +---------------+                        +--------------------------------+
+  |      GMSL     |   <- Video Stream      |       <- Video--------\        |
+  |               |< === GMSL Link ====== >|MAX9271<- I2C bus-> <-->OV490   |
+  |               |   <- I2C messages ->   |                          |     |
+  | de-serializer |                        |          OV10640 <-------|     |
+  +---------------+                        +--------------------------------+
+
+  Both camera modules serialize video data generated by the embedded camera
+  sensor on the GMSL serial channel to a remote GMSL de-serializer. They also
+  receive and transmit I2C messages encapsulated and transmitted on the GMSL
+  bidirectional control channel.
+
+  All I2C traffic received on the GMSL link not directed to the serializer is
+  propagated on the local I2C bus to the remote device there connected. All the
+  I2C traffic generated on the local I2C bus not directed to the serializer is
+  propagated to the remote de-serializer encapsulated in the GMSL control
+  channel.
+
+  The RDACM20 and RDACM21 DT node should be a direct child of the GMSL
+  deserializer's I2C bus corresponding to the GMSL link that the camera is
+  attached to.
+
+properties:
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+  compatible:
+    oneOf:
+      - items:
+        - enum:
+          - imi,rdacm20
+          - imi,rdacm21
+
+  reg:
+    description: -|
+      I2C device addresses, the first to be assigned to the serializer, the
+      following ones to be assigned to the remote devices.
+
+      For RDACM20 the second entry of the property is assigned to the
+      OV10635 image sensor and the optional third one to the embedded MCU.
+
+      For RDACM21 the second entry is assigned to the OV490 ISP and the optional
+      third one ignored.
+
+    minItems: 2
+    maxItems: 3
+
+  port:
+    type: object
+    additionalProperties: false
+    description: -|
+      Connection to the remote GMSL endpoint are modelled using the OF graph
+      bindings in accordance with the video interface bindings defined in
+      Documentation/devicetree/bindings/media/video-interfaces.txt.
+
+      The device node contains a single "port" child node with a single
+      "endpoint" sub-device.
+
+    properties:
+      endpoint:
+        type: object
+        additionalProperties: false
+
+        properties:
+          remote-endpoint:
+            description: -|
+              phandle to the remote GMSL endpoint sub-node in the remote node
+              port.
+            maxItems: 1
+
+        required:
+          - remote-endpoint
+
+    required:
+      - endpoint
+
+required:
+  - compatible
+  - reg
+  - port
+
+examples:
+  - |
+    i2c@e66d8000 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      reg = <0 0xe66d8000 0 0x40>;
+
+      camera@31 {
+        compatible = "imi,rdacm20";
+        reg = <0x31>, <0x41>, <0x51>;
+
+        port {
+          rdacm20_out0: endpoint {
+            remote-endpoint = <&max9286_in0>;
+          };
+        };
+      };
+    };
+
+  - |
+    i2c@e66d8000 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      reg = <0 0xe66d8000 0 0x40>;
+
+      camera@31 {
+        compatible = "imi,rdacm21";
+        reg = <0x31>, <0x41>;
+
+        port {
+          rdacm21_out0: endpoint {
+            remote-endpoint = <&max9286_in0>;
+          };
+        };
+      };
+    };
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index d3891386d671..dcbecdc58731 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -453,6 +453,8 @@ patternProperties:
     description: Ingenieurburo Fur Ic-Technologie (I/F/I)
   "^ilitek,.*":
     description: ILI Technology Corporation (ILITEK)
+  "^imi,.*":
+    description: Integrated Micro-Electronics Inc.
   "^img,.*":
     description: Imagination Technologies Ltd.
   "^incircuit,.*":
--
2.26.0

