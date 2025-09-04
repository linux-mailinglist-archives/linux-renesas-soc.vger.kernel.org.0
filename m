Return-Path: <linux-renesas-soc+bounces-21397-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F03B447A6
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 22:46:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9777F1894696
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Sep 2025 20:46:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C463823817E;
	Thu,  4 Sep 2025 20:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="jIfxdcwK";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="kFZ6fULo"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922311F4168;
	Thu,  4 Sep 2025 20:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757018750; cv=none; b=AcFOm/WIbRZPQ3B5cw8urCGp6nXSLzI6ity5R0oS5CuPkBWe/XLXDsCaXxp48vcIpjJWBOvtMjC4arUXStnDhY1TxTiYy57QqAm0SHvO9+f8CH3mSOApb0A8OjxNDcT5zUevtnvxCyoa5SnCKJlcC9JlvFb2+l62P5MGbXMHUoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757018750; c=relaxed/simple;
	bh=05i5KKzlsbT/8I79/AsjlFkfQC/HDtaYEWwTXvjLtSc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jfmPDrvodTK1nxl0oPJMCaOqF/e5RjZF8pqgUrn6vl395OFRbS3/8Ujz/pKxtX19OmIS6MdfkTsbGCU3LA90beM6woC4Goz2e36hThyoXGe+Mw2u/RyEUbVPT+iMPnsgg0TzrpVvmOU+/go4jD4axgm8t1Zw5uk8GOaU2BIR/zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=jIfxdcwK; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=kFZ6fULo; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cHs223M9sz9t9t;
	Thu,  4 Sep 2025 22:45:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757018746;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Gu9QfSR06q9gQse2ZBICxJa2UFCZpC56QqcslqucwuE=;
	b=jIfxdcwKB+041GOrNihkdrUbdB6SkGFw3SbztFhDhSLSJUuAML7CYPCYUit2HJ8hOiWIGU
	4/kRY5JDoKnljd4oG66MWWiCWVdTiBSBX2kZDdg1JUDNgpF+AXskBlyUeg04/YerW1uErK
	lyPgNd3mgNayTVD/nMEmnD3FFanTzrGzHmWNfHqZS5mX294TW5bl+CrLGjYBNwF4iSb85S
	b8joR/ojgf0Dz+VUJdj7FSBRgiqdXkf1oqQz/ciHFIJ7oVYjtxJX8yy7zKUPEWBt6U7FR0
	2DFTrK1bXeIOqhli5vzI5+BkWBcpSQ94FrxnP3GrrknvnRnfvnwF05ySBq45Sg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=kFZ6fULo;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757018744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Gu9QfSR06q9gQse2ZBICxJa2UFCZpC56QqcslqucwuE=;
	b=kFZ6fULolcuNmXOd+8DAb3Rgtphasmqs2mkaZM+AN+iSWWizXzRwC4GLRflBDq2JQtNmKm
	I02AYhkyfG+DAs6ue/62esVrXWkVUB3gLbtyyO8Ag2jn3M4aHc/iIqsGe0ehFYpW+V1+iD
	E7OR24FDKcX2sB5yK0U49FVAc7RO3Yb/qU79MoZTgAt2hvk3u/xrQo8mT7GJJEJPB091AU
	hUqq++vzjudawhGxNO9nyl0Rpi/z1G8o7L2gn6ZwR3LW5x675Ksq3s5ixf+GVZcsLonBOa
	BpTHI0zefb+l7iJfJ/QLI7qY2zWhB4Zk6UAqWOw+/tTr7d1s8gqCB3VnF4tMWA==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] arm64: dts: renesas: r8a779g3: Add Argon40 fan HAT DTO to Retronix R-Car V4H Sparrow Hawk
Date: Thu,  4 Sep 2025 22:44:56 +0200
Message-ID: <20250904204522.180439-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: c5fb2a05ee80b534582
X-MBO-RS-META: w3o1ifttorfcjdp54tt1zupytisdirwx
X-Rspamd-Queue-Id: 4cHs223M9sz9t9t

Add DT overlay to bind Argon40 fan HAT, on Retronix R-Car V4H
Sparrow Hawk board. Fan RPM control and full RPM on reboot has
been tested.

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
 arch/arm64/boot/dts/renesas/Makefile          |  3 +
 .../r8a779g3-sparrow-hawk-fan-argon40.dtso    | 56 +++++++++++++++++++
 2 files changed, 59 insertions(+)
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
index 0000000000000..e63fd3e18b2a1
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fan-argon40.dtso
@@ -0,0 +1,56 @@
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
+ * r8a779g3-sparrow-hawk$ grep -H . /sys/class/hwmon/hwmon?/name
+ * /sys/class/hwmon/hwmon0/name:sensor1_thermal
+ * /sys/class/hwmon/hwmon1/name:sensor2_thermal
+ * /sys/class/hwmon/hwmon2/name:sensor3_thermal
+ * /sys/class/hwmon/hwmon3/name:sensor4_thermal
+ * /sys/class/hwmon/hwmon4/name:pwmfan
+ *                       ^      ^^^^^^
+ *
+ * # Select mode 2 , enable fan PWM and regulator and keep them enabled.
+ * # For details, see Linux Documentation/hwmon/pwm-fan.rst
+ * r8a779g3-sparrow-hawk$ echo 2 > /sys/class/hwmon/hwmon4/pwm1_enable
+ *
+ * # Configure PWM fan speed in range 0..255 , 0 is stopped , 255 is full speed .
+ * # Fan speed 101 is about 2/5 of the PWM fan speed:
+ * r8a779g3-sparrow-hawk$ echo 101 > /sys/class/hwmon/hwmon4/pwm1
+ */
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	pwm-fan {
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
2.50.1


