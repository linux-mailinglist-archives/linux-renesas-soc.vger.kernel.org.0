Return-Path: <linux-renesas-soc+bounces-16112-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A788A917F6
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Apr 2025 11:33:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6E15460D41
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Apr 2025 09:33:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92794225A38;
	Thu, 17 Apr 2025 09:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="G6vVQSHt"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8E415F41F
	for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Apr 2025 09:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744882386; cv=none; b=SPQ3TcIL6zOAZAQFXzLz7piySwd8Rqia1HEO19asBYOWoRxXvRrFVrizQiu0ODnj7C7jkkDQvUvjdNpXns6JeUp4Chdc1Pr5nm1aH5+0SQnJSzh3PUMGpP3EnQHixBoHQFq5c2kb0+vY4WtWbhm2SpAFXFoMEEwhViRqJ+XmD60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744882386; c=relaxed/simple;
	bh=lbunJAZ30YCg4tQlPP0ycA03yCNg4s20V6w/IECLPfU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R6czXAbrVDHxUpfvM1YsDBmxlE3VFClnrdAnKzFh5VqvkbFghMEjzjMPyC1uy9l4JnztDfDTA8hlUR1dGnc2TO6W3jrJqIswqV87Y8SKS5Y9TFDfYnxfT296YCO3HVaX3hcn4xXvlllVXeGr/iWKh7aSJ7P5rkWBahy6HwwwDgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=G6vVQSHt; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=i7ZzLydZNojey0
	WNQEX0yeYcx3y7kYFw7QyvDehJw+k=; b=G6vVQSHtDZkj0x152JC58dcHEaR7v+
	fBUpbP5uxfDeghhXviriyUJQcDKbTSnIzr3wZRgcA3aqhGMPg2g6gLubBeGRmGvB
	CMSHY4wKCUpqlCzlDdATBocjh+PDldaH+tnr38Cc7/8HAuDz6eZ55zxdMqmRMUSD
	jwC91AMPbZHLeZN432hVnI6jBKBQXATLTfu+axMS79Nh0MQsBmUtos9ebOgipvlM
	rnfWbmCHmRe2BSDVlQTTd2wh5EAJHokDLWrOSCvxiegVQStSOnfN04VIYTtHoPeX
	2+5vaM13knNOxbi+vjqcZJ6j1rlGfVyhql+1+qG0d0OljivWHxLMA7DA==
Received: (qmail 1040592 invoked from network); 17 Apr 2025 11:33:00 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Apr 2025 11:33:00 +0200
X-UD-Smtp-Session: l3s3148p1@IoVtFvYy5MUgAwDPXyfYALbiJ46yNPq3
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v3] ARM: dts: renesas: r9a06g032-rzn1d400-db: describe Debug LEDs
Date: Thu, 17 Apr 2025 11:28:27 +0200
Message-ID: <20250417093256.40390-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Changes since v2:
* using function, color, function-enumerator properties now

Honestly, this is better than using node names? With V2, the LEDs were
named as in the schematics, now they are called:

lrwxrwxrwx    1 root     root             0 May 12 12:10 green:programming-0 -> ../../devices/platform/leds/leds/green:programming-0
lrwxrwxrwx    1 root     root             0 May 12 12:10 green:programming-1 -> ../../devices/platform/leds/leds/green:programming-1
lrwxrwxrwx    1 root     root             0 May 12 12:10 green:programming-2 -> ../../devices/platform/leds/leds/green:programming-2
...

Which gets even more confusing if we might later add LEDs not on this
board, but on the expansion board. 'green:programming-8' sits where?

I really wonder, but if this is the official way now...

 .../dts/renesas/r9a06g032-rzn1d400-db.dts     | 68 +++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
index fef40e288679..16babb38eb05 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
+++ b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
@@ -10,6 +10,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/net/pcs-rzn1-miic.h>
 #include <dt-bindings/pinctrl/rzn1-pinctrl.h>
 
@@ -86,7 +87,74 @@ switch-8 {
 			debounce-interval = <20>;
 			gpios = <&pca9698 15 GPIO_ACTIVE_LOW>;
 		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
 
+		led-dbg0 {
+			gpios = <&pca9698 0 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_PROGRAMMING;
+			function-enumerator = <0>;
+			default-state = "keep";
+		};
+
+		led-dbg1 {
+			gpios = <&pca9698 1 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_PROGRAMMING;
+			function-enumerator = <1>;
+			default-state = "keep";
+		};
+
+		led-dbg2 {
+			gpios = <&pca9698 2 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_PROGRAMMING;
+			function-enumerator = <2>;
+			default-state = "keep";
+		};
+
+		led-dbg3 {
+			gpios = <&pca9698 3 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_PROGRAMMING;
+			function-enumerator = <3>;
+			default-state = "keep";
+		};
+
+		led-dbg4 {
+			gpios = <&pca9698 4 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_PROGRAMMING;
+			function-enumerator = <4>;
+			default-state = "keep";
+		};
+
+		led-dbg5 {
+			gpios = <&pca9698 5 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_PROGRAMMING;
+			function-enumerator = <5>;
+			default-state = "keep";
+		};
+
+		led-dbg6 {
+			gpios = <&pca9698 6 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_PROGRAMMING;
+			function-enumerator = <6>;
+			default-state = "keep";
+		};
+
+		led-dbg7 {
+			gpios = <&pca9698 7 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_PROGRAMMING;
+			function-enumerator = <7>;
+			default-state = "keep";
+		};
 	};
 };
 
-- 
2.47.2


