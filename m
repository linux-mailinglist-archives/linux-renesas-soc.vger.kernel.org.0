Return-Path: <linux-renesas-soc+bounces-12714-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA9EA22253
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2025 17:55:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E3A2169A4D
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 29 Jan 2025 16:55:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57B091E102E;
	Wed, 29 Jan 2025 16:53:04 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64F731DFE00;
	Wed, 29 Jan 2025 16:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738169584; cv=none; b=l2RA8jqk8V9uHZZ7QvQv42dqr4SShEdhn8LuA3pOfp3ufHSOZlwLlSgMOaEgisnhfHAapAplB9JogbpySCwleb0CyRoHsv66S5mWSz3ecpfkeDoic8KuA3KmPGkrTlUWh6HTbu9yhnQuqua57voJZ5k8DSot+BQ8WJOYfcO2pCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738169584; c=relaxed/simple;
	bh=49JXspVkamgcQH2yU4Ezn6GwJ2xGAnzCwes4Ugh6Iws=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KkT+XRpqe4PRlRhw4vE0X3RGBRC284DeLzzAFFFT+gRAqp60SrC+lHQmZCULEb66p+ldvr+onTwR5LN1fNYwHXbtyDo6nA8aJgJdJUc8l3Mnu2UlbMAn4FI31PNM/GdAStsWmok35tIm3PoicEm3wqtUfbRBCT4AUhyVmW0avU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: DxccpHN8SCmdv0mXpMZK5g==
X-CSE-MsgGUID: 1qiZafiQRV6F0s7U8rrx4A==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 30 Jan 2025 01:53:01 +0900
Received: from wvbox.administration.lan (unknown [10.226.92.145])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 3E80A402F02E;
	Thu, 30 Jan 2025 01:52:45 +0900 (JST)
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 13/14] arm64: dts: renesas: Add initial support for renesas RZ/T2H eval board
Date: Wed, 29 Jan 2025 16:37:49 +0000
Message-ID: <20250129165122.2980-14-thierry.bultel.yh@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250129165122.2980-1-thierry.bultel.yh@bp.renesas.com>
References: <20250129165122.2980-1-thierry.bultel.yh@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the initial device tree for the RZ/T2H evaluation board.

Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/Makefile          |  1 +
 .../dts/renesas/r9a09g077m44-rzt2h-evk.dts    | 37 +++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 97228a3cb99c..422ff9ccd05e 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -140,6 +140,7 @@ dtb-$(CONFIG_ARCH_R9A08G045) += r9a08g045s33-smarc.dtb
 
 dtb-$(CONFIG_ARCH_R9A09G011) += r9a09g011-v2mevk2.dtb
 
+dtb-$(CONFIG_ARCH_R9A09G077) += r9a09g077m44-rzt2h-evk.dtb
 dtb-$(CONFIG_ARCH_R9A09G057) += r9a09g057h44-rzv2h-evk.dtb
 
 dtb-$(CONFIG_ARCH_RCAR_GEN3) += draak-ebisu-panel-aa104xd12.dtbo
diff --git a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
new file mode 100644
index 000000000000..f2b448aaec82
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
@@ -0,0 +1,37 @@
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
+	compatible = "renesas,r9a9g077m44-rzt2h-evk", "renesas,r9a9g077";
+
+	aliases {
+		serial0 = &sci0;
+	};
+
+	chosen {
+		bootargs = "ignore_loglevel";
+		stdout-path = "serial0:115200n8";
+	};
+
+};
+
+&extal {
+	clock-frequency = <25000000>;
+};
+
+&loco {
+	clock-frequency = <1000000>;
+};
+
+&sci0 {
+	status = "okay";
+};
-- 
2.43.0


