Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 368B4F3947
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  7 Nov 2019 21:11:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726800AbfKGUL0 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 7 Nov 2019 15:11:26 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:7666 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725906AbfKGUL0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Nov 2019 15:11:26 -0500
X-IronPort-AV: E=Sophos;i="5.68,279,1569250800"; 
   d="scan'208";a="30895656"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 08 Nov 2019 05:11:25 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 3B6274008C62;
        Fri,  8 Nov 2019 05:11:21 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Neil Armstrong <narmstrong@baylibre.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Andrzej Hajda <a.hajda@samsung.com>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Peter Rosin <peda@axentia.se>, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v3 3/7] dt-bindings: display: bridge: Repurpose lvds-encoder
Date:   Thu,  7 Nov 2019 20:10:59 +0000
Message-Id: <1573157463-14070-4-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573157463-14070-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1573157463-14070-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

In an effort to repurpose lvds-encoder.c to also serve the
function of LVDS decoders, we ended up defining a new "generic"
compatible string, therefore adapt the dt-bindings to fit the
new purpose.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

---
v2->v3:
* Extracted conversion to lvds-codec as per Rob's comment
v1->v2:
* Converted to dt-schema as per Neil's comment
---
 .../bindings/display/bridge/lvds-codec.yaml        | 120 +++++++++++++++++++++
 .../bindings/display/bridge/lvds-transmitter.yaml  |  91 ----------------
 2 files changed, 120 insertions(+), 91 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/lvds-transmitter.yaml

diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
new file mode 100644
index 0000000..3ebdf96
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
@@ -0,0 +1,120 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/lvds-codec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Transparent LVDS encoders and LVDS decoders
+
+maintainers:
+  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
+
+description: |
+  This binding supports transparent LVDS encoders and LVDS decoders that don't
+  require any configuration.
+
+  LVDS is a physical layer specification defined in ANSI/TIA/EIA-644-A. Multiple
+  incompatible data link layers have been used over time to transmit image data
+  to LVDS panels. This binding targets devices compatible with the following
+  specifications only.
+
+  [JEIDA] "Digital Interface Standards for Monitor", JEIDA-59-1999, February
+  1999 (Version 1.0), Japan Electronic Industry Development Association (JEIDA)
+  [LDI] "Open LVDS Display Interface", May 1999 (Version 0.95), National
+  Semiconductor
+  [VESA] "VESA Notebook Panel Standard", October 2007 (Version 1.0), Video
+  Electronics Standards Association (VESA)
+
+  Those devices have been marketed under the FPD-Link and FlatLink brand names
+  among others.
+
+properties:
+  compatible:
+    description: |
+      Any encoder or decoder compatible with this generic binding, but with
+      additional properties not listed here, must define its own binding and
+      list a device specific compatible first followed by the generic compatible
+    enum:
+      - lvds-encoder # for LVDS encoders
+      - lvds-decoder # for LVDS decoders
+
+  ports:
+    type: object
+    description: |
+      This device has two video ports. Their connections are modeled using the
+      OF graph bindings specified in Documentation/devicetree/bindings/graph.txt
+    properties:
+      port@0:
+        type: object
+        description: |
+          With LVDS encoders port 0 is for parallel input
+          With LVDS decoders port 0 is for LVDS input
+
+      port@1:
+        type: object
+        description: |
+          With LVDS encoders port 1 is for LVDS output
+          With LVDS decoders port 1 is for parallel output
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - ports
+
+examples:
+  - |
+    lvds-encoder {
+      compatible = "lvds-encoder";
+
+      ports {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        port@0 {
+          reg = <0>;
+
+          lvds_enc_in: endpoint {
+            remote-endpoint = <&display_out_rgb>;
+          };
+        };
+
+        port@1 {
+          reg = <1>;
+
+          lvds_enc_out: endpoint {
+            remote-endpoint = <&lvds_panel_in>;
+          };
+        };
+      };
+    };
+
+  - |
+    lvds-decoder {
+      compatible = "lvds-decoder";
+
+      ports {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        port@0 {
+          reg = <0>;
+
+          lvds_dec_in: endpoint {
+            remote-endpoint = <&display_out_lvds>;
+          };
+        };
+
+        port@1 {
+          reg = <1>;
+
+          lvds_dec_out: endpoint {
+            remote-endpoint = <&rgb_panel_in>;
+          };
+        };
+      };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.yaml
deleted file mode 100644
index 5be163a..0000000
--- a/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.yaml
+++ /dev/null
@@ -1,91 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/display/bridge/lvds-transmitter.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Parallel to LVDS Encoder
-
-maintainers:
-  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
-
-description: |
-  This binding supports the parallel to LVDS encoders that don't require any
-  configuration.
-
-  LVDS is a physical layer specification defined in ANSI/TIA/EIA-644-A. Multiple
-  incompatible data link layers have been used over time to transmit image data
-  to LVDS panels. This binding targets devices compatible with the following
-  specifications only.
-
-  [JEIDA] "Digital Interface Standards for Monitor", JEIDA-59-1999, February
-  1999 (Version 1.0), Japan Electronic Industry Development Association (JEIDA)
-  [LDI] "Open LVDS Display Interface", May 1999 (Version 0.95), National
-  Semiconductor
-  [VESA] "VESA Notebook Panel Standard", October 2007 (Version 1.0), Video
-  Electronics Standards Association (VESA)
-
-  Those devices have been marketed under the FPD-Link and FlatLink brand names
-  among others.
-
-properties:
-  compatible:
-    description: |
-      Any encoder or decoder compatible with this generic binding, but with
-      additional properties not listed here, must define its own binding and
-      list a device specific compatible first followed by the generic compatible
-    enum:
-      - lvds-encoder
-
-  ports:
-    type: object
-    description: |
-      This device has two video ports. Their connections are modeled using the
-      OF graph bindings specified in Documentation/devicetree/bindings/graph.txt
-    properties:
-      port@0:
-        type: object
-        description: |
-          Port 0 is for parallel input
-
-      port@1:
-        type: object
-        description: |
-          Port 1 is for LVDS output
-
-    required:
-      - port@0
-      - port@1
-
-required:
-  - compatible
-  - ports
-
-examples:
-  - |
-    lvds-encoder {
-      compatible = "lvds-encoder";
-
-      ports {
-        #address-cells = <1>;
-        #size-cells = <0>;
-
-        port@0 {
-          reg = <0>;
-
-          lvds_enc_in: endpoint {
-            remote-endpoint = <&display_out_rgb>;
-          };
-        };
-
-        port@1 {
-          reg = <1>;
-
-          lvds_enc_out: endpoint {
-            remote-endpoint = <&lvds_panel_in>;
-          };
-        };
-      };
-    };
-
-...
-- 
2.7.4

