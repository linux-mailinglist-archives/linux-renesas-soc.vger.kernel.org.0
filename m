Return-Path: <linux-renesas-soc+bounces-15160-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A9EA765F8
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 14:30:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D2F23AC517
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 31 Mar 2025 12:29:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7BA31EB1BA;
	Mon, 31 Mar 2025 12:28:30 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5E151EB1A1;
	Mon, 31 Mar 2025 12:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743424110; cv=none; b=UoJ6sGxshAWqrRFkhBfkw2yN43AkEMfIaULBedqzy7wTyQVY5vvZkRU3SCz7c/f9hKRjg9aFjZvK+6TBoUE8TKlQO0OPUdYse3AQO+l2U3uoyljofBswrZ8DBEi+QK3U+yJkv1qdIz2ulIb+QN5d0HYVtAYVlfW8wYkOy0RI7ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743424110; c=relaxed/simple;
	bh=h6iEDI2TPZkv8g2aW0CPmqG8eTAZujYXo2PU9+2HQZw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZnC+xxOI+JK1JU6hWu6lsIvu24HcrGl/UXHXeetAi7DtF/RI3vaROVWRDmP0CL9gk9gVo9XgSkd1wkPQdvnNcfb+4w1bRfyTwqtSRPfb5rj41bO58NZnTs6krFkysZGQwg/FKNULGbkx1oLKihcdmt2MCxzhH4J/p7ZBbO3WlOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: tsyzjTXnS6W90L0CGOozMA==
X-CSE-MsgGUID: UVj78TAJSrmQKwQVDhXGig==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 31 Mar 2025 21:28:28 +0900
Received: from superbuilder.administration.lan (unknown [10.226.93.144])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id DDA5041F5818;
	Mon, 31 Mar 2025 21:28:25 +0900 (JST)
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: thierry.bultel@linatsea.fr
Cc: linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org,
	paul.barker.ct@bp.renesas.com,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 12/13] arm64: dts: renesas: Add initial support for renesas RZ/T2H eval board
Date: Mon, 31 Mar 2025 14:26:53 +0200
Message-ID: <20250331122657.3390355-13-thierry.bultel.yh@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250331122657.3390355-1-thierry.bultel.yh@bp.renesas.com>
References: <20250331122657.3390355-1-thierry.bultel.yh@bp.renesas.com>
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
Changes v5->v6: rebased on next-20250331
Changes v4->v5: none
Changes v3->v4: none
---
 arch/arm/boot/dts/renesas/Makefile            |  1 +
 .../dts/renesas/r9a09g077m44-rzt2h-evk.dts    | 35 +++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 arch/arm/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts

diff --git a/arch/arm/boot/dts/renesas/Makefile b/arch/arm/boot/dts/renesas/Makefile
index 833a02447ecf..213a9819f965 100644
--- a/arch/arm/boot/dts/renesas/Makefile
+++ b/arch/arm/boot/dts/renesas/Makefile
@@ -30,4 +30,5 @@ dtb-$(CONFIG_ARCH_RENESAS) += \
 	r8a7794-alt.dtb \
 	r8a7794-silk.dtb \
 	r9a06g032-rzn1d400-db.dtb \
+	r9a09g077m44-rzt2h-evk.dtb \
 	sh73a0-kzm9g.dtb
diff --git a/arch/arm/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts b/arch/arm/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
new file mode 100644
index 000000000000..c87b95468023
--- /dev/null
+++ b/arch/arm/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+* Device Tree Source for the RZ/T2H Development EVK board
+*
+* Copyright (C) 2025 Renesas Electronics Corp.
+*/
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


