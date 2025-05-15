Return-Path: <linux-renesas-soc+bounces-17141-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B70AB893B
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 May 2025 16:21:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C82FA04DE2
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 15 May 2025 14:20:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6034A217651;
	Thu, 15 May 2025 14:19:14 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CED01EDA23;
	Thu, 15 May 2025 14:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747318754; cv=none; b=j7f06cxGsmxY2zhh3BBE8+6gy9lc1Rqon+isq43HE85WotoBWkjpSLiWUx+MxSvvoODguLqCJXJdcDX/Qv4fJb/9WcUM2cq2EfAFQTqVNam4Zp+pg2U28aWci2TX5F0Lz2eyWmYKGzdGyhVzDwyGf7OemIpDmUYrhor80i3Wj5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747318754; c=relaxed/simple;
	bh=vtQaEhumt87RdGFzF5S1SRLksFNJyr949InfPdykJ/0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P9B4EXqXhBOHvbU4EnUEL4S8Y+YbkLfgCaDwUbiYF9iSm3kC3WQzCq85p3Szodu/+b8Mo5bAF6jY7fu4JXlOVK6VV099KoxD4gFLJwJzVe3T9Beeof+uakFqST++3uaxKfdOXiEyVRFtJ2zk6kzjbgB/o488WqtiOXESW5n5XYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: 35Ly/CR+Qw2DPvOniXWvtA==
X-CSE-MsgGUID: aMBVHl4ORjiLHELYf5QLMg==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 15 May 2025 23:19:11 +0900
Received: from superbuilder.administration.lan (unknown [10.226.93.187])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 689AD401E442;
	Thu, 15 May 2025 23:19:08 +0900 (JST)
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: thierry.bultel@linatsea.fr
Cc: linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org,
	paul.barker.ct@bp.renesas.com,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 09/10] arm64: dts: renesas: Add initial support for renesas RZ/T2H eval board
Date: Thu, 15 May 2025 16:18:24 +0200
Message-ID: <20250515141828.43444-10-thierry.bultel.yh@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250515141828.43444-1-thierry.bultel.yh@bp.renesas.com>
References: <20250515141828.43444-1-thierry.bultel.yh@bp.renesas.com>
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


