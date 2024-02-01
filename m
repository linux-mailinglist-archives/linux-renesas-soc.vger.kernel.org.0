Return-Path: <linux-renesas-soc+bounces-2215-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0298459BB
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Feb 2024 15:14:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EC62B1C2115F
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  1 Feb 2024 14:14:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02A2C5337E;
	Thu,  1 Feb 2024 14:14:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from weierstrass.telenet-ops.be (weierstrass.telenet-ops.be [195.130.137.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0F55D479
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Feb 2024 14:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706796895; cv=none; b=USgZ1fmdxTBsG+fHvqyEpyCc2cYfg6leTi7KsLMO5z3kOIkoheNu5B0nMEYublpZSYLti1UnyiQ7bjEE94TS5T6b+3tHxcy4EkWNErPhTCVSGZV17Ilq7akXm52rxUgecsa1gdzcA+I9xClu1mbRE5gf+CQC7RzHmjV9qOo7NzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706796895; c=relaxed/simple;
	bh=BvNNcCgpM4Jiz9mYBVe4AsGxR4ONLvy06FnBHPtpQQQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Bl1OPRlmVHLkEI1DKQS/kD4QxWIvMhOYbYxlEG8mVXzl1ZVjdYs1eww1aNq1wEpiUkjg5xFFkW8CVMDuw1+XZdVGqMouSFoGzWEiculnK6jL3DAqg75xYWOHvfQwJFlunw8KpPfBE3WvbvXlcBuRW4C8HmHNlsya1simo7xWruM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
	by weierstrass.telenet-ops.be (Postfix) with ESMTPS id 4TQgs23kQWz4wyHT
	for <linux-renesas-soc@vger.kernel.org>; Thu,  1 Feb 2024 15:14:46 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:88f0:c83b:bafa:cdc3])
	by baptiste.telenet-ops.be with bizsmtp
	id hqEd2B0054efzLr01qEdSR; Thu, 01 Feb 2024 15:14:39 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rVXp2-00Gv46-Ap;
	Thu, 01 Feb 2024 15:14:37 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rVXpt-00AXZP-Aw;
	Thu, 01 Feb 2024 15:14:37 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] arm64: dts: renesas: gray-hawk-single: Add I2C0 and EEPROMs
Date: Thu,  1 Feb 2024 15:14:34 +0100
Message-Id: <960595394a274b675f1ec9ec1c324e4cc1ac1f77.1706796660.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706796660.git.geert+renesas@glider.be>
References: <cover.1706796660.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the I2C0 bus on the Gray Hawk Single board, and describe the I2C
EEPROMs present.

Based on patches for Gray Hawk in the BSP by Hai Pham.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
The Gray Hawk Single documentation does not mention the purpose of the
I2C EEPROMs, but the schematics label the last two as "Board ID".
The labels match the corresponding EEPROMs on the White Hawk CPU and
BreakOut board stack, from which the Gray Hawk Single board is derived.
---
 .../dts/renesas/r8a779h0-gray-hawk-single.dts | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
index 1c84fe7171d3fd85..1bee27b2284d2eee 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
@@ -50,6 +50,42 @@ &hscif0 {
 	status = "okay";
 };
 
+&i2c0 {
+	pinctrl-0 = <&i2c0_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+	clock-frequency = <400000>;
+
+	eeprom@50 {
+		compatible = "rohm,br24g01", "atmel,24c01";
+		label = "cpu-board";
+		reg = <0x50>;
+		pagesize = <8>;
+	};
+
+	eeprom@51 {
+		compatible = "rohm,br24g01", "atmel,24c01";
+		label = "breakout-board";
+		reg = <0x51>;
+		pagesize = <8>;
+	};
+
+	eeprom@52 {
+		compatible = "rohm,br24g01", "atmel,24c01";
+		label = "csi-dsi-sub-board-id";
+		reg = <0x52>;
+		pagesize = <8>;
+	};
+
+	eeprom@53 {
+		compatible = "rohm,br24g01", "atmel,24c01";
+		label = "ethernet-sub-board-id";
+		reg = <0x53>;
+		pagesize = <8>;
+	};
+};
+
 &pfc {
 	pinctrl-0 = <&scif_clk_pins>;
 	pinctrl-names = "default";
@@ -59,6 +95,11 @@ hscif0_pins: hscif0 {
 		function = "hscif0";
 	};
 
+	i2c0_pins: i2c0 {
+		groups = "i2c0";
+		function = "i2c0";
+	};
+
 	scif_clk_pins: scif_clk {
 		groups = "scif_clk";
 		function = "scif_clk";
-- 
2.34.1


