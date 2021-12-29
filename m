Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 499CD481636
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Dec 2021 20:18:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230246AbhL2TSr (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 Dec 2021 14:18:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229958AbhL2TSr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Dec 2021 14:18:47 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58392C061574;
        Wed, 29 Dec 2021 11:18:47 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CB544464;
        Wed, 29 Dec 2021 20:18:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1640805525;
        bh=5jKC67USocktKcm+oEAgveAtQMO2eQbFvE67SN2xIu8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=fjqqSbAuf76eJvDm39zrF2nGY1MKeeQM5+tvrnOufHAAVoaAXhTTZWWi981fd6L9Q
         IEyI8SCxtZu02On2tYN8/PdP2vlPHcYrY040kya+4ogXdJI7QkvZ2MhbyVzjljKLek
         ostOZXFMBFwzvfYbvBwl52CUobmMkhWHI4gSHjCk=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH 2/2] arm64: dts: renesas: Remove empty rgb output endpoints
Date:   Wed, 29 Dec 2021 21:18:38 +0200
Message-Id: <20211229191838.27922-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211229191838.27922-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20211229191838.27922-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Endpoints node must have a remote-endpoint property, as endpoints only
exist to model a link between ports. Drop the empty rgb output endpoints
from SoC dtsi files, and declare them in the board dts instead.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../boot/dts/renesas/beacon-renesom-baseboard.dtsi     | 10 ++++++++--
 arch/arm64/boot/dts/renesas/draak.dtsi                 |  2 +-
 arch/arm64/boot/dts/renesas/ebisu.dtsi                 |  2 +-
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi              |  2 --
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi              |  2 --
 arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts        |  2 +-
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi              |  2 --
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi              |  2 --
 arch/arm64/boot/dts/renesas/r8a77951.dtsi              |  2 --
 arch/arm64/boot/dts/renesas/r8a77960.dtsi              |  2 --
 arch/arm64/boot/dts/renesas/r8a77961.dtsi              |  2 --
 arch/arm64/boot/dts/renesas/r8a77965.dtsi              |  2 --
 arch/arm64/boot/dts/renesas/r8a77970.dtsi              |  2 --
 arch/arm64/boot/dts/renesas/r8a77980.dtsi              |  2 --
 arch/arm64/boot/dts/renesas/r8a77990.dtsi              |  2 --
 arch/arm64/boot/dts/renesas/r8a77995.dtsi              |  2 --
 arch/arm64/boot/dts/renesas/salvator-common.dtsi       |  2 +-
 17 files changed, 12 insertions(+), 30 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
index 2692cc64bff6..1465adc43580 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
@@ -272,8 +272,14 @@ &can1 {
 	status = "okay";
 };
 
-&du_out_rgb {
-	remote-endpoint = <&rgb_panel>;
+&du {
+	ports {
+		port@0 {
+			du_out_rgb: endpoint {
+				remote-endpoint = <&rgb_panel>;
+			};
+		};
+	};
 };
 
 &ehci0 {
diff --git a/arch/arm64/boot/dts/renesas/draak.dtsi b/arch/arm64/boot/dts/renesas/draak.dtsi
index eb0327c0df48..b09f06086840 100644
--- a/arch/arm64/boot/dts/renesas/draak.dtsi
+++ b/arch/arm64/boot/dts/renesas/draak.dtsi
@@ -285,7 +285,7 @@ &du {
 
 	ports {
 		port@0 {
-			endpoint {
+			du_out_rgb: endpoint {
 				remote-endpoint = <&adv7123_in>;
 			};
 		};
diff --git a/arch/arm64/boot/dts/renesas/ebisu.dtsi b/arch/arm64/boot/dts/renesas/ebisu.dtsi
index 67231c8576c5..9e6093524682 100644
--- a/arch/arm64/boot/dts/renesas/ebisu.dtsi
+++ b/arch/arm64/boot/dts/renesas/ebisu.dtsi
@@ -356,7 +356,7 @@ &du {
 
 	ports {
 		port@0 {
-			endpoint {
+			du_out_rgb: endpoint {
 				remote-endpoint = <&adv7123_in>;
 			};
 		};
diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
index 9a8c1bd923af..6105316ccac2 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
@@ -2733,8 +2733,6 @@ ports {
 
 				port@0 {
 					reg = <0>;
-					du_out_rgb: endpoint {
-					};
 				};
 				port@1 {
 					reg = <1>;
diff --git a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
index 8912c1665ed9..7cdf009b1ee6 100644
--- a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
@@ -2578,8 +2578,6 @@ ports {
 
 				port@0 {
 					reg = <0>;
-					du_out_rgb: endpoint {
-					};
 				};
 				port@1 {
 					reg = <1>;
diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
index 4e72e4f2bab0..5a6ea08ffd2b 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
+++ b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
@@ -172,7 +172,7 @@ &du {
 
 	ports {
 		port@0 {
-			endpoint {
+			du_out_rgb: endpoint {
 				remote-endpoint = <&tda19988_in>;
 			};
 		};
diff --git a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
index 263f39fb8ad9..8b875b212a48 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
@@ -1867,8 +1867,6 @@ ports {
 
 				port@0 {
 					reg = <0>;
-					du_out_rgb: endpoint {
-					};
 				};
 
 				port@1 {
diff --git a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
index 02b35e68a3fa..b9ab5cb01419 100644
--- a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
@@ -2853,8 +2853,6 @@ ports {
 
 				port@0 {
 					reg = <0>;
-					du_out_rgb: endpoint {
-					};
 				};
 				port@1 {
 					reg = <1>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77951.dtsi b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
index 0919d8f540c4..b88af4c90f33 100644
--- a/arch/arm64/boot/dts/renesas/r8a77951.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
@@ -3318,8 +3318,6 @@ ports {
 
 				port@0 {
 					reg = <0>;
-					du_out_rgb: endpoint {
-					};
 				};
 				port@1 {
 					reg = <1>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77960.dtsi b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
index 221ee1ec415d..5e12e80d115e 100644
--- a/arch/arm64/boot/dts/renesas/r8a77960.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
@@ -2921,8 +2921,6 @@ ports {
 
 				port@0 {
 					reg = <0>;
-					du_out_rgb: endpoint {
-					};
 				};
 				port@1 {
 					reg = <1>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
index ba9358abebb2..4df8ffa84461 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
@@ -2706,8 +2706,6 @@ ports {
 
 				port@0 {
 					reg = <0>;
-					du_out_rgb: endpoint {
-					};
 				};
 				port@1 {
 					reg = <1>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index 5f3046eee365..454e95222acf 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -2733,8 +2733,6 @@ ports {
 
 				port@0 {
 					reg = <0>;
-					du_out_rgb: endpoint {
-					};
 				};
 				port@1 {
 					reg = <1>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77970.dtsi b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
index ad021b2703ab..dc11845625c4 100644
--- a/arch/arm64/boot/dts/renesas/r8a77970.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77970.dtsi
@@ -1156,8 +1156,6 @@ ports {
 
 				port@0 {
 					reg = <0>;
-					du_out_rgb: endpoint {
-					};
 				};
 
 				port@1 {
diff --git a/arch/arm64/boot/dts/renesas/r8a77980.dtsi b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
index 29f1161da957..53d0e6b4b75e 100644
--- a/arch/arm64/boot/dts/renesas/r8a77980.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
@@ -1532,8 +1532,6 @@ ports {
 
 				port@0 {
 					reg = <0>;
-					du_out_rgb: endpoint {
-					};
 				};
 
 				port@1 {
diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index 735c46217835..f49173045232 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -2016,8 +2016,6 @@ ports {
 
 				port@0 {
 					reg = <0>;
-					du_out_rgb: endpoint {
-					};
 				};
 
 				port@1 {
diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index 759505bd1a44..3237ff4e5c77 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
@@ -1337,8 +1337,6 @@ ports {
 
 				port@0 {
 					reg = <0>;
-					du_out_rgb: endpoint {
-					};
 				};
 
 				port@1 {
diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index bf37777dca31..0b0b1fc3a270 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -385,7 +385,7 @@ &du {
 
 	ports {
 		port@0 {
-			endpoint {
+			du_out_rgb: endpoint {
 				remote-endpoint = <&adv7123_in>;
 			};
 		};
-- 
Regards,

Laurent Pinchart

