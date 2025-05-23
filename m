Return-Path: <linux-renesas-soc+bounces-17450-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F5DAC24FB
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 16:26:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 41CE57BC15B
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 23 May 2025 14:24:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC8D1296158;
	Fri, 23 May 2025 14:25:01 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE24C29710D;
	Fri, 23 May 2025 14:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748010301; cv=none; b=Ax/lNHDHRoJP1mkI0gz3spAu84rZ0CVfUMPNd+OQ2oBYEGIBZmE+0LDU+al2mKR0V/LTlP0dLLtriHF12WOK5RxYe+tnrJwaGKrdUbyeUpH4Ojvd58fh5XygRkzNa2PhwNTP9BsbWXFWw9dwwU2oIeDwKk/Y8rYyaF/IMgDYrRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748010301; c=relaxed/simple;
	bh=kJ/CEHb/RhtCJPC/9m3Wojmog0pI6ujfflzp3KiYSGE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=emUlSabdk/67fvvz8OhrCAzdMMQ5soXE/9FY7i8ptDyxkoED8qjn2E/X8+tuh9jXcfApAPOiKIK3kigqU8iVkpPhCTcLbEobmCAC7nE40tdX419LvcKk+rbdMy6uk2UfkMwLvPSQuqeBaZYOXbQDzmwyXNJew+rZMpXTP/ISc6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: cKoDPZjcRN2IibPgH5VnKQ==
X-CSE-MsgGUID: H/Zf5+71RNO//qnMdrFf9A==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 23 May 2025 23:24:59 +0900
Received: from superbuilder.administration.lan (unknown [10.226.92.97])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 7024A4017D95;
	Fri, 23 May 2025 23:24:56 +0900 (JST)
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: thierry.bultel@linatsea.fr
Cc: linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org,
	paul.barker.ct@bp.renesas.com,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 09/10] arm64: dts: renesas: Add initial support for renesas RZ/T2H eval board
Date: Fri, 23 May 2025 16:24:13 +0200
Message-ID: <20250523142417.2840797-10-thierry.bultel.yh@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250523142417.2840797-1-thierry.bultel.yh@bp.renesas.com>
References: <20250523142417.2840797-1-thierry.bultel.yh@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the initial device tree for the RZ/T2H evaluation board.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
---
Changes v9->v10: none
Changes v8->v9:
  - Makefile: keep the alphabetical order
Changes v7->v8:
  - removed loco clock
  - fixed checkpatch warning
Changes v6->v7:
  - lands in arm64 directory instead of arm
Changes v5->v6: rebased on next-20250331
Changes v4->v5: none
Changes v3->v4: none
---
 arch/arm64/boot/dts/renesas/Makefile          |  1 +
 .../dts/renesas/r9a09g077m44-rzt2h-evk.dts    | 31 +++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index b24dddee3827..c6b4a868f387 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -161,5 +161,7 @@ dtb-$(CONFIG_ARCH_R9A09G056) += r9a09g056n48-rzv2n-evk.dtb
 dtb-$(CONFIG_ARCH_R9A09G057) += r9a09g057h44-rzv2h-evk.dtb
 dtb-$(CONFIG_ARCH_R9A09G057) += r9a09g057h48-kakip.dtb
 
+dtb-$(CONFIG_ARCH_R9A09G077) += r9a09g077m44-rzt2h-evk.dtb
+
 dtb-$(CONFIG_ARCH_RCAR_GEN3) += draak-ebisu-panel-aa104xd12.dtbo
 dtb-$(CONFIG_ARCH_RCAR_GEN3) += salvator-panel-aa104xd12.dtbo
diff --git a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
new file mode 100644
index 000000000000..bbacdca1959e
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/T2H Development EVK board
+ *
+ * Copyright (C) 2025 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+
+#include "r9a09g077m44.dtsi"
+
+/ {
+	model = "Renesas Development EVK based on r9a09g077m44";
+	compatible = "renesas,rzt2h-evk", "renesas,r9a09g077m44", "renesas,r9a09g077";
+
+	aliases {
+		serial0 = &sci0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&extal_clk {
+	clock-frequency = <25000000>;
+};
+
+&sci0 {
+	status = "okay";
+};
-- 
2.43.0


