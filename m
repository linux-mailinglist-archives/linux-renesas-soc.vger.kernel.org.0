Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 897152714A0
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 20 Sep 2020 15:49:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726315AbgITNt2 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 20 Sep 2020 09:49:28 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:57007 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726305AbgITNt2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 20 Sep 2020 09:49:28 -0400
X-IronPort-AV: E=Sophos;i="5.77,282,1596466800"; 
   d="scan'208";a="57729002"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 20 Sep 2020 22:49:27 +0900
Received: from localhost.localdomain (unknown [172.29.52.129])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id D2FDC40078C5;
        Sun, 20 Sep 2020 22:49:24 +0900 (JST)
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
Subject: [PATCH v4 6/6] arm64: dts: renesas: beacon-renesom-baseboard: Move connector node out of hd3ss3220 device
Date:   Sun, 20 Sep 2020 14:49:05 +0100
Message-Id: <20200920134905.4370-7-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200920134905.4370-1-biju.das.jz@bp.renesas.com>
References: <20200920134905.4370-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Move connector node out of hd3ss3220 device in order to comply with usb
connector bindings.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v3->v4: No change
v2->v3: No change
v1->v2: No change
---
 .../dts/renesas/beacon-renesom-baseboard.dtsi | 67 ++++++++++++++-----
 1 file changed, 50 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
index 66c9153b3101..e66b5b36e489 100644
--- a/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
+++ b/arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi
@@ -223,6 +223,29 @@
 		#clock-cells = <0>;
 		clock-frequency = <25000000>;
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
@@ -427,20 +450,19 @@
 		interrupt-parent = <&gpio6>;
 		interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
 
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
@@ -714,9 +736,20 @@
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

