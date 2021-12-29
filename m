Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A76F6481651
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Dec 2021 20:31:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230411AbhL2Tbo (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 29 Dec 2021 14:31:44 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:35546 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230305AbhL2Tbo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Dec 2021 14:31:44 -0500
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CAF0AD6E;
        Wed, 29 Dec 2021 20:31:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1640806302;
        bh=j5F+jshhKVzS4Efk6nKvo3Y17oi8E1PlSNG58UIr9BI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=eXuWUseoEx8LcpqvwbH4OMPd9MBx5QToPjbIyHlJQ8xLa777OQY/hvCLCxhHDmlvc
         ZnL6low/8af31ulMK8trFbccvCXtIKcQe6i1YUnZicAVe5hKwpyiup5PS+OISQ65hX
         x1UcesvwHaaOph0ua3F5ImOrVMjE8lsh91Mo1vBE=
From:   Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Subject: [PATCH v2 2/3] arm64: dts: renesas: Add panel overlay for Salvator-X(S) boards
Date:   Wed, 29 Dec 2021 21:31:34 +0200
Message-Id: <20211229193135.28767-3-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211229193135.28767-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20211229193135.28767-1-laurent.pinchart+renesas@ideasonboard.com>
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
Changes since v1:

- Create endpoint in lvds0 port@1
---
 arch/arm64/boot/dts/renesas/Makefile          |  2 ++
 .../dts/renesas/salvator-panel-aa104xd12.dts  | 36 +++++++++++++++++++
 2 files changed, 38 insertions(+)
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
index 000000000000..c83a30adc6ad
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/salvator-panel-aa104xd12.dts
@@ -0,0 +1,36 @@
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
+
+	ports {
+		port@1 {
+			lvds0_out: endpoint {
+				remote-endpoint = <&panel_in>;
+			};
+		};
+	};
+};
-- 
Regards,

Laurent Pinchart

