Return-Path: <linux-renesas-soc+bounces-3159-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 500788626F7
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 24 Feb 2024 20:19:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D00E72829B6
	for <lists+linux-renesas-soc@lfdr.de>; Sat, 24 Feb 2024 19:19:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D84A487A7;
	Sat, 24 Feb 2024 19:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="ZzUB+pcU"
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FB94C60B
	for <linux-renesas-soc@vger.kernel.org>; Sat, 24 Feb 2024 19:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708802378; cv=none; b=SFnL6ouNXd2ix8ED5Z/IzcMleVGYzSw0FE0ihrJGNqtdcgufBBFA0BnZ9xLmn4rg4Dfcrx1J2WOUcQio5g7LIHdEqhFLU+KKUMOTx5Nl69fhVzzOi+BdWg8kS/EYnpZJrxRV3dQzBO029vWAOQ6fRsVXY/X/6LI4dIyG2DDXsQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708802378; c=relaxed/simple;
	bh=4LQYSc7GFsrm1TvldZ6buKCHCVGR6zDXQtiaBR+wN7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QdNssjf/1n4YQ/8K4yYzzFV3mD9PIPTXh4Qosm+agIcsrMGE+7M8sVpQVMXtUF6YL2N7q1FvWYAljX/2uBMVQxzdlh0EN/R4UE844OlCnc7T2H7y7PQuaDpqHZj6TTVu26B+W+CiZz5zQvTClRwd7sxgpwIW8wAuBLNbh5WZjm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=ZzUB+pcU; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a3e5d82ad86so263960366b.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 24 Feb 2024 11:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech.se; s=google; t=1708802373; x=1709407173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ETFFJxQSBbyZGvl8EQoSQ5mDMb1hGsckWby0hRuDh5s=;
        b=ZzUB+pcU7I1GO2jl4l5ZHJYOnker+z3B+fW4PodIIru8WUJdJxH3LEND3tRtDuIRd6
         Y1GW8lszOYF/ZGGoyKg06QoBGptui9Dmsk822ctZTrmkMHaArqqckpDJnafbSTicKiHp
         j5upGtwyBpt4zLBEQUrVwkbs144Rsdnvg1cafZes44HNI8C2wz8HVZL2lrdpZ8B1ph1N
         2BfHNKKljIMMrwq9iW0B0zOyPOz/VJb4qUJaAzeAmD3l+CznB3lN5WsLSr1zyb+MMOtt
         2JkM3IwzFrgB4meqejGIE6UuMAK1KGLX43VdvlFjd6haChC5EvkWOHyk7dV+SP76BMfa
         pvkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708802373; x=1709407173;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ETFFJxQSBbyZGvl8EQoSQ5mDMb1hGsckWby0hRuDh5s=;
        b=L/cmtAteGxX2hHDChsz1BW0fIuHiax168QCGXotcYoTDIl/dbSgrd13WxQpQTDD2zv
         rTS/EKmEUGrqAXLTInWi2h90FJ3/VC3uMJP+FbNDu3HaGdhMlQglBzXRMaYSbuSpH9XJ
         kv2zsEbseysAok+1NQxj+yzZcPVcSfU48s7J1FwPn8Lj5u9xGzEdEjTzeRgcFbD+b/P9
         XNvfi1YRjYhrUXBVvwuCsF1WKpvX9TBtwXZ6KRtBXUafQD9X6SfEttB3DX0H79KQJoZt
         Wx7KQaxPrHpyZBHCha+1Ig2Zj2aDjBti0QOzq6/Xyh1LA2iH7RN/83PdVOoNHvs4kfgA
         dVgA==
X-Gm-Message-State: AOJu0YxwV2WAShkvNViHqcQIWra0ZowbxYGTCtbsehwxA7MiGNVjLKvI
	/javQcuMMaCkj7uA/Kv8ie5sZOwMIyBQls3NucwRjsmMp6+nv17CeBn/lsmJ8+8=
X-Google-Smtp-Source: AGHT+IExpyLk2T7iD3ENjztwYmuOchtgvMUTZhZGECHxp79S+6V+n3UkR2k6nEUR/SNFFWUxwSL0Vw==
X-Received: by 2002:a17:906:410a:b0:a43:18c1:19c with SMTP id j10-20020a170906410a00b00a4318c1019cmr115525ejk.73.1708802372474;
        Sat, 24 Feb 2024 11:19:32 -0800 (PST)
Received: from sleipner.berto.se (p4fcc8c6a.dip0.t-ipconnect.de. [79.204.140.106])
        by smtp.googlemail.com with ESMTPSA id vb5-20020a170907d04500b00a415674dd16sm828116ejc.3.2024.02.24.11.19.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Feb 2024 11:19:31 -0800 (PST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2] arm64: dts: renesas: eagle: Add capture overlay for function expansion board
Date: Sat, 24 Feb 2024 20:19:02 +0100
Message-ID: <20240224191902.2065733-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.43.2
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The Eagle board supports an optional "Function expansion board". The
expansion board adds support for HDMI OUT, HDMI capture from two
different sources and eMMC.

This change only adds support for the two HDMI capture sources.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
* Changes since v1
- The board is named "Function expansion board", update all references.
- Rename the over lay to r8a77970-eagle-function-expansion.dtso.
- Add r8a77970-eagle-expansion.dtbo to dtb-$(CONFIG_ARCH_R8A77970) so
  it's considered for installation.
- Move #include statements below /.../; markers.
- Sort nodes without addresses in alphabetical order.
- Capitalize i2c -> I2C in comments.
- Use symbolic values for GPIO flags.
- Adjust gpios and output-{low,high} to match that the signal is
  active-low.
- Correct misspelled label and removed unneeded ones.
---
 arch/arm64/boot/dts/renesas/Makefile          |   3 +
 .../r8a77970-eagle-function-expansion.dtso    | 214 ++++++++++++++++++
 2 files changed, 217 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a77970-eagle-function-expansion.dtso

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 8ea68d582710..a7d98f286e40 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -62,6 +62,9 @@ dtb-$(CONFIG_ARCH_R8A77965) += r8a77965-ulcb.dtb
 dtb-$(CONFIG_ARCH_R8A77965) += r8a77965-ulcb-kf.dtb
 
 dtb-$(CONFIG_ARCH_R8A77970) += r8a77970-eagle.dtb
+dtb-$(CONFIG_ARCH_R8A77970) += r8a77970-eagle-function-expansion.dtbo
+r8a77970-eagle-function-expansion-dtbs := r8a77970-eagle.dtb r8a77970-eagle-function-expansion.dtbo
+dtb-$(CONFIG_ARCH_R8A77970) += r8a77970-eagle-function-expansion.dtb
 dtb-$(CONFIG_ARCH_R8A77970) += r8a77970-v3msk.dtb
 
 dtb-$(CONFIG_ARCH_R8A77980) += r8a77980-condor.dtb
diff --git a/arch/arm64/boot/dts/renesas/r8a77970-eagle-function-expansion.dtso b/arch/arm64/boot/dts/renesas/r8a77970-eagle-function-expansion.dtso
new file mode 100644
index 000000000000..3aa243c5f04c
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a77970-eagle-function-expansion.dtso
@@ -0,0 +1,214 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the Eagle V3M Function expansion board.
+ *
+ * Copyright (C) 2024 Niklas Söderlund <niklas.soderlund@ragnatech.se>
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+/ {
+	/* CN4 */
+	/* Eagle: SW18 set to OFF */
+	cvbs-in-cn4 {
+		compatible = "composite-video-connector";
+		label = "CVBS IN CN4";
+
+		port {
+			cvbs_con: endpoint {
+				remote-endpoint = <&adv7482_ain7>;
+			};
+		};
+	};
+
+	/* CN2 */
+	/* Eagle: SW35 set 5, 6 and 8 to OFF */
+	hdmi-in-cn2 {
+		compatible = "hdmi-connector";
+		label = "HDMI IN CN2";
+		type = "a";
+
+		port {
+			hdmi_in_con2: endpoint {
+				remote-endpoint = <&adv7612_in>;
+			};
+		};
+	};
+
+	/* CN3 */
+	/* Eagle: SW18 set to OFF */
+	hdmi-in-cn3 {
+		compatible = "hdmi-connector";
+		label = "HDMI IN CN3";
+		type = "a";
+
+		port {
+			hdmi_in_con: endpoint {
+				remote-endpoint = <&adv7482_hdmi>;
+			};
+		};
+	};
+};
+
+/* Disconnect MAX9286 GMSL I2C. */
+&i2c3 {
+	status = "disabled";
+};
+
+/* Connect expansion board I2C. */
+&i2c0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	gpio@27 {
+		compatible = "onnn,pca9654";
+		reg = <0x27>;
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		vin0_adv7612_en {
+			gpio-hog;
+			gpios = <3 GPIO_ACTIVE_LOW>;
+			output-high;
+			line-name = "VIN0_ADV7612_ENn";
+		};
+	};
+
+	hdmi-decoder@4c {
+		compatible = "adi,adv7612";
+		reg = <0x4c>, <0x50>, <0x52>, <0x54>, <0x56>, <0x58>;
+		reg-names = "main", "afe", "rep", "edid", "hdmi", "cp";
+		interrupt-parent = <&gpio3>;
+		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
+		default-input = <0>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				adv7612_in: endpoint {
+					remote-endpoint = <&hdmi_in_con2>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				adv7612_out: endpoint {
+					remote-endpoint = <&vin0_in>;
+				};
+			};
+		};
+	};
+
+	video-receiver@70 {
+		compatible = "adi,adv7482";
+		reg = <0x70 0x71 0x72 0x73 0x74 0x75
+		       0x60 0x61 0x62 0x63 0x64 0x65>;
+		reg-names = "main", "dpll", "cp", "hdmi", "edid", "repeater",
+			    "infoframe", "cbus", "cec", "sdp", "txa", "txb" ;
+		interrupt-parent = <&gpio3>;
+		interrupts = <03 IRQ_TYPE_LEVEL_LOW>, <04 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-names = "intrq1", "intrq2";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@7 {
+				reg = <7>;
+
+				adv7482_ain7: endpoint {
+					remote-endpoint = <&cvbs_con>;
+				};
+			};
+
+			port@8 {
+				reg = <8>;
+
+				adv7482_hdmi: endpoint {
+					remote-endpoint = <&hdmi_in_con>;
+				};
+			};
+
+			port@a {
+				reg = <10>;
+
+				adv7482_txa: endpoint {
+					clock-lanes = <0>;
+					data-lanes = <1 2 3 4>;
+					remote-endpoint = <&csi40_in>;
+				};
+			};
+		};
+	};
+
+};
+
+&csi40 {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			csi40_in: endpoint {
+				clock-lanes = <0>;
+				data-lanes = <1 2 3 4>;
+				remote-endpoint = <&adv7482_txa>;
+			};
+		};
+	};
+};
+
+&pfc {
+	vin0_pins_parallel: vin0 {
+		groups = "vin0_data12", "vin0_sync", "vin0_clk", "vin0_clkenb";
+		function = "vin0";
+	};
+};
+
+&vin0 {
+	status = "okay";
+
+	pinctrl-0 = <&vin0_pins_parallel>;
+	pinctrl-names = "default";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+
+			vin0_in: endpoint {
+				pclk-sample = <0>;
+				hsync-active = <0>;
+				vsync-active = <0>;
+				remote-endpoint = <&adv7612_out>;
+			};
+		};
+	};
+};
+
+&vin1 {
+	status = "okay";
+};
+
+&vin2 {
+	status = "okay";
+};
+
+&vin3 {
+	status = "okay";
+};
-- 
2.43.2


