Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 817E14717A3
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Dec 2021 02:34:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231637AbhLLBe3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 11 Dec 2021 20:34:29 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:34716 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbhLLBe2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 11 Dec 2021 20:34:28 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 10731187F;
        Sun, 12 Dec 2021 02:34:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1639272867;
        bh=fs4QfEGlFq9j1i0ne/o1LJmIXJrV5BBKLaJ0iYejyPI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZZ2Gt6Bll4/nLW4JowX2hYhKoDJnfESeKa/9GtEfBABtn3tjht2VtLXek+yDG+u3p
         2dOOkDdzvXkNr/BEGu55k3fDh5RQaUQzs0u4FUqNYoI86TQ1HzYYEQuyfwSvcoX4M9
         0HjC6E9sHcBBUd+e9zVmZf43nunsZql5ojfjjELw=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 2/3] arm64: dts: renesas: Add panel overlay for Salvator-X(S) boards
Date:   Sun, 12 Dec 2021 03:33:50 +0200
Message-Id: <20211212013351.595-3-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211212013351.595-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20211212013351.595-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The Salvator-X and Salvator-XS boards support an optional LVDS panel.
One compatible panel is the Mitsubishi AA104XD12. Add a corresponding DT
overlay.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 arch/arm64/boot/dts/renesas/Makefile          |  2 ++
 .../dts/renesas/salvator-panel-aa104xd12.dts  | 32 +++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/salvator-panel-aa104xd12.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index d1c5c21d8d14..982ca3e0e86f 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -74,3 +74,5 @@ dtb-$(CONFIG_ARCH_R8A77961) += r8a779m3-ulcb-kf.dtb
 dtb-$(CONFIG_ARCH_R8A77965) += r8a779m5-salvator-xs.dtb
 
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-smarc.dtb
+
+dtb-$(CONFIG_ARCH_RCAR_GEN3) += salvator-panel-aa104xd12.dtbo
diff --git a/arch/arm64/boot/dts/renesas/salvator-panel-aa104xd12.dts b/arch/arm64/boot/dts/renesas/salvator-panel-aa104xd12.dts
new file mode 100644
index 000000000000..ca2d579fe42f
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/salvator-panel-aa104xd12.dts
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Device Tree overlay for the AA104XD12 panel connected to LVDS0 on a
+ * Salvator-X or Salvator-XS board
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
+			remote-endpoint = <&lvds0_out>;
+		};
+	};
+};
+
+&lvds0 {
+	status = "okay";
+};
+
+&lvds0_out {
+	remote-endpoint = <&panel_in>;
+};
-- 
Regards,

Laurent Pinchart

