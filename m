Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE992284ADC
	for <lists+linux-renesas-soc@lfdr.de>; Tue,  6 Oct 2020 13:27:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726329AbgJFL1Z (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Tue, 6 Oct 2020 07:27:25 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:48123 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726248AbgJFL1V (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Oct 2020 07:27:21 -0400
X-IronPort-AV: E=Sophos;i="5.77,342,1596466800"; 
   d="scan'208";a="58834752"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 06 Oct 2020 20:27:18 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id CE75D42CD75D;
        Tue,  6 Oct 2020 20:27:16 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 3/4] arm64: dts: renesas: Add support for MIPI Adapter V2.1 connected to HiHope RZ/G2M
Date:   Tue,  6 Oct 2020 12:27:00 +0100
Message-Id: <20201006112701.11800-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201006112701.11800-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20201006112701.11800-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for AISTARVISION MIPI Adapter V2.1 board connected to HiHope
RZ/G2M board.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/Makefile             |  1 +
 .../r8a774a1-hihope-rzg2m-ex-mipi-2.1.dts        | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex-mipi-2.1.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index f98e9e2e520d..6581d19a3217 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -6,6 +6,7 @@ dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m-ex-idk-1110wr.dtb
 dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m-rev2.dtb
 dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m-rev2-ex.dtb
 dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m-rev2-ex-idk-1110wr.dtb
+dtb-$(CONFIG_ARCH_R8A774A1) += r8a774a1-hihope-rzg2m-ex-mipi-2.1.dtb
 
 dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-hihope-rzg2n.dtb
 dtb-$(CONFIG_ARCH_R8A774B1) += r8a774b1-hihope-rzg2n-ex.dtb
diff --git a/arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex-mipi-2.1.dts b/arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex-mipi-2.1.dts
new file mode 100644
index 000000000000..2fdbe51da981
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a774a1-hihope-rzg2m-ex-mipi-2.1.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the HiHope RZ/G2M board
+ * connected with aistarvision-mipi-v2-adapter board
+ *
+ * Copyright (C) 2020 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+#include "r8a774a1-hihope-rzg2m-ex.dts"
+#include "hihope-rzg2-ex-aistarvision-mipi-adapter-2.1.dtsi"
+
+/ {
+	model = "HopeRun HiHope RZ/G2M with sub board connected with aistarvision-mipi-v2-adapter board";
+	compatible = "hoperun,hihope-rzg2m", "renesas,r8a774a1";
+};
-- 
2.17.1

