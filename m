Return-Path: <linux-renesas-soc+bounces-18774-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98AF5AE9A71
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jun 2025 11:51:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 292703B5DF5
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 26 Jun 2025 09:51:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D59329614F;
	Thu, 26 Jun 2025 09:51:51 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717DA239E79;
	Thu, 26 Jun 2025 09:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750931511; cv=none; b=Oh3LG4Gze8V5jIQ1po9tIiGINBUON/gRsK0VnIJvlWNurwoHTrH5eKJop9dDkcN5KihIhELQxTPmEWvcb3BuLGTrjpr0CksXbqF7jgncZNXcoWnILnWKwiEargA3tWhu6jtUgxSN/p0R+XOjPYx/GGv7276y7pUfO/kYJ1TyIGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750931511; c=relaxed/simple;
	bh=8tOGyrg9VRQ4qFFw8FVu9F2qt2sA6hzl5WlN8naaUfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QqB+UNRnhLZRAvRKK4FiZ4A88ETy1dQVhiF/trXMzXOexGMqTKWWzc39zngqrNNH3w0CDsMgioIMVmglGycNPVo2eK3nc7t2Plttq36hiGcNG04EcxiGp8NwNJQrZKLj+H2eJY2EYOWVtJB8CZtWKn8H1FtiTbiLgMZ6v+84E9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 461FFC4CEEB;
	Thu, 26 Jun 2025 09:51:49 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 4/4] arm64: dts: renesas: r8a779h2: Add Gray Hawk Single support
Date: Thu, 26 Jun 2025 11:51:35 +0200
Message-ID: <d2e0e7b746063368b83148100aa553cff55b8b60.1750931027.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1750931027.git.geert+renesas@glider.be>
References: <cover.1750931027.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Gray Hawk Single board with R-Car V4M-7 (R8A779H2) uses an updated
version of the R-Car V4M (R8A779H0) SoC.

For now, there are no visible differences compared to the variant
equipped with an R-Car V4M (R8A779H0) SoC.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/Makefile            |  2 ++
 .../dts/renesas/r8a779h2-gray-hawk-single.dts   | 17 +++++++++++++++++
 2 files changed, 19 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779h2-gray-hawk-single.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 677ba3aa8931788a..cbd0202c4a1744e9 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -105,6 +105,8 @@ dtb-$(CONFIG_ARCH_R8A779G0) += r8a779g3-white-hawk-single-ard-audio-da7212.dtb
 
 dtb-$(CONFIG_ARCH_R8A779H0) += r8a779h0-gray-hawk-single.dtb
 
+dtb-$(CONFIG_ARCH_R8A779H0) += r8a779h2-gray-hawk-single.dtb
+
 dtb-$(CONFIG_ARCH_R8A77951) += r8a779m1-salvator-xs.dtb
 r8a779m1-salvator-xs-panel-aa104xd12-dtbs := r8a779m1-salvator-xs.dtb salvator-panel-aa104xd12.dtbo
 dtb-$(CONFIG_ARCH_R8A77951) += r8a779m1-salvator-xs-panel-aa104xd12.dtb
diff --git a/arch/arm64/boot/dts/renesas/r8a779h2-gray-hawk-single.dts b/arch/arm64/boot/dts/renesas/r8a779h2-gray-hawk-single.dts
new file mode 100644
index 0000000000000000..aeb32c77099ea20f
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779h2-gray-hawk-single.dts
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the R-Car V4M-7 Gray Hawk Single board
+ *
+ * Copyright (C) 2025 Glider bv
+ */
+
+/dts-v1/;
+
+#include "r8a779h2.dtsi"
+#include "gray-hawk-single.dtsi"
+
+/ {
+	model = "Renesas Gray Hawk Single board based on r8a779h2";
+	compatible = "renesas,gray-hawk-single", "renesas,r8a779h2",
+		     "renesas,r8a779h0";
+};
-- 
2.43.0


