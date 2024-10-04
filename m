Return-Path: <linux-renesas-soc+bounces-9406-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0B4990424
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 15:27:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BD0AAB2366B
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Oct 2024 13:27:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC0D021F417;
	Fri,  4 Oct 2024 13:22:47 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [195.130.132.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20E8215F59
	for <linux-renesas-soc@vger.kernel.org>; Fri,  4 Oct 2024 13:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728048167; cv=none; b=DSLE4b5bzs+rAesBxGVX0BamNllsPk9Mf/dJyiETVCH6s66b83/ST6ftNYX4yC0+Ssl97viUi3+Z4Xj1IppVImwAoPTTxEiFRUaeAWYEFEd4T6pfPEFukdeILp7O2MHkgy3E4QO/wyOPO41xVUZ25cstpWj19b5MryZ+nudVZFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728048167; c=relaxed/simple;
	bh=SmfQwYrr/4yQyUEMmjIXMkUpcZ+9PA2WLE9oN0f/0Qo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oM3UIApSfJG2KlMHge97ESTJz5VxZfm8lqVs1a9ND/SsKE3WDNOFMDxkhtFn26t3gAKbDWrj6vPnYMpj2SNnnoJo1b8+q4B0KWgQUHimU8EKCutQWTGH4qzL32XQwSI8SAzVTHnCOmcLSjTJj1jLypU1de8B0vbTbU8oQ2kkQ7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:5518:aeb:d9c0:fc7c])
	by xavier.telenet-ops.be with cmsmtp
	id LDNd2D00D4NXpdT01DNdHF; Fri, 04 Oct 2024 15:22:37 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1swiGL-001Em1-0j;
	Fri, 04 Oct 2024 15:22:37 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1swhnu-006yU1-B2;
	Fri, 04 Oct 2024 14:53:06 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 05/20] ARM: dts: renesas: Use interrupts-extended for touchpanels
Date: Fri,  4 Oct 2024 14:52:47 +0200
Message-Id: <d081d986e3a2b695bc27dbe00aa0fb244a22ffdf.1728045620.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1728045620.git.geert+renesas@glider.be>
References: <cover.1728045620.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the more concise interrupts-extended property to fully describe the
interrupts.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm/boot/dts/renesas/iwg20d-q7-common.dtsi       | 3 +--
 arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts | 3 +--
 arch/arm/boot/dts/renesas/r8a7742-iwg21d-q7.dts       | 3 +--
 arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts            | 3 +--
 4 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/renesas/iwg20d-q7-common.dtsi b/arch/arm/boot/dts/renesas/iwg20d-q7-common.dtsi
index 4351c5a02fa596de..2cc2908b48ca1b9f 100644
--- a/arch/arm/boot/dts/renesas/iwg20d-q7-common.dtsi
+++ b/arch/arm/boot/dts/renesas/iwg20d-q7-common.dtsi
@@ -219,8 +219,7 @@ sgtl5000: codec@a {
 	touch: touchpanel@38 {
 		compatible = "edt,edt-ft5406";
 		reg = <0x38>;
-		interrupt-parent = <&gpio2>;
-		interrupts = <12 IRQ_TYPE_EDGE_FALLING>;
+		interrupts-extended = <&gpio2 12 IRQ_TYPE_EDGE_FALLING>;
 		vcc-supply = <&vcc_3v3_tft1>;
 	};
 };
diff --git a/arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts b/arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts
index 9ec0f098bf6eb5d7..3d32cf068abc20f1 100644
--- a/arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts
+++ b/arch/arm/boot/dts/renesas/r8a7740-armadillo800eva.dts
@@ -238,8 +238,7 @@ eeprom@50 {
 	touchscreen@55 {
 		compatible = "sitronix,st1232";
 		reg = <0x55>;
-		interrupt-parent = <&irqpin1>;
-		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
+		interrupts-extended = <&irqpin1 2 IRQ_TYPE_LEVEL_LOW>;
 		pinctrl-0 = <&st1232_pins>;
 		pinctrl-names = "default";
 		gpios = <&pfc 166 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm/boot/dts/renesas/r8a7742-iwg21d-q7.dts b/arch/arm/boot/dts/renesas/r8a7742-iwg21d-q7.dts
index 64102b664055b475..6a8a0d2113b020c7 100644
--- a/arch/arm/boot/dts/renesas/r8a7742-iwg21d-q7.dts
+++ b/arch/arm/boot/dts/renesas/r8a7742-iwg21d-q7.dts
@@ -202,8 +202,7 @@ sgtl5000: codec@a {
 	touch: touchpanel@38 {
 		compatible = "edt,edt-ft5406";
 		reg = <0x38>;
-		interrupt-parent = <&gpio0>;
-		interrupts = <24 IRQ_TYPE_EDGE_FALLING>;
+		interrupts-extended = <&gpio0 24 IRQ_TYPE_EDGE_FALLING>;
 		/* GP1_29 is also shared with audio codec reset pin */
 		reset-gpios = <&gpio1 29 GPIO_ACTIVE_LOW>;
 		vcc-supply = <&vcc_3v3_tft1>;
diff --git a/arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts b/arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts
index 15d89c20618a16b7..fe96ea07628779c6 100644
--- a/arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts
+++ b/arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts
@@ -296,8 +296,7 @@ &i2c1 {
 	touchscreen@55 {
 		compatible = "sitronix,st1232";
 		reg = <0x55>;
-		interrupt-parent = <&irqpin1>;
-		interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
+		interrupts-extended = <&irqpin1 0 IRQ_TYPE_EDGE_FALLING>;
 	};
 };
 
-- 
2.34.1


