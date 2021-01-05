Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4590D2EA542
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  5 Jan 2021 07:10:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725766AbhAEGKJ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 5 Jan 2021 01:10:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725535AbhAEGKJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Jan 2021 01:10:09 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31630C061574;
        Mon,  4 Jan 2021 22:09:29 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A7A03878;
        Tue,  5 Jan 2021 07:08:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1609826926;
        bh=JIba0CJH123Gme14P+fqrKrVNZ9cfWs3p53uWjTnBWA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZCiONuoN+RK5++4ugdjBJ7jdyA0xBeLvaQwgnN0tWLiYvHA8URqMkEwPeARv5PFdi
         8/wGj+SqfjkauaPLaXTMQsmatqoxNHI/mu+EE8KuVuF+TBLTDactBKgwPmmb1PcHpP
         78+9aH0N4c3oYG8mbElFT/Eq7l3IgG5vArooy94o=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Sandy Huang <hjc@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Mark Yao <markyao0591@gmail.com>
Subject: [PATCH v3 3/6] dt-bindings: display: imx: hdmi: Convert binding to YAML
Date:   Tue,  5 Jan 2021 08:08:15 +0200
Message-Id: <20210105060818.24158-4-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210105060818.24158-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20210105060818.24158-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Convert the i.MX6 HDMI TX text binding to YAML.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v1:

- Only specify maxItems for clocks
- Drop reg and interrupts as they're checked in the base schema
- Rebase on top of OF graph schema, dropped redundant properties
- Fix identation for enum entries
- Drop clock-names items, use maxItems only
---
 .../bindings/display/imx/fsl,imx6-hdmi.yaml   | 130 ++++++++++++++++++
 .../devicetree/bindings/display/imx/hdmi.txt  |  65 ---------
 2 files changed, 130 insertions(+), 65 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/imx/hdmi.txt

diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml
new file mode 100644
index 000000000000..f9b131bb3339
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml
@@ -0,0 +1,130 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/imx/fsl,imx6-hdmi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX6 DWC HDMI TX Encoder
+
+maintainers:
+  - Philipp Zabel <p.zabel@pengutronix.de>
+
+description: |
+  The HDMI transmitter is a Synopsys DesignWare HDMI 1.4 TX controller IP
+  with a companion PHY IP.
+
+allOf:
+  - $ref: ../bridge/synopsys,dw-hdmi.yaml#
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx6dl-hdmi
+      - fsl,imx6q-hdmi
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
+  ddc-i2c-bus:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      The HDMI DDC bus can be connected to either a system I2C master or the
+      functionally-reduced I2C master contained in the DWC HDMI. When connected
+      to a system I2C master this property contains a phandle to that I2C
+      master controller.
+
+  gpr:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      phandle to the iomuxc-gpr region containing the HDMI multiplexer control
+      register.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    description: |
+      This device has four video ports, corresponding to the four inputs of the
+      HDMI multiplexer. Each port shall have a single endpoint.
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: First input of the HDMI multiplexer
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: Second input of the HDMI multiplexer
+
+      port@2:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: Third input of the HDMI multiplexer
+
+      port@3:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: Fourth input of the HDMI multiplexer
+
+    anyOf:
+      - required:
+          - port@0
+      - required:
+          - port@1
+      - required:
+          - port@2
+      - required:
+          - port@3
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - gpr
+  - interrupts
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx6qdl-clock.h>
+
+    hdmi: hdmi@120000 {
+        reg = <0x00120000 0x9000>;
+        interrupts = <0 115 0x04>;
+        gpr = <&gpr>;
+        clocks = <&clks IMX6QDL_CLK_HDMI_IAHB>,
+                 <&clks IMX6QDL_CLK_HDMI_ISFR>;
+        clock-names = "iahb", "isfr";
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+
+                hdmi_mux_0: endpoint {
+                    remote-endpoint = <&ipu1_di0_hdmi>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+
+                hdmi_mux_1: endpoint {
+                    remote-endpoint = <&ipu1_di1_hdmi>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/display/imx/hdmi.txt b/Documentation/devicetree/bindings/display/imx/hdmi.txt
deleted file mode 100644
index 6d021e71c9cf..000000000000
--- a/Documentation/devicetree/bindings/display/imx/hdmi.txt
+++ /dev/null
@@ -1,65 +0,0 @@
-Freescale i.MX6 DWC HDMI TX Encoder
-===================================
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
-- compatible : Shall be one of "fsl,imx6q-hdmi" or "fsl,imx6dl-hdmi".
-- reg: See dw_hdmi.txt.
-- interrupts: HDMI interrupt number
-- clocks: See dw_hdmi.txt.
-- clock-names: Shall contain "iahb" and "isfr" as defined in dw_hdmi.txt.
-- ports: See dw_hdmi.txt. The DWC HDMI shall have between one and four ports,
-  numbered 0 to 3, corresponding to the four inputs of the HDMI multiplexer.
-  Each port shall have a single endpoint.
-- gpr : Shall contain a phandle to the iomuxc-gpr region containing the HDMI
-  multiplexer control register.
-
-Optional properties
-
-- ddc-i2c-bus: The HDMI DDC bus can be connected to either a system I2C master
-  or the functionally-reduced I2C master contained in the DWC HDMI. When
-  connected to a system I2C master this property contains a phandle to that
-  I2C master controller.
-
-
-Example:
-
-	gpr: iomuxc-gpr@20e0000 {
-		/* ... */
-	};
-
-        hdmi: hdmi@120000 {
-                #address-cells = <1>;
-                #size-cells = <0>;
-                compatible = "fsl,imx6q-hdmi";
-                reg = <0x00120000 0x9000>;
-                interrupts = <0 115 0x04>;
-                gpr = <&gpr>;
-                clocks = <&clks 123>, <&clks 124>;
-                clock-names = "iahb", "isfr";
-                ddc-i2c-bus = <&i2c2>;
-
-                port@0 {
-                        reg = <0>;
-
-                        hdmi_mux_0: endpoint {
-                                remote-endpoint = <&ipu1_di0_hdmi>;
-                        };
-                };
-
-                port@1 {
-                        reg = <1>;
-
-                        hdmi_mux_1: endpoint {
-                                remote-endpoint = <&ipu1_di1_hdmi>;
-                        };
-                };
-        };
-- 
Regards,

Laurent Pinchart

