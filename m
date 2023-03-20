Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6537B6C1006
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 20 Mar 2023 11:59:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230024AbjCTK7f (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 20 Mar 2023 06:59:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229851AbjCTK6k (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Mar 2023 06:58:40 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1BA8A29402;
        Mon, 20 Mar 2023 03:55:07 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.98,274,1673881200"; 
   d="scan'208";a="156562994"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 20 Mar 2023 19:54:02 +0900
Received: from localhost.localdomain (unknown [10.226.92.205])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id E7FA14004937;
        Mon, 20 Mar 2023 19:53:59 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v3 5/5] arm64: dts: renesas: r9a07g044: Enable sci0 nodes using dt overlay
Date:   Mon, 20 Mar 2023 10:53:39 +0000
Message-Id: <20230320105339.236279-6-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230320105339.236279-1-biju.das.jz@bp.renesas.com>
References: <20230320105339.236279-1-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Enable sci0 node using dt overlay and disable can{0,1}-stb-hog
nodes in dt overlay as its pins are shared with sci0 pins.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v3:
 * New patch
---
 arch/arm64/boot/dts/renesas/Makefile          |  1 +
 .../boot/dts/renesas/r9a07g043-smarc.dtso     | 45 +++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g043-smarc.dtso

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 23b10c03091c..be938f360264 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -76,6 +76,7 @@ dtb-$(CONFIG_ARCH_R8A77961) += r8a779m3-ulcb-kf.dtb
 dtb-$(CONFIG_ARCH_R8A77965) += r8a779m5-salvator-xs.dtb
 
 dtb-$(CONFIG_ARCH_R9A07G043) += r9a07g043u11-smarc.dtb
+dtb-$(CONFIG_ARCH_R9A07G043) += r9a07g043-smarc.dtbo
 
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-smarc.dtb
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-smarc.dtb
diff --git a/arch/arm64/boot/dts/renesas/r9a07g043-smarc.dtso b/arch/arm64/boot/dts/renesas/r9a07g043-smarc.dtso
new file mode 100644
index 000000000000..515f9fb82938
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r9a07g043-smarc.dtso
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the RZ/{G2UL, Five} SMARC EVK PMOD parts
+ *
+ * Copyright (C) 2023 Renesas Electronics Corp.
+ *
+ *
+ * [Connection]
+ *
+ * SMARC EVK				PMOD USBUART
+ * +----------------------------+
+ * |CN7 (PMOD1 PIN HEADER)	|
+ * |	SCI0_TXD	  pin7  |<----->| pin2  Tx	|
+ * |	SCI1_RXD	  pin8  |<----->| pin3  Rx	|
+ * |	Gnd	  	  pin11 |<----->| pin5  Gnd	|
+ * |	Vcc	  	  pin12 |<----->| pin6  Vcc	|
+ * +----------------------------+	+---------------+
+ *
+ */
+
+/dts-v1/;
+/plugin/;
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
+
+&pinctrl {
+	can0-stb-hog {
+		status = "disabled";
+	};
+
+	can1-stb-hog {
+		status = "disabled";
+	};
+
+	sci0_pins: sci0-pins {
+		pinmux = <RZG2L_PORT_PINMUX(2, 2, 5)>, /* TxD */
+			 <RZG2L_PORT_PINMUX(2, 3, 5)>; /* RxD */
+	};
+};
+
+&sci0 {
+	pinctrl-0 = <&sci0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
-- 
2.25.1

