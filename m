Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E1207ED82
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  2 Aug 2019 09:34:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389808AbfHBHet (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 2 Aug 2019 03:34:49 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:17475 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2389759AbfHBHet (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Aug 2019 03:34:49 -0400
X-IronPort-AV: E=Sophos;i="5.64,337,1559487600"; 
   d="scan'208";a="23151144"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 02 Aug 2019 16:34:47 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id C8BF140078B4;
        Fri,  2 Aug 2019 16:34:43 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH/RFC 03/12] dt-bindings: panel: lvds: Add dual-link LVDS display support
Date:   Fri,  2 Aug 2019 08:34:00 +0100
Message-Id: <1564731249-22671-4-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Dual-link LVDS displays have two ports, therefore document this
with the bindings.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
 .../bindings/display/panel/panel-lvds.txt          | 91 ++++++++++++++++------
 1 file changed, 67 insertions(+), 24 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.txt b/Documentation/devicetree/bindings/display/panel/panel-lvds.txt
index 250850a..07795441 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-lvds.txt
+++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.txt
@@ -41,7 +41,8 @@ Required nodes:
 
 - panel-timing: See panel-common.txt.
 - ports: See panel-common.txt. These bindings require a single port subnode
-  corresponding to the panel LVDS input.
+  (for a single link display) or two port subnodes (for a dual link display)
+  corresponding to the panel LVDS input(s).
 
 
 LVDS data mappings are defined as follows.
@@ -92,30 +93,72 @@ CTL3: 0
 Example
 -------
 
-panel {
-	compatible = "mitsubishi,aa121td01", "panel-lvds";
-
-	width-mm = <261>;
-	height-mm = <163>;
-
-	data-mapping = "jeida-24";
-
-	panel-timing {
-		/* 1280x800 @60Hz */
-		clock-frequency = <71000000>;
-		hactive = <1280>;
-		vactive = <800>;
-		hsync-len = <70>;
-		hfront-porch = <20>;
-		hback-porch = <70>;
-		vsync-len = <5>;
-		vfront-porch = <3>;
-		vback-porch = <15>;
+Single port:
+	panel {
+		compatible = "mitsubishi,aa121td01", "panel-lvds";
+
+		width-mm = <261>;
+		height-mm = <163>;
+
+		data-mapping = "jeida-24";
+
+		panel-timing {
+			/* 1280x800 @60Hz */
+			clock-frequency = <71000000>;
+			hactive = <1280>;
+			vactive = <800>;
+			hsync-len = <70>;
+			hfront-porch = <20>;
+			hback-porch = <70>;
+			vsync-len = <5>;
+			vfront-porch = <3>;
+			vback-porch = <15>;
+		};
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&lvds_encoder>;
+			};
+		};
 	};
 
-	port {
-		panel_in: endpoint {
-			remote-endpoint = <&lvds_encoder>;
+Two ports:
+	panel {
+		compatible = "advantech,idk-2121wr", "panel-lvds";
+
+		width-mm = <476>;
+		height-mm = <268>;
+
+		data-mapping = "vesa-24";
+
+		panel-timing {
+			clock-frequency = <148500000>;
+			hactive = <1920>;
+			vactive = <1080>;
+			hsync-len = <44>;
+			hfront-porch = <88>;
+			hback-porch = <148>;
+			vfront-porch = <4>;
+			vback-porch = <36>;
+			vsync-len = <5>;
+		};
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				lvds0_panel_in: endpoint {
+					remote-endpoint = <&lvds0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				lvds1_panel_in: endpoint {
+					remote-endpoint = <&lvds1_out>;
+				};
+			};
 		};
 	};
-};
-- 
2.7.4

