Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB129CBE17
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2019 16:53:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389132AbfJDOxL (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 4 Oct 2019 10:53:11 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:58196 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2388870AbfJDOxL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 Oct 2019 10:53:11 -0400
X-IronPort-AV: E=Sophos;i="5.67,256,1566831600"; 
   d="scan'208";a="28306517"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 04 Oct 2019 23:53:08 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 88D0842704B5;
        Fri,  4 Oct 2019 23:53:06 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH v3 1/2] arm64: dts: renesas: r8a774a1: Remove audio port node
Date:   Fri,  4 Oct 2019 15:52:40 +0100
Message-Id: <1570200761-884-1-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch removes audio port node from SoC device tree.

Fixes: e2f04248fcd4 ("arm64: dts: renesas: r8a774a1: Add audio support")
Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
V1-->V2
 * New patch.
V2-->V3
 * Fixed the commit message. Thanks to Fabrizio.

This patch depend upon
https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=182581
---
 arch/arm64/boot/dts/renesas/hihope-common.dtsi | 20 +++++++++-----------
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi      | 11 -----------
 2 files changed, 9 insertions(+), 22 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/hihope-common.dtsi b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
index 355d0a2..2c942a7 100644
--- a/arch/arm64/boot/dts/renesas/hihope-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
@@ -86,7 +86,7 @@
 
 		label = "rcar-sound";
 
-		dais = <&rsnd_port0>;
+		dais = <&rsnd_port>;
 	};
 
 	vbus0_usb2: regulator-vbus0-usb2 {
@@ -183,7 +183,7 @@
 		port@2 {
 			reg = <2>;
 			dw_hdmi0_snd_in: endpoint {
-				remote-endpoint = <&rsnd_endpoint0>;
+				remote-endpoint = <&rsnd_endpoint>;
 			};
 		};
 	};
@@ -319,17 +319,15 @@
 	/* Single DAI */
 	#sound-dai-cells = <0>;
 
-	ports {
-		rsnd_port0: port@0 {
-			rsnd_endpoint0: endpoint {
-				remote-endpoint = <&dw_hdmi0_snd_in>;
+	rsnd_port: port {
+		rsnd_endpoint: endpoint {
+			remote-endpoint = <&dw_hdmi0_snd_in>;
 
-				dai-format = "i2s";
-				bitclock-master = <&rsnd_endpoint0>;
-				frame-master = <&rsnd_endpoint0>;
+			dai-format = "i2s";
+			bitclock-master = <&rsnd_endpoint>;
+			frame-master = <&rsnd_endpoint>;
 
-				playback = <&ssi2>;
-			};
+			playback = <&ssi2>;
 		};
 	};
 };
diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
index d179ee3..34a9f47 100644
--- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
@@ -1726,17 +1726,6 @@
 				      "ssi.1", "ssi.0";
 			status = "disabled";
 
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-				port@0 {
-					reg = <0>;
-				};
-				port@1 {
-					reg = <1>;
-				};
-			};
-
 			rcar_sound,ctu {
 				ctu00: ctu-0 { };
 				ctu01: ctu-1 { };
-- 
2.7.4

