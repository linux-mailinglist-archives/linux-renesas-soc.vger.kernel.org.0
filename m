Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54D5A223610
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 Jul 2020 09:39:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726201AbgGQHi2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 17 Jul 2020 03:38:28 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:41352 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726060AbgGQHi1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Jul 2020 03:38:27 -0400
X-IronPort-AV: E=Sophos;i="5.75,362,1589209200"; 
   d="scan'208";a="52385293"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 17 Jul 2020 16:38:27 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 373614209D48;
        Fri, 17 Jul 2020 16:38:24 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: usb: convert ti,hd3ss3220 bindings to json-schema
Date:   Fri, 17 Jul 2020 08:34:34 +0100
Message-Id: <1594971274-48027-2-git-send-email-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594971274-48027-1-git-send-email-biju.das.jz@bp.renesas.com>
References: <1594971274-48027-1-git-send-email-biju.das.jz@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Convert ti,hd3ss3220.txt to YAML.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../devicetree/bindings/usb/ti,hd3ss3220.txt       | 38 ------------
 .../devicetree/bindings/usb/ti,hd3ss3220.yaml      | 70 ++++++++++++++++++++++
 2 files changed, 70 insertions(+), 38 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt
 create mode 100644 Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml

diff --git a/Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt
deleted file mode 100644
index 2bd21b2..0000000
--- a/Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt
+++ /dev/null
@@ -1,38 +0,0 @@
-TI HD3SS3220 TypeC DRP Port Controller.
-
-Required properties:
- - compatible: Must be "ti,hd3ss3220".
- - reg: I2C slave address, must be 0x47 or 0x67 based on ADDR pin.
- - interrupts: An interrupt specifier.
-
-Required sub-node:
- - connector: The "usb-c-connector" attached to the hd3ss3220 chip. The
-   bindings of the connector node are specified in:
-
-	Documentation/devicetree/bindings/connector/usb-connector.yaml
-
-Example:
-hd3ss3220@47 {
-	compatible = "ti,hd3ss3220";
-	reg = <0x47>;
-	interrupt-parent = <&gpio6>;
-	interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
-
-	connector {
-		compatible = "usb-c-connector";
-		label = "USB-C";
-		data-role = "dual";
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@1 {
-				reg = <1>;
-				hd3ss3220_ep: endpoint {
-					remote-endpoint = <&usb3_role_switch>;
-				};
-			};
-		};
-	};
-};
diff --git a/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml
new file mode 100644
index 0000000..cd7b124
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/ti,hd3ss3220.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI HD3SS3220 TypeC DRP Port Controller
+
+maintainers:
+  - Biju Das <biju.das.jz@bp.renesas.com>
+
+description: |-
+  HD3SS3220 is a USB SuperSpeed (SS) 2:1 mux with DRP port controller. The device provides Channel
+  Configuration (CC) logic and 5V VCONN sourcing for ecosystems implementing USB Type-C. The
+  HD3SS3220 can be configured as a Downstream Facing Port (DFP), Upstream Facing Port (UFP) or a
+  Dual Role Port (DRP) making it ideal for any application.
+
+properties:
+  compatible:
+   const: ti,hd3ss3220
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  connector:
+    $ref: /schemas/connector/usb-connector.yaml#
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        hd3ss3220@47 {
+            compatible = "ti,hd3ss3220";
+            reg = <0x47>;
+            interrupt-parent = <&gpio6>;
+            interrupts = <3>;
+
+            connector {
+                compatible = "usb-c-connector";
+                label = "USB-C";
+                data-role = "dual";
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@1 {
+                        reg = <1>;
+                        hd3ss3220_ep: endpoint {
+                            remote-endpoint = <&usb3_role_switch>;
+                        };
+                    };
+                };
+            };
+        };
+    };
+
+...
-- 
2.7.4

