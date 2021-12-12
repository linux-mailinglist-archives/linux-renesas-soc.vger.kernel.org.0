Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E92F14717A7
	for <lists+linux-renesas-soc@lfdr.de>; Sun, 12 Dec 2021 02:34:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231649AbhLLBea (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sat, 11 Dec 2021 20:34:30 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:34716 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229497AbhLLBea (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 11 Dec 2021 20:34:30 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DAB9A18D4;
        Sun, 12 Dec 2021 02:34:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1639272868;
        bh=cNSbDRloJ3ds6EMlQF0alNhg1vp0mtkWiVs7pfKbhX0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BeGqZhzvrE7I9PVwrkyLHZy0+OiAI03SIGggkaJFaJ7SNHTfOhuimeiEY26pOVQkD
         OTwMo4CYe83XrzAVJCi55PuAjH/nSr+GYsrLuF8yddtvRLd0k5mbpS0Tu+pWq/+Dj4
         h5OB9wfoeHwdIODHBTaHq9aQpYAuAT72ro9b3ZwU=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: [PATCH 3/3] arm64: dts: renesas: Add panel overlay for Draak and Ebisu boards
Date:   Sun, 12 Dec 2021 03:33:51 +0200
Message-Id: <20211212013351.595-4-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211212013351.595-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20211212013351.595-1-laurent.pinchart+renesas@ideasonboard.com>
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
 arch/arm64/boot/dts/renesas/Makefile          |  1 +
 .../renesas/draak-ebisu-panel-aa104xd12.dts   | 32 +++++++++++++++++++
 2 files changed, 33 insertions(+)
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
index 000000000000..0c5dc3df5247
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/draak-ebisu-panel-aa104xd12.dts
@@ -0,0 +1,32 @@
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
+};
+
+&lvds1_out {
+	remote-endpoint = <&panel_in>;
+};
-- 
Regards,

Laurent Pinchart

