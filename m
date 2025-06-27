Return-Path: <linux-renesas-soc+bounces-18855-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F62AEC00F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 21:37:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 74B751719C3
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 27 Jun 2025 19:37:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 418D81F0E25;
	Fri, 27 Jun 2025 19:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z3pRv7Io"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E384CA6F;
	Fri, 27 Jun 2025 19:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751053073; cv=none; b=i6HrO9X2mCWnyPKtiHM+KiQbsk0tC2LMh5Ny0loFV2i8+Ahu7C3CEKD9xTxtr3phfoQYOzd1q6109UYDugSWe6RnbnYiNPxqiKUnWgtBFWZOSlonRRAZ9Ln/xQ+YBwA7U+SWkr/c+Y4BzKy8vxicF0H2pSxZNM76WFBtjkuQXXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751053073; c=relaxed/simple;
	bh=QsKEoHiFVzOI3xTTMVDtFR632S9Ue4yTQnf9XjQPQbM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YFhU2z1pfdhV/2VBoyw/MxLqsACSu3dSsHroOJvJPYtBpndzI/o6ULNijLMGtvg1il/9skTLw/HMmsy44y1MA0fotG1rw62/H8NSx9L+JdjIO/SS7rQ/7FJSUVGfqofByJS6ppRkrZqobig1BmvSfnzLkhhdRp9ehDPq1h8P2F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z3pRv7Io; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a365a6804eso1491347f8f.3;
        Fri, 27 Jun 2025 12:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751053069; x=1751657869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g6UATK77j2UR8lm3BqkGelAShsVphU+SHXJTi+vfoC0=;
        b=Z3pRv7IoaFQ0biT/Nb444vxV2Dw+eXpp64TZKUDa+aJEUt170hdM8B43dYBP12JqDh
         9TuUAizvzEoSqxPLu3EsFp8LgpGhCHDodtc6y0MLpkjdLtHJaWaBu5/jOyrOmnkILWeP
         vQ29Xh3kbWNWYvGutdHw/slZDfHFrNxjUQ/rru0+8QHz0SPV+6s9H8yrbb1PsFTsgSc7
         e905uJT5SLnQxR+m/ZidI5dO+vCeXf/LISSaXqLxp3nUDb0rbFna2v9TZ10veMMGD7pg
         zxIBg2+9RSHWT9Hzy+QXcJkosJ8VTRALoFHjNUcM/ZPjJFq+DcLsHiDGjnW5I/PAe9lZ
         Y80w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751053069; x=1751657869;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g6UATK77j2UR8lm3BqkGelAShsVphU+SHXJTi+vfoC0=;
        b=HRiTPNNgA309U/20pk7xn1yqUa5hlwYxx+1qT+zj0S+oNq/xNLEcTjsm8Zr0GEm/lL
         gRponaTDAyIguAG/fJ4oie2FWJKGQ42Tc08VBr9QWEsWIwWD+9rBX4zM14DY51YhXvmb
         zVBpo1mjnaS3livc1Of7nnHwvQpbmSb6VUqqBvsJ9wbx2u4KoG070iIhWVaUyU1lbgLi
         Cr4Vud701sTYuUZq5P6CE3bUTkSz89bt44nKXzEeBkxy6KIjfr9svtNDNZJxeMlVk8Ni
         8cwKTLK6SeE1rqmSASTQIrxwkO/YzEbJCdnWz9pedxUHpzVMx2eVnoQ16u92wfOpuC7a
         NI+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVt93AwwHtmJKXfV0U2m8YU6BxlsqZiqMAqMLFx+UnkggdLDTlGaU5AW+2dyhfRa/cH6uGni+vUC2wL@vger.kernel.org, AJvYcCXq/jQrqtHWvL9h7L75y8yZ0CPuX9fcUGeXN/8x/EITsnvJfiL4Zmi81J6r3Tf9QBCjoQlJhUojS3wHDkJe@vger.kernel.org
X-Gm-Message-State: AOJu0Ywr3rKKQntoKpjKqHuVIcjsJuuSF3Gsh9LSvYbc9X074EW7p/hQ
	MGJlpeE5ueJqDXoeKBwCGbdJ1DGYOMs06NxPBcun/cOstnKdubje6twx
X-Gm-Gg: ASbGncsMb5831v65f7JB4oYW0+Bg3Lx6SU9A76IR/VE3kDncpv4EkwiAOHr0nRUBlxI
	7/aI9u3FKClkReVyhN/ZSI1drCwQynmc9PmrHgI3BK/Cvw31oHc4eczkNjSRIHQSmTKpumAJ+8G
	orx7fDRaJZ5MZiwpx9kmr3y6PhscE8czmGKi8X/kdswyMUL7o7BeWptljkJ+1lYc3haQjGKMD4U
	PsAZ0xulfGKjj0bal54oLCJW4v9ltPtBKkfM6mLksEf1p4a5wF5XC7uJ9PbCLffYDiAE7+1G16k
	L0IyjtQTtlSrXTmV94XEZLHHTBlyhb4x+V9dqhSVTqKxOKKzxHvKn5pVCvyu0FqyG03OwApQhY1
	eHyJRexzEFg==
X-Google-Smtp-Source: AGHT+IGC0da65duViHnDfkfAebSVTHM6+4k8/8KXJio9pRCWNfhIsTIL1HsENW8P8+OcvZBGMksngw==
X-Received: by 2002:a5d:584a:0:b0:3a4:e844:745d with SMTP id ffacd0b85a97d-3a90be8d151mr4389783f8f.56.1751053069135;
        Fri, 27 Jun 2025 12:37:49 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:3b46:edb1:4d0:593b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a3fe28dsm59655315e9.20.2025.06.27.12.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 12:37:48 -0700 (PDT)
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
Subject: [PATCH v2] arm64: dts: renesas: Add CN15 eMMC and SD overlays for RZ/V2H and RZ/V2N EVKs
Date: Fri, 27 Jun 2025 20:37:42 +0100
Message-ID: <20250627193742.110818-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Introduce device tree overlays for supporting the eMMC (RTK0EF0186B02000BJ)
and microSD (RTK0EF0186B01000BJ) sub-boards connected via the CN15
connector on the RZ/V2H and RZ/V2N evaluation kits.

These overlays enable SDHI0 with appropriate pin control settings, power
regulators, and GPIO handling. Both sub-boards are supported using shared
overlay files that can be applied to either EVK due to their identical
connector layout and interface support.

To support this, new DT overlay files are added:
- `rzv2-evk-cn15-emmc.dtso` for eMMC
- `rzv2-evk-cn15-sd.dtso` for microSD

Additionally, the base DTS files for both EVKs are updated to include a
fixed 1.8V regulator (`reg_1p8v`) needed by the eMMC sub-board and
potential future use cases such as HDMI output.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2:
- Dropped patch 2/3 from previous series as that has been merged.
- Dropped adding alias in base DTS instead added in overlay.
- Switched to using single overlay files for both RZ/V2H and RZ/V2N EVKs
  instead of separate overlays for each EVK.
- Used RZG2L_GPIO and RZG2L_PORT_PINMUX to avoid using SoC specific
  macros.
---
 arch/arm64/boot/dts/renesas/Makefile          |  8 +++
 .../dts/renesas/r9a09g056n48-rzv2n-evk.dts    |  9 +++
 .../dts/renesas/r9a09g057h44-rzv2h-evk.dts    |  9 +++
 .../boot/dts/renesas/rzv2-evk-cn15-emmc.dtso  | 50 +++++++++++++
 .../boot/dts/renesas/rzv2-evk-cn15-sd.dtso    | 70 +++++++++++++++++++
 5 files changed, 146 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/rzv2-evk-cn15-emmc.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/rzv2-evk-cn15-sd.dtso

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 677ba3aa8931..a1bd652b58d1 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -161,8 +161,16 @@ r9a09g047e57-smarc-cru-csi-ov5645-dtbs := r9a09g047e57-smarc.dtb r9a09g047e57-sm
 dtb-$(CONFIG_ARCH_R9A09G047) += r9a09g047e57-smarc-cru-csi-ov5645.dtb
 
 dtb-$(CONFIG_ARCH_R9A09G056) += r9a09g056n48-rzv2n-evk.dtb
+dtb-$(CONFIG_ARCH_R9A09G056) += rzv2-evk-cn15-emmc.dtbo
+r9a09g056n48-rzv2-evk-cn15-emmc.dts := r9a09g056n48-rzv2n-evk.dtb rzv2-evk-cn15-emmc.dtbo
+dtb-$(CONFIG_ARCH_R9A09G056) += rzv2-evk-cn15-sd.dtbo
+r9a09g056n48-rzv2-evk-cn15-sd.dts := r9a09g056n48-rzv2n-evk.dtb rzv2-evk-cn15-sd.dtbo
 
 dtb-$(CONFIG_ARCH_R9A09G057) += r9a09g057h44-rzv2h-evk.dtb
+dtb-$(CONFIG_ARCH_R9A09G057) += rzv2-evk-cn15-emmc.dtbo
+r9a09g057h44-rzv2-evk-cn15-emmc.dts := r9a09g057h44-rzv2h-evk.dtb rzv2-evk-cn15-emmc.dtbo
+dtb-$(CONFIG_ARCH_R9A09G057) += rzv2-evk-cn15-sd.dtbo
+r9a09g057h44-rzv2-evk-cn15-sd.dts := r9a09g057h44-rzv2h-evk.dtb rzv2-evk-cn15-sd.dtbo
 dtb-$(CONFIG_ARCH_R9A09G057) += r9a09g057h48-kakip.dtb
 
 dtb-$(CONFIG_ARCH_RCAR_GEN3) += draak-ebisu-panel-aa104xd12.dtbo
diff --git a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
index 40014044bbc7..5829b9afaa95 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
@@ -48,6 +48,15 @@ reg_0p8v: regulator-0p8v {
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
diff --git a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
index ae021546d895..886ce31c1674 100644
--- a/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
+++ b/arch/arm64/boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts
@@ -55,6 +55,15 @@ reg_0p8v: regulator-0p8v {
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
 
diff --git a/arch/arm64/boot/dts/renesas/rzv2-evk-cn15-emmc.dtso b/arch/arm64/boot/dts/renesas/rzv2-evk-cn15-emmc.dtso
new file mode 100644
index 000000000000..eda2b31f6d79
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzv2-evk-cn15-emmc.dtso
@@ -0,0 +1,50 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Shared DT overlay for the eMMC Sub Board (RTK0EF0186B02000BJ), which
+ * is connected to the CN15 connector on the RZ/V2H and RZ/V2N EVKs.
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
+	aliases {
+		mmc0 = "/soc/mmc@15c00000";
+	};
+};
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
diff --git a/arch/arm64/boot/dts/renesas/rzv2-evk-cn15-sd.dtso b/arch/arm64/boot/dts/renesas/rzv2-evk-cn15-sd.dtso
new file mode 100644
index 000000000000..3e823b4093f5
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzv2-evk-cn15-sd.dtso
@@ -0,0 +1,70 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Shared DT overlay for the microSD Sub Board (RTK0EF0186B01000BJ), which
+ * is connected to the CN15 connector on the RZ/V2H and RZ/V2N EVKs.
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
+	aliases {
+		mmc0 = "/soc/mmc@15c00000";
+	};
+
+	vqmmc_sdhi0: regulator-vqmmc-sdhi0 {
+		compatible = "regulator-gpio";
+		regulator-name = "SDHI0 VqmmC";
+		gpios = <&pinctrl RZG2L_GPIO(10, 0) GPIO_ACTIVE_HIGH>;
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
+		gpios = <RZG2L_GPIO(10, 1) GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "sd0_pwr_en";
+	};
+
+	sdhi0_pins: sd0 {
+		sd0-cd {
+			pinmux = <RZG2L_PORT_PINMUX(10, 5, 15)>; /* SD0_CD */
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
+
-- 
2.49.0


