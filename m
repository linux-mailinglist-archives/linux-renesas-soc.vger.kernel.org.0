Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Original-To: lists+linux-renesas-soc@lfdr.de
Delivered-To: lists+linux-renesas-soc@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EF4A23EA37F
	for <lists+linux-renesas-soc@lfdr.de>; Thu, 12 Aug 2021 13:24:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236945AbhHLLY7 (ORCPT <rfc822;lists+linux-renesas-soc@lfdr.de>);
        Thu, 12 Aug 2021 07:24:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236810AbhHLLYx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Aug 2021 07:24:53 -0400
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E102C0617B0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Aug 2021 04:24:27 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:438:1ff1:1071:f524])
        by andre.telenet-ops.be with bizsmtp
        id gbQR250091gJxCh01bQRYq; Thu, 12 Aug 2021 13:24:25 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mE8oy-002FjE-Pp; Thu, 12 Aug 2021 13:24:24 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mE8oy-00744i-1Q; Thu, 12 Aug 2021 13:24:24 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v2 18/29] arm64: dts: renesas: Add support for Salvator-XS with R-Car M3Ne
Date:   Thu, 12 Aug 2021 13:24:08 +0200
Message-Id: <563a113a8180d7c4563cf5515a98879110886eb8.1628766192.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1628766192.git.geert+renesas@glider.be>
References: <cover.1628766192.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Add support for the Renesas Salvator-X 2nd version development board
equipped with an R-Car M3Ne SiP.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
v2:
  - Add Reviewed-by.
---
 arch/arm64/boot/dts/renesas/Makefile          |  2 ++
 .../boot/dts/renesas/r8a779m4-salvator-xs.dts | 36 +++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779m4-salvator-xs.dts

diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
index b55314feb8abdf98..2ab938d4b62c1317 100644
--- a/arch/arm64/boot/dts/renesas/Makefile
+++ b/arch/arm64/boot/dts/renesas/Makefile
@@ -79,4 +79,6 @@ dtb-$(CONFIG_ARCH_R8A77961) += r8a779m3-salvator-xs.dtb
 dtb-$(CONFIG_ARCH_R8A77961) += r8a779m3-ulcb.dtb
 dtb-$(CONFIG_ARCH_R8A77961) += r8a779m3-ulcb-kf.dtb
 
+dtb-$(CONFIG_ARCH_R8A77965) += r8a779m4-salvator-xs.dtb
+
 dtb-$(CONFIG_ARCH_R9A07G044) += r9a07g044l2-smarc.dtb
diff --git a/arch/arm64/boot/dts/renesas/r8a779m4-salvator-xs.dts b/arch/arm64/boot/dts/renesas/r8a779m4-salvator-xs.dts
new file mode 100644
index 0000000000000000..3a283b3ec116f9ca
--- /dev/null
+++ b/arch/arm64/boot/dts/renesas/r8a779m4-salvator-xs.dts
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: (GPL-2.0 or MIT)
+/*
+ * Device Tree Source for the Salvator-X 2nd version board with R-Car M3Ne
+ *
+ * Copyright (C) 2021 Glider bv
+ *
+ * Based on r8a77965-salvator-xs.dts
+ * Copyright (C) 2017 Renesas Electronics Corp.
+ */
+
+/dts-v1/;
+#include "r8a779m4.dtsi"
+#include "salvator-xs.dtsi"
+
+/ {
+	model = "Renesas Salvator-X 2nd version board based on r8a779m4";
+	compatible = "renesas,salvator-xs", "renesas,r8a779m4",
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

