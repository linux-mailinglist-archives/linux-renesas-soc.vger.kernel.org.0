Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2D6E3B10C0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 23 Jun 2021 01:43:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230103AbhFVXpV (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 22 Jun 2021 19:45:21 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:55372 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229987AbhFVXpV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jun 2021 19:45:21 -0400
Received: from Monstersaurus.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CFC71A66;
        Wed, 23 Jun 2021 01:43:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1624405383;
        bh=r4Kc4gwJEr7RgyM2A9nibVhkYspAI6L1Ihzyx0kFhKo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KS/HJSAzIVI4MCwW6rXPqGLuaWtUxT2egL60iSyOv8udwggm04Km9DQAHOAobmHpA
         zM7zE6Rd+6j8RMI9zCnRGGanx99qwjBYRQMEMoaLMOFHS8TOnyUg/pxH6IdSZ2lbnj
         fYw3k6WryOwqaYDGzSis6t81f+YkxL+FzOD7sfnU=
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
To:     Geert Uytterhoeven <geert@glider.be>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org (open list:ARM/RENESAS ARM64
        ARCHITECTURE),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 3/3] arm64: dts: renesas: falcon-cpu: Add DSI display output
Date:   Wed, 23 Jun 2021 00:42:57 +0100
Message-Id: <20210622234257.3228634-4-kieran.bingham@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210622234257.3228634-1-kieran.bingham@ideasonboard.com>
References: <20210622234257.3228634-1-kieran.bingham@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Provide the display output using the sn65dsi86 MIPI DSI bridge.

Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 .../boot/dts/renesas/r8a779a0-falcon-cpu.dtsi | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
index a0a1a1da0d87..5530bb82de6b 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-cpu.dtsi
@@ -66,6 +66,15 @@ memory@700000000 {
 		reg = <0x7 0x00000000 0x0 0x80000000>;
 	};
 
+	reg_1p2v: regulator-1p2v {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-1.2V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
 	reg_1p8v: regulator-1p8v {
 		compatible = "regulator-fixed";
 		regulator-name = "fixed-1.8V";
@@ -83,6 +92,46 @@ reg_3p3v: regulator-3p3v {
 		regulator-boot-on;
 		regulator-always-on;
 	};
+
+	mini-dp-con {
+		compatible = "dp-connector";
+		label = "CN5";
+		type = "mini";
+
+		port {
+			mini_dp_con_in: endpoint {
+				remote-endpoint = <&sn65dsi86_out>;
+			};
+		};
+	};
+
+	sn65dsi86_refclk: sn65dsi86-refclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <38400000>;
+	};
+};
+
+&dsi0 {
+	status = "okay";
+
+	clocks = <&cpg CPG_MOD 415>,
+		 <&cpg CPG_CORE R8A779A0_CLK_DSI>,
+		 <&extal_clk>;
+	clock-names = "fck", "dsi", "extal";
+
+	ports {
+		port@1 {
+			endpoint {
+				remote-endpoint = <&sn65dsi86_in>;
+				data-lanes = <1 2 3 4>;
+			};
+		};
+	};
+};
+
+&du {
+	status = "okay";
 };
 
 &extal_clk {
@@ -114,6 +163,41 @@ &i2c1 {
 
 	status = "okay";
 	clock-frequency = <400000>;
+
+	sn65dsi86@2c {
+		compatible = "ti,sn65dsi86";
+		reg = <0x2c>;
+
+		clocks = <&sn65dsi86_refclk>;
+		clock-names = "refclk";
+
+		interrupt-parent = <&gpio1>;
+		interrupts = <24 IRQ_TYPE_LEVEL_HIGH>;
+
+		vccio-supply = <&reg_1p8v>;
+		vpll-supply = <&reg_1p8v>;
+		vcca-supply = <&reg_1p2v>;
+		vcc-supply = <&reg_1p2v>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				sn65dsi86_in: endpoint {
+					remote-endpoint = <&dsi0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				sn65dsi86_out: endpoint {
+					remote-endpoint = <&mini_dp_con_in>;
+				};
+			};
+		};
+	};
 };
 
 &i2c6 {
-- 
2.30.2

