Return-Path: <linux-renesas-soc+bounces-8243-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAC595EE4C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 12:17:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5E721F22CFC
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 26 Aug 2024 10:17:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67F5714430A;
	Mon, 26 Aug 2024 10:16:58 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E8262E414;
	Mon, 26 Aug 2024 10:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724667418; cv=none; b=pkpd7FtBjG+ptCvxMnk0nh1DGUOSKwT5gdJfVlGiXZJNZ2wpRLH1ggMWTNK/HWHPY5NoJjHCo9UAqF4VBBmfVnA8m8qH72OH5xLNxC8mlGrNqakph1NUhVSqBXLOH9X7purQSGXVz+3rL6BsZJkszTk84Sadcts2dqiJ3lVcu4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724667418; c=relaxed/simple;
	bh=qZjRLh+RtHvMIHihXdVJeuMNnPCPZE5w8LByGfMe224=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=W3t+4O8NMT2yEDMg/Ac6xr6wgHel/uPscP0tiE9ZW0XKBbDN1C4CVMPvhDRgs4l2ZREXjERXqZ/Acw41R/u0wVkYv97osfZPPiK3WjwTcE4fjGA2LBEJhrmkA349eyCc6eD+Av2RkLjgJUoxFbDwWHqMUoRjeERYyjDXsYkKsBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.10,177,1719846000"; 
   d="scan'208";a="220565150"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 26 Aug 2024 19:16:54 +0900
Received: from localhost.localdomain (unknown [10.226.92.68])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 6097941FEF73;
	Mon, 26 Aug 2024 19:16:51 +0900 (JST)
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
Subject: [PATCH v5] arm64: dts: renesas: r9a07g043u11-smarc: Enable DU
Date: Mon, 26 Aug 2024 11:16:46 +0100
Message-ID: <20240826101648.176647-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable DU and link with the HDMI add-on board connected with
the parallel connector on RZ/G2UL SMARC EV by using Device
Tree overlay.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v4->v5:
 * Created Overlay for ADV 7513 transmiiter connected to DU
v3->v4:
 * Restored ports property in du node and port@0 for DPI interface.
v2->v3:
 * Replaced ports->port in du node as it support only DPI output.
v1->v2:
 * No change.
---
 arch/arm64/boot/dts/renesas/Makefile          |  3 +
 .../r9a07g043u11-smarc-du-adv7513.dtso        | 62 +++++++++++++++
 .../boot/dts/renesas/rz-smarc-du-adv7513.dtsi | 75 +++++++++++++++++++
 3 files changed, 140 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g043u11-smarc-du-adv7513.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/rz-smarc-du-adv7513.dtsi

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index fbd214a1a638..fdf597e019d7 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -112,9 +112,12 @@ dtb-$(CONFIG_ARCH_R8A77965) += r8a779m5-salvator-xs-panel-aa104xd12.dtb
 
 dtb-$(CONFIG_ARCH_R9A07G043) += r9a07g043u11-smarc.dtb
 dtb-$(CONFIG_ARCH_R9A07G043) += r9a07g043u11-smarc-cru-csi-ov5645.dtbo
+dtb-$(CONFIG_ARCH_R9A07G043) += r9a07g043u11-smarc-du-adv7513.dtbo
 dtb-$(CONFIG_ARCH_R9A07G043) += r9a07g043-smarc-pmod.dtbo
 r9a07g043u11-smarc-cru-csi-ov5645-dtbs := r9a07g043u11-smarc.dtb r9a07g043u11-smarc-cru-csi-ov5645.dtbo
 dtb-$(CONFIG_ARCH_R9A07G043) += r9a07g043u11-smarc-cru-csi-ov5645.dtb
+r9a07g043u11-smarc-du-adv7513-dtbs := r9a07g043u11-smarc.dtb r9a07g043u11-smarc-du-adv7513.dtbo
+dtb-$(CONFIG_ARCH_R9A07G043) += r9a07g043u11-smarc-du-adv7513.dtb
 r9a07g043u11-smarc-pmod-dtbs := r9a07g043u11-smarc.dtb r9a07g043-smarc-pmod.dtbo
 dtb-$(CONFIG_ARCH_R9A07G043) += r9a07g043u11-smarc-pmod.dtb
 
diff --git a/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc-du-adv7513.dtso b/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc-du-adv7513.dtso
new file mode 100644
index 000000000000..ecd43a671000
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc-du-adv7513.dtso
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree overlay for the RZ/G2UL SMARC EVK with ADV7513 transmitter
+ * connected to DU enabled.
+ *
+ * Copyright (C) 2024 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
+
+#define ADV7513_PARENT_I2C i2c1
+#include "rz-smarc-du-adv7513.dtsi"
+
+&pinctrl {
+	du_pins: du {
+		data {
+			pinmux = <RZG2L_PORT_PINMUX(11, 2, 6)>,
+				 <RZG2L_PORT_PINMUX(13, 1, 6)>,
+				 <RZG2L_PORT_PINMUX(13, 0, 6)>,
+				 <RZG2L_PORT_PINMUX(13, 4, 6)>,
+				 <RZG2L_PORT_PINMUX(13, 3, 6)>,
+				 <RZG2L_PORT_PINMUX(12, 1, 6)>,
+				 <RZG2L_PORT_PINMUX(13, 2, 6)>,
+				 <RZG2L_PORT_PINMUX(14, 0, 6)>,
+				 <RZG2L_PORT_PINMUX(14, 2, 6)>,
+				 <RZG2L_PORT_PINMUX(14, 1, 6)>,
+				 <RZG2L_PORT_PINMUX(16, 0, 6)>,
+				 <RZG2L_PORT_PINMUX(15, 0, 6)>,
+				 <RZG2L_PORT_PINMUX(16, 1, 6)>,
+				 <RZG2L_PORT_PINMUX(15, 1, 6)>,
+				 <RZG2L_PORT_PINMUX(15, 3, 6)>,
+				 <RZG2L_PORT_PINMUX(18, 0, 6)>,
+				 <RZG2L_PORT_PINMUX(15, 2, 6)>,
+				 <RZG2L_PORT_PINMUX(17, 0, 6)>,
+				 <RZG2L_PORT_PINMUX(17, 2, 6)>,
+				 <RZG2L_PORT_PINMUX(17, 1, 6)>,
+				 <RZG2L_PORT_PINMUX(18, 1, 6)>,
+				 <RZG2L_PORT_PINMUX(18, 2, 6)>,
+				 <RZG2L_PORT_PINMUX(17, 3, 6)>,
+				 <RZG2L_PORT_PINMUX(18, 3, 6)>;
+			drive-strength = <2>;
+		};
+
+		sync {
+			pinmux = <RZG2L_PORT_PINMUX(11, 0, 6)>, /* HSYNC */
+				 <RZG2L_PORT_PINMUX(12, 0, 6)>; /* VSYNC */
+			drive-strength = <2>;
+		};
+
+		de {
+			pinmux = <RZG2L_PORT_PINMUX(11, 1, 6)>; /* DE */
+			drive-strength = <2>;
+		};
+
+		clk {
+			pinmux = <RZG2L_PORT_PINMUX(11, 3, 6)>; /* CLK */
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/renesas/rz-smarc-du-adv7513.dtsi b/arch/arm64/boot/dts/renesas/rz-smarc-du-adv7513.dtsi
new file mode 100644
index 000000000000..a10314c77f54
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rz-smarc-du-adv7513.dtsi
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Common Device Tree for the RZ/G2UL SMARC EVK (and alike EVKs) with
+ * ADV7513 transmitter connected to DU enabled.
+ *
+ * Copyright (C) 2024 Renesas Electronics Corp.
+ */
+
+&{/} {
+	hdmi-out {
+		compatible = "hdmi-connector";
+		type = "d";
+
+		port {
+			hdmi_con_out: endpoint {
+				remote-endpoint = <&adv7513_out>;
+			};
+		};
+	};
+};
+
+&du {
+	pinctrl-0 = <&du_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	ports {
+		port@0 {
+			du_out_rgb: endpoint {
+				remote-endpoint = <&adv7513_in>;
+			};
+		};
+	};
+};
+
+&ADV7513_PARENT_I2C {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	adv7513: adv7513@39 {
+		compatible = "adi,adv7513";
+		reg = <0x39>;
+
+		adi,input-depth = <8>;
+		adi,input-colorspace = "rgb";
+		adi,input-clock = "1x";
+
+		avdd-supply = <&reg_1p8v>;
+		dvdd-supply = <&reg_1p8v>;
+		pvdd-supply = <&reg_1p8v>;
+		dvdd-3v-supply = <&reg_3p3v>;
+		bgvdd-supply = <&reg_1p8v>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				adv7513_in: endpoint {
+					remote-endpoint = <&du_out_rgb>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				adv7513_out: endpoint {
+					remote-endpoint = <&hdmi_con_out>;
+				};
+			};
+		};
+	};
+};
-- 
2.43.0


