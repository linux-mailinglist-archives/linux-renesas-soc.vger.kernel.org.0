Return-Path: <linux-renesas-soc+bounces-18089-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A4706AD5033
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Jun 2025 11:40:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D98A172215
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 11 Jun 2025 09:40:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60E9325E80A;
	Wed, 11 Jun 2025 09:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="exkK4yIi"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F1B258CEF
	for <linux-renesas-soc@vger.kernel.org>; Wed, 11 Jun 2025 09:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749634809; cv=none; b=BX9QZh1Z4zZmyuei4ehB3C5wePU5AYJVO4s9rbTNJcELXpTG96Le1iIqArdB1v8GxH0/vJRgkJQXmuAVITFgAza/NC8nk2YLiX0LAmcvFONFESpcNa78I2HIkse2zpFXTGw9zjg9vTCnocXyyY6zdUbll8BgHPWnlk4mjR2hLis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749634809; c=relaxed/simple;
	bh=1ariPDdAF0qt5/fcBAjFaLJrSa62Ai9e3cfkcdrzMRg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EZadv1gWx8dwmhjhWw9TY0aEVlvk9QQEf3Mt+tqn/o9pHCpjiklGc9kfuJEwRiq4qkBdGEQM+Rjo/jdYHAmagXVE24TgZ3o+AO2n70jZ8CE1ydFOcn4CkEJIQEvKyW9o2HL9n2qi0RQr9DOPx9nqOI1RT/uCHT6V8LwzrRMs830=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=exkK4yIi; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=xabZjMptbgVpuIdQcIbvSq4bTxC5UfzZllfb5CCab0g=; b=exkK4y
	IimD4REgDp/S4/rBujARlqepDZbruSPN8unp3mEsL2FtAd1MR8tsNOLxtRrfqmxT
	bS2jm4rA1nrLqX897EZz8pklNMFcYH8A/RMlscUGws8qOpmBDLhCX4qMIyDm3GN6
	NAOBt6ujR9DxrSr5PPdNutkQ9UIK9I6SSfbSjhOukN+9awIVAjNvipR7okCC6hI9
	ePT3ab6PJ/+dx4AUpGBdRwfJSZdraM6k5ROB8iZIrQelx5LyM1PimPZkjvhdIBLt
	sv+wh/DzOpKeHl5odO+VSds9wudS7UGeYDIEnee+2csflR+haaAQcU/Whph8vt3M
	thvwynMNQxQtSNng==
Received: (qmail 3186504 invoked from network); 11 Jun 2025 11:39:56 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Jun 2025 11:39:56 +0200
X-UD-Smtp-Session: l3s3148p1@Lop9mEg3CLEgAwDPXy2/ACpZfVCNKldR
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH RFC 7/7] WIP: arm64: dts: renesas: rzg3s-smarc-som: Enable I3C
Date: Wed, 11 Jun 2025 11:39:31 +0200
Message-ID: <20250611093934.4208-8-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250611093934.4208-1-wsa+renesas@sang-engineering.com>
References: <20250611093934.4208-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is really only for testing. Not for upstream!

Not-signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 .../boot/dts/renesas/rzg3s-smarc-som.dtsi     | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
index 39845faec894..f3f391c609d3 100644
--- a/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/clock/renesas,r9a08g045-vbattb.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/i3c/i3c.h>
 #include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
 
 #include "rzg3s-smarc-switches.h"
@@ -172,6 +173,38 @@ a0 80 30 30 9c
 	};
 };
 
+#undef I3C_BUS_PURE
+#ifdef I3C_BUS_PURE
+&i3c {
+	i2c-scl-hz = <1000000>;
+	i3c-scl-hz = <2000000>;		/* slow Logic Analyzer here */
+	//i3c-scl-hz = <12500000>;
+	status = "okay";
+};
+#else
+&i3c {
+	i2c-scl-hz = <400000>;		/* Max speed of the ADT7411 below */
+	/*
+	 * 10MHz works somewhat with my 24MHz logic analyzer as well as
+	 * signal width < 50ns for the legacy I2C filters
+	 */
+	i3c-scl-hz = <10000000>;
+	status = "okay";
+
+	/* I2C bus from SMARC via PMOD6A. EEPROM driver only used to verify register content */
+	eeprom@1a {
+		compatible = "atmel,24c02";
+		reg = <0x1a 0 (I2C_FM | I2C_FILTER)>;
+	};
+
+	/* externel development board */
+	temp@4a {
+		compatible = "adi,adt7411";
+		reg = <0x4a 0 (I2C_FM | I2C_FILTER)>;
+	};
+};
+#endif
+
 #if SW_CONFIG2 == SW_ON
 /* SD0 slot */
 &sdhi0 {
-- 
2.47.2


