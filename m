Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BF21E173DD4
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 28 Feb 2020 18:02:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725886AbgB1RCQ (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 28 Feb 2020 12:02:16 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:37781 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725876AbgB1RCQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Feb 2020 12:02:16 -0500
Received: by mail-wm1-f68.google.com with SMTP id a141so3992499wme.2;
        Fri, 28 Feb 2020 09:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YLiECJgyhguRX/IYrN5eINjBjUqtt9KK7ww1Qi9YDtY=;
        b=b8BsHJ2LJgJY1WGYJHBogfnTDtsu+0aEahsFyTNox1D9246LN6g7BvnnfJXJoJaIxs
         ojFct0Njohqj/snlt/wMHZvmhyY1TPnFlf2S9eGHnWai+G4fJC6zvQrKZ3dVN66zUPDr
         ufUn3p4Is/NtxJs2w4DSJf8vXbjEVO8PefT935o5rG6UfFls4/bl6gOyjoUN72dnGJtR
         okj6/piDhVTTlAEP+a3mf2a55gS7w+rGyRZZ3hfitkbfMM7AH4pU+t+xfVrQtkXO621O
         mXNuqdBvV3KI6zR2SEGlPGM9Zv5hpbbxXFC6tD2wvJPljejVugrOg1NJiZl7IY+qS0cr
         E7Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YLiECJgyhguRX/IYrN5eINjBjUqtt9KK7ww1Qi9YDtY=;
        b=m41vn9hns7sMJwaZejMOiPbT07qzgWpmZScTN1iRKXgUnIuz/NuqUumaye4n5n8rHL
         Qs92EFScT8GHNgwDuNxtUBgpNplCgEj1Vxp5ZQZUIB6XaSIsO9u/YZQB4PGTJglovOXj
         D6lnRTgD9ZWKnW0kgyieb9pyDeC12X9GPMxtQ0Wcc7RcaoCvcHKOCzp1bmtaKMWFEIYA
         zigeqtYu8qgp+tCa24U1J2drod0UjUE1lcstJSgBSicOW5/jVB+smpyau1fVZsJKOe5c
         OxJ+EKoeyAfUlHvhc+pu1qPjMTdR/gGZS2jpcPr/+nXMSCAXAQHZdk6QbTlhomLLjMiC
         m+KA==
X-Gm-Message-State: APjAAAWv/2wQo0JnN/yDv2wNxK/ESFwoYdU8Sz/NK32qLICahen/Xcdb
        AbrnajQugxRoGPYGQLb7F4U=
X-Google-Smtp-Source: APXvYqxp4IX5vvh8ILpZYbiv5KH01y9nScXcItz9tyaqFFcB/6VhWwqOYkco6NCmdMJlv5LKZNCJFA==
X-Received: by 2002:a1c:f60e:: with SMTP id w14mr5648797wmc.188.1582909333378;
        Fri, 28 Feb 2020 09:02:13 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2510:d000:3855:fd13:6b76:a11b])
        by smtp.gmail.com with ESMTPSA id q9sm5673058wrn.8.2020.02.28.09.02.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2020 09:02:12 -0800 (PST)
From:   Lad Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        devicetree@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] arm64: dts: renesas: r8a774c0-cat874: Add support for AISTARVISION MIPI Adapter V2.1
Date:   Fri, 28 Feb 2020 17:02:10 +0000
Message-Id: <20200228170210.18252-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds support AISTARVISION MIPI Adapter V2.1 board connected
to G2E board. Common file aistarvision-mipi-adapter-2.1.dtsi is created
which have the camera endpoint nodes with disabled status and in
r8a774c0-ek874-mipi-2.1.dts file VIN/CSI nodes are enabled. By default
imx219 endpoint is tied with CSI2.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
Geert/Rob since the imx219 driver is yet to make into mainline
but has been merged into media-subsystem I would like to take
this patch via media-tree.

 arch/arm64/boot/dts/renesas/Makefile          |  3 +-
 .../aistarvision-mipi-adapter-2.1.dtsi        | 98 +++++++++++++++++++
 .../dts/renesas/r8a774c0-ek874-mipi-2.1.dts   | 86 ++++++++++++++++
 3 files changed, 186 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/renesas/aistarvision-mipi-adapter-2.1.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 2153842321ce..9f5c53d62f5e 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -4,7 +4,8 @@ dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m-ex.dtb
 dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-hihope-rzg2n.dtb
 dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-hihope-rzg2n-ex.dtb
 dtb-$(CONFIG_ARCH_R8A774C0) += r8a774c0-cat874.dtb r8a774c0-ek874.dtb \
-			       r8a774c0-ek874-idk-2121wr.dtb
+			       r8a774c0-ek874-idk-2121wr.dtb \
+			       r8a774c0-ek874-mipi-2.1.dtb
 dtb-$(CONFIG_ARCH_R8A7795) += r8a77950-salvator-x.dtb
 dtb-$(CONFIG_ARCH_R8A7795) += r8a77950-ulcb.dtb r8a77950-ulcb-kf.dtb
 dtb-$(CONFIG_ARCH_R8A7795) += r8a77951-salvator-x.dtb r8a77951-salvator-xs.dtb
diff --git a/arch/arm64/boot/dts/renesas/aistarvision-mipi-adapter-2.1.dtsi b/arch/arm64/boot/dts/renesas/aistarvision-mipi-adapter-2.1.dtsi
new file mode 100644
index 000000000000..e098a13e6345
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/aistarvision-mipi-adapter-2.1.dtsi
@@ -0,0 +1,98 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the AISTARVISION MIPI Adapter V2.1
+ *
+ * Copyright (C) 2020 Renesas Electronics Corp.
+ */
+
+/ {
+	ov5645_vdddo_1v8: 1p8v {
+		compatible = "regulator-fixed";
+		regulator-name = "camera_vdddo";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+
+	ov5645_vdda_2v8: 2p8v {
+		compatible = "regulator-fixed";
+		regulator-name = "camera_vdda";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		regulator-always-on;
+	};
+
+	ov5645_vddd_1v5: 1p5v {
+		compatible = "regulator-fixed";
+		regulator-name = "camera_vddd";
+		regulator-min-microvolt = <1500000>;
+		regulator-max-microvolt = <1500000>;
+		regulator-always-on;
+	};
+
+	imx219_vana_2v8: 2p8v {
+		compatible = "regulator-fixed";
+		regulator-name = "camera_vana";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		regulator-always-on;
+	};
+
+	imx219_vdig_1v8: 1p8v {
+		compatible = "regulator-fixed";
+		regulator-name = "camera_vdig";
+		regulator-min-microvolt = <1500000>;
+		regulator-max-microvolt = <1500000>;
+		regulator-always-on;
+	};
+
+	imx219_vddl_1v2: 1p2v {
+		compatible = "regulator-fixed";
+		regulator-name = "camera_vddl";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		regulator-always-on;
+	};
+
+	imx219_clk: imx219_clk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+	};
+};
+
+&MIPI_PARENT_I2C {
+	ov5645: ov5645@3c {
+		compatible = "ovti,ov5645";
+		reg = <0x3c>;
+		status = "disabled";
+
+		clock-names = "xclk";
+
+		vdddo-supply = <&ov5645_vdddo_1v8>;
+		vdda-supply = <&ov5645_vdda_2v8>;
+		vddd-supply = <&ov5645_vddd_1v5>;
+
+		port@0 {
+			ov5645_ep: endpoint {
+			};
+		};
+	};
+
+	rpi_v2_camera: imx219@10 {
+		compatible = "sony,imx219";
+		reg = <0x10>;
+		status = "disabled";
+
+		VANA-supply = <&imx219_vana_2v8>;
+		VDIG-supply = <&imx219_vdig_1v8>;
+		VDDL-supply = <&imx219_vddl_1v2>;
+		clocks = <&imx219_clk>;
+
+		port@0 {
+			reg = <0>;
+			imx219_ep0: endpoint {
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dts b/arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dts
new file mode 100644
index 000000000000..435b7f62d88d
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dts
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the Silicon Linux RZ/G2E 96board platform (CAT874)
+ * connected with aistarvision-mipi-v2-adapter board
+ *
+ * Copyright (C) 2020 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+#include "r8a774c0-ek874.dts"
+#define MIPI_PARENT_I2C i2c3
+#include "aistarvision-mipi-adapter-2.1.dtsi"
+
+/ {
+	model = "Silicon Linux RZ/G2E evaluation kit EK874 (CAT874 + CAT875) with aistarvision-mipi-v2-adapter board";
+	compatible = "si-linux,cat875", "si-linux,cat874", "renesas,r8a774c0";
+};
+
+&i2c3 {
+	status = "okay";
+};
+
+&vin4 {
+	status = "okay";
+};
+
+&vin5 {
+	status = "okay";
+};
+
+&csi40 {
+	status = "okay";
+
+	ports {
+		port@0 {
+			reg = <0>;
+
+			csi40_in: endpoint {
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+				remote-endpoint = <&imx219_ep0>;
+			};
+		};
+	};
+};
+
+&ov5645 {
+	/* uncomment status and remote-endpoint properties to tie ov5645
+	 * to CSI2 also make sure remote-endpoint for imx219 camera is
+	 * commented and remote endpoint in csi40_in is ov5645_ep
+	 */
+	/* status = "okay"; */
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+	enable-gpios = <&gpio5 5 GPIO_ACTIVE_HIGH>;
+	reset-gpios = <&gpio5 3 GPIO_ACTIVE_LOW>;
+
+	clocks = <&cpg CPG_MOD 716>;
+	clock-frequency = <24000000>;
+
+	port@0 {
+		ov5645_ep: endpoint {
+			clock-lanes = <0>;
+			data-lanes = <1 2>;
+			/* remote-endpoint = <&csi40_in>; */
+		};
+	};
+};
+
+&rpi_v2_camera {
+	status = "okay";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	port@0 {
+		reg = <0>;
+		imx219_ep0: endpoint {
+			clock-lanes = <0>;
+			data-lanes = <1 2>;
+			remote-endpoint = <&csi40_in>;
+			link-frequencies = /bits/ 64 <456000000>;
+		};
+	};
+};
-- 
2.20.1

