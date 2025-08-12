Return-Path: <linux-renesas-soc+bounces-20429-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BA18DB239B7
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Aug 2025 22:08:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CAD416E5686
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 12 Aug 2025 20:06:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF6D92D7393;
	Tue, 12 Aug 2025 20:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B0AuisAs"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18CDF30E858;
	Tue, 12 Aug 2025 20:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755029041; cv=none; b=LJUIEMZzORNLy6AXbOypOkilaEMq6XKbr+f1olGpclqakTG4SyE5oNZMATMMLzUXt6mj2Zprf9GYO7/S1AZgrbILrbxiHbPZrq2OgU7zaslkQEXdHZEKuW6d4xszmTiLz885ff89/7IQrpe5OjeEyRrcZP8QUiS0JGGJUKiRyGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755029041; c=relaxed/simple;
	bh=tjbiC1wr2ImCq1aRI0Nms8MDG5zz+rHGpsXYxUY5dfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cLX2FWJPOLbMd2aT7rsHLAKydKPKhPSfAmtLAXxGF1T2igiE9L4fASFxsOtoS8J6E8Gq6PjlNW0vNOcGF8+xdk09epvBikirCMGj3b4m/UTKLTzH4e5VfCG8+x0KbO+tOLRG2fyzKdPZYzmVlZB86zCo1sxV1Ob3sCq0HFFKT/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B0AuisAs; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-459ddada9b1so54510125e9.0;
        Tue, 12 Aug 2025 13:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755029038; x=1755633838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lR/hDSvDxkflENwqVcz/aadKb0nbYooAHH+hpKHnDeQ=;
        b=B0AuisAsGNs8GrpW3eKYJvONQDXfj3U45UeDTC+js4h0sKDGkKzf+5/CRLyZndf0yk
         0P2kV4JANNp/DOC/xQvWGBNTXa3g5cu76ZEwDn/ndaqrvNI/QwDbGytqsX7pBFBX5Je+
         udWSgYcHUvlzv4DaoAUOo/bEMg9Sa9yIy/Ly4HBbOR50U5/rifg+nTgwEXN7o5/a3qCU
         pXo96lgCpGcWMXvgi/TwFgBAjHrmnRmWEWC+k8SBmurFvd+BoOHEMstaSlFQYpK5vOLc
         KCddJhE+KhrNVwfLZaPyjZ7hVKi3+0ie0fmp7lk5l0fZbiSmZrtPLIva6IalyLtHAKnG
         Auug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755029038; x=1755633838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lR/hDSvDxkflENwqVcz/aadKb0nbYooAHH+hpKHnDeQ=;
        b=EMQtBW43ZgnkTCFSq9Srz3HwXdY7b/ZMCw6zUvyu3G0JFTdl1DqK6WM33lj66Eh2do
         2rnnk9eImVSpJrnAt+MgTDs/zIufa+R6qcwbganJD7yvDmKIIQ/SkFSOHzE0oIXN5com
         K9TqVtVPMDGwDivWS37d8Rv3ywdTQQkTjHEjJ6YyZda/O8g1Dt9gRdJ8gfLhOpz9zXY+
         JvwFZxkUvKCMP7Cg4gvW4rdnseGCfp2W3fLJeYm+UfeGmJkst0uYHRMiIrSp/IwjIAN/
         AcSNjgfpymTZdw579/LRUqrFBp2+s/ShRnGboU5doQW5WILc6O3aAi58LNTbiNUpe7nY
         P0IQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJGrExH7U0SS7cxWgEAcpj2nMms3y9q/HzEePguT7BQZshq7JDdPl8pQLwT+Ez/xh5SBtJtO+ANNDP@vger.kernel.org, AJvYcCWMN9cMJQ7n9jC0r354Be/hAA8rDe1xrsg/aFySZP6zVFzs5j/ti+oYRrWuUD0Hr1zj7d/pgg+SYu31g2Q9@vger.kernel.org
X-Gm-Message-State: AOJu0YyzrHZVqm3jMVYE5tPJt2CX/YaixLiBNcAhpQHQSD0UHvdg6Sio
	F2AqtSbO63+1MaAQ8n8enb26pQ4gDnJcBBfhkfpzfOE9fzHj8uCD3lLn
X-Gm-Gg: ASbGnctaKg1bWrZMJd0PkYtXUzwMqsxUGCvDDGsVvUS3ABKFw55Q2LJ58DpxPr4n70q
	fsSX/gmlVzezO65iv6IOgC4O+UVTMWmJRisTInOBrA9GSMOt+PqBPYVlcyYMS0nmPmgcMbnQVSi
	wT1vpbcMeD+uachBfGYX6PcCizGCMSbfo3xvHlY25Ad8rAbgop9Jol5TahAj5AjqGraIJ2CUiOW
	n24lWufDrvm33gWTS5Bm8+rAbcPMhx8acxOD68wUwnE3rqbllaUCZzv5EO58h1U5jeyuJduShCN
	ewRsl9twfum1e7+TnicodpExyhIS+CLyiJ3SNmlpX2evySOvfngtEB1ELOpSrobHlLfBdy0dmLZ
	c93uuGEGH+SRNtjK/t4QBUiDQ/aqlcTlOiI8EEMQKK/w4ibgL70htohI9fIqMO31uyfKZ1WD6Nw
	==
X-Google-Smtp-Source: AGHT+IHSp89K9OhGejB8E5zzcx2jt5wvZXS2cf6NJsZvJ/QZ2ccJ3b2TgdFDGczKqb0oAt1U1sXkuA==
X-Received: by 2002:a05:600c:3585:b0:458:bf0a:6061 with SMTP id 5b1f17b1804b1-45a16b71ac0mr1086855e9.24.1755029038262;
        Tue, 12 Aug 2025 13:03:58 -0700 (PDT)
Received: from iku.Home (97e54365.skybroadband.com. [151.229.67.101])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a16dde163sm297645e9.12.2025.08.12.13.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 13:03:57 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 11/13] arm64: dts: renesas: rzt2h/rzn2h: Enable eMMC
Date: Tue, 12 Aug 2025 21:03:42 +0100
Message-ID: <20250812200344.3253781-12-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250812200344.3253781-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250812200344.3253781-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Enable eMMC on RZ/T2H and RZ/N2H EVKs. As SDHI0 can be connected to
either eMMC0/SD0 `SD0_EMMC` macro is added.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../dts/renesas/r9a09g077m44-rzt2h-evk.dts    |  9 +++
 .../dts/renesas/r9a09g087m44-rzn2h-evk.dts    |  9 +++
 .../dts/renesas/rzt2h-n2h-evk-common.dtsi     | 62 +++++++++++++++++++
 3 files changed, 80 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
index 36e3b630727a..05945a8a3228 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
@@ -11,6 +11,15 @@
 #include <dt-bindings/pinctrl/renesas,r9a09g077-pinctrl.h>
 
 #include "r9a09g077m44.dtsi"
+
+/*
+ * SD0 can be connected to either eMMC (IC49) or SD card slot CN31
+ * Lets by default enable the eMMC, note we need the below SW settings
+ * for eMMC.
+ * SW2[1] = ON; SW2[2] = ON
+ */
+#define SD0_EMMC	1
+
 #include "rzt2h-n2h-evk-common.dtsi"
 
 / {
diff --git a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
index e41b687e5497..89baa601a179 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
@@ -10,6 +10,15 @@
 #include <dt-bindings/gpio/gpio.h>
 
 #include "r9a09g087m44.dtsi"
+
+/*
+ * SD0 can be connected to either eMMC (U33) or SD card slot CN21
+ * Lets by default enable the eMMC, note we need the below SW settings
+ * for eMMC.
+ * DSW5[1] = ON; DSW5[2] = ON
+ */
+#define SD0_EMMC       1
+
 #include "rzt2h-n2h-evk-common.dtsi"
 
 /*
diff --git a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
index 1a3d28054bf7..7fa49de2a243 100644
--- a/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
@@ -11,12 +11,31 @@ / {
 	aliases {
 		i2c0 = &i2c0;
 		i2c1 = &i2c1;
+		mmc0 = &sdhi0;
 		serial0 = &sci0;
 	};
 
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	reg_1p8v: regulator-1p8v {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-1.8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_3p3v: regulator-3p3v {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-3.3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
 };
 
 &extal_clk {
@@ -44,6 +63,34 @@ sci0_pins: sci0-pins {
 		pinmux = <RZT2H_PORT_PINMUX(27, 4, 0x14)>,
 			 <RZT2H_PORT_PINMUX(27, 5, 0x14)>;
 	};
+
+#if SD0_EMMC
+	sdhi0-emmc-iovs-hog {
+		gpio-hog;
+		gpios = <RZT2H_GPIO(2, 6) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "SD0_IOVS";
+	};
+#endif
+
+	sdhi0_emmc_pins: sd0-emmc-group {
+		sd0-emmc-data-pins {
+			pinmux = <RZT2H_PORT_PINMUX(12, 2, 0x29)>, /* SD0_DATA0 */
+				 <RZT2H_PORT_PINMUX(12, 3, 0x29)>, /* SD0_DATA1 */
+				 <RZT2H_PORT_PINMUX(12, 4, 0x29)>, /* SD0_DATA2 */
+				 <RZT2H_PORT_PINMUX(12, 5, 0x29)>, /* SD0_DATA3 */
+				 <RZT2H_PORT_PINMUX(12, 6, 0x29)>, /* SD0_DATA4 */
+				 <RZT2H_PORT_PINMUX(12, 7, 0x29)>, /* SD0_DATA5 */
+				 <RZT2H_PORT_PINMUX(13, 0, 0x29)>, /* SD0_DATA6 */
+				 <RZT2H_PORT_PINMUX(13, 1, 0x29)>; /* SD0_DATA7 */
+		};
+
+		sd0-emmc-ctrl-pins {
+			pinmux = <RZT2H_PORT_PINMUX(12, 0, 0x29)>, /* SD0_CLK */
+				 <RZT2H_PORT_PINMUX(12, 1, 0x29)>, /* SD0_CMD */
+				 <RZT2H_PORT_PINMUX(13, 2, 0x29)>; /* SD0_RST# */
+		};
+	};
 };
 
 &sci0 {
@@ -51,3 +98,18 @@ &sci0 {
 	pinctrl-names = "default";
 	status = "okay";
 };
+
+#if SD0_EMMC
+&sdhi0 {
+	pinctrl-0 = <&sdhi0_emmc_pins>;
+	pinctrl-1 = <&sdhi0_emmc_pins>;
+	pinctrl-names = "default", "state_uhs";
+	vmmc-supply = <&reg_3p3v>;
+	vqmmc-supply = <&reg_1p8v>;
+	bus-width = <8>;
+	non-removable;
+	mmc-hs200-1_8v;
+	fixed-emmc-driver-type = <1>;
+	status = "okay";
+};
+#endif
-- 
2.50.1


