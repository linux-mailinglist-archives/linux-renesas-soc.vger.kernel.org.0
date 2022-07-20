Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8D8957B24B
	for <lists+linux-renesas-soc@lfdr.de>; Wed, 20 Jul 2022 10:08:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237160AbiGTIIP (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Wed, 20 Jul 2022 04:08:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237440AbiGTIIO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Jul 2022 04:08:14 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA07A41D39
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Jul 2022 01:08:11 -0700 (PDT)
Received: from ramsan.of.borg ([84.195.186.194])
        by michel.telenet-ops.be with bizsmtp
        id xL892700S4C55Sk06L89sl; Wed, 20 Jul 2022 10:08:09 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oE4ka-004Ra5-Ow; Wed, 20 Jul 2022 10:08:08 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oE4ka-00EsNE-91; Wed, 20 Jul 2022 10:08:08 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 6/6] arm64: dts: renesas: Add support for H3ULCB+Kingfisher with R-Car H3Ne-1.7G
Date:   Wed, 20 Jul 2022 10:08:07 +0200
Message-Id: <bb72dd7077666fd5ad2f2b325b664654ae3bc2b9.1656072871.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1656072871.git.geert+renesas@glider.be>
References: <cover.1656072871.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for the Renesas R-Car Starter Kit Premier and Kingfisher
combo equipped with an R-Car H3Ne-1.7G SiP.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/arm64/boot/dts/renesas/Makefile          |  1 +
 .../boot/dts/renesas/r8a779mb-ulcb-kf.dts     | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779mb-ulcb-kf.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 68f64649f9fc362d..ec757f3d89bc2077 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -79,6 +79,7 @@ dtb-$(CONFIG_ARCH_R8A77965) += r8a779m5-salvator-xs.dtb
 
 dtb-$(CONFIG_ARCH_R8A77951) += r8a779mb-salvator-xs.dtb
 dtb-$(CONFIG_ARCH_R8A77951) += r8a779mb-ulcb.dtb
+dtb-$(CONFIG_ARCH_R8A77951) += r8a779mb-ulcb-kf.dtb
 
 dtb-$(CONFIG_ARCH_R9A07G043) += r9a07g043u11-smarc.dtb
 
diff --git a/arch/arm64/boot/dts/renesas/r8a779mb-ulcb-kf.dts b/arch/arm64/boot/dts/renesas/r8a779mb-ulcb-kf.dts
new file mode 100644
index 0000000000000000..2cc4e4a51845b9c7
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779mb-ulcb-kf.dts
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: (GPL-2.0 or MIT)
+/*
+ * Device Tree Source for the H3ULCB Kingfisher board with R-Car H3Ne-1.7G
+ *
+ * Copyright (C) 2022 Glider bv
+ *
+ * Based on r8a77951-ulcb-kf.dts
+ * Copyright (C) 2017 Renesas Electronics Corp.
+ * Copyright (C) 2017 Cogent Embedded, Inc.
+ */
+
+#include "r8a779mb-ulcb.dts"
+#include "ulcb-kf.dtsi"
+
+/ {
+	model = "Renesas H3ULCB Kingfisher board based on r8a779mb";
+	compatible = "shimafuji,kingfisher", "renesas,h3ulcb",
+		     "renesas,r8a779mb", "renesas,r8a7795";
+};
-- 
2.25.1

