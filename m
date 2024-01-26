Return-Path: <linux-renesas-soc+bounces-1886-lists+linux-renesas-soc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7E383DADF
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jan 2024 14:31:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D78DF1C203BD
	for <lists+linux-renesas-soc@lfdr.de>; Fri, 26 Jan 2024 13:31:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E09811B94D;
	Fri, 26 Jan 2024 13:31:43 +0000 (UTC)
X-Original-To: linux-renesas-soc@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1A1C1B81D;
	Fri, 26 Jan 2024 13:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706275903; cv=none; b=hM6gZVeO8U1IaCZ68QaoqFUD/H97PVISZ74rlsMQU22toQ1Hryi6DuYN17qWfMcsBWaV6fHhbl9aBf//Jt6FgL96l2f/2uZH/XI16NVZY3XTcW1sGjduPlVR8LK7OzNr1XXfI8oSRWW+aqd0dJ0R3HPUq6ZvX2kgUgiNlTNYHPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706275903; c=relaxed/simple;
	bh=b5dMAP1HxiRTQtlonrmTx+T42NXsmwraOPHRUZSV0FM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nBqYQ6AlCaO+5tyU8OtHgBIjkltTxOhPmG5OtM4MSWBGJ/fdzP5jmx5Jm0i+aeSyFFCMkya579+tSe+dOntaBHbj0bTYjL6ntSZw8ayXpcUpOszSZT7DMdDdD4XC/cd4NSomKVjEfSav4hF3ZVxFz3YKKdxDkyLR/YJecO47WeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-IronPort-AV: E=Sophos;i="6.05,216,1701097200"; 
   d="scan'208";a="195755075"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 26 Jan 2024 22:31:41 +0900
Received: from localhost.localdomain (unknown [10.226.93.117])
	by relmlir6.idc.renesas.com (Postfix) with ESMTP id 62AE7422D9B8;
	Fri, 26 Jan 2024 22:31:38 +0900 (JST)
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
Subject: [PATCH v2 4/5] arm64: dts: renesas: rzg2ul-smarc: Enable CRU, CSI support
Date: Fri, 26 Jan 2024 13:31:15 +0000
Message-Id: <20240126133116.121981-5-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240126133116.121981-1-biju.das.jz@bp.renesas.com>
References: <20240126133116.121981-1-biju.das.jz@bp.renesas.com>
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
v1->v2:
 * No change.
---
 arch/arm64/boot/dts/renesas/Makefile          |  2 ++
 .../r9a07g043u11-smarc-cru-csi-ov5645.dtso    | 21 +++++++++++++++++++
 2 files changed, 23 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g043u11-smarc-cru-csi-ov5645.dtso

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 8ea68d582710..f46d6f0b26ab 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -104,6 +104,8 @@ dtb-$(CONFIG_ARCH_R8A77965) += r8a779m5-salvator-xs-panel-aa104xd12.dtb
 
 dtb-$(CONFIG_ARCH_R9A07G043) += r9a07g043u11-smarc.dtb
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


