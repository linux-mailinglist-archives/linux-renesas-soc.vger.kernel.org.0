Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 107C150D32D
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 24 Apr 2022 18:12:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234062AbiDXQPi (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 24 Apr 2022 12:15:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234067AbiDXQPh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 24 Apr 2022 12:15:37 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D19F514EC41;
        Sun, 24 Apr 2022 09:12:35 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D8E5E3E4;
        Sun, 24 Apr 2022 18:12:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1650816754;
        bh=Is6SG4GHs0jpYFv8X8J/PXs+1pgpkckU4nI98rQsNqw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FYBm3An+8PMBQ+S9TmlFudvueU8Gh3uzW8PBcIR0w9nu4xaciyGQCk1kbIrL3Ll52
         o99pVFqxjj5Q7PPxB81w2z1lLUREtQlCSSONOouWuYAOkLyMpvLPTPAMBw+aAK6dW3
         CWHxS/2SL5vnsihvED4VykSaC7wKNDVXMExybb1w=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: [PATCH v2 2/2] arm64: dts: renesas: Remove empty rgb output endpoints
Date:   Sun, 24 Apr 2022 19:12:28 +0300
Message-Id: <20220424161228.8147-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220424161228.8147-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20220424161228.8147-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Endpoints node must have a remote-endpoint property, as endpoints only
exist to model a link between ports. Drop the empty rgb output endpoints
from SoC dtsi files, and declare them in the board dts instead.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
Changes since v1:

- Handle ulcb-kf.dtsi
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
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi               | 10 ++++++++--
 18 files changed, 20 insertions(+), 32 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
index 5ad6cd1864c1..142e7ffbd2bd 100644
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
index a65ba7ba1cae..58da4cad77f3 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
@@ -2737,8 +2737,6 @@ ports {
 
 				port@0 {
 					reg = <0>;
-					du_out_rgb: endpoint {
-					};
 				};
 				port@1 {
 					reg = <1>;
diff --git a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
index 90519af646c4..621ba7160dd9 100644
--- a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
@@ -2582,8 +2582,6 @@ ports {
 
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
index ff75ceec9fee..ee5bc5830a93 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774c0.dtsi
@@ -1870,8 +1870,6 @@ ports {
 
 				port@0 {
 					reg = <0>;
-					du_out_rgb: endpoint {
-					};
 				};
 
 				port@1 {
diff --git a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
index aefed8e0037f..e20e3e135229 100644
--- a/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774e1.dtsi
@@ -2857,8 +2857,6 @@ ports {
 
 				port@0 {
 					reg = <0>;
-					du_out_rgb: endpoint {
-					};
 				};
 				port@1 {
 					reg = <1>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77951.dtsi b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
index 383f5e199c17..a466d70e253b 100644
--- a/arch/arm64/boot/dts/renesas/r8a77951.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77951.dtsi
@@ -3334,8 +3334,6 @@ ports {
 
 				port@0 {
 					reg = <0>;
-					du_out_rgb: endpoint {
-					};
 				};
 				port@1 {
 					reg = <1>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77960.dtsi b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
index de38a05e5746..0e18e96a51fc 100644
--- a/arch/arm64/boot/dts/renesas/r8a77960.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77960.dtsi
@@ -2937,8 +2937,6 @@ ports {
 
 				port@0 {
 					reg = <0>;
-					du_out_rgb: endpoint {
-					};
 				};
 				port@1 {
 					reg = <1>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77961.dtsi b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
index be84120d7650..6d4c49747778 100644
--- a/arch/arm64/boot/dts/renesas/r8a77961.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77961.dtsi
@@ -2722,8 +2722,6 @@ ports {
 
 				port@0 {
 					reg = <0>;
-					du_out_rgb: endpoint {
-					};
 				};
 				port@1 {
 					reg = <1>;
diff --git a/arch/arm64/boot/dts/renesas/r8a77965.dtsi b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
index f00de3f660c5..9cf98d988ffc 100644
--- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
@@ -2749,8 +2749,6 @@ ports {
 
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
index 71f7a5dad580..71d7df6dfd93 100644
--- a/arch/arm64/boot/dts/renesas/r8a77980.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77980.dtsi
@@ -1533,8 +1533,6 @@ ports {
 
 				port@0 {
 					reg = <0>;
-					du_out_rgb: endpoint {
-					};
 				};
 
 				port@1 {
diff --git a/arch/arm64/boot/dts/renesas/r8a77990.dtsi b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
index 070a0c72cb67..d56ee6273dc3 100644
--- a/arch/arm64/boot/dts/renesas/r8a77990.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77990.dtsi
@@ -2031,8 +2031,6 @@ ports {
 
 				port@0 {
 					reg = <0>;
-					du_out_rgb: endpoint {
-					};
 				};
 
 				port@1 {
diff --git a/arch/arm64/boot/dts/renesas/r8a77995.dtsi b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
index be746a7f1ce1..e5ede5430424 100644
--- a/arch/arm64/boot/dts/renesas/r8a77995.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a77995.dtsi
@@ -1350,8 +1350,6 @@ ports {
 
 				port@0 {
 					reg = <0>;
-					du_out_rgb: endpoint {
-					};
 				};
 
 				port@1 {
diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
index 6092dc4531ad..30727d748d1f 100644
--- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
@@ -386,7 +386,7 @@ &du {
 
 	ports {
 		port@0 {
-			endpoint {
+			du_out_rgb: endpoint {
 				remote-endpoint = <&adv7123_in>;
 			};
 		};
diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
index ae532cd21708..5bcb84403ef6 100644
--- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
+++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
@@ -97,8 +97,14 @@ &can1 {
 	status = "okay";
 };
 
-&du_out_rgb {
-	remote-endpoint = <&adv7513_in>;
+&du {
+	ports {
+		port@0 {
+			du_out_rgb: endpoint {
+				remote-endpoint = <&adv7513_in>;
+			};
+		};
+	};
 };
 
 &ehci0 {
-- 
Regards,

Laurent Pinchart

