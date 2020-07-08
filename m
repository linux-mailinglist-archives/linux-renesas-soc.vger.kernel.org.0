Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03233218F19
	for <lists+linux-renesas-soc@lfdr.de>; Wed,  8 Jul 2020 19:50:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728737AbgGHRtF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 8 Jul 2020 13:49:05 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:47661 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728721AbgGHRtF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 8 Jul 2020 13:49:05 -0400
X-IronPort-AV: E=Sophos;i="5.75,328,1589209200"; 
   d="scan'208";a="51430147"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 09 Jul 2020 02:49:04 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 9DB7C4005E3D;
        Thu,  9 Jul 2020 02:49:00 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-serial@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 7/8] arm64: dts: renesas: Add HiHope RZ/G2H main board support
Date:   Wed,  8 Jul 2020 18:48:30 +0100
Message-Id: <1594230511-24790-8-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1594230511-24790-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <1594230511-24790-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>

Basic support for the HiHope RZ/G2H main board:
  - Memory,
  - Main crystal,
  - Serial console
  - eMMC

Signed-off-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/Makefile          |  1 +
 .../arm64/boot/dts/renesas/hihope-common.dtsi |  4 +--
 arch/arm64/boot/dts/renesas/hihope-rev4.dtsi  |  4 +--
 .../dts/renesas/r8a774e1-hihope-rzg2h.dts     | 26 +++++++++++++++++++
 4 files changed, 31 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 21cc63469082..0688125f8fbf 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -14,6 +14,7 @@ dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-hihope-rzg2n-ex-idk-1110wr.dtb \
 dtb-$(CONFIG_ARCH_R8A774C0) += r8a774c0-cat874.dtb r8a774c0-ek874.dtb \
 			       r8a774c0-ek874-idk-2121wr.dtb \
 			       r8a774c0-ek874-mipi-2.1.dtb
+dtb-$(CONFIG_ARCH_R8A774E1) += r8a774e1-hihope-rzg2h.dtb
 dtb-$(CONFIG_ARCH_R8A77950) += r8a77950-salvator-x.dtb
 dtb-$(CONFIG_ARCH_R8A77950) += r8a77950-ulcb.dtb r8a77950-ulcb-kf.dtb
 dtb-$(CONFIG_ARCH_R8A77951) += r8a77951-salvator-x.dtb r8a77951-salvator-xs.dtb
diff --git a/arch/arm64/boot/dts/renesas/hihope-common.dtsi b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
index beddfd7a7584..2eda9f66ae81 100644
--- a/arch/arm64/boot/dts/renesas/hihope-common.dtsi
+++ b/arch/arm64/boot/dts/renesas/hihope-common.dtsi
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Device Tree Source for the HiHope RZ/G2[MN] main board
- * Rev.[2.0/3.0/4.0] common parts
+ * Device Tree Source for the HiHope RZ/G2H Rev.4.0 and
+ * HiHope RZ/G2[MN] Rev.[2.0/3.0/4.0] main board common parts
  *
  * Copyright (C) 2019 Renesas Electronics Corp.
  */
diff --git a/arch/arm64/boot/dts/renesas/hihope-rev4.dtsi b/arch/arm64/boot/dts/renesas/hihope-rev4.dtsi
index 9f869187aea6..3046c07a288b 100644
--- a/arch/arm64/boot/dts/renesas/hihope-rev4.dtsi
+++ b/arch/arm64/boot/dts/renesas/hihope-rev4.dtsi
@@ -1,7 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Device Tree Source for the HiHope RZ/G2[MN] Rev.3.0/4.0 main board
- * common parts
+ * Device Tree Source for the HiHope RZ/G2H Rev.4.0 and
+ * HiHope RZ/G2[MN] Rev.3.0/4.0 main board common parts
  *
  * Copyright (C) 2020 Renesas Electronics Corp.
  */
diff --git a/arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h.dts b/arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h.dts
new file mode 100644
index 000000000000..cdbe527e9340
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h.dts
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the HiHope RZ/G2H main board
+ *
+ * Copyright (C) 2020 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+#include "r8a774e1.dtsi"
+#include "hihope-rev4.dtsi"
+
+/ {
+	model = "HopeRun HiHope RZ/G2H main board based on r8a774e1";
+	compatible = "hoperun,hihope-rzg2h", "renesas,r8a774e1";
+
+	memory@48000000 {
+		device_type = "memory";
+		/* first 128MB is reserved for secure area. */
+		reg = <0x0 0x48000000 0x0 0x78000000>;
+	};
+
+	memory@500000000 {
+		device_type = "memory";
+		reg = <0x5 0x00000000 0x0 0x80000000>;
+	};
+};
-- 
2.17.1

