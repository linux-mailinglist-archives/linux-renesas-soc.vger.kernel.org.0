Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BCA932D6BE
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  4 Mar 2021 16:35:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234975AbhCDPeN (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 4 Mar 2021 10:34:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235167AbhCDPdx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Mar 2021 10:33:53 -0500
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91DD2C061760
        for <linux-renesas-soc@vger.kernel.org>; Thu,  4 Mar 2021 07:33:02 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:403a:b688:43fc:72a5])
        by baptiste.telenet-ops.be with bizsmtp
        id cFZ02400J0zmvuD01FZ0xE; Thu, 04 Mar 2021 16:33:00 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lHpyF-004lvQ-PH; Thu, 04 Mar 2021 16:32:59 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lHpyF-00H21A-0e; Thu, 04 Mar 2021 16:32:59 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 2/3] arm64: dts: renesas: falcon: Add CSI/DSI sub-board
Date:   Thu,  4 Mar 2021 16:32:56 +0100
Message-Id: <20210304153257.4059277-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210304153257.4059277-1-geert+renesas@glider.be>
References: <20210304153257.4059277-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add a DTS file for the Falcon CSI/DSI sub-board (RTP0RC779A0DCS0010S),
and include it from the main r8a779a0-falcon.dts.

For now its contents are limited to the Board ID EEPROM.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New (eeprom node extracted from first patch).
---
 .../boot/dts/renesas/r8a779a0-falcon-csi-dsi.dtsi | 15 +++++++++++++++
 arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts   |  1 +
 2 files changed, 16 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779a0-falcon-csi-dsi.dtsi

diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon-csi-dsi.dtsi b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-csi-dsi.dtsi
new file mode 100644
index 0000000000000000..14d3db5d6c16485d
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon-csi-dsi.dtsi
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the Falcon CSI/DSI sub-board
+ *
+ * Copyright (C) 2021 Glider bv
+ */
+
+&i2c0 {
+	eeprom@52 {
+		compatible = "rohm,br24g01", "atmel,24c01";
+		label = "csi-dsi-sub-board-id";
+		reg = <0x52>;
+		pagesize = <8>;
+	};
+};
diff --git a/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
index 2047fc475a524576..59d21d88788be6e8 100644
--- a/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts
@@ -7,6 +7,7 @@
 
 /dts-v1/;
 #include "r8a779a0-falcon-cpu.dtsi"
+#include "r8a779a0-falcon-csi-dsi.dtsi"
 
 / {
 	model = "Renesas Falcon CPU and Breakout boards based on r8a779a0";
-- 
2.25.1

