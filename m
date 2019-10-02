Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83D2CC4B14
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  2 Oct 2019 12:09:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727633AbfJBKJW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 2 Oct 2019 06:09:22 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:16376 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727409AbfJBKJW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Oct 2019 06:09:22 -0400
X-IronPort-AV: E=Sophos;i="5.64,574,1559487600"; 
   d="scan'208";a="28103967"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 02 Oct 2019 19:09:20 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 5111A42050A5;
        Wed,  2 Oct 2019 19:09:17 +0900 (JST)
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
Subject: [PATCH v2 9/9] arm64: dts: renesas: Add support for Advantech idk-1110wr LVDS panel
Date:   Wed,  2 Oct 2019 11:08:26 +0100
Message-Id: <1570010906-47486-10-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570010906-47486-1-git-send-email-biju.das@bp.renesas.com>
References: <1570010906-47486-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patch adds support for Advantech idk-1110wr LVDS panel.
The HiHope RZ/G2[MN] is advertised as compatible with panel
idk-1110wr from Advantech, however the panel isn't sold alongside
the board.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
---
 V1-->V2
   * Incorporated Laurent's review comments
---
 .../renesas/rzg2-advantech-idk-1110wr-panel.dtsi   | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2-advantech-idk-1110wr-panel.dtsi

diff --git a/arch/arm64/boot/dts/renesas/rzg2-advantech-idk-1110wr-panel.dtsi b/arch/arm64/boot/dts/renesas/rzg2-advantech-idk-1110wr-panel.dtsi
new file mode 100644
index 0000000..4f876df
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzg2-advantech-idk-1110wr-panel.dtsi
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the Advantech idk-1110wr LVDS panel connected
+ * to RZ/G2 boards
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
+			panel_in: endpoint {
+				remote-endpoint = <&lvds_connector>;
+			};
+		};
+	};
+};
+
+&lvds_connector {
+	remote-endpoint = <&panel_in>;
+};
-- 
2.7.4

