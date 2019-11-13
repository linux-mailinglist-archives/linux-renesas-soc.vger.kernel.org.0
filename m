Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 812CFFB445
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 13 Nov 2019 16:52:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728126AbfKMPwr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 13 Nov 2019 10:52:47 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:12714 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726074AbfKMPwr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Nov 2019 10:52:47 -0500
X-IronPort-AV: E=Sophos;i="5.68,300,1569250800"; 
   d="scan'208";a="31593969"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 14 Nov 2019 00:52:46 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id B391E400EE6B;
        Thu, 14 Nov 2019 00:52:41 +0900 (JST)
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
Subject: [PATCH v4 13/13] [HACK] dt-bindings: display: bridge: lvds-codec: Absorb thine,thc63lvdm83d.txt
Date:   Wed, 13 Nov 2019 15:51:32 +0000
Message-Id: <1573660292-10629-14-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1573660292-10629-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

At this point in time, compatible string "thine,thc63lvdm83d" is
backed by the lvds-codec driver, and the documentation contained
in thine,thc63lvdm83d.txt is basically the same as the one
contained in lvds-codec.yaml (generic fallback compatible string
aside), therefore absorb thine,thc63lvdm83d.txt.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

---
Hi Laurent,

what do you think about this patch?

Thanks,
Fab

v3->v4:
* New patch
---
 .../bindings/display/bridge/lvds-codec.yaml        |  5 +--
 .../bindings/display/bridge/thine,thc63lvdm83d.txt | 50 ----------------------
 2 files changed, 2 insertions(+), 53 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/thine,thc63lvdm83d.txt

diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
index 21f8c6e..420bfce 100644
--- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
@@ -30,9 +30,6 @@ description: |
 
 properties:
   compatible:
-    description: |
-      Must list the device specific compatible string first, followed by the
-      generic compatible string.
     oneOf:
       - items:
         - enum:
@@ -44,6 +41,8 @@ properties:
         - enum:
           - ti,ds90cf384a     # For the DS90CF384A FPD-Link LVDS Receiver
         - const: lvds-decoder # Generic LVDS decoders compatible fallback
+      - enum:
+        - thine,thc63lvdm83d  # For the THC63LVDM83D LVDS serializer
 
   ports:
     type: object
diff --git a/Documentation/devicetree/bindings/display/bridge/thine,thc63lvdm83d.txt b/Documentation/devicetree/bindings/display/bridge/thine,thc63lvdm83d.txt
deleted file mode 100644
index fee3c88..0000000
--- a/Documentation/devicetree/bindings/display/bridge/thine,thc63lvdm83d.txt
+++ /dev/null
@@ -1,50 +0,0 @@
-THine Electronics THC63LVDM83D LVDS serializer
-----------------------------------------------
-
-The THC63LVDM83D is an LVDS serializer designed to support pixel data
-transmission between a host and a flat panel.
-
-Required properties:
-
-- compatible: Should be "thine,thc63lvdm83d"
-
-Optional properties:
-
-- powerdown-gpios: Power down control GPIO (the /PWDN pin, active low).
-
-Required nodes:
-
-The THC63LVDM83D has two video ports. Their connections are modeled using the
-OFgraph bindings specified in Documentation/devicetree/bindings/graph.txt.
-
-- Video port 0 for CMOS/TTL input
-- Video port 1 for LVDS output
-
-
-Example
--------
-
-	lvds_enc: encoder@0 {
-		compatible = "thine,thc63lvdm83d";
-
-		ports {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			port@0 {
-				reg = <0>;
-
-				lvds_enc_in: endpoint@0 {
-					remote-endpoint = <&rgb_out>;
-				};
-			};
-
-			port@1 {
-				reg = <1>;
-
-				lvds_enc_out: endpoint@0 {
-					remote-endpoint = <&panel_in>;
-				};
-			};
-		};
-	};
-- 
2.7.4

