Return-Path: <linux-renesas-soc+bounces-26718-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AC474D1DAA9
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jan 2026 10:44:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 776B3301868C
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Jan 2026 09:41:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0CA138A2A5;
	Wed, 14 Jan 2026 09:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="dL9Srvus"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD3D38B7B0
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Jan 2026 09:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768383667; cv=none; b=QoEcN5NgPsZMTBBwKHFPx4DeGa7zOVmwZ5hATOZGB+6oxOsi7VJICnpGCt5TstiDvdnYE9C5jB2b+Jwt2BwRt86vUJCEUb+CR5P9b0+uCoa8A37sdDnFefa8nkbZrBqnB3Di+4DiyR1pZ3ClpDyT5UA3c94drVcIr/MXPBHXbXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768383667; c=relaxed/simple;
	bh=F1xTHCI1Ed7nYG/rtTMfvA6CqjcOQAgGmvhyIuFP8qM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oLPQqaF4OzSdhU0NmdBJQ+VcJjDb0HCqtIZ6JppqyMYIWCH7cA69slCt/fm8aDaTHtY5+q3LPJzkoQ5xAnO+rkuBX/MFrW0810juOnEhqqouL1+k70imbAlNBhdv98yy3DJpHjB8IodYqUnqUqZmg46Aq5qtbrW+B4UT5ug2Vnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=dL9Srvus; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id AA51A4E420E9;
	Wed, 14 Jan 2026 09:41:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7E3736074A;
	Wed, 14 Jan 2026 09:41:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 05EF7103C89BA;
	Wed, 14 Jan 2026 10:40:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768383660; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=2VCn7I4gCTMmmQjjA78kjMlv2YeMBURM51/gLVjOYg4=;
	b=dL9SrvusuP1j1RF/8KYISJpoNxBUgLzS3o5IRBY9AFFXsu3DkHQVbAJ6faBxfEAXKGO//w
	l34PCEDHF4qyluUvyJhgsD2oYnuyixj4gVxCg/Lmjoax5nTqf74XPEYLIUfV/zl9Mz1fbp
	76C4IGqBK9N8vMNlWwXpAlVBCQIcAtveU0Rm97l+7mt5wVU+h4rI5iF0UIwlhAcQRQsJ7Q
	5XmZRZAaQxxBQuL919DJS09BIeBgsqUhEhrqhQDCLZgcjyegr0664ymnW2+zK+3TR0UIbW
	nIimBTIbQC7uzB5x/RJ2rWg2SI2jgq22bn0UTO7LuYFzBtlgk5zOC3mzR6/blQ==
From: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Saravana Kannan <saravanak@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v8 8/8] ARM: dts: r9a06g032: Add support for GPIO interrupts
Date: Wed, 14 Jan 2026 10:39:37 +0100
Message-ID: <20260114093938.1089936-9-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114093938.1089936-1-herve.codina@bootlin.com>
References: <20260114093938.1089936-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

In the RZ/N1 SoC, the GPIO interrupts are multiplexed using the GPIO
Interrupt Multiplexer.

Add the multiplexer node and connect GPIO interrupt lines to the
multiplexer.

The interrupt-map available in the multiplexer node has to be updated in
dts files depending on the GPIO usage. Indeed, the usage of an interrupt
for a GPIO is board dependent.

Up to 8 GPIOs can be used as an interrupt line (one per multiplexer
output interrupt).

Signed-off-by: Herve Codina (Schneider Electric) <herve.codina@bootlin.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/renesas/r9a06g032.dtsi | 41 ++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm/boot/dts/renesas/r9a06g032.dtsi b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
index 06d35a83f6e1..b8e03c529007 100644
--- a/arch/arm/boot/dts/renesas/r9a06g032.dtsi
+++ b/arch/arm/boot/dts/renesas/r9a06g032.dtsi
@@ -543,6 +543,14 @@ gpio0a: gpio-port@0 {
 				gpio-controller;
 				#gpio-cells = <2>;
 				snps,nr-gpios = <32>;
+
+				interrupt-controller;
+				interrupt-parent = <&gpioirqmux>;
+				interrupts = <0  1  2  3  4  5  6  7
+					      8  9 10 11 12 13 14 15
+					     16 17 18 19 20 21 22 23
+					     24 25 26 27 28 29 30 31>;
+				#interrupt-cells = <2>;
 			};
 
 			/* GPIO0b[0..1]   connected to pins GPIO1..2   */
@@ -584,6 +592,14 @@ gpio1a: gpio-port@0 {
 				gpio-controller;
 				#gpio-cells = <2>;
 				snps,nr-gpios = <32>;
+
+				interrupt-controller;
+				interrupt-parent = <&gpioirqmux>;
+				interrupts = <32 33 34 35 36 37 38 39
+					      40 41 42 43 44 45 46 47
+					      48 49 50 51 52 53 54 55
+					      56 57 58 59 60 61 62 63>;
+				#interrupt-cells = <2>;
 			};
 
 			/* GPIO1b[0..1]   connected to pins GPIO55..56 */
@@ -615,6 +631,14 @@ gpio2a: gpio-port@0 {
 				gpio-controller;
 				#gpio-cells = <2>;
 				snps,nr-gpios = <32>;
+
+				interrupt-controller;
+				interrupt-parent = <&gpioirqmux>;
+				interrupts = <64 65 66 67 68 69 70 71
+					      72 73 74 75 76 77 78 79
+					      80 81 82 83 84 85 86 87
+					      88 89 90 91 92 93 94 95>;
+				#interrupt-cells = <2>;
 			};
 
 			/* GPIO2b[0..9] connected to pins GPIO160..169 */
@@ -627,6 +651,23 @@ gpio2b: gpio-port@1 {
 			};
 		};
 
+		gpioirqmux: interrupt-controller@51000480 {
+			compatible = "renesas,r9a06g032-gpioirqmux", "renesas,rzn1-gpioirqmux";
+			reg = <0x51000480 0x20>;
+			#interrupt-cells = <1>;
+			#address-cells = <0>;
+			interrupt-map-mask = <0x7f>;
+
+			/*
+			 * Example mapping entry. Board DTs need to overwrite
+			 * 'interrupt-map' with their specific mapping. Check
+			 * the irqmux binding documentation for details.
+			 */
+			interrupt-map = <0 &gic GIC_SPI 103 IRQ_TYPE_LEVEL_HIGH>;
+
+			status = "disabled";
+		};
+
 		can0: can@52104000 {
 			compatible = "renesas,r9a06g032-sja1000", "renesas,rzn1-sja1000";
 			reg = <0x52104000 0x800>;
-- 
2.52.0


