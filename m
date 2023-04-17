Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCA486E4312
	for <lists+linux-renesas-soc@lfdr.de>; Mon, 17 Apr 2023 11:02:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230429AbjDQJC3 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Mon, 17 Apr 2023 05:02:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230350AbjDQJCQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Apr 2023 05:02:16 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C12911FFC;
        Mon, 17 Apr 2023 02:02:10 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.99,203,1677510000"; 
   d="scan'208";a="159710161"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 17 Apr 2023 18:02:10 +0900
Received: from localhost.localdomain (unknown [10.226.92.249])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id EE596400CEF2;
        Mon, 17 Apr 2023 18:02:07 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 3/3] arm64: dts: renesas: rzg2l-smarc: Enable MTU3a counter using DT overlay
Date:   Mon, 17 Apr 2023 10:01:59 +0100
Message-Id: <20230417090159.191346-3-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230417090159.191346-1-biju.das.jz@bp.renesas.com>
References: <20230417090159.191346-1-biju.das.jz@bp.renesas.com>
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

Enable mtu3 node using dt overlay and disable scif2 node and delete
{sd1_mux,sd1_mux_uhs} nodes as the pins are shared with mtu3 external
clock input pins and Z phase signal(MTIOC1A).

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
 arch/arm64/boot/dts/renesas/Makefile          |  2 +
 .../boot/dts/renesas/rzg2l-smarc-pmod.dtso    | 43 +++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/rzg2l-smarc-pmod.dtso

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index f130165577a8..57727bcd1334 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -81,8 +81,10 @@ dtb-$(CONFIG_ARCH_R9A07G043) += r9a07g043-smarc-pmod.dtbo
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044c2-smarc.dtb
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-smarc.dtb
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-smarc-cru-csi-ov5645.dtbo
+dtb-$(CONFIG_ARCH_R9A07G044) += rzg2l-smarc-pmod.dtbo
 
 dtb-$(CONFIG_ARCH_R9A07G054) += r9a07g054l2-smarc.dtb
+dtb-$(CONFIG_ARCH_R9A07G054) += rzg2l-smarc-pmod.dtbo
 
 dtb-$(CONFIG_ARCH_R9A09G011) += r9a09g011-v2mevk2.dtb
 
diff --git a/arch/arm64/boot/dts/renesas/rzg2l-smarc-pmod.dtso b/arch/arm64/boot/dts/renesas/rzg2l-smarc-pmod.dtso
new file mode 100644
index 000000000000..a502faf6e1ad
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/rzg2l-smarc-pmod.dtso
@@ -0,0 +1,43 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Device Tree Source for the RZ/{G2L,V2L} SMARC EVK PMOD parts
+ *
+ * Copyright (C) 2023 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/pinctrl/rzg2l-pinctrl.h>
+
+&mtu3 {
+	pinctrl-0 = <&mtu3_pins>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pinctrl {
+	mtu3_pins: mtu3 {
+		mtu3-zphase-clk {
+			pinmux = <RZG2L_PORT_PINMUX(19, 0, 3)>; /* MTIOC1A */
+		};
+
+		mtu3-ext-clk-input-pin {
+			pinmux = <RZG2L_PORT_PINMUX(48, 0, 4)>, /* MTCLKA */
+				 <RZG2L_PORT_PINMUX(48, 1, 4)>; /* MTCLKB */
+		};
+	};
+};
+
+&scif2 {
+	status = "disabled";
+};
+
+&sdhi1_pins {
+	/delete-node/ sd1_mux;
+};
+
+&sdhi1_pins_uhs {
+	/delete-node/ sd1_mux_uhs;
+};
-- 
2.25.1

