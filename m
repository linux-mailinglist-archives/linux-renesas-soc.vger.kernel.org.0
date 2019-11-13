Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E5DDFB43A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Nov 2019 16:52:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728028AbfKMPwW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Nov 2019 10:52:22 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:28234 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727907AbfKMPwW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Nov 2019 10:52:22 -0500
X-IronPort-AV: E=Sophos;i="5.68,300,1569250800"; 
   d="scan'208";a="31380904"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 14 Nov 2019 00:52:21 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id B9714400EE6B;
        Thu, 14 Nov 2019 00:52:16 +0900 (JST)
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
Subject: [PATCH v4 08/13] dt-bindings: display: bridge: Repurpose lvds-encoder
Date:   Wed, 13 Nov 2019 15:51:27 +0000
Message-Id: <1573660292-10629-9-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

In an effort to repurpose lvds-encoder.c to also serve the
function of LVDS decoders, we ended up defining a new "generic"
compatible string ("lvds-decoder"), therefore adapt the dt schema
to allow for the new compatible string.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

---
v3->v4:
* Improved title and description according to Laurent's comments
* Reworked definition of the compatible property
v2->v3:
* Extracted conversion to lvds-codec as per Rob's comment
v1->v2:
* Converted to dt-schema as per Neil's comment
---
 .../{lvds-transmitter.yaml => lvds-codec.yaml}     | 54 +++++++++++++++++-----
 1 file changed, 42 insertions(+), 12 deletions(-)
 rename Documentation/devicetree/bindings/display/bridge/{lvds-transmitter.yaml => lvds-codec.yaml} (61%)

diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
similarity index 61%
rename from Documentation/devicetree/bindings/display/bridge/lvds-transmitter.yaml
rename to Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
index 27de616..0ecc8a4 100644
--- a/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
@@ -1,17 +1,17 @@
 # SPDX-License-Identifier: GPL-2.0
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/display/bridge/lvds-transmitter.yaml#
+$id: http://devicetree.org/schemas/display/bridge/lvds-codec.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Parallel to LVDS Encoder
+title: Transparent LVDS encoders and decoders
 
 maintainers:
   - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
 
 description: |
-  This binding supports the parallel to LVDS encoders that don't require any
-  configuration.
+  This binding supports transparent LVDS encoders and decoders that don't
+  require any configuration.
 
   LVDS is a physical layer specification defined in ANSI/TIA/EIA-644-A. Multiple
   incompatible data link layers have been used over time to transmit image data
@@ -33,12 +33,14 @@ properties:
     description: |
       Must list the device specific compatible string first, followed by the
       generic compatible string.
-    items:
-      - enum:
-        - ti,ds90c185       # For the TI DS90C185 FPD-Link Serializer
-        - ti,ds90c187       # For the TI DS90C187 FPD-Link Serializer
-        - ti,sn75lvds83     # For the TI SN75LVDS83 FlatLink transmitter
-      - const: lvds-encoder # Generic LVDS encoder compatible fallback
+    oneOf:
+      - items:
+        - enum:
+          - ti,ds90c185       # For the TI DS90C185 FPD-Link Serializer
+          - ti,ds90c187       # For the TI DS90C187 FPD-Link Serializer
+          - ti,sn75lvds83     # For the TI SN75LVDS83 FlatLink transmitter
+        - const: lvds-encoder # Generic LVDS encoder compatible fallback
+      - const: lvds-decoder   # Generic LVDS decoders compatible fallback
 
   ports:
     type: object
@@ -49,12 +51,14 @@ properties:
       port@0:
         type: object
         description: |
-          Port 0 is for parallel input
+          With LVDS encoders port 0 is for parallel input
+          With LVDS decoders port 0 is for LVDS input
 
       port@1:
         type: object
         description: |
-          Port 1 is for LVDS output
+          With LVDS encoders port 1 is for LVDS output
+          With LVDS decoders port 1 is for parallel output
 
     required:
       - port@0
@@ -96,4 +100,30 @@ examples:
       };
     };
 
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
 ...
-- 
2.7.4

