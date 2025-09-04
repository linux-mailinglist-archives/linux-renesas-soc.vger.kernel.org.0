Return-Path: <linux-renesas-soc+bounces-21389-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 465A3B4474D
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 22:29:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F228F1664E3
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 20:28:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B78A927FB1F;
	Thu,  4 Sep 2025 20:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="nJZgik7Q";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="j0zXGg+4"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A03253F05;
	Thu,  4 Sep 2025 20:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757017737; cv=none; b=dRFPyGY5vI64giBsWZ6L1A3cQVhTYzaTzpDVc8mDbkGFGEZUihc54ay4co+vWDYIZdsogedlDN15a9rVBN0ydBEDQsShpQwkd9zdzFF3fAKT55GmeyQK9iD+rZSgmOW5vPziWCBhKW0RiR5U4Oaaahw47GzZ5cf+LQ9bwI81j2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757017737; c=relaxed/simple;
	bh=FXN0YpEdjSp8Zedukf7/NPPvCgfH+n/amgb6E3egaeM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OePjGHKTgarZkEbCACZ4fWoiLHKME+xDnTMCqoUUOtVQExGCQunzjV63uYuw3SfHcbot9bQVuoxz8moYlgJuWJ+ZSo54wfrFinJN/LAX6A5B1RETEKvoMCcQM49IBk/71r153JgdOjJG1gcowduGp8Ot0KQLettuwJlGhaFj60g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=nJZgik7Q; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=j0zXGg+4; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4cHrfY4zLgz9tNq;
	Thu,  4 Sep 2025 22:28:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757017733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=p/YNtLDVOMImYKYloFFu88omEQ5fOigX0mfZT8+GuSQ=;
	b=nJZgik7QtIgmHmVnk/nk4vZxZ4ASnlX8gSmbPEqlLtRK2P/Ccm02kuO2Q0f2mEhUvhUp52
	iJbs44lLxVf/ABlukvpIQ4RXiJ7/J5k2QEUt4lfToKplofRdmvn7+drrdppFTzdKKhpMdl
	Ylc92v9Vi8C7DSZ9nayX8e0mrxvhhPljR1CbIaREpwwpeoCelfCduO4mbREM0tTkHc/Fzh
	LH4nekrIbJNXnd6bXztc9l84hCkncd82lZMZztjhYQX3cqAzjbsBYcGmH9lDKRVPym9syl
	tuUiHhqp1w4+TWtV6SF7tAdxw8BRLbOJcGPKtVEYa5P87bmz5TgujVzaHS2aeg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=j0zXGg+4;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757017731;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=p/YNtLDVOMImYKYloFFu88omEQ5fOigX0mfZT8+GuSQ=;
	b=j0zXGg+4ZWfXoDV4iVLfIAj8yREXDTz/SRpaNVW3JRKQQGZOUIw2NUin8D6FrwWK94ztWg
	XX9PxfBtk+PHaFl8IgGfAO2xVUXY1rySpyhqWpjqOL+DJ/8J1+wKCw/f26rIjv1D6LjwU7
	L5yVXJ7FD1mKnVCRdwIa+mC71n9nsAXCkG5/Cmq04yMfiA3IIAzKsHZ/mIj4bxFhAZmmiy
	oXHNOKyNp9IsouZImTVfI2y/m0jazh8GDgFHNvffod8HZu5JMOf4e3EeV3AS8YofPKA5Kk
	TpnLCzdLdRYASVBzAQlBjpk2nACYD41PFDdN/zYsOdfRy5CDo7cGGCxoQJ4r2w==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2] arm64: dts: renesas: r8a779g3: Add RPi Display 2 DTO to Retronix R-Car V4H Sparrow Hawk
Date: Thu,  4 Sep 2025 22:28:06 +0200
Message-ID: <20250904202838.172579-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 33ed0958b3b835f3985
X-MBO-RS-META: gu4i9da77xhmrij33sg7ki75rej7wk9c
X-Rspamd-Queue-Id: 4cHrfY4zLgz9tNq

Add DT overlay to bind RPi Display 2, both 5" and 7" variant, on
Retronix R-Car V4H Sparrow Hawk board. All of display output, the
touch controller, and backlight control have been tested.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
---
V2: Build also the plain DTBO for each DTO. Each new DTO entry in the
    Makefile has three lines, the DTBO, combined and DTB targets. This
    is easy to miss, so note this down for myself.
---
 arch/arm64/boot/dts/renesas/Makefile          |  6 ++
 ...a779g3-sparrow-hawk-rpi-display-2-5in.dtso | 13 +++
 ...a779g3-sparrow-hawk-rpi-display-2-7in.dtso | 13 +++
 .../r8a779g3-sparrow-hawk-rpi-display-2.dtsi  | 90 +++++++++++++++++++
 4 files changed, 122 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-5in.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-7in.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2.dtsi

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index d8c9237624664..bef624636d58b 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -99,6 +99,12 @@ dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk.dtb
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-fan-pwm.dtbo
 r8a779g3-sparrow-hawk-fan-pwm-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-fan-pwm.dtbo
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-fan-pwm.dtb
+dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-rpi-display-2-5in.dtbo
+r8a779g3-sparrow-hawk-rpi-display-2-5in-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-rpi-display-2-5in.dtbo
+dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-rpi-display-2-5in.dtb
+dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-rpi-display-2-7in.dtbo
+r8a779g3-sparrow-hawk-rpi-display-2-7in-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-rpi-display-2-7in.dtbo
+dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-rpi-display-2-7in.dtb
 
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-white-hawk-single.dtb
 r8a779g3-white-hawk-single-ard-audio-da7212-dtbs := r8a779g3-white-hawk-single.dtb white-hawk-ard-audio-da7212.dtbo
diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-5in.dtso b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-5in.dtso
new file mode 100644
index 0000000000000..bf7b531ae9d9b
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-5in.dtso
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Overlay for the RPi Display 2 5" MIPI DSI panel connected
+ * to J4:DSI on R-Car V4H ES3.0 Sparrow Hawk board
+ *
+ * Copyright (C) 2025 Marek Vasut <marek.vasut+renesas@mailbox.org>
+ */
+
+#include "r8a779g3-sparrow-hawk-rpi-display-2.dtsi"
+
+&panel {
+	compatible = "raspberrypi,dsi-5inch", "ilitek,ili9881c";
+};
diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-7in.dtso b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-7in.dtso
new file mode 100644
index 0000000000000..6ec47f213c0ff
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-7in.dtso
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Overlay for the RPi Display 2 7" MIPI DSI panel connected
+ * to J4:DSI on R-Car V4H ES3.0 Sparrow Hawk board
+ *
+ * Copyright (C) 2025 Marek Vasut <marek.vasut+renesas@mailbox.org>
+ */
+
+#include "r8a779g3-sparrow-hawk-rpi-display-2.dtsi"
+
+&panel {
+	compatible = "raspberrypi,dsi-7inch", "ilitek,ili9881c";
+};
diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2.dtsi b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2.dtsi
new file mode 100644
index 0000000000000..733333b85a9d2
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2.dtsi
@@ -0,0 +1,90 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Overlay for the RPi Display 2 MIPI DSI panel connected
+ * to J4:DSI on R-Car V4H ES3.0 Sparrow Hawk board
+ *
+ * Copyright (C) 2025 Marek Vasut <marek.vasut+renesas@mailbox.org>
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	display_bl: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&mcu 0 255 0>;
+	};
+
+	reg_display: regulator-display {
+		compatible = "regulator-fixed";
+		regulator-name = "rpi-display";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	reg_dsi_touch: regulator-dsi-touch {
+		compatible = "regulator-fixed";
+		gpio = <&mcu 1 GPIO_ACTIVE_HIGH>;
+		regulator-name = "rpi-touch";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		startup-delay-us = <50000>;
+		enable-active-high;
+	};
+};
+
+&i2c0_mux3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	mcu: gpio@45 {
+		compatible = "raspberrypi,touchscreen-panel-regulator-v2";
+		reg = <0x45>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		#pwm-cells = <3>;
+	};
+
+	touchscreen@5d {
+		compatible = "goodix,gt911";
+		reg = <0x5d>;
+		AVDD28-supply = <&reg_dsi_touch>;
+		touchscreen-size-x = <720>;
+		touchscreen-size-y = <1280>;
+	};
+};
+
+&dsi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
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
+				remote-endpoint = <&panel_in>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
+
+	panel: panel@0 {
+		reg = <0>;
+		backlight = <&display_bl>;
+		power-supply = <&reg_display>;
+		reset-gpios = <&mcu 0 GPIO_ACTIVE_LOW>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&dsi0_out>;
+			};
+		};
+	};
+};
-- 
2.50.1


