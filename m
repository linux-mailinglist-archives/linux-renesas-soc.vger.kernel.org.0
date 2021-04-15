Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55B35360952
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 Apr 2021 14:25:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232877AbhDOM0M (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 15 Apr 2021 08:26:12 -0400
Received: from relay5-d.mail.gandi.net ([217.70.183.197]:42345 "EHLO
        relay5-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232892AbhDOM0G (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 15 Apr 2021 08:26:06 -0400
X-Originating-IP: 93.61.96.190
Received: from uno.LocalDomain (93-61-96-190.ip145.fastwebnet.it [93.61.96.190])
        (Authenticated sender: jacopo@jmondi.org)
        by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id E0F6E1C0012;
        Thu, 15 Apr 2021 12:25:40 +0000 (UTC)
From:   Jacopo Mondi <jacopo+renesas@jmondi.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 6/7] arm64: dts: renesas: eagle: Add GMSL .dtsi
Date:   Thu, 15 Apr 2021 14:26:01 +0200
Message-Id: <20210415122602.87697-7-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210415122602.87697-1-jacopo+renesas@jmondi.org>
References: <20210415122602.87697-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Kieran Bingham <kieran.bingham@ideasonboard.com>

Describe the FAKRA connector available on Eagle board that allows
connecting GMSL camera modules such as IMI RDACM20 and RDACM21.

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 arch/arm64/boot/dts/renesas/eagle-gmsl.dtsi | 178 ++++++++++++++++++++
 1 file changed, 178 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/eagle-gmsl.dtsi

diff --git a/arch/arm64/boot/dts/renesas/eagle-gmsl.dtsi b/arch/arm64/boot/dts/renesas/eagle-gmsl.dtsi
new file mode 100644
index 000000000000..d2e48dc3e820
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/eagle-gmsl.dtsi
@@ -0,0 +1,178 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Device Tree Source (overlay) for the Eagle V3M GMSL connectors
+ *
+ * Copyright (C) 2017 Ideas on Board <kieran.bingham@ideasonboard.com>
+ * Copyright (C) 2021 Jacopo Mondi <jacopo+renesas@jmondi.org>
+ *
+ * This overlay allows you to define GMSL cameras connected to the FAKRA
+ * connectors on the Eagle-V3M (or compatible) board.
+ *
+ * The following cameras are currently supported: RDACM20 and RDACM21.
+ *
+ * The board .dts files that include this select which cameras are in use
+ * by specifying the camera model with:
+ *
+ * #define GMSL_CAMERA_RDACM20
+ * or
+ * #define GMSL_CAMERA_RDACM21
+ *
+ * And which cameras are connected to the board by defining:
+ * #define GMSL_CAMERA_0
+ * #define GMSL_CAMERA_1
+ * #define GMSL_CAMERA_2
+ * #define GMSL_CAMERA_3
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+
+/* Validate the board file settings. */
+#if !defined(GMSL_CAMERA_RDACM20) && !defined(GMSL_CAMERA_RDACM21)
+#error "Camera model should be defined by the board file"
+#endif
+
+#if defined(GMSL_CAMERA_RDACM20) && defined(GMSL_CAMERA_RDACM21)
+#error "A single camera model should be selected"
+#endif
+
+#if !defined(GMSL_CAMERA_0) && !defined(GMSL_CAMERA_1) && \
+    !defined(GMSL_CAMERA_2) && !defined(GMSL_CAMERA_3)
+#error "At least one camera should be selected"
+#endif
+
+#if defined(GMSL_CAMERA_RDACM20)
+#define GMSL_CAMERA_MODEL "imi,rdacm20"
+#elif defined(GMSL_CAMERA_RDACM21)
+#define GMSL_CAMERA_MODEL "imi,rdacm21"
+#endif
+
+&vin0 {
+	status = "okay";
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
+
+&gmsl {
+	status = "okay";
+
+#if defined(GMSL_CAMERA_RDACM21)
+	maxim,reverse-channel-microvolt = <100000>;
+#endif
+
+	ports {
+#ifdef GMSL_CAMERA_0
+		port@0 {
+			max9286_in0: endpoint {
+				remote-endpoint = <&fakra_con0>;
+			};
+		};
+#endif
+
+#ifdef GMSL_CAMERA_1
+		port@1 {
+			max9286_in1: endpoint{
+				remote-endpoint = <&fakra_con1>;
+			};
+
+		};
+#endif
+
+#ifdef GMSL_CAMERA_2
+		port@2 {
+			max9286_in2: endpoint {
+				remote-endpoint = <&fakra_con2>;
+			};
+
+		};
+#endif
+
+#ifdef GMSL_CAMERA_3
+		port@3 {
+			max9286_in3: endpoint {
+				remote-endpoint = <&fakra_con3>;
+			};
+
+		};
+#endif
+	};
+
+	i2c-mux {
+#ifdef GMSL_CAMERA_0
+		i2c@0 {
+			status = "okay";
+
+			camera@51 {
+				compatible = GMSL_CAMERA_MODEL;
+				reg = <0x51>, <0x61>;
+
+				port {
+					fakra_con0: endpoint {
+						remote-endpoint = <&max9286_in0>;
+					};
+				};
+			};
+		};
+#endif
+
+#ifdef GMSL_CAMERA_1
+		i2c@1 {
+			status = "okay";
+
+			camera@52 {
+				compatible = GMSL_CAMERA_MODEL;
+				reg = <0x52>, <0x62>;
+
+				port {
+					fakra_con1: endpoint {
+						remote-endpoint = <&max9286_in1>;
+					};
+				};
+			};
+		};
+#endif
+
+#ifdef GMSL_CAMERA_2
+		i2c@2 {
+			status = "okay";
+
+			camera@53 {
+				compatible = GMSL_CAMERA_MODEL;
+				reg = <0x53>, <0x63>;
+
+				port {
+					fakra_con2: endpoint {
+						remote-endpoint = <&max9286_in2>;
+					};
+				};
+			};
+		};
+#endif
+
+#ifdef GMSL_CAMERA_3
+		i2c@3 {
+			status = "okay";
+
+			camera@54 {
+				compatible = GMSL_CAMERA_MODEL;
+				reg = <0x54>, <0x64>;
+
+				port {
+					fakra_con3: endpoint {
+						remote-endpoint = <&max9286_in3>;
+					};
+				};
+			};
+		};
+#endif
+	};
+};
-- 
2.31.1

