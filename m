Return-Path: <linux-renesas-soc+bounces-26636-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F2ED15EE9
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Jan 2026 01:08:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 958A83037CCA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Jan 2026 00:07:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78B95126F0A;
	Tue, 13 Jan 2026 00:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="cZx3MI6N";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="wA47KovY"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6927414A4CC;
	Tue, 13 Jan 2026 00:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768262860; cv=none; b=Q3FVvX1cvV9LIdD5gsZ7uRHlmUQ572lNIOJIP0tOwsgnXzbVXLhkvSVQvF3/mq1/UmAzAyS1BoK1N4IkryMpwwWvdViW4OO47XqKh8Ckp5XgZUi5DBaAOCN4VYMklhJQUMSiWhuRhXB4jTtD9f8owFAR0DgIG99hEaanCs20x8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768262860; c=relaxed/simple;
	bh=o7mxXuD8drhbuWmeJJoHQprfk4ZkTCnOClOkWYPdXds=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rDUKglUSNGrh/AnZKVoQUQrbya5iIHUwavu2JmHj/hhUVAaT3Krmg9+xPpZe71K8/apTsNm3hm9uLYtmOudBnM+SWhbYBUl6QXMqucgKEktzZBgUCpVc3TkqNceKzQaXOT71ZmFEm0LISkAFpX1LcgdVQBEOpzuE9ky9G5Hd8HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=cZx3MI6N; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=wA47KovY; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4dqqLp3bqsz9t2h;
	Tue, 13 Jan 2026 01:07:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768262850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/GyImWZTbKl+ezkSlROtAG0Gk3LdRCG1Mciv3tVf1qk=;
	b=cZx3MI6NWQZDC4UVAbRxLwUTZQhZV7Cjs0KNocbFY4ngZ+6kFUOE82JYHgnhjzBJGZc5Uw
	z8fXuRhy0hDG51LY5AP9Y5umu6FuVr1JY3V/egHvs9YPVkWkIu/NtJGljCGvvlqRoXH7Er
	ShhmqcGDDgRgWDZPt40JH/ZLJyYJyvuWiUJH2eTVjju5QtB6XvKXkmZTG50Ez7lnCkCzIr
	bqgzpRcaLWctu9q27CsMTIdTHDvjNa01yGVjTtGiGBDxno33SK4SG/SOg7MkGiUuz6CZHn
	8PbSJr3SjkvWlz1I051S6nesLT99rVbidt+ffEx9dSzZYVdpVUBmYVPI6K2JBg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=wA47KovY;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1768262848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/GyImWZTbKl+ezkSlROtAG0Gk3LdRCG1Mciv3tVf1qk=;
	b=wA47KovYvsW0V19y+bcfQ5Ou2DwGkR8+3VrbEbPe8PzpWWUAhK54cJxsVmx+vuM6NTdseN
	aCFeI55n7jFlQsir+sbp813WBtAvZnQokvIMwEuzyzRnOAPNjplVN01JAxsU2JDLXgSc6Q
	dZvc+qIcoOCpudpVj7GHmxUrMegXyjFo+DImCxTgan2QI4Kc3m1ejGQfhe8T8addlylkxQ
	rLiv+6OQcskLNYZ/IyM/JdKkrkrpMKJ9T3vELrk4xq7fNNMTIwOUgB5dEqh9e5ZxsuIXv7
	kO4E4Hr/5g8aNUopzQMlPemYuaC1h4p/f4JXgFpP2zzVkCiWGGRC2oORaBUqRw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Sam Ravnborg <sam@ravnborg.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: renesas: sparrow-hawk: Add overlay for WaveShare Display 13.3"
Date: Tue, 13 Jan 2026 01:05:31 +0100
Message-ID: <20260113000715.231238-2-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260113000715.231238-1-marek.vasut+renesas@mailbox.org>
References: <20260113000715.231238-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 5rwg5zk9ujw1snn6pc6ci6jc77s4breu
X-MBO-RS-ID: 05d7ad5e57ae50e8301
X-Rspamd-Queue-Id: 4dqqLp3bqsz9t2h

Add a DT overlay to bind the WaveShare 13.3inch 1920x1080 DSI Capacitive
Touch Display on the Retronix R-Car V4H Sparrow Hawk board.

Current device link is at https://www.waveshare.com/13.3inch-dsi-lcd.htm

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
DEPENDS:
- https://lore.kernel.org/linux-input/20260112234534.225954-1-marek.vasut+renesas@mailbox.org/
- https://lore.kernel.org/linux-devicetree/20260112234834.226128-1-marek.vasut+renesas@mailbox.org/
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Jessica Zhang <jesszhan0024@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/boot/dts/renesas/Makefile          |   3 +
 ...r8a779g3-sparrow-hawk-ws-display-13in.dtso | 108 ++++++++++++++++++
 2 files changed, 111 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-ws-display-13in.dtso

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 1fab1b50f20e6..8a2d1baa69c77 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -120,6 +120,9 @@ dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-rpi-display-2-5in.dtb
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-rpi-display-2-7in.dtbo
 r8a779g3-sparrow-hawk-rpi-display-2-7in-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-rpi-display-2-7in.dtbo
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-rpi-display-2-7in.dtb
+dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-ws-display-13in.dtbo
+r8a779g3-sparrow-hawk-ws-display-13in-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-ws-display-13in.dtbo
+dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-ws-display-13in.dtb
 
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-white-hawk-single.dtb
 r8a779g3-white-hawk-single-ard-audio-da7212-dtbs := r8a779g3-white-hawk-single.dtb white-hawk-ard-audio-da7212.dtbo
diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-ws-display-13in.dtso b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-ws-display-13in.dtso
new file mode 100644
index 0000000000000..e520fa264d790
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-ws-display-13in.dtso
@@ -0,0 +1,108 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Overlay for the Waveshare 13.3 MIPI DSI panel connected
+ * to J4:DSI on R-Car V4H ES3.0 Sparrow Hawk board
+ *
+ * Copyright (C) 2025-2026 Marek Vasut <marek.vasut+renesas@mailbox.org>
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	panel {
+		compatible = "waveshare,13.3inch-panel", "panel-dpi";
+		width-mm = <293>;
+		height-mm = <163>;
+		power-supply = <&reg_5p0v>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&bridge_out>;
+			};
+		};
+
+		panel-timing {
+			clock-frequency = <148500000>;
+			hactive = <1920>;
+			vactive = <1080>;
+			hfront-porch = <88>;
+			hback-porch = <148>;
+			hsync-len = <44>;
+			vback-porch = <4>;
+			vfront-porch = <36>;
+			vsync-len = <5>;
+			hsync-active = <1>;
+			vsync-active = <1>;
+			de-active = <0>;
+			pixelclk-active = <0>;
+		};
+	};
+
+	reg_5p0v: regulator-5p0v {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-5.0V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+};
+
+&i2c0_mux3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@41 {
+		compatible = "ilitek,ili251x";
+		reg = <0x41>;
+	};
+
+	bridge@45 {
+		compatible = "waveshare,dsi2dpi";
+		reg = <0x45>;
+		power-supply = <&reg_5p0v>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				bridge_in: endpoint {
+					data-lanes = <1 2 3 4>;
+					remote-endpoint = <&dsi0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				bridge_out: endpoint {
+					remote-endpoint = <&panel_in>;
+				};
+			};
+		};
+	};
+};
+
+&dsi0 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			dsi0_out: endpoint {
+				remote-endpoint = <&bridge_in>;
+				data-lanes = <1 2 3 4>;
+			};
+		};
+	};
+};
-- 
2.51.0


