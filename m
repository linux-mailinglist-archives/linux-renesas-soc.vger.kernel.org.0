Return-Path: <linux-renesas-soc+bounces-13706-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99182A4606A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Feb 2025 14:12:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9AF3817994A
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 26 Feb 2025 13:12:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B80521CA02;
	Wed, 26 Feb 2025 13:10:44 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A346221728;
	Wed, 26 Feb 2025 13:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740575444; cv=none; b=kFYoICst0JGiD3NnkC+Cr7GjZeRpx9FDPCeGZa0FY+yfSDB87LsSDDq14354glgTN4FxPOFg9O8FhiqkWZhXHmtxxr1KG7KdxhYrJO//oMGIw/o8TQq4ebwjXKfoajy1C6RiL56wleDIqgIiVitvj48/E7q6Z9lyJjHlNhAomoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740575444; c=relaxed/simple;
	bh=f9OoPQIHwadaPbIvXANRb8yfsprz6B02ZPl5QMYl7d4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hoM6wMRQveLiiOnQmnZraj2YtsoPjXVsv7K1+f0kOECqDbpZxs0zSEW7HQaZeTPv8LZgYmICtya+f/uL4Z0gU8h1RsKH5vM7oQn4TcR6SxVvd9JV9vjiryJRqScrPTefgZYxJOb2pplJjPMUCVtIqqZjydxHNNfwxVQGwH0X45Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: K3PVYRr9RESRn8DmDCGHQg==
X-CSE-MsgGUID: SLKLVVtvTk2o7P3Oa+R1yQ==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 26 Feb 2025 22:10:41 +0900
Received: from superbuilder.administration.lan (unknown [10.226.92.221])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 71611406960A;
	Wed, 26 Feb 2025 22:10:39 +0900 (JST)
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: thierry.bultel@linatsea.fr
Cc: linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org,
	paul.barker.ct@bp.renesas.com,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 12/13] arm64: dts: renesas: Add initial support for renesas RZ/T2H eval board
Date: Wed, 26 Feb 2025 14:09:31 +0100
Message-ID: <20250226130935.3029927-13-thierry.bultel.yh@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250226130935.3029927-1-thierry.bultel.yh@bp.renesas.com>
References: <20250226130935.3029927-1-thierry.bultel.yh@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the initial device tree for the RZ/T2H evaluation board.

Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
Reviewed-by: Paul Barker <paul.barker.ct@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/Makefile          |  1 +
 .../dts/renesas/r9a09g077m44-rzt2h-evk.dts    | 35 +++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 928635f2e76b..ee1af560f5e6 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -148,6 +148,7 @@ dtb-$(CONFIG_ARCH_R9A09G011) += r9a09g011-v2mevk2.dtb
 
 dtb-$(CONFIG_ARCH_R9A09G047) += r9a09g047e57-smarc.dtb
 
+dtb-$(CONFIG_ARCH_R9A09G077) += r9a09g077m44-rzt2h-evk.dtb
 dtb-$(CONFIG_ARCH_R9A09G057) += r9a09g057h44-rzv2h-evk.dtb
 
 dtb-$(CONFIG_ARCH_RCAR_GEN3) += draak-ebisu-panel-aa104xd12.dtbo
diff --git a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
new file mode 100644
index 000000000000..0fe3a08ca9c3
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
@@ -0,0 +1,35 @@
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
+&loco_clk {
+	clock-frequency = <1000000>;
+};
+
+&sci0 {
+	status = "okay";
+};
-- 
2.43.0


