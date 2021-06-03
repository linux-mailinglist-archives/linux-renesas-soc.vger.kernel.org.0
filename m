Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D85039ADC9
	for <lists+linux-renesas-soc@lfdr.de>; Fri,  4 Jun 2021 00:19:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231382AbhFCWUp (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 3 Jun 2021 18:20:45 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:39004 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S230265AbhFCWUp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Jun 2021 18:20:45 -0400
X-IronPort-AV: E=Sophos;i="5.83,246,1616425200"; 
   d="scan'208";a="83182185"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 04 Jun 2021 07:18:59 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 49437410B534;
        Fri,  4 Jun 2021 07:18:55 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-serial@vger.kernel.org
Cc:     Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 12/12] arm64: dts: renesas: Add initial device tree for RZ/G2L SMARC EVK
Date:   Thu,  3 Jun 2021 23:17:58 +0100
Message-Id: <20210603221758.10305-13-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210603221758.10305-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20210603221758.10305-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add basic support for RZ/G2L SMARC EVK (based on R9A07G044L2):
- memory
- External input clock
- SCIF

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/Makefile          |  2 ++
 .../boot/dts/renesas/r9a07g044l2-smarc.dts    | 21 +++++++++++++++
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi  | 27 +++++++++++++++++++
 3 files changed, 50 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dts
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index f2de2fa0c8b8..68e30e26564b 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -62,3 +62,5 @@ dtb-$(CONFIG_ARCH_R8A77990) += r8a77990-ebisu.dtb
 dtb-$(CONFIG_ARCH_R8A77995) += r8a77995-draak.dtb
 
 dtb-$(CONFIG_ARCH_R8A779A0) += r8a779a0-falcon.dtb
+
+dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-smarc.dtb
diff --git a/arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dts b/arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dts
new file mode 100644
index 000000000000..de2b86cac577
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/G2L SMARC EVK board
+ *
+ * Copyright (C) 2021 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+#include "r9a07g044.dtsi"
+#include "rzg2l-smarc.dtsi"
+
+/ {
+	model = "Renesas SMARC EVK based on r9a07g044l2";
+	compatible = "renesas,smarc-evk", "renesas,r9a07g044l2", "renesas,r9a07g044";
+
+	memory@48000000 {
+		device_type = "memory";
+		/* first 128MB is reserved for secure area. */
+		reg = <0x0 0x48000000 0x0 0x78000000>;
+	};
+};
diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
new file mode 100644
index 000000000000..adcd4f50519e
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/G2L SMARC EVK common parts
+ *
+ * Copyright (C) 2021 Renesas Electronics Corp.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+
+/ {
+	aliases {
+		serial0 = &scif0;
+	};
+
+	chosen {
+		bootargs = "ignore_loglevel";
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&extal_clk {
+	clock-frequency = <24000000>;
+};
+
+&scif0 {
+	status = "okay";
+};
-- 
2.17.1

