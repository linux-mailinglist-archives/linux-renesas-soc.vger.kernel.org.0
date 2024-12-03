Return-Path: <linux-renesas-soc+bounces-10824-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EB49E19E4
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 11:51:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9570016699D
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  3 Dec 2024 10:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 554FD1E2610;
	Tue,  3 Dec 2024 10:50:59 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D2141E25EE;
	Tue,  3 Dec 2024 10:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733223059; cv=none; b=WnpL1rGqBVPGgrWIO3vTaLwJeenyp57kJFMR6QVzkEbYSzKEX5ia+SrEUfdfCIN6jvUIzAUUslevjNaMOXBAdSSyrV0jzQezdyiCbSMi7zbVAR52YMs7mXq9qcYzvsXQBKJ0fN+aHgTXDF3MvI9DzUZV/GTRmBX2e9bBhC2Gmp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733223059; c=relaxed/simple;
	bh=5aJZWQLjQySciuqeTRJaWpCd00N91lfD1GyA0/Tmxxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FzdbN1yg3AZl6L4nYTSeNEgH2eec6KDvsj+28WW+JC+VzBOGla+8LU5TPe11VxktdGgMWAENTYNG+89m5SlCuKqGH9sW35rxbPp4EP/0mM5NGRzTtpPKwyu1LmXlyYSmhgblzr8ovBVhzv+54E6wn4IBLTMGaK0SeGRHWzpealY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: 1QC8HeuNTl2sooijPKcPQw==
X-CSE-MsgGUID: Kp7I2tsyTgScQWgut/ZCLw==
X-IronPort-AV: E=Sophos;i="6.12,204,1728918000"; 
   d="scan'208";a="230754431"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 03 Dec 2024 19:50:55 +0900
Received: from localhost.localdomain (unknown [10.226.93.2])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 10168400753A;
	Tue,  3 Dec 2024 19:50:50 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH v2 12/13] arm64: dts: renesas: Add initial device tree for RZ/G3E SMARC EVK board
Date: Tue,  3 Dec 2024 10:49:39 +0000
Message-ID: <20241203105005.103927-13-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241203105005.103927-1-biju.das.jz@bp.renesas.com>
References: <20241203105005.103927-1-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the initial device tree for the Renesas RZ/G3E SMARC EVK board.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * No change.
---
 arch/arm64/boot/dts/renesas/Makefile          |  2 ++
 .../boot/dts/renesas/r9a09g047e57-smarc.dts   | 18 ++++++++++++++
 .../boot/dts/renesas/renesas-smarc2.dtsi      | 24 +++++++++++++++++++
 3 files changed, 44 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
 create mode 100644 arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 97228a3cb99c..bf5b49f47ce8 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -140,6 +140,8 @@ dtb-$(CONFIG_ARCH_R9A08G045) += r9a08g045s33-smarc.dtb
 
 dtb-$(CONFIG_ARCH_R9A09G011) += r9a09g011-v2mevk2.dtb
 
+dtb-$(CONFIG_ARCH_R9A09G047) += r9a09g047e57-smarc.dtb
+
 dtb-$(CONFIG_ARCH_R9A09G057) += r9a09g057h44-rzv2h-evk.dtb
 
 dtb-$(CONFIG_ARCH_RCAR_GEN3) += draak-ebisu-panel-aa104xd12.dtbo
diff --git a/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
new file mode 100644
index 000000000000..d4d61bd03969
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/G3E SMARC EVK board
+ *
+ * Copyright (C) 2024 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+
+#include "r9a09g047e57.dtsi"
+#include "rzg3e-smarc-som.dtsi"
+#include "renesas-smarc2.dtsi"
+
+/ {
+	model = "Renesas SMARC EVK version 2 based on r9a09g047e57";
+	compatible = "renesas,smarc2-evk", "renesas,rzg3e-smarcm",
+		     "renesas,r9a09g047e57", "renesas,r9a09g047";
+};
diff --git a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
new file mode 100644
index 000000000000..e378d55e6e9b
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ SMARC Carrier-II Board.
+ *
+ * Copyright (C) 2024 Renesas Electronics Corp.
+ */
+
+/ {
+	model = "Renesas RZ SMARC Carrier-II Board";
+	compatible = "renesas,smarc2-evk";
+
+	chosen {
+		bootargs = "ignore_loglevel";
+		stdout-path = "serial3:115200n8";
+	};
+
+	aliases {
+		serial3 = &scif0;
+	};
+};
+
+&scif0 {
+	status = "okay";
+};
-- 
2.43.0


