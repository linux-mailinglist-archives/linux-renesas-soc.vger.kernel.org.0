Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03053481653
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Dec 2021 20:31:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230429AbhL2Tbp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 Dec 2021 14:31:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230419AbhL2Tbo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Dec 2021 14:31:44 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6726EC061574;
        Wed, 29 Dec 2021 11:31:44 -0800 (PST)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8A792D89;
        Wed, 29 Dec 2021 20:31:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1640806303;
        bh=r7xTCDf6/ZwoGKEoQxRT5ywOUWRFaFv6tvLd43H5DhE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BcIlyHsm6m5ERi3b9ahNHYzJRjooTfjXLkH37JxSZ60JjXwICBYF4Z/gI0BSiqHbu
         GgAwhDtr6a/VSy1uw8y+9lW/DJTGrujGZsMwWSwuAJwryCpTw9mCkswTtqI9j8C1a9
         gw+0had/m3+tEGJozWOsK7X+/WVTNh9COshibAds=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Subject: [PATCH v2 3/3] arm64: dts: renesas: Add panel overlay for Draak and Ebisu boards
Date:   Wed, 29 Dec 2021 21:31:35 +0200
Message-Id: <20211229193135.28767-4-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211229193135.28767-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20211229193135.28767-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The Draak and Ebisu boards support an optional LVDS panel. One
compatible panel is the Mitsubishi AA104XD12. Add a corresponding DT
overlay.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v1:

- Create endpoint in lvds1 port@1
---
 arch/arm64/boot/dts/renesas/Makefile          |  1 +
 .../renesas/draak-ebisu-panel-aa104xd12.dts   | 36 +++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 982ca3e0e86f..5e831bd33828 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -76,3 +76,4 @@ dtb-$(CONFIG_ARCH_R8A77965) += r8a779m5-salvator-xs.dtb
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-smarc.dtb
 
 dtb-$(CONFIG_ARCH_RCAR_GEN3) += salvator-panel-aa104xd12.dtbo
+dtb-$(CONFIG_ARCH_RCAR_GEN3) += draak-ebisu-panel-aa104xd12.dtbo
diff --git a/arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dts b/arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dts
new file mode 100644
index 000000000000..258f8668ca36
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dts
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Device Tree overlay for the AA104XD12 panel connected to LVDS1 on a Draak or
+ * Ebisu board
+ *
+ * Copyright 2021 Ideas on Board Oy
+ */
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+#include "panel-aa104xd12.dtsi"
+};
+
+&{/panel} {
+	backlight = <&backlight>;
+
+	port {
+		panel_in: endpoint {
+			remote-endpoint = <&lvds1_out>;
+		};
+	};
+};
+
+&lvds1 {
+	status = "okay";
+
+	ports {
+		port@1 {
+			lvds1_out: endpoint {
+				remote-endpoint = <&panel_in>;
+			};
+		};
+	};
+};
-- 
Regards,

Laurent Pinchart

