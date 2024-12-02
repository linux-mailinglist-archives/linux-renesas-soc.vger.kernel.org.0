Return-Path: <linux-renesas-soc+bounces-10780-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2739E08D9
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Dec 2024 17:41:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C28F216FB26
	for <lists+linux-renesas-soc@lfdr.de>; Mon,  2 Dec 2024 16:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7661019259E;
	Mon,  2 Dec 2024 16:30:26 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [195.130.132.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54C91AF0B2
	for <linux-renesas-soc@vger.kernel.org>; Mon,  2 Dec 2024 16:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.132.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733157026; cv=none; b=lDS8xeT9bRKdb3FVw9GRKD1kqwRbTdsJSY8tpJNUpDdAYJUdxngxqUjfbeWSXQMtsCPTkPSYp74+uiJ0qOUfPmc0shD5iMaiEOgN+mMlgBk/ZWymsZACUFGxwkb6CeRb7t6PC8MCf4Pd5tmufD5hAYcs6hfXFGEPeP+2+Yc+ogE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733157026; c=relaxed/simple;
	bh=I8iHjxGgTdPnhzeNO0K62aarBXPBsI3IAmHasDm2JjU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=STED/FHwZm3v6DqN1+bJ6mqY/8rUU5t/UEI7s0xVc7qRXgJRuS/Vvc6i/lX3vQMF2i89AI4VsoF0NWXmqSaWhPWjuGfJvHq6QapZnMAbG1O/KNHpxTInXUr2KJospeeXO2vTvpU1ZiDwNhnC1/37Wltj6RBahKabQ42vJLymIpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.132.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:17fe:4001:68cd:b1ae])
	by baptiste.telenet-ops.be with cmsmtp
	id jsWE2D00Q1yjZj401sWEo5; Mon, 02 Dec 2024 17:30:15 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tI9JO-0007uS-QY;
	Mon, 02 Dec 2024 17:30:14 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tI9JO-007Png-Nv;
	Mon, 02 Dec 2024 17:30:14 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 5/5] arm64: dts: renesas: r8a779g3: Add White Hawk Single support
Date: Mon,  2 Dec 2024 17:30:11 +0100
Message-Id: <66d0fe78c393e6df2775287c730464e91732ec56.1733156661.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1733156661.git.geert+renesas@glider.be>
References: <cover.1733156661.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The White Hawk Single board with R-Car V4H ES3.0 (R8A779G3) uses an
updated version of the R-Car V4H (R8A779G0) SoC.

For now, there are no visible differences compared to the variant
equipped with an R-Car V4H ES2.0 (R8A779G2) SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/Makefile             |  2 ++
 .../dts/renesas/r8a779g3-white-hawk-single.dts   | 16 ++++++++++++++++
 2 files changed, 18 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-white-hawk-single.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 97228a3cb99c163d..df9ea5b2e20818f4 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -92,6 +92,8 @@ dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g0-white-hawk-ard-audio-da7212.dtb
 
 dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g2-white-hawk-single.dtb
 
+dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-white-hawk-single.dtb
+
 dtb-$(CONFIG_ARCH_R8A779H0) += r8a779h0-gray-hawk-single.dtb
 
 dtb-$(CONFIG_ARCH_R8A77951) += r8a779m1-salvator-xs.dtb
diff --git a/arch/arm64/boot/dts/renesas/r8a779g3-white-hawk-single.dts b/arch/arm64/boot/dts/renesas/r8a779g3-white-hawk-single.dts
new file mode 100644
index 0000000000000000..cd466d858854bf92
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779g3-white-hawk-single.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the R-Car V4H ES3.0 White Hawk Single board
+ *
+ * Copyright (C) 2024 Glider bv
+ */
+
+/dts-v1/;
+#include "r8a779g3.dtsi"
+#include "white-hawk-single.dtsi"
+
+/ {
+	model = "Renesas White Hawk Single board based on r8a779g3";
+	compatible = "renesas,white-hawk-single", "renesas,r8a779g3",
+		     "renesas,r8a779g0";
+};
-- 
2.34.1


