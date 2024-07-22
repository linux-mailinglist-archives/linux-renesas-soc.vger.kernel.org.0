Return-Path: <linux-renesas-soc+bounces-7420-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6838B938E83
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jul 2024 13:55:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 830BF1C20E8E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 22 Jul 2024 11:55:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57B4C16D304;
	Mon, 22 Jul 2024 11:55:54 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from michel.telenet-ops.be (michel.telenet-ops.be [195.130.137.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5B9B16CD3B
	for <linux-renesas-soc@vger.kernel.org>; Mon, 22 Jul 2024 11:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721649354; cv=none; b=mp/M68n1gW5ptot/2ta20coMB02vuwUC0ecom+yN6ckfy5BvLpQz5CA1EUCU/ubl5FKu/BCtkj860Hl1Z0Uhz/l/PfBwShm6mICrs/R+WrmDzDlu4LnVTgA0tWvlBMebCp+D4VOMPw4NvNqxl7JRQbRkw7hQhp251THFkAwxpL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721649354; c=relaxed/simple;
	bh=JRQC81sGpPetOzsVvokfWkDkZvpohfUibThQhJoxfTY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dhuvLO6V/bh6kgjS2cc7hytzWYTXKEJCTzAL2QwM4MK1Lj1XxwQLv1Eew4fAxrQ/h3gpZFnu9hjQRe3BkQ2WMPbLM4ns2uhcMRDauBPPZY4CL8GoNK+Lzmhx7mIJgmdkvi9zA6/qRL6jIBAhYYwyui91OqHEnMEF4vTPo3JVcUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:173b:9414:53f5:de4c])
	by michel.telenet-ops.be with bizsmtp
	id qbvo2C0091wvoRx06bvoCY; Mon, 22 Jul 2024 13:55:49 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sVrdZ-002zCc-HP;
	Mon, 22 Jul 2024 13:55:48 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1sVrds-0020l7-1H;
	Mon, 22 Jul 2024 13:55:48 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] arm64: dts: renesas: gray-hawk-single: Add GP LEDs
Date: Mon, 22 Jul 2024 13:55:41 +0200
Message-Id: <408eac88ec61cf4c56c96397fbb93b4b8c2c8f5b.1721649057.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1721649057.git.geert+renesas@glider.be>
References: <cover.1721649057.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the three General Purpose LEDs on the Gray Hawk Single board,
so they can be used as indicator LEDs.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../dts/renesas/r8a779h0-gray-hawk-single.dts | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
index b4fcf6c0cea26840..b8ed1d0edd5a92b5 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
@@ -10,6 +10,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
 
 #include "r8a779h0.dtsi"
 
@@ -70,6 +71,31 @@ key-3 {
 		};
 	};
 
+	leds {
+		compatible = "gpio-leds";
+
+		led-1 {
+			gpios = <&gpio7 0 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_INDICATOR;
+			function-enumerator = <1>;
+		};
+
+		led-2 {
+			gpios = <&gpio7 1 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_INDICATOR;
+			function-enumerator = <2>;
+		};
+
+		led-3 {
+			gpios = <&gpio7 2 GPIO_ACTIVE_HIGH>;
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_INDICATOR;
+			function-enumerator = <3>;
+		};
+	};
+
 	memory@48000000 {
 		device_type = "memory";
 		/* first 128MB is reserved for secure area. */
-- 
2.34.1


