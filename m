Return-Path: <linux-renesas-soc+bounces-10963-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 601CB9E57BD
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2024 14:48:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 609851883FF5
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  5 Dec 2024 13:47:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21D54222561;
	Thu,  5 Dec 2024 13:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="OA1n9cMJ"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6561D221461;
	Thu,  5 Dec 2024 13:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733406348; cv=none; b=BM6IBh9W+Ih1eNbbfZ247UEsgacBk0aAEKP/8bYbbK6/u770zsp6i+QJqcunBnMMczjH4RI94sG0sNiVaKqxC4mva3wYV0voCtzL9bKA9j6ayba4qE0iwR/sJbQcec1Ow7ARiZjapDGL16wy9VCrK9bYK3friTSYf1dJ+QfrjOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733406348; c=relaxed/simple;
	bh=tRF43KBsvxv3hRirW7Pu5wocJ26K3VE9RSkQJeg7ABU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kAnxwDETEkRzHedS65J3b2ksiCpfshl3iGzNTWt9zgGB61arwKYJ+QnHCPrWaH8L6U1gh2iEHk6Dx7yqvH1dDNRz87rYBMPaw5Cjn/k62ZitFlnfloSal+UvUpqpoYWncbSAsqh6nCGBgQ+jJndBRsogGSuAdfcnTFNQ3dlOpIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=OA1n9cMJ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D5C6B1063;
	Thu,  5 Dec 2024 14:45:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1733406315;
	bh=tRF43KBsvxv3hRirW7Pu5wocJ26K3VE9RSkQJeg7ABU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OA1n9cMJMPnikyhxwz7EcVXcDKAX7UMX+n1bt7jTXVMiuWwWNkTr/MBqSakzugY3t
	 kphahV54aB/iMO/GUhvaut1xF//v0gHsb4zorWhQsYVmBLuEfU10CmPM+xJT2S3vEC
	 CWO/u2GcYV/nyIn7ol1+Hvtp7vqLnW51GHxihNH8=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 05 Dec 2024 15:45:05 +0200
Subject: [PATCH v2 10/10] arm64: dts: renesas: gray-hawk-single: Add
 DisplayPort support
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-rcar-gh-dsi-v2-10-42471851df86@ideasonboard.com>
References: <20241205-rcar-gh-dsi-v2-0-42471851df86@ideasonboard.com>
In-Reply-To: <20241205-rcar-gh-dsi-v2-0-42471851df86@ideasonboard.com>
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
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUa5016ggN4ijsS9cosSzVInIMBKN5wmX+o8aV
 eO3+rTzwJ6JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1GudAAKCRD6PaqMvJYe
 9fFYD/0YxHcK0WoJP+pfc8ZoGNbOJ5lfl0dqpVoHSMKlphIRTK64r93Ou6gzMI2w1mILsvyDv08
 tvLukm2pu20WEUY0e761OOe+2/kXyKhJfDIEPhBvW/KOOSy9SZthCa6fnq0fEKwdqrV5zOVmJ0S
 dKP9ofxdQh0QFwHTB34g6OXG3jXmixKrOxEQHOTRpvAlU2Czcl4WdAgrnG9p+vS9HCh1CUQxjeC
 DVvhp7lQg/0C8Z7QFAf4kcWiAco6knFm1ZuS2IRno4JzMm/2BhFgUwVJu17Z9nvtvLKNCUGgsdx
 UpTsWu7LFiy9RU5gB+JOpBcvqSXjj0/OmWo5U2D6LVsY+cT4xmr+D7sSInIyZemlJOGbQAbaTMS
 gKaKUg799XB93vUFVGOnOvcoMog54psczzlRAM9FY0T5ePyvedx1/TyRmmVy4VMZ20TZyyFm5xC
 P5wshfONoX72yfSvN25ZrHyBOCrkDtuS4y54YZrrtoi8i2OvSEuE/TB13o+pExvh2nZF9b4OFwl
 reES4Z5MVH1JvHk5FE6EzIPYbHeBRSNg4B+1xYABE5q5qsgIDBfzX5m9oJ3eCeLH8rxj+b5yy4N
 eBXIU56N3sDmLMi2RzebrHAKG74egB5/+5zQt2+ZJ6od9WszpVbtP0v8HQgyoI6COCrS7B0qwLS
 uf03Kp4HGjzlEiw==
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


