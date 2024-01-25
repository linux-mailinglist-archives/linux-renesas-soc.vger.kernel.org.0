Return-Path: <linux-renesas-soc+bounces-1816-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D4883C535
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jan 2024 15:49:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 79B15B2187B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 25 Jan 2024 14:49:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44FF76E2DF;
	Thu, 25 Jan 2024 14:49:13 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B58936E2DD
	for <linux-renesas-soc@vger.kernel.org>; Thu, 25 Jan 2024 14:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706194153; cv=none; b=S/xB63IUAQkh6kBPGqCmAOAsQSJXZiuJ7c9cWyZ3HafpD+psc4VE+bJe28Ioru+Npbz8FA6IaCiJxnqr8w5qmI4HEAqmGVJGSBriTAxFlUq3SiRcQ1wRn3I6dkSFB/jdfJNJIWvBDb1qZWd8dT53+adoReJ6nZaNSaY9g4FHzBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706194153; c=relaxed/simple;
	bh=wlaNYyyQ6LohCjDhBcs0ud6SfrUQaumRo+APk81DMUE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PYoOFFsfKsbfbq7lNVJgB6S0Q/6c0ZtA2DXppqx7SSUjrYXF7pbDJve8Rd0Z3XMAzeO67zKO1wJpJIdNVZ7FoJIw/mr8GS7Go+d5X1xgY9bmcOfgB3S9eqIRcoI387Rm0EHw6k5goWsGdBaCIN6rg8H6GUVi88JaFyMUyRo51iI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:bc9e:fcb8:8aa3:5dc0])
	by albert.telenet-ops.be with bizsmtp
	id f2p02B00V58agq2062p020; Thu, 25 Jan 2024 15:49:02 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rT11W-00GUrz-Ir;
	Thu, 25 Jan 2024 15:49:00 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1rT12K-00Fltw-IK;
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
Subject: [PATCH v2 2/9] arm64: dts: renesas: r8a779g0: Add standalone White Hawk CPU support
Date: Thu, 25 Jan 2024 15:48:52 +0100
Message-Id: <95ac53e7f2bc42402eb411ad7f64a66864a3de01.1706192990.git.geert+renesas@glider.be>
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

The White Hawk CPU board can be used standalone, without connecting it
to the White Hawk BreakOut board.

Add a DTS file for supporting this use case.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
v2:
  - Add Reviewed-by.
---
 arch/arm64/boot/dts/renesas/Makefile                |  1 +
 .../boot/dts/renesas/r8a779g0-white-hawk-cpu.dts    | 13 +++++++++++++
 .../boot/dts/renesas/r8a779g0-white-hawk-cpu.dtsi   |  2 +-
 3 files changed, 15 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g0-white-hawk-cpu.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 8ea68d5827105b76..b959ae4a586bf8f7 100644
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
index 913f70fe6c5cd2d8..19ca831756f78124 100644
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


