Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E8D52F5AD3
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 14 Jan 2021 07:45:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726204AbhANGpo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 14 Jan 2021 01:45:44 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:47078 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726117AbhANGpo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Jan 2021 01:45:44 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 167DC8EF;
        Thu, 14 Jan 2021 07:45:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1610606700;
        bh=ulH+lkU6ALvAMwX010xHvwAxyk8SwSjZwDOwScyY+KU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=U9sSAnGtby4v6PxsTqt0N8WpNTBuekUQ/UjZdyVcUKm9XBPqhu7W61Zo4gw1jU3Pn
         3+72hjyOOc6FxGAlc7NY2cde7Ql9geM2FcCWS9vubRLgR2TGAT4D1/xlb3iw/v0Rqh
         PD5cdD0NueOeIL/8UgVD4QJ1VHYt5ypRk+sBuPy0=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Sandy Huang <hjc@rock-chips.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Yao <markyao0591@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v4 3/7] dt-bindings: display: bridge: renesas,dw-hdmi: Convert binding to YAML
Date:   Thu, 14 Jan 2021 08:44:33 +0200
Message-Id: <20210114064437.5793-4-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210114064437.5793-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20210114064437.5793-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Convert the Renesas R-Car DWC HDMI TX text binding to YAML.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
Changes since v3:

- Use port instead of port-base

Changes since v2:

- Update MAINTAINERS

Changes since v1:

- Drop the part numbers in comments, only keep the SoC names
- Use unevaluatedProperties instead of additionalProperties
- Only specify maxItems for clocks and clock-names
- Drop reg, interrupts, #address-cells and #size-cells as they're
  checked in the base schema
- Use one size and address cell in example
- Rebase on top of OF graph schema, dropped redundant properties
- Fix identation for enum entries
---
 .../display/bridge/renesas,dw-hdmi.txt        |  88 ------------
 .../display/bridge/renesas,dw-hdmi.yaml       | 125 ++++++++++++++++++
 MAINTAINERS                                   |   2 +-
 3 files changed, 126 insertions(+), 89 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
 create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
deleted file mode 100644
index 3f6072651182..000000000000
--- a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
+++ /dev/null
@@ -1,88 +0,0 @@
-Renesas Gen3 DWC HDMI TX Encoder
-================================
-
-The HDMI transmitter is a Synopsys DesignWare HDMI 1.4 TX controller IP
-with a companion PHY IP.
-
-These DT bindings follow the Synopsys DWC HDMI TX bindings defined in
-Documentation/devicetree/bindings/display/bridge/dw_hdmi.txt with the
-following device-specific properties.
-
-
-Required properties:
-
-- compatible : Shall contain one or more of
-  - "renesas,r8a774a1-hdmi" for R8A774A1 (RZ/G2M) compatible HDMI TX
-  - "renesas,r8a774b1-hdmi" for R8A774B1 (RZ/G2N) compatible HDMI TX
-  - "renesas,r8a774e1-hdmi" for R8A774E1 (RZ/G2H) compatible HDMI TX
-  - "renesas,r8a7795-hdmi" for R8A7795 (R-Car H3) compatible HDMI TX
-  - "renesas,r8a7796-hdmi" for R8A7796 (R-Car M3-W) compatible HDMI TX
-  - "renesas,r8a77961-hdmi" for R8A77961 (R-Car M3-W+) compatible HDMI TX
-  - "renesas,r8a77965-hdmi" for R8A77965 (R-Car M3-N) compatible HDMI TX
-  - "renesas,rcar-gen3-hdmi" for the generic R-Car Gen3 and RZ/G2 compatible
-			     HDMI TX
-
-    When compatible with generic versions, nodes must list the SoC-specific
-    version corresponding to the platform first, followed by the
-    family-specific version.
-
-- reg: See dw_hdmi.txt.
-- interrupts: HDMI interrupt number
-- clocks: See dw_hdmi.txt.
-- clock-names: Shall contain "iahb" and "isfr" as defined in dw_hdmi.txt.
-- ports: See dw_hdmi.txt. The DWC HDMI shall have one port numbered 0
-  corresponding to the video input of the controller and one port numbered 1
-  corresponding to its HDMI output, and one port numbered 2 corresponding to
-  sound input of the controller. Each port shall have a single endpoint.
-
-Optional properties:
-
-- power-domains: Shall reference the power domain that contains the DWC HDMI,
-  if any.
-
-
-Example:
-
-	hdmi0: hdmi@fead0000 {
-		compatible = "renesas,r8a7795-hdmi", "renesas,rcar-gen3-hdmi";
-		reg = <0 0xfead0000 0 0x10000>;
-		interrupts = <0 389 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&cpg CPG_CORE R8A7795_CLK_S0D4>, <&cpg CPG_MOD 729>;
-		clock-names = "iahb", "isfr";
-		power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-			port@0 {
-				reg = <0>;
-				dw_hdmi0_in: endpoint {
-					remote-endpoint = <&du_out_hdmi0>;
-				};
-			};
-			port@1 {
-				reg = <1>;
-				rcar_dw_hdmi0_out: endpoint {
-					remote-endpoint = <&hdmi0_con>;
-				};
-			};
-			port@2 {
-				reg = <2>;
-				rcar_dw_hdmi0_sound_in: endpoint {
-					remote-endpoint = <&hdmi_sound_out>;
-				};
-			};
-		};
-	};
-
-	hdmi0-out {
-		compatible = "hdmi-connector";
-		label = "HDMI0 OUT";
-		type = "a";
-
-		port {
-			hdmi0_con: endpoint {
-				remote-endpoint = <&rcar_dw_hdmi0_out>;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.yaml
new file mode 100644
index 000000000000..0c9785c8db51
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.yaml
@@ -0,0 +1,125 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/renesas,dw-hdmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas R-Car DWC HDMI TX Encoder
+
+maintainers:
+  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
+
+description: |
+  The HDMI transmitter is a Synopsys DesignWare HDMI 1.4 TX controller IP
+  with a companion PHY IP.
+
+allOf:
+  - $ref: synopsys,dw-hdmi.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - renesas,r8a774a1-hdmi # for RZ/G2M compatible HDMI TX
+          - renesas,r8a774b1-hdmi # for RZ/G2N compatible HDMI TX
+          - renesas,r8a774e1-hdmi # for RZ/G2H compatible HDMI TX
+          - renesas,r8a7795-hdmi # for R-Car H3 compatible HDMI TX
+          - renesas,r8a7796-hdmi # for R-Car M3-W compatible HDMI TX
+          - renesas,r8a77961-hdmi # for R-Car M3-W+ compatible HDMI TX
+          - renesas,r8a77965-hdmi # for R-Car M3-N compatible HDMI TX
+      - const: renesas,rcar-gen3-hdmi
+
+  reg-io-width:
+    const: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    maxItems: 2
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Parallel RGB input port
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: HDMI output port
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Sound input port
+
+    required:
+      - port@0
+      - port@1
+      - port@2
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - ports
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r8a7795-cpg-mssr.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/r8a7795-sysc.h>
+
+    hdmi@fead0000 {
+        compatible = "renesas,r8a7795-hdmi", "renesas,rcar-gen3-hdmi";
+        reg = <0xfead0000 0x10000>;
+        interrupts = <0 389 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&cpg CPG_CORE R8A7795_CLK_S0D4>, <&cpg CPG_MOD 729>;
+        clock-names = "iahb", "isfr";
+        power-domains = <&sysc R8A7795_PD_ALWAYS_ON>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            port@0 {
+                reg = <0>;
+                dw_hdmi0_in: endpoint {
+                    remote-endpoint = <&du_out_hdmi0>;
+                };
+            };
+            port@1 {
+                reg = <1>;
+                rcar_dw_hdmi0_out: endpoint {
+                    remote-endpoint = <&hdmi0_con>;
+                };
+            };
+            port@2 {
+                reg = <2>;
+                rcar_dw_hdmi0_sound_in: endpoint {
+                    remote-endpoint = <&hdmi_sound_out>;
+                };
+            };
+        };
+    };
+
+    hdmi0-out {
+        compatible = "hdmi-connector";
+        label = "HDMI0 OUT";
+        type = "a";
+
+        port {
+            hdmi0_con: endpoint {
+                remote-endpoint = <&rcar_dw_hdmi0_out>;
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 094e52838542..318b694dba61 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5948,7 +5948,7 @@ L:	dri-devel@lists.freedesktop.org
 L:	linux-renesas-soc@vger.kernel.org
 S:	Supported
 T:	git git://linuxtv.org/pinchartl/media drm/du/next
-F:	Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
+F:	Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.yaml
 F:	Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
 F:	Documentation/devicetree/bindings/display/renesas,du.yaml
 F:	drivers/gpu/drm/rcar-du/
-- 
Regards,

Laurent Pinchart

