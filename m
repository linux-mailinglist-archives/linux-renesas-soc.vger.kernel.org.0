Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9511EA1901
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 29 Aug 2019 13:38:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727392AbfH2Liw (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 29 Aug 2019 07:38:52 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:5115 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727474AbfH2Liw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Aug 2019 07:38:52 -0400
X-IronPort-AV: E=Sophos;i="5.64,442,1559487600"; 
   d="scan'208";a="25249633"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 29 Aug 2019 20:38:50 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 2BCCF4002C30;
        Thu, 29 Aug 2019 20:38:45 +0900 (JST)
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        xu_shunji@hoperun.com, ebiharaml@si-linux.co.jp
Subject: [PATCH v2 2/2] arm64: dts: renesas: Add HiHope RZ/G2M board with idk-1110wr display
Date:   Thu, 29 Aug 2019 12:38:33 +0100
Message-Id: <1567078713-29361-3-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567078713-29361-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1567078713-29361-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The HiHope RZ/G2M is advertised as compatible with panel idk-1110wr
from Advantech, however the panel isn't sold alongside the board.
A new dts, adding everything that's required to get the panel to
work the HiHope RZ/G2M, is the most convenient way to support the
HiHope RZ/G2M when it's connected to the idk-1110wr.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
---
v1->v2:
* added space between lvds-connector-en-gpio and curly brace

 arch/arm64/boot/dts/renesas/Makefile               |  1 +
 .../r8a774a1-hihope-rzg2m-ex-idk-1110wr.dts        | 86 ++++++++++++++++++++++
 2 files changed, 87 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex-idk-1110wr.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 42b74c2..5d94301 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m.dtb
 dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m-ex.dtb
+dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m-ex-idk-1110wr.dtb
 dtb-$(CONFIG_ARCH_R8A774C0) += r8a774c0-cat874.dtb r8a774c0-ek874.dtb
 dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-salvator-x.dtb r8a7795-h3ulcb.dtb
 dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-h3ulcb-kf.dtb
diff --git a/arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex-idk-1110wr.dts b/arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex-idk-1110wr.dts
new file mode 100644
index 0000000..67fe04c
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex-idk-1110wr.dts
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the HiHope RZ/G2M sub board connected to an
+ * Advantech IDK-1110WR 10.1" LVDS panel
+ *
+ * Copyright (C) 2019 Renesas Electronics Corp.
+ */
+
+#include "r8a774a1-hihope-rzg2m-ex.dts"
+
+/ {
+	backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pwm0 0 50000>;
+
+		brightness-levels = <0 2 8 16 32 64 128 255>;
+		default-brightness-level = <6>;
+	};
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
+			panel_in: endpoint {
+				remote-endpoint = <&lvds0_out>;
+			};
+		};
+	};
+};
+
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
+	status = "okay";
+
+	ports {
+		port@1 {
+			lvds0_out: endpoint {
+				remote-endpoint = <&panel_in>;
+			};
+		};
+	};
+};
+
+&pfc {
+	pwm0_pins: pwm0 {
+		groups = "pwm0";
+		function = "pwm0";
+	};
+};
+
+&pwm0 {
+	pinctrl-0 = <&pwm0_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
-- 
2.7.4

