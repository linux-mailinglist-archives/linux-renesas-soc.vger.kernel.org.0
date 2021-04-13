Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D94B135E6AC
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Apr 2021 20:49:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347841AbhDMSte (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 13 Apr 2021 14:49:34 -0400
Received: from bin-mail-out-06.binero.net ([195.74.38.229]:49665 "EHLO
        bin-mail-out-06.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1347885AbhDMStb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Apr 2021 14:49:31 -0400
X-Halon-ID: ed30f914-9c88-11eb-b966-005056917a89
Authorized-sender: niklas.soderlund@fsdn.se
Received: from bismarck.berto.se (p54ac5521.dip0.t-ipconnect.de [84.172.85.33])
        by bin-vsp-out-01.atm.binero.net (Halon) with ESMTPA
        id ed30f914-9c88-11eb-b966-005056917a89;
        Tue, 13 Apr 2021 20:49:07 +0200 (CEST)
From:   =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 2/2] arm64: dts: renesas: falcon-csi-dsi: Add and connect MAX96712
Date:   Tue, 13 Apr 2021 20:48:44 +0200
Message-Id: <20210413184844.2606086-3-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210413184844.2606086-1-niklas.soderlund+renesas@ragnatech.se>
References: <20210413184844.2606086-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The sub-board contains three MAX96712 connected to the main-board using
I2C and CSI-2, record the connections. Also enable all nodes (VIN, CSI-2
and ISP) that are part of the downstream video capture pipeline.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../dts/renesas/r8a779a0-falcon-csi-dsi.dtsi  | 229 ++++++++++++++++++
 1 file changed, 229 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-csi-dsi.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-csi-dsi.dtsi
index 928b182a76901276..fa17ceb143f47fd4 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-csi-dsi.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-csi-dsi.dtsi
@@ -34,3 +34,232 @@ pca9654_c: gpio@23 {
 		#gpio-cells = <2>;
 	};
 };
+
+&i2c1 {
+	gmsl0: gmsl-deserializer@49 {
+		compatible = "maxim,max96712";
+		reg = <0x49>;
+		enable-gpios = <&pca9654_a 0 GPIO_ACTIVE_HIGH>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@4 {
+				reg = <4>;
+				max96712_out0: endpoint {
+					clock-lanes = <0>;
+					data-lanes = <1 2 3 4>;
+					remote-endpoint = <&csi40_in>;
+				};
+			};
+		};
+	};
+
+	gmsl1: gmsl-deserializer@4b {
+		compatible = "maxim,max96712";
+		reg = <0x4b>;
+		enable-gpios = <&pca9654_b 0 GPIO_ACTIVE_HIGH>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@4 {
+				reg = <4>;
+				max96712_out1: endpoint {
+					clock-lanes = <0>;
+					data-lanes = <1 2 3 4>;
+					lane-polarities = <0 0 0 0 1>;
+					remote-endpoint = <&csi42_in>;
+				};
+			};
+		};
+	};
+
+	gmsl2: gmsl-deserializer@6b {
+		compatible = "maxim,max96712";
+		reg = <0x6b>;
+		enable-gpios = <&pca9654_c 0 GPIO_ACTIVE_HIGH>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@4 {
+				reg = <4>;
+				max96712_out2: endpoint {
+					clock-lanes = <0>;
+					data-lanes = <1 2 3 4>;
+					lane-polarities = <0 0 0 0 1>;
+					remote-endpoint = <&csi43_in>;
+				};
+			};
+		};
+	};
+};
+
+&csi40 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			csi40_in: endpoint {
+				clock-lanes = <0>;
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&max96712_out0>;
+			};
+		};
+	};
+};
+
+&csi42 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			csi42_in: endpoint {
+				clock-lanes = <0>;
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&max96712_out1>;
+			};
+		};
+	};
+};
+
+&csi43 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			csi43_in: endpoint {
+				clock-lanes = <0>;
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&max96712_out2>;
+			};
+		};
+	};
+};
+
+&isp0 {
+	status = "okay";
+};
+
+&isp2 {
+	status = "okay";
+};
+
+&isp3 {
+	status = "okay";
+};
+
+&vin00 {
+	status = "okay";
+};
+
+&vin01 {
+	status = "okay";
+};
+
+&vin02 {
+	status = "okay";
+};
+
+&vin03 {
+	status = "okay";
+};
+
+&vin04 {
+	status = "okay";
+};
+
+&vin05 {
+	status = "okay";
+};
+
+&vin06 {
+	status = "okay";
+};
+
+&vin07 {
+	status = "okay";
+};
+
+&vin16 {
+	status = "okay";
+};
+
+&vin17 {
+	status = "okay";
+};
+
+&vin18 {
+	status = "okay";
+};
+
+&vin19 {
+	status = "okay";
+};
+
+&vin20 {
+	status = "okay";
+};
+
+&vin21 {
+	status = "okay";
+};
+
+&vin22 {
+	status = "okay";
+};
+
+&vin23 {
+	status = "okay";
+};
+
+&vin24 {
+	status = "okay";
+};
+
+&vin25 {
+	status = "okay";
+};
+
+&vin26 {
+	status = "okay";
+};
+
+&vin27 {
+	status = "okay";
+};
+
+&vin28 {
+	status = "okay";
+};
+
+&vin29 {
+	status = "okay";
+};
+
+&vin30 {
+	status = "okay";
+};
+
+&vin31 {
+	status = "okay";
+};
-- 
2.31.1

