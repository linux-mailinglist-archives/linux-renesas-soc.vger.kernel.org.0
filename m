Return-Path: <linux-renesas-soc+bounces-17345-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB23AC0670
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 10:01:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1251B3A9864
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 22 May 2025 08:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D73712566DA;
	Thu, 22 May 2025 08:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="mMwSVgw0"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4194A255E4D
	for <linux-renesas-soc@vger.kernel.org>; Thu, 22 May 2025 08:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747900884; cv=none; b=YbwngBt8C+R3NcZbtkNPWPJbzy6XZ+pMoP2O+zeY1H701anJPSmS05Lqsek2C+mio+wM1b8Kkbhi4Wr4G4lops9S/izXxi8amN3P5QTVVAx56a3m+we8MQeC8bQhj2ETOfA+VvvuzSMqYkdOAVKEveLnFKggI/MUppmrF6TRM8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747900884; c=relaxed/simple;
	bh=i6T02UoBuX5x2ElIgCmVmH8OKbIXo+DNnksNJDlaVe8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B29Anr7rW+Ts+DedP2oxZuxML38FHoTmUiFbfuwkSM8FHPXwkQuIQ7g+s5xvNLLgaQj0fhlplKPYNRx+HsDcB06VRKKDI0wGqMLX926OGQ5qo6XyDNz3VLsbJ0TqNxDx5e4cVXHLjWatjWzk+6fIWgVzDFuGpElh2R+GGQSTdck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=mMwSVgw0; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=8n63vQYCbJVNxi
	1Du4H9+xTzZ8Ldfs6PCqrPktzhJak=; b=mMwSVgw0HLU5AZOoKHuks7ym2mwizV
	1OUvAfXFwxW/wII1DEkYcSgx1113HlwnzAbRfOxI7xCEVJiIcf337SntksoGW7tt
	3GIQaedBgfV7V7ZHNIA8nc/Oz1hU1xY04CwL1Tuom5GeI6TPJFX0f7oAUP9i9oS7
	taNFgZoqzKmdnyzawvLtlI+19h9TglPdrjt8Gv1FFyOrunIWlFEzG22fVH0m0/f2
	T8A75h/QB03RhRD6o+JiaZiFn9fp4jT84dFYR1xyNxoj3XuWOL/JdwUrH1niYKW/
	1bnDPO+60ihTyU8DecaNIIj56JFwGSyYMLq5MR/QSWB43Pao1VbG359Q==
Received: (qmail 3562537 invoked from network); 22 May 2025 10:01:17 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 May 2025 10:01:17 +0200
X-UD-Smtp-Session: l3s3148p1@2ODe4rQ1fosgAwDPXwj7ADHm2wGe7qss
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v4] ARM: dts: renesas: r9a06g032-rzn1d400-db: describe debug LEDs
Date: Thu, 22 May 2025 09:58:29 +0200
Message-ID: <20250522080112.26050-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the debug LEDs connected via the I2C GPIO extender.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Changes since v3:
- decided on LED_FUNCTION_DEBUG after discussion with LED maintainers
- dropped "keep" default since it did not work reliably with the GPIO
  extender and no bandwidth to debug it
- rebased to linux-next

 .../dts/renesas/r9a06g032-rzn1d400-db.dts     | 60 +++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
index 2de047393652..d734a432b3ec 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
+++ b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
@@ -10,6 +10,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/net/pcs-rzn1-miic.h>
 #include <dt-bindings/pinctrl/rzn1-pinctrl.h>
 
@@ -86,7 +87,66 @@ switch-8 {
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
+			function = LED_FUNCTION_DEBUG;
+			function-enumerator = <0>;
+		};
+
+		led-dbg1 {
+			gpios = <&pca9698 1 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_DEBUG;
+			function-enumerator = <1>;
+		};
+
+		led-dbg2 {
+			gpios = <&pca9698 2 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_DEBUG;
+			function-enumerator = <2>;
+		};
+
+		led-dbg3 {
+			gpios = <&pca9698 3 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_DEBUG;
+			function-enumerator = <3>;
+		};
+
+		led-dbg4 {
+			gpios = <&pca9698 4 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_DEBUG;
+			function-enumerator = <4>;
+		};
+
+		led-dbg5 {
+			gpios = <&pca9698 5 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_DEBUG;
+			function-enumerator = <5>;
+		};
+
+		led-dbg6 {
+			gpios = <&pca9698 6 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_DEBUG;
+			function-enumerator = <6>;
+		};
+
+		led-dbg7 {
+			gpios = <&pca9698 7 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_DEBUG;
+			function-enumerator = <7>;
+		};
 	};
 };
 
-- 
2.47.2


