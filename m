Return-Path: <linux-renesas-soc+bounces-15048-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B887BA75631
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Mar 2025 13:13:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F39EB16FC4E
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 29 Mar 2025 12:13:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A85091CAA6C;
	Sat, 29 Mar 2025 12:13:17 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7711817A2E8;
	Sat, 29 Mar 2025 12:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743250397; cv=none; b=Rlf4DwiVoVWgidh9ttgT6GEDrvAOSAohZE/FPiunbcFLd6m2spLWn6KqypFrIz+KcsL3yOFFUXEOWk/HPGo5xHZB6H6H+gRodLsdQKewvXTdz2YOp0MDExMLlF+3L07QTGYxovFRA8PcGsk3ozsLyZDY0HC5sN6iKF+MOJHInRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743250397; c=relaxed/simple;
	bh=6A/Sf0HiEq2SsDh6hJTOjkUJ/Vom86gc3zUMNjEmDL0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HbDf1COfEiolVd6RW/kuuEvhGy7635z5wvg+Vc2rw4mlw+9K1QOb0gDWjwNbGcwCycY7WANKKf5iCAyBQGhtTPizBNE+QLQcg0eJ1dtI4scHWlRlBMlMmxlSamQAhKdwYYeTOPoOE8POTv6m6sjoZfmhJZYwDO1apvhQxArhiVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: y6maGr/cTtyLeB25folhDg==
X-CSE-MsgGUID: 2dH9T0VeTM+HUdBcjxDYDw==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 29 Mar 2025 21:13:09 +0900
Received: from ubuntu.adwin.renesas.com (unknown [10.226.92.9])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id DD54D40062A6;
	Sat, 29 Mar 2025 21:13:05 +0900 (JST)
From: John Madieu <john.madieu.xa@bp.renesas.com>
To: john.madieu.xa@bp.renesas.com,
	conor+dt@kernel.org,
	geert+renesas@glider.be,
	krzk+dt@kernel.org,
	magnus.damm@gmail.com,
	robh@kernel.org
Cc: biju.das.jz@bp.renesas.com,
	devicetree@vger.kernel.org,
	john.madieu@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: renesas: rzg3e-smarc-som: Add I2C2 device pincontrol
Date: Sat, 29 Mar 2025 13:12:56 +0100
Message-ID: <20250329121258.172099-2-john.madieu.xa@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250329121258.172099-1-john.madieu.xa@bp.renesas.com>
References: <20250329121258.172099-1-john.madieu.xa@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device node for i2c2 pincontrol. Also enable i2c2 device node on dtsi
with 1MHz clock frequency as it is connected to PMIC raa215300 on RZ/G3E
SoM.

Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
index 72b42a81bcf3..ca56a9edda2e 100644
--- a/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
@@ -18,6 +18,7 @@ / {
 	compatible = "renesas,rzg3e-smarcm", "renesas,r9a09g047e57", "renesas,r9a09g047";
 
 	aliases {
+		i2c2 = &i2c2;
 		mmc0 = &sdhi0;
 		mmc2 = &sdhi2;
 	};
@@ -51,7 +52,19 @@ &audio_extal_clk {
 	clock-frequency = <48000000>;
 };
 
+&i2c2 {
+	pinctrl-0 = <&i2c2_pins>;
+	pinctrl-names = "default";
+	clock-frequency = <1000000>;
+	status = "okay";
+};
+
 &pinctrl {
+	i2c2_pins: i2c {
+		pinmux = <RZG3E_PORT_PINMUX(3, 4, 1)>, /* SCL2 */
+			 <RZG3E_PORT_PINMUX(3, 5, 1)>; /* SDA2 */
+	};
+
 	sdhi0_emmc_pins: sd0-emmc {
 		sd0-ctrl {
 			pins = "SD0CLK", "SD0CMD";
-- 
2.25.1


