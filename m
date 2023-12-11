Return-Path: <linux-renesas-soc+bounces-893-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF60A80D06B
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Dec 2023 17:03:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E136D1C2097C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Dec 2023 16:03:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3389C4C3B8;
	Mon, 11 Dec 2023 16:03:52 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 268D82706
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Dec 2023 08:01:33 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:dadd:5da9:a38f:8d88])
	by albert.telenet-ops.be with bizsmtp
	id M41S2B00F3oFjQr0641SQR; Mon, 11 Dec 2023 17:01:26 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rCiiM-00BkBS-SH;
	Mon, 11 Dec 2023 17:01:26 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rCiik-00BmWG-If;
	Mon, 11 Dec 2023 17:01:26 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 7/7] arm64: dts: renesas: r8a779g0: Add White Hawk Single support
Date: Mon, 11 Dec 2023 17:01:22 +0100
Message-Id: <7f9c840ed44dfd57da545e87b5937b58f35cb9c9.1702309604.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1702309604.git.geert+renesas@glider.be>
References: <cover.1702309604.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The White Hawk Single board is a single-board integration of the Renesas
White Hawk CPU and Breakout board stack, based on the R-Car V4H ES2.0
(R8A779G2) SoC.

For now, the only visible differences compared to the board stack are:
  - The SoC is an updated version of R-Car V4H (R8A779G0),
  - The serial console uses an FT2232H instead of a CP2102 USB-UART
    bridge, with CTS/RTS wired.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/Makefile          |  2 ++
 .../renesas/r8a779g2-white-hawk-single.dts    | 28 +++++++++++++++++++
 2 files changed, 30 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 5209ca9cdf8433c1..544dfd8de25cf809 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -87,6 +87,8 @@ dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g0-white-hawk-ard-audio-da7212.dtbo
 r8a779g0-white-hawk-ard-audio-da7212-dtbs := r8a779g0-white-hawk.dtb r8a779g0-white-hawk-ard-audio-da7212.dtbo
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g0-white-hawk-ard-audio-da7212.dtb
 
+dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g2-white-hawk-single.dtb
+
 dtb-$(CONFIG_ARCH_R8A77951) += r8a779m1-salvator-xs.dtb
 r8a779m1-salvator-xs-panel-aa104xd12-dtbs := r8a779m1-salvator-xs.dtb salvator-panel-aa104xd12.dtbo
 dtb-$(CONFIG_ARCH_R8A77951) += r8a779m1-salvator-xs-panel-aa104xd12.dtb
diff --git a/arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dts b/arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dts
new file mode 100644
index 0000000000000000..ca5791b3ca321e97
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dts
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the White Hawk Single board
+ *
+ * Copyright (C) 2023 Glider bv
+ */
+
+/dts-v1/;
+#include "r8a779g2.dtsi"
+#include "white-hawk-cpu-common.dtsi"
+#include "white-hawk-common.dtsi"
+
+/ {
+	model = "Renesas White Hawk Single board based on r8a779g2";
+	compatible = "renesas,white-hawk-single", "renesas,r8a779g2",
+		     "renesas,r8a779g0";
+};
+
+&hscif0 {
+	uart-has-rtscts;
+};
+
+&pfc {
+	hscif0_pins: hscif0 {
+		groups = "hscif0_data", "hscif0_ctrl";
+		function = "hscif0";
+	};
+};
-- 
2.34.1


