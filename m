Return-Path: <linux-renesas-soc+bounces-20785-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 73065B2E62B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 22:09:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 801C53B968B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Aug 2025 20:07:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 693F428688A;
	Wed, 20 Aug 2025 20:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DFfN+l+B"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911EF27F4D4;
	Wed, 20 Aug 2025 20:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755720429; cv=none; b=ciYBKru5yFrrY3Ig3alKvMpX50hHondtBBF8EXOIRV98os2ULqa1BoISz2nskAVH/RC04anwlUvOHAAAtrx5fLA9O6ZCLXOShvCa5gvjVwbGJT1TD3kCH9Yf2fLfeaWeTm/PkfqlEFdMy13Zqb/wIZPBFdsEm51djLefGaMXfq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755720429; c=relaxed/simple;
	bh=OnXpjc4tvbhbEQPPoLzLiZ44IMQmvemcYvYYAWB+pHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gQERqM5UCpWB2+LYx0h+RgXt4/BS9dKIKokU3ItrL0RQ4Ef6XNCMxZSsoj5D2FHgjqQ06FUPQsBXSiYax6XwPO1gWgHW3Bn6q8inuG6PCvUINvM5xhj1IG6r0cxx9NDX8/oRdTxnyzNeklrBOUmb3J0pjM8p1cDPOl6ko0jxYDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DFfN+l+B; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45a1b0c8867so1990975e9.3;
        Wed, 20 Aug 2025 13:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755720426; x=1756325226; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gMrWYp68gwTjqhS1kz+JksNGCxdEV4THsuJ3Y6qPahc=;
        b=DFfN+l+BfZw8n3lSSyKlGTRbj05t8KS5YMgI0wqWNLaMSIZ/WYMBu5y4ceMbEDml5C
         mfEoWrV9uuqyJWW4tOeCpxlyM31jLgedBA7yZdSHWypXwkvIihjRc1j/7bJT50I7ss5E
         3pg3WMn9YQbBt3SNmc7cE/pdU2Jiya5T85s+QYrXh6dU8cxT70EZG24iAhkNcfuol8qH
         UNSDKlJhogXIR1KzM3SnJ83rERAXdLZ5S+glPJ5h8BXauSS1MzPpAxgf6znJhMAkTkb+
         W53W9OjoMaxH7b5xmcWw1BfnGlaS4YYR5ZZRKfTdt3CG0ocbp+RN0kFtGRpfLt25MLX5
         rhIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755720426; x=1756325226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gMrWYp68gwTjqhS1kz+JksNGCxdEV4THsuJ3Y6qPahc=;
        b=LYZ2T9Pb4/jjsWYFpXIP1e8hAcRPBzqJiHv4SbyGwB+L5FTaQ27980a/o9CQ8oj+W9
         CzHMARmpNKddt56SYQBrywWv6rdezCrLELGrB3ellHM+B4NwQ1XSFeaqPsFzIJBpFOq6
         Bp7rnZ5HbS/V3THBQTYXTcbDLIRpwt4dquOyw6oEb19IwTw7BUw9p5uj9BlHQnFjEAuS
         g1pqKKK6zVGhrdZRArMRGuMeGlweZGjpl/xdm/9kpU80WAJnhlsGVK3uujXnmvNA18/W
         n2oWG9bfcyRxC6CLSfnYptUbzlYVgvhTEowaABEuJL5NpUQcEjY4rLdIPs7KGWtgq8dr
         pcCg==
X-Forwarded-Encrypted: i=1; AJvYcCUYadiJM/+ecQ+yvqEyuuFUvhFdcYHRF/5wgNFD+etegG9ig8nDjaYQvyXupnE8Gl6ey6QtNo+EqtlMKGXG@vger.kernel.org, AJvYcCX+WNpmW69fQJVxacjEKDLG/JiA+pnDOZeLl4t9XJ/aLYnLD6/EDajntmj1IrMusri+6nYh8S22NRbb@vger.kernel.org
X-Gm-Message-State: AOJu0YyMcpsaBvWcYY2wLCf6v8lb3z3fTTPm/ynbKk6jLGVJkiAoJcl8
	JoCjMN3mhWjy9FgiRrOxC6xwviHDfd/JNZ3Md83AS16vAxMbiMSkPTZP6b1rVkyn
X-Gm-Gg: ASbGnctXweC0QKEqPo2slF0sBpOyQWc1NH+K1NafhNDrIbtpnekeEkejRk37by2qMhk
	lLA5SQ8geTuqfuXaPkqEa6tWDkt8zIbmdkHrkVeta7m8HwhRESVt8tkbNuWYyMB6D5mPiRJSTvI
	SQpqdp6/LcgWZjonXy8aOBIuKvbx8TwWdBKJ8FlU5WpcQj4HjT2zZ2wMoWJX3DUPOcWVYCLAu/R
	EbetdDh90axn8kaeH8eXfLMCz9TXhMz7Ek3w3uXJfdCieSawFhU0UuOzNO0jTah+NBsGB6kfZsc
	ZjQFSPVYyC9B7IadjY9qkIDLZgzdmhnaDk7nDbDcymL3uWwKHw/gWN2Z7w3yHFiguy5fVoxgr46
	AIfxO2uZGO9zTG6l1EJ9jXS3Iikgi3dHpGMUNOaoqp3h7E9rOmG3/PYVn
X-Google-Smtp-Source: AGHT+IFvTuJJbMolQx7Fgk5wE90sp6uNmA3tgn/39vw75UCt38FDlxtOuiqnefs6nboxYxM7xlJy8A==
X-Received: by 2002:a05:600c:1c19:b0:458:c059:7d9c with SMTP id 5b1f17b1804b1-45b4bf0597bmr10294265e9.6.1755720425761;
        Wed, 20 Aug 2025 13:07:05 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:9b1:f84b:89f6:b00e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c077789c92sm8810302f8f.52.2025.08.20.13.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 13:07:05 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 2/9] arm64: dts: renesas: r9a09g077m44-rzt2h-evk: Add user LEDs
Date: Wed, 20 Aug 2025 21:06:52 +0100
Message-ID: <20250820200659.2048755-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250820200659.2048755-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250820200659.2048755-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add USER LED0-LED8, which are available on RZ/T2H EVK.

In addition, the header file inclusion has been moved into the common
rzt2h-n2h-evk-common.dtsi so that both RZ/T2H and RZ/N2H EVK DTS/I files
share the same set of bindings. This avoids duplication and keeps the
board files consistent.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Changed led node names
- Added color/function/function-enumerator properties
- Replaced GPIO_ACTIVE_LOW with GPIO_ACTIVE_HIGH
- Moved header file inclusions to common dtsi
---
 .../dts/renesas/r9a09g077m44-rzt2h-evk.dts    | 77 ++++++++++++++++++-
 .../dts/renesas/rzt2h-n2h-evk-common.dtsi     |  4 +
 2 files changed, 79 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
index 51ea295b3241..a7b91c96f311 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
@@ -7,14 +7,87 @@
 
 /dts-v1/;
 
-#include <dt-bindings/pinctrl/renesas,r9a09g077-pinctrl.h>
-
 #include "r9a09g077m44.dtsi"
 #include "rzt2h-n2h-evk-common.dtsi"
 
 / {
 	model = "Renesas RZ/T2H EVK Board based on r9a09g077m44";
 	compatible = "renesas,rzt2h-evk", "renesas,r9a09g077m44", "renesas,r9a09g077";
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			/* SW8-9: ON, SW8-10: OFF */
+			gpios = <&pinctrl RZT2H_GPIO(23, 1) GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_DEBUG;
+			function-enumerator = <0>;
+		};
+
+		led-1 {
+			/* SW5-1: OFF, SW5-2: ON */
+			gpios = <&pinctrl RZT2H_GPIO(32, 2) GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_DEBUG;
+			function-enumerator = <1>;
+		};
+
+		led-2 {
+			gpios = <&pinctrl RZT2H_GPIO(6, 7) GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_YELLOW>;
+			function = LED_FUNCTION_DEBUG;
+			function-enumerator = <2>;
+		};
+
+		led-3 {
+			/* SW2-3: OFF */
+			gpios = <&pinctrl RZT2H_GPIO(8, 5) GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_RED>;
+			function = LED_FUNCTION_DEBUG;
+			function-enumerator = <3>;
+		};
+
+		led-4 {
+			/* SW8-3: ON, SW8-4: OFF */
+			gpios = <&pinctrl RZT2H_GPIO(18, 0) GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_DEBUG;
+			function-enumerator = <4>;
+		};
+
+		led-5 {
+			/* SW8-1: ON, SW8-2: OFF */
+			gpios = <&pinctrl RZT2H_GPIO(18, 1) GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_RED>;
+			function = LED_FUNCTION_DEBUG;
+			function-enumerator = <5>;
+		};
+
+		led-6 {
+			/* SW5-9: OFF, SW5-10: ON */
+			gpios = <&pinctrl RZT2H_GPIO(22, 7) GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_DEBUG;
+			function-enumerator = <6>;
+		};
+
+		led-7 {
+			/* SW5-7: OFF, SW5-8: ON */
+			gpios = <&pinctrl RZT2H_GPIO(23, 0) GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_DEBUG;
+			function-enumerator = <7>;
+		};
+
+		led-8 {
+			/* SW7-5: OFF, SW7-6: ON */
+			gpios = <&pinctrl RZT2H_GPIO(23, 5) GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_DEBUG;
+			function-enumerator = <8>;
+		};
+	};
 };
 
 &i2c0 {
diff --git a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
index 263509cc3dc4..28330ff63b2b 100644
--- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
@@ -5,6 +5,10 @@
  * Copyright (C) 2025 Renesas Electronics Corp.
  */
 
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/pinctrl/renesas,r9a09g077-pinctrl.h>
+
 / {
 	aliases {
 		i2c0 = &i2c0;
-- 
2.51.0


