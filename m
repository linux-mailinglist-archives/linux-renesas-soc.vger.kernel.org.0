Return-Path: <linux-renesas-soc+bounces-22075-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4A2B88C1F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Sep 2025 12:07:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EEF984E2E02
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 19 Sep 2025 10:07:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7BD42BEC2A;
	Fri, 19 Sep 2025 10:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="InUv81VS"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECD62EB869
	for <linux-renesas-soc@vger.kernel.org>; Fri, 19 Sep 2025 10:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758276467; cv=none; b=Yo/S9V+apmzsuCTuV1eQ3AqBxva+mWF4NRi4881wDiP/tuPwweZINhO7ufnUFNOlKYBrVBc4Mfs+hO6W2dUPe/97OIeeDHtURA2iZYI9vqjyBEjOA+p5i+ff+7I5ujtJcwU/FtPcJLwoTu4W0Bq6B7WwftNIdcLF3RuAgZP4750=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758276467; c=relaxed/simple;
	bh=ZEijCkm5JFA7W5dAVumfXX91XZdpHgOa0FJjn89WkDM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b1Xe9leuKhRFXrxQnQIix9JlhSMKYTXupRF4cq941apgi9GW1YjP2V2JqXDx8ySh/sIn5IWIrwfwmimNy+6nbVaSKGS+gv9WaBk4RQMOfMfdN4sBpr6oSw1s+UREse+D8csao63UtKeo9gzIriM5ihs00CEmdo5Nh6kUazmJgGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=InUv81VS; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=de7W3rM6nCceW2
	hUAcO3aWBmElPbrQ0yWYcqZue19ck=; b=InUv81VSQIbYzJmOFYTqxagz0mwJt8
	apyDlREiBJJNiJAwy7LNQ330hPDp+v/fwSo/Vok149oz0UEr+zn58sa3HkAnNUEV
	QaiyFEM2teGUHM2mUA8BM3g0rUTEhLQK4+QLkKzfUpIK6LNEViD9f8O0UJNkdnaf
	+74C4Hp3BqU7FsMKMDtRPEmS6lv5hFkplj53jMQtk3VeiCH/Ke+tkMLIiBI8JJbJ
	OjmSuG68cncNrul7pjCMkzdOUVkZmPb9bW2sI+L6mkc9eFSo8+hJRXHTK4vG6Z8h
	2Y3njv6hyq4MEaFBMN7iS1KONnqFJDimEC7oCXlLoOUOIGZIL5FBO5IQ==
Received: (qmail 3874070 invoked from network); 19 Sep 2025 12:07:43 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Sep 2025 12:07:43 +0200
X-UD-Smtp-Session: l3s3148p1@7n4DpCQ/iOEujns7
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [RFC PATCH] ARM: dts: renesas: r9a06g032-rzn1d400-eb: describe LEDs
Date: Fri, 19 Sep 2025 12:07:20 +0200
Message-ID: <20250919100740.28429-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To be able to use the LEDs, a configuration switch has to be set to a
non-default value. So, infrastructure to support these switches (which
modify signal routing via the CPLD on the demo board (DB)) is added as
well.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

This patch depends on "[PATCH v3 5/8] ARM: dts: r9a06g032: Add GPIO
controllers" which is still in-flight. I send this out as RFC already,
so we can discuss the introduction of the switch dependant settings. I
copied this approach form RZ/G3S.
 

 .../renesas/r9a06g032-rzn1d400-db-switches.h  | 22 ++++++++++++++
 .../dts/renesas/r9a06g032-rzn1d400-db.dts     | 30 +++++++++++++++++++
 .../dts/renesas/r9a06g032-rzn1d400-eb.dts     | 19 ++++++++++++
 3 files changed, 71 insertions(+)
 create mode 100644 arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db-switches.h

diff --git a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db-switches.h b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db-switches.h
new file mode 100644
index 000000000000..4560d16e7c60
--- /dev/null
+++ b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db-switches.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * On-board switches for the Renesas RZ/N1D demo board (DB) and extension
+ * board (EB)
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ */
+
+#ifndef __N1D_DB_EB_SWITCHES_H__
+#define __N1D_DB_EB_SWITCHES_H__
+
+#define SW_OFF         0
+#define SW_ON          1
+
+/*
+ * SW_2-2:
+ *     SW_OFF - enable PMOD1-3+LEDs on the extension board
+ *     SW_ON  - enable CAT/S3 (default)
+ */
+#define SW_2_2 SW_ON
+
+#endif
diff --git a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
index 3258b2e27434..849b5ad9c79d 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
+++ b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
@@ -15,6 +15,7 @@
 #include <dt-bindings/pinctrl/rzn1-pinctrl.h>
 
 #include "r9a06g032.dtsi"
+#include "r9a06g032-rzn1d400-db-switches.h"
 
 / {
 	model = "RZN1D-DB Board";
@@ -185,6 +186,14 @@ fixed-link {
 	};
 };
 
+#if SW2_2 == SW_OFF
+&gpio1 {
+	pinctrl-0 = <&pins_gpio1>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+#endif
+
 &i2c2 {
 	pinctrl-0 = <&pins_i2c2>;
 	pinctrl-names = "default";
@@ -256,6 +265,27 @@ pins_cpld: pins-cpld {
 			 <RZN1_PINMUX(122, RZN1_FUNC_USB)>;
 	};
 
+#if SW2_2 == SW_OFF
+	pins_gpio1: pins-gpio1 {
+		pinmux = <RZN1_PINMUX(80, RZN1_FUNC_GPIO)>,
+			 <RZN1_PINMUX(81, RZN1_FUNC_GPIO)>,
+			 <RZN1_PINMUX(82, RZN1_FUNC_GPIO)>,
+			 <RZN1_PINMUX(83, RZN1_FUNC_GPIO)>,
+			 <RZN1_PINMUX(84, RZN1_FUNC_GPIO)>,
+			 <RZN1_PINMUX(85, RZN1_FUNC_GPIO)>,
+			 <RZN1_PINMUX(86, RZN1_FUNC_GPIO)>,
+			 <RZN1_PINMUX(87, RZN1_FUNC_GPIO)>,
+			 <RZN1_PINMUX(88, RZN1_FUNC_GPIO)>,
+			 <RZN1_PINMUX(89, RZN1_FUNC_GPIO)>,
+			 <RZN1_PINMUX(90, RZN1_FUNC_GPIO)>,
+			 <RZN1_PINMUX(91, RZN1_FUNC_GPIO)>,
+			 <RZN1_PINMUX(92, RZN1_FUNC_GPIO)>,
+			 <RZN1_PINMUX(93, RZN1_FUNC_GPIO)>;
+		drive-strength = <12>;
+		bias-disable;
+	};
+#endif
+
 	pins_eth3: pins_eth3 {
 		pinmux = <RZN1_PINMUX(36, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
 			 <RZN1_PINMUX(37, RZN1_FUNC_CLK_ETH_MII_RGMII_RMII)>,
diff --git a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
index 97a339b30d76..6d0e12ae4de1 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
+++ b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
@@ -8,11 +8,30 @@
 
 #include <dt-bindings/leds/common.h>
 #include "r9a06g032-rzn1d400-db.dts"
+#include "r9a06g032-rzn1d400-db-switches.h"
 
 / {
 	model = "RZN1D-EB Board";
 	compatible = "renesas,rzn1d400-eb", "renesas,rzn1d400-db",
 		     "renesas,r9a06g032";
+
+#if SW2_2 == SW_OFF
+	leds {
+		compatible = "gpio-leds";
+
+		led-prog0 {
+			gpios = <&gpio1b 23 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_PROGRAMMING;
+		};
+
+		led-prog1 {
+			gpios = <&gpio1b 24 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_RED>;
+			function = LED_FUNCTION_PROGRAMMING;
+		};
+	};
+#endif
 };
 
 &gmac1 {
-- 
2.47.2


