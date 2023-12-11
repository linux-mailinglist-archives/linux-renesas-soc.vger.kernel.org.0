Return-Path: <linux-renesas-soc+bounces-891-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 438E280D05D
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Dec 2023 17:02:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D79D81F218D0
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Dec 2023 16:02:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D26B4C3AD;
	Mon, 11 Dec 2023 16:01:57 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 008B026A4
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Dec 2023 08:01:32 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:dadd:5da9:a38f:8d88])
	by andre.telenet-ops.be with bizsmtp
	id M41S2B00K3oFjQr0141SM3; Mon, 11 Dec 2023 17:01:26 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rCiiM-00BkBF-QH;
	Mon, 11 Dec 2023 17:01:26 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rCiik-00BmW2-Gm;
	Mon, 11 Dec 2023 17:01:26 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 4/7] arm64: dts: renesas: Drop SoC part from White Hawk sub boards
Date: Mon, 11 Dec 2023 17:01:19 +0100
Message-Id: <9d0c5ecad6472e4c8a8cea0ec6e542193ca03a42.1702309604.git.geert+renesas@glider.be>
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

The White Hawk CSI/DSI and RAVB/Ethernet(1000Base-T1) sub boards are not
specific to R-Car V4H.

Hence rename their DTS file names to drop the "r8a779g0-" prefix, and
remove any references to R-Car V4H.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dts           | 4 ++--
 ...a779g0-white-hawk-csi-dsi.dtsi => white-hawk-csi-dsi.dtsi} | 2 +-
 ...79g0-white-hawk-ethernet.dtsi => white-hawk-ethernet.dtsi} | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)
 rename arch/arm64/boot/dts/renesas/{r8a779g0-white-hawk-csi-dsi.dtsi => white-hawk-csi-dsi.dtsi} (97%)
 rename arch/arm64/boot/dts/renesas/{r8a779g0-white-hawk-ethernet.dtsi => white-hawk-ethernet.dtsi} (76%)

diff --git a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dts b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dts
index eff1ef6e2cc83aba..8d82294a1a56444c 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dts
+++ b/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dts
@@ -7,8 +7,8 @@
 
 /dts-v1/;
 #include "r8a779g0-white-hawk-cpu.dtsi"
-#include "r8a779g0-white-hawk-csi-dsi.dtsi"
-#include "r8a779g0-white-hawk-ethernet.dtsi"
+#include "white-hawk-csi-dsi.dtsi"
+#include "white-hawk-ethernet.dtsi"
 
 / {
 	model = "Renesas White Hawk CPU and Breakout boards based on r8a779g0";
diff --git a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-csi-dsi.dtsi b/arch/arm64/boot/dts/renesas/white-hawk-csi-dsi.dtsi
similarity index 97%
rename from arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-csi-dsi.dtsi
rename to arch/arm64/boot/dts/renesas/white-hawk-csi-dsi.dtsi
index f8537f7ea4defaba..3006b0a64f41e625 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-csi-dsi.dtsi
+++ b/arch/arm64/boot/dts/renesas/white-hawk-csi-dsi.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 /*
- * Device Tree Source for the R-Car V4H White Hawk CSI/DSI sub-board
+ * Device Tree Source for the White Hawk CSI/DSI sub-board
  *
  * Copyright (C) 2022 Glider bv
  */
diff --git a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ethernet.dtsi b/arch/arm64/boot/dts/renesas/white-hawk-ethernet.dtsi
similarity index 76%
rename from arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ethernet.dtsi
rename to arch/arm64/boot/dts/renesas/white-hawk-ethernet.dtsi
index 4f411f95c674bd51..a218fda337cf4308 100644
--- a/arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-ethernet.dtsi
+++ b/arch/arm64/boot/dts/renesas/white-hawk-ethernet.dtsi
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 /*
- * Device Tree Source for the R-Car V4H White Hawk RAVB/Ethernet(1000Base-T1)
+ * Device Tree Source for the White Hawk RAVB/Ethernet(1000Base-T1)
  * sub-board
  *
  * Copyright (C) 2022 Glider bv
-- 
2.34.1


