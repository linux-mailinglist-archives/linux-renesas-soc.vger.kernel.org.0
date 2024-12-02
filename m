Return-Path: <linux-renesas-soc+bounces-10781-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 622949E089D
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Dec 2024 17:32:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 288D9283520
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Dec 2024 16:32:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 816EB1D63DA;
	Mon,  2 Dec 2024 16:30:31 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from gauss.telenet-ops.be (gauss.telenet-ops.be [195.130.132.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9564A1C2DDE
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Dec 2024 16:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733157031; cv=none; b=TZ4j8YshZzhPEHas8AwHWnjgwqX0h86F2OYmJd55nyrJ4K+YEmjNf1BgbgfDNOmet8wzRny9auWHmq85r1nz4hjE+IXN+yd1RbB5NDuiV/z+HjVqeyap87syigof3Opt7zm3uKpWQpG+E4xH65Jsv2F3i6eLPb/m5QwVtrmqXRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733157031; c=relaxed/simple;
	bh=fMorSY2Phkub/EUMYHb/ZGS4ZZLKSKvAWmraUt1MBis=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=s+And/BHBfdmDayin+wG3ZM5ty/UTNEX8twCTSVgulGAQbyaUlHbE6vBgCMQl47Vt2qR3fCx5l/8BGuDrfPALARkzNShsRaSj5GNxJPCTEDkI62PmM3xTCOVvZcyiKnWCzvlosaNQ6BHNnp+1cCNR4AAZZrO8kI9pyHKimTW66Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
	by gauss.telenet-ops.be (Postfix) with ESMTPS id 4Y28Qk3S1Qz4x79Q
	for <linux-renesas-soc@vger.kernel.org>; Mon, 02 Dec 2024 17:30:22 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:17fe:4001:68cd:b1ae])
	by xavier.telenet-ops.be with cmsmtp
	id jsWE2D00X1yjZj401sWEWe; Mon, 02 Dec 2024 17:30:15 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tI9JO-0007uJ-OA;
	Mon, 02 Dec 2024 17:30:14 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tI9JO-007PnW-Le;
	Mon, 02 Dec 2024 17:30:14 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 3/5] arm64: dts: renesas: Factor out White Hawk Single board support
Date: Mon,  2 Dec 2024 17:30:09 +0100
Message-Id: <1661743b18a9ff9fac716f98a663b39fc8488d7e.1733156661.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733156661.git.geert+renesas@glider.be>
References: <cover.1733156661.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the common parts for the Renesas White Hawk Single board to
white-hawk-single.dtsi, to enable future reuse.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../renesas/r8a779g2-white-hawk-single.dts    | 62 +------------------
 ...hawk-single.dts => white-hawk-single.dtsi} | 11 ++--
 2 files changed, 5 insertions(+), 68 deletions(-)
 copy arch/arm64/boot/dts/renesas/{r8a779g2-white-hawk-single.dts => white-hawk-single.dtsi} (78%)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dts b/arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dts
index 0062362b0ba06885..48befde389376bf2 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dts
@@ -7,70 +7,10 @@
 
 /dts-v1/;
 #include "r8a779g2.dtsi"
-#include "white-hawk-cpu-common.dtsi"
-#include "white-hawk-common.dtsi"
+#include "white-hawk-single.dtsi"
 
 / {
 	model = "Renesas White Hawk Single board based on r8a779g2";
 	compatible = "renesas,white-hawk-single", "renesas,r8a779g2",
 		     "renesas,r8a779g0";
 };
-
-&hscif0 {
-	uart-has-rtscts;
-};
-
-&hscif0_pins {
-	groups = "hscif0_data", "hscif0_ctrl";
-	function = "hscif0";
-};
-
-&pfc {
-	tsn0_pins: tsn0 {
-		mux {
-			groups = "tsn0_link", "tsn0_mdio", "tsn0_rgmii",
-				 "tsn0_txcrefclk";
-			function = "tsn0";
-		};
-
-		link {
-			groups = "tsn0_link";
-			bias-disable;
-		};
-
-		mdio {
-			groups = "tsn0_mdio";
-			drive-strength = <24>;
-			bias-disable;
-		};
-
-		rgmii {
-			groups = "tsn0_rgmii";
-			drive-strength = <24>;
-			bias-disable;
-		};
-	};
-};
-
-&tsn0 {
-	pinctrl-0 = <&tsn0_pins>;
-	pinctrl-names = "default";
-	phy-mode = "rgmii";
-	phy-handle = <&phy3>;
-	status = "okay";
-
-	mdio {
-		#address-cells = <1>;
-		#size-cells = <0>;
-
-		reset-gpios = <&gpio1 23 GPIO_ACTIVE_LOW>;
-		reset-post-delay-us = <4000>;
-
-		phy3: ethernet-phy@0 {
-			compatible = "ethernet-phy-id002b.0980",
-				     "ethernet-phy-ieee802.3-c22";
-			reg = <0>;
-			interrupts-extended = <&gpio4 3 IRQ_TYPE_LEVEL_LOW>;
-		};
-	};
-};
diff --git a/arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dts b/arch/arm64/boot/dts/renesas/white-hawk-single.dtsi
similarity index 78%
copy from arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dts
copy to arch/arm64/boot/dts/renesas/white-hawk-single.dtsi
index 0062362b0ba06885..20e8232f2f3234e2 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dts
+++ b/arch/arm64/boot/dts/renesas/white-hawk-single.dtsi
@@ -1,19 +1,16 @@
 // SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 /*
- * Device Tree Source for the R-Car V4H ES2.0 White Hawk Single board
+ * Device Tree Source for the White Hawk Single board
  *
- * Copyright (C) 2023 Glider bv
+ * Copyright (C) 2023-2024 Glider bv
  */
 
-/dts-v1/;
-#include "r8a779g2.dtsi"
 #include "white-hawk-cpu-common.dtsi"
 #include "white-hawk-common.dtsi"
 
 / {
-	model = "Renesas White Hawk Single board based on r8a779g2";
-	compatible = "renesas,white-hawk-single", "renesas,r8a779g2",
-		     "renesas,r8a779g0";
+	model = "Renesas White Hawk Single board";
+	compatible = "renesas,white-hawk-single";
 };
 
 &hscif0 {
-- 
2.34.1


