Return-Path: <linux-renesas-soc+bounces-9010-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 456C097DCFD
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 21 Sep 2024 13:48:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E930A1F219C3
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 21 Sep 2024 11:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3273616F271;
	Sat, 21 Sep 2024 11:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Lb5dc/6v"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FBD6170853
	for <linux-renesas-soc@vger.kernel.org>; Sat, 21 Sep 2024 11:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726919326; cv=none; b=AyIVrg9gf/kLaQ13/hLbs17vM1BGV7QW/hWmSTFnaJBk5ySEuKyXKLMjHQNnQafM5aKUGFZF7ZYbiCfs+lBwmrantdiVFYU9XijLtSpoUenehzARrzmLG8VfgmFfTLOF8eDQZjN3pzvi3r6UY2F2DjkItFTPN8d7OqRpvo+C50Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726919326; c=relaxed/simple;
	bh=Vu/5GE4Brj4CfpKlI6QsQiYdSFN5EtcGHdXjtjg2Kug=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tru5JO2pKxXYDPNRLnlPbcvimkcP8+jbh0nvoInK65mTxyDhmvmH1Gspc12FPmCNfmCGQrcv+jGsNqCPGQ6ne5bW2qz50lOSY7JzbN9oBSsmHA4EKL3V+fUqphmq24krLR95D6P5+nuXUqspiMhdIef52ivBQ98TAqZ5vLom6vU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Lb5dc/6v; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=9ZjfP55eBftOhnPw04cN7ojR+u7Qj4BNNprr6JwFjF0=; b=Lb5dc/
	6vRlKAgga9OEdrq4TSul44nE4YOIGZeRrLZSzJUFd1y85zj/zRcPXKPWko3T6AgU
	LDWH7g9zmxJ44w1SsXHjBEmzfpvvZS8tzAjYkO+d44S7O2FO4fZ27TifPO+YBb3i
	d+QZ1JhkC6WKm+63Rjl+FSlRM8kf8txR8r7wQD5JFzJY+haeM+Jop8+dEarsKrFy
	bECBuHq2/R86hnegc127dafW+yflF7i95JuqvTdaWfAZr42XkIb/ogBtmSjtBXWF
	YbL871zkpeQxCexNXN5VxqVUua5v07awyqPsU742RJCrPrZV5kckJbQpI00H438y
	tlERX5C52s5AH6Fg==
Received: (qmail 3652867 invoked from network); 21 Sep 2024 13:48:40 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Sep 2024 13:48:40 +0200
X-UD-Smtp-Session: l3s3148p1@uaOmvJ8iUsYgAwDwn0Nz2qARpwvTE8dN
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH 5/5] ARM: dts: renesas: genmai: define keyboard switch
Date: Sat, 21 Sep 2024 13:48:17 +0200
Message-ID: <20240921114813.4124-12-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240921114813.4124-7-wsa+renesas@sang-engineering.com>
References: <20240921114813.4124-7-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/renesas/r7s72100-genmai.dts | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r7s72100-genmai.dts b/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
index 4f920afe0d62..0ad3989859c4 100644
--- a/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
+++ b/arch/arm/boot/dts/renesas/r7s72100-genmai.dts
@@ -9,6 +9,7 @@
 /dts-v1/;
 #include "r7s72100.dtsi"
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
 #include <dt-bindings/pinctrl/r7s72100-pinctrl.h>
 
 / {
@@ -58,6 +59,22 @@ partition@4000000 {
 		};
 	};
 
+	keyboard {
+		compatible = "gpio-keys";
+		interrupt-parent = <&irqc>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&keyboard_pins>;
+
+		key-1 {
+			/* JP3 must be set to 1-2 (default) */
+			interrupts = <6 IRQ_TYPE_EDGE_BOTH>;
+			linux,code = <KEY_1>;
+			label = "SW6,SW7";
+			wakeup-source;
+		};
+	};
+
 	leds {
 		status = "okay";
 		compatible = "gpio-leds";
@@ -201,6 +218,11 @@ i2c2_pins: i2c2 {
 		pinmux = <RZA1_PINMUX(1, 4, 1)>, <RZA1_PINMUX(1, 5, 1)>;
 	};
 
+	keyboard_pins: keyboard {
+		/* P3_1 as IRQ6 */
+		pinmux = <RZA1_PINMUX(3, 1, 3)>;
+	};
+
 	scif2_pins: serial2 {
 		/* P3_0 as TxD2; P3_2 as RxD2 */
 		pinmux = <RZA1_PINMUX(3, 0, 6)>, <RZA1_PINMUX(3, 2, 4)>;
-- 
2.45.2


