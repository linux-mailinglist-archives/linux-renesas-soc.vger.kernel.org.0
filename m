Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 126E224FF9E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 24 Aug 2020 16:11:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726673AbgHXOLa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 24 Aug 2020 10:11:30 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:21502 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726473AbgHXOLM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Aug 2020 10:11:12 -0400
X-IronPort-AV: E=Sophos;i="5.76,348,1592838000"; 
   d="scan'208";a="55166780"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 24 Aug 2020 23:11:11 +0900
Received: from localhost.localdomain (unknown [172.29.53.152])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 3C35240031C8;
        Mon, 24 Aug 2020 23:11:08 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 4/5] arm64: dts: renesas: cat874: Move connector node out of hd3ss3220 device
Date:   Mon, 24 Aug 2020 15:10:52 +0100
Message-Id: <20200824141053.5062-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200824141053.5062-1-biju.das.jz@bp.renesas.com>
References: <20200824141053.5062-1-biju.das.jz@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Move connector node out of hd3ss3220 device in order to comply with usb
connector bindings.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2->v3: No change
v1->v2: No change
---
 .../boot/dts/renesas/r8a774c0-cat874.dts      | 67 ++++++++++++++-----
 1 file changed, 50 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
index 26aee004a44e..ea87cb5a459c 100644
--- a/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
+++ b/arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts
@@ -129,6 +129,29 @@
 		#clock-cells = <0>;
 		clock-frequency = <74250000>;
 	};
+
+	connector {
+		compatible = "usb-c-connector";
+		label = "USB-C";
+		data-role = "dual";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			port@0 {
+				reg = <0>;
+				hs_ep: endpoint {
+					remote-endpoint = <&usb3_hs_ep>;
+				};
+			};
+			port@1 {
+				reg = <1>;
+				ss_ep: endpoint {
+					remote-endpoint = <&hd3ss3220_in_ep>;
+				};
+			};
+		};
+	};
 };
 
 &audio_clk_a {
@@ -186,20 +209,19 @@
 		interrupt-parent = <&gpio6>;
 		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
 
-		connector {
-			compatible = "usb-c-connector";
-			label = "USB-C";
-			data-role = "dual";
-
-			ports {
-				#address-cells = <1>;
-				#size-cells = <0>;
-
-				port@1 {
-					reg = <1>;
-					hd3ss3220_ep: endpoint {
-						remote-endpoint = <&usb3_role_switch>;
-					};
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			port@0 {
+				reg = <0>;
+				hd3ss3220_in_ep: endpoint {
+					remote-endpoint = <&ss_ep>;
+				};
+			};
+			port@1 {
+				reg = <1>;
+				hd3ss3220_out_ep: endpoint {
+					remote-endpoint = <&usb3_role_switch>;
 				};
 			};
 		};
@@ -405,9 +427,20 @@
 	status = "okay";
 	usb-role-switch;
 
-	port {
-		usb3_role_switch: endpoint {
-			remote-endpoint = <&hd3ss3220_ep>;
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		port@0 {
+			reg = <0>;
+			usb3_hs_ep: endpoint {
+				remote-endpoint = <&hs_ep>;
+			};
+		};
+		port@1 {
+			reg = <1>;
+			usb3_role_switch: endpoint {
+				remote-endpoint = <&hd3ss3220_out_ep>;
+			};
 		};
 	};
 };
-- 
2.17.1

