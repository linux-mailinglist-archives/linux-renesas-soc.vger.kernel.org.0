Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09168254CE1
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 27 Aug 2020 20:20:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726887AbgH0SUE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 27 Aug 2020 14:20:04 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:38182 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726120AbgH0SUE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Aug 2020 14:20:04 -0400
X-IronPort-AV: E=Sophos;i="5.76,360,1592838000"; 
   d="scan'208";a="55707965"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 28 Aug 2020 03:20:01 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 99E274009650;
        Fri, 28 Aug 2020 03:19:59 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: [PATCH] arm64: dts: renesas: Add HiHope RZ/G2H board with idk-1110wr display
Date:   Thu, 27 Aug 2020 19:19:18 +0100
Message-Id: <20200827181918.30130-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

The HiHope RZ/G2H is advertised as compatible with panel idk-1110wr from
Advantech, however the panel isn't sold alongside the board. New dts,
enabling the lvds node to get the panel to work with HiHope RZ/G2H.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/Makefile              |  1 +
 .../r8a774e1-hihope-rzg2h-ex-idk-1110wr.dts       | 15 +++++++++++++++
 2 files changed, 16 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-idk-1110wr.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index d7902294faf3..46445474cf3e 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -21,6 +21,7 @@ dtb-$(CONFIG_ARCH_R8A774C0) += r8a774c0-ek874-mipi-2.1.dtb
 
 dtb-$(CONFIG_ARCH_R8A774E1) += r8a774e1-hihope-rzg2h.dtb
 dtb-$(CONFIG_ARCH_R8A774E1) += r8a774e1-hihope-rzg2h-ex.dtb
+dtb-$(CONFIG_ARCH_R8A774E1) += r8a774e1-hihope-rzg2h-ex-idk-1110wr.dtb
 
 dtb-$(CONFIG_ARCH_R8A77950) += r8a77950-salvator-x.dtb
 dtb-$(CONFIG_ARCH_R8A77950) += r8a77950-ulcb.dtb
diff --git a/arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-idk-1110wr.dts b/arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-idk-1110wr.dts
new file mode 100644
index 000000000000..3b7339127bc0
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-idk-1110wr.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the HiHope RZ/G2H sub board connected
+ * to an Advantech IDK-1110WR 10.1" LVDS panel
+ *
+ * Copyright (C) 2020 Renesas Electronics Corp.
+ */
+
+#include "r8a774e1-hihope-rzg2h-ex.dts"
+#include "hihope-rzg2-ex-lvds.dtsi"
+#include "rzg2-advantech-idk-1110wr-panel.dtsi"
+
+&lvds0 {
+	status = "okay";
+};
-- 
2.17.1

