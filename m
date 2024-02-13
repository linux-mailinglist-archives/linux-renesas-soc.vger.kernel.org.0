Return-Path: <linux-renesas-soc+bounces-2690-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F2C8532BA
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Feb 2024 15:11:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B78F01F26545
	for <lists+linux-renesas-soc@lfdr.de>; Tue, 13 Feb 2024 14:11:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33D4957310;
	Tue, 13 Feb 2024 14:11:34 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09E7D56770;
	Tue, 13 Feb 2024 14:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707833494; cv=none; b=lNT+KPTVYu27vZsa4SOhmkWB5Th78dva1Pc5yvGx+o9TL7pbWahuB4prle7Ysi1Hnk1Rgs0Vezq6Keet+Dzbay+GlLKx+oKy01Ka0CgMzrvpiMT5tfFu8gAf+rRCHUp/QxQjnTyS1CghYy3vEmQpNqvf+op532h6nKLyLdaIhJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707833494; c=relaxed/simple;
	bh=FfMfq+QYwXRgRU9iHsMJ8lQjypM1kw4cHRme5vED+QQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Stp4lDKZrUlIYGXTTH3t1Ckg9IAyKLtH++NrAEM1puYnZK+diYKHvLAbp1dklqN3VMUhCriXrxtZy4oifnyNNtQhmoApiF9vhrTEvFwlUaUad1KmnLhz6Xp7DJ7zduB1nwI75e90WibtcTrZa15c/4ZSViPNxa/MNgqoDNxI+jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.06,157,1705330800"; 
   d="scan'208";a="193788353"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 13 Feb 2024 23:11:30 +0900
Received: from localhost.localdomain (unknown [10.226.93.58])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id ABBCE4003EA8;
	Tue, 13 Feb 2024 23:11:27 +0900 (JST)
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Biju Das <biju.das.au@gmail.com>
Subject: [PATCH] arm64: dts: renesas: rzg2ul-smarc: Enable CRU, CSI support
Date: Tue, 13 Feb 2024 14:11:25 +0000
Message-Id: <20240213141125.159758-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-renesas-soc@vger.kernel.org
List-Id: <linux-renesas-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-renesas-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-renesas-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable CRU, CSI on RZ/G2UL SMARC EVK and tie the CSI to the OV5645 sensor
using Device Tree overlay.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Note:
 * This patch has a functional dependecy [1]
   [1] https://lore.kernel.org/all/20240213140240.159057-1-biju.das.jz@bp.renesas.com/
v2->v3:
 * Added missing r9a07g043u11-smarc-cru-csi-ov5645.dtbo entry in Makefile.
 * Made this as separate patch as SoC dtsi is accepted and dropping the
   i2c workaround patch for ov5645.
v1->v2:
 * No change.
---
 arch/arm64/boot/dts/renesas/Makefile          |  3 +++
 .../r9a07g043u11-smarc-cru-csi-ov5645.dtso    | 21 +++++++++++++++++++
 2 files changed, 24 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g043u11-smarc-cru-csi-ov5645.dtso

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 4c5ac5f02829..5f3e0e61d78d 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -108,7 +108,10 @@ r8a779m5-salvator-xs-panel-aa104xd12-dtbs := r8a779m5-salvator-xs.dtb salvator-p
 dtb-$(CONFIG_ARCH_R8A77965) += r8a779m5-salvator-xs-panel-aa104xd12.dtb
 
 dtb-$(CONFIG_ARCH_R9A07G043) += r9a07g043u11-smarc.dtb
+dtb-$(CONFIG_ARCH_R9A07G043) += r9a07g043u11-smarc-cru-csi-ov5645.dtbo
 dtb-$(CONFIG_ARCH_R9A07G043) += r9a07g043-smarc-pmod.dtbo
+r9a07g043u11-smarc-cru-csi-ov5645-dtbs := r9a07g043u11-smarc.dtb r9a07g043u11-smarc-cru-csi-ov5645.dtbo
+dtb-$(CONFIG_ARCH_R9A07G043) += r9a07g043u11-smarc-cru-csi-ov5645.dtb
 r9a07g043u11-smarc-pmod-dtbs := r9a07g043u11-smarc.dtb r9a07g043-smarc-pmod.dtbo
 dtb-$(CONFIG_ARCH_R9A07G043) += r9a07g043u11-smarc-pmod.dtb
 
diff --git a/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc-cru-csi-ov5645.dtso b/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc-cru-csi-ov5645.dtso
new file mode 100644
index 000000000000..b41bb4b31a26
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc-cru-csi-ov5645.dtso
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree overlay for the RZ/G2UL SMARC EVK with OV5645 camera
+ * connected to CSI and CRU enabled.
+ *
+ * Copyright (C) 2024 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
+
+#define OV5645_PARENT_I2C i2c0
+#include "rz-smarc-cru-csi-ov5645.dtsi"
+
+&ov5645 {
+	enable-gpios = <&pinctrl RZG2L_GPIO(4, 4) GPIO_ACTIVE_HIGH>;
+	reset-gpios = <&pinctrl RZG2L_GPIO(0, 1) GPIO_ACTIVE_LOW>;
+};
-- 
2.25.1


