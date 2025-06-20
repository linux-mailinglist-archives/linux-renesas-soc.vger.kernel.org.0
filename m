Return-Path: <linux-renesas-soc+bounces-18581-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E33B7AE1AB2
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Jun 2025 14:13:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B7D35A55CF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 20 Jun 2025 12:11:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CF6728B7EC;
	Fri, 20 Jun 2025 12:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LFgKIoxn"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFEB28A702;
	Fri, 20 Jun 2025 12:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750421460; cv=none; b=Jkjx58DiTLSTDx0ixpOUyNbi2pRNaWsHKYqAjzIolHDqxbNMFu41CGznac1pTiKuyiicaZQ4lS7ZpFm44aHUMfopGaC+x6/8PY6ca+k2jMdvyYV0qAzYqFnQliDeu8HNVmoeCkiHeHtlxAmgE1/VY1QLoJBB1ylvR/m4wz6zP30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750421460; c=relaxed/simple;
	bh=uWF+cWqK0LnMaZZQIC3/seEnPsrycCkKYdlQxfGKZYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WFdgs+FjHLkoOZKwokG48e5P9TMnjTwBFudAYq9RmR2laCUjcqop3PwsO5VQ6wYFjJCZmc2nniEFAQHG/NF+ru6/8+xAYr38cW3B1JU90RJlPzY9ATXnXtIeMVQfX34hqTxPMDj6VScugrav7m1X0Cz7w+gO8+jQX4VyFv+jP4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LFgKIoxn; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-451ebd3d149so11197695e9.2;
        Fri, 20 Jun 2025 05:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750421456; x=1751026256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XmvxcymnQoIbmsstrPljoosyziWS4dXJv2KYJtdJ2P0=;
        b=LFgKIoxnB9WlG9+6d4cv7321RTUbMBQ/NvtT5Y0ZRBudkmOTR5LZXUXvhMBiaNrDbL
         cKzN0PCu+/+M5m2m3QkYJGhi6uKb9hmCr1UHkwNW5WP9GXfTYv6GOIaKZ8TluKExvMHN
         vr0Sk/YKjHRj1o38eH17W4+l+S12RFyNTIUgqr/4m10a2kjSPdJE7oo7yvhbLS5CVYms
         5MnKPBq0zWk02O7utuERbHWZZjSkZ4aQ14emhGMQJmGOdSd2s0V4TMTrA8tBWHdEneOp
         3J6RDo/PLQYRY7KxtOaa6nc0p/ml91rtXjMrNbs/kHp0LTeDglumg3fFVr95ABvkGQ7l
         rAFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750421456; x=1751026256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XmvxcymnQoIbmsstrPljoosyziWS4dXJv2KYJtdJ2P0=;
        b=hxSZUoTzgk4a1Eh423pQ5JsFPCUrX9Rvj7tB/2nXj+x+8mo1Ubt9u0ybjIZDn4whWV
         Ey1MEOARZj24BjIZ1BwBjyG0/HTaAEwfhv40LTBoe+dJ/SMe+pJJm6NyQLariwi2+STR
         ADslF+8wWCZ5BZu3hwhQKVqGD/e9yvdrrK0PZI96YP4AuKM2EGh2Rr6WXxeGJsM7Y0QQ
         aQHlKDMuskud6Y2PIsilVzNiVhgvB/L49ZRU6KUvCdXVAGinRYnS+i0xRgHmi8jOUOwb
         t4oJRJ4RaJEWCDIwdeJQS0SGYzDGPgYZGmOpKYrwwWFEfoiwRIfX85vPfbsSEjAoDfk8
         0DUA==
X-Forwarded-Encrypted: i=1; AJvYcCUaAnIdi79AN/k3vIuLXxUdUOdtFmsnjtzBY1459qnWtK2DNZ+hAg81TRIuDxipXHrepddiKuSIPb2W@vger.kernel.org, AJvYcCUgrr5Zns43MNS6djNPK6t96WVSPSRTtenCqewh8wW2aQdaJ+ccLOHSDA9xc8DptSAfhg+B0XYIGaVgV/5f@vger.kernel.org
X-Gm-Message-State: AOJu0Yz68e6CVBVqfZ+48EK5wUJfXgq9Um2/woQq2U6vhM5DpxGKp84/
	YC+Ne7gUf6/8y2LCwHEERpC4e9/+ulsqxYRuLduEN8coztI6BheyW07M
X-Gm-Gg: ASbGnctmHr/KRRG1ddNyK3Xz5Pjm+S9XnBiaXgYTiLFhhUw1R+KHH1GDT4w+Pzx++XR
	/KMPyknC0IoYqvpW0JaLx0hfe5/MGhmuTNfHBvwuEszGSReZIXZDtFtsnt7PCPO7/b3NOnGmJGj
	W40OyURpi4sgE2qCMtrXHdU/tk0BcLuh7YRPnAMI6/d/QwoeKijormCNHLWs0sgVw/osT5I+wt2
	2dExuj6fQnGvGtnVihGKYOqABknOEkvNClyEJDECa7eY9TrbZ6vIpaO1SOFXG23DE4vzcxPwjmN
	tERAMNhfoCKetJG3bLZ27jrXcIQYfQh/xD9ZtxBKo6miVojfWdgFiLluiVg7zIqbNM7wZRi8tX9
	125tnmT14Kg==
X-Google-Smtp-Source: AGHT+IEeWaK4utAkAgvbrMaG5lD1IdIiXoN2u4YR4ZfYpV0jWFwEZ7aDw58u2tRg8HeG3vHfO+ZMoA==
X-Received: by 2002:a05:600c:8b37:b0:43d:fa59:cc8f with SMTP id 5b1f17b1804b1-453657bfda0mr22848375e9.33.1750421455986;
        Fri, 20 Jun 2025 05:10:55 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:e188:15d5:9cc6:1db])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e97a915sm58234645e9.7.2025.06.20.05.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 05:10:55 -0700 (PDT)
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
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/3] arm64: dts: renesas: Add CN15 eMMC and SD overlays for RZ/V2N EVK
Date: Fri, 20 Jun 2025 13:10:43 +0100
Message-ID: <20250620121045.56114-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250620121045.56114-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250620121045.56114-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Introduce device tree overlays to support the eMMC (RTK0EF0186B02000BJ)
and microSD (RTK0EF0186B01000BJ) sub-boards via the CN15 connector on the
RZ/V2N EVK. These overlays enable SDHI0 with appropriate pinctrl settings,
regulator configurations, and GPIO handling.

Shared DTSI fragments (rzv2-evk-cn15-emmc-common.dtsi and
rzv2-evk-cn15-sd-common.dtsi) provide reusable configurations for both
RZ/V2N and RZ/V2H EVKs, as both support the same CN15 sub-boards.

Additionally, the base board DTS is updated to define an `mmc0` alias
pointing to `&sdhi0`, and to add a fixed 1.8V regulator node (`reg_1p8v`)
intended for use by the optional eMMC sub-board and, in the future, the
ADV7535 HDMI encoder (not yet enabled in the DTS).

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/Makefile          |  4 ++
 .../r9a09g056n48-rzv2n-evk-cn15-emmc.dtso     | 15 +++++
 .../r9a09g056n48-rzv2n-evk-cn15-sd.dtso       | 16 +++++
 .../dts/renesas/r9a09g056n48-rzv2n-evk.dts    | 10 +++
 .../renesas/rzv2-evk-cn15-emmc-common.dtsi    | 46 +++++++++++++
 .../dts/renesas/rzv2-evk-cn15-sd-common.dtsi  | 67 +++++++++++++++++++
 6 files changed, 158 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/rzv2-evk-cn15-emmc-common.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/rzv2-evk-cn15-sd-common.dtsi

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 677ba3aa8931..130ef8f34d52 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -161,6 +161,10 @@ r9a09g047e57-smarc-cru-csi-ov5645-dtbs := r9a09g047e57-smarc.dtb r9a09g047e57-sm
 dtb-$(CONFIG_ARCH_R9A09G047) += r9a09g047e57-smarc-cru-csi-ov5645.dtb
 
 dtb-$(CONFIG_ARCH_R9A09G056) += r9a09g056n48-rzv2n-evk.dtb
+dtb-$(CONFIG_ARCH_R9A09G056) += r9a09g056n48-rzv2n-evk-cn15-emmc.dtbo
+r9a09g056n48-rzv2n-evk-cn15-emmc.dts := r9a09g056n48-rzv2n-evk.dtb r9a09g056n48-rzv2n-evk-cn15-emmc.dtbo
+dtb-$(CONFIG_ARCH_R9A09G056) += r9a09g056n48-rzv2n-evk-cn15-sd.dtbo
+r9a09g056n48-rzv2n-evk-cn15-sd.dts := r9a09g056n48-rzv2n-evk.dtb r9a09g056n48-rzv2n-evk-cn15-sd.dtbo
 
 dtb-$(CONFIG_ARCH_R9A09G057) += r9a09g057h44-rzv2h-evk.dtb
 dtb-$(CONFIG_ARCH_R9A09G057) += r9a09g057h48-kakip.dtb
diff --git a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtso b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtso
new file mode 100644
index 000000000000..c943150efcba
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-emmc.dtso
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree overlay for the RZ/V2N EVK with the eMMC sub-board
+ * (RTK0EF0186802000BJ) connected to the CN15 connector.
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#define RZV2N_PA		10
+#define EMMC_GPIO(port, pin)	RZG2L_GPIO(RZV2N_P##port, pin)
+
+#include "rzv2-evk-cn15-emmc-common.dtsi"
diff --git a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtso b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtso
new file mode 100644
index 000000000000..6268dda138ab
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk-cn15-sd.dtso
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree overlay for the RZ/V2N EVK with the SD sub-board
+ * (RTK0EF0186B01000BJ) connected to the CN15 connector.
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#define RZV2N_PA		10
+#define SD_GPIO(port, pin)	RZG2L_GPIO(RZV2N_P##port, pin)
+#define SD_PORT_PINMUX(b, p, f)	RZG2L_PORT_PINMUX(RZV2N_P##b, p, f)
+
+#include "rzv2-evk-cn15-sd-common.dtsi"
diff --git a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
index b63ee1ff18d5..795d9f6b9651 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
@@ -24,6 +24,7 @@ aliases {
 		i2c6 = &i2c6;
 		i2c7 = &i2c7;
 		i2c8 = &i2c8;
+		mmc0 = &sdhi0;
 		mmc1 = &sdhi1;
 		serial0 = &scif;
 	};
@@ -48,6 +49,15 @@ reg_0p8v: regulator-0p8v {
 		regulator-always-on;
 	};
 
+	reg_1p8v: regulator-1p8v {
+		compatible = "regulator-fixed";
+		regulator-name = "fixed-1.8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
 	reg_3p3v: regulator-3p3v {
 		compatible = "regulator-fixed";
 		regulator-name = "fixed-3.3V";
diff --git a/arch/arm64/boot/dts/renesas/rzv2-evk-cn15-emmc-common.dtsi b/arch/arm64/boot/dts/renesas/rzv2-evk-cn15-emmc-common.dtsi
new file mode 100644
index 000000000000..7ac38f34d0b9
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzv2-evk-cn15-emmc-common.dtsi
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Shared DT include for the eMMC Sub Board (RTK0EF0186B02000BJ), which
+ * is connected to the CN15 connector on the RZ/V2H and RZ/V2N EVKs.
+ *
+ * Contains common pinctrl and SDHI0 definitions.
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
+
+&pinctrl {
+	sdhi0_emmc_pins: emmc-pins {
+		sd0-clk {
+			pins = "SD0CLK";
+			renesas,output-impedance = <3>;
+			slew-rate = <0>;
+		};
+
+		sd0-dat-cmd {
+			pins = "SD0DAT0", "SD0DAT1", "SD0DAT2", "SD0DAT3", "SD0DAT4",
+			       "SD0DAT5", "SD0DAT6", "SD0DAT7", "SD0CMD";
+			input-enable;
+			renesas,output-impedance = <3>;
+			slew-rate = <0>;
+		};
+	};
+};
+
+&sdhi0 {
+	pinctrl-0 = <&sdhi0_emmc_pins>;
+	pinctrl-1 = <&sdhi0_emmc_pins>;
+	pinctrl-names = "default", "state_uhs";
+	vmmc-supply = <&reg_3p3v>;
+	vqmmc-supply = <&reg_1p8v>;
+	bus-width = <8>;
+	mmc-hs200-1_8v;
+	non-removable;
+	fixed-emmc-driver-type = <1>;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/renesas/rzv2-evk-cn15-sd-common.dtsi b/arch/arm64/boot/dts/renesas/rzv2-evk-cn15-sd-common.dtsi
new file mode 100644
index 000000000000..b402a6eaf61b
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzv2-evk-cn15-sd-common.dtsi
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Shared DT include for the microSD Sub Board (RTK0EF0186B01000BJ), which
+ * is connected to the CN15 connector on the RZ/V2H and RZ/V2N EVKs.
+ *
+ * Contains common pinctrl and SDHI0 definitions.
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
+
+&{/} {
+	vqmmc_sdhi0: regulator-vqmmc-sdhi0 {
+		compatible = "regulator-gpio";
+		regulator-name = "SDHI0 VqmmC";
+		gpios = <&pinctrl SD_GPIO(A, 0) GPIO_ACTIVE_HIGH>;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		gpios-states = <0>;
+		states = <3300000 0>, <1800000 1>;
+	};
+};
+
+&pinctrl {
+	sdhi0-pwr-en-hog {
+		gpio-hog;
+		gpios = <SD_GPIO(A, 1) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "sd0_pwr_en";
+	};
+
+	sdhi0_pins: sd0 {
+		sd0-cd {
+			pinmux = <SD_PORT_PINMUX(A, 5, 15)>; /* SD0_CD */
+		};
+
+		sd0-clk {
+			pins = "SD0CLK";
+			renesas,output-impedance = <3>;
+			slew-rate = <0>;
+		};
+
+		sd0-dat-cmd {
+			pins = "SD0DAT0", "SD0DAT1", "SD0DAT2", "SD0DAT3", "SD0CMD";
+			input-enable;
+			renesas,output-impedance = <3>;
+			slew-rate = <0>;
+		};
+	};
+};
+
+&sdhi0 {
+	pinctrl-0 = <&sdhi0_pins>;
+	pinctrl-1 = <&sdhi0_pins>;
+	pinctrl-names = "default", "state_uhs";
+	vmmc-supply = <&reg_3p3v>;
+	vqmmc-supply = <&vqmmc_sdhi0>;
+	bus-width = <4>;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};
-- 
2.49.0


