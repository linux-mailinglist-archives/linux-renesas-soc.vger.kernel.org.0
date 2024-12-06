Return-Path: <linux-renesas-soc+bounces-10993-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6AB9E6A5E
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2024 10:35:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6E5716A4E0
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  6 Dec 2024 09:35:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A5BC1FCFC8;
	Fri,  6 Dec 2024 09:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Dmrs1KLl"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940B01FCF5B;
	Fri,  6 Dec 2024 09:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733477627; cv=none; b=qY/IDF3j8A2p/uY4Ea6PZN5qUA5vuydZlqV3kKbr9uGYVjdT79p2QELsh4bubIRB4eCiSPKhtkzOUW7TOvypAz3Llf04LNR6da+QGJ3TaZAaVlnAEU/IulinvuVkXBFdtc6cr+AVfo+GfDxmagl5lm77SInv4mgkIRjerLZNEYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733477627; c=relaxed/simple;
	bh=tRF43KBsvxv3hRirW7Pu5wocJ26K3VE9RSkQJeg7ABU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f3kLaQN/ZOkZaMYHJC2g4YSrGn08nBlwUvRQL8YZkIzqqYNmCOh3R5amKVAhvh3fFvcIzgsxTL41TSawtVOLMhB5WLuN5nAtup1yyPE41vIOx3fOqpEf/iV5ghNzXq/nPZIhIpxGByuhBmCVnE/rUDZYWE8w4hQwkUiiMRc6WXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Dmrs1KLl; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2CBA61F0F;
	Fri,  6 Dec 2024 10:33:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733477586;
	bh=tRF43KBsvxv3hRirW7Pu5wocJ26K3VE9RSkQJeg7ABU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Dmrs1KLlMQSemD1bBMDSiUxGc6pXwsMioChvZmuOcx0d8o7bXVvoB/ujJ5AtSOl2I
	 z2FfEv3R/qejtIZjY+RCA4NHf/LIx3X71MKA/DLAew9/7Bi5LMj4HSI50UhQxfaSk0
	 B7U++VvkDV4ICMOTrioNF+IeDPx2ROBrndfIguIE=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 06 Dec 2024 11:32:43 +0200
Subject: [PATCH v3 10/10] arm64: dts: renesas: gray-hawk-single: Add
 DisplayPort support
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241206-rcar-gh-dsi-v3-10-d74c2166fa15@ideasonboard.com>
References: <20241206-rcar-gh-dsi-v3-0-d74c2166fa15@ideasonboard.com>
In-Reply-To: <20241206-rcar-gh-dsi-v3-0-d74c2166fa15@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, LUU HOAI <hoai.luu.ub@renesas.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 linux-clk@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3107;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=u9rlLJsMm1XL9+aRvQppvfNen/IBc5LxFiSkKc7jCZA=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUsTcLr7EbKTpYqLBEzl6EqBRoaarvIQUs14jC
 5iA1V++5f2JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1LE3AAKCRD6PaqMvJYe
 9cZBD/wN9RSVdZZzMHzOjyLnVcpV1agPQgtIhQbneeVneez5LLSJosNo7gLU1z3gAeFKlS7CSFK
 toBmHpV0D6L4aMwY+AvL3k+esuKENVC2dFbfxRj8k2G1hlWtsnjyf+wdupO340ERmxKImKELFmE
 8/KbsSDLJxlz1VKcL4NVcFH9hZvy7pIBWsb2R8xaIz+JeBui0BtlAWJQScaJGIS5Tyk2Qvsebmq
 aZD4TAhLXdHalQfppQxTQ44JwS5WGvfxmIgQrGVkNLZk59sDlqsRPQOJuTgPwqU+0Bdc+wIAran
 lSbrL8Fsd8hzgG+b1yVo1T/8mf0aE90hS/jdIizGzFaq6OIHsTr6m99Y96hreGMaQZDZavkGCFl
 UG62/VjBuGFd9fWLA3v85uh3VfCyk+eqr4wYv651XxkYYKtZtt/SF4D6jfp1L7V4TK40FNuHdia
 yBFXbNETxTtYqf8CWbLBKlmCygXPUOs7riHYPd+An7wRlsVA+TSHjfjYMs+R866ieeyhja7OL/x
 jLAuyVeNq1LAnXRCgPDakgd6fMZRzfJm/wq/emFPOeq2XjW/YVwU/8vyZe1ZRQYuvRydF4ZzBYd
 kd7EjynZkL09ElirlpRealV1rh1p126AyRUh66JKUxJ2sdQWcSYBaJxoFMRQYTj7IQRgqzWvTyz
 L56R2MRyI7IeVaQ==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Add support for the mini DP output on the Gray Hawk board.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../boot/dts/renesas/r8a779h0-gray-hawk-single.dts | 95 ++++++++++++++++++++++
 1 file changed, 95 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
index 057f959d67b3..7cdf07b6dde6 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
@@ -59,6 +59,12 @@ chosen {
 		stdout-path = "serial0:921600n8";
 	};
 
+	sn65dsi86_refclk: clk-x6 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <38400000>;
+	};
+
 	keys {
 		compatible = "gpio-keys";
 
@@ -126,6 +132,27 @@ memory@480000000 {
 		reg = <0x4 0x80000000 0x1 0x80000000>;
 	};
 
+	mini-dp-con {
+		compatible = "dp-connector";
+		label = "CN5";
+		type = "mini";
+
+		port {
+			mini_dp_con_in: endpoint {
+				remote-endpoint = <&sn65dsi86_out0>;
+			};
+		};
+	};
+
+	reg_1p2v: regulator-1p2v {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-1.2V";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
 	reg_1p8v: regulator-1p8v {
 		compatible = "regulator-fixed";
 		regulator-name = "fixed-1.8V";
@@ -200,6 +227,24 @@ channel1 {
 	};
 };
 
+&dsi0 {
+	status = "okay";
+
+	ports {
+		port@1 {
+			reg = <1>;
+			dsi0_out: endpoint {
+				remote-endpoint = <&sn65dsi86_in0>;
+				data-lanes = <1 2 3 4>;
+			};
+		};
+	};
+};
+
+&du {
+	status = "okay";
+};
+
 &extal_clk {
 	clock-frequency = <16666666>;
 };
@@ -269,6 +314,51 @@ eeprom@53 {
 	};
 };
 
+&i2c1 {
+	pinctrl-0 = <&i2c1_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+	clock-frequency = <400000>;
+
+	bridge@2c {
+		compatible = "ti,sn65dsi86";
+		reg = <0x2c>;
+
+		clocks = <&sn65dsi86_refclk>;
+		clock-names = "refclk";
+
+		interrupt-parent = <&intc_ex>;
+		interrupts = <0 IRQ_TYPE_LEVEL_HIGH>;
+
+		enable-gpios = <&gpio1 26 GPIO_ACTIVE_HIGH>;
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
+				sn65dsi86_in0: endpoint {
+					remote-endpoint = <&dsi0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				sn65dsi86_out0: endpoint {
+					remote-endpoint = <&mini_dp_con_in>;
+				};
+			};
+		};
+	};
+};
+
 &i2c3 {
 	pinctrl-0 = <&i2c3_pins>;
 	pinctrl-names = "default";
@@ -361,6 +451,11 @@ i2c0_pins: i2c0 {
 		function = "i2c0";
 	};
 
+	i2c1_pins: i2c1 {
+		groups = "i2c1";
+		function = "i2c1";
+	};
+
 	i2c3_pins: i2c3 {
 		groups = "i2c3";
 		function = "i2c3";

-- 
2.43.0


