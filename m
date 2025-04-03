Return-Path: <linux-renesas-soc+bounces-15355-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E8DA7B17C
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Apr 2025 23:40:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F14243BE5E0
	for <lists+linux-renesas-soc@lfdr.de>; Thu,  3 Apr 2025 21:34:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A2C01F0E38;
	Thu,  3 Apr 2025 21:31:06 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2876519AD48;
	Thu,  3 Apr 2025 21:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743715866; cv=none; b=TB0DhtDKS9FXuqZoMiSZFa7IIBQ62+59HSDdYTAlt3ECXgu8WcG10ZEW6QV4JORAYej3Z8yEQmqYIAONORPumu4KiGaY8l15TKwEdCLQW8i/VWLbb3FKrofkP8R36IWnkQn32cC41fYgas8AtgqSU6Awb2PjXtwr4SaOVsDIT70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743715866; c=relaxed/simple;
	bh=CfeEf4wR0cQTAxNr/eTaIB55a8DyWDWKCt7DPSOAfHI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RYtoAeus3S1pBPK8lP4S2wknjOaZxQXl5ffLaASjsu+bRawHTsTLDi8FGDhKCCpY8/asyCZwGTLH3u+v4Uk1XDbV+TPJu2vNxF2H4A+u3yxfIEQ0QVOpMncYvW2rRxUv+qfjvesWFi7vnjGEJoZVbqa5npXDyx3v0voo1QeBzmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: tVWAIvTYSZaFr9z6wE+d0g==
X-CSE-MsgGUID: v6+IOjSFQUOegxR+qhykSA==
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 04 Apr 2025 06:31:03 +0900
Received: from superbuilder.administration.lan (unknown [10.226.92.33])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 0BF7440B55D9;
	Fri,  4 Apr 2025 06:31:00 +0900 (JST)
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: thierry.bultel@linatsea.fr
Cc: linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org,
	paul.barker.ct@bp.renesas.com,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 12/13] arm64: dts: renesas: Add initial support for renesas RZ/T2H eval board
Date: Thu,  3 Apr 2025 23:29:14 +0200
Message-ID: <20250403212919.1137670-13-thierry.bultel.yh@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250403212919.1137670-1-thierry.bultel.yh@bp.renesas.com>
References: <20250403212919.1137670-1-thierry.bultel.yh@bp.renesas.com>
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
Changes v6->v7:
  - lands in arm64 directory instead of arm
Changes v5->v6: rebased on next-20250331
Changes v4->v5: none
Changes v3->v4: none
---
 arch/arm64/boot/dts/renesas/Makefile          |  1 +
 .../dts/renesas/r9a09g077m44-rzt2h-evk.dts    | 35 +++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index d25e665ee4bf..14e2b41b6e13 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -152,6 +152,7 @@ dtb-$(CONFIG_ARCH_R9A09G011) += r9a09g011-v2mevk2.dtb
 
 dtb-$(CONFIG_ARCH_R9A09G047) += r9a09g047e57-smarc.dtb
 
+dtb-$(CONFIG_ARCH_R9A09G077) += r9a09g077m44-rzt2h-evk.dtb
 dtb-$(CONFIG_ARCH_R9A09G057) += r9a09g057h44-rzv2h-evk.dtb
 dtb-$(CONFIG_ARCH_R9A09G057) += r9a09g057h48-kakip.dtb
 
diff --git a/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
new file mode 100644
index 000000000000..c87b95468023
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
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


