Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB3AB3D9329
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 28 Jul 2021 18:26:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229542AbhG1Q0t (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 28 Jul 2021 12:26:49 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:56786 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbhG1Q0s (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 28 Jul 2021 12:26:48 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 105A23F;
        Wed, 28 Jul 2021 18:26:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1627489606;
        bh=CQuHJ4sTC6shUZSx8nMiM+y/K6DN7rznAFMUxzECdjg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=u4b51Zv+WUyJeLRz21ZlaBcBHnxwdFalXuPIX4FM/LuFZfN0Zi+AJzEVs6UlvotoE
         K2zOe/7y0GbhV4WLaoh6ge/h+Y3KZmRkvSuDTfDphgfjQiTpIot8XeJeRp3XMtPXrE
         w19yhYgk+zoLsvcR12DVXFyklN1RkYlYGF4P9yX0=
Date:   Wed, 28 Jul 2021 19:26:39 +0300
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [RESEND] [PATCH v2 1/2] dt-bindings: display: bridge: Add binding
 for R-Car MIPI DSI/CSI-2 TX
Message-ID: <YQGFP/cFoSksPyn+@pendragon.ideasonboard.com>
References: <20210623135639.17125-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210623135639.17125-1-laurent.pinchart+renesas@ideasonboard.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The R-Car MIPI DSI/CSI-2 TX is embedded in the Renesas R-Car V3U SoC. It
can operate in either DSI or CSI-2 mode, with up to four data lanes.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
Looks like I forgot to CC the devicetree mailing list and Rob Herring on
the first try. Resending, sorry about that.
---
 .../display/bridge/renesas,dsi-csi2-tx.yaml   | 118 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 119 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
new file mode 100644
index 000000000000..afeeb967393d
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
@@ -0,0 +1,118 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/renesas,dsi-csi2-tx.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Renesas R-Car MIPI DSI/CSI-2 Encoder
+
+maintainers:
+  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
+
+description: |
+  This binding describes the MIPI DSI/CSI-2 encoder embedded in the Renesas
+  R-Car V3U SoC. The encoder can operate in either DSI or CSI-2 mode, with up
+  to four data lanes.
+
+properties:
+  compatible:
+    enum:
+      - renesas,r8a779a0-dsi-csi2-tx    # for V3U
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Functional clock
+      - description: DSI (and CSI-2) functional clock
+      - description: PLL reference clock
+
+  clock-names:
+    items:
+      - const: fck
+      - const: dsi
+      - const: pll
+
+  power-domains:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Parallel input port
+
+      port@1:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        unevaluatedProperties: false
+        description: DSI/CSI-2 output port
+
+        properties:
+          endpoint:
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+
+            properties:
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+            required:
+              - data-lanes
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - power-domains
+  - resets
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/r8a779a0-cpg-mssr.h>
+    #include <dt-bindings/power/r8a779a0-sysc.h>
+
+    dsi0: dsi-encoder@fed80000 {
+        compatible = "renesas,r8a779a0-dsi-csi2-tx";
+        reg = <0xfed80000 0x10000>;
+        power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
+        clocks = <&cpg CPG_MOD 415>,
+                 <&cpg CPG_CORE R8A779A0_CLK_DSI>,
+                 <&cpg CPG_CORE R8A779A0_CLK_CP>;
+        clock-names = "fck", "dsi", "pll";
+        resets = <&cpg 415>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                dsi0_in: endpoint {
+                    remote-endpoint = <&du_out_dsi0>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                dsi0_out: endpoint {
+                    data-lanes = <1 2>;
+                    remote-endpoint = <&sn65dsi86_in>;
+                };
+            };
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index b2cbb5c49358..1c9ea6279189 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6139,6 +6139,7 @@ L:	dri-devel@lists.freedesktop.org
 L:	linux-renesas-soc@vger.kernel.org
 S:	Supported
 T:	git git://linuxtv.org/pinchartl/media drm/du/next
+F:	Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
 F:	Documentation/devicetree/bindings/display/bridge/renesas,dw-hdmi.yaml
 F:	Documentation/devicetree/bindings/display/bridge/renesas,lvds.yaml
 F:	Documentation/devicetree/bindings/display/renesas,du.yaml
-- 
Regards,

Laurent Pinchart

