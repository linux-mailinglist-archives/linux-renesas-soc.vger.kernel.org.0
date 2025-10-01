Return-Path: <linux-renesas-soc+bounces-22493-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EA084BAF4E0
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 01 Oct 2025 08:50:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6A3E3189EDEB
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  1 Oct 2025 06:51:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A473723BD02;
	Wed,  1 Oct 2025 06:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="HfIwClim"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 619351474CC
	for <linux-renesas-soc@vger.kernel.org>; Wed,  1 Oct 2025 06:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759301452; cv=none; b=WEjhsLDUn7u/q8/EWMwA4x4hOKwM/F3rxiPgqBUMzzhqlB5wy+EFd88S/ZNl1WcPBrvr7/AI230YPXRSdMZyFO0XHqHqSJXgfTQeOjSwiR8ivL3iFaRyTHTDfRmMToClrSIx9L0pHDgnUr1zrOIU5/szcv8sSg4OUE85EPT67Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759301452; c=relaxed/simple;
	bh=DqxNlrQlnkzTUIrh/e6yKwM0F9/RKaddCjZat9rXxxs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Bcb+HeQuLbQdxdy5RkM6UF+dDe4AdAkGhIr4v4DiSUAiMv22ku+LsSDClhOfTdzof+tF5rS5WxUfi9s8OdS/Ne58wVS69NleeN8ftHyvjj3K+WMUcNJqMIqKLP1EUR3pU2M0mFPf9z6c9VvdZcJqeNls9DVV2CA9UjTp5MHRzI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=HfIwClim; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=7iXMqq1U64pP/8
	WWpnodBRQ3aZ9gPKRBHnEv+H1B6is=; b=HfIwClimSil+Rh4/nIen7e4j+AKZcQ
	ajjpNjUlFZ00xmMdH5JL3lzwAmURadidrM+lnDZUVVOIxmhwXaqzE/YkX73CHNsz
	GJYJ1eLNJegFGUJi0YhnOVtniPTIJofN5ylgQEwpf7L+bMESjNe9chyP5tVlFdrq
	jhAoq0GPcGxqikxN3LdiAqN2IFOxJdO0SDfRwEJflUE5UUEWuBM0CZvEVJZsY3dh
	kGNO/UpqSf64sdVBCUkeO7u2wiCYjU60z+HMZJ6Pyb9HG+jRsMOszGuvNOzH7poQ
	IgB7yszm4ebzZ/NbBoiK16DgX7x+KMT3nkPRpb48wrh80vhIENDVRfug==
Received: (qmail 3929362 invoked from network); 1 Oct 2025 08:50:45 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Oct 2025 08:50:45 +0200
X-UD-Smtp-Session: l3s3148p1@F0K1SRNAjOYujntN
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH] ARM: dts: renesas: r9a06g032-rzn1d400-eb: describe LEDs
Date: Wed,  1 Oct 2025 08:50:01 +0200
Message-ID: <20251001065039.22874-1-wsa+renesas@sang-engineering.com>
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

Changes since RFC:

* renamed the include guard
* improved the comment explaining SW2-2
* renamed the define to 'DB_SW2_2'

Notes: I kept the name for the header file because the switch is on the
DB board. Adding "EB" doesn't really add something IMO because the DB
might sit on another carrier board theoretically.

Depends on "[PATCH v4 5/8] ARM: dts: r9a06g032: Add GPIO controllers"
which is still in-flight.

I wonder if this needs to be split into two patches (DB and EB part)?


 .../renesas/r9a06g032-rzn1d400-db-switches.h  | 21 +++++++++++++
 .../dts/renesas/r9a06g032-rzn1d400-db.dts     | 30 +++++++++++++++++++
 .../dts/renesas/r9a06g032-rzn1d400-eb.dts     | 19 ++++++++++++
 3 files changed, 70 insertions(+)
 create mode 100644 arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db-switches.h

diff --git a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db-switches.h b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db-switches.h
new file mode 100644
index 000000000000..c6f9c27d286a
--- /dev/null
+++ b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db-switches.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * On-board switches for the Renesas RZ/N1D demo board (DB)
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ */
+
+#ifndef __R9A06G032_RZN1D400_DB_SWITCHES_H
+#define __R9A06G032_RZN1D400_DB_SWITCHES_H
+
+#define SW_OFF         0
+#define SW_ON          1
+
+/*
+ * SW2-2:
+ *     SW_OFF		- enable ALT0_PMOD (PMOD1-3 + LEDs on the extension board)
+ *     SW_ON (default)	- enable ALT1_CAT_S3 (CAT/S3)
+ */
+#define DB_SW2_2 SW_ON
+
+#endif
diff --git a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
index 3258b2e27434..c3786d54992a 100644
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
 
+#if DB_SW2_2 == SW_OFF
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
 
+#if DB_SW2_2 == SW_OFF
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
index 97a339b30d76..5dbc09ac286f 100644
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
+#if DB_SW2_2 == SW_OFF
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


