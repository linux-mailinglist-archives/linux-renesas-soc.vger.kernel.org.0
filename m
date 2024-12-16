Return-Path: <linux-renesas-soc+bounces-11419-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A989F3A4D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2024 20:54:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 56E5F16304B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2024 19:54:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8699520CCD3;
	Mon, 16 Dec 2024 19:54:00 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58E6720CCC5;
	Mon, 16 Dec 2024 19:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734378840; cv=none; b=c1ILKOQQlIq8HhZRt/lyAVygysnfnJUZmf8KFaDM+nJULHlp6XGkn6lMfyeqtO8WLRn10/rF26cAnQWg8uEid0Sn6HHySGjO1xZ76hvUwI8/0w5Nz3Cob6mgJ56Zx1+yzNeRviY8yygehYsL/yXx3SUHu1A1qhyiUU6yefgpuWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734378840; c=relaxed/simple;
	bh=EtMaaLHeKXq9bdfpE/hoknL0kyiolPeBnFkFxNi81Rw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JiRokhQh4AebRS/WgNe2h/9BelsaolNk3WHaqhJEGgaGNxYYL4u1tsdcv0H5dPXhbeu1NYaTqtb3KYoDlPorIZpD8qUVvsPr7ed9qDwVCJHO5wA7fCWve+Esmr3UvcPzOdIsqaCKcj2qGkdthtdf1Mwue/M+4OEhubbzlyZ0MGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: 26pnFlTgRyaKYTGhsKieHQ==
X-CSE-MsgGUID: +KU3kkXPT+i8DFKPRl5uGQ==
X-IronPort-AV: E=Sophos;i="6.12,239,1728918000"; 
   d="scan'208";a="231992163"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 17 Dec 2024 04:53:57 +0900
Received: from localhost.localdomain (unknown [10.226.93.40])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 1B11D406320F;
	Tue, 17 Dec 2024 04:53:44 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v4 5/7] arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Replace RZG2L macros
Date: Mon, 16 Dec 2024 19:53:15 +0000
Message-ID: <20241216195325.164212-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241216195325.164212-1-biju.das.jz@bp.renesas.com>
References: <20241216195325.164212-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace RZG2L_* macros with RZV2H_* macros, so that we can define
port names in alpha-numeric.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3->v4:
 * Replaced rzg2l-pinctrl.h->renesas,r9a09g057-pinctrl.h header file.
 * Added Rb tag from Geert.
v3:
 * New patch.
---
 .../dts/renesas/r9a09g057h44-rzv2h-evk.dts    | 36 +++++++++----------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
index 4703da8e9cff..0b705c987b6c 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
@@ -7,7 +7,7 @@
 
 /dts-v1/;
 
-#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
+#include <dt-bindings/pinctrl/renesas,r9a09g057-pinctrl.h>
 #include <dt-bindings/gpio/gpio.h>
 #include "r9a09g057.dtsi"
 
@@ -56,7 +56,7 @@ reg_3p3v: regulator1 {
 	vqmmc_sdhi1: regulator-vccq-sdhi1 {
 		compatible = "regulator-gpio";
 		regulator-name = "SDHI1 VccQ";
-		gpios = <&pinctrl RZG2L_GPIO(10, 2) GPIO_ACTIVE_HIGH>;
+		gpios = <&pinctrl RZV2H_GPIO(A, 2) GPIO_ACTIVE_HIGH>;
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <3300000>;
 		gpios-states = <0>;
@@ -158,38 +158,38 @@ &ostm7 {
 
 &pinctrl {
 	i2c0_pins: i2c0 {
-		pinmux = <RZG2L_PORT_PINMUX(3, 0, 1)>, /* I2C0_SDA */
-			 <RZG2L_PORT_PINMUX(3, 1, 1)>; /* I2C0_SCL */
+		pinmux = <RZV2H_PORT_PINMUX(3, 0, 1)>, /* I2C0_SDA */
+			 <RZV2H_PORT_PINMUX(3, 1, 1)>; /* I2C0_SCL */
 	};
 
 	i2c1_pins: i2c1 {
-		pinmux = <RZG2L_PORT_PINMUX(3, 2, 1)>, /* I2C1_SDA */
-			 <RZG2L_PORT_PINMUX(3, 3, 1)>; /* I2C1_SCL */
+		pinmux = <RZV2H_PORT_PINMUX(3, 2, 1)>, /* I2C1_SDA */
+			 <RZV2H_PORT_PINMUX(3, 3, 1)>; /* I2C1_SCL */
 	};
 
 	i2c2_pins: i2c2 {
-		pinmux = <RZG2L_PORT_PINMUX(2, 0, 4)>, /* I2C2_SDA */
-			 <RZG2L_PORT_PINMUX(2, 1, 4)>; /* I2C2_SCL */
+		pinmux = <RZV2H_PORT_PINMUX(2, 0, 4)>, /* I2C2_SDA */
+			 <RZV2H_PORT_PINMUX(2, 1, 4)>; /* I2C2_SCL */
 	};
 
 	i2c3_pins: i2c3 {
-		pinmux = <RZG2L_PORT_PINMUX(3, 6, 1)>, /* I2C3_SDA */
-			 <RZG2L_PORT_PINMUX(3, 7, 1)>; /* I2C3_SCL */
+		pinmux = <RZV2H_PORT_PINMUX(3, 6, 1)>, /* I2C3_SDA */
+			 <RZV2H_PORT_PINMUX(3, 7, 1)>; /* I2C3_SCL */
 	};
 
 	i2c6_pins: i2c6 {
-		pinmux = <RZG2L_PORT_PINMUX(4, 4, 1)>, /* I2C6_SDA */
-			 <RZG2L_PORT_PINMUX(4, 5, 1)>; /* I2C6_SCL */
+		pinmux = <RZV2H_PORT_PINMUX(4, 4, 1)>, /* I2C6_SDA */
+			 <RZV2H_PORT_PINMUX(4, 5, 1)>; /* I2C6_SCL */
 	};
 
 	i2c7_pins: i2c7 {
-		pinmux = <RZG2L_PORT_PINMUX(4, 6, 1)>, /* I2C7_SDA */
-			 <RZG2L_PORT_PINMUX(4, 7, 1)>; /* I2C7_SCL */
+		pinmux = <RZV2H_PORT_PINMUX(4, 6, 1)>, /* I2C7_SDA */
+			 <RZV2H_PORT_PINMUX(4, 7, 1)>; /* I2C7_SCL */
 	};
 
 	i2c8_pins: i2c8 {
-		pinmux = <RZG2L_PORT_PINMUX(0, 6, 1)>, /* I2C8_SDA */
-			 <RZG2L_PORT_PINMUX(0, 7, 1)>; /* I2C8_SCL */
+		pinmux = <RZV2H_PORT_PINMUX(0, 6, 1)>, /* I2C8_SDA */
+			 <RZV2H_PORT_PINMUX(0, 7, 1)>; /* I2C8_SCL */
 	};
 
 	scif_pins: scif {
@@ -199,7 +199,7 @@ scif_pins: scif {
 
 	sd1-pwr-en-hog {
 		gpio-hog;
-		gpios = <RZG2L_GPIO(10, 3) GPIO_ACTIVE_HIGH>;
+		gpios = <RZV2H_GPIO(A, 3) GPIO_ACTIVE_HIGH>;
 		output-high;
 		line-name = "sd1_pwr_en";
 	};
@@ -219,7 +219,7 @@ sd1_clk {
 		};
 
 		sd1_cd {
-			pinmux = <RZG2L_PORT_PINMUX(9, 4, 14)>; /* SD1_CD */
+			pinmux = <RZV2H_PORT_PINMUX(9, 4, 14)>; /* SD1_CD */
 		};
 	};
 };
-- 
2.43.0


