Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FE182C56F1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Nov 2020 15:21:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390372AbgKZOUn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 26 Nov 2020 09:20:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389684AbgKZOUm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Nov 2020 09:20:42 -0500
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4227BC0613D4
        for <linux-renesas-soc@vger.kernel.org>; Thu, 26 Nov 2020 06:20:42 -0800 (PST)
Received: from ramsan.of.borg ([84.195.186.194])
        by michel.telenet-ops.be with bizsmtp
        id x2Ld2300H4C55Sk062LdkD; Thu, 26 Nov 2020 15:20:37 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kiI8T-005s37-3W; Thu, 26 Nov 2020 15:20:37 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1kiHVh-00HGZJ-35; Thu, 26 Nov 2020 14:40:33 +0100
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Prabhakar <prabhakar.csengg@gmail.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v4 2/2] ARM: dts: r8a7742-iwg21d-q7-dbcm-ca: Add support for 8-bit ov7725 sensors
Date:   Thu, 26 Nov 2020 14:40:31 +0100
Message-Id: <20201126134031.4115211-3-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201126134031.4115211-1-geert@linux-m68k.org>
References: <20201126134031.4115211-1-geert@linux-m68k.org>
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
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
v4:
  - Describe a single camera in the .dtsi file,
  - Include the .dtsi multiple times,

 .../boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts    |  6 ++++-
 .../r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi | 27 +++++++++++++++++++
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi

diff --git a/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ca.dts
index 00634eb58ce39da5..4d95991bde09c28b 100644
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
index 0000000000000000..46a6832694d78aaa
--- /dev/null
+++ b/arch/arm/boot/dts/r8a7742-iwg21d-q7-dbcm-ov7725-single.dtsi
@@ -0,0 +1,27 @@
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

