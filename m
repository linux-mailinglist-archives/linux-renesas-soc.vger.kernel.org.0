Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10FBD57B249
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Jul 2022 10:08:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237377AbiGTIIP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 20 Jul 2022 04:08:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237196AbiGTIIN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Jul 2022 04:08:13 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D411240BE8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Jul 2022 01:08:11 -0700 (PDT)
Received: from ramsan.of.borg ([84.195.186.194])
        by laurent.telenet-ops.be with bizsmtp
        id xL892700C4C55Sk01L893s; Wed, 20 Jul 2022 10:08:09 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oE4ka-004Ra4-RE; Wed, 20 Jul 2022 10:08:08 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oE4ka-00EsN7-7s; Wed, 20 Jul 2022 10:08:08 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 5/6] arm64: dts: renesas: Add support for H3ULCB with R-Car H3Ne-1.7G
Date:   Wed, 20 Jul 2022 10:08:06 +0200
Message-Id: <b2ab76c44d0cb298e6f801e4c0c63bbb8b0ae03e.1656072871.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1656072871.git.geert+renesas@glider.be>
References: <cover.1656072871.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for the Renesas R-Car Starter Kit Premier equipped with an
R-Car H3Ne-1.7G SiP.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/Makefile          |  1 +
 arch/arm64/boot/dts/renesas/r8a779mb-ulcb.dts | 53 +++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779mb-ulcb.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index b83a5fcad1f3a4ba..68f64649f9fc362d 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -78,6 +78,7 @@ dtb-$(CONFIG_ARCH_R8A77961) += r8a779m3-ulcb-kf.dtb
 dtb-$(CONFIG_ARCH_R8A77965) += r8a779m5-salvator-xs.dtb
 
 dtb-$(CONFIG_ARCH_R8A77951) += r8a779mb-salvator-xs.dtb
+dtb-$(CONFIG_ARCH_R8A77951) += r8a779mb-ulcb.dtb
 
 dtb-$(CONFIG_ARCH_R9A07G043) += r9a07g043u11-smarc.dtb
 
diff --git a/arch/arm64/boot/dts/renesas/r8a779mb-ulcb.dts b/arch/arm64/boot/dts/renesas/r8a779mb-ulcb.dts
new file mode 100644
index 0000000000000000..f17aa4b824abe6a6
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779mb-ulcb.dts
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: (GPL-2.0 or MIT)
+/*
+ * Device Tree Source for the H3ULCB (R-Car Starter Kit Premier) with R-Car
+ * H3Ne-1.7G
+ *
+ * Copyright (C) 2022 Glider bv
+ *
+ * Based on r8a77951-ulcb.dts
+ * Copyright (C) 2016 Cogent Embedded, Inc.
+ */
+
+/dts-v1/;
+#include "r8a779mb.dtsi"
+#include "ulcb.dtsi"
+
+/ {
+	model = "Renesas H3ULCB board based on r8a779mb";
+	compatible = "renesas,h3ulcb", "renesas,r8a779mb", "renesas,r8a7795";
+
+	memory@48000000 {
+		device_type = "memory";
+		/* first 128MB is reserved for secure area. */
+		reg = <0x0 0x48000000 0x0 0x38000000>;
+	};
+
+	memory@500000000 {
+		device_type = "memory";
+		reg = <0x5 0x00000000 0x0 0x40000000>;
+	};
+
+	memory@600000000 {
+		device_type = "memory";
+		reg = <0x6 0x00000000 0x0 0x40000000>;
+	};
+
+	memory@700000000 {
+		device_type = "memory";
+		reg = <0x7 0x00000000 0x0 0x40000000>;
+	};
+};
+
+&du {
+	clocks = <&cpg CPG_MOD 724>,
+		 <&cpg CPG_MOD 723>,
+		 <&cpg CPG_MOD 722>,
+		 <&cpg CPG_MOD 721>,
+		 <&versaclock5 1>,
+		 <&versaclock5 3>,
+		 <&versaclock5 4>,
+		 <&versaclock5 2>;
+	clock-names = "du.0", "du.1", "du.2", "du.3",
+		      "dclkin.0", "dclkin.1", "dclkin.2", "dclkin.3";
+};
-- 
2.25.1

