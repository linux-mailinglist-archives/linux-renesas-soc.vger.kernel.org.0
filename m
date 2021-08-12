Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC27A3EA39C
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Aug 2021 13:24:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236823AbhHLLZF (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Aug 2021 07:25:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236908AbhHLLY5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Aug 2021 07:24:57 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34BE2C06136B
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Aug 2021 04:24:27 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:438:1ff1:1071:f524])
        by xavier.telenet-ops.be with bizsmtp
        id gbQS2500G1gJxCh01bQS3m; Thu, 12 Aug 2021 13:24:26 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mE8oz-002FjL-Rk; Thu, 12 Aug 2021 13:24:25 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mE8oy-007453-4W; Thu, 12 Aug 2021 13:24:24 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v2 21/29] arm64: dts: renesas: Add support for Salvator-XS with R-Car M3Ne-2G
Date:   Thu, 12 Aug 2021 13:24:11 +0200
Message-Id: <efced5c7ff71b0a0ae359be12112e0d4dfb21a72.1628766192.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628766192.git.geert+renesas@glider.be>
References: <cover.1628766192.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for the Renesas Salvator-X 2nd version development board
equipped with an R-Car M3Ne-2G SiP.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
v2:
  - Add Reviewed-by.
---
 arch/arm64/boot/dts/renesas/Makefile          |  2 ++
 .../boot/dts/renesas/r8a779m5-salvator-xs.dts | 36 +++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m5-salvator-xs.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index 2f82cb497ba66a86..5c47615525fc9203 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -83,4 +83,6 @@ dtb-$(CONFIG_ARCH_R8A77965) += r8a779m4-salvator-xs.dtb
 dtb-$(CONFIG_ARCH_R8A77965) += r8a779m4-ulcb.dtb
 dtb-$(CONFIG_ARCH_R8A77965) += r8a779m4-ulcb-kf.dtb
 
+dtb-$(CONFIG_ARCH_R8A77965) += r8a779m5-salvator-xs.dtb
+
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-smarc.dtb
diff --git a/arch/arm64/boot/dts/renesas/r8a779m5-salvator-xs.dts b/arch/arm64/boot/dts/renesas/r8a779m5-salvator-xs.dts
new file mode 100644
index 0000000000000000..c0341a88d641c837
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779m5-salvator-xs.dts
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: (GPL-2.0 or MIT)
+/*
+ * Device Tree Source for the Salvator-X 2nd version board with R-Car M3Ne-2G
+ *
+ * Copyright (C) 2021 Glider bv
+ *
+ * Based on r8a77965-salvator-xs.dts
+ * Copyright (C) 2017 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+#include "r8a779m5.dtsi"
+#include "salvator-xs.dtsi"
+
+/ {
+	model = "Renesas Salvator-X 2nd version board based on r8a779m5";
+	compatible = "renesas,salvator-xs", "renesas,r8a779m5",
+		     "renesas,r8a77965";
+
+	memory@48000000 {
+		device_type = "memory";
+		/* first 128MB is reserved for secure area. */
+		reg = <0x0 0x48000000 0x0 0x78000000>;
+	};
+};
+
+&du {
+	clocks = <&cpg CPG_MOD 724>,
+		 <&cpg CPG_MOD 723>,
+		 <&cpg CPG_MOD 721>,
+		 <&versaclock6 1>,
+		 <&x21_clk>,
+		 <&versaclock6 2>;
+	clock-names = "du.0", "du.1", "du.3",
+		      "dclkin.0", "dclkin.1", "dclkin.3";
+};
-- 
2.25.1

