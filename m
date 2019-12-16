Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A52DF120278
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 16 Dec 2019 11:29:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727334AbfLPK3l (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 16 Dec 2019 05:29:41 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:40692 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727070AbfLPK3l (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Dec 2019 05:29:41 -0500
Received: from localhost.localdomain (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 350221337;
        Mon, 16 Dec 2019 11:29:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1576492175;
        bh=AwMIOcVPhFepZBzd6Cs+5I+A4VMcBFPGk6l5fjeiHvo=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=HE25dDegrSi4641MKH6obzYKWAVELQ59k83zSt40yYs3NNv6qRndFwy8CAs5l08ow
         UaFESj2WoA0kQDERdPHnbE4lCQzCtFQMjrcxJI3ramKpWaA3GOOFsy7/3iUTNjYngk
         S13OyTE39lW3MTLGT37HBcf2syP3aorW/pklIK+I=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>, linux-renesas-soc@vger.kernel.org
Subject: [RFC PATCH v6 06/13] arm64: dts: renesas: eagle: Provide Eagle FAKRA dynamic overlay
Date:   Mon, 16 Dec 2019 10:29:23 +0000
Message-Id: <20191216102930.5867-7-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191216102930.5867-1-kieran.bingham+renesas@ideasonboard.com>
References: <20191211124459.20508-1-kieran.bingham+renesas@ideasonboard.com>
 <20191216102930.5867-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Kieran Bingham <kieran.bingham@ideasonboard.com>

This overlay currently supports either the RDACM20, or RDACM21 cameras
and can be included directly at the end of the Eagle-V3M dtb.

Ideally this would be an externally provided (and loaded) device tree
overlay (dto).

Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

---
v2:
 - Fix up SPDX header

v6:
 - Use new i2c-mux subnodes
 - Remove incorrect enable-gpio line
---
 arch/arm64/boot/dts/renesas/eagle-fakra.dtsi | 128 +++++++++++++++++++
 1 file changed, 128 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/eagle-fakra.dtsi

diff --git a/arch/arm64/boot/dts/renesas/eagle-fakra.dtsi b/arch/arm64/boot/dts/renesas/eagle-fakra.dtsi
new file mode 100644
index 000000000000..95acc535e230
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/eagle-fakra.dtsi
@@ -0,0 +1,128 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Device Tree Source (overlay) for the Eagle V3M FAKRA connectors
+ *
+ * Copyright (C) 2017 Ideas on Board <kieran.bingham@ideasonboard.com>
+ *
+ * This overlay allows you to define cameras connected to the FAKRA connectors
+ * on the Eagle-V3M (or compatible) board.
+ *
+ * Enable the cameras by specifying the camera compatible on the appropriate
+ * line. Comment out the defines to disconnect the camera from the DTB.
+ *
+ * The following cameras are currently supported:
+ *    "imi,rdacm20"
+ *    "imi,rdacm21"
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+
+#define EAGLE_CAMERA0 "imi,rdacm20"
+#define EAGLE_CAMERA1 "imi,rdacm20"
+#define EAGLE_CAMERA2 "imi,rdacm20"
+#define EAGLE_CAMERA3 "imi,rdacm20"
+
+/* Define the endpoint links */
+#ifdef EAGLE_CAMERA0
+&max9286_in0 {
+	remote-endpoint = <&fakra_con0>;
+};
+#endif
+
+#ifdef EAGLE_CAMERA1
+&max9286_in1 {
+	remote-endpoint = <&fakra_con1>;
+};
+#endif
+
+#ifdef EAGLE_CAMERA2
+&max9286_in2 {
+	remote-endpoint = <&fakra_con2>;
+};
+#endif
+
+#ifdef EAGLE_CAMERA3
+&max9286_in3 {
+	remote-endpoint = <&fakra_con3>;
+};
+#endif
+
+/* Cameras are 'attached' to the GMSL I2C busses */
+&gmsl {
+
+#if defined(EAGLE_CAMERA0) || defined(EAGLE_CAMERA1) || \
+    defined(EAGLE_CAMERA2) || defined(EAGLE_CAMERA3)
+	status = "okay";
+
+#endif
+
+	i2c-mux {
+#ifdef EAGLE_CAMERA0
+		i2c@0 {
+			status = "okay";
+
+			camera@51 {
+				compatible = EAGLE_CAMERA0;
+				reg = <0x51 0x61>;
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
+#ifdef EAGLE_CAMERA1
+		i2c@1 {
+			status = "okay";
+
+			camera@52 {
+				compatible = EAGLE_CAMERA1;
+				reg = <0x52 0x62>;
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
+#ifdef EAGLE_CAMERA2
+		i2c@2 {
+			status = "okay";
+
+			camera@53 {
+				compatible = EAGLE_CAMERA2;
+				reg = <0x53 0x63>;
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
+#ifdef EAGLE_CAMERA3
+		i2c@3 {
+			status = "okay";
+
+			camera@54 {
+				compatible = EAGLE_CAMERA3;
+				reg = <0x54 0x64>;
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
2.20.1

