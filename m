Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38AD81F0E27
	for <lists+linux-renesas-soc@lfdr.de>; Sun,  7 Jun 2020 20:42:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728655AbgFGSmM (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Sun, 7 Jun 2020 14:42:12 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:53263 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728629AbgFGSmL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 7 Jun 2020 14:42:11 -0400
X-IronPort-AV: E=Sophos;i="5.73,485,1583161200"; 
   d="scan'208";a="49036351"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 08 Jun 2020 03:42:10 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 6161640CD55B;
        Mon,  8 Jun 2020 03:42:08 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 11/11] arm64: dts: renesas: Add HiHope RZ/G2N Rev2.0/3.0/4.0 board with idk-1110wr display
Date:   Sun,  7 Jun 2020 19:41:07 +0100
Message-Id: <1591555267-21822-11-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1591555267-21822-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <1591555267-21822-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The HiHope RZ/G2N variants are advertised as compatible with panel
idk-1110wr from Advantech, however the panel isn't sold alongside the
board. New dts's, enabling the lvds node to get the panel to work with
all the HiHope RZ/G2N variants.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Marian-Cristian Rotariu <marian-cristian.rotariu.rb@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/Makefile              |  2 ++
 .../r8a774b1-hihope-rzg2n-ex-idk-1110wr.dts       | 15 +++++++++++++++
 .../r8a774b1-hihope-rzg2n-rev2-ex-idk-1110wr.dts  | 15 +++++++++++++++
 3 files changed, 32 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-ex-idk-1110wr.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2-ex-idk-1110wr.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 6ac2a197e06e..21cc63469082 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -9,6 +9,8 @@ dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-hihope-rzg2n.dtb \
 			       r8a774b1-hihope-rzg2n-rev2.dtb
 dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-hihope-rzg2n-ex.dtb \
 			       r8a774b1-hihope-rzg2n-rev2-ex.dtb
+dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-hihope-rzg2n-ex-idk-1110wr.dtb \
+			       r8a774b1-hihope-rzg2n-rev2-ex-idk-1110wr.dtb
 dtb-$(CONFIG_ARCH_R8A774C0) += r8a774c0-cat874.dtb r8a774c0-ek874.dtb \
 			       r8a774c0-ek874-idk-2121wr.dtb \
 			       r8a774c0-ek874-mipi-2.1.dtb
diff --git a/arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-ex-idk-1110wr.dts b/arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-ex-idk-1110wr.dts
new file mode 100644
index 000000000000..4b5154f029a5
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-ex-idk-1110wr.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the HiHope RZ/G2N Rev.3.0/4.0 with sub board connected
+ * to an Advantech IDK-1110WR 10.1" LVDS panel
+ *
+ * Copyright (C) 2020 Renesas Electronics Corp.
+ */
+
+#include "r8a774b1-hihope-rzg2n-ex.dts"
+#include "hihope-rzg2-ex-lvds.dtsi"
+#include "rzg2-advantech-idk-1110wr-panel.dtsi"
+
+&lvds0 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2-ex-idk-1110wr.dts b/arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2-ex-idk-1110wr.dts
new file mode 100644
index 000000000000..e730b3b25dbe
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a774b1-hihope-rzg2n-rev2-ex-idk-1110wr.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the HiHope RZ/G2N Rev.2.0 with sub board connected
+ * to an Advantech IDK-1110WR 10.1" LVDS panel
+ *
+ * Copyright (C) 2020 Renesas Electronics Corp.
+ */
+
+#include "r8a774b1-hihope-rzg2n-rev2-ex.dts"
+#include "hihope-rzg2-ex-lvds.dtsi"
+#include "rzg2-advantech-idk-1110wr-panel.dtsi"
+
+&lvds0 {
+	status = "okay";
+};
-- 
2.17.1

