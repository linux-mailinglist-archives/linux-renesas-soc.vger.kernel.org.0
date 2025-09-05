Return-Path: <linux-renesas-soc+bounces-21418-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 12EE6B44B6E
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 04:02:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CD2015673FA
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  5 Sep 2025 02:02:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB36C145A1F;
	Fri,  5 Sep 2025 02:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="JS7Bz8y2";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Anrc8DVT"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD158834;
	Fri,  5 Sep 2025 02:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757037736; cv=none; b=IcVZldP+Euvsv61tTTWgCl9c3EqRRtokL1cPCQfvb2fcvlNQODQt+0zfqO6gyR6SpslvdOcfmaX4frjaOi+PaavLFePJCMA/Au7MJMRVvCRpNX4/cmux3yBQX0pDIrs7ziV9jLSk2YFYQpVXEKLy+deO4bOcC7Qf8xl5rvkLKXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757037736; c=relaxed/simple;
	bh=XaJtboMvJHs+/XQZNZ/T3KPZbSC5havEN7LlJqWd68o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N4Hdbu8S7ETBG1+LrJ/E2hzJKI7xMM14nGnHbkA3odLKA1VxLPIiRM1I6RkTYrQq+mA8T/WwoaQAbuQo+e87SNZ3yjpC5zpUWUgMV1vPGl+TsjGkn8b8gdPKo0y1CXKOWUjPXTZkRjGq100FF6JTMskDCbsKnxuTfpFczbJYeDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=JS7Bz8y2; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Anrc8DVT; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cJ0381QVxz9t9r;
	Fri,  5 Sep 2025 04:02:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757037732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3svo2HRkgC0ndGesHRLcgrmlXkV9pekhpPJ3Bzfrl+g=;
	b=JS7Bz8y2OPsBOhWe35NXKp9Pv9QFJdk0OMi70thQyA7+sPjVIHPMYns9IdGjgSsFuXns9F
	qe1H32jLu9RCT9RZp0xj0W8oczvD2XSiu530JLDX5LtVA17wXNc1FfG/11+9TyOFkRgrRH
	hKRTmpuX7maLBtjub0kDwb+k2jF/wIVV30KrfaIGifys7muOns+0jglbHpZsWDRjQ9tMQB
	h01BhvMynGM4LNMK4gDzVj5QopGVFyh69H7sqLesn60zBU48xRbCN3aA4v6P1RphUkXA5h
	kWNpTUERuPXaE2P+Amji9+xuvWo14K8tJnSm2tM3jzRW0Yxt0sDJVwZo5jpEJg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=Anrc8DVT;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757037730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3svo2HRkgC0ndGesHRLcgrmlXkV9pekhpPJ3Bzfrl+g=;
	b=Anrc8DVTrzMEUqwzIPJQA9IrvhZFIX0deIIxrEwJNmxJ/Ikq38oF6PZW341WnUR/zqwYRr
	kspto8ofqxXkLJ2LK/eSABrnyKHkBs0YTKQRmQE7288TMppZmre/650wOfmIMqxgSXSw1u
	KS9HJL0wka3B9OWutHSwZuQWOuUAg/ceNcMHq9oH4uN3PiAVyPxqH3Qclk2oK+DBso3Qgm
	yWFVdpCdeYzHg0U3Fh8izSb+okIRhfB9M0Z6amrpOSl7g123aTgLFSUOSdR68urjzcxe6q
	LM/Dxaw8kYi3mRPj3liqWRpshb/5a3XnzZ0DmIrLGnvgaXyCkkzhZHDIxaUcqA==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2] arm64: dts: renesas: r8a779g3: Add Argon40 fan HAT DTO to Retronix R-Car V4H Sparrow Hawk
Date: Fri,  5 Sep 2025 04:00:57 +0200
Message-ID: <20250905020149.257459-1-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 8a2ee3995c9aadaea29
X-MBO-RS-META: ufk7k3wds8g7ngrr7neuht9mzujsbx1r
X-Rspamd-Queue-Id: 4cJ0381QVxz9t9r

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
V2: - Rename the pwm-fan node to pwm-fan-ext to avoid colission
      with existing pwm-fan node in r8a779g3-sparrow-hawk.dts .
      There can be two independent blower fans.
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
index 0000000000000..f7c144eb63920
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
2.50.1


