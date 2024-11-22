Return-Path: <linux-renesas-soc+bounces-10673-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C10379D5F2F
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Nov 2024 13:47:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 50F41B24FFF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 22 Nov 2024 12:47:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 430C41DF738;
	Fri, 22 Nov 2024 12:46:48 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 480381DF745;
	Fri, 22 Nov 2024 12:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732279608; cv=none; b=GWF/vJ2pu/3i7puZbGDThHde8kdgS5hO2Ig2eMgsFnFfNjdvQShJpz5hg9PRowLQdSETf1P0x7LFOnAmgIhux2MxydltpKXoTwYiThlIBoByMwtYiXKAEOtZmBYoVvYOepnBG3vCfpTg4rjcouxEV/btcVSbVCastWB7K4IiHU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732279608; c=relaxed/simple;
	bh=ds3bxXfV+DJlGzgP+hjPQ9bXfYNLnqKEuUtsD5xFUrM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fIxqef9DeX5s4SI1/W+GnF1yL6pjLxQCEq4H+4wbS+9N/0Lv070GaCUM/PPvtSHEXAyQj1siKQ2DHfAYEvt8fqxifWPDSkYBTj8aVssubfH0EOsdAKXvmkbqAhpnh7U+lKwybcadOLTDfmIdhi0vTR4xyyLsuiChWv+XXy+BtLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: vSO25gOpQayAdnuo/FehAg==
X-CSE-MsgGUID: 0NwX2/bcSiijuV1yiYBlkg==
X-IronPort-AV: E=Sophos;i="6.12,175,1728918000"; 
   d="scan'208";a="225786457"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 22 Nov 2024 21:46:45 +0900
Received: from localhost.localdomain (unknown [10.226.92.254])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 42C4E423A750;
	Fri, 22 Nov 2024 21:46:37 +0900 (JST)
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
Subject: [PATCH 10/12] arm64: dts: renesas: Add initial device tree for RZ/G3E SMARC EVK board
Date: Fri, 22 Nov 2024 12:45:46 +0000
Message-ID: <20241122124558.149827-11-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241122124558.149827-1-biju.das.jz@bp.renesas.com>
References: <20241122124558.149827-1-biju.das.jz@bp.renesas.com>
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


