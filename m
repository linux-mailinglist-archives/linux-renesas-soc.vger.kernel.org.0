Return-Path: <linux-renesas-soc+bounces-890-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0466280D05E
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Dec 2023 17:02:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 91F17B20B11
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 11 Dec 2023 16:02:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D87A24C3A8;
	Mon, 11 Dec 2023 16:01:56 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2547626BE
	for <linux-renesas-soc@vger.kernel.org>; Mon, 11 Dec 2023 08:01:33 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:dadd:5da9:a38f:8d88])
	by albert.telenet-ops.be with bizsmtp
	id M41S2B00A3oFjQr0641SQN; Mon, 11 Dec 2023 17:01:26 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rCiiM-00BkBB-Pe;
	Mon, 11 Dec 2023 17:01:26 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rCiik-00BmVy-GD;
	Mon, 11 Dec 2023 17:01:26 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: linux-renesas-soc@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 3/7] arm64: dts: renesas: Add Renesas R8A779G2 SoC support
Date: Mon, 11 Dec 2023 17:01:18 +0100
Message-Id: <73de98b825eff295c60b76a239e9a885dd65303c.1702309604.git.geert+renesas@glider.be>
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

Add support for the Renesas R-Car V4H ES2.0 (R8A779G2) SoC, which is an
updated version of the R-Car V4H (R8A779G0) SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/r8a779g2.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g2.dtsi

diff --git a/arch/arm64/boot/dts/renesas/r8a779g2.dtsi b/arch/arm64/boot/dts/renesas/r8a779g2.dtsi
new file mode 100644
index 0000000000000000..e08f531843e28b7f
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779g2.dtsi
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the R-Car V4H (R8A779G2) SoC
+ *
+ * Copyright (C) 2023 Glider bv
+ */
+
+#include "r8a779g0.dtsi"
+
+/ {
+	compatible = "renesas,r8a779g2", "renesas,r8a779g0";
+};
-- 
2.34.1


