Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3D8319EE96
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  6 Apr 2020 01:39:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727752AbgDEXjy (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 5 Apr 2020 19:39:54 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:34746 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727612AbgDEXjy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 5 Apr 2020 19:39:54 -0400
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CC6D911C8;
        Mon,  6 Apr 2020 01:39:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1586129990;
        bh=7T8cLer4EoTzawsOTaf1q0N3TgPrr2lLtSOi7wWProw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lEO9rqLfTOvb8mZ1q0eFiuI9psQZubCjA03cGLOf/H0sBqoVEoq9GbobvXTNAKfJz
         JP/++M2BGoJACEjhhWchMSqMYSB/rEIOi7AeF+bMoUhWRYNdksm++oC6ZhExCUOcFX
         hshdQi9/CdF3PC3fTeAtDJpeBVDr0GT2GbAU3GG8=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     devicetree@vger.kernel.org
Cc:     dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
        Maxime Ripard <maxime@cerno.tech>,
        Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mark Yao <mark.yao@rock-chips.com>,
        Sandy Huang <hjc@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>
Subject: [PATCH/RFC 2/6] dt-bindings: display: bridge: renesas,dw-hdmi: Convert binding to YAML
Date:   Mon,  6 Apr 2020 02:39:31 +0300
Message-Id: <20200405233935.27599-3-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200405233935.27599-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20200405233935.27599-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Convert the Renesas R-Car DWC HDMI TX text binding to YAML.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../display/bridge/renesas,dw-hdmi.txt        |  86 -----------
 .../display/bridge/renesas,dw-hdmi.yaml       | 142 ++++++++++++++++++
 2 files changed, 142 insertions(+), 86 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
 create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
deleted file mode 100644
index 819f3e31013c..000000000000
--- a/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.txt
+++ /dev/null
@@ -1,86 +0,0 @@
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
-  - "renesas,r8a7795-hdmi" for R8A7795 (R-Car H3) compatible HDMI TX
-  - "renesas,r8a7796-hdmi" for R8A7796 (R-Car M3-W) compatible HDMI TX
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
-		compatible = "renesas,r8a7795-dw-hdmi";
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
index 000000000000..9a543740c81d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.yaml
@@ -0,0 +1,142 @@
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
+        - renesas,r8a774a1-hdmi # for R8A774A1 (RZ/G2M) compatible HDMI TX
+        - renesas,r8a774b1-hdmi # for R8A774B1 (RZ/G2N) compatible HDMI TX
+        - renesas,r8a7795-hdmi # for R8A7795 (R-Car H3) compatible HDMI TX
+        - renesas,r8a7796-hdmi # for R8A7796 (R-Car M3-W) compatible HDMI TX
+        - renesas,r8a77965-hdmi # for R8A77965 (R-Car M3-N) compatible HDMI TX
+      - const: renesas,rcar-gen3-hdmi
+
+  reg: true
+
+  reg-io-width:
+    const: 1
+
+  clocks:
+    minItems: 2
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: iahb
+      - const: isfr
+
+  interrupts: true
+
+  ports:
+    type: object
+    description: |
+      This device has three video ports. Their connections are modelled using the
+      OF graph bindings specified in Documentation/devicetree/bindings/graph.txt.
+      Each port shall have a single endpoint.
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
+        description: Parallel RGB input port
+
+      port@1:
+        type: object
+        description: HDMI output port
+
+      port@2:
+        type: object
+        description: Sound input port
+
+    required:
+      - port@0
+      - port@1
+      - port@2
+
+    additionalProperties: false
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
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r8a7795-cpg-mssr.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/r8a7795-sysc.h>
+
+    hdmi@fead0000 {
+        compatible = "renesas,r8a7795-hdmi", "renesas,rcar-gen3-hdmi";
+        reg = <0 0xfead0000 0 0x10000>;
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
-- 
Regards,

Laurent Pinchart

