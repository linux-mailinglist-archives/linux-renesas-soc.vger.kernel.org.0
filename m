Return-Path: <linux-renesas-soc+bounces-2764-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 883B0854A43
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Feb 2024 14:18:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E85A8B21C0D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 14 Feb 2024 13:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A33BE535B3;
	Wed, 14 Feb 2024 13:18:25 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [195.130.137.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9772B1A58B
	for <linux-renesas-soc@vger.kernel.org>; Wed, 14 Feb 2024 13:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707916705; cv=none; b=ILAEtYUcSJOGsAE7VLUuQ5mkWz0o8sgdc942EoOPhs18DGxNp1xnQ89veRdFZS5bbUbUKP0dt2kD7fTt8enS4/l0J1i0UOZg8ZPUqOeNUZkNsbLiB+qyT6STF31UzIWhZQsoW/xp/18JopqNMiuiQuExeuGiHN9bELuYJyhsR5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707916705; c=relaxed/simple;
	bh=c2NL7bSfAIuT80iFr3wvW5CEL1ChcFFky87AaomDmV4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=umCHB9N52iEt05qnIvf4ttOBKkWqSHTAyH28hNuzRq0qaLOxRPad+6XeUWnil3VHU02J5kRNViPyjoRCcPAibaRE8bD3sOFqoOnxH3io+QhMHE+M2NFpGaLrk/yKdpzCnKt8UZppiLQgOMG06Dpk/wkqlR7j/uVMgFTzSdqlX3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:ac52:3a54:2a84:d65a])
	by laurent.telenet-ops.be with bizsmtp
	id n1JE2B00J0LVNSS011JEvG; Wed, 14 Feb 2024 14:18:15 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1raF9L-000d5i-Sa;
	Wed, 14 Feb 2024 14:18:14 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1raF9S-00GvXv-HN;
	Wed, 14 Feb 2024 14:18:14 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Cong Dang <cong.dang.xn@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] arm64: dts: renesas: gray-hawk-single: Add eMMC support
Date: Wed, 14 Feb 2024 14:18:03 +0100
Message-Id: <208bfc781b1488e253e19626ad80876c34c86758.1707915763.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1707915763.git.geert+renesas@glider.be>
References: <cover.1707915763.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Cong Dang <cong.dang.xn@renesas.com>

Describe the eMMC on the Gray Hawk Single board.

Signed-off-by: Cong Dang <cong.dang.xn@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Changes compared to the BSP:
  - Apply to r8a779h0-gray-hawk-single.dts.
---
 .../dts/renesas/r8a779h0-gray-hawk-single.dts | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
index fcb58b92daae31e1..c951dbb8b047e0c0 100644
--- a/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779h0-gray-hawk-single.dts
@@ -33,6 +33,24 @@ memory@480000000 {
 		device_type = "memory";
 		reg = <0x4 0x80000000 0x1 0x80000000>;
 	};
+
+	reg_1p8v: regulator-1p8v {
+			compatible = "regulator-fixed";
+			regulator-name = "fixed-1.8V";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-boot-on;
+			regulator-always-on;
+	};
+
+	reg_3p3v: regulator-3p3v {
+			compatible = "regulator-fixed";
+			regulator-name = "fixed-3.3V";
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-boot-on;
+			regulator-always-on;
+	};
 };
 
 &avb0 {
@@ -105,6 +123,23 @@ eeprom@53 {
 	};
 };
 
+&mmc0 {
+	pinctrl-0 = <&mmc_pins>;
+	pinctrl-1 = <&mmc_pins>;
+	pinctrl-names = "default", "state_uhs";
+
+	vmmc-supply = <&reg_3p3v>;
+	vqmmc-supply = <&reg_1p8v>;
+	mmc-hs200-1_8v;
+	mmc-hs400-1_8v;
+	bus-width = <8>;
+	no-sd;
+	no-sdio;
+	non-removable;
+	full-pwr-cycle-in-suspend;
+	status = "okay";
+};
+
 &pfc {
 	pinctrl-0 = <&scif_clk_pins>;
 	pinctrl-names = "default";
@@ -137,6 +172,12 @@ i2c0_pins: i2c0 {
 		function = "i2c0";
 	};
 
+	mmc_pins: mmc {
+		groups = "mmc_data8", "mmc_ctrl", "mmc_ds";
+		function = "mmc";
+		power-source = <1800>;
+	};
+
 	scif_clk_pins: scif-clk {
 		groups = "scif_clk";
 		function = "scif_clk";
-- 
2.34.1


