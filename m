Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95BB14E2CBD
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 21 Mar 2022 16:46:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244522AbiCUPsE (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 21 Mar 2022 11:48:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350623AbiCUPr6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Mar 2022 11:47:58 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8BC035C647;
        Mon, 21 Mar 2022 08:46:32 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,198,1643641200"; 
   d="scan'208";a="115216043"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 22 Mar 2022 00:46:31 +0900
Received: from vb.home (unknown [10.226.92.216])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 31D8540078CD;
        Tue, 22 Mar 2022 00:46:30 +0900 (JST)
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH 14/14] arm64: dts: renesas: Add initial device tree for RZ/V2M EVK
Date:   Mon, 21 Mar 2022 15:42:32 +0000
Message-Id: <20220321154232.56315-15-phil.edworthy@renesas.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220321154232.56315-1-phil.edworthy@renesas.com>
References: <20220321154232.56315-1-phil.edworthy@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add basic support for RZ/V2M EVK (based on R9A09G011):
- memory
- External input clock
- UART

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/Makefile          |  2 +
 .../boot/dts/renesas/r9a09g011-v2mevk2.dts    | 45 +++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index d000f6b131dc..06ba849d3db3 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -79,3 +79,5 @@ dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-smarc.dtb
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-smarc.dtb
 
 dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-smarc.dtb
+
+dtb-$(CONFIG_ARCH_R9A09G011) += r9a09g011-v2mevk2.dtb
diff --git a/arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts b/arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts
new file mode 100644
index 000000000000..90172de7851f
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/V2M (r9a09g011) Evaluation Kit Board
+ *
+ * Copyright (C) 2022 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+#include "r9a09g011.dtsi"
+
+/ {
+	model = "RZ/V2M Evaluation Kit 2.0";
+	compatible = "renesas,rzv2mevk2", "renesas,r9a09g011";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@58000000 {
+		device_type = "memory";
+		/* first 128MB is reserved for secure area. */
+		reg = <0x0 0x58000000 0x0 0x28000000>;
+	};
+
+	memory@180000000 {
+		device_type = "memory";
+		reg = <0x1 0x80000000 0x0 0x80000000>;
+	};
+};
+
+&extal_clk {
+	clock-frequency = <48000000>;
+};
+
+&sys {
+	status = "okay";
+};
+
+&uart0 {
+	status = "okay";
+};
-- 
2.32.0

