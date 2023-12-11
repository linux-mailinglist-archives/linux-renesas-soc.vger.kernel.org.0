Return-Path: <linux-renesas-soc+bounces-889-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B74A780D05C
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Dec 2023 17:02:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E7B9F1C20F35
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Dec 2023 16:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57EA84C3B6;
	Mon, 11 Dec 2023 16:01:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B045826B9
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Dec 2023 08:01:33 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:dadd:5da9:a38f:8d88])
	by laurent.telenet-ops.be with bizsmtp
	id M41S2B00d3oFjQr0141SXa; Mon, 11 Dec 2023 17:01:26 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rCiiM-00BkB7-P7;
	Mon, 11 Dec 2023 17:01:26 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rCiik-00BmVu-Fb;
	Mon, 11 Dec 2023 17:01:26 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 2/7] arm64: dts: renesas: r8a779g0: Add standalone White Hawk CPU support
Date: Mon, 11 Dec 2023 17:01:17 +0100
Message-Id: <80ff74b0f2a7cda1187bcbc14ac6993f8ebb7971.1702309604.git.geert+renesas@glider.be>
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

The White Hawk CPU board can be used standalone, without connecting it
to the White Hawk BreakOut board.

Add a DTS file for supporting this use case.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/Makefile                |  1 +
 .../boot/dts/renesas/r8a779g0-white-hawk-cpu.dts    | 13 +++++++++++++
 .../boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi   |  2 +-
 3 files changed, 15 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 64f4b9d09c97b2bd..5209ca9cdf8433c1 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -82,6 +82,7 @@ dtb-$(CONFIG_ARCH_R8A779F0) += r8a779f0-spider.dtb
 dtb-$(CONFIG_ARCH_R8A779F0) += r8a779f4-s4sk.dtb
 
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g0-white-hawk.dtb
+dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g0-white-hawk-cpu.dtb
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g0-white-hawk-ard-audio-da7212.dtbo
 r8a779g0-white-hawk-ard-audio-da7212-dtbs := r8a779g0-white-hawk.dtb r8a779g0-white-hawk-ard-audio-da7212.dtbo
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g0-white-hawk-ard-audio-da7212.dtb
diff --git a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dts b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dts
new file mode 100644
index 0000000000000000..c8b1bb50a8cfeb66
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dts
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the standalone R-Car V4H White Hawk CPU board
+ *
+ * Copyright (C) 2023 Glider bv
+ */
+
+/dts-v1/;
+#include "r8a779g0-white-hawk-cpu.dtsi"
+
+/ {
+	model = "Renesas White Hawk CPU board based on r8a779g0";
+};
diff --git a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi
index bb4a5270f71b6a75..4dcbe50fabb6f0db 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 /*
- * Device Tree Source for the White Hawk CPU board
+ * Device Tree Source for the R-Car V4H White Hawk CPU board
  *
  * Copyright (C) 2022 Renesas Electronics Corp.
  */
-- 
2.34.1


