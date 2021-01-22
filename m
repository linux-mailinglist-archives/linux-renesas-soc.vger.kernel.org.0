Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACDB33001B5
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Jan 2021 12:37:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727096AbhAVLg4 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Fri, 22 Jan 2021 06:36:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728183AbhAVLgX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 22 Jan 2021 06:36:23 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 746B0C061793
        for <linux-renesas-soc@vger.kernel.org>; Fri, 22 Jan 2021 03:34:35 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by baptiste.telenet-ops.be with bizsmtp
        id KnaV2400D4C55Sk01naV3W; Fri, 22 Jan 2021 12:34:32 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1l2uhw-005lFc-Qj; Fri, 22 Jan 2021 12:34:28 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1l2uhw-00Bt2Y-7W; Fri, 22 Jan 2021 12:34:28 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Prabhakar <prabhakar.csengg@gmail.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v5 2/2] ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Add support for 8-bit ov7725 sensors
Date:   Fri, 22 Jan 2021 12:34:24 +0100
Message-Id: <20210122113424.2833127-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210122113424.2833127-1-geert+renesas@glider.be>
References: <20210122113424.2833127-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The 8-bit ov7725 sensors can also be connected to the camera daughter
board.

This patch creates a separate dtsi file to describe an ov7725 sensor,
and includes it multiple times in r8a7742-iwg21d-q7-dbcm-ca.dts. The
user can (un)comment #include statements depending on the cameras
connected.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
[geert: describe a single camera in the .dtsi, include multiple times]
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v5:
  - Enable parent i2c bus when needed,

v4:
  - Describe a single camera in the .dtsi file,
  - Include the .dtsi multiple times.
---
 .../boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts    |  6 +++-
 .../r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi | 29 +++++++++++++++++++
 2 files changed, 34 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi

diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
index bc8280b2ac47e3ec..2bcb229844abc5c2 100644
--- a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
+++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
@@ -198,7 +198,7 @@ &scifb1 {
 /*
  * Below configuration ties VINx endpoints to ov5640/ov7725 camera endpoints
  *
- * Uncomment the #include statements to change configuration
+ * (un)comment the #include statements to change configuration
  */
 
 /* 8bit CMOS Camera 1 (J13) */
@@ -208,6 +208,7 @@ &scifb1 {
 #define VIN_EP			vin0ep
 #undef CAM_ENABLED
 #include "r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi"
+//#include "r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi"
 
 #ifdef CAM_ENABLED
 &vin0 {
@@ -241,6 +242,7 @@ vin0ep: endpoint {
 #define VIN_EP			vin1ep
 #undef CAM_ENABLED
 #include "r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi"
+//#include "r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi"
 
 #ifdef CAM_ENABLED
 &vin1 {
@@ -272,6 +274,7 @@ vin1ep: endpoint {
 #define VIN_EP			vin2ep
 #undef CAM_ENABLED
 #include "r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi"
+//#include "r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi"
 
 #ifdef CAM_ENABLED
 &vin2 {
@@ -302,6 +305,7 @@ vin2ep: endpoint {
 #define VIN_EP			vin3ep
 #undef CAM_ENABLED
 #include "r8a7742-iwg21d-q7-dbcm-ov5640-single.dtsi"
+//#include "r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi"
 
 #ifdef CAM_ENABLED
 &vin3 {
diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi
new file mode 100644
index 0000000000000000..f5e77f0242516720
--- /dev/null
+++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * This include file ties a VIN interface with a single ov7725 sensor on
+ * the iWave-RZ/G1H Qseven board development platform connected with the
+ * camera daughter board.
+ *
+ * Copyright (C) 2020 Renesas Electronics Corp.
+ */
+
+#define CAM_ENABLED	1
+
+&CAM_PARENT_I2C {
+	status = "okay";
+
+	ov7725@21 {
+		compatible = "ovti,ov7725";
+		reg = <0x21>;
+		clocks = <&MCLK_CAM>;
+		status = "okay";
+
+		port {
+			CAM_EP: endpoint {
+				bus-width = <8>;
+				bus-type = <6>;
+				remote-endpoint = <&VIN_EP>;
+			};
+		};
+	};
+};
-- 
2.25.1

