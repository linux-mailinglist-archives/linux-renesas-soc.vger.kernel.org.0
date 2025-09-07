Return-Path: <linux-renesas-soc+bounces-21538-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 993DFB47C50
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  7 Sep 2025 18:12:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6CDD4189C994
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  7 Sep 2025 16:13:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B9202820CE;
	Sun,  7 Sep 2025 16:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="kkuqygMY";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="BB2erMoT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C98F280CC1;
	Sun,  7 Sep 2025 16:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757261521; cv=none; b=WEiqGlD+92Ep9z8wdi3gTSkICbSZEi9YQBWK+XtfeaSG+AIRVpcENIMgWS44FwylkxsqmrKicYUpGQMAVAzdB3ogWGgovNbh27yXkoVPjGawzbSHBtUUmle1Ax7K2BtjI1ONKEJ8qG2/nMDxoW/Bbri41Z6hxsWcNOyEQb7o5l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757261521; c=relaxed/simple;
	bh=DoWWulNoqgVogogYwz16ucNbHXDiJPeSY1/eY/QtXE0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gqz0YJmyFJ5gno/wbiUUg9hxvqtBK+u5COAX5Zxdo8LQOg8/0+dAo3mTq1Jv2pFQFGBZdUSlUerouoGlwVBV1DAswypXPXWEQ3rpDOBq/nMOV3Q3YDLEYDcTeGcaN9Yo1VfSVTdDtAMMx4Uh4KIysSq51p7tD/AI4tW+BlvX6Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=kkuqygMY; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=BB2erMoT; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cKZpZ51cCz9sX2;
	Sun,  7 Sep 2025 18:11:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757261510;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+9OHcP5c2ud1BeajMFK7r7Obvjia35QvFbBwFXTQrlk=;
	b=kkuqygMYNmgjVN3haqWIDStKEDbVU5aPPL9P8nukAztbQGBg9YOC9zSrBZaic7Zp8B8IkD
	auh9YiDbt9aPnZ46qWQ0T2LW728xVYs+Ns9ta2gKRkmKF4e84vVlBj+d5RNV+CydC5cvwk
	HE5WPIjMmjmsttP8KiNSLtId9Jlyz0TX1HaKoWX0lJ7UWNIPOtqT3nDGuECWIZes9QLIrQ
	oseAkEMk/F4eMkhHNUV+JA61MEEv4TExXBAow1AZtI/ekfwxOd20dMumWvb+z7iR+5XRWz
	TLb1lGX5+FfHbXangXo3udS7R7RaUfOhf4E0EoNjZpByxG8barH38Fqu9XfNIA==
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757261508;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+9OHcP5c2ud1BeajMFK7r7Obvjia35QvFbBwFXTQrlk=;
	b=BB2erMoTH59jc62MvowZ6mQTqTLMw0w3u+Taqv4zobDAIW2jI3SAzyE1VAisQQwlRiHDtv
	10bb6L0QXdqYsOXLOxhn1uWhX3GWuoSiqqUZyyozQ9ehaVKnJm8389ARATSv70P6y4H3Q4
	J3wnWTXLAgTTPMlRY4ybsEElAh8Ls+FoEa9LwfjW4EbC1yHMA5Rb7+/WDnucIb4Dl8qi4N
	vVxfOdelD7+/B4lqGrqn68TvgvHIbpPiDE+fX6hoFaR3MYMqEDtCQwiF/2S7wJi3cK3zPr
	KaMmyxsSoyLp3sapd7UANqnWiuU1z1LV8K40CAwcXcSo7/F2UQ8yfsnhDaFnFA==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v3] arm64: dts: renesas: r8a779g3: Add Argon40 fan HAT DTO to Retronix R-Car V4H Sparrow Hawk
Date: Sun,  7 Sep 2025 18:10:53 +0200
Message-ID: <20250907161130.218470-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: a95489918b13fec006e
X-MBO-RS-META: aaxc9spkhtcm8t4pighj8ftjy8sri8if

Add DT overlay to bind Argon40 fan HAT, on Retronix R-Car V4H
Sparrow Hawk board. Fan RPM control and full RPM on reboot has
been tested.

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
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
NOTE: Depends on series:
      https://lore.kernel.org/linux-hwmon/20250904202157.170600-1-marek.vasut+renesas@mailbox.org/
---
V2: - Rename the pwm-fan node to pwm-fan-ext to avoid colission
      with existing pwm-fan node in r8a779g3-sparrow-hawk.dts .
      There can be two independent blower fans.
V3: - Add TB from Wolfram
    - Rework the list of hwmon devices in example
---
 arch/arm64/boot/dts/renesas/Makefile          |  3 ++
 .../r8a779g3-sparrow-hawk-fan-argon40.dtso    | 51 +++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fan-argon40.dtso

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index bef624636d58b..b2325d1ddf9d3 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -96,6 +96,9 @@ dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g2-white-hawk-single-ard-audio-da7212.dtb
 
 DTC_FLAGS_r8a779g3-sparrow-hawk += -Wno-spi_bus_bridge
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk.dtb
+dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-fan-argon40.dtbo
+r8a779g3-sparrow-hawk-fan-argon40-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-fan-argon40.dtbo
+dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-fan-argon40.dtb
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-fan-pwm.dtbo
 r8a779g3-sparrow-hawk-fan-pwm-dtbs := r8a779g3-sparrow-hawk.dtb r8a779g3-sparrow-hawk-fan-pwm.dtbo
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-sparrow-hawk-fan-pwm.dtb
diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fan-argon40.dtso b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fan-argon40.dtso
new file mode 100644
index 0000000000000..c32bd665e50c4
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fan-argon40.dtso
@@ -0,0 +1,51 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Overlay for the Argon40 HAT blower fan in connector CN7
+ * on R-Car V4H ES3.0 Sparrow Hawk board
+ *
+ * Copyright (C) 2025 Marek Vasut <marek.vasut+renesas@mailbox.org>
+ *
+ * Example usage:
+ *
+ * # Localize hwmon sysfs directory that matches the PWM fan,
+ * # enable the PWM fan, and configure the fan speed manually.
+ * r8a779g3-sparrow-hawk$ ls -1 /sys/devices/platform/pwm-fan-ext/hwmon/hwmon?/pwm?_enable
+ * /sys/devices/platform/pwm-fan-ext/hwmon/hwmon0/pwm1_enable
+ *
+ * # Select mode 2 , enable fan PWM and regulator and keep them enabled.
+ * # For details, see Linux Documentation/hwmon/pwm-fan.rst
+ * r8a779g3-sparrow-hawk$ echo 2 > /sys/devices/platform/pwm-fan-ext/hwmon/hwmon0/pwm1_enable
+ *
+ * # Configure PWM fan speed in range 0..255 , 0 is stopped , 255 is full speed .
+ * # Fan speed 101 is about 2/5 of the PWM fan speed:
+ * r8a779g3-sparrow-hawk$ echo 101 > /sys/devices/platform/pwm-fan-ext/hwmon/hwmon0/pwm1
+ */
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	pwm-fan-ext {
+		compatible = "pwm-fan";
+		#cooling-cells = <2>;
+		/* PWM period: 33us ~= 30 kHz */
+		pwms = <&pwmhat 0 33334 0>;
+		/* Available cooling levels */
+		cooling-levels = <0 50 100 150 200 255>;
+		fan-shutdown-percent = <100>;
+	};
+};
+
+/* Page 31 / IO_CN */
+&i2c3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clock-frequency = <400000>;
+	status = "okay";
+
+	pwmhat: pwm@1a {
+		compatible = "argon40,fan-hat";
+		reg = <0x1a>;
+		#pwm-cells = <3>;
+	};
+};
-- 
2.51.0


