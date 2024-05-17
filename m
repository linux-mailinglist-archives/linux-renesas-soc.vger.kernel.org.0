Return-Path: <linux-renesas-soc+bounces-5390-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4628C88E1
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 May 2024 17:00:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 80247B24C8B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 17 May 2024 15:00:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C63256A347;
	Fri, 17 May 2024 14:57:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [195.130.132.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECC8E6A039
	for <linux-renesas-soc@vger.kernel.org>; Fri, 17 May 2024 14:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715957850; cv=none; b=qxrJvLNQQAc4bnfcVzmeV6/H7WIq22lT3x2WXvoHihOJ7i44g1hGlSOZSVZ7McQGWHvwY5DpwmW3+l6igm/KT0umhBr/IWL41zYUjh05jcDjOvjBPqSBShhBgM0Mqxpb11zJbKExNeDPf9e4o88N1BToz4s6tPUNqYqF+311cKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715957850; c=relaxed/simple;
	bh=ry/+zh6uwEiR0ySTkyMz7QdC4jqfSug6fEkCCJhP1yw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tLvsyz4FRJMvH+icyipC7owlYcmxRBBv795lJ0fl3NOCqB1LLSYxYnfu+R7EdVsVb92NSurmMwJKzCcYo0UsG0wX7E/82Ofe4gSPhrWftnMgV8fefPaCV+M1mVTKr0A9iRUUpGbsF8tIORnTuaa9OI/37QlIPmuyjoRu6V5YBcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:9706:8977:9494:a7c7])
	by andre.telenet-ops.be with bizsmtp
	id QExK2C00R0bc1Xv01ExKm7; Fri, 17 May 2024 16:57:19 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1s7z0U-00BDnI-FT;
	Fri, 17 May 2024 16:57:19 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1s7z1L-00C63T-HE;
	Fri, 17 May 2024 16:57:19 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 4/4] arm64: dts: renesas: gray-hawk-single: Add CAN-FD support
Date: Fri, 17 May 2024 16:57:16 +0200
Message-Id: <2fe3c8e38b566de09e49056c62fa954ed306a497.1715956819.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1715956819.git.geert+renesas@glider.be>
References: <cover.1715956819.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable CAN-FD channels 0 and 1 on the Gray Hawk Single development
board:
  - Channel 0 uses an NXP TJR1443AT CAN transceiver, which must be
    enabled through a GPIO,
  - Channel 1 uses a Microchip MCP2558FD-H/SN CAN transceiver, which
    does not need explicit description.

Inspired by a patch for Gray Hawk in the BSP by Duy Nguyen.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Changes compared to the BSP:
  - Add can_clk,
  - Add missing can_transceiver0,
  - Keep channels 2 and 3 disabled,
  - Preserve sort order.
---
 .../dts/renesas/r8a779h0-gray-hawk-single.dts | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
index cfbe8c8680cd8947..294ed2d5a17cbfd5 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
@@ -22,6 +22,13 @@ aliases {
 		ethernet0 = &avb0;
 	};
 
+	can_transceiver0: can-phy0 {
+		compatible = "nxp,tjr1443";
+		#phy-cells = <0>;
+		enable-gpios = <&gpio0 8 GPIO_ACTIVE_HIGH>;
+		max-bitrate = <5000000>;
+	};
+
 	chosen {
 		bootargs = "ignore_loglevel rw root=/dev/nfs ip=on";
 		stdout-path = "serial0:921600n8";
@@ -75,6 +82,24 @@ phy0: ethernet-phy@0 {
 	};
 };
 
+&can_clk {
+	clock-frequency = <40000000>;
+};
+
+&canfd {
+	pinctrl-0 = <&canfd0_pins>, <&canfd1_pins>, <&can_clk_pins>;
+	status = "okay";
+
+	channel0 {
+		status = "okay";
+		phys = <&can_transceiver0>;
+	};
+
+	channel1 {
+		status = "okay";
+	};
+};
+
 &extal_clk {
 	clock-frequency = <16666666>;
 };
@@ -174,6 +199,21 @@ pins_mii {
 		};
 	};
 
+	can_clk_pins: can-clk {
+		groups = "can_clk";
+		function = "can_clk";
+	};
+
+	canfd0_pins: canfd0 {
+		groups = "canfd0_data";
+		function = "canfd0";
+	};
+
+	canfd1_pins: canfd1 {
+		groups = "canfd1_data";
+		function = "canfd1";
+	};
+
 	hscif0_pins: hscif0 {
 		groups = "hscif0_data", "hscif0_ctrl";
 		function = "hscif0";
-- 
2.34.1


