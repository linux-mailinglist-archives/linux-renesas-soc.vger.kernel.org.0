Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88346C3402
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  1 Oct 2019 14:16:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733239AbfJAMQN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 1 Oct 2019 08:16:13 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:48654 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725821AbfJAMQN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Oct 2019 08:16:13 -0400
X-IronPort-AV: E=Sophos;i="5.64,571,1559487600"; 
   d="scan'208";a="28015487"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 01 Oct 2019 21:16:12 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id A76844243F52;
        Tue,  1 Oct 2019 21:16:09 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 8/8] arm64: dts: renesas: hihope-rzg2-ex: Add LVDS panel support
Date:   Tue,  1 Oct 2019 13:15:24 +0100
Message-Id: <1569932124-32010-9-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1569932124-32010-1-git-send-email-biju.das@bp.renesas.com>
References: <1569932124-32010-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds support for Advantech idk-1110wr LVDS panel.
The HiHope RZ/G2[MN] is advertised as compatible with panel idk-1110wr
from Advantech, however the panel isn't sold alongside the board.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi  | 30 +++++++++++++++++++
 arch/arm64/boot/dts/renesas/rzg2-panel-lvds.dtsi | 37 ++++++++++++++++++++++++
 2 files changed, 67 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2-panel-lvds.dtsi

diff --git a/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi b/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
index 70f9a2a..ae1ef2d 100644
--- a/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
+++ b/arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi
@@ -5,6 +5,8 @@
  * Copyright (C) 2019 Renesas Electronics Corp.
  */
 
+#include "rzg2-panel-lvds.dtsi"
+
 / {
 	aliases {
 		ethernet0 = &avb;
@@ -51,6 +53,34 @@
 	status = "okay";
 };
 
+&gpio1 {
+	/*
+	 * When GP1_20 is LOW LVDS0 is connected to the LVDS connector
+	 * When GP1_20 is HIGH LVDS0 is connected to the LT8918L
+	 */
+	lvds-connector-en-gpio {
+		gpio-hog;
+		gpios = <20 GPIO_ACTIVE_HIGH>;
+		output-low;
+		line-name = "lvds-connector-en-gpio";
+	};
+};
+
+&lvds0 {
+	/* Uncomment  below line to enable lvds panel connected to RZ/G2N board
+	 */
+
+	/* status = "okay"; */
+
+	ports {
+		port@1 {
+			lvds_connector: endpoint {
+				remote-endpoint = <&panel_in_advantech_idk_1110wr>;
+			};
+		};
+	};
+};
+
 &pciec0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/renesas/rzg2-panel-lvds.dtsi b/arch/arm64/boot/dts/renesas/rzg2-panel-lvds.dtsi
new file mode 100644
index 0000000..768a8ec
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzg2-panel-lvds.dtsi
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the LVDS panels connected to RZ/G2 boards
+ *
+ * Copyright (C) 2019 Renesas Electronics Corp.
+ */
+
+/ {
+
+	panel-lvds {
+		compatible = "advantech,idk-1110wr", "panel-lvds";
+
+		width-mm = <223>;
+		height-mm = <125>;
+
+		data-mapping = "jeida-24";
+
+		panel-timing {
+			/* 1024x600 @60Hz */
+			clock-frequency = <51200000>;
+			hactive = <1024>;
+			vactive = <600>;
+			hsync-len = <240>;
+			hfront-porch = <40>;
+			hback-porch = <40>;
+			vfront-porch = <15>;
+			vback-porch = <10>;
+			vsync-len = <10>;
+		};
+
+		port {
+			panel_in_advantech_idk_1110wr: endpoint {
+				remote-endpoint = <&lvds_connector>;
+			};
+		};
+	};
+};
-- 
2.7.4

