Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32352E9C8A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 30 Oct 2019 14:43:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726269AbfJ3Nnv (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 30 Oct 2019 09:43:51 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:53937 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726222AbfJ3Nnv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Oct 2019 09:43:51 -0400
X-IronPort-AV: E=Sophos;i="5.68,247,1569250800"; 
   d="scan'208";a="30421355"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 30 Oct 2019 22:43:50 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 493BF400CA10;
        Wed, 30 Oct 2019 22:43:46 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
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
Subject: [PATCH 2/4] dt-bindings: display: bridge: Repurpose lvds-encoder
Date:   Wed, 30 Oct 2019 13:43:32 +0000
Message-Id: <1572443014-17335-3-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572443014-17335-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1572443014-17335-1-git-send-email-fabrizio.castro@bp.renesas.com>
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
 .../bindings/display/bridge/lvds-codec.txt         | 100 +++++++++++++++++++++
 .../bindings/display/bridge/lvds-transmitter.txt   |  66 --------------
 2 files changed, 100 insertions(+), 66 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/lvds-codec.txt
 delete mode 100644 Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt

diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.txt b/Documentation/devicetree/bindings/display/bridge/lvds-codec.txt
new file mode 100644
index 0000000..45fd81c
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.txt
@@ -0,0 +1,100 @@
+Trasnparent LVDS encoders and LVDS decoders
+-------------------------------------------
+
+This binding supports transparent LVDS encoders and LVDS decoders that don't
+require any configuration.
+
+LVDS is a physical layer specification defined in ANSI/TIA/EIA-644-A. Multiple
+incompatible data link layers have been used over time to transmit image data
+to LVDS panels. This binding targets devices compatible with the following
+specifications only.
+
+[JEIDA] "Digital Interface Standards for Monitor", JEIDA-59-1999, February
+1999 (Version 1.0), Japan Electronic Industry Development Association (JEIDA)
+[LDI] "Open LVDS Display Interface", May 1999 (Version 0.95), National
+Semiconductor
+[VESA] "VESA Notebook Panel Standard", October 2007 (Version 1.0), Video
+Electronics Standards Association (VESA)
+
+Those devices have been marketed under the FPD-Link and FlatLink brand names
+among others.
+
+
+Required properties:
+
+- compatible: Must be "lvds-encoder" for LVDS encoders or "lvds-decoder" for
+              LVDS decoders.
+
+  Any encoder compatible with this generic binding, but with additional
+  properties not listed here, must list a device specific compatible first
+  followed by the generic compatible.
+
+Required nodes:
+
+This device has two video ports. Their connections are modeled using the OF
+graph bindings specified in Documentation/devicetree/bindings/graph.txt.
+
+For LVDS encoders:
+- Video port 0 for parallel input
+- Video port 1 for LVDS output
+
+For LVDS decoders:
+- Video port 0 for LVDS input
+- Video port 1 for parallel output
+
+
+LVDS encoder example
+--------------------
+
+lvds-encoder {
+	compatible = "lvds-encoder";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			lvds_enc_in: endpoint {
+				remote-endpoint = <&display_out_rgb>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			lvds_enc_out: endpoint {
+				remote-endpoint = <&lvds_panel_in>;
+			};
+		};
+	};
+};
+
+LVDS decoder example
+--------------------
+
+lvds-decoder {
+	compatible = "lvds-decoder";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			lvds_dec_in: endpoint {
+				remote-endpoint = <&display_out_lvds>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			lvds_dec_out: endpoint {
+				remote-endpoint = <&rgb_panel_in>;
+			};
+		};
+	};
+};
diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt b/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
deleted file mode 100644
index 60091db..0000000
--- a/Documentation/devicetree/bindings/display/bridge/lvds-transmitter.txt
+++ /dev/null
@@ -1,66 +0,0 @@
-Parallel to LVDS Encoder
-------------------------
-
-This binding supports the parallel to LVDS encoders that don't require any
-configuration.
-
-LVDS is a physical layer specification defined in ANSI/TIA/EIA-644-A. Multiple
-incompatible data link layers have been used over time to transmit image data
-to LVDS panels. This binding targets devices compatible with the following
-specifications only.
-
-[JEIDA] "Digital Interface Standards for Monitor", JEIDA-59-1999, February
-1999 (Version 1.0), Japan Electronic Industry Development Association (JEIDA)
-[LDI] "Open LVDS Display Interface", May 1999 (Version 0.95), National
-Semiconductor
-[VESA] "VESA Notebook Panel Standard", October 2007 (Version 1.0), Video
-Electronics Standards Association (VESA)
-
-Those devices have been marketed under the FPD-Link and FlatLink brand names
-among others.
-
-
-Required properties:
-
-- compatible: Must be "lvds-encoder"
-
-  Any encoder compatible with this generic binding, but with additional
-  properties not listed here, must list a device specific compatible first
-  followed by this generic compatible.
-
-Required nodes:
-
-This device has two video ports. Their connections are modeled using the OF
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
-	compatible = "lvds-encoder";
-
-	ports {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		port@0 {
-			reg = <0>;
-
-			lvds_enc_in: endpoint {
-				remote-endpoint = <&display_out_rgb>;
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

