Return-Path: <linux-renesas-soc+bounces-1817-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AC483C536
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jan 2024 15:49:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C7CF3B21D76
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jan 2024 14:49:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A5336EB5A;
	Thu, 25 Jan 2024 14:49:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B574F6E2DA
	for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Jan 2024 14:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706194153; cv=none; b=c/smbrFONvS+luSWobwl9yM7f4nY16shcOxuBFl+NEF5MwnSPt7f25jzCZZ48LvHY/bio33QWY0Zllzxw5tfQh/xr4veX5z5wddpvicqbryAuPA7i2yIqZG3K7G36yHavrfGuI0P+5IepQzFhhbDo98mNP7r81JhcOYfgjQ3SQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706194153; c=relaxed/simple;
	bh=+jWrWdCZq0fG2ztm1xynDF2ijuBofKXejOH/ekBMNL0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JMW5Xs9yW/93rExYw3g2e2xTAiMHaOGJKJxCxSJccNkPQNyOxcTalLjr4hKP+ZIYo6MimOBmMHqyOwW/YXhaXCwhdE0Dnbj6lGbrsJjL3tbLhcFSm/3DAW53y5GnS0WXXP+TmohYPBYN9SN6X4GLRljnPBo5rJWZHl2PD9Zve14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:bc9e:fcb8:8aa3:5dc0])
	by albert.telenet-ops.be with bizsmtp
	id f2p02B00h58agq2062p024; Thu, 25 Jan 2024 15:49:02 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rT11W-00GUsU-Oq;
	Thu, 25 Jan 2024 15:49:00 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rT12K-00FluT-O4;
	Thu, 25 Jan 2024 15:49:00 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH v2 9/9] arm64: dts: renesas: r8a779g2: Add White Hawk Single support
Date: Thu, 25 Jan 2024 15:48:59 +0100
Message-Id: <2b8d37949c17cca170c1d9e97f10a100b20c5cd9.1706192990.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706192990.git.geert+renesas@glider.be>
References: <cover.1706192990.git.geert+renesas@glider.be>
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
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v2:
  - Add Reviewed-by,
  - Refer to hscif0_pins directly,
  - Add SoC name to top-level comment.
---
 arch/arm64/boot/dts/renesas/Makefile          |  2 ++
 .../renesas/r8a779g2-white-hawk-single.dts    | 26 +++++++++++++++++++
 2 files changed, 28 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index b959ae4a586bf8f7..1d7d69657a1f0559 100644
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
index 0000000000000000..2f79e5a6124897ef
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779g2-white-hawk-single.dts
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the R-Car V4H ES2.0 White Hawk Single board
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
+&hscif0_pins {
+	groups = "hscif0_data", "hscif0_ctrl";
+	function = "hscif0";
+};
-- 
2.34.1


