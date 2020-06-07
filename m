Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A99911F0E2A
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  7 Jun 2020 20:42:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728629AbgFGSmW (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 7 Jun 2020 14:42:22 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:3900 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726752AbgFGSmG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 7 Jun 2020 14:42:06 -0400
X-IronPort-AV: E=Sophos;i="5.73,485,1583161200"; 
   d="scan'208";a="49036344"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 08 Jun 2020 03:42:05 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id E63FE40CD55B;
        Mon,  8 Jun 2020 03:42:03 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 09/11] arm64: dts: renesas: Add HiHope RZ/G2N Rev.3.0/4.0 main board support
Date:   Sun,  7 Jun 2020 19:41:05 +0100
Message-Id: <1591555267-21822-9-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591555267-21822-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <1591555267-21822-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for HiHope RZ/G2N Rev.3.0/4.0 main board support based on
r8a774b1 SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/Makefile          |  3 +-
 .../dts/renesas/r8a774b1-hihope-rzg2n.dts     | 42 +++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi     |  2 +
 3 files changed, 46 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index f09abfc43825..0c152c6048ce 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -5,7 +5,8 @@ dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m-ex.dtb \
 			       r8a774a1-hihope-rzg2m-rev2-ex.dtb
 dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m-ex-idk-1110wr.dtb \
 			       r8a774a1-hihope-rzg2m-rev2-ex-idk-1110wr.dtb
-dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-hihope-rzg2n-rev2.dtb
+dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-hihope-rzg2n.dtb \
+			       r8a774b1-hihope-rzg2n-rev2.dtb
 dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-hihope-rzg2n-rev2-ex.dtb
 dtb-$(CONFIG_ARCH_R8A774C0) += r8a774c0-cat874.dtb r8a774c0-ek874.dtb \
 			       r8a774c0-ek874-idk-2121wr.dtb \
diff --git a/arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n.dts b/arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n.dts
new file mode 100644
index 000000000000..ef3109d0848f
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n.dts
@@ -0,0 +1,42 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the HiHope RZ/G2N main board Rev.3.0/4.0
+ *
+ * Copyright (C) 2020 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+#include "r8a774b1.dtsi"
+#include "hihope-common.dtsi"
+#include "hihope-common-rev4.dtsi"
+
+/ {
+	model = "HopeRun HiHope RZ/G2N main board based on r8a774b1";
+	compatible = "hoperun,hihope-rzg2n", "renesas,r8a774b1";
+
+	memory@48000000 {
+		device_type = "memory";
+		/* first 128MB is reserved for secure area. */
+		reg = <0x0 0x48000000 0x0 0x78000000>;
+	};
+
+	memory@480000000 {
+		device_type = "memory";
+		reg = <0x4 0x80000000 0x0 0x80000000>;
+	};
+};
+
+&du {
+	clocks = <&cpg CPG_MOD 724>,
+		 <&cpg CPG_MOD 723>,
+		 <&cpg CPG_MOD 721>,
+		 <&versaclock5 1>,
+		 <&x302_clk>,
+		 <&versaclock5 2>;
+	clock-names = "du.0", "du.1", "du.3",
+		      "dclkin.0", "dclkin.1", "dclkin.3";
+};
+
+&sdhi3 {
+	mmc-hs400-1_8v;
+};
diff --git a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
index 1e51855c7cd3..b221f2575e63 100644
--- a/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
+++ b/arch/arm64/boot/dts/renesas/r8a774b1.dtsi
@@ -10,6 +10,8 @@
 #include <dt-bindings/clock/r8a774b1-cpg-mssr.h>
 #include <dt-bindings/power/r8a774b1-sysc.h>
 
+#define CPG_AUDIO_CLK_I		R8A774B1_CLK_S0D4
+
 / {
 	compatible = "renesas,r8a774b1";
 	#address-cells = <2>;
-- 
2.17.1

