Return-Path: <linux-renesas-soc+bounces-19267-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B911AFA011
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  5 Jul 2025 14:36:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B3D344A6007
	for <lists+linux-renesas-soc@lfdr.de>; Sat,  5 Jul 2025 12:35:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79DED20B218;
	Sat,  5 Jul 2025 12:35:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CDA91DFFD;
	Sat,  5 Jul 2025 12:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751718959; cv=none; b=stWmTDa/o+IHb0ueDH6s9YSMx1PBdu1G4nTRiDYdqtGFFpCMud2cHyvSHAnj4KTN/ol7mniDna0b6vIHYfaIV9DXubzWwMItuz4g0NiBKfc88aMKZgcGplLs4ap05NGj5L7IbWFHFWpZWpPVQyaSe8bWLFUgsZkac+AHd51xOgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751718959; c=relaxed/simple;
	bh=08rxhQ4gj9exoi0yygEuCzJD5WwEoY18qLXHx1gFUuc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D8l1O7KZnlFS1QJJfrnZyqpuTMswX6diUeNyp3CAEN3m1z6AvUDB8xu/z5s+F3xGFEavKvqzKGNhMYOMBAnPRfCWH06fGT5gf+V4ApuawYKY3KNAIiK66jxZLJZ/n/XiYmAw42rlLHwSjhClPP6xej8aewwHUUrrLRZD4FcwXhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: sI2Af2n7T6KkZJRIiG/Hvw==
X-CSE-MsgGUID: 5LGVrJkTRJC65BeIGINQKg==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 05 Jul 2025 21:35:54 +0900
Received: from localhost.localdomain (unknown [10.226.92.32])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0A1F9400A113;
	Sat,  5 Jul 2025 21:35:50 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	John Madieu <john.madieu.xa@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH] arm64: dts: renesas: rzg3e-smarc-som: Fix I2C bus for PMIC control
Date: Sat,  5 Jul 2025 13:35:38 +0100
Message-ID: <20250705123548.44624-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As per the hardware manual, RIIC8 is located in PD_AWO domain and we must
use that bus for PMIC control. Currently wrong i2c bus (i2c2) is used for
the PMIC control and the system is not entering into suspend mode because
of this.

Fixes: f7a98e256ee30 ("arm64: dts: renesas: rzg3e-smarc-som: Add I2C2 device pincontrol")
Fixes: 5ecd5a8261d00 ("arm64: dts: renesas: rzg3e-smarc-som: Add RAA215300 pmic support")
Fixes: f62bb41740462 ("arm64: dts: renesas: rzg3e-smarc-som: Reduce I2C2 clock frequency")
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
index 7faa44510d98..52eda41a6102 100644
--- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
@@ -28,7 +28,7 @@ / {
 	aliases {
 		ethernet0 = &eth0;
 		ethernet1 = &eth1;
-		i2c2 = &i2c2;
+		i2c8 = &i2c8;
 		mmc0 = &sdhi0;
 		mmc2 = &sdhi2;
 	};
@@ -102,8 +102,8 @@ &gpu {
 	mali-supply = <&reg_vdd0p8v_others>;
 };
 
-&i2c2 {
-	pinctrl-0 = <&i2c2_pins>;
+&i2c8 {
+	pinctrl-0 = <&i2c8_pins>;
 	pinctrl-names = "default";
 	clock-frequency = <400000>;
 	status = "okay";
@@ -214,9 +214,9 @@ ctrl {
 		};
 	};
 
-	i2c2_pins: i2c {
-		pinmux = <RZG3E_PORT_PINMUX(3, 4, 1)>, /* SCL2 */
-			 <RZG3E_PORT_PINMUX(3, 5, 1)>; /* SDA2 */
+	i2c8_pins: i2c8 {
+		pinmux = <RZG3E_PORT_PINMUX(3, 4, 4)>, /* SCL8 */
+			 <RZG3E_PORT_PINMUX(3, 5, 4)>; /* SDA8 */
 	};
 
 	rtc_irq_pin: rtc-irq {
-- 
2.43.0


