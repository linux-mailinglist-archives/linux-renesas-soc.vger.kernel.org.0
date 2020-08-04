Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6602223BF0C
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  4 Aug 2020 19:48:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729864AbgHDRsn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 4 Aug 2020 13:48:43 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:1260 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729871AbgHDRsk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 4 Aug 2020 13:48:40 -0400
X-IronPort-AV: E=Sophos;i="5.75,434,1589209200"; 
   d="scan'208";a="53862809"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 05 Aug 2020 02:48:37 +0900
Received: from localhost.localdomain (unknown [172.29.52.222])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 9DCCF40B92DF;
        Wed,  5 Aug 2020 02:48:34 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH 1/5] dt-bindings: usb: convert ti,hd3ss3220 bindings to json-schema
Date:   Tue,  4 Aug 2020 18:48:24 +0100
Message-Id: <20200804174828.8339-2-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200804174828.8339-1-biju.das.jz@bp.renesas.com>
References: <20200804174828.8339-1-biju.das.jz@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Convert ti,hd3ss3220.txt to YAML. Updated the binding documentation
as graph bindings of this device model Super Speed (SS) data bus to
the Super Speed (SS) capable connector.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Ref: https://patchwork.kernel.org/patch/11669423/
---
 .../devicetree/bindings/usb/ti,hd3ss3220.txt  | 38 ---------
 .../devicetree/bindings/usb/ti,hd3ss3220.yaml | 81 +++++++++++++++++++
 2 files changed, 81 insertions(+), 38 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt
 create mode 100644 Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml

diff --git a/Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.txt
deleted file mode 100644
index 2bd21b22ce95..000000000000
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
index 000000000000..5c7c7d782a04
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/ti,hd3ss3220.yaml
@@ -0,0 +1,81 @@
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
+  ports:
+    description: OF graph bindings (specified in bindings/graph.txt) that model
+      SS data bus to the SS capable connector.
+    type: object
+    properties:
+      port@0:
+        type: object
+        description: Super Speed (SS) capable connector.
+
+      port@1:
+        type: object
+        description: Super Speed (SS) data bus.
+
+    required:
+      - port@0
+      - port@1
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
+    	#address-cells = <1>;
+    	#size-cells = <0>;
+
+    	hd3ss3220@47 {
+    		compatible = "ti,hd3ss3220";
+    		reg = <0x47>;
+    		interrupt-parent = <&gpio6>;
+    		interrupts = <3>;
+
+    		ports {
+    			#address-cells = <1>;
+    			#size-cells = <0>;
+    			port@0 {
+    				reg = <0>;
+    				hd3ss3220_in_ep: endpoint {
+    					remote-endpoint = <&ss_ep>;
+    				};
+    			};
+    			port@1 {
+    				reg = <1>;
+    				hd3ss3220_out_ep: endpoint {
+    					remote-endpoint = <&usb3_role_switch>;
+    				};
+    			};
+    		};
+    	};
+    };
-- 
2.17.1

