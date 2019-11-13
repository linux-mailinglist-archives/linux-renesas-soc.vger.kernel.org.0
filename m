Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BB4BFB42D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Nov 2019 16:51:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727996AbfKMPv5 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Nov 2019 10:51:57 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:21771 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726276AbfKMPv5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Nov 2019 10:51:57 -0500
X-IronPort-AV: E=Sophos;i="5.68,300,1569250800"; 
   d="scan'208";a="31593909"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 14 Nov 2019 00:51:56 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id D97E4400E9F7;
        Thu, 14 Nov 2019 00:51:51 +0900 (JST)
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
Subject: [PATCH v4 03/13] dt-bindings: display: bridge: lvds-transmitter: Absorb ti,ds90c185.txt
Date:   Wed, 13 Nov 2019 15:51:22 +0000
Message-Id: <1573660292-10629-4-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

ti,ds90c185.txt documents LVDS encoders using the same driver
as the one documented by lvds-transmitter.yaml.
Since the properties listed in ti,ds90c185.txt are the same
as the ones listed in lvds-transmitter.yaml, absorb the dt-binding
into lvds-transmitter.yaml.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

---
v3->v4:
* New patch
---
 .../bindings/display/bridge/lvds-transmitter.yaml  | 14 +++---
 .../bindings/display/bridge/ti,ds90c185.txt        | 55 ----------------------
 2 files changed, 8 insertions(+), 61 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/ti,ds90c185.txt

diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.yaml
index 2484737..a8326ce 100644
--- a/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.yaml
@@ -31,11 +31,13 @@ description: |
 properties:
   compatible:
     description: |
-      Any encoder compatible with this generic binding, but with additional
-      properties not listed here, must define its own binding and list a device
-      specific compatible first followed by the generic compatible.
-    enum:
-      - lvds-encoder
+      Must list the device specific compatible string first, followed by the
+      generic compatible string.
+    items:
+      - enum:
+        - ti,ds90c185       # For the TI DS90C185 FPD-Link Serializer
+        - ti,ds90c187       # For the TI DS90C187 FPD-Link Serializer
+      - const: lvds-encoder # Generic LVDS encoder compatible fallback
 
   ports:
     type: object
@@ -69,7 +71,7 @@ required:
 examples:
   - |
     lvds-encoder {
-      compatible = "lvds-encoder";
+      compatible = "ti,ds90c185", "lvds-encoder";
 
       ports {
         #address-cells = <1>;
diff --git a/Documentation/devicetree/bindings/display/bridge/ti,ds90c185.txt b/Documentation/devicetree/bindings/display/bridge/ti,ds90c185.txt
deleted file mode 100644
index e575f99..0000000
--- a/Documentation/devicetree/bindings/display/bridge/ti,ds90c185.txt
+++ /dev/null
@@ -1,55 +0,0 @@
-Texas Instruments FPD-Link (LVDS) Serializer
---------------------------------------------
-
-The DS90C185 and DS90C187 are low-power serializers for portable
-battery-powered applications that reduces the size of the RGB
-interface between the host GPU and the display.
-
-Required properties:
-
-- compatible: Should be
-  "ti,ds90c185", "lvds-encoder"  for the TI DS90C185 FPD-Link Serializer
-  "ti,ds90c187", "lvds-encoder"  for the TI DS90C187 FPD-Link Serializer
-
-Optional properties:
-
-- powerdown-gpios: Power down control GPIO (the PDB pin, active-low)
-
-Required nodes:
-
-The devices have two video ports. Their connections are modeled using the OF
-graph bindings specified in Documentation/devicetree/bindings/graph.txt.
-
-- Video port 0 for parallel input
-- Video port 1 for LVDS output
-
-
-Example
--------
-
-lvds-encoder {
-	compatible = "ti,ds90c185", "lvds-encoder";
-
-	powerdown-gpios = <&gpio 17 GPIO_ACTIVE_LOW>;
-
-	ports {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		port@0 {
-			reg = <0>;
-
-			lvds_enc_in: endpoint {
-				remote-endpoint = <&lcdc_out_rgb>;
-			};
-		};
-
-		port@1 {
-			reg = <1>;
-
-			lvds_enc_out: endpoint {
-				remote-endpoint = <&lvds_panel_in>;
-			};
-		};
-	};
-};
-- 
2.7.4

