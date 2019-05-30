Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 243E12FED9
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 30 May 2019 17:05:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725961AbfE3PFa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 30 May 2019 11:05:30 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:52746 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725440AbfE3PFa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 May 2019 11:05:30 -0400
X-IronPort-AV: E=Sophos;i="5.60,531,1549897200"; 
   d="scan'208";a="17188372"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 31 May 2019 00:05:29 +0900
Received: from be1yocto.ree.adwin.renesas.com (unknown [172.29.43.62])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 94E48428A246;
        Fri, 31 May 2019 00:05:26 +0900 (JST)
From:   Biju Das <biju.das@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>, xu_shunji@hoperun.com,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH 1/3] arm64: dts: renesas: Add HiHope RZ/G2M main board support
Date:   Thu, 30 May 2019 15:57:44 +0100
Message-Id: <1559228266-16724-2-git-send-email-biju.das@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559228266-16724-1-git-send-email-biju.das@bp.renesas.com>
References: <1559228266-16724-1-git-send-email-biju.das@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Basic support for the HiHope RZ/G2M main board:
  - Memory,
  - Main crystal,
  - Serial console

This patch also includes a dtsi common to both HiHope RZ/G2M
and RZ/G2N main boards.

Signed-off-by: Biju Das <biju.das@bp.renesas.com>
Reviewed-by: Chris Paterson <Chris.Paterson2@renesas.com>
---
 arch/arm64/boot/dts/renesas/Makefile               |  1 +
 arch/arm64/boot/dts/renesas/hihope-common.dtsi     | 33 ++++++++++++++++++++++
 .../boot/dts/renesas/r8a774a1-hihope-rzg2m.dts     | 26 +++++++++++++++++
 3 files changed, 60 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/hihope-common.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 6cde526..aa33074 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m.dtb
 dtb-$(CONFIG_ARCH_R8A774C0) += r8a774c0-cat874.dtb r8a774c0-ek874.dtb
 dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-salvator-x.dtb r8a7795-h3ulcb.dtb
 dtb-$(CONFIG_ARCH_R8A7795) += r8a7795-h3ulcb-kf.dtb
diff --git a/arch/arm64/boot/dts/renesas/hihope-common.dtsi b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
new file mode 100644
index 0000000..5baf532
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the HiHope RZ/G2[MN] main board common parts
+ *
+ * Copyright (C) 2019 Renesas Electronics Corp.
+ */
+
+/ {
+	aliases {
+		serial0 = &scif2;
+	};
+
+	chosen {
+		bootargs = "ignore_loglevel";
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&extal_clk {
+	clock-frequency = <16666666>;
+};
+
+&extalr_clk {
+	clock-frequency = <32768>;
+};
+
+&scif2 {
+	status = "okay";
+};
+
+&scif_clk {
+	clock-frequency = <14745600>;
+};
diff --git a/arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m.dts b/arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m.dts
new file mode 100644
index 0000000..93ca973
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m.dts
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the HiHope RZ/G2M main board
+ *
+ * Copyright (C) 2019 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+#include "r8a774a1.dtsi"
+#include "hihope-common.dtsi"
+
+/ {
+	model = "HopeRun HiHope RZ/G2M main board based on r8a774a1";
+	compatible = "hoperun,hihope-rzg2m", "renesas,r8a774a1";
+
+	memory@48000000 {
+		device_type = "memory";
+		/* first 128MB is reserved for secure area. */
+		reg = <0x0 0x48000000 0x0 0x78000000>;
+	};
+
+	memory@600000000 {
+		device_type = "memory";
+		reg = <0x6 0x00000000 0x0 0x80000000>;
+	};
+};
-- 
2.7.4

