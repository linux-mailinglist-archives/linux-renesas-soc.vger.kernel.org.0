Return-Path: <linux-renesas-soc+bounces-16108-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9823EA916E7
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Apr 2025 10:52:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 129365A0DC1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 17 Apr 2025 08:52:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6A2721B9E5;
	Thu, 17 Apr 2025 08:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="JgLTKEL5"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFAF2045B7
	for <linux-renesas-soc@vger.kernel.org>; Thu, 17 Apr 2025 08:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744879961; cv=none; b=ToqZHjMpgLpHp0O7bXG2kGhtrWCsqJc8bApyCHJNjP1vCqAmZuyl6q5zF05QkUdd+IaCAHre0JTp84guKmj4IXItbt9TP20fqihQjuQkkidqzh2gm5TyoKJUCUuOZSJzV4WxH0D70t/D5i7QNL9Me6/aZAdZfHaUdmZpUAaq1yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744879961; c=relaxed/simple;
	bh=v9fZOhIoX4xTfH+fea5t1RWz2fVlvhOEmzzL8Rmsh2g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CnyMKFCYXQnAoCxEUjO1gqi/U+P4wifdiAguedYu8Hxj5AmO+cS4F/bEKSo4XL4D//S5Fxc1G+agtjM0c9jfxRbhibvACGujHS9yeBfYY3ELAl4GiyGtTOu6eHROd0VIqGz4p+yQW95UVx1XzM9EXrKZAuegvfJvHNFE3PCWwOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=JgLTKEL5; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=G2nQwg2hTp2Hs3
	aSgMTuO9Oc7XdAaHkDK1l5FK/8+Og=; b=JgLTKEL5sMhHqmxWeYLUJnDgdSgAn1
	ytPWHgZQWu09abxUMd3YWj5P7UL1zZT5aehOxf2HfYAVEiDhqRZEDebNRLdMypbo
	KaAMslGLkprjzKq6SOfJ+ABW39UAZwlZV7x1bmBD8nkxdH4RIGOzwJFzY94dig1X
	kyya72JpTxeYIW1SoJeCTpz0m8u4lh1Kf3P/Ki96vSAQ2KWx6i2YaRaPApalSJtG
	F8xJj1AUtyro+2AYwuSz82Fw8rShMCCemm9qpXQU0Q2ATlG9d4AwZm/J0knv8KZo
	Lyz4WsXzRjkMKCaa7rcAT7gksq+9xaOkM+ZHf08mmlD7Py7/Lc5z4qBg==
Received: (qmail 1026314 invoked from network); 17 Apr 2025 10:52:37 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Apr 2025 10:52:37 +0200
X-UD-Smtp-Session: l3s3148p1@TesJhvUyAOUgAwDPXyfYALbiJ46yNPq3
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v2] ARM: dts: renesas: r9a06g032-rzn1d400-db: describe Debug LEDs
Date: Thu, 17 Apr 2025 10:49:49 +0200
Message-ID: <20250417085228.34679-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Because these LEDs are not connected to a device and have only a single
color, we don't need to specify 'color' and 'function' to distinguish
them. Even worse, that would lead to namespace collisions:

leds-gpio leds: Led green:programming renamed to green:programming_1 due to name collision
leds-gpio leds: Led green:programming renamed to green:programming_2 due to name collision
leds-gpio leds: Led green:programming renamed to green:programming_3 due to name collision
leds-gpio leds: Led green:programming renamed to green:programming_4 due to name collision
leds-gpio leds: Led green:programming renamed to green:programming_5 due to name collision
leds-gpio leds: Led green:programming renamed to green:programming_6 due to name collision
leds-gpio leds: Led green:programming renamed to green:programming_7 due to name collision

So, just let their node name (taken from the schematics) be used as a
name.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
Changes since v1:
	* renamed nodes to match schematics
	* added default-state
	* updated commit message why not more LED properties are used

 .../dts/renesas/r9a06g032-rzn1d400-db.dts     | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
index fef40e288679..d248ebd4bf16 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
+++ b/arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts
@@ -86,7 +86,50 @@ switch-8 {
 			debounce-interval = <20>;
 			gpios = <&pca9698 15 GPIO_ACTIVE_LOW>;
 		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
 
+		led-dbg0 {
+			gpios = <&pca9698 0 GPIO_ACTIVE_HIGH>;
+			default-state = "keep";
+		};
+
+		led-dbg1 {
+			gpios = <&pca9698 1 GPIO_ACTIVE_HIGH>;
+			default-state = "keep";
+		};
+
+		led-dbg2 {
+			gpios = <&pca9698 2 GPIO_ACTIVE_HIGH>;
+			default-state = "keep";
+		};
+
+		led-dbg3 {
+			gpios = <&pca9698 3 GPIO_ACTIVE_HIGH>;
+			default-state = "keep";
+		};
+
+		led-dbg4 {
+			gpios = <&pca9698 4 GPIO_ACTIVE_HIGH>;
+			default-state = "keep";
+		};
+
+		led-dbg5 {
+			gpios = <&pca9698 5 GPIO_ACTIVE_HIGH>;
+			default-state = "keep";
+		};
+
+		led-dbg6 {
+			gpios = <&pca9698 6 GPIO_ACTIVE_HIGH>;
+			default-state = "keep";
+		};
+
+		led-dbg7 {
+			gpios = <&pca9698 7 GPIO_ACTIVE_HIGH>;
+			default-state = "keep";
+		};
 	};
 };
 
-- 
2.47.2


