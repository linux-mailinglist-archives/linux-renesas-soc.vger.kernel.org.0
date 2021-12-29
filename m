Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41C5C48164D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Dec 2021 20:31:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230406AbhL2Tbn (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 Dec 2021 14:31:43 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:35538 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230305AbhL2Tbm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Dec 2021 14:31:42 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 18979464;
        Wed, 29 Dec 2021 20:31:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1640806301;
        bh=DI/RGTpnR8cvi5weHg5ipQwKCg/FQUnv5rleojLFl7I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AcMrhjztRKVGLICB0VB2pYHmGjCoMLG/Z34htJfgzP5BzKfi/Gx/5eG3CS5OGI8Ho
         cLHOZlzq/vhRm3ahuMve259iD+mETZHoNW0+E2L7UDqFTIO4z9irajU681wtFkvDmk
         F7oK0ufkYrfN9H3XQQJJJmccC4zi1DIhS1bURSL0=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Subject: [PATCH v2 1/3] arm64: dts: renesas: Prepare AA1024XD12 panel .dtsi for overlay support
Date:   Wed, 29 Dec 2021 21:31:33 +0200
Message-Id: <20211229193135.28767-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211229193135.28767-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20211229193135.28767-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The Mitsubishi AA1024XD12 panel can be used for R-Car Gen2 and Gen3
boards as an optional external panel. It is described in the
arm/boot/dts/r8a77xx-aa104xd12-panel.dtsi file as a direct child of the
DT root node. This allows including r8a77xx-aa104xd12-panel.dtsi in
board device trees, with other minor modifications, to enable the panel.

This is however not how external components should be modelled. Instead
of modifying the board device tree to enable the panel, it should be
compiled as a DT overlay, to be loaded by the boot loader.

Prepare the r8a77xx-aa104xd12-panel.dtsi file for this usage by
declaring a panel node only, without hardcoding its path. Overlay
sources can then include r8a77xx-aa104xd12-panel.dtsi where appropriate.

This change doesn't cause any regression as r8a77xx-aa104xd12-panel.dtsi
is currently unused. As overlay support for this panel has only been
tested with Gen3 hardware, and Gen2 support will require more
development, move the file to arch/arm64/boot/dts/renesas/.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../arm/boot/dts/r8a77xx-aa104xd12-panel.dtsi | 39 -------------------
 .../boot/dts/renesas/panel-aa104xd12.dtsi     | 30 ++++++++++++++
 2 files changed, 30 insertions(+), 39 deletions(-)
 delete mode 100644 arch/arm/boot/dts/r8a77xx-aa104xd12-panel.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/panel-aa104xd12.dtsi

diff --git a/arch/arm/boot/dts/r8a77xx-aa104xd12-panel.dtsi b/arch/arm/boot/dts/r8a77xx-aa104xd12-panel.dtsi
deleted file mode 100644
index 79fce67ebb1c..000000000000
--- a/arch/arm/boot/dts/r8a77xx-aa104xd12-panel.dtsi
+++ /dev/null
@@ -1,39 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Common file for the AA104XD12 panel connected to Renesas R-Car boards
- *
- * Copyright (C) 2014 Renesas Electronics Corp.
- */
-
-/ {
-	panel {
-		compatible = "mitsubishi,aa104xd12", "panel-lvds";
-
-		width-mm = <210>;
-		height-mm = <158>;
-		data-mapping = "jeida-18";
-
-		panel-timing {
-			/* 1024x768 @65Hz */
-			clock-frequency = <65000000>;
-			hactive = <1024>;
-			vactive = <768>;
-			hsync-len = <136>;
-			hfront-porch = <20>;
-			hback-porch = <160>;
-			vfront-porch = <3>;
-			vback-porch = <29>;
-			vsync-len = <6>;
-		};
-
-		port {
-			panel_in: endpoint {
-				remote-endpoint = <&lvds_connector>;
-			};
-		};
-	};
-};
-
-&lvds_connector {
-	remote-endpoint = <&panel_in>;
-};
diff --git a/arch/arm64/boot/dts/renesas/panel-aa104xd12.dtsi b/arch/arm64/boot/dts/renesas/panel-aa104xd12.dtsi
new file mode 100644
index 000000000000..6e9f447d8fe1
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/panel-aa104xd12.dtsi
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Common file for the AA104XD12 panel connected to Renesas R-Car Gen3 boards.
+ *
+ * Copyright (C) 2021 Renesas Electronics Corp.
+ */
+
+panel {
+	compatible = "mitsubishi,aa104xd12", "panel-lvds";
+
+	width-mm = <210>;
+	height-mm = <158>;
+	data-mapping = "jeida-18";
+
+	panel-timing {
+		/* 1024x768 @65Hz */
+		clock-frequency = <65000000>;
+		hactive = <1024>;
+		vactive = <768>;
+		hsync-len = <136>;
+		hfront-porch = <20>;
+		hback-porch = <160>;
+		vfront-porch = <3>;
+		vback-porch = <29>;
+		vsync-len = <6>;
+	};
+
+	port {
+	};
+};
-- 
Regards,

Laurent Pinchart

