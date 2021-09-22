Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6498641529F
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 22 Sep 2021 23:21:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238084AbhIVVWa (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 22 Sep 2021 17:22:30 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:51796 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S238182AbhIVVW2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Sep 2021 17:22:28 -0400
X-IronPort-AV: E=Sophos;i="5.85,315,1624287600"; 
   d="scan'208";a="94853362"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 23 Sep 2021 06:20:57 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 1D6AA41041EC;
        Thu, 23 Sep 2021 06:20:55 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/3] arm64: dts: renesas: rzg2l-smarc-som: Move extal and memory nodes to SOM DTSI
Date:   Wed, 22 Sep 2021 22:20:47 +0100
Message-Id: <20210922212049.19851-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210922212049.19851-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20210922212049.19851-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Move extal and memory nodes to SOM DTSI.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 .../boot/dts/renesas/r9a07g044l2-smarc.dts     |  7 +------
 .../boot/dts/renesas/rzg2l-smarc-som.dtsi      | 18 ++++++++++++++++++
 arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi   |  4 ----
 3 files changed, 19 insertions(+), 10 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi

diff --git a/arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dts b/arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dts
index d3f72ec62f03..247b0b3f1b58 100644
--- a/arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dts
+++ b/arch/arm64/boot/dts/renesas/r9a07g044l2-smarc.dts
@@ -7,15 +7,10 @@
 
 /dts-v1/;
 #include "r9a07g044l2.dtsi"
+#include "rzg2l-smarc-som.dtsi"
 #include "rzg2l-smarc.dtsi"
 
 / {
 	model = "Renesas SMARC EVK based on r9a07g044l2";
 	compatible = "renesas,smarc-evk", "renesas,r9a07g044l2", "renesas,r9a07g044";
-
-	memory@48000000 {
-		device_type = "memory";
-		/* first 128MB is reserved for secure area. */
-		reg = <0x0 0x48000000 0x0 0x78000000>;
-	};
 };
diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
new file mode 100644
index 000000000000..0748f2e7396a
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/G2L SMARC SOM common parts
+ *
+ * Copyright (C) 2021 Renesas Electronics Corp.
+ */
+
+/ {
+	memory@48000000 {
+		device_type = "memory";
+		/* first 128MB is reserved for secure area. */
+		reg = <0x0 0x48000000 0x0 0x78000000>;
+	};
+};
+
+&extal_clk {
+	clock-frequency = <24000000>;
+};
diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
index 39e05169aaaa..e895f6e7fa28 100644
--- a/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
+++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc.dtsi
@@ -89,10 +89,6 @@
 	status = "okay";
 };
 
-&extal_clk {
-	clock-frequency = <24000000>;
-};
-
 &hsusb {
 	dr_mode = "otg";
 	status = "okay";
-- 
2.17.1

