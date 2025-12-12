Return-Path: <linux-renesas-soc+bounces-25726-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F93CB9C80
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Dec 2025 21:34:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3C4DE3027FFD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 12 Dec 2025 20:33:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A960F2EDD58;
	Fri, 12 Dec 2025 20:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GIsLIGzr"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C41B2D24AC;
	Fri, 12 Dec 2025 20:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765571596; cv=none; b=sYCv8DVeM6nBwC8q4zUY5GcPMfRTqtgbu7H/8jOvpSobPOIcPi2SY9DBZKDNxzXL3NIFHaeoBGYNtALLm7OJbIuDBD5wvaywMjCN0lh8F6JXeG2SyU8CMB67ykaRNv5bB9KexbXKn9zFofd2V4gWiLGLa7UNoUy8VHEtRfZifrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765571596; c=relaxed/simple;
	bh=QBowjkhrZT9dUgwW3OEeOfAAxYk8PKAFF0Wg/jajdWo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QUI1PMBF91vC+6OS/NNPRJmCDUpn+AYvxbPVUDdyh4y1VqaW9XnMwFf1s58my3RdhXPn6MHMpnAEv4u5bIHduXe94T5wrTotnkvCQcZW1OfyQ3T9MJ/chyA6Ms4HVyUu4YVLLc0u2+hHBz0Ymk91o2MIEBFi/JNNe35w8IEQl44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GIsLIGzr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B6FDC116B1;
	Fri, 12 Dec 2025 20:33:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765571596;
	bh=QBowjkhrZT9dUgwW3OEeOfAAxYk8PKAFF0Wg/jajdWo=;
	h=From:To:Cc:Subject:Date:From;
	b=GIsLIGzr6vy2YxvKlDttWnjjUxOyJ1HXsqpyTT/BFbzSfrUw+wrUukuAIxoCNiOC9
	 GiFMQY1MILLU4SjbDrhUO2MHB2ZiquHSUyTpk9C6JSiKyf0opAdMDxPbVHR2PuQaGY
	 lp2ijscFgiSeUfSXLG8Daxkkzhd25L4uM1B2G+c/522jGOBNemHQy+Ksp/+GtIoe7i
	 FwBSQxCnVJf250dy3B4PnBqJh7hd7lxlYezbM1LLPKl718/mH1NvnMM8ep9n+mmXRG
	 pVRZQrG5OhpCnbfwijZrZlNQn2+ICZQkSvyGfhqwvBdicY9OaadK98pawMUqPFqdaG
	 y01Ou1LsNcCNQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ARM: dts: microchip: Drop usb_a9g20-dab-mmx.dtsi
Date: Fri, 12 Dec 2025 14:32:14 -0600
Message-ID: <20251212203226.458694-8-robh@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This .dtsi file is not included anywhere in the tree and can't be
tested.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../boot/dts/microchip/usb_a9g20-dab-mmx.dtsi | 93 -------------------
 1 file changed, 93 deletions(-)
 delete mode 100644 arch/arm/boot/dts/microchip/usb_a9g20-dab-mmx.dtsi

diff --git a/arch/arm/boot/dts/microchip/usb_a9g20-dab-mmx.dtsi b/arch/arm/boot/dts/microchip/usb_a9g20-dab-mmx.dtsi
deleted file mode 100644
index 5b1d80c0ab26..000000000000
--- a/arch/arm/boot/dts/microchip/usb_a9g20-dab-mmx.dtsi
+++ /dev/null
@@ -1,93 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * calao-dab-mmx.dtsi - Device Tree Include file for Calao DAB-MMX Daughter Board
- *
- * Copyright (C) 2011 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
- */
-
-/ {
-	ahb {
-		apb {
-			usart1: serial@fffb4000 {
-				status = "okay";
-			};
-
-			usart3: serial@fffd0000 {
-				status = "okay";
-			};
-		};
-	};
-
-	i2c-gpio@0 {
-		status = "okay";
-	};
-
-	leds {
-		compatible = "gpio-leds";
-
-		user_led1 {
-			label = "user_led1";
-			gpios = <&pioB 20 GPIO_ACTIVE_LOW>;
-		};
-
-/*
-* led already used by mother board but active as high
-*		user_led2 {
-*			label = "user_led2";
-*			gpios = <&pioB 21 GPIO_ACTIVE_LOW>;
-*		};
-*/
-		user_led3 {
-			label = "user_led3";
-			gpios = <&pioB 22 GPIO_ACTIVE_LOW>;
-		};
-
-		user_led4 {
-			label = "user_led4";
-			gpios = <&pioB 23 GPIO_ACTIVE_LOW>;
-		};
-
-		red {
-			label = "red";
-			gpios = <&pioB 24 GPIO_ACTIVE_LOW>;
-		};
-
-		orange {
-			label = "orange";
-			gpios = <&pioB 30 GPIO_ACTIVE_LOW>;
-		};
-
-		green {
-			label = "green";
-			gpios = <&pioB 31 GPIO_ACTIVE_LOW>;
-		};
-	};
-
-	gpio_keys {
-		compatible = "gpio-keys";
-
-		button-user-pb1 {
-			label = "user_pb1";
-			gpios = <&pioB 25 GPIO_ACTIVE_LOW>;
-			linux,code = <0x100>;
-		};
-
-		button-user-pb2 {
-			label = "user_pb2";
-			gpios = <&pioB 13 GPIO_ACTIVE_LOW>;
-			linux,code = <0x101>;
-		};
-
-		button-user-pb3 {
-			label = "user_pb3";
-			gpios = <&pioA 26 GPIO_ACTIVE_LOW>;
-			linux,code = <0x102>;
-		};
-
-		button-user-pb4 {
-			label = "user_pb4";
-			gpios = <&pioC 9 GPIO_ACTIVE_LOW>;
-			linux,code = <0x103>;
-		};
-	};
-};
-- 
2.51.0


